#!/usr/bin/env python3
"""SHA-gated LevelMesh/Model state and reflection evidence."""
import json,pathlib,struct,sys
from native import Native
root=pathlib.Path(__file__).resolve().parent.parent
n=Native(sys.argv[1])
functions={'constructor':0x1004003b0,'placement':0x100403670,'SetTransform':0x1003ffe10,'GetTransform':0x100402ab0,'SetEnabled':0x1003ffe50,'GetEnabled':0x100402a80,'GetObb':0x100402b10,'WorldObb':0x100402b60,'BstGuid':0x100402bc0,'setMatrixWrapper':0x1004037c0,'getMatrixWrapper':0x1004038e0,'setBoolWrapper':0x1004039a0,'getBoolWrapper':0x100403ac0,'Model.SetTransform':0x100463750,'Model.SetEnabled':0x1004636d0,'registration':0x100404f10}
for name,address in functions.items():
 assert n.bounds(address)[0]==address
 (root/'evidence'/f'level-mesh-{name}.asm').write_text(n.annotated(address))
assert n.read(0x100aabf60,8)==struct.pack('<2f',-1,-1)
slots={hex(i):hex(struct.unpack('<Q',n.read(0x100c16970+i,8))[0]) for i in [0x10,0x18,0x20,0x28,0x30]}
assert slots=={hex(i):hex(functions[name]) for i,name in [(0x10,'GetEnabled'),(0x18,'GetTransform'),(0x20,'GetObb'),(0x28,'WorldObb'),(0x30,'BstGuid')]}
registration=n.annotated(functions['registration']);assert '0x1003ffe10' in registration and 'mov edx, 0x19' in registration and 'mov ecx, 0x21' in registration
report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},'size':2656,'vptr':'0x100c16970','vtableSlots':slots,'layout':{'matrix':16,'bstGuid':80,'enabled':208,'modelPointer':552,'disabledLatch':2645,'shaderParamCount':544,'shaderParamBodies':560,'shaderParamStride':128,'shaderParamPointers':416},'modelLayout':{'localObb':288,'ordinaryTransform':352,'ordinaryDirty':549,'visible':551,'enabled':552,'deferredTransform':576,'deferredDirty':640,'deferredFlag':814,'disableReset':960},'scope':'Whole normal constructor and complete listed state methods/reflection bodies execute in the independent oracle. Metadata getter/registry IDs are prepared; registration/default-cache, exceptions/unwind, Model creation/resource/baked binding, deferred commit/animation/rendering and full scene/Avatar/Windows lifecycle remain open.'}
(root/'docs'/'level-mesh-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
