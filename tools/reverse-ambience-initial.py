#!/usr/bin/env python3
"""Extract verified Ambience.Initialize field stores, not full initialization.
Usage: python3 tools/reverse-ambience-initial.py /path/to/original/Sky
Run ambience-initial-check.ts separately to execute the original prefix.
"""
import json
import pathlib
import sys
from native import Native

n = Native(sys.argv[1])
writes = []
for offset, address in [
    (0x30, 0x100aa7e30), (0x60, 0x100aa7e40), (0x70, 0x100aa7e50),
    (0x80, 0x100aa7e60), (0x90, 0x100aa7e70), (0xa0, 0x100aa7e80),
    (0xc0, 0x100aa7e40), (0xd0, 0x100aa7e50), (0xe0, 0x100aa7e60),
    (0xf0, 0x100aa7e70), (0x100, 0x100aa7e80), (0x1f4, 0x100aa7e90),
    (0x230, 0x100aa7ea0), (0x240, 0x100aa7eb0), (0x270, 0x100aa7ec0),
]:
    writes.append({'offset': offset, 'hex': n.read(address, 16).hex(), 'constantAddress': hex(address)})
for offset, value, size in [
    (0x40, 0x3f00000000000000, 8), (0xb0, 0x3f800000, 4), (0x110, 0, 1),
    (0x204, 0x3f4ccccd453b8000, 8), (0x20c, 0x3f00000039b08727, 8),
    (0x214, 0, 4), (0x254, 0x3f800000, 4), (0x280, 0x42c80000, 4),
]:
    writes.append({'offset': offset, 'hex': value.to_bytes(size, 'little').hex(), 'immediate': True})
bases = {'AmbienceSun': 0x10, 'AmbienceSky': 0x50, 'AmbienceFog': 0x1f0,
         'AmbienceBloom': 0x220, 'AmbienceToneMap': 0x250, 'AmbiencePointLight': 0x260}
runtime = json.loads(pathlib.Path('docs/environment-runtime.json').read_text())
groups = [dict(className=g['className'], offset=bases[g['className']], fields=g['fields'])
          for g in runtime['groups'] if g['className'] in bases]
report = {
    'executableSha256': n.digest, 'function': '0x100059a50',
    'scope': 'Ambience initialized environment fields before resource creation; six groups only, not complete game initialization',
    'codeRange': ['0x100059a50', '0x100059c4c'], 'writes': writes,
    'sunColor': {'offset': 0x20, 'globalAddress': '0x10203f6b0', 'requiredInput': True},
    'qualityBranch': {'address': '0x100059c37', 'settingsOffset': 0x210,
                      'zeroWrites': {'offset': 0x240, 'hex': 'aaaa2a3e'}},
    'groups': groups,
    'unresolved': ['original global Color initialization', 'FogVolumeParams and CloudEnvParams initialization',
                   'SetEnvDefault/SetEnvHull and startup event dispatch', 'derived sunlight, sky/probe, camera and compositor'],
}
pathlib.Path('docs/ambience-initial-fields.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({'groups': len(groups), 'fields': sum(len(g['fields']) for g in groups)}))
