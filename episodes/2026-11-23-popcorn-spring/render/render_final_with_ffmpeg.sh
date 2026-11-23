#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
test -f visuals/visual_preview_NO_NARRATION.mp4 || { echo 'Missing visual preview'; exit 1; }
test -f audio/narration.wav || { echo 'Missing audio/narration.wav. Generate Kokoro first.'; exit 1; }
test -f captions/captions_final.srt || { echo 'Missing captions/captions_final.srt. Generate and proofread Whisper captions first.'; exit 1; }
mkdir -p output
ffmpeg -y -i visuals/visual_preview_NO_NARRATION.mp4 -i audio/narration.wav \
  -i audio/sfx/heat_rise.wav -i audio/sfx/vapour_pop.wav -i audio/sfx/starch_spring.wav \
  -filter_complex "[1:a]loudnorm=I=-16:TP=-1.5:LRA=11[voice];[2:a]adelay=1800|1800,volume=0.10[h];[3:a]adelay=35000|35000,volume=0.14[p];[4:a]adelay=39000|39000,volume=0.12[s];[voice][h][p][s]amix=inputs=4:duration=first:dropout_transition=2[a]" \
  -vf "fps=30,scale=1080:1920:force_original_aspect_ratio=increase,crop=1080:1920,setsar=1,subtitles=captions/captions_final.srt:force_style='FontName=DejaVu Sans,FontSize=18,Outline=2,Shadow=1,MarginV=160'" \
  -map 0:v:0 -map '[a]' -shortest -c:v libx264 -preset medium -crf 20 -pix_fmt yuv420p \
  -c:a aac -b:a 192k -movflags +faststart output/kavi_ihab_popcorn_spring_1080x1920.mp4
ffprobe -v error -show_entries format=duration,size:stream=codec_type,width,height,avg_frame_rate -of json output/kavi_ihab_popcorn_spring_1080x1920.mp4
