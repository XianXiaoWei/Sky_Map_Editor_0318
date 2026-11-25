#!/usr/bin/env python3
"""Recover ModuleBarn order and preconstructed TGCL EnvNode load wiring.
Usage: python3 tools/reverse-environment-load.py /path/to/Sky [--oracle]
The oracle uses explicit metadata/field caches and initialized globals; it does
not run the complete module allocator, TGCL loader, events or game startup.
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
    'module-field-order': 0x1007b02c0,
    'module-build': 0x1007b0620, 'module-function-table': 0x1007b1330,
    'module-callback': 0x1007b17c0, 'module-callback-find': 0x1007b17e0,
    'module-dispatch': 0x1007b1b40, 'env-constructor': 0x10031c720,
    'env-node-constructor': 0x10031c830, 'env-load-queue': 0x1003198d0,
    'env-queue-create': 0x100319d40, 'env-node-load-register': 0x10031acb0,
    'env-create-wrapper': 0x10031cd70, 'game-module-initialize': 0x100376f80,
    'cloud-initialize': 0x100211690,
}
for name, address in functions.items():
    pathlib.Path('evidence', name + '.asm').write_text(n.annotated(address))
pathlib.Path('evidence/module-sort.asm').write_text(n.annotated(0x1007b3dc0, code_end=0x1007b43f4))
functions['module-sort'] = 0x1007b3dc0
pathlib.Path('evidence/tgcl-read-fields.asm').write_text(n.annotated(0x10040b390, code_end=0x10040bbe4))

def require(address, mnemonic, operands):
    code_end = 0x10040bbe4 if n.bounds(address)[0] == 0x10040b390 else None
    ins = next(i for i in n.instructions(address, code_end=code_end) if i.address == address)
    if (ins.mnemonic, ins.op_str) != (mnemonic, operands):
        raise ValueError(f'Unexpected evidence at {address:#x}: {ins.mnemonic} {ins.op_str}')

# Module pointers are sorted by their field storage address, before function
# tables are built. Callback installation replaces a slot; it does not append.
for a, m, o in [
    (0x1007b02c4, 'mov', 'rax, qword ptr [rdi]'),
    (0x1007b02c7, 'mov', 'rax, qword ptr [rax]'),
    (0x1007b02cd, 'cmp', 'rax, qword ptr [rcx]'),
    (0x1007b02d0, 'setb', 'al'),
    (0x1007b0c3f, 'call', '0x1007b3dc0'),
    (0x1007b1596, 'mov', 'qword ptr [rax + rdx], rcx'),
    (0x1007b17ce, 'mov', 'qword ptr [rax + 0x18], rbx'),
    (0x1003777f4, 'mov', 'edx, 1'),
    (0x1003777f9, 'xor', 'ecx, ecx'),
    (0x1003777fe, 'call', '0x1007b1b40'),
    (0x100319d46, 'cmp', 'rax, 0x10'),
    (0x100319d55, 'imul', 'rax, rax, 0x410'),
    (0x100319d5c, 'lea', 'rax, [rdi + rax + 0x2a160]'),
    (0x1003199f7, 'call', '0x10031acb0'),
    (0x10040d0f7, 'call', '0x1004d0b60'),
    (0x10040d14f, 'call', '0x10040b390'),
    (0x10040b9cf, 'call', '0x100aa28f4'),
]: require(a, m, o)
ctor_calls = [i for i in n.instructions(0x10031c720) if i.mnemonic == 'call' and i.op_str == '0x10031c830']
if len(ctor_calls) != 16: raise ValueError('EnvNode pool construction changed')
properties = json.loads(pathlib.Path('docs/native-properties.json').read_text())['Game']
modules = [{ 'name': name, 'gameOffset': properties[name]['nativeOffset'],
             'propertyAddress': properties[name]['propertyAddress'] } for name in ['environment', 'cloudBarn']]
if not modules[0]['gameOffset'] < modules[1]['gameOffset']: raise ValueError('Module order changed')
groups = json.loads(pathlib.Path('docs/environment-runtime.json').read_text())['groups']
# Native callback 0x100376470 registers Ambience + 10/50/1f0/220/250/260,
# then FogVolumeBarn + c. CloudBarn.Initialize registers its +40d70 later.
order = [0, 1, 2, 3, 4, 5, 7, 6]
call_sites = [0x1003764ee, 0x100376502, 0x100376519, 0x100376530,
              0x100376547, 0x10037655e, 0x100376572, 0x1002124a4]
for a in call_sites: require(a, 'call', '0x10031b220')
report = {
    'executableSha256': n.digest, 'functions': {k: hex(v) for k, v in functions.items()},
    'modules': modules, 'moduleOrderRule': 'ascending address of container field storage; callbacks replace existing slots',
    'initializeDispatch': {'groupMask': 1, 'reverse': False, 'callSite': '0x1003777fe'},
    'groups': [{'className': groups[g]['className'], 'globalRegistrationIndex': v,
                'nodeRegistrationIndex': g, 'callSite': hex(call_sites[v])} for v, g in enumerate(order)],
    'queue': {'limit': 16, 'stride': 1040, 'environmentOffset': 0x2a160,
              'countOffset': 0x2e260, 'constructedSlots': len(ctor_calls),
              'creationOrder': 'TGCL serialized node order through ObjectFactory',
              'loadOrder': 'ascending queue index; preserve append order within each layer',
              'resetRule': 'OnLevelLoad clears all default pointers and per-group layer counts, then closes registration and registers the existing queue; queue count and outputs are retained'},
    'defaultsRule': 'TGCL reads serialized properties, then copies cached Tool_DefaultValue records only for properties absent from serialized class declaration',
    'unresolved': ['complete initial Ambience outputs', 'automatic SetEnvDefault/SetEnvHull event dispatch and ordering',
                   'complete module allocator and TGCL factory execution', 'full camera/rendering integration'],
}
pathlib.Path('docs/environment-load.json').write_text(json.dumps(report, indent=2) + '\n')
if '--oracle' not in sys.argv:
    print(json.dumps(report)); sys.exit(0)

# Actual map public storage/masks and independently resolved regions.
inputs = json.loads(subprocess.run(['node_modules/.bin/tsx', 'tools/environment-load-inputs.ts'], check=True, capture_output=True, text=True).stdout)
rng = random.Random(318161)
records = bytearray()
for g in groups:
    size = (max(field['nativeOffset'] + field['bytes'] for field in g['fields']) + 15) & ~15
    records.extend(struct.pack('<3I', g['offsets']['EnvNode'], size, len(g['fields'])))
    for field in g['fields']: records.extend(struct.pack('<3I', field['tag'], field['nativeOffset'], field['bytes']))
cases = []
for level in inputs:
    # Explicit initial output values are test inputs, not recovered game defaults.
    outputs = []
    for g in groups:
        fields = {}
        for field in g['fields']:
            value = rng.randrange(2) if field['tag'] == 11 else rng.uniform(-2, 4)
            raw = struct.pack('<B', value) if field['tag'] == 11 else struct.pack('<I', rng.randrange(4096)) if field['tag'] == 5 else struct.pack('<4f', *[rng.uniform(-2, 4) for _ in range(4)]) if field['bytes'] == 16 else struct.pack('<f', value)
            fields[field['name']] = raw.hex()
        outputs.append(fields)
    frames = []
    # Sample map centers and outside positions; toggle nodes and trigger expiry.
    for i in range(12):
        point = (level['nodes'][i % len(level['nodes'])]['hull']['position'][:3] if level['nodes'] and i < 9 else [10000, 10000, 10000]) + [1]
        frames.append({'delta': [0, .016, .1, 1][i % 4], 'timeScale': .5 if i == 5 else 1,
                       'debugEnabled': i == 6, 'debugScale': .25 if i == 6 else 1,
                       'enabledMask': 0 if i == 8 else (1 << len(level['nodes']))-1 if i == 2 else 0xffffffff,
                       'point': point})
    c = {**level, 'outputs': outputs, 'frames': frames}
    records.extend(struct.pack('<I', len(c['nodes'])))
    for g, fields in zip(groups, outputs):
        for field in g['fields']: records.extend(bytes.fromhex(fields[field['name']]))
    for node in c['nodes']:
        records.extend(bytes.fromhex(node.pop('storageHex')).ljust(report['queue']['stride'], b'\0'))
        records.extend(bytes.fromhex(node.pop('knownHex')).ljust(report['queue']['stride'], b'\0'))
    for frame in frames:
        records.extend(struct.pack('<4fI4f', frame['delta'], frame['timeScale'], frame['debugScale'], int(frame['debugEnabled']), frame['enabledMask'], *frame['point']))
    cases.append(c)
with tempfile.TemporaryDirectory(prefix='sky-env-load-') as temp:
    runner = pathlib.Path(temp, 'oracle')
    subprocess.run(['x86_64-linux-gnu-gcc', '-O2', '-static', 'tools/native-env-load-oracle.c', '-o', str(runner)], check=True)
    result = subprocess.run(['qemu-x86_64', '-cpu', 'max', str(runner), sys.argv[1]], input=records, capture_output=True)
    if result.returncode: raise RuntimeError(f'Load oracle failed ({result.returncode}): {result.stderr.decode(errors="replace")}, bytes={len(result.stdout)}')
at = 0

def take(count):
    global at
    value = result.stdout[at:at+count]; at += count
    if len(value) != count: raise ValueError('Truncated load oracle output')
    return value
native_order = list(struct.unpack('<8I', take(32)))
if native_order != order: raise ValueError(f'Original module sorting disagrees: {native_order}')
for c in cases:
    c['queueOffsets'] = list(struct.unpack(f'<{len(c["nodes"])}I', take(4*len(c['nodes']))))
    c['loadResetHex'] = take(64+128+8).hex()
    for node in c['nodes']:
        node['nativeFields'] = [{field['name']: take(field['bytes']).hex() for field in g['fields']} for g in groups]
        node['nativeInitialStates'] = [take(32).hex() for g in groups]
    for frame in c['frames']:
        frame['outputs'] = [{field['name']: take(field['bytes']).hex() for field in g['fields']} for g in groups]
        frame['states'] = [{'enabled': bool(struct.unpack('<I', take(4))[0]), 'nativeHex': [take(16).hex() for g in groups]} for node in c['nodes']]
if at != len(result.stdout): raise ValueError('Extra oracle output')
pathlib.Path('tests/fixtures/env-load-native.json').write_text(json.dumps({'executableSha256': n.digest, 'globalOrder': native_order, 'cases': cases}, separators=(',', ':')) + '\n')
summary = {'executableSha256': n.digest, 'levels': len(cases), 'nodes': sum(len(c['nodes']) for c in cases), 'groups': len(groups),
           'fields': sum(len(g['fields']) for g in groups), 'frames': sum(len(c['frames']) for c in cases),
           'runtime': 'QEMU x86_64 -cpu max; original module sort/callback installation/forward dispatch, Environment constructor, queue allocation, OnLevelLoad, EnvNode conversion/registration and complete frame update/mix',
           'dependencies': 'explicit synthetic class metadata and full recovered field caches; explicit initial outputs; zero-vector global; original bzero/strncpy/strlen/strcmp imports bound to Linux libc; caches supplied before OnLevelLoad',
           'scope': 'real TGCL public bytes and defaults overlaid on preconstructed queue; excludes native TGCL parser/factory execution, initial cache builder, automatic events and full game initialization'}
pathlib.Path('docs/environment-load-oracle.json').write_text(json.dumps(summary, indent=2) + '\n')
print(json.dumps(summary))
