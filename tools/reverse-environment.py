#!/usr/bin/env python3
"""Recover Environment field mixing and Ambience uniform registration evidence.

Usage: python3 tools/reverse-environment.py /path/to/Sky [--oracle]
--oracle additionally executes the original pure interpolation routine through
QEMU x64 and generates regression fixtures. It requires the cross GCC toolchain.
"""
import json
import pathlib
import random
import struct
import subprocess
import sys
import tempfile
from native import Native
from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_OP_REG, X86_REG_RIP

n = Native(sys.argv[1])
out = pathlib.Path('docs'); evidence = pathlib.Path('evidence')
out.mkdir(exist_ok=True); evidence.mkdir(exist_ok=True)
functions = [
    ('env-registration', 0x10031e7c0, None),
    ('env-update', 0x100319a30, None),
    ('env-field-types', 0x100319d90, None),
    # Inline jump table occupies 0x10031a420..0x10031a450; not instructions.
    ('env-field-lerp', 0x10031a230, 0x10031a420),
    ('env-fade', 0x10031a450, None),
    ('env-spatial-weight', 0x10031a6f0, None),
    ('env-layer-blend', 0x10031aec0, None),
    ('ambience-uniform-bind', 0x100059a50, None),
    ('ambience-update', 0x10005aa10, None),
    ('global-uniform-bind', 0x100793f30, None),
    ('global-uniform-bind-texture', 0x100794050, None),
    ('envnode-vars-convert', 0x10031bb10, None),
    ('envdefault-vars-convert', 0x10031be30, None),
    ('envhull-vars-convert', 0x10031c050, None),
]
for name, start, end in functions:
    (evidence / (name + '.asm')).write_text(n.annotated(start, end))

tags = ['int8', 'uint8', 'int16', 'uint16', 'int32', 'uint32', 'float32', 'float64', 'Vector3', 'Vector4', 'Color', 'bool']
jump = [hex(0x10031a420 + delta) for delta in struct.unpack('<12i', n.read(0x10031a420, 48))]

# Recover straight-line bit-preserving transfers independently of class names.
# Derived arithmetic fields are specified from their explicit instruction chains.
layouts = {}
for cls, address, density_src, density_dst, near, far, inverse, volume, volume_dst in [
    ('EnvNode', 0x10031bb10, 0x134, 0x314, 0x14c, 0x150, 0x32c, 0x1f8, 0x3bc),
    ('SetEnvDefault', 0x10031be30, 0x130, 0x2a4, 0xc8, 0xcc, 0x2bc, 0x188, 0x34c),
    ('SetEnvHull', 0x10031c050, 0x160, 0x2d4, 0xf8, 0xfc, 0x2ec, 0x1b8, 0x37c),
]:
    regs, copies, constants = {}, [], []
    def canonical(reg):
        return {'eax': 'rax', 'al': 'rax', 'ecx': 'rcx', 'edx': 'rdx'}.get(reg, reg)
    for ins in n.instructions(address):
        ops = ins.operands
        if len(ops) != 2 or ins.mnemonic not in ('mov', 'vmovaps', 'vmovups', 'vmovss', 'vmovd'):
            if ops and ops[0].type == X86_OP_REG and ins.mnemonic not in ('push', 'pop', 'cmp', 'vucomiss'):
                regs.pop(canonical(ins.reg_name(ops[0].reg)), None)
            continue
        dst, src = ops
        if dst.type == X86_OP_REG:
            reg = canonical(ins.reg_name(dst.reg)); regs.pop(reg, None)
            if src.type == X86_OP_MEM and ins.reg_name(src.mem.base) == 'rdi':
                regs[reg] = src.mem.disp
            elif src.type == X86_OP_REG and canonical(ins.reg_name(src.reg)) in regs:
                regs[reg] = regs[canonical(ins.reg_name(src.reg))]
        elif dst.type == X86_OP_MEM and ins.reg_name(dst.mem.base) == 'rdi':
            if src.type == X86_OP_REG and canonical(ins.reg_name(src.reg)) in regs:
                copies.append({'from': regs[canonical(ins.reg_name(src.reg))], 'to': dst.mem.disp, 'bytes': dst.size})
            elif src.type == X86_OP_IMM:
                constants.append({'to': dst.mem.disp, 'bytes': dst.size, 'value': src.imm})
    layouts[cls] = {'function': hex(address), 'storageBytes': 1024, 'copies': copies, 'constants': constants,
                    'density': {'from': density_src, 'to': density_dst, 'scale': struct.unpack('<f', n.read(0x100aa85b0, 4))[0]},
                    'fogInverse': {'near': near, 'far': far, 'to': inverse},
                    'volume': {'from': volume, 'to': volume_dst, 'positiveFlag': volume_dst+10, 'enabledFlag': volume_dst+8}}
