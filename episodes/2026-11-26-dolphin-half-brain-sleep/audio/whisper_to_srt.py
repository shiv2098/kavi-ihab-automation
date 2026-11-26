#!/usr/bin/env python3
from pathlib import Path
import sys, whisper
ROOT=Path(__file__).resolve().parents[1]
audio=Path(sys.argv[1]) if len(sys.argv)>1 else ROOT/"audio"/"narration.wav"
out=ROOT/"captions"/"captions_final.srt"
model=whisper.load_model("base")
result=model.transcribe(str(audio),language="en",word_timestamps=True,fp16=False)
def stamp(sec):
 ms=max(0,int(round(sec*1000))); h,ms=divmod(ms,3600000); m,ms=divmod(ms,60000); s,ms=divmod(ms,1000)
 return f"{h:02}:{m:02}:{s:02},{ms:03}"
rows=[]
for seg in result.get("segments",[]):
 words=seg.get("words") or []
 if words:
  group=[]
  for w in words:
   group.append(w)
   if len(group)>=7 or w.get("word","").strip().endswith((".", "?", "!", ":", ";")):
    rows.append((group[0]["start"],group[-1]["end"],"".join(x["word"] for x in group).strip())); group=[]
  if group: rows.append((group[0]["start"],group[-1]["end"],"".join(x["word"] for x in group).strip()))
 else: rows.append((seg["start"],seg["end"],seg["text"].strip()))
out.parent.mkdir(parents=True,exist_ok=True)
with out.open("w",encoding="utf-8") as f:
 for i,(a,b,txt) in enumerate(rows,1): f.write(f"{i}\n{stamp(a)} --> {stamp(b)}\n{txt}\n\n")
print("Wrote",out,"— proofread before publishing.")