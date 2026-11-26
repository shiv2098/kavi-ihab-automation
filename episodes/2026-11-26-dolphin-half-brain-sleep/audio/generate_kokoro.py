#!/usr/bin/env python3
from pathlib import Path
import numpy as np, soundfile as sf
from kokoro import KPipeline
ROOT=Path(__file__).resolve().parents[1]
TEXT="""How can a dolphin sleep without missing its next breath? Dolphins are voluntary breathers: each breath requires a controlled trip to the surface. So they use a pattern called unihemispheric slow-wave sleep. Brain recordings show one hemisphere entering slow-wave sleep while the other remains relatively awake. Often, the eye opposite the sleeping hemisphere closes, while the other stays open. That awake side can help the dolphin keep moving, monitor its surroundings and coordinate surfacing for air. The two sides can take turns resting. But the eye pattern is not a perfect sleep detector: researchers have recorded brief mismatches between eye position and brain activity. So a dolphin is not simply switching half its brain off. It is dividing sleep and wakefulness across the brain—resting while remaining able to surface and breathe."""
pipeline=KPipeline(lang_code="a")
chunks=[np.asarray(audio,dtype=np.float32) for _,_,audio in pipeline(TEXT,voice="am_onyx",speed=0.98)]
if not chunks: raise RuntimeError("No audio returned")
wave=np.concatenate(chunks)
out=ROOT/"audio"/"narration.wav"
sf.write(out,wave,24000,subtype="PCM_16")
print(out,round(len(wave)/24000,2),"seconds")