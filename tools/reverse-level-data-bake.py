#!/usr/bin/env python3
"""SHA-gated LevelData Mesh.bin loader instruction subchain evidence."""
import json
import pathlib
import sys
from native import Native

n = Native(sys.argv[1])
start, end = n.bounds(0x1003f4dfa)
lines = n.annotated(start).splitlines()
ranges = [(0x1003f4b7b, 0x1003f4f67)]
selected = [line for line in lines if any(a <= int(line.split(':', 1)[0], 16) < b for a, b in ranges)]
pathlib.Path('evidence/level-data-bake-load.asm').write_text('\n'.join(selected) + '\n')
report = {
    'executableSha256': n.digest, 'function': hex(start), 'endExclusive': hex(end),
    'restoredSubchains': ['0x1003f4c63..0x1003f4c6e', '0x1003f4db5..0x1003f4f67'],
    'nativeOracleReturn': '0x1003f4d99',
    'record': {'stride': 48, 'guid': 24, 'lodCount': 28, 'uniform': 32, 'lodPointer': 40},
    'loadedLod': {'stride': 24, 'renderVertexCount': 0, 'opaqueByteCount': 4, 'lightingPointer': 8, 'opaquePointer': 16},
    'meshLod': {'stride': 184, 'renderVertexCount': 52, 'sampleCount': 64, 'remapPointer': 152},
    'rules': ['Absent named resource invalidates GUID to uint32 0xffffffff',
              'Sample count mismatch/absent mesh still consumes light and opaque bytes, then clears all 24 loaded LOD bytes',
              'Compatible opaque bytes remain level-heap owned; remap comes from Mesh resource, not this opaque block',
              'Uniform uses sample zero; non-uniform reads uint32 remap; writes last 4 then first 8 bytes per render vertex'],
    'scope': 'Stable prepared serializer/resource/heap inputs, instruction subchains only. Full LevelData loading/unloading and async IO, resource lookup/Observe/asserts, unchecked invalid LOD/remap memory, allocation failure/unwind and bake generation remain unverified.'
}
pathlib.Path('docs/level-data-bake-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({'function': hex(start), 'evidenceInstructions': len(selected)}))
