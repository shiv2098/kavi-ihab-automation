# Caption status
captions_estimated.srt is provisional timing at 150 WPM; it is not Whisper output and is not aligned to final audio.
After narration is generated:
```bash
pip install -U openai-whisper
whisper audio/narration.wav --model base --language English --task transcribe --output_format srt --output_dir captions
```
Proofread and save as captions/captions_final.srt. Whisper code licence: MIT. No paid transcription endpoint is used.
