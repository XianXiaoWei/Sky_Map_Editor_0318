"""SHA-gated steering kernels and exact CrabAi.Update call-site evidence."""
import hashlib,json,pathlib,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={'SteeringBehaviors.Begin':0x10062e690,'SteeringBehaviors.Seek':0x10062f710,'SteeringBehaviors.End':0x10062e700}
rows={}
for name,address in functions.items():
 start,end=n.bounds(address);evidence='evidence/creature-steering-'+name+'.asm';pathlib.Path(evidence).write_text(n.annotated(address))
 rows[name]={'address':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'instructions':len(n.instructions(address)),'evidence':evidence}
start,end=n.bounds(0x10025a880);code_end=0x10025b498
pathlib.Path('evidence/creature-steering-CrabAi.Update-body.asm').write_text(n.annotated(start,code_end))
report={'executableSha256':n.digest,'functions':rows,'caller':{'address':hex(start),'functionEnd':hex(end),'codeEnd':hex(code_end),'codeSha256':hashlib.sha256(n.read(start,code_end-start)).hexdigest(),'evidence':'evidence/creature-steering-CrabAi.Update-body.asm','investigationOnly':True,'scope':'Executable body only; jump table/trailing data from 0x10025b498 to function end is not disassembled as instructions.'},'scope':'Three complete steering bodies used by CrabAi.Update. Collision/world and remaining AI/motion integration are separate; no complete creature or automatic viewport behavior claim.'}
pathlib.Path('docs/creature-steering-native.json').write_text(json.dumps(report,indent=2)+'\n')
