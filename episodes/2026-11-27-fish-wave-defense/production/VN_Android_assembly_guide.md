# VN Android assembly guide

1. Create a new project and set canvas to 9:16.
2. Import `visuals/visual_preview_NO_NARRATION.mp4` as the base video. It already contains original, low-level underwater ambience/SFX and is 54 seconds long.
3. Record an original human narration or add a voice track only after the selected TTS voice/model rights are confirmed. Target duration: 54 seconds.
4. If using a new voice track, keep embedded SFX quiet (roughly 15–25%); narration should be dominant. If replacing the audio entirely, mute the embedded SFX and add `original_underwater_ambience_sfx.wav` at low volume.
5. Use `audio/captions_draft_APPROXIMATE.srt` only as a timing guide. It is not Whisper-aligned because no final voice track exists yet. Re-time each cue after final narration, or run the Whisper helper on a computer with Whisper installed.
6. Use bold, high-contrast captions, maximum two lines, with a dark translucent backing. Keep captions inside the central mobile-safe area.
7. Check spelling and pronunciation of *Poecilia sulphuraria*. Do not label the fish as “confused”; the exact reason the waves work remains unresolved.
8. Export 1080×1920, 24 or 30 fps, H.264, AAC. Review on a phone before upload.
9. Save as a private draft. Do not publish, schedule or change visibility until explicit approval.
