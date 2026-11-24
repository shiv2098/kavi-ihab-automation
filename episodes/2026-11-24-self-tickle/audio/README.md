# Kokoro voiceover setup

No narration WAV was generated because Kokoro is not installed in the available runtime.

- Model: https://huggingface.co/hexgrad/Kokoro-82M
- Model card lists Apache-2.0 for weights; preserve upstream notices.
- Check the selected voice pack's own licence before monetized commercial use.
- Candidate voice ID: am_michael; audition before approval.
- Do not use ElevenLabs free output or paid-credit generators.

Local setup (Python 3.10/3.11 recommended):
```bash
pip install "kokoro>=0.9.4" soundfile numpy
sudo apt-get install espeak-ng
python audio/generate_kokoro.py
```

Use the included Colab notebook only in a genuinely free runtime with no billing, paid compute, top-up or upgrade. Stop if a payment prompt appears.
