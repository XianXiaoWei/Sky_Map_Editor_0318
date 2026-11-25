#!/usr/bin/env python3
"""SHA-gated Compositor cloud descriptors and native target dimensions."""
import json, pathlib, struct, subprocess, sys, tempfile
from native import Native

ROOT = pathlib.Path(__file__).resolve().parent.parent
executable = sys.argv[1]
n = Native(executable)
functions = {
    'compositor-outline': 0x10023de50, 'compositor-create': 0x10023d350,
    'target-resources': 0x100243a30, 'outline-resource': 0x1007bc100,
    'outline-resource-alt': 0x1007bc2d0, 'outline-pass': 0x1007bc8b0,
    'outline-quad': 0x1007bcde0, 'outline-end': 0x1007bcbc0,
    'param-texture': 0x1007bb3f0, 'param-group': 0x1007bbe10,
    'metal-cloud-target-format': 0x100a6afc0, 'metal-cloud-target-sampler': 0x100a6aa30,
}
for name, address in functions.items():
    (ROOT/'evidence'/f'{name}.asm').write_text(n.annotated(address))
targets = sorted({i.operands[0].imm for i in n.instructions(0x10023de50)
                  if i.address < 0x10023fcc6 and i.mnemonic == 'call' and i.op_str.startswith('0x')})
format_table = struct.unpack('<22Q', n.read(0x100b066c0, 22*8))
wrap_table = struct.unpack('<4Q', n.read(0x100b066a0, 32))
format_names = {25: 'r16f', 65: 'rg16f', 115: 'rgba16f', 260: 'depth32f-stencil8'}

def decode(raw, width, height):
    def u(at): return struct.unpack_from('<I', raw, at)[0]
    def s(at):
        if raw[at] & 1: raise ValueError('Unexpected allocated libc++ string in captured fixture')
        return raw[at+1:at+1+(raw[at]>>1)].decode()
    resources = []
    for i in range(u(0x1688c)):
        at = 0x16890+i*48
        size, fmt, kind, sampler, *flags = struct.unpack_from('<4I4B', raw, at+24)
        resources.append({'index': i, 'name': s(at), 'size': size, 'formatEnum': fmt,
                          'metalFormat': format_table[fmt], 'format': format_names.get(format_table[fmt]),
                          'kind': kind, 'sampler': sampler, 'flags': flags})
    passes = []
    for i in range(u(0)):
        at = 8+i*240
        colors = []
        for j in range(4):
            target, load, store, *clear = struct.unpack_from('<3I4f', raw, at+32+j*32)
            if target: colors.append({'resource': target, 'loadEnum': load, 'storeEnum': store, 'clear': clear})
        passes.append({'index': i, 'name': s(at), 'colors': colors, 'draws': []})
    quads = []
    for i in range(u(0x3070)):
        at = 0x3078+i*0x3b0
        bindings = []
        for j in range(u(at+28)):
            field = at+40+j*40
            target, sampler, previous = struct.unpack_from('<3I', raw, field+28)
            bindings.append({'name': s(field), 'resource': target, 'samplerOverride': sampler, 'previous': previous})
        quads.append({'kind': 'quad', 'index': i, 'shader': s(at), 'pass': u(at+0x3a8),
                      'group': u(at+24), 'bindings': bindings})
    at = 0x19840
    samplers = []
    for i in range(6):
        fields = struct.unpack_from('<10I', raw, at+i*40)
        samplers.append({'index': i+1, 'fields': fields, 'linear': fields[0] == 2,
                         'metalWrap': [wrap_table[v] for v in fields[3:6]]})
    at += 240
    count = u(at); at += 4
    allocations = []
    for i in range(count):
        name, kind, w, h, fmt, flag0, flag1 = struct.unpack_from('<32s6I', raw, at+i*56)
        allocations.append({'name': name.split(b'\0')[0].decode(), 'kind': kind, 'width': w,
                            'height': h, 'formatEnum': fmt, 'flags': [flag0, flag1]})
    at += count*56
    names = [raw[at+i*36+8:at+(i+1)*36].split(b'\0')[0].decode() for i in range(23)]
    if len(raw) != at+23*36: raise ValueError('Unexpected capture size')
    commands = []; context = None
    for i in range(u(0x18724)):
        kind, index = struct.unpack_from('<II', raw, 0x18728+i*16)
        commands.append([kind, index])
        if kind == 4: context = index
        if kind == 6: passes[quads[index]['pass']]['draws'].append({**quads[index], 'context': context})
        if kind == 5 and index == 20:
            records = [j for j in range(u(0x15788)) if u(0x1578c+j*136) == index]
            if len(records) != 1 or context is None: raise ValueError('Invalid Cloud list command')
            field = 0x1578c+records[0]*136
            states = []
            for j in range(4):
                rgb, alpha, blend, _, *factors = struct.unpack_from('<4B6I', raw, field+8+j*28)
                states.append({'rgbWrite': bool(rgb), 'alphaWrite': bool(alpha), 'blend': bool(blend),
                               'factors': factors[:4], 'operations': factors[4:]})
            depth, cull, *bias, f0, f1, f2, f3 = struct.unpack_from('<II3f4B', raw, 0x17b24+context*24)
            passes[u(field+4)]['draws'].append({'kind': 'list', 'index': index, 'name': names[index],
                'context': context, 'depthState': depth, 'cullEnum': cull, 'bias': bias,
                'flags': [f0, f1, f2, f3], 'colors': states})
    return {'viewport': [width, height], 'resources': resources, 'samplers': samplers,
            'allocations': allocations, 'passes': passes, 'commands': commands}

