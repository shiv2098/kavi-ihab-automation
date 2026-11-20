# Kokoro voiceover setup

No narration WAV was generated because Kokoro is not installed in the available runtime.

- Model: https://huggingface.co/hexgrad/Kokoro-82M
- Model card lists Apache-2.0 for model weights; preserve upstream licence/notice files.
- Inspect the selected voice pack's own terms before monetized commercial use.
- Candidate voice ID: am_michael. Audition before approval.
- Do not use ElevenLabs free output or paid-credit voice/video generators.

Local setup:
```bash
pip install "kokoro>=0.9.4" soundfile numpy
sudo apt-get install espeak-ng
python audio/generate_kokoro.py
```

Use the included Colab notebook only if a genuinely free runtime is available without billing, paid compute or upgrade. If any payment prompt appears, stop.
