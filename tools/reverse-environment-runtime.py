#!/usr/bin/env python3
"""Extract runtime wiring and execute original registration/update/mix chains.

Usage: python3 tools/reverse-environment-runtime.py /path/to/Sky [--oracle]
Synthetic metadata in the oracle supplies one explicitly typed test field.
It does not model unknown original constructor defaults or game initialization.
"""
import json
import pathlib
import random
import struct
import subprocess
import sys
import tempfile
from native import Native

n = Native(sys.argv[1])
functions = {
    'env-initialize': 0x100319840, 'env-level-load': 0x1003198d0,
    'env-register-vars': 0x10031b220, 'env-register-default': 0x10031b2e0,
    'env-register-node': 0x10031acb0, 'env-register-hull': 0x10031b6e0,
    'env-register-level-vars': 0x100376470, 'env-default-event': 0x10031d710,
}
for name, addr in functions.items():
    pathlib.Path('evidence', name + '.asm').write_text(n.annotated(addr))

properties = json.loads(pathlib.Path('docs/native-properties.json').read_text())
groups = []
for index, (name, node, default, hull) in enumerate([
    ('AmbienceSun', 0x200, 0x190, 0x1c0), ('AmbienceSky', 0x240, 0x1d0, 0x200),
    ('AmbienceFog', 0x310, 0x2a0, 0x2d0), ('AmbienceBloom', 0x340, 0x2d0, 0x300),
    ('AmbienceToneMap', 0x370, 0x300, 0x330), ('AmbiencePointLight', 0x380, 0x310, 0x340),
    ('CloudEnvParams', 0x3b0, 0x340, 0x370), ('FogVolumeParams', 0x3b8, 0x348, 0x378),
]):
    fields = []
    for field, prop in sorted(properties[name].items()):
        getter = prop['typeGetter']
        tag = 11 if 'TypeIbE' in getter else 6 if 'TypeIfE' in getter else 5 if 'TypeIjE' in getter else 10 if 'TypeI5ColorE' in getter else 8 if 'Vector3E' in getter else None
        if tag is None:
            raise ValueError(f'Unresolved field type {name}.{field}: {getter}')
        fields.append({'name': field, 'nativeOffset': prop['nativeOffset'], 'tag': tag,
                       'bytes': 1 if tag == 11 else 16 if tag in (8, 10) else 4})
    groups.append({'className': name, 'nodeRegistrationIndex': index,
                   'offsets': {'EnvNode': node, 'SetEnvDefault': default, 'SetEnvHull': hull}, 'fields': fields})

report = {
    'executableSha256': n.digest, 'functions': {k: hex(v) for k, v in functions.items()},
    'groups': groups,
    'limits': {'variables': 8, 'layers': 4, 'hullsPerVariablePerLayer': 96, 'hullStride': 56},
    'entry': {'varsPointer': 0, 'clumpPointer': 8, 'nodePointer': 16, 'falloff': 24,
              'fadeInTime': 28, 'fadeOutTime': 32, 'duration': 36, 'remaining': 40, 'alpha': 44, 'wasEnabled': 48,
              'initialRemaining': 'enabled ? float32(duration + epsilon) : epsilon',
              'initialAlpha': 'duration == 0 ? 1 : 0', 'initialWasEnabled': 'node.enabled'},
    'epsilon': struct.unpack('<f', n.read(0x100aa6a9c, 4))[0],
    'maxFrameDelta': struct.unpack('<f', n.read(0x100aa6aa0, 4))[0],
    'frameDelta': 'clamp(float32(delta * float32(timeScale * optionalDebugScale)), epsilon, maxFrameDelta)',
    'updateOrder': 'registered variable order; layers 0..3; append order within each layer; fade all entries before mixing all variables',
    'defaultRule': 'registered pointer is copied field-by-field with lerp weight 0; absent default retains previous output',
    'levelLoad': 'clears defaults and per-layer counts, closes registration, then registers queued nodes in ascending queue index',
    'unresolved': ['global initialization order of CloudEnvParams relative to the seven Level registrations',
                   'complete object construction (transforms/class IDs and non-serialized state)',
                   'queued node order versus serialized object order', 'Clump hulls and event dispatch'],
}
pathlib.Path('docs/environment-runtime.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')

if '--oracle' not in sys.argv:
    print(json.dumps({'groups': len(groups), 'fields': sum(len(g['fields']) for g in groups)}))
    sys.exit(0)

rng = random.Random(31814)
cases, records = [], bytearray()
formats = ['b', 'B', 'h', 'H', 'i', 'I', 'f', 'd', '4f', '4f', '4f', 'B']
def encode(tag, value):
    return struct.pack('<' + formats[tag], *(value if isinstance(value, list) else [value])).ljust(16, b'\0')
