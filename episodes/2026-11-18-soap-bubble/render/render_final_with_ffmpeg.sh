#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
test -f audio/narration.wav || { echo "Missing audio/narration.wav. Generate Kokoro first."; exit 1; }
test -f captions/captions_final.srt || { echo "Missing captions/captions_final.srt. Generate/review Whisper captions first."; exit 1; }
mkdir -p output
ffmpeg -y -f concat -safe 0 -i render/scenes_concat.txt -i audio/narration.wav \
  -vf "fps=30,scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,setsar=1,subtitles=captions/captions_final.srt:force_style='FontName=Arial,FontSize=18,Outline=2,Shadow=1,MarginV=170'" \
  -map 0:v:0 -map 1:a:0 -shortest -c:v libx264 -preset medium -crf 20 \
  -pix_fmt yuv420p -c:a aac -b:a 192k -movflags +faststart \
  output/kavi_ihab_soap_bubble_1080x1920.mp4
echo "Rendered output/kavi_ihab_soap_bubble_1080x1920.mp4"