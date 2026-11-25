#!/usr/bin/env python3
"""Reproduce address-bounded TerrainBarn runtime discovery and evidence.

Disassembly is a discovery record. Only the explicitly scoped oracle reports
claim execution parity; worker bodies, class loading and jobs remain open.
"""
import json
import pathlib
import sys
from native import Native

n = Native(sys.argv[1])
root = pathlib.Path(__file__).resolve().parent.parent
addresses = set(int(p.stem.removeprefix('terrain-runtime-'), 16)
                for p in (root / 'evidence').glob('terrain-runtime-*.asm'))
addresses.update([0x1006a8100, 0x10077e4b0, 0x1006ad3f0])
for address in sorted(addresses):
    (root / 'evidence' / f'terrain-runtime-{address:x}.asm').write_text(n.annotated(address))
reports = {}
for filename in ['terrain-bin-geometry-oracle.json', 'terrain-bin-draw-oracle.json', 'terrain-bin-lifecycle-oracle.json']:
    report = json.loads((root / 'docs' / filename).read_text())
    assert report['executableSha256'] == n.digest
    reports[filename] = {'passed': report['passed'], 'scope': report['scope']}
print(json.dumps({'executableSha256': n.digest, 'boundedDisassemblies': len(addresses), 'reports': reports}))
