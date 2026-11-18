# Caption status

captions_estimated.srt is a provisional timing draft based on 150 words/minute. It is not Whisper output and has not been aligned to a final voice recording.

After Kokoro generates audio/narration.wav, run:
```bash
pip install -U openai-whisper
whisper audio/narration.wav --model base --language English --task transcribe --output_format srt --output_dir captions
```
Review the SRT manually and save the approved file as captions/captions_final.srt.

Whisper: https://github.com/openai/whisper (MIT code licence). No paid transcription endpoint is used.