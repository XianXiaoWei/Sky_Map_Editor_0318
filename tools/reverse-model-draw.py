#!/usr/bin/env python3
"""Original Model constructor stream consumers and whole Vertex stream setter."""
import pathlib,sys,json,struct
from native import Native
root=pathlib.Path(__file__).resolve().parent.parent
n=Native(sys.argv[1]);functions={'Vertex.SetStream':0x1007f5430,'Vertex.SetNameAndCount':0x1007f53c0,'Model.constructor':0x100467330,'LevelMesh.Create':0x100401040,'Model.submit':0x10046b780}
for name,a in functions.items():
 assert n.bounds(a)[0]==a
 (root/'evidence'/('model-draw-'+name+'.asm')).write_text(n.annotated(a))
constants={hex(a):list(struct.unpack('<4I',n.read(a,16))) for a in [0x100aace00,0x100aace10,0x100ac3160]}
assert struct.unpack('<f',n.read(0x100aa45b8,4))[0]==0.5
assert constants['0x100aace00']==[3,28,1,2];assert constants['0x100aace10']==[32,32,5,6]
sizes=list(struct.unpack('<35I',n.read(0x100ae3a50,140)));assert [sizes[x-1] for x in [3,24,28,32]]==[12,4,4,8]
report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},'formatByteSizes':sizes,'constants':constants,'modelStreams':[{'buffer':0,'formats':[3,28],'semantics':[1,2],'stride':16,'source':'Mesh LOD +0x60; float3 position, UNORM color'},{'buffer':2,'formats':[24],'semantics':[3],'stride':4,'source':'Mesh LOD +0x68; SNORM normal'},{'buffer':3,'formats':[32,32],'semantics':[5,6],'stride':16,'source':'Mesh LOD +0x70; half4 UV0/1 pairs'},{'buffer':4,'formats':[28,28,28],'semantics':[13,14,15],'stride':12,'source':'compatible Model bake, three UNORM4 lighting vectors'}], 'visibility':{'constructorVisible':'0x1004675ae writes Model +0x227 = 1, enabled +0x228 = 1','render':'LevelMesh +0x105 to ModelOptions +0xd / Model +0x32d at 0x10040133c','visibleInWorld':'LevelMesh +0x108 is distinct; not object enable. Complete update consumer remains pending','savedEnabled':'0x10040177f..0x1004017ae calls Model.SetEnabled from LevelMesh +0xd0'},'scope':'Native setter normal body and assertions can execute independently; RenderBuffer callback is an explicit service. Constructor stream callsites/constants are disassembly evidence, not complete constructor execution. Original allocator/GPU/visibility/animation/lifecycle remain open.'}
(root/'docs/model-draw-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
