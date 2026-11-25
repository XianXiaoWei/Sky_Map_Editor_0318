#!/usr/bin/env python3
"""SHA-gated FloatSplit and OnFloat body, vtable and comparison evidence."""
import json
import pathlib
import struct
import sys
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
functions = {
    'FloatSplit.placement': 0x100717a10,
    'FloatSplit.update': 0x100717b20,
    'OnFloat.placement': 0x100719e20,
    'OnFloat.destructor': 0x100719f20,
    'OnFloat.update': 0x100719fc0,
    'OnFloat.evaluate': 0x10071a140,
    'OnFloat.toObject': 0x100719e80,
    'OnFloat.fromObject': 0x100719ea0,
}
for name, address in functions.items():
    assert n.bounds(address)[0] == address
    (root / 'evidence' / f'float-condition-{name}.asm').write_text(n.annotated(address))
vtables = {}
for name, slot, expected in [('FloatSplit', 0x100c0a5e8, 0x100d0c298),
                             ('OnFloat', 0x100c0d4d0, 0x100d0d3f8)]:
    vptr = struct.unpack('<Q', n.read(slot, 8))[0] + 16
    assert vptr == expected
    slots = {hex(offset): hex(struct.unpack('<Q', n.read(vptr + offset, 8))[0])
             for offset in range(0, 0x58, 8)}
    assert slots['0x48'] == hex(functions[f'{name}.update'])
    vtables[name] = {'vptr': hex(vptr), 'slots': slots}
epsilon = struct.unpack('<d', n.read(0x100aa6ac0, 8))[0]
assert epsilon == 0.0001
report = {
    'executableSha256': n.digest,
    'functions': {name: hex(address) for name, address in functions.items()},
    'vtables': vtables,
    'sizes': {'FloatSplit': 72, 'OnFloat': 192},
    'OnFloatObjectSubobjectOffset': 8,
    'OnFloatPointerFixupAdjustment': 8,
    'comparisonEpsilon': {'address': '0x100aa6ac0', 'type': 'double', 'value': epsilon},
    'comparisonOperators': {'0': '>', '1': '>=', '2': '<', '3': '<=', '4': 'abs(float32(lhs-rhs)) < epsilon'},
    'booleanOperators': {'0': 'first', '1': 'and', '2': 'or', 'other': False},
    'scope': 'Original disassembly and constant/vtable assertions only. OnFloat normal paths execute in the separate logic-chain oracle; stream, exception and allocation services remain explicit.',
}
(root / 'docs' / 'float-condition-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report))
