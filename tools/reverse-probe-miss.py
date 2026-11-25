#!/usr/bin/env python3
"""SHA-gated probe miss direction and final display format evidence."""
import hashlib, json, pathlib, sys
from native import Native
n = Native(sys.argv[1])
root = pathlib.Path(__file__).resolve().parent.parent
functions = {'probe-ray-color': 0x100061680, 'display-color-format': 0x100a472a0}
for name, address in functions.items():
    (root/'evidence'/f'color-{name}.asm').write_text(n.annotated(address))
report = {
    'executableSha256': n.digest,
    'missSuffix': {'start': '0x1000624fd', 'atmosphereCall': '0x100062598',
                   'sha256': hashlib.sha256(n.read(0x1000624fd, 0x10006259d-0x1000624fd)).hexdigest(),
                   'direction': 'Y=max(0,Y), unordered Y becomes zero, equal negative zero retained. Normalize XYZ using original RSQRTSS and one float32 Newton step.',
                   'sceneBoundary': 'Normal atmosphere path after the scene query misses; cheap-fog and surface-hit paths remain separate.'},
    'display': {'setter': '0x100a4738f', 'normalMetalPixelFormat': 81,
                'normalFormat': 'BGRA8Unorm_sRGB', 'extendedMetalPixelFormat': 115,
                'extendedFormat': 'RGBA16Float', 'normalTransfer': 'Hardware linear-to-sRGB write. The viewport display transfer must remain enabled.'},
    'scope': 'Original supplied executable and complete disassembly evidence. Prepared miss suffix execution is independently checked in docs/probe-miss-native-check.json. No original scene/GPU/OS image parity claim.'}
(root/'docs/probe-miss-evidence.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
