#!/usr/bin/env python3
"""SHA-gated Marker transforms, OBB and ObjectFactory matrix-call evidence."""
import json
import pathlib
import struct
import sys
from native import Native
root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
functions = {
    'Marker.SetTransform': 0x10043ccd0, 'Marker.GetTransform': 0x10043e2d0,
    'Marker.LocalObb': 0x10043e470, 'Marker.WorldObb': 0x10043e4b0,
    'Marker.setTransformWrapper': 0x10043e520, 'Marker.getMatrixWrapper': 0x10043e640,
    'Obb.Transform': 0x100076df0,
    'ObjectFactory.SetTransform': 0x1004d1d50, 'ObjectFactory.GetTransform': 0x1004d1e40,
    'ObjectFactory.GetObb': 0x1004d2140, 'ObjectFactory.Extents': 0x1004d2260,
}
for name, address in functions.items():
    assert n.bounds(address)[0] == address
    (root / 'evidence' / f'marker-transform-{name}.asm').write_text(n.annotated(address))
constants = {hex(a): list(struct.unpack('<4I', n.read(a, 16))) for a in [0x100aa7900, 0x100aa78f0, 0x100ab25e0, 0x100aa8a00, 0x100aa80a0, 0x100aa8a30]}
assert constants['0x100aa7900'] == [0x80000000] * 4
assert constants['0x100aa78f0'] == [0, 0x3f000000, 0, 0]
assert constants['0x100ab25e0'] == [0, 0, 0x3f000000, 0]
assert constants['0x100aa8a00'] == [0, 0, 0, 0x3f800000]
assert struct.unpack('<I', n.read(0x100aa78c4, 4))[0] == 0x3727c5ac
assert struct.unpack('<I', n.read(0x100aa45b8, 4))[0] == 0x3f000000
assert struct.unpack('<I', n.read(0x100aa50c0, 4))[0] == 0x3f800000
slots = {hex(i): hex(struct.unpack('<Q', n.read(0x100cc6250 + i, 8))[0]) for i in [0x18, 0x20, 0x28]}
assert slots == {'0x18': '0x10043e2d0', '0x20': '0x10043e470', '0x28': '0x10043e4b0'}
registration = n.annotated(0x10043f000)
assert 'mov ecx, 0x19' in registration and 'mov esi, 0x21' in registration
assert '0x10043e520' in registration and '0x10043e640' in registration
assert '!isNan( mat )' in n.annotated(functions['Marker.SetTransform'])
report = {
    'executableSha256': n.digest, 'functions': {k: hex(v) for k, v in functions.items()},
    'vtableSlots': slots, 'registeredGetTransformMember': '0x19', 'registeredGetObbMember': '0x21',
    'epsilonBits': '0x3727c5ac', 'constantBits': constants,
    'layout': {'MarkerBytes': 80, 'position': 16, 'quaternion': 32, 'scale': 48, 'enabled': 64, 'matrixBytes': 64, 'extentBytes': 12},
    'scope': 'Disassembly, registration/vtable and exact constant assertions; separate oracle executes original bodies. Finite arithmetic with default rounding/gradual underflow, all 16-lane NaN validation before writes, axis-wise normalization, scale lengths, original quaternion sign/permutation and pairwise reduction, local half OBB/world OBB/reflected extents. Matrix conversions/casts/registry bootstrap and cached method lookup are explicit dependencies; non-finite intermediates, NaN payload/MXCSR variants, derived virtual methods, scene and full Avatar/game lifecycle remain open.',
}
(root / 'docs' / 'marker-transform-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report))
