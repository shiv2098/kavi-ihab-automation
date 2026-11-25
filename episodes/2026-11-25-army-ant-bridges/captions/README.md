# Caption status

captions_estimated.srt is a provisional pace-based draft at 150 words per minute. It is not Whisper output and is not aligned to a recorded voiceover.

After generating audio/narration.wav, run local Whisper:

pip install -U openai-whisper
whisper audio/narration.wav --model base --language English --task transcribe --output_format srt --output_dir captions

Proofread against the final audio and save as captions/captions_final.srt.

Whisper repository: https://github.com/openai/whisper (MIT code licence). No paid transcription endpoint is used.
