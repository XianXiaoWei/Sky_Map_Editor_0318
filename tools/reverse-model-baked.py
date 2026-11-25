#!/usr/bin/env python3
"""SHA/boundary-gated MeshInstance execution and LevelMesh binding frontier."""
import json,pathlib,struct,sys
from native import Native
root=pathlib.Path(__file__).resolve().parent.parent
n=Native(sys.argv[1])
functions={'initialize':0x10045f880,'consumer':0x10045fa00,'lookup':0x1003f68d0,'resourceLodReader':0x100455e90,'LevelMeshBarn.Load':0x100400180,'LevelMesh.Load':0x100400ed0,'LevelMesh.Create':0x100401040,'ModelBarn.CreateBaked':0x10046ca30,'ModelBarn.CreateUnbaked':0x10046c700,'Model.constructor':0x100467330}
for name,address in functions.items():
 assert n.bounds(address)[0]==address
 (root/'evidence'/f'model-baked-{name}.asm').write_text(n.annotated(address))
constants={hex(a):n.read(a,length).hex() for a,length in [(0x100aa7670,16),(0x100aa96a0,16),(0x100aa80a0,16),(0x100aa8a30,16),(0x100aa50c0,4),(0x100aa45b8,4)]}
assert constants['0x100aa7670']==struct.pack('<4f',.5,.5,.5,0).hex()
assert constants['0x100aa96a0']==struct.pack('<4f',2,2,2,0).hex()
calls=[]
for section,address,length in n.sections:
 if section!='__text':continue
 blob=n.read(address,length);p=blob.find(b'\xe8')
 while p>=0:
  if p+5<=length:
   target=address+p+5+struct.unpack_from('<i',blob,p+1)[0]
   if target in [functions['initialize'],functions['consumer']]:
    start,_=n.bounds(address+p)
    if any(i.address==address+p and i.mnemonic=='call' and i.op_str==hex(target) for i in n.instructions(start)):
     calls.append({'function':hex(start),'site':hex(address+p),'target':hex(target)})
  p=blob.find(b'\xe8',p+1)
create=n.annotated(functions['LevelMesh.Create']);assert '0x100401d40: mov qword ptr [rbx + 0x228], rax' in create and 'call 0x10046ca30' in create and 'call 0x10046c700' in create
report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},'directCalls':calls,'constants':constants,'meshInstance':{'requiredOutputBytes':176,'data':0,'bakedRecord':8,'lodIndex':16,'initialized':20,'sphereRadius':24,'sphereCenter':32,'firstObb':48,'secondaryObb':112},'resourceLod':{'stride':184,'firstMin':4,'firstMax':16,'secondaryMin':28,'secondaryMax':40,'renderVertexCount':52,'tableCountInData':64,'tablePointerInData':72},'levelMeshBinding':{'load':'0x100400ed0 waits on Mesh resource +0x108; missing lookup asserts, not silent loading success','create':'0x100401040 selects baked 0x10046ca30 or unbaked 0x10046c700; stores returned Model pointer at 0x100401d40 into LevelMesh +0x228','modelPool':'0x10046ca30 reserves from ModelBarn+0x10, stride0x3e0, limit0x400, then calls 0x100467330','scope':'These load/create/constructor functions are investigation evidence only; they are not newly restored or executed by this oracle.'},'executionScope':'Complete initialize/consumer/lookup bodies, with explicit ResourceRef/manager/diagnostic services; original machine code is unchanged. LOD reader and LevelMesh/Model allocation/lifecycle remain evidence, not full execution acceptance.'}
(root/'docs'/'model-baked-native.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n');print(json.dumps({'functions':len(functions),'directCalls':calls}))
