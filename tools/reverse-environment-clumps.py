#!/usr/bin/env python3
"""Recover Clump environment semantics and run unmodified native instructions.

Usage: python3 tools/reverse-environment-clumps.py /path/to/Sky [--oracle]
No game files are written. Marker cast and enabled use original metadata/vtables;
full-frame tests explicitly supply parameter group metadata and initial values.
"""
import itertools
import json
import pathlib
import random
import struct
import subprocess
import sys
import tempfile
from native import Native

n = Native(sys.argv[1])
functions = {'env-clump-register': 0x10031b3c0, 'env-clump-fade': 0x10031a450,
             'env-clump-spatial': 0x10031a6f0, 'marker-enabled': 0x10043e2c0,
             'marker-cast': 0x100011cb0, 'marker-object-to-mixin': 0x10043e220,
             'env-create-queue': 0x100319d40, 'tgcl-create-by-name': 0x1004d0b60}
for name, address in functions.items():
    pathlib.Path('evidence', name + '.asm').write_text(n.annotated(address))
pathlib.Path('evidence/marker-full-register.asm').write_text(n.annotated(0x10043f000))
def lea_string(address):
    ins = next(ins for ins in n.instructions(0x10043f000) if ins.address == address)
    if ins.mnemonic != 'lea': raise ValueError('Unexpected Marker default instruction')
    target = ins.address + ins.size + ins.operands[1].mem.disp
    return target, n.string(target)
tag, key = lea_string(0x10043f21d)
value, text = lea_string(0x10043f229)
if key != 'Tool_DefaultValue' or text != 'true': raise ValueError('Marker enabled default changed')
report = {'executableSha256': n.digest, 'functions': {k: hex(v) for k, v in functions.items()},
          'spatialRule': 'max(all direct Marker OBB weights) * temporalAlpha; per-marker enabled does not filter boxes',
          'controlRule': 'first direct Marker enabled byte; expiry writes false to that Marker, shared across parameter groups and hulls',
          'registrationRule': 'nonempty Clump of valid Marker Object references; original checked cast resolves Object* at Marker+8',
          'markerEnabledOffset': 64, 'markerObjectMixinOffset': 8,
          'markerDefaults': {'enabled': {'text': text, 'encodedHex': '01', 'nativeOffset': 64,
              'keyPointer': hex(tag), 'valuePointer': hex(value), 'tagAddress': '0x1020045f0', 'propertyAddress': '0x100cc60d0',
              'storeInstruction': '0x10043f239', 'propertyTagLinkInstruction': '0x10043f253'}},
          'queuedEnvNodeLimit': 16, 'queueStride': 1040,
          'unresolved': ['Level object creation and event dispatch order', 'automatic SetEnvHull event attachment',
                         'initial Ambience output and complete camera environment evaluation']}
pathlib.Path('docs/environment-clumps.json').write_text(json.dumps(report, indent=2) + '\n')
if '--oracle' not in sys.argv:
    print(json.dumps(report)); sys.exit(0)

rng = random.Random(318141)
records = bytearray()
spatial, fades, runtime = [], [], []
def marker(index, enabled=None):
    return {'id': index, 'enabled': rng.choice([True, False]) if enabled is None else enabled,
            'position': [rng.uniform(-4, 4) for _ in range(3)] + [0],
            'quaternion': rng.choice([[0, 0, 0, 1], [0, .70710678, 0, .70710678], [.2, -.3, .4, .5], [0, 0, 0, 0]]),
            'scale': [rng.uniform(.1, 8) for _ in range(3)] + [0]}
def header(mode, markers, timing, state, nv=1, nf=1, tag=6, layer=0):
    records.extend(struct.pack('<6I7f', mode, len(markers), nv, nf, tag, layer,
                               timing['falloff'], timing['fadeIn'], timing['fadeOut'], timing['duration'],
                               state['remaining'], state['alpha'], state['wasEnabled']))
    for m in markers:
        records.extend(struct.pack('<I12f', int(m['enabled']), *m['position'], *m['quaternion'], *m['scale']))
def encode(tag):
    if tag == 6: return struct.pack('<f', rng.uniform(-5, 10)).ljust(16, b'\0').hex()
    if tag == 11: return bytes([rng.randrange(2)]).ljust(16, b'\0').hex()
    return struct.pack('<4f', *[rng.uniform(-3, 5) for _ in range(4)]).hex()

for i in range(720):
    nm = [0, 1, 2, 3, 8, 16][i % 6]
    markers = [marker(j) for j in range(nm)]
    falloff = [0, .0001, .5, 2, 10][i % 5]
    alpha = [0, .00001, .2, .5, 1, 1.7][i % 6]
    point = [rng.uniform(-15, 15) for _ in range(3)] + [1]
    if markers and i % 3 == 0: point = markers[-1]['position'][:3] + [1]
    if markers and i % 7 == 0:
        markers[-1]['quaternion'] = [0, 0, 0, 1]
        point = [markers[-1]['position'][0] + markers[-1]['scale'][0] * .5 + .000005,
                 markers[-1]['position'][1], markers[-1]['position'][2], 1]
    timing = {'falloff': falloff, 'fadeIn': 0, 'fadeOut': 0, 'duration': 0}
    header(0, markers, timing, {'remaining': 0, 'alpha': alpha, 'wasEnabled': False})
    records.extend(struct.pack('<4f', *point))
    spatial.append({'markers': markers, 'falloff': falloff, 'alpha': alpha, 'point': point})

