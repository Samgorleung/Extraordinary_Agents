#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# Extraordinary Agents - Episode 2 Hybrid (MiniMax H3 + Google Flow) Assembler
# Usage: ./assemble_ep2.sh [HK|EN|ALL] [INPUT_DIR]
#
# Folder Conventions:
#   - H3 Raw Clips:      ./Ep2_Shot_01_HK.mp4 (or inside ep2_shots/ or outputs/)
#   - Flow Overrides:    ep2_shots/flow/Flow_Shot_11.mp4 (Replaces H3 video, keeps H3 audio)
#   - Flow Bridges:      ep2_shots/flow/Flow_Bridge_09_10.mp4 (Inserted between Shot 09 & 10)
# ==============================================================================

TARGET_LANG="${1:-ALL}"
SEARCH_DIR="${2:-.}"
FLOW_DIR="ep2_shots/flow"
OUT_DIR="ep2_edited_clips"
ZOOM="1.38" # 138% Medium Close-Up Punch-In for H3 two-speaker shots

mkdir -p "$OUT_DIR" "$FLOW_DIR"

# Shot Routing Table: "SHOT_NUM|T_SPLIT|FOCUS_ZONE|MAX_DUR|IS_NON_DIALOGUE"
SHOT_CONFIGS=(
  "01|4.3|CENTER|9.5|0"       # Griz (L) -> Punch-in Maya & Barnaby (Center)
  "02|4.2|RIGHT|9.5|0"        # Evelyn (L) -> Punch-in Isabella betting book (Right)
  "03|4.5|RIGHT|9.5|0"        # Oliver (L) -> Punch-in Saffron arguing (Right)
  "04|4.3|LEFT|9.2|0"         # Emily (R) -> Punch-in Oliver hiding screen (Left)
  "05|3.5|RIGHT|8.0|0"        # Wide Hub -> Punch-in Aoi typing at monitor (Right)
  "06|4.2|CENTER|9.2|0"       # Red carpet wide -> Punch-in Dorian & Saffron elbowing (Center)
  "07|4.5|RIGHT|9.2|0"        # Maya & Barnaby barrel -> Punch-in bowing guards (Right)
  "08|4.2|LEFT|9.2|0"         # Balcony wide -> Punch-in Helena & Gideon toast (Left)
  "09|4.2|CENTER|9.2|0"       # Mezzanine -> Punch-in Dorian & Saffron wedged in vent (Center)
  "10|4.3|CENTER|9.5|0"       # Chloe foreground -> Punch-in Maya & Barnaby banana handoff (Center)
  "11|2.2|CENTER|5.5|1"       # [Flow Override Priority] Colossus bursts through vault door
  "12|4.4|LOW_LEFT|9.5|0"     # Dorian pen dart -> Punch-in Naomi pink bag EMP (Bottom-Left)
  "13|2.4|CENTER|6.5|0"       # Chloe mid-air Taekwondo high kick impact (Center)
  "13B|2.2|CENTER|5.5|1"      # Chloe 3-hit Taekwondo combo driving Colossus under chandelier
  "14|4.2|CENTER_LEFT|9.2|0"  # Maya banana sight & Barnaby pulling wire -> Saffron (Center-Left)
  "15|2.5|CENTER|6.0|1"       # [Flow Override Priority] Victoria (Raven) moonlit wing descent
  "16|2.2|CENTER|6.8|0"       # Victoria cybernetic arm clashing with battleaxe (Center)
  "17|4.5|CENTER|9.5|0"       # Griz repair bill (L) -> Punch-in Oliver & pistol (Center)
  "18|4.3|RIGHT|9.5|0"        # Maya & Barnaby high-five (L) -> Punch-in Dorian in awe (Right)
  "19|4.2|LEFT|9.0|0"         # Elise pointing at screen (C) -> Punch-in Aoi clenching fists (Left)
  "20|3.8|CENTER|8.5|0"       # [Flow Override Optional] Gideon Ward behind desk
)

find_h3_clip() {
  local shot_num="$1"
  local lang="$2"
  local fname="Ep2_Shot_${shot_num}_${lang}.mp4"
  for dir in "$SEARCH_DIR" "ep2_shots" "outputs" "."; do
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

  local last_silence
  last_silence=$(ffmpeg -hide_banner -i "$infile" -af "silencedetect=noise=-36dB:d=0.55" -f null - 2>&1 | \
    awk '/silence_start:/ {print $5}' | tail -n 1 || true)

  if [[ -n "$last_silence" ]]; then
    awk -v s="$last_silence" -v m="$max_dur" 'BEGIN {
      if (s > 5.2 && (s + 0.45) < m) printf "%.2f", s + 0.45;
      else printf "%.2f", m;
    }'
  else
    echo "$max_dur"
  fi
}

