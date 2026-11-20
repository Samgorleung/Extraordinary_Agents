#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Extraordinary Agents - Episode 2 Director's Cut Hybrid Assembler
# Usage: ./ep2_shots/assemble_ep2.sh [HK|EN|ALL] [INPUT_DIR]
#
# Path Resolution:
#   Uses SCRIPT_DIR / REPO_ROOT so it works from repo root or inside ep2_shots/.
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

TARGET_LANG="${1:-ALL}"
SEARCH_DIR="${2:-${SCRIPT_DIR}}"
FLOW_DIR="${SCRIPT_DIR}/flow"
OUT_DIR="${REPO_ROOT}/ep2_edited_clips"
ZOOM="1.38" # 138% Medium Close-Up Punch-In for H3 two-speaker shots

mkdir -p "$OUT_DIR" "$FLOW_DIR"

# Shot Routing Table: "SHOT_NUM|T_SPLIT|FOCUS_ZONE|MAX_DUR|IS_NON_DIALOGUE"
# - Act II causal reorder: 08 (balcony intel) before 07 (Maya & Barnaby corridor).
# - All dialogue shots raised to MAX_DUR=12.25 so trailing words are never over-cut.
# - 13B retired in favor of Flow_Bridge_13_14.mp4; 19B added between 19 and 20.
SHOT_CONFIGS=(
  "01|4.3|CENTER|12.25|0"       # Griz (L) -> Punch-in Maya & Barnaby (Center)
  "02|4.2|RIGHT|12.25|0"        # Evelyn (L) -> Punch-in Isabella betting book (Right)
  "03|4.5|RIGHT|12.25|0"        # Oliver (L) -> Punch-in Saffron arguing (Right)
  "04|4.3|LEFT|12.25|0"         # Emily (R) -> Punch-in Oliver hiding screen (Left)
  "05|3.5|RIGHT|12.25|0"        # Wide Hub -> Punch-in Aoi typing at monitor (Right)
  "06|4.2|CENTER|12.25|0"       # Red carpet wide -> Punch-in Dorian & Saffron elbowing (Center)
  "08|4.2|LEFT|12.25|0"         # Balcony wide -> Punch-in Helena & Gideon toast (Left)
  "07|4.5|RIGHT|12.25|0"        # Maya & Barnaby barrel -> Punch-in bowing guards (Right)
  "09|4.2|CENTER|12.25|0"       # Mezzanine -> Punch-in Dorian & Saffron wedged in vent (Center)
  "10|4.3|CENTER|12.25|0"       # Chloe foreground -> Punch-in Maya & Barnaby banana handoff (Center)
  "11|2.2|CENTER|8.1|1"         # [Flow Override: Flow_Shot_11.mp4] Colossus + Naomi/Evelyn/Isabella
  "12|4.4|LOW_LEFT|12.25|0"     # Dorian pen dart -> Punch-in Naomi pink bag EMP (Bottom-Left)
  "13|2.4|CENTER|12.25|0"       # Chloe mid-air Taekwondo kick full dialogue -> Flow_Bridge_13_14
  # "13B|2.2|CENTER|5.5|1"      # [Retired] Superseded by Flow Omni 1.2 Flow_Bridge_13_14.mp4
  "14|4.2|CENTER_LEFT|12.25|0"  # Maya banana sight & ape pulling wire -> Saffron (Center-Left)
  "15|2.5|CENTER|2.0|1"         # [Flow Override: Flow_Shot_15.mp4] 2.0s moonlit slow-mo hero pause
  "16|2.2|CENTER|12.25|0"       # Victoria cybernetic arm vs axe (HK uses clean EN video + HK audio)
  "17|4.5|CENTER|12.25|0"       # Griz repair bill (L) -> Punch-in Oliver & pistol (Center)
  "18|4.3|RIGHT|12.25|0"        # Maya & Barnaby celebration -> Punch-in Dorian in awe (Right)
  "19|4.2|LEFT|12.25|0"         # Elise pointing at screen (C) -> Punch-in Aoi clenching fists (Left)
  "19B|2.5|CENTER|5.0|1"        # [Flow Shared: Flow_Shot_19B.mp4] Emily moonlit HQ reflection
  "20|3.8|CENTER|12.25|0"       # [Flow Override: Flow_Shot_20.mp4] Gideon Ward slow-mo match to 12.25s dialogue
)

find_h3_clip() {
  local shot_num="$1"
  local lang="$2"
  local fname="Ep2_Shot_${shot_num}_${lang}.mp4"
  for dir in "$SEARCH_DIR" "$SCRIPT_DIR" "${REPO_ROOT}/ep2_shots" "${REPO_ROOT}/outputs" "$REPO_ROOT" "."; do
    if [[ -f "${dir}/${fname}" ]]; then
      echo "${dir}/${fname}"
      return 0
    fi
  done
  return 1
}

