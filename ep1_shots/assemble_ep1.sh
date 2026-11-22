#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Extraordinary Agents - Episode 1 Remaster Hybrid Assembler
# Usage: ./ep1_shots/assemble_ep1.sh [HK|EN|ALL] [INPUT_DIR]
#
# Path Resolution:
#   Uses SCRIPT_DIR / REPO_ROOT so it works from repo root or inside ep1_shots/.
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

TARGET_LANG="${1:-ALL}"
SEARCH_DIR="${2:-${SCRIPT_DIR}}"
FLOW_DIR="${SCRIPT_DIR}/flow"
OUT_DIR="${REPO_ROOT}/ep1_edited_clips"
ZOOM="1.38" # 138% Medium Close-Up Punch-In for H3 dialogue shots

mkdir -p "$OUT_DIR" "$FLOW_DIR"

# Shot Routing Table: "SHOT_NUM|T_SPLIT|FOCUS_ZONE|MAX_DUR|IS_NON_DIALOGUE"
# - 16-shot structure with Ep1_Shot_05 (horror eyes, Flow 4s), Ep1_Shot_06 (HQ red alert H3), Ep1_Shot_07 (reveal H3).
# - Trailing silence trimming (-42dB/d=0.60) with MAX_DUR=12.25 prevents clipping dialogue tails.
# - Flow shots (03, 05, 08, 09, 11, 13) + auto-detected Flow_Bridge_09_10.mp4.
SHOT_CONFIGS=(
  "01|4.4|RIGHT|12.25|0"    # Griz Golden Eagle holo-map (L) -> Punch-in Chloe Earl Grey tea & rabbit (Right)
  "02|4.4|RIGHT|12.25|0"    # Oliver pistol grapple warning (L/C) -> Punch-in Emily asking about Victoria (Right)
  "03|2.5|CENTER|5.0|1"     # [Flow Override: Flow_Shot_03.mp4] Maya rooftop jump, skylight shatter & heel drop
  "04|4.2|CENTER|12.25|0"   # Maya barefoot landing, foot pain, banana slip & knocked out cold (comms dead)
  "05|2.0|CENTER|4.0|1"     # [Flow Override: Flow_Shot_05.mp4] Horror cold glowing amber eyes creeping from crate shadow
  "06|4.5|CENTER|12.25|0"   # HQ red alert: Griz panic (L) -> Saffron matte-black pistol monster boast (C) + Chloe (R)
  "07|4.0|CENTER|12.25|0"   # Horror-to-comedy reveal: Maya jolts awake yelling monster -> Barnaby tickle laughter
  "08|2.0|CENTER|4.0|1"     # [Flow Override: Flow_Shot_08.mp4] Tactical flashlights expose Maya & Barnaby
  "09|2.5|CENTER|5.0|1"     # [Flow Override: Flow_Shot_09.mp4] Barnaby crate slam & shielding Maya -> Flow_Bridge_09_10
  "10|4.4|RIGHT|12.25|0"    # Chloe smoking launcher (L) -> Punch-in Maya barefoot 40% stealth excuse (Right)
  "11|3.0|CENTER|6.0|1"     # [Flow Override: Flow_Shot_11.mp4] Saffron catwalk hero pose -> dodge -> grapple ankle drop
  "12|4.5|LEFT|12.25|0"     # Saffron human-bowling pileup (R) -> Punch-in Chloe deadpan facepalm (Left)
  "13|3.0|CENTER|6.0|1"     # [Flow Override: Flow_Shot_13.mp4] Chloe Taekwondo stance -> rifle disarm & high kick finale
  "14|4.2|RIGHT|12.25|0"    # Classic Epilogue: Chloe wink report (L) -> Punch-in Barnaby banana poke & Maya laugh (Right)
  "15|4.5|RIGHT|12.25|0"    # Custody order naming Barnaby (L/C) -> Punch-in Chloe & Charity Gala invite (Right)
  "16|6.5|CENTER|12.25|0"   # Gideon Ward press interview -> subtle push-in as smile chills & eagle glints
)

find_h3_clip() {
  local shot_num="$1"
  local lang="$2"
  local fname="Ep1_Shot_${shot_num}_${lang}.mp4"
  for dir in "$SEARCH_DIR" "$SCRIPT_DIR" "${REPO_ROOT}/ep1_shots" "${REPO_ROOT}/outputs" "$REPO_ROOT" "."; do
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
  echo " Building Episode 1 (${lang}) - Remaster Hybrid Master"
  echo "======================================================================"

  for i in "${!SHOT_CONFIGS[@]}"; do
    IFS='|' read -r shot_num t_split focus max_dur is_non_dlg <<< "${SHOT_CONFIGS[$i]}"

    local h3_file=""
    h3_file=$(find_h3_clip "$shot_num" "$lang" || true)
    local flow_file=""
    flow_file=$(find_flow_override "$shot_num" "$lang" || true)

    local outfile="${OUT_DIR}/Ep1_Shot_${shot_num}_${lang}_edit.mp4"

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

    # CASE 2: Standard MiniMax H3 Clip (with 138% Punch-In)
    elif [[ -n "$h3_file" ]]; then
      local clip_dur
      clip_dur=$(get_smart_duration "$h3_file" "$max_dur" "$is_non_dlg")

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

      echo "[Shot ${shot_num} ${lang}] MiniMax H3: $(basename "$h3_file") | Punch-In @ ${t_split}s (${focus}) | Trim: ${clip_dur}s"
      ffmpeg -nostdin -y -hide_banner -loglevel error \
        -i "$h3_file" -t "$clip_dur" \
        -filter_complex "\
          [0:v]fps=24,scale=1344:768:flags=lanczos,setsar=1,split=2[wide][src_zoom];\
          [src_zoom]crop=w=iw/${ZOOM}:h=ih/${ZOOM}:x=${crop_x}:y=${crop_y},scale=1344:768:flags=lanczos,setsar=1[zoomed];\
          [wide][zoomed]overlay=0:0:enable='gte(t,${t_split})',fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.18[vout];\
          [0:a]apad,atrim=0:${clip_dur},asetpts=PTS-STARTPTS,afade=t=in:st=0:d=0.10,afade=t=out:st=${fade_start}:d=0.18[aout]" \
        -map "[vout]" -map "[aout]" \
        -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p -video_track_timescale 12288 \
        -c:a aac -b:a 192k -ar 48000 -ac 2 \
        "$outfile"

      manifest_rows+=("Shot ${shot_num} ${lang} (H3)|$(basename "$h3_file")|$(get_media_duration "$outfile")")
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

  local master_out="${REPO_ROOT}/Episode_1_Hybrid_Master_${lang}.mp4"
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
    echo " Episode 1 (${lang}) Segment Manifest (${#manifest_rows[@]} clips)"
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
