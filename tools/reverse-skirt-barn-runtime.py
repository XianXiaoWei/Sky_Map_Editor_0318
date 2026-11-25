#!/usr/bin/env python3
"""Reproduce original address-bounded SkirtBarn and shared Vertex evidence."""
import json
import pathlib
import sys
import struct
from native import Native
n = Native(sys.argv[1])
root = pathlib.Path(__file__).resolve().parent.parent
addresses = [0x1005abf50, 0x1005aca70, 0x1005acaf0, 0x1007f6ae0]
for address in addresses:
    (root / 'evidence' / f'skirt-runtime-{address:x}.asm').write_text(n.annotated(address))
constants = {
    'baseStreamTypes': list(struct.unpack('<7I', n.read(0x100ace160, 28))),
    'skirtDRange': struct.unpack('<f', n.read(0x100aa6aa8, 4))[0],
    'drawDistanceLimit': struct.unpack('<f', n.read(0x100aac96c, 4))[0],
}
report = {'executableSha256': n.digest, 'addresses': [hex(a) for a in addresses],
          'constants': constants, 'scope': 'Disassembly/constants only; execution parity scope is in skirt-barn-oracle.json.'}
(root / 'docs' / 'skirt-barn-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report))
