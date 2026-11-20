# Caption status

captions_estimated.srt is provisional timing based on the measured 130-word script at 150 WPM. It is not Whisper output and is not aligned to recorded audio.

After generating audio/narration.wav:
```bash
pip install -U openai-whisper
whisper audio/narration.wav --model base --language English --task transcribe --output_format srt --output_dir captions
```
Proofread the result against the audio and save as captions/captions_final.srt.

Whisper repository: https://github.com/openai/whisper (MIT code licence). No paid transcription endpoint is used.
