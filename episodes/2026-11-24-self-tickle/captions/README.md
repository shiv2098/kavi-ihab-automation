# Caption status

captions_estimated.srt in the ZIP is a provisional pace-based draft, not Whisper output and not aligned to a recorded narration.

After generating audio/narration.wav, run:
```bash
pip install -U openai-whisper
whisper audio/narration.wav --model base --language English --task transcribe --output_format srt --output_dir captions
```
Proofread against the final audio and save as captions/captions_final.srt.

Whisper repository: https://github.com/openai/whisper (MIT code licence).
