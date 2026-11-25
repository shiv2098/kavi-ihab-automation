# Kokoro voiceover setup

No narration WAV was generated in this runtime because Kokoro is not installed.

- Model: https://huggingface.co/hexgrad/Kokoro-82M
- The model card lists Apache-2.0 for the weights; preserve upstream notices.
- Check the selected voice pack's own licence/terms before monetized use.
- am_michael is a candidate male English voice ID; audition before approval.
- Do not use ElevenLabs free output or paid-credit generators.

Local install (Python 3.10/3.11 recommended):
pip install "kokoro>=0.9.4" soundfile numpy
On Ubuntu/Debian install espeak-ng separately.
Then run python audio/generate_kokoro.py.

Use the included Colab notebook only in a genuinely free runtime with no billing or paid compute; stop if a payment or upgrade prompt appears.