(out / 'environment-layouts.json').write_text(json.dumps({'executableSha256': n.digest, 'layouts': layouts}, indent=2) + '\n')

# Uniform registrations are straight-line instructions after the restored
# Ambience base pointer at 0x10005a2f4. Track only confirmed pointers and counts.
stack_sources = {0x38: 0x20, 0x40: 0x38, 0x48: 0xb0, 0x50: 0x1f4, 0x58: 0x200, 0x60: 0x210}
name, source, components, bindings = None, None, None, []
for ins in n.instructions(0x100059a50):
    if ins.address < 0x10005a425:
        continue
    ops = ins.operands
    if ins.mnemonic == 'lea' and len(ops) == 2 and ops[0].type == X86_OP_REG and ops[1].type == X86_OP_MEM:
        reg, mem = ins.reg_name(ops[0].reg), ops[1].mem
        if reg == 'rsi' and mem.base == X86_REG_RIP:
            name = n.string(ins.address + ins.size + mem.disp)
        elif reg == 'rdx':
            source = {'owner': 'Ambience', 'nativeOffset': mem.disp} if ins.reg_name(mem.base) == 'r13' else None
    elif ins.mnemonic == 'mov' and len(ops) == 2 and ops[0].type == X86_OP_REG:
        reg = ins.reg_name(ops[0].reg)
        if reg == 'ecx' and ops[1].type == X86_OP_IMM:
            components = ops[1].imm
        elif reg == 'rdx':
            source = None
            if ops[1].type == X86_OP_MEM:
                mem = ops[1].mem
                if ins.reg_name(mem.base) == 'rsp' and mem.disp in stack_sources:
                    source = {'owner': 'Ambience', 'nativeOffset': stack_sources[mem.disp]}
    elif ins.mnemonic == 'xor' and ins.op_str == 'ecx, ecx':
        components = 0
    elif ins.mnemonic == 'call':
        target = ops[0].imm if ops[0].type == X86_OP_IMM else None
        if target in (0x100793f20, 0x100794050):
            if not name or not name.startswith('u_') or components is None:
                raise ValueError(f'Unresolved uniform registration at {ins.address:#x}')
            bindings.append({'name': name, 'kind': 'numeric' if target == 0x100793f20 else 'texture',
                             'components': components if target == 0x100793f20 else 1,
                             'source': source, 'registrationCall': hex(ins.address),
                             'valueStatus': 'runtime computation not yet fully reproduced'})
            name, source, components = None, None, None

report = {
    'executableSha256': n.digest, 'functionBoundarySource': 'Mach-O LC_FUNCTION_STARTS',
    'nativeFunctionCount': len(n.starts),
    'interpolation': {'function': '0x10031a230', 'tableAddress': '0x10031a420',
                      'types': [{'tag': i, 'name': tag, 'target': jump[i]} for i, tag in enumerate(tags)],
                      'float32': 'round32((round32(1-t)*a) + (t*b)), round each multiply separately',
                      'Vector3': 'a+(b-a)*[t,t,t,0], round each float32 instruction',
                      'Vector4': 'a+(b-a)*t, round each float32 instruction',
                      'Color': 'Vector4 interpolation with t clamped to [0,1]',
                      'bool': 'pick a when t<0.5 or unordered, otherwise pick b'},
    'layerMix': {'function': '0x10031aec0', 'layers': 4, 'order': 'ascending',
                 'minimumWeight': struct.unpack('<f', n.read(0x100aa6a9c, 4))[0],
                 'rule': 'per-layer incremental weighted mean using weight/cumulativeWeight; blend output with mean using min(1,cumulativeWeight)',
                 'unresolved': ['exact registration/node traversal order', 'full event and fade lifecycle', 'all spatial/hull weight dependencies']},
    'uniformStorage': {'function': '0x100793f30', 'maxUniforms': 128, 'recordStride': 56,
                       'nameCapacityBytes': 28, 'sourcePointerOffset': 32, 'auxOffset': 40,
                       'kindOffset': 48, 'componentCountOffset': 52,
                       'duplicateRule': 'same name replaces source pointer and metadata in its existing slot'},
    'ambienceUniforms': bindings,
    'incomplete': ['complete environment evaluation for a camera', 'atmosphere/probe generation', 'GPU upload and original rendered output'],
}
(out / 'environment-evidence.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')

