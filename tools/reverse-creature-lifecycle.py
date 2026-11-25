import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('FishV2.Load',0x1003370c0),('FishV2.Unload',0x100337500),('FishV2.Transform',0x1003384a0),('Movement.BankInitialize',0x100192520),('Movement.Seek',0x10062cb10),('DarkCreature.Alert',0x10026d2a0),('DarkCreature.Return',0x100270f10),('DarkCreature.SwitchRail',0x10026d0f0),('CrabBarn.AssignAuthority',0x10025f030),('CrabBarn.Update',0x10025ed80)]:
 start,end=n.bounds(address);assembly='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(assembly).write_text(n.annotated(start))
 functions[name]={'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly}
vectors={name:list(struct.unpack('<4I',n.read(address,16))) for name,address in [('bankDirection',0x100aa7920),('modelScale',0x100aaa8c0),('alertVelocityScale',0x100aa7f60)]}
constants={name:struct.unpack('<I',n.read(address,4))[0] for name,address in [('minimumLength',0x100aa78c4),('returnDuration',0x100aa8658),('actionSpeed',0x100aa50c0)]}
pathlib.Path('docs/creature-lifecycle-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'vectors':vectors,'constants':constants,'scope':'Whole ordinary fish Load/Unload/Transform, DarkCreature alert/return state callers and CrabBarn authority/update callers. Steering initialization, model/resource/animation owners, target detection and stream bodies retain explicit boundaries.'},indent=2)+'\n')
