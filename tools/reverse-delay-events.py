#!/usr/bin/env python3
"""SHA-gated Delay placement, virtual dispatch and default registration evidence."""
import json
import pathlib
import struct
import sys
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
functions = {
    'placement': 0x1002c62f0, 'enable': 0x1002c6410,
    'resume': 0x1002c6420, 'update': 0x1002c6430,
    'registration': 0x1002c6b70, 'size': 0x1002c6240,
    'alignment': 0x1002c6250,
}
vptr = struct.unpack('<Q', n.read(0x100c0d460, 8))[0] + 16
assert vptr == 0x100ca5700
slots = {hex(slot): hex(struct.unpack('<Q', n.read(vptr + slot, 8))[0])
         for slot in range(0, 0x58, 8)}
assert slots['0x30'] == hex(functions['enable'])
assert slots['0x38'] == hex(functions['resume'])
assert slots['0x48'] == hex(functions['update'])
for name, address in functions.items():
    assert n.bounds(address)[0] == address
    (root / 'evidence' / f'delay-event-{name}.asm').write_text(n.annotated(address))
report = {
    'executableSha256': n.digest,
    'functions': {name: hex(address) for name, address in functions.items()},
    'vptr': hex(vptr), 'slots': slots, 'size': 80,
    'waitForBeatDefault': {'registrationSite': '0x1002c6d29..0x1002c6d5f', 'value': False},
    'scope': 'Original disassembly only; execution scope is stated separately in logic-chain-oracle.json.',
}
(root / 'docs' / 'delay-event-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report))
