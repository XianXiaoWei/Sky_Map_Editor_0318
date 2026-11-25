#!/usr/bin/env python3
"""Whole ModelBarn wrappers and connected Model LOD-query evidence."""
import json,pathlib,sys
from native import Native
root=pathlib.Path(__file__).resolve().parent.parent;n=Native(sys.argv[1]);functions={'CreateBaked':0x10046ca30,'CreateUnbaked':0x10046c700,'MeshLodCount':0x1004653c0}
for name,address in functions.items():
 assert n.bounds(address)[0]==address
 (root/'evidence'/f'model-barn-{name}.asm').write_text(n.annotated(address))
report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},'pool':{'offset':16,'stride':992,'limit':1024,'countOffset':1015824},'dependencies':{'heap':1036880,'renderer':1036888,'resourceManager':1036896,'vector1':1036912,'vector2':1036944,'constructor':'0x100467330'},'aggregate':{'bytes':152,'levelName':0,'meshName':64,'guidOrUninitializedUnbakedDword':128,'bakedFlag':132,'shaderPointer':136,'transformPointer':144},'constructorStack':{'aggregate':[0,152],'vector1':[152,16],'unwrittenAlignmentPadding':[168,16],'vector2':[184,16]},'scope':'Complete normal wrappers checked independently with captured complete-constructor dependency and explicit prior stack fill. Full normal MeshLodCount connected to original ResourceManager/ResourceRef. Exceptions/unwind, complete Model constructor and actual LevelMesh Model pointer binding remain open.'}
assert report['pool']['countOffset']==0xf8010
for name,offset in [('heap',0xfd250),('renderer',0xfd258),('resourceManager',0xfd260),('vector1',0xfd270),('vector2',0xfd290)]:assert report['dependencies'][name]==offset
(root/'docs/model-barn-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
