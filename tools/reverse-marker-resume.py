#!/usr/bin/env python3
"""SHA-gated Marker pool/state and checkpoint-resume execution evidence."""
import json
import pathlib
import struct
import sys
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
functions = {
    'Marker.placement': 0x10043e1b0, 'Marker.SetEnabled': 0x10043cff0,
    'Marker.GetEnabled': 0x10043e2c0, 'Marker.destructor': 0x10043e2a0,
    'Marker.setWrapper': 0x10043e700, 'Marker.getWrapper': 0x10043e820,
    'MarkerBarn.placement': 0x10043eaa0, 'MarkerBarn.Initialize': 0x10043d020,
    'MarkerBarn.CreateMarker': 0x10043d6a0, 'MarkerBarn.ReleaseMarker': 0x10043d7a0,
    'MarkerBarn.OnLevelUnload': 0x10043d030, 'MarkerBarn.Terminate': 0x10043d1d0,
    'ResumeEnable.placement': 0x10058abf0, 'ResumeEnable.Update': 0x10058a9e0,
    'Clump.OnResumeEnabled': 0x10022bba0, 'Clump.resumeWrapper': 0x10022cba0,
    'Enable.OnResumeEnabled': 0x100316400, 'Enable.resumeWrapper': 0x100316df0,
    'ObjectFactory.TryResume': 0x1004d2440,
}
for name, address in functions.items():
    assert n.bounds(address)[0] == address
    (root / 'evidence' / f'marker-resume-{name}.asm').write_text(n.annotated(address))
assert struct.unpack('<QQ', n.read(0x100ac1cc0, 16)) == (48, 176)
vtables = {}
for name, vptr, size in [('Marker', 0x100cc6250, 0x30), ('ResumeEnable', 0x100c19300, 0x58)]:
    vtables[name] = {'vptr': hex(vptr), 'slots': {hex(i): hex(struct.unpack('<Q', n.read(vptr+i, 8))[0]) for i in range(0, size, 8)}}
assert vtables['Marker']['slots']['0x10'] == hex(functions['Marker.GetEnabled'])
assert vtables['ResumeEnable']['slots']['0x48'] == hex(functions['ResumeEnable.Update'])
assert '0x40], sil' in n.annotated(functions['Marker.SetEnabled'])
assert '0x140b0], 0' in n.annotated(functions['MarkerBarn.Initialize'])
registration = n.annotated(0x10043f000)
assert 'Tool_DefaultValue' in registration and ' true' in registration
report = {
    'executableSha256': n.digest,
    'functions': {name: hex(address) for name, address in functions.items()},
    'vtables': vtables,
    'sizes': {'Marker': 80, 'MarkerBarnComparedBytes': 0x140b4, 'ResumeEnable': 64},
    'MarkerObjectSubobjectOffset': 8,
    'MarkerBarnPool': {'capacity': 1024, 'bitmapBytes': 128, 'bitmapOffset': 48, 'dataOffset': 176, 'nextIdOffset': 0x140b0},
    'preparedMissingDefaults': {'Marker.enabled': True},
    'resumeMethod': 'OnResumeEnabled',
    'supportedResumeMethods': {'Clump': hex(functions['Clump.OnResumeEnabled']), 'Enable': hex(functions['Enable.OnResumeEnabled'])},
    'scope': 'Disassembly and vtable/constant assertions. Separate logic-chain oracle executes normal Marker placement/pool create/release/unload/terminate, enabled reflection, ResumeEnable/Clump/Enable checkpoint methods and TryResume. Stable pool traversal only; registry/default/pool bootstrap, metadata casts, Game lookup/conversion, debug streams, exceptions/unwind and Marker transforms/scene rendering remain open.',
}
(root / 'docs' / 'marker-resume-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report))
