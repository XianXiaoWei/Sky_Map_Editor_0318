#!/usr/bin/env python3
import pathlib,sys,json,hashlib
from native import Native
root=pathlib.Path(__file__).resolve().parent.parent
n=Native(sys.argv[1])
entries={'LevelMesh.float':0x1003ffe90,'LevelMesh.vector':0x1003fff20,'LevelMesh.texture':0x1003fffc0,'LevelMesh.find':0x100400c80,'LevelMesh.update':0x100402060,'Model.find':0x1004666a0,'Model.float':0x100466710,'Model.vector':0x1004669b0,'Model.texture':0x100466e30}
functions={}
for name,address in entries.items():
 assert n.bounds(address)[0]==address
 asm=n.annotated(address)
 target=root/'evidence'/('model-parameter-'+name+'.asm');target.write_text(asm)
 functions[name]={'address':hex(address),'end':hex(n.bounds(address)[1]),'codeSha256':hashlib.sha256(n.read(address,n.bounds(address)[1]-address)).hexdigest(),'evidence':str(target.relative_to(root))}
scene=n.annotated(0x100059a50)
(root/'evidence/model-parameter-scene-globals.asm').write_text(scene)
assert '0x10005a723:' in scene and '0x10005a78a:' in scene
textures={'u_caustics':{'resource':n.string(0x100b621c4),'resourceNameAddress':'0x100b621c4','resourceLookup':'0x10005a71e..0x10005a744','registration':'0x10005a78a..0x10005a796','uniformNameAddress':'0x100b621cd','samplerPointer':0}}
assert n.string(0x100b621cd)=='u_caustics' and textures['u_caustics']['resource']=='Caustics'
report={'executableSha256':n.digest,'functions':functions,'emptyTexture':{'selector':'0x10040238c..0x100402396','name':n.string(0x100b61227)},'sceneTextureGlobals':textures,'scope':'Address-backed whole setters/lookup and normal valid-uniform update path. Scene Caustics identity/registration proven by disassembly; complete Scene global initialization and resource lifetime are not executed/restored. Resource/Vertex services, hot reload, invalid-uniform diagnostic/removal and exception unwinding are explicit dependencies; complete class completion remains zero.'}
assert report['emptyTexture']['name']=='Black'
(root/'docs/model-parameter-native.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report))