for dt, duration, fade_in, fade_out, enabled, previous in itertools.product(
        [0, .0001, .016, .2], [0, .01, .5, -.01], [0, .2, 1], [0, .4], [False, True], [False, True]):
    markers = [marker(0, enabled), marker(1, not enabled)]
    state = {'remaining': rng.choice([0, .01, .7]), 'alpha': rng.choice([0, .25, 1]), 'wasEnabled': previous}
    timing = {'falloff': 2, 'fadeIn': fade_in, 'fadeOut': fade_out, 'duration': duration}
    header(1, markers, timing, state); records.extend(struct.pack('<fI', dt, 0xffffffff))
    fades.append({'markers': markers, 'timing': timing, 'state': state, 'delta': dt})

for tag, nm, enabled, duration, nv in itertools.product([6, 8, 10, 11], [1, 3, 8], [False, True], [0, .03, .5, -.01], [1, 8]):
    markers = [marker(j, enabled if j == 0 else not enabled) for j in range(nm)]
    layer = len(runtime) % 4
    timing = {'falloff': rng.choice([0, .5, 4]), 'fadeIn': rng.choice([0, .1, .5]), 'fadeOut': rng.choice([0, .2, 1]), 'duration': duration}
    header(2, markers, timing, {'remaining': 0, 'alpha': 0, 'wasEnabled': False}, nv, 10, tag, layer)
    outputs, defaults, values = [], [], []
    for v in range(nv):
        a, b, c = encode(tag), encode(tag), encode(tag)
        outputs.append(a); defaults.append(b); values.append(c); records.extend(bytes.fromhex(a+b+c))
    frames = []
    for i, delta in enumerate([0, .02, .01, 1, .02, .02, -.1, .266, .001, .02]):
        mask = (1 << nm)-1 if i == 2 else 0 if i == 5 else 0xffffffff
        point = markers[-1]['position'][:3] + [1] if i < 6 else [9, 0, 0, 1]
        frame = {'delta': delta, 'timeScale': .5 if i == 6 else 1, 'debugScale': .25 if i == 7 else 1,
                 'debugEnabled': i == 7, 'enabledMask': mask, 'point': point}
        records.extend(struct.pack('<4fI4f', delta, frame['timeScale'], frame['debugScale'], int(frame['debugEnabled']), mask, *point)); frames.append(frame)
    runtime.append({'tag': tag, 'markers': markers, 'layer': layer, 'timing': timing,
                    'outputsHex': outputs, 'defaultsHex': defaults, 'valuesHex': values, 'frames': frames})

with tempfile.TemporaryDirectory(prefix='sky-env-clumps-') as temp:
    runner = pathlib.Path(temp, 'oracle')
    subprocess.run(['x86_64-linux-gnu-gcc', '-O2', '-static', 'tools/native-env-clump-oracle.c', '-o', str(runner)], check=True)
    result = subprocess.run(['qemu-x86_64', '-cpu', 'max', str(runner), sys.argv[1]], input=records, capture_output=True)
    if result.returncode:
        raise RuntimeError(f'Clump oracle failed ({result.returncode}), bytes={len(result.stdout)}: {result.stderr.decode(errors="replace")}')
at = 0
def take(size):
    global at
    value = result.stdout[at:at+size]; at += size
    if len(value) != size: raise ValueError('Truncated original oracle output')
    return value
for c in spatial: c['outHex'] = take(4).hex()
for c in fades: c['outHex'] = take(16).hex()
for c in runtime:
    nv = len(c['outputsHex']); c['initialNativeHex'] = [take(32).hex() for _ in range(nv)]
    for frame in c['frames']:
        frame['outputsHex'], frame['statesHex'] = [], []
        for v in range(nv): frame['outputsHex'].append(take(16).hex()); frame['statesHex'].append(take(16).hex())
        frame['enabled'] = bool(struct.unpack('<I', take(4))[0])
if at != len(result.stdout): raise ValueError('Unexpected original oracle output length')
fixture = {'executableSha256': n.digest, 'spatial': spatial, 'fades': fades, 'runtime': runtime}
pathlib.Path('tests/fixtures/env-clump-native.json').write_text(json.dumps(fixture, separators=(',', ':')) + '\n')
summary = {'executableSha256': n.digest, 'runtime': 'QEMU x86_64 -cpu max; unmodified original Clump registration, Marker casts/enabled, spatial, fade, complete update and mix',
           'dependencies': 'explicit initialized Marker storage/class registry; original Object/Marker metaclass vtables; one-field synthetic parameter metadata; imported bzero bound to memset',
           'spatialCases': len(spatial), 'fadeCases': len(fades), 'scenarios': len(runtime), 'frames': sum(len(c['frames']) for c in runtime)}
pathlib.Path('docs/environment-clump-oracle.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps(summary))