find_flow_override() {
  local shot_num="$1"
  local lang="$2"
  for candidate in \
    "${FLOW_DIR}/Flow_Shot_${shot_num}_${lang}.mp4" \
    "${FLOW_DIR}/Flow_Shot_${shot_num}.mp4"; do
    if [[ -f "$candidate" ]]; then
      echo "$candidate"
      return 0
    fi
  done
  return 1
}

get_media_duration() {
  ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1"
}

has_audio_stream() {
  local count
  count=$(ffprobe -v error -select_streams a -show_entries stream=index -of csv=p=0 "$1" | wc -l)
  [[ "$count" -gt 0 ]]
}

get_smart_duration() {
  local infile="$1"
  local max_dur="$2"
  local is_non_dialogue="$3"

  if [[ "$is_non_dialogue" == "1" ]]; then
    echo "$max_dur"
    return 0
  fi

  local total_dur
  total_dur=$(get_media_duration "$infile")

  ffmpeg -nostdin -hide_banner -i "$infile" -af "silencedetect=noise=-42dB:d=0.60" -f null - 2>&1 | \
    awk -v tot="$total_dur" -v m="$max_dur" '
      /silence_start:/ {
        for (i=1; i<=NF; i++) if ($i == "silence_start:") s = $(i+1)+0;
        in_sil = 1;
      }
      /silence_end:/ {
        for (i=1; i<=NF; i++) if ($i == "silence_end:") e = $(i+1)+0;
        in_sil = 0;
      }
      END {
        limit = (tot < m) ? tot : m;
        if (s > 0 && (in_sil == 1 || (tot - e) <= 0.25)) {
          cand = s + 0.75;
          if (cand < limit) printf "%.2f", cand;
          else printf "%.2f", limit;
        } else {
          printf "%.2f", limit;
        }
      }
    '
}

process_flow_bridge() {
  local bridge_in="$1"
  local bridge_out="$2"
  local b_dur
  b_dur=$(get_media_duration "$bridge_in")
  local fade_start
  fade_start=$(awk -v d="$b_dur" 'BEGIN {printf "%.2f", (d > 0.3) ? d - 0.15 : 0}')

  if has_audio_stream "$bridge_in"; then
    ffmpeg -nostdin -y -hide_banner -loglevel error \
      -i "$bridge_in" -t "$b_dur" \
      -vf "fps=24,scale=1344:768:flags=lanczos,setsar=1,fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.15" \
      -af "apad,atrim=0:${b_dur},asetpts=PTS-STARTPTS,afade=t=in:st=0:d=0.12,afade=t=out:st=${fade_start}:d=0.15" \
      -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p -video_track_timescale 12288 \
      -c:a aac -b:a 192k -ar 48000 -ac 2 \
      "$bridge_out"
  else
    # Attach silent 48kHz stereo track so concat never desyncs
    ffmpeg -nostdin -y -hide_banner -loglevel error \
      -i "$bridge_in" -f lavfi -i "anullsrc=channel_layout=stereo:sample_rate=48000" \
      -t "$b_dur" \
      -vf "fps=24,scale=1344:768:flags=lanczos,setsar=1,fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.15" \
      -map 0:v:0 -map 1:a:0 \
      -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p -video_track_timescale 12288 \
      -c:a aac -b:a 192k -ar 48000 -ac 2 \
      "$bridge_out"
  fi
}

