#!/usr/bin/env python3
"""SHA-gated original TransformObject bodies, virtual slots and constants."""
import json
import pathlib
import struct
import sys
from native import Native
root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
functions = {
 'placement': 0x1006d94c0, 'size': 0x1006d93e0,
 'OnLevelLoad': 0x1006d5d80, 'OnStart': 0x1006d6090,
 'OnEnable': 0x1006d6370, 'OnStop': 0x1006d62e0,
 'Update': 0x1006d6380, 'GetResumeEnabled': 0x1006d9150,
 'OnResumeEnabled': 0x1006d9160, 'destructor': 0x1006d9240,
 'registration': 0x1006dc260,
}
for name, address in functions.items():
 assert n.bounds(address)[0] == address
 (root / 'evidence' / f'transform-object-{name}.asm').write_text(n.annotated(address))
slots = {hex(i): hex(struct.unpack('<Q', n.read(0x100c253f0 + i, 8))[0]) for i in [0x10, 0x30, 0x38, 0x40, 0x48]}
assert slots == {hex(k): hex(functions[v]) for k, v in [(0x10,'OnLevelLoad'),(0x30,'OnStart'),(0x38,'OnEnable'),(0x40,'OnStop'),(0x48,'Update')]}
assert 'mov eax, 0xd8' in n.annotated(functions['size'])
constants = {}
for address, expected in [(0x100aa78c4,1e-5),(0x100aa6a9c,.0001),(0x100aa6aa0,.266),(0x100aa78cc,.999),(0x100aa8600,3.141592653589793),(0x100aa6aa4,6),(0x100aa967c,-15),(0x100aa77dc,10)]:
 raw = n.read(address,4); assert raw == struct.pack('<f',expected)
 constants[hex(address)] = {'bits': raw.hex(), 'float32':struct.unpack('<f',raw)[0]}
report = {
 'executableSha256': n.digest, 'functions': {k:hex(v) for k,v in functions.items()},
 'vptr':'0x100c253f0', 'vtableSlots':slots, 'size':216, 'constants':constants,
 'layout':{'target':56,'targets':64,'objects':72,'finishEvents':80,'timeline':88,'progress01':96,'time':104,'staggeredDelay':108,'dragSoundScale':112,'reverse':116,'transformPos':117,'transformRot':118,'transformScale':119,'continuous':120,'smooth':121,'stepped':122,'completeAtEnd':123,'gotoCurrentTargetTransform':124,'twoPhase':125,'dragSound':128,'playDragSound':152,'elapsed':156,'previousProgress':160,'firstUpdateSkip':164,'initialMatrices':168,'targetMatrices':176,'steppedMatrices':184,'soundHandle':192,'soundId':200,'soundState':208,'resumeEnabled':209,'stopped':210},
 'registrationFunctionBoundaryIncludesNextClass':True,
 'scope':'Original function boundaries/vtable/constants and disassembly evidence. Separate oracle validates finite normal/continuous updates and prepared state dispatch. Complete defaults/registry/TGCL loading, audio, stepped carry, real Timeline, derived target classes, scene and Avatar/BstBaked lifecycles remain dependencies.'}
(root / 'docs' / 'transform-object-native.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report))
