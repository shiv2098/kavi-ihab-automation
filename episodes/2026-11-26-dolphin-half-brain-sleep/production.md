# Production finish steps
The 53-second visual-only preview is included in the downloadable ZIP; it is 1080×1920, 30 fps and contains original low-level SFX, but no narration.

Kokoro:
- Official weights: Apache-2.0, https://huggingface.co/hexgrad/Kokoro-82M
- Use the included notebook or Python script in a genuinely free runtime only. Do not connect billing or use paid compute.
- Preferred preset am_onyx; audition the full result and verify the current package/phonemizer/runtime notices.

Whisper:
- Install locally with pip install -U openai-whisper.
- Run python audio/whisper_to_srt.py audio/narration.wav.
- Proofread “unihemispheric” and all timings.

Final FFmpeg render:
- After narration.wav and captions/captions_final.srt exist, run bash production/render_final_with_ffmpeg.sh.
- Inspect the output before upload. Keep it Private pending explicit approval.

VN Android:
- Import visual_preview_NO_NARRATION.mp4, add narration.wav as a separate audio track, lower the preview audio to about 12–18%, create/proofread English captions and export 1080p/30fps.