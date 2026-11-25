"""Inspect whole FishV2 AI and the remaining shared steering/predicate bodies."""
import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('FishV2.AI',0x100335a40),('Steering.Pursuit',0x10062f660),('Steering.Avoidance',0x10062e860),('FishV2.NeighborFilter',0x100338570),('FishV2.FlockFilter',0x1003385f0)]:
 start,end=n.bounds(address);code_end=0x1003370a4 if name=='FishV2.AI' else None
 assembly='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(assembly).write_text(n.annotated(start,code_end))
 f={'start':hex(start),'end':hex(end),'wholeFunction':True,'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'instructions':len(n.instructions(start,code_end))}
 if code_end:
  targets=[code_end+struct.unpack('<i',n.read(code_end+4*i,4))[0] for i in range(5)]
  assert all(target in {i.address for i in n.instructions(start,code_end)} for target in targets)
  f.update(codeEnd=hex(code_end),switchTableHex=n.read(code_end,20).hex(),trailingPaddingHex=n.read(code_end+20,end-code_end-20).hex())
 functions[name]=f
addresses={'one':0x100aa50c0,'half':0x100aa45b8,'minimumDelta':0x100aa6a9c,'maximumDelta':0x100aa6aa0,'epsilon':0x100aa78c4,'queryRadius':0x100aa866c,'neighborInterval':0x100aa77ec,'randomScale':0x100aa70f0,'markerMinimum':0x100aa77f0,'six':0x100aa6aa4,'maximumFloat':0x100aa78b8,'markerCountScale':0x100aa967c,'railAdvance':0x100aa78bc,'seekSpeed':0x100aa85d0,'amountGrowth':0x100aa91d8,'alertDecay':0x100aa77d0,'alertThreshold':0x100aa6aac,'biteAmount':0x100aa8634,'particleScale':0x100aa77e8,'frontThreshold':0x100aa70e4,'playerRadius':0x100aa9670,'fleeMaximum':0x100aa77dc,'interactionAngle':0x100aa8608,'interactionWeight':0x100abc718,'arrivalDistance':0x100aa6aa8,'interactionRadius':0x100aa869c,'interactionAmount':0x100aa8620}
constants={name:struct.unpack('<I',n.read(address,4))[0] for name,address in addresses.items()}
vectors={name:list(struct.unpack('<4I',n.read(address,16))) for name,address in [('sign',0x100aa7900),('interactionOffset',0x100aa7670)]}
r={'executableSha256':n.digest,'functions':functions,'constants':constants,'vectors':vectors,'interactionAngle':struct.unpack('<d',n.read(0x100abc720,8))[0]}
pathlib.Path('docs/fish-ai-native.json').write_text(json.dumps(r,indent=2)+'\n')