process_flow_bridge() {
  local bridge_in="$1"
  local bridge_out="$2"
  local b_dur
  b_dur=$(get_media_duration "$bridge_in")
  local fade_start
  fade_start=$(awk -v d="$b_dur" 'BEGIN {printf "%.2f", (d > 0.3) ? d - 0.15 : 0}')

  if has_audio_stream "$bridge_in"; then
    ffmpeg -y -hide_banner -loglevel error \
      -i "$bridge_in" \
      -vf "fps=24,scale=1344:768:flags=lanczos,fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.15" \
      -af "afade=t=in:st=0:d=0.12,afade=t=out:st=${fade_start}:d=0.15" \
      -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p \
      -c:a aac -b:a 192k -ar 48000 -ac 2 \
      "$bridge_out"
  else
    # Attach silent 48kHz stereo track so concat never desyncs
    ffmpeg -y -hide_banner -loglevel error \
      -i "$bridge_in" -f lavfi -i "anullsrc=channel_layout=stereo:sample_rate=48000" \
      -t "$b_dur" \
      -vf "fps=24,scale=1344:768:flags=lanczos,fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.15" \
      -map 0:v:0 -map 1:a:0 \
      -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p \
      -c:a aac -b:a 192k -ar 48000 -ac 2 \
      "$bridge_out"
  fi
}

process_language() {
  local lang="$1"
  local concat_list="${OUT_DIR}/concat_${lang}.txt"
  > "$concat_list"

  echo "======================================================================"
  echo " Building Episode 2 (${lang}) - Hybrid H3 Punch-In + Google Flow Merge"
  echo "======================================================================"

  for i in "${!SHOT_CONFIGS[@]}"; do
    IFS='|' read -r shot_num t_split focus max_dur is_non_dlg <<< "${SHOT_CONFIGS[$i]}"

    local h3_file=""
    h3_file=$(find_h3_clip "$shot_num" "$lang" || true)
    local flow_file=""
    flow_file=$(find_flow_override "$shot_num" "$lang" || true)

    local outfile="${OUT_DIR}/Ep2_Shot_${shot_num}_${lang}_edit.mp4"

    # CASE 1: Google Flow Override Exists -> Use Flow Video + Mux H3 Audio (if available)
    if [[ -n "$flow_file" ]]; then
      local f_dur
      f_dur=$(get_media_duration "$flow_file")
      local fade_start
      fade_start=$(awk -v d="$f_dur" 'BEGIN {printf "%.2f", (d > 0.35) ? d - 0.18 : 0}')

      echo "[Shot ${shot_num} ${lang}] ★ GOOGLE FLOW OVERRIDE: ${flow_file} (${f_dur}s)"

      if [[ -n "$h3_file" ]] && has_audio_stream "$h3_file"; then
        # Combine Flow's superior camera/lighting video with H3's localized voice/SFX audio
        ffmpeg -y -hide_banner -loglevel error \
          -i "$flow_file" -i "$h3_file" -t "$f_dur" \
          -filter_complex "\
            [0:v]fps=24,scale=1344:768:flags=lanczos,fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.18[vout];\
            [1:a]afade=t=in:st=0:d=0.10,afade=t=out:st=${fade_start}:d=0.18[aout]" \
          -map "[vout]" -map "[aout]" \
          -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p \
          -c:a aac -b:a 192k -ar 48000 -ac 2 \
          "$outfile"
      else
        process_flow_bridge "$flow_file" "$outfile"
      fi
      echo "file '$(realpath "$outfile")'" >> "$concat_list"

    # CASE 2: Standard MiniMax H3 Clip -> Apply 138% Punch-In & Auto Silence Trim
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

      echo "[Shot ${shot_num} ${lang}] MiniMax H3: ${h3_file} | Punch-In @ ${t_split}s (${focus}) | Trim: ${clip_dur}s"

      local fade_start
      fade_start=$(awk -v d="$clip_dur" 'BEGIN {printf "%.2f", d - 0.18}')

      ffmpeg -y -hide_banner -loglevel error \
        -i "$h3_file" -t "$clip_dur" \
        -filter_complex "\
          [0:v]fps=24,scale=1344:768:flags=lanczos,split=2[wide][src_zoom];\
          [src_zoom]crop=w=iw/${ZOOM}:h=ih/${ZOOM}:x=${crop_x}:y=${crop_y},scale=1344:768:flags=lanczos[zoomed];\
          [wide][zoomed]overlay=0:0:enable='gte(t,${t_split})',fade=t=in:st=0:d=0.12,fade=t=out:st=${fade_start}:d=0.18[vout];\
          [0:a]afade=t=in:st=0:d=0.10,afade=t=out:st=${fade_start}:d=0.18[aout]" \
        -map "[vout]" -map "[aout]" \
        -c:v libx264 -preset fast -crf 18 -pix_fmt yuv420p \
        -c:a aac -b:a 192k -ar 48000 -ac 2 \
        "$outfile"

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
        echo "  └──> [FLOW BRIDGE] Inserting Start-to-End Transition: ${bridge_candidate}"
        process_flow_bridge "$bridge_candidate" "$bridge_out"
        echo "file '$(realpath "$bridge_out")'" >> "$concat_list"
      fi
    fi
  done

  local master_out="Episode_2_Hybrid_Master_${lang}.mp4"
  if [[ -s "$concat_list" ]]; then
    echo "--> Concatenating all shots & Flow bridges into ${master_out} ..."
    ffmpeg -y -hide_banner -loglevel error \
      -f concat -safe 0 -i "$concat_list" \
      -c copy "$master_out"
    echo "[SUCCESS] Created Hybrid Master: ${master_out}"
  fi
}

if [[ "$TARGET_LANG" == "ALL" ]]; then
  process_language "HK"
  process_language "EN"
else
  process_language "$TARGET_LANG"
fi