# Caption status

captions_estimated.srt is a provisional pace-based draft at 150 WPM. It is not Whisper output and is not aligned to recorded narration.

After generating audio/narration.wav, run local Whisper:
```bash
pip install -U openai-whisper
whisper audio/narration.wav --model base --language English --task transcribe --output_format srt --output_dir captions
```
Proofread and save as captions/captions_final.srt. Whisper code is MIT: https://github.com/openai/whisper. No paid transcription endpoint is used.
