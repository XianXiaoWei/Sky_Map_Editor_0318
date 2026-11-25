#!/usr/bin/env python3
"""SHA/boundary-gated normal Vertex.cpp data construction evidence."""
import json,pathlib,sys,struct
from native import Native
root=pathlib.Path(__file__).resolve().parent.parent;n=Native(sys.argv[1]);functions={'vertexData':0x1007f5010,'renderData':0x1007f5b20,'renderDataForward':0x1007f5d80,'autoLister':0x1007f6ca0,'unbakedConsumer':0x10045f770}
for name,address in functions.items():
 assert n.bounds(address)[0]==address
 (root/'evidence'/f'vertex-data-{name}.asm').write_text(n.annotated(address))
constants={hex(a):n.read(a,16).hex() for a in [0x100aa50c0,0x100aa80a0,0x100aa8a30,0x100aa8a00,0x100ab5480,0x100ab3140,0x100ab2f80]}
assert struct.unpack('<4I',n.read(0x100ab5480,16))==(0x4e6e6b28,0x4e6e6b28,0x4e6e6b28,0)
assert n.read(0x1007f5d85,1)==b'\xe9'
report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},'constants':constants,'vertexData':{'bytes':1080,'embeddedLister':1024,'selfPointer':1040,'name':1048,'nameBytes':28,'preservedPadding':[[316,4],[324,4],[1017,7],[1076,4]]},'renderData':{'bytes':1344,'defaultObbMatrixGlobal':'0x100c0db08','queuedByte':1322},'autoLister':{'variablesGlobal':'0x102049a48','headOrNewestOffset':72,'previous':0,'next':8,'lock':'0x1007e9360','unlock':'0x1007e9480'},'scope':'Whole normal constructors and forwarding entry/AutoLister executed unchanged. Lock internals, global matrix/vars, libc and prepared resource readiness are services. Actual Vertex GPU setup/upload/draw/release, full Model constructor/LevelMesh binding/Avatar/game remain open.'}
(root/'docs/vertex-data-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
