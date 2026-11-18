# Narration — Kokoro local setup

Kokoro was not installed in the execution environment and network access was unavailable for installing it. No narration WAV was generated.

- Model: https://huggingface.co/hexgrad/Kokoro-82M
- Model card: Apache-2.0; preserve upstream LICENSE and NOTICE.
- Voice list: https://huggingface.co/hexgrad/Kokoro-82M/blob/main/VOICES.md
- Inference package: https://github.com/hexgrad/kokoro

Inspect the selected voice pack's terms before commercial use. am_michael is only a candidate voice ID.

Local install:
```bash
pip install "kokoro>=0.9.4" soundfile numpy
# Ubuntu/Debian
sudo apt-get install espeak-ng
python audio/generate_kokoro.py
```

For Android, use the Kokoro Colab quick-start notebook in the production ZIP. Select only a genuinely free runtime with no billing or paid compute. If Colab asks for billing or an upgrade, stop.

No ElevenLabs free output, paid API, paid credits, OpenArt, Runway or ImagineArt was used.