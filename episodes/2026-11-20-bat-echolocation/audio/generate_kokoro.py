from pathlib import Path
import numpy as np
import soundfile as sf
from kokoro import KPipeline

ROOT = Path(__file__).resolve().parents[1]
text = (ROOT / "script" / "spoken_script.txt").read_text(encoding="utf-8").strip()
pipeline = KPipeline(lang_code="a")
parts = []
for _, _, audio in pipeline(text, voice="am_michael", speed=0.95):
    if audio is not None:
        parts.append(np.asarray(audio, dtype=np.float32))
if not parts:
    raise RuntimeError("Kokoro returned no audio.")
audio = np.concatenate(parts)
out = ROOT / "audio" / "narration.wav"
sf.write(out, audio, 24000)
print(f"Saved {out} ({len(audio)/24000:.2f} seconds)")
