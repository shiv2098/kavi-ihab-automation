# Kokoro voiceover setup
No narration WAV was generated in this runtime because Kokoro is not installed here.
Model: https://huggingface.co/hexgrad/Kokoro-82M (model card lists Apache-2.0; preserve upstream notices). Inspect the selected voice pack's own terms before commercial use. am_michael is only a candidate; audition before approval.
Local setup:
```bash
pip install "kokoro>=0.9.4" soundfile numpy
# Ubuntu/Debian: sudo apt-get install espeak-ng
python audio/generate_kokoro.py
```
Or use the included Colab notebook only if a free runtime is available without billing, paid compute or upgrade. If prompted for payment, stop.