if '--oracle' in sys.argv:
    weights = [-.25, 0, .0001, .125, .25, .49999, .5, .50001, .75, 1, 1.25]
    scalar_pairs = {
        0: [(-128, 127), (-7, 4), (0, 1)], 1: [(0, 255), (251, 4), (0, 1)],
        2: [(-32768, 32767), (-700, 400), (0, 1)], 3: [(0, 65535), (65000, 4), (0, 1)],
        4: [(-2147483648, 2147483647), (-700000, 400000), (0, 1)],
        5: [(0, 4294967295), (4294967200, 4), (0, 1)],
        6: [(-1e20, 1e20), (2, 6), (.2, .7)],
        7: [(-1e100, 1e100), (1.0000000000001, 2.0000000000001), (.2, .7)],
        11: [(0, 1), (1, 0), (1, 1)],
    }
    formats = ['b', 'B', 'h', 'H', 'i', 'I', 'f', 'd']
    cases, records = [], bytearray()
    for tag in range(12):
        pairs = scalar_pairs.get(tag, [([1, 2, 3, 7], [9, 8, 6, 11]),
                                       ([.2, -.7, .5, 1], [.7, .6, -.3, .25]),
                                       ([1e20, 1e-20, -1, 0], [-1e20, 2e-20, 1, 1])])
        fmt = '<' + (formats[tag] if tag < 8 else 'B' if tag == 11 else '4f')
        for av, bv in pairs:
            a = struct.pack(fmt, *(av if isinstance(av, list) else [av])).ljust(16, b'\0')
            b = struct.pack(fmt, *(bv if isinstance(bv, list) else [bv])).ljust(16, b'\0')
            for weight in weights:
                w = struct.pack('<f', weight)
                records.extend(struct.pack('<II', tag, 0) + w + bytes(4) + a + b)
                cases.append({'tag': tag, 'weightHex': w.hex(), 'aHex': a.hex(), 'bHex': b.hex()})
    with tempfile.TemporaryDirectory(prefix='sky-native-') as temp:
        runner = pathlib.Path(temp) / 'lerp-oracle'
        subprocess.run(['x86_64-linux-gnu-gcc', '-O2', '-static', 'tools/native-lerp-oracle.c', '-o', str(runner)], check=True)
        result = subprocess.run(['qemu-x86_64', '-cpu', 'max', str(runner), sys.argv[1]], input=records, capture_output=True, check=True)
        spatial, spatial_records = [], bytearray()
        rng = random.Random(318)
        transforms = [([0, 0, 0], [0, 0, 0, 1], [2, 4, 6]),
                      ([7, -4, 2], [0, .70710678, 0, .70710678], [2, 3, 4]),
                      ([1, 2, 3], [.2, .3, -.4, .5], [5, 2, 1])]
        for pos, quat, scale in transforms:
            points = [pos, [pos[0]+scale[0]/2, pos[1], pos[2]],
                      [pos[0]+scale[0]/2+.000005, pos[1], pos[2]],
                      [pos[0]+scale[0]/2+.00002, pos[1], pos[2]],
                      [pos[0]+scale[0]/2+.5, pos[1], pos[2]],
                      [pos[0]+scale[0], pos[1]+scale[1], pos[2]+scale[2]]]
            points += [[pos[i] + rng.uniform(-scale[i]*2, scale[i]*2) for i in range(3)] for _ in range(8)]
            for point in points:
                for falloff in [0, .5, 2]:
                    for alpha in [0, .25, 1]:
                        values = pos + [0] + quat + scale + [0] + point + [0] + [falloff, alpha]
                        encoded = struct.pack('<18f', *values)
                        spatial_records.extend(encoded); spatial.append({'inputHex': encoded.hex()})
        spatial_result = subprocess.run(['qemu-x86_64', '-cpu', 'max', str(runner), sys.argv[1], '--spatial'], input=spatial_records, capture_output=True, check=True)
        if len(spatial_result.stdout) != 4 * len(spatial):
            raise ValueError('Native spatial oracle output length mismatch')
        for i, case in enumerate(spatial):
            case['outHex'] = spatial_result.stdout[i*4:(i+1)*4].hex()
        fades, fade_records = [], bytearray()
        for fade_in, fade_out, duration in [(0, 0, 0), (.5, 1, 0), (.5, 1, 2), (-1, -.5, 1)]:
            for remaining in [0, .005, .5, 3]:
                for alpha in [0, .5, 1]:
                    for enabled, was_enabled in [(0, 0), (1, 0), (1, 1), (0, 1)]:
                        for delta in [.001, .02, .266]:
                            encoded = struct.pack('<8f', delta, fade_in, fade_out, duration, remaining, alpha, enabled, was_enabled)
                            fade_records.extend(encoded); fades.append({'inputHex': encoded.hex()})
        fade_result = subprocess.run(['qemu-x86_64', '-cpu', 'max', str(runner), sys.argv[1], '--fade'], input=fade_records, capture_output=True, check=True)
        if len(fade_result.stdout) != 16 * len(fades):
            raise ValueError('Native fade oracle output length mismatch')
        for i, case in enumerate(fades):
            case['outHex'] = fade_result.stdout[i*16:(i+1)*16].hex()
        conversions, conversion_records = [], bytearray()
        for tag, (cls, layout) in enumerate(layouts.items()):
            for sample, intensity in enumerate([0, -.0, .0001, -.0001, 1, -1]):
                storage = bytearray((i * 17 + sample * 31) & 255 for i in range(1024))
                for offset, value in [(layout['density']['from'], sample * .25), (layout['fogInverse']['near'], 1), (layout['fogInverse']['far'], 1 if sample == 0 else 3), (layout['volume']['from'], intensity)]:
                    struct.pack_into('<f', storage, offset, value)
                conversion_records.extend(struct.pack('<I', tag) + storage)
                conversions.append({'className': cls, 'inputHex': storage.hex()})
        conversion_result = subprocess.run(['qemu-x86_64', '-cpu', 'max', str(runner), sys.argv[1], '--vars'], input=conversion_records, capture_output=True, check=True)
        if len(conversion_result.stdout) != 1024 * len(conversions):
            raise ValueError('Native vars conversion output length mismatch')
        for i, case in enumerate(conversions):
            case['outHex'] = conversion_result.stdout[i*1024:(i+1)*1024].hex()
    if len(result.stdout) != 16 * len(cases):
        raise ValueError('Native oracle output length mismatch')
    for i, case in enumerate(cases):
        case['outHex'] = result.stdout[i * 16:(i + 1) * 16].hex()
    fixture = {'executableSha256': n.digest, 'function': '0x10031a230', 'runtime': 'QEMU x86_64 -cpu max; original unmodified machine code', 'cases': cases}
    dest = pathlib.Path('tests/fixtures/env-lerp-native.json'); dest.parent.mkdir(exist_ok=True)
    dest.write_text(json.dumps(fixture, separators=(',', ':')) + '\n')
    spatial_fixture = {'executableSha256': n.digest, 'function': '0x10031a6f0', 'runtime': fixture['runtime'], 'cases': spatial}
    pathlib.Path('tests/fixtures/env-spatial-native.json').write_text(json.dumps(spatial_fixture, separators=(',', ':')) + '\n')
    fade_fixture = {'executableSha256': n.digest, 'function': '0x10031a450', 'runtime': fixture['runtime'], 'cases': fades}
    pathlib.Path('tests/fixtures/env-fade-native.json').write_text(json.dumps(fade_fixture, separators=(',', ':')) + '\n')
    conversion_fixture = {'executableSha256': n.digest, 'runtime': fixture['runtime'], 'cases': conversions}
    pathlib.Path('tests/fixtures/env-vars-native.json').write_text(json.dumps(conversion_fixture, separators=(',', ':')) + '\n')
    (out / 'environment-oracle.json').write_text(json.dumps({k: v for k, v in fixture.items() if k != 'cases'} | {'cases': len(cases), 'spatialFunction': spatial_fixture['function'], 'spatialCases': len(spatial), 'fadeFunction': fade_fixture['function'], 'fadeCases': len(fades), 'conversionCases': len(conversions), 'conversionClasses': list(layouts)}, indent=2) + '\n')

print(json.dumps({'uniforms': len(bindings), 'mappedSourcePointers': sum(b['source'] is not None for b in bindings), 'oracleCases': len(cases) if '--oracle' in sys.argv else None}))
