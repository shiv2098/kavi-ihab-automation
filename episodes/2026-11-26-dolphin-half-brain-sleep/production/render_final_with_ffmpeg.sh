#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PREVIEW="$ROOT/visuals/visual_preview_NO_NARRATION.mp4"
VOICE="$ROOT/audio/narration.wav"
SRT="$ROOT/captions/captions_final.srt"
OUT="$ROOT/production/Kavi_ihab_Dolphin_Half_Brain_Sleep_FINAL.mp4"
for f in "$PREVIEW" "$VOICE" "$SRT"; do [[ -f "$f" ]] || { echo "Missing: $f" >&2; exit 1; }; done
ffmpeg -y -i "$PREVIEW" -i "$VOICE" \
-filter_complex "[0:a]volume=0.18[amb];[1:a]loudnorm=I=-16:TP=-1.5:LRA=11[voice];[voice][amb]amix=inputs=2:duration=first:dropout_transition=2[a]" \
-vf "subtitles='$SRT':force_style='FontName=Arial,FontSize=42,PrimaryColour=&H00FFFFFF,OutlineColour=&H00101828,BorderStyle=1,Outline=3,Shadow=0,Alignment=2,MarginV=210'" \
-map 0:v -map "[a]" -c:v libx264 -preset medium -crf 19 -pix_fmt yuv420p -r 30 -c:a aac -b:a 192k -shortest -movflags +faststart "$OUT"
ffprobe -v error -show_entries format=duration:stream=width,height,r_frame_rate -of json "$OUT"
echo "Review before upload: $OUT"