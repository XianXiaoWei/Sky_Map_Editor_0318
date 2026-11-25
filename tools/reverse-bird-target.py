"""SHA-gated full BirdV2 target selection body and native literals."""
import json,hashlib,pathlib,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky');start,end=n.bounds(0x1001a2770);filename='evidence/bird-target-selection.asm';pathlib.Path(filename).write_text(n.annotated(start))
constants={name:int.from_bytes(n.read(at,4),'little') for name,at in [('randomScale',0x100aa70f0),('selectionScale',0x100aaaf40),('delayLow',0x100aad94c),('delayHigh',0x100aad950)]}
pathlib.Path('docs/bird-target-native.json').write_text(json.dumps({'executableSha256':n.digest,'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':filename,'constants':constants,'scope':'Whole BirdV2 target-selection body and its composition with BirdV2.Update. Captured params/count, live Clump, metadata cast, enabled virtuals, signed index arithmetic, selected target transform and delay retained. Actual registry/collision/AI/Model/Avatar owners remain services; no whole autonomous BirdV2 or manta lifecycle claim.'},indent=2)+'\n')
