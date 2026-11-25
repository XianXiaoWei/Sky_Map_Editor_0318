"""Evidence for the whole BirdV2Ai acceleration dispatcher."""
import hashlib,json,pathlib,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
start,end=n.bounds(0x1001a0060);assembly='evidence/bird-acceleration.asm'
pathlib.Path(assembly).write_text(n.annotated(start))
pathlib.Path('docs/bird-acceleration-native.json').write_text(json.dumps({'executableSha256':n.digest,'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'scope':'Whole ordinary BirdV2Ai acceleration dispatcher composed with original Steering.Begin/End and BirdV2 flight integration/Update. Target/rail/guide/flocking forces, powf, world queries and collision remain explicit services. Complete autonomous AI and live resource ownership remain pending.'},indent=2)+'\n')
print(json.dumps({'bytes':end-start}))
