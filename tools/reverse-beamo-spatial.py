#!/usr/bin/env python3
"""SHA-gated Beamo bounds/material groups and dependent pool lifecycle evidence."""
import json,pathlib,struct,sys
from native import Native
root=pathlib.Path(__file__).resolve().parent.parent
n=Native(sys.argv[1])
functions={'Beamo.collisionColor':0x10077d4b0,'CollisionGeo.Remove':0x100779200,'ParentBarn.Reset':0x100522290,'ParentBarn.Create':0x100522700,'ParentBarn.Release':0x1005227a0,'ParentBarn.ReleaseAll':0x100522390,'ParentBarn.HotDate':0x100522380,'Parent.ReleaseNodes':0x100523480,'ParentBarn.FindByTarget':0x100523c00}
for name,address in functions.items():
 assert n.bounds(address)[0]==address
 (root/'evidence'/('spatial-'+name+'.asm')).write_text(n.annotated(address))
constants={hex(a):n.read(a,size).hex() for a,size in [(0x100aa45b8,4),(0x100aa7670,16),(0x100aad5d0,4),(0x100aa85b8,4),(0x100aad570,16),(0x100aabf50,4)]}
assert n.read(0x100aa45b8,4)==struct.pack('<f',.5)
assert n.read(0x100aad570,16)==struct.pack('<4f',255,255,255,255)
report={'executableSha256':n.digest,'functions':{name:hex(a) for name,a in functions.items()},'intervals':{'Beamo.spatial':'0x10019579b..0x100195bc5','Beamo.materialGroups':'0x100195f89..0x100196094'},'constants':constants,'record':{'matrix':0x30,'worldObb':0x70,'sphereRadius':0xb0,'disableDistance':0xb4,'collisionEnabled':0xbc,'callback':0xc0,'collisionInstance':0xd0,'primaryMaterial':0xd8,'secondaryMaterial':0xe0,'primaryGroup':0xe8,'secondaryGroup':0xec,'alphaGroup':0xf0,'collisionColor':0xf8},'collisionDescriptorBytes':56,'collisionDescriptorTail':'context+0x178..0x17f retains prior matrix bytes','materialGroups':{'regions':6,'normalPrimary':0,'decalPrimary':1,'secondary':2,'alpha':5,'strictLimit':16},'parentPool':{'slots':128,'firstSlot':16,'stride':144,'freeHead':0x4810,'updateCount':0x4c18,'dirty':0x4c1c,'nodePool':0x4c20,'activityInSlot':0x89},'scope':'Original contiguous Beamo bounds/distance/collision descriptor and material grouping; CollisionGeo.Remove and ParentBarn pool lifecycle bodies. Resource bootstrap/index/registration/libm/string/meta services are explicit. Complete map startup, collision physics, GPU drawing, Parent joint/follow/order and whole-class acceptance remain open.'}
(root/'docs'/'beamo-spatial-native.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report))
