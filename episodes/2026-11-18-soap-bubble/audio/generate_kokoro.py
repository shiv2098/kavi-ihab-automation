from pathlib import Path
import numpy as np
import soundfile as sf
from kokoro import KPipeline

ROOT = Path(__file__).resolve().parents[1]
text = (ROOT / "script" / "spoken_script.txt").read_text(encoding="utf-8").strip()
out = ROOT / "audio" / "narration.wav"

# Kokoro-82M: https://huggingface.co/hexgrad/Kokoro-82M
# Preserve the upstream Apache-2.0 LICENSE/NOTICE files.
pipeline = KPipeline(lang_code="a")
voice = "am_michael"  # audition am_fenrir / bm_george
speed = 0.95

parts = []
for _, _, audio in pipeline(text, voice=voice, speed=speed):
    if audio is not None:
        parts.append(np.asarray(audio, dtype=np.float32))
if not parts:
    raise RuntimeError("Kokoro produced no audio.")
audio = np.concatenate(parts)
sf.write(out, audio, 24000)
print(f"Wrote {out} ({len(audio)/24000:.2f}s), voice={voice}, speed={speed}")