def sample(tag):
    if tag in (8, 9, 10): return [rng.uniform(-2, 3) for _ in range(4)]
    if tag == 11: return rng.randrange(2)
    if tag in (1, 3, 5): return rng.randrange(100)
    if tag in (0, 2, 4): return rng.randrange(-100, 100)
    return rng.uniform(-10, 10)

for tag in range(12):
    for scenario in range(8):
        nv = 1 if scenario < 4 else 2 if scenario < 7 else 8
        nn = [0, 1, 2, 6, 2, 6, 8, 4][scenario]
        output = [encode(tag, sample(tag)).hex() for _ in range(nv)]
        defaults = [encode(tag, sample(tag)).hex() for _ in range(nv)] if scenario % 2 == 0 else None
        records.extend(struct.pack('<5I', tag, nv, nn, 10, int(defaults is not None)))
        for v in range(nv): records.extend(bytes.fromhex(output[v]) + bytes.fromhex(defaults[v]) if defaults else bytes.fromhex(output[v]) + bytes(16))
        nodes = []
        for j in range(nn):
            duration = [0, .03, .5, -.01][j % 4]
            node = {'layer': j % 4, 'enabled': j % 3 != 0, 'falloff': [0, .5, 4][j % 3],
                    'fadeIn': [0, .1, .5][j % 3], 'fadeOut': [.2, 0, 1][j % 3], 'duration': duration,
                    'position': [j*.25, 0, 0, 0], 'quaternion': [0, .70710678, 0, .70710678] if j % 2 else [0, 0, 0, 1],
                    'scale': [2, 4, 6, 0], 'valuesHex': [encode(tag, sample(tag)).hex() for _ in range(nv)]}
            records.extend(struct.pack('<2I16f', node['layer'], int(node['enabled']), node['falloff'], node['fadeIn'], node['fadeOut'], duration,
                                       *node['position'], *node['quaternion'], *node['scale']))
            for value in node['valuesHex']: records.extend(bytes.fromhex(value))
            nodes.append(node)
        frames = []
        for i, delta in enumerate([0, .02, .01, 1, .02, .02, -.1, .266, .001, .02]):
            mask = (1 << nn)-1 if i == 2 else 0 if i == 5 else 0xffffffff
            frame = {'delta': delta, 'timeScale': .5 if i == 6 else 1, 'debugScale': .25 if i == 7 else 1,
                     'debugEnabled': i == 7, 'enabledMask': mask, 'point': [0 if i < 6 else 3, 0, 0, 1]}
            records.extend(struct.pack('<4fI4f', delta, frame['timeScale'], frame['debugScale'], int(frame['debugEnabled']), mask, *frame['point']))
            frames.append(frame)
        cases.append({'tag': tag, 'outputsHex': output, 'defaultsHex': defaults, 'nodes': nodes, 'frames': frames})

with tempfile.TemporaryDirectory(prefix='sky-env-runtime-') as temp:
    runner = pathlib.Path(temp, 'oracle')
    subprocess.run(['x86_64-linux-gnu-gcc', '-O2', '-static', 'tools/native-env-runtime-oracle.c', '-o', str(runner)], check=True)
    result = subprocess.run(['qemu-x86_64', '-cpu', 'max', str(runner), sys.argv[1]], input=records, capture_output=True)
    if result.returncode:
        raise RuntimeError(f'Original runtime oracle failed ({result.returncode}): {result.stderr.decode(errors="replace")}')

at = 0
for case in cases:
    nv, nn = len(case['outputsHex']), len(case['nodes'])
    for node in case['nodes']:
        node['initialNativeHex'] = [result.stdout[at+v*32:at+(v+1)*32].hex() for v in range(nv)]
        at += nv*32
    for frame in case['frames']:
        frame['outputsHex'] = [result.stdout[at+v*16:at+(v+1)*16].hex() for v in range(nv)]; at += nv*16
        states = []
        for j in range(nn):
            enabled = struct.unpack_from('<I', result.stdout, at)[0]; at += 4
            states.append({'enabled': bool(enabled), 'nativeHex': [result.stdout[at+v*16:at+(v+1)*16].hex() for v in range(nv)]}); at += nv*16
        frame['states'] = states
if at != len(result.stdout): raise ValueError('Unexpected runtime output length')
fixture = {'executableSha256': n.digest, 'runtime': 'QEMU x86_64 -cpu max; unmodified original Environment register/default/update/mix functions',
           'dependencies': 'one-field synthetic metadata (identity/size/constructor), explicit initialized inputs, imported bzero bound to memset; original class lookup retained',
           'cases': cases}
pathlib.Path('tests/fixtures/env-runtime-native.json').write_text(json.dumps(fixture, separators=(',', ':')) + '\n')
summary = {k: v for k, v in fixture.items() if k != 'cases'} | {'scenarios': len(cases), 'frames': sum(len(c['frames']) for c in cases), 'registeredEntries': sum(len(c['outputsHex'])*len(c['nodes']) for c in cases)}
pathlib.Path('docs/environment-runtime-oracle.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps(summary))
