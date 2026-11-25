#!/usr/bin/env python3
"""Recover original cloud AIR interfaces and arithmetic precision as evidence.

Extract the bounded LLVM bitcode from the Metal wrapper and disassemble it.
This is evidence recovery, not a Vulkan shader translation or GPU execution.
"""
import argparse, collections, hashlib, json, pathlib, re, struct, subprocess, tempfile

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('data', type=pathlib.Path)
    parser.add_argument('--depth', action='store_true', help='Extract the six original cloud depth stages into a separate evidence report')
    parser.add_argument('--cards', action='store_true', help='Extract original Cloud-list CloudCard and fluffy particle stages')
    args = parser.parse_args()
    root = pathlib.Path(__file__).resolve().parent.parent
    files = ['CloudFluffy0', 'CloudFluffy54734', 'CloudFluffy62865', 'CloudCore0']
    if args.depth: files = ['Fullscreen45204', 'DepthDownsample45204', 'Fullscreen3593', 'DepthDownsample3593', 'Fullscreen5322', 'DepthDownsample5322']
    if args.depth and args.cards: raise ValueError('Choose one evidence group')
    if args.cards: files = ['CloudCard0', 'FlatCloud11244']
    rows = []
    for program in files:
        for stage in ['vert', 'frag']:
            if args.depth and (program.startswith('Fullscreen') != (stage == 'vert')): continue
            name = f'{program}.{stage}.osx.metallib'
            raw = (args.data / 'Shaders/Bin' / name).read_bytes()
            if raw[:4] != b'MTLB': raise ValueError('Invalid Metal library magic')
            pos = raw.find(b'BC\xc0\xde')
            if pos < 20: raise ValueError('Missing LLVM bitcode wrapper')
            magic, version, offset, length, cpu = struct.unpack_from('<5I', raw, pos-20)
            if magic != 0x0b17c0de or version != 0 or offset != 20 or not length or pos+length > len(raw):
                raise ValueError('Invalid LLVM bitcode bounds')
            bitcode = raw[pos:pos+length]
            with tempfile.TemporaryDirectory(prefix='sky-cloud-air-') as temp:
                bc, ll = pathlib.Path(temp, 'shader.bc'), pathlib.Path(temp, 'shader.ll')
                bc.write_bytes(bitcode)
                subprocess.run(['llvm-dis', str(bc), '-o', str(ll)], check=True, timeout=30)
                text = ll.read_text()
            # Stable evidence paths, without a temporary filename in the IR.
            text = re.sub(r"; ModuleID = '[^']*'", f"; ModuleID = '{name}'", text)
            text = re.sub(r'source_filename = "[^"]*"', f'source_filename = "{name}"', text)
            evidence = root / 'evidence' / f'{program}.{stage}.air.ll'
            evidence.write_text(text)
            match = re.search(r'^define .*?\n(.*?)^}', text, re.M | re.S)
            if not match: raise ValueError('Missing original cloud entry point')
            body = match[1]
            opcodes = collections.Counter(re.findall(r'^  (?:%\w+ = )?(\w+)', body, re.M))
            interfaces = [line for line in text.splitlines() if line.startswith('!') and any(key in line for key in ['air.struct_type_info', 'air.render_target', 'air.vertex_input', 'air.fragment_input', 'air.texture', 'air.sampler'])]
            uniform_layouts = [line for line in text.splitlines() if line.startswith('!') and re.search(r'!"(?:half|float)[\dx]*", !"u_', line)]
            rows.append({'file': name, 'stage': stage, 'sourceSha256': hashlib.sha256(raw).hexdigest(), 'bitcodeSha256': hashlib.sha256(bitcode).hexdigest(),
                         'bitcodeBytes': length, 'evidence': str(evidence.relative_to(root)), 'opcodes': dict(opcodes),
                         'halfArithmetic': len(re.findall(r'^  %\w+ = f(?:add|sub|mul|div).*?(?:\bhalf\b)', body, re.M)),
                         'floatToHalf': opcodes['fptrunc'], 'halfToFloat': opcodes['fpext'],
                         'intrinsics': sorted(set(re.findall(r'@(air\.[\w.]+)\(', body))),
                         'interfaces': interfaces, 'uniformLayouts': uniform_layouts})
    report = {'scope': 'Original bounded Metal AIR bitcode and metadata. Includes explicit half/float arithmetic, casts, texture result types, uniform layouts and Metal clip-space conversion. Does not translate to Vulkan, execute Metal, or establish cross-driver/game image parity.',
              'programs': rows, 'remaining': ['Validate reconstructed AIR arithmetic/filtering/contraction and raster boundaries against original Metal', 'Complete Compositor scheduling and temporal history', 'Produce scene depth and bind real water/blue-noise/environment inputs', 'Validate Windows and original game images']}
    (root / 'docs' / ('metal-cloud-card-audit.json' if args.cards else 'metal-cloud-depth-audit.json' if args.depth else 'metal-cloud-audit.json')).write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'originalStages': len(rows), 'floatToHalf': sum(r['floatToHalf'] for r in rows), 'halfToFloat': sum(r['halfToFloat'] for r in rows), 'scope': 'AIR evidence recovered; execution and GPU acceptance tracked separately'}))

if __name__ == '__main__': main()
