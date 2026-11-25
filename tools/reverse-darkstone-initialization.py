"""Extract original Darkstone normal initialization and static color inputs."""
import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('Darkstone.Initialize',0x10027a7c0),('Darkstone.BuildHierarchy',0x10027ae30),('Darkstone.StaticInitialization',0x100280bc0)]:
 start,end=n.bounds(address);evidence='evidence/darkstone-initialization-'+name+'.asm';pathlib.Path(evidence).write_text(n.annotated(address))
 functions[name]={'address':hex(start),'end':hex(end),'sha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'evidence':evidence}
colors={}
for name,address,load,store,target in [('diffuse',0x100ab5100,0x100280f35,0x100280f3d,0x100d2b490),('burning',0x100ab5110,0x100280f45,0x100280f4d,0x100d2b4a0),('ancestorBurning',0x100ab5120,0x100280f55,0x100280f5d,0x100d2b4b0),('pulseLow',0x100ab5130,0x100280f65,0x100280f6d,0x100d2b4c0),('pulseHigh',0x100ab5140,0x100280f75,0x100280f7d,0x100d2b4d0)]:
 instructions=n.instructions(0x100280bc0);a=next(i for i in instructions if i.address==load);b=next(i for i in instructions if i.address==store)
 assert a.address+a.size+a.operands[1].mem.disp==address
 assert b.address+b.size+b.operands[0].mem.disp==target
 raw=n.read(address,16);colors[name]={'address':hex(address),'target':hex(target),'load':hex(load),'store':hex(store),'hex':raw.hex(),'values':list(struct.unpack('<4f',raw))}
report={'passed':True,'executableSha256':n.digest,'functions':functions,'colors':colors,'scope':'SHA-gated original function boundaries and direct static vec4 load/store instructions. Static registration as a whole is not executed by this extraction. Complete ordinary Initialize and geometry hierarchy have separate native oracle reports; burning Update/scene Model ownership/whole classes remain pending.'}
pathlib.Path('docs/darkstone-initialization-native.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'passed':True,'functions':len(functions),'colors':len(colors)}))
