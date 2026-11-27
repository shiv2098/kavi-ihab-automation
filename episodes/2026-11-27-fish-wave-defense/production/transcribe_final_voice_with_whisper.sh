#!/usr/bin/env bash
set -euo pipefail
BASE="$(cd "$(dirname "$0")/.." && pwd)"
VOICE="$BASE/audio/voiceover.wav"
if [[ ! -f "$VOICE" ]]; then echo "Missing voiceover.wav" >&2; exit 2; fi
# Install openai-whisper locally first: pip install -U openai-whisper
whisper "$VOICE" --model small --language English --task transcribe --output_format srt --output_dir "$BASE/audio"
