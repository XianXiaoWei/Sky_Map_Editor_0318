"""SHA-gated whole-body evidence for the Objects -> Avatar physical/camera join."""
import hashlib
import json
import pathlib
import struct
import sys
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
entries = {
    'AvatarPhysical.SetPosition': 0x100146de0,
    'AvatarPhysical.SetPositionImmediate': 0x1001480d0,
    'Avatar.eulerToForward': 0x100147510,
    'AvatarBarn.IsLocalReady': 0x1000fe060,
}
functions = []
for name, address in entries.items():
    start, end = n.bounds(address)
    assert start == address
    file = f'evidence/avatar-state-{address:x}.asm'
    (root / file).write_text(n.annotated(address))
    functions.append({'name': name, 'address': hex(start), 'end': hex(end),
                      'instructions': len(n.instructions(address)),
                      'sha256': hashlib.sha256(n.read(start, end - start)).hexdigest(),
                      'evidence': file})
report = {
    'executableSha256': n.digest,
    'functions': functions,
    'constants': [{'address': hex(a), 'bytes': n.read(a, 4).hex(),
                   'float32': struct.unpack('<f', n.read(a, 4))[0]}
                  for a in [0x100ac185c, 0x100aa85b0]],
    'runtimeInputs': {
        '0x1020041f0': 'Runtime vec4 offset axis, not a recovered file default',
        'physicalState+0xe4': 'Float scalar; constructor and semantic owner unresolved',
        '0x100d31e54': 'Runtime BSS camera word; explicitly supplied by snapshot',
        'Game+0x70 -> +4': 'Runtime game tick; explicitly supplied by snapshot',
    },
    'oracle': 'docs/avatar-physical-oracle.json',
    'scope': 'Evidence for whole physical setters, Euler-forward and readiness. Whole Whisker initializer/reset evidence is in avatar-camera-native.json. Byte oracle supplies runtime globals, libm/packed ABI and handhold/leader services. Complete physical construction, continuous camera and full Avatar runtime remain unresolved.',
}
(root / 'docs/avatar-physical-native.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
print(json.dumps({'functions': len(functions), 'sha256': n.digest}))