process_language() {
  local lang="$1"
  local concat_list="${OUT_DIR}/concat_${lang}.txt"
  > "$concat_list"
  local -a manifest_rows=()

  echo "======================================================================"
  echo " Building Episode 2 (${lang}) - Director's Cut Hybrid Master"
  echo "======================================================================"

  for i in "${!SHOT_CONFIGS[@]}"; do
    IFS='|' read -r shot_num t_split focus max_dur is_non_dlg <<< "${SHOT_CONFIGS[$i]}"

    local h3_file=""
    h3_file=$(find_h3_clip "$shot_num" "$lang" || true)
    local flow_file=""
    flow_file=$(find_flow_override "$shot_num" "$lang" || true)

    local outfile="${OUT_DIR}/Ep2_Shot_${shot_num}_${lang}_edit.mp4"

    # CASE 1: Google Flow Override / Shared Flow Clip
    if [[ -n "$flow_file" ]]; then
      local f_dur
      f_dur=$(get_media_duration "$flow_file")

      if [[ -n "$h3_file" ]] && has_audio_stream "$h3_file"; then
        local target_dur="$f_dur"
        local pts_filter=""
        if [[ "$is_non_dlg" == "0" ]]; then
          local audio_dur
          audio_dur=$(get_smart_duration "$h3_file" "$max_dur" "$is_non_dlg")
          local needs_stretch
          needs_stretch=$(awk -v a="$audio_dur" -v f="$f_dur" 'BEGIN {print (a > f + 0.05) ? 1 : 0}')
          if [[ "$needs_stretch" == "1" ]]; then
            target_dur="$audio_dur"
            local pts_factor
            pts_factor=$(awk -v t="$target_dur" -v f="$f_dur" 'BEGIN {printf "%.6f", t / f}')
            pts_filter="setpts=${pts_factor}*PTS,"
          fi
        fi

        local fade_start
        fade_start=$(awk -v d="$target_dur" 'BEGIN {printf "%.2f", (d > 0.35) ? d - 0.18 : 0}')
        echo "[Shot ${shot_num} ${lang}] ★ GOOGLE FLOW OVERRIDE: $(basename "$flow_file") (${f_dur}s -> ${target_dur}s) + $(basename "$h3_file") audio"
        ffmpeg -nostdin -y -hide_banner -loglevel error \
          -i "$flow_file" -i "$h3_file" -t "$target_dur" \
          -filter_complex "\
            [0:v]${pts_filter}fps=24,scale=1344:768:flags=lanczos,setsar=1,fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.18[vout];\
            [1:a]apad,atrim=0:${target_dur},asetpts=PTS-STARTPTS,afade=t=in:st=0:d=0.10,afade=t=out:st=${fade_start}:d=0.18[aout]" \
          -map "[vout]" -map "[aout]" \
          -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p -video_track_timescale 12288 \
          -c:a aac -b:a 192k -ar 48000 -ac 2 \
          "$outfile"
        manifest_rows+=("Shot ${shot_num} ${lang} (Flow+H3 Audio)|$(basename "$flow_file")|$(get_media_duration "$outfile")")
      else
        echo "[Shot ${shot_num} ${lang}] ★ GOOGLE FLOW SHARED CLIP: $(basename "$flow_file") (${f_dur}s)"
        process_flow_bridge "$flow_file" "$outfile"
        manifest_rows+=("Shot ${shot_num} ${lang} (Flow Shared)|$(basename "$flow_file")|$(get_media_duration "$outfile")")
      fi
      echo "file '$(realpath "$outfile")'" >> "$concat_list"

    # CASE 2: Standard MiniMax H3 Clip (with clean-video override for Shot 16 HK)
    elif [[ -n "$h3_file" ]]; then
      local video_src="$h3_file"
      local audio_src="$h3_file"
      local note_label="Shot ${shot_num} ${lang} (H3)"

      if [[ "$shot_num" == "16" && "$lang" == "HK" ]]; then
        local clean_en=""
        clean_en=$(find_h3_clip "16" "EN" || true)
        if [[ -n "$clean_en" ]]; then
          video_src="$clean_en"
          note_label="Shot 16 HK (EN Video + HK Audio)"
        fi
      fi

      local clip_dur
      clip_dur=$(get_smart_duration "$audio_src" "$max_dur" "$is_non_dlg")

      local crop_x="(iw-ow)/2"
      local crop_y="ih*0.06"
      case "$focus" in
        LEFT)        crop_x="iw*0.02";          crop_y="ih*0.06" ;;
        CENTER_LEFT) crop_x="iw*0.12";          crop_y="ih*0.06" ;;
        CENTER)      crop_x="(iw-ow)/2";        crop_y="ih*0.06" ;;
        RIGHT)       crop_x="iw-ow-(iw*0.02)";  crop_y="ih*0.06" ;;
        LOW_LEFT)    crop_x="iw*0.02";          crop_y="ih*0.18" ;;
      esac

      local fade_start
      fade_start=$(awk -v d="$clip_dur" 'BEGIN {printf "%.2f", d - 0.18}')

      if [[ "$video_src" == "$audio_src" ]]; then
        echo "[Shot ${shot_num} ${lang}] MiniMax H3: $(basename "$h3_file") | Punch-In @ ${t_split}s (${focus}) | Trim: ${clip_dur}s"
        ffmpeg -nostdin -y -hide_banner -loglevel error \
          -i "$video_src" -t "$clip_dur" \
          -filter_complex "\
            [0:v]fps=24,scale=1344:768:flags=lanczos,setsar=1,split=2[wide][src_zoom];\
            [src_zoom]crop=w=iw/${ZOOM}:h=ih/${ZOOM}:x=${crop_x}:y=${crop_y},scale=1344:768:flags=lanczos,setsar=1[zoomed];\
            [wide][zoomed]overlay=0:0:enable='gte(t,${t_split})',fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.18[vout];\
            [0:a]apad,atrim=0:${clip_dur},asetpts=PTS-STARTPTS,afade=t=in:st=0:d=0.10,afade=t=out:st=${fade_start}:d=0.18[aout]" \
          -map "[vout]" -map "[aout]" \
          -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p -video_track_timescale 12288 \
          -c:a aac -b:a 192k -ar 48000 -ac 2 \
          "$outfile"
      else
        echo "[Shot ${shot_num} ${lang}] ★ CLEAN VIDEO SWAP: video=$(basename "$video_src") + audio=$(basename "$audio_src") | Punch-In @ ${t_split}s (${focus}) | Trim: ${clip_dur}s"
        ffmpeg -nostdin -y -hide_banner -loglevel error \
          -i "$video_src" -i "$audio_src" -t "$clip_dur" \
          -filter_complex "\
            [0:v]fps=24,scale=1344:768:flags=lanczos,setsar=1,split=2[wide][src_zoom];\
            [src_zoom]crop=w=iw/${ZOOM}:h=ih/${ZOOM}:x=${crop_x}:y=${crop_y},scale=1344:768:flags=lanczos,setsar=1[zoomed];\
            [wide][zoomed]overlay=0:0:enable='gte(t,${t_split})',fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.18[vout];\
            [1:a]apad,atrim=0:${clip_dur},asetpts=PTS-STARTPTS,afade=t=in:st=0:d=0.10,afade=t=out:st=${fade_start}:d=0.18[aout]" \
          -map "[vout]" -map "[aout]" \
          -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p -video_track_timescale 12288 \
          -c:a aac -b:a 192k -ar 48000 -ac 2 \
          "$outfile"
      fi

      manifest_rows+=("${note_label}|$(basename "$video_src")|$(get_media_duration "$outfile")")
      echo "file '$(realpath "$outfile")'" >> "$concat_list"
    else
      echo "[WARN] Missing both Flow and H3 clip for Shot ${shot_num} (${lang}) - skipping."
    fi

    # CASE 3: Check if a Google Flow Start-to-End Bridge exists after this shot
    local next_idx=$((i + 1))
    if [[ "$next_idx" -lt "${#SHOT_CONFIGS[@]}" ]]; then
      IFS='|' read -r next_shot _ _ _ _ <<< "${SHOT_CONFIGS[$next_idx]}"
      local bridge_candidate="${FLOW_DIR}/Flow_Bridge_${shot_num}_${next_shot}.mp4"
      if [[ -f "$bridge_candidate" ]]; then
        local bridge_out="${OUT_DIR}/Flow_Bridge_${shot_num}_${next_shot}_${lang}_edit.mp4"
        echo "  └──> [FLOW BRIDGE] Inserting Start-to-End Transition: $(basename "$bridge_candidate")"
        process_flow_bridge "$bridge_candidate" "$bridge_out"
        manifest_rows+=("Flow Bridge ${shot_num}->${next_shot}|$(basename "$bridge_candidate")|$(get_media_duration "$bridge_out")")
        echo "file '$(realpath "$bridge_out")'" >> "$concat_list"
      fi
    fi
  done

  local master_out="${REPO_ROOT}/Episode_2_Hybrid_Master_${lang}.mp4"
  if [[ -s "$concat_list" ]]; then
    echo "--> Concatenating ${#manifest_rows[@]} segments into ${master_out} ..."
    ffmpeg -nostdin -y -hide_banner -loglevel error \
      -f concat -safe 0 -i "$concat_list" \
      -c copy "$master_out"
    local total_dur
    total_dur=$(get_media_duration "$master_out")
    local master_size
    master_size=$(ls -lh "$master_out" | awk '{print $5}')
    echo ""
    echo "----------------------------------------------------------------------"
    echo " Episode 2 (${lang}) Segment Manifest (${#manifest_rows[@]} clips)"
    echo "----------------------------------------------------------------------"
    local idx=1
    for row in "${manifest_rows[@]}"; do
      IFS='|' read -r r_label r_src r_dur <<< "$row"
      printf " %2d. %-36s | %-25s | %6.2fs\n" "$idx" "$r_label" "$r_src" "$r_dur"
      idx=$((idx + 1))
    done
    echo "----------------------------------------------------------------------"
    printf " [SUCCESS] %s | Size: %s | Total Duration: %.3fs\n" "$(basename "$master_out")" "$master_size" "$total_dur"
    echo "----------------------------------------------------------------------"
    echo ""
  fi
}

if [[ "$TARGET_LANG" == "ALL" ]]; then
  process_language "HK"
  process_language "EN"
else
  process_language "$TARGET_LANG"
fi
