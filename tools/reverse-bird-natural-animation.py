"""SHA-gated takeoff consumer and sequence lookup/validation bodies."""
import hashlib,json,pathlib,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={'BirdV2.TakeoffSequenceConsumer':0x1001a3980,'Animation.FindSequence':0x1000962f0,'Animation.IsSequenceValid':0x100096410}
rows={}
for name,address in functions.items():
 start,end=n.bounds(address);evidence='evidence/bird-natural-'+name+'.asm';pathlib.Path(evidence).write_text(n.annotated(address))
 rows[name]={'address':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'instructions':len(n.instructions(address)),'evidence':evidence}
pathlib.Path('docs/bird-natural-animation-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':rows,'scope':'Complete takeoff consumer (descriptive function name), sequence hash lookup and validation bodies; named action lookup and sequence playback are explicit animation services. Complete creature AI and viewport autonomous animation remain pending.'},indent=2)+'\n')
