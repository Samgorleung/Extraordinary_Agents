#!/usr/bin/env bash
set -Eeuo pipefail

# ==============================================================================
# Extraordinary Agents - Episode 1 Safe Resumable MiniMax H3 Batch Runne
# Usage (WSL only):
#   ./Extraordinary_Agents/ep1_shots/run_ep1_h3_batch.sh [hk|en|all]
# ==============================================================================

if [[ "$(uname -s)" != "Linux" ]]; then
  echo "[FATAL] This script must run inside Ubuntu WSL (Linux), not $(uname -s)." >&2
  exit 2
fi

export PATH="$HOME/.local/bin:$PATH"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_ROOT="$(cd -- "${SCRIPT_DIR}/.." && pwd -P)"
SKILL_ROOT="$(cd -- "${REPO_ROOT}/.." && pwd -P)"

cd "$SKILL_ROOT"

usage() {
  cat <<'EOF'
Usage: ./Extraordinary_Agents/ep1_shots/run_ep1_h3_batch.sh [hk|en|all]
  hk   Render missing Ep1 HK dialogue clips (10 shots) + assemble HK maste
  en   Render missing Ep1 EN dialogue clips (10 shots) + assemble EN maste
  all  Render missing Ep1 HK + EN dialogue clips (20 shots) + assemble ALL
EOF
}

if (($# != 1)); then
  usage >&2
  exit 2
fi

MODE_ARG="${1,,}"
case "$MODE_ARG" in
  hk)  LANGS=("HK") ;;
  en)  LANGS=("EN") ;;
  all) LANGS=("HK" "EN") ;;
  *)
    echo "[FATAL] Invalid argument: $1" >&2
    usage >&2
    exit 2
    ;;
esac

[[ -x "./run_colab_inference.sh" ]] || { echo "[FATAL] Missing executable ./run_colab_inference.sh in $SKILL_ROOT" >&2; exit 2; }
command -v colab >/dev/null 2>&1 || { echo "[FATAL] colab CLI not found on PATH." >&2; exit 127; }
command -v ffprobe >/dev/null 2>&1 || { echo "[FATAL] ffprobe not found on PATH." >&2; exit 127; }

