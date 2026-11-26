# Source and licence manifest
Scientific references are listed in research.md.

Visuals: seven original 1080×1920 graphics, vertical and 16:9 thumbnails, storyboard and visual-only MP4 are generated from episode-specific Python/Pillow/NumPy code. No stock footage, scraped video or third-party images used.
Audio: the 53-second underwater ambience/SFX bed is procedural original audio generated with NumPy/SoundFile. No third-party samples or music.
Kokoro: official model card declares Apache-2.0 weights: https://huggingface.co/hexgrad/Kokoro-82M . Preserve upstream LICENSE/NOTICE if redistributing model weights. Verify separate inference, phonemizer and runtime licences.
eSpeak NG is GPL-3.0-or-later and is only a local optional runtime dependency, not bundled.
Whisper code: MIT, https://github.com/openai/whisper . Final transcription not yet run.
FFmpeg is an installed local renderer; build options can affect LGPL/GPL obligations. Binary not included.
No paid-credit generation, ElevenLabs, OpenArt, Runway, ImagineArt, Magic Hour or Google AI Studio used.