# Voiceover setup — Kokoro

No narration WAV was generated because Kokoro is not installed in the available runtime.

- Model: https://huggingface.co/hexgrad/Kokoro-82M
- Model card lists Apache-2.0 for weights; preserve notices.
- Verify the selected voice pack and dependencies' terms for commercial use before monetized publication.
- am_michael is a candidate male English voice ID; audition before approving.
- Do not use ElevenLabs free output or paid-credit voice/video generators.

Local install (Python 3.10/3.11 recommended):
```bash
pip install 'kokoro>=0.9.4' soundfile numpy
sudo apt-get install espeak-ng
python audio/generate_kokoro.py
```
Use the included notebook only in a genuinely free runtime with no billing, paid compute, top-up or upgrade. If any payment prompt appears, stop.
