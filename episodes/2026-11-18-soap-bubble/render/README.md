# Render status

A visual-only preview was rendered and verified: 48.4 seconds, 1080×1920, 30 fps. It has no narration and no final captions. It is not the finished Short.

To finish:
1. Generate audio/narration.wav using Kokoro.
2. Generate and proofread captions/captions_final.srt using local Whisper.
3. Run bash render/render_final_with_ffmpeg.sh.
4. Review the final MP4 for timing, captions, sound levels and scientific accuracy.