stop_colab_sessions() {
  echo "[CLEANUP] Stopping any active Colab sessions..."
  colab stop >/dev/null 2>&1 || true
  local sess_file="$HOME/.config/colab-cli/sessions.json"
  if [[ -f "$sess_file" ]]; then
    while IFS= read -r sname; do
      [[ -n "$sname" ]] && colab stop --session "$sname" >/dev/null 2>&1 || true
    done < <(python3 -c '
import json, pathlib
p = pathlib.Path.home() / ".config/colab-cli/sessions.json"
try:
    data = json.loads(p.read_text(encoding="utf-8"))
except Exception:
    raise SystemExit(0)
names = []
def walk(x):
    if isinstance(x, dict):
        for k in ("session", "name", "session_name", "id"):
            v = x.get(k)
            if isinstance(v, str) and v.strip():
                names.append(v.strip())
        for v in x.values():
            walk(v)
    elif isinstance(x, list):
        for item in x:
            walk(item)
walk(data)
for n in dict.fromkeys(names):
    print(n)
' 2>/dev/null || true)
  fi
}

on_signal() {
  local sig="$1"
  echo "" >&2
  echo "[SIGNAL] Caught ${sig} — stopping Colab sessions before exiting..." >&2
  stop_colab_sessions
  exit 130
}

trap 'on_signal INT' INT
trap 'on_signal TERM' TERM

SHOTS=(01 02 04 06 07 10 12 14 15 16)

echo "======================================================================"
echo " Episode 1 MiniMax H3 Resumable Batch | Mode: ${MODE_ARG^^} | $(date -u '+%Y-%m-%d %H:%M:%SZ')"
echo " SKILL_ROOT: $SKILL_ROOT"
echo " Red Lines Locked: COLAB_EXEC_TIMEOUT=1200 COLAB_HIGH_MEM=1 GPU=A100"
echo "======================================================================"

for lang in "${LANGS[@]}"; do
  prompt_suffix=""
  if [[ "$lang" == "HK" ]]; then
    prompt_suffix="_hk"
  fi

  for s in "${SHOTS[@]}"; do
    img_path="Extraordinary_Agents/ep1_shots/${s}.png"
    prompt_path="Extraordinary_Agents/ep1_shots/prompt_${s}${prompt_suffix}.txt"
    out_mp4="Extraordinary_Agents/ep1_shots/Ep1_Shot_${s}_${lang}.mp4"

    [[ -f "$img_path" && -s "$img_path" ]] || { echo "[FATAL] Missing or empty image: $img_path" >&2; stop_colab_sessions; exit 1; }
    [[ -f "$prompt_path" && -s "$prompt_path" ]] || { echo "[FATAL] Missing or empty prompt: $prompt_path" >&2; stop_colab_sessions; exit 1; }

    if [[ -f "$out_mp4" && -s "$out_mp4" ]]; then
      echo "[SKIP] ${out_mp4} already exists ($(stat -c%s "$out_mp4") bytes)"
      continue
    fi

    echo ""
    echo "[START] Shot ${s} (${lang}) -> ${out_mp4} | $(date -u '+%H:%M:%SZ')"
    shot_ok=0
    for attempt in 1 2; do
      tmp_log="$(mktemp /tmp/ep1_h3_${s}_${lang}.XXXXXX.log)"
      set +e
      COLAB_EXEC_TIMEOUT=1200 COLAB_HIGH_MEM=1 stdbuf -oL -eL ./run_colab_inference.sh \
        --image "$img_path" \
        --prompt "$prompt_path" \
        --mode first_frame \
        --output "$out_mp4" 2>&1 | tee "$tmp_log"
      rc=${PIPESTATUS[0]}
      set -e

      if [[ "$rc" -eq 0 && -f "$out_mp4" && -s "$out_mp4" ]]; then
        rm -f "$tmp_log"
        echo "[DONE] ${out_mp4} ($(stat -c%s "$out_mp4") bytes) | $(date -u '+%H:%M:%SZ')"
        shot_ok=1
        break
      fi

      echo "[ERROR] Shot ${s} (${lang}) attempt ${attempt} failed (exit=${rc}). Halting active Colab session immediately..." >&2
      stop_colab_sessions

      if [[ "$attempt" -eq 1 && "${SKIP_503_RETRY_FOR:-}" != "$s" ]] && grep -Eqi 'Service Unavailable|HTTP[^0-9]*503|503 Service Unavailable|status[ :=]+503|\b503\b' "$tmp_log"; then
        echo "[RETRY] Detected HTTP 503 / Service Unavailable on Shot ${s} (${lang}). Waiting 15s for single allowed retry (attempt 2/2)..." >&2
        rm -f "$tmp_log"
        sleep 15
        continue
      fi

      rm -f "$tmp_log"
      echo "[FATAL] Halting batch on Shot ${s} (${lang}) — NOT running assemble_ep1.sh." >&2
      exit 1
    done

    if [[ "$shot_ok" -ne 1 ]]; then
      stop_colab_sessions
      echo "[FATAL] Shot ${s} (${lang}) did not complete — NOT running assemble_ep1.sh." >&2
      exit 1
    fi
  done
done

echo ""
echo "[ASSEMBLY] All requested H3 shots complete! Ensuring Colab sessions are stopped before assembly..."
stop_colab_sessions

if ((${#LANGS[@]} == 2)); then
  ./Extraordinary_Agents/ep1_shots/assemble_ep1.sh ALL
else
  ./Extraordinary_Agents/ep1_shots/assemble_ep1.sh "${LANGS[0]}"
fi

echo ""
echo "======================================================================"
echo " Episode 1 H3 Output Verification (${MODE_ARG^^})"
echo "======================================================================"
for lang in "${LANGS[@]}"; do
  for s in "${SHOTS[@]}"; do
    f="Extraordinary_Agents/ep1_shots/Ep1_Shot_${s}_${lang}.mp4"
    dur="$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$f" 2>/dev/null || echo 'N/A')"
    res="$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$f" 2>/dev/null || echo 'N/A')"
    sz="$(ls -lh "$f" | awk '{print $5}')"
    printf "  %-48s | %6s | %7ss | %s\n" "$f" "$sz" "$dur" "$res"
  done
  m="Extraordinary_Agents/Episode_1_Hybrid_Master_${lang}.mp4"
  if [[ -f "$m" ]]; then
    dur="$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$m" 2>/dev/null || echo 'N/A')"
    res="$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$m" 2>/dev/null || echo 'N/A')"
    sz="$(ls -lh "$m" | awk '{print $5}')"
    printf "  %-48s | %6s | %7ss | %s\n" "$m" "$sz" "$dur" "$res"
  fi
done

echo ""
echo "======================================================================"
echo " Colab Status & CU Balance Check"
echo "======================================================================"
colab status || true
colab usage || true
