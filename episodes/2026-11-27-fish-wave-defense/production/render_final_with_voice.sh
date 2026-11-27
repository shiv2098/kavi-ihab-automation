#!/usr/bin/env bash
set -euo pipefail
BASE="$(cd "$(dirname "$0")/.." && pwd)"
VIDEO="$BASE/visuals/visual_preview_NO_NARRATION.mp4"
VOICE="$BASE/audio/voiceover.wav"
OUT="$BASE/visuals/final_narrated_draft.mp4"
if [[ ! -f "$VOICE" ]]; then echo "Missing $VOICE. Add a rights-cleared, approved voiceover.wav first." >&2; exit 2; fi
ffmpeg -y -i "$VIDEO" -i "$VOICE" -filter_complex "[0:a]volume=0.22[sfx];[1:a]loudnorm=I=-16:TP=-1.5:LRA=11[vo];[sfx][vo]amix=inputs=2:duration=longest:weights='0.25 1.0':normalize=0[a]" -map 0:v -map "[a]" -t 54 -c:v libx264 -preset medium -crf 19 -pix_fmt yuv420p -r 24 -c:a aac -b:a 192k -movflags +faststart "$OUT"
echo "Created $OUT"