sizes = [(1,1), (7,5), (16,16), (63,37), (127,73), (128,80), (1921,1081)]
with tempfile.TemporaryDirectory() as directory:
    tmp = pathlib.Path(directory); executable_oracle = tmp/'oracle'; target_file = tmp/'targets.bin'
    target_file.write_bytes(struct.pack('<'+'Q'*len(targets), *targets))
    subprocess.run(['x86_64-linux-gnu-gcc','-O2','-Wall','-Wextra','-Werror',
                    str(ROOT/'tools/native-cloud-graph-oracle.c'),'-o',str(executable_oracle)], check=True)
    captures = []
    for width, height in sizes:
        for alpha in [0, 1]:
            run = subprocess.run(['qemu-x86_64','-L','/usr/x86_64-linux-gnu','-cpu','max',
                str(executable_oracle), executable, str(target_file), str(alpha), str(width), str(height)],
                capture_output=True, timeout=30)
            if run.returncode: raise RuntimeError(run.stderr.decode())
            capture = decode(run.stdout, width, height)
            if alpha == 0: captures.append(capture)
            elif capture != captures[-1]: raise ValueError('Cloud graph unexpectedly depends on alpha capability')
    baseline = captures[0]
    for capture in captures:
        if capture['resources'] != baseline['resources'] or capture['passes'] != baseline['passes']:
            raise ValueError('Native declaration graph unexpectedly changes with viewport')
report = {'executableSha256': n.digest, 'functions': {name: hex(a) for name,a in functions.items()},
    'scope': 'Original Compositor instruction stream through EndRenderPass for Cloud. Original resource/pass/quad/list/binding descriptor writes and six sampler declarations execute. Shader parameter copy, depth-state storage, general setup and GPU allocations use explicit callbacks. Original target allocation loop executes floor division, minimum-one sizing and double-buffer count. Metal format/wrap conversion tables read from executable; no Metal driver/game image acceptance.',
    'stop': {'outlineJump': '0x10023fcc6', 'outlineEpilogue': '0x100241cc8',
             'samplerJump': '0x10023d565', 'samplerEpilogue': '0x10023d8e9',
             'allocationJump': '0x100243dff', 'allocationEpilogue': '0x100244014'},
    'formatTable': {'address': '0x100b066c0', 'values': format_table},
    'wrapTable': {'address': '0x100b066a0', 'values': wrap_table},
    'resources': baseline['resources'], 'samplers': baseline['samplers'],
    'passes': baseline['passes'][7:], 'dimensionCases': [{'viewport': c['viewport'], 'allocations': c['allocations']} for c in captures],
    'capabilityVariants': 2, 'originalGameVerified': False}
(ROOT/'docs/cloud-render-graph.json').write_text(json.dumps(report,indent=2)+'\n')
(ROOT/'tests/fixtures/cloud-graph-native.json').write_text(json.dumps({'sha256': n.digest,
    'resources': baseline['resources'], 'samplers': baseline['samplers'], 'passes': baseline['passes'][7:],
    'dimensions': report['dimensionCases']},indent=2)+'\n')
print(json.dumps({'viewports': len(sizes), 'capabilityVariants': 2, 'cloudPasses': 3,
                  'cloudListAfterFine': baseline['passes'][-1]['draws'][-1]['name'], 'passed': True}))
