#!/usr/bin/env python3
"""Rebuild exact VOLU/Noise resource-selection evidence from original Sky."""
import argparse, json, pathlib, struct
from native import Native

parser = argparse.ArgumentParser()
parser.add_argument('binary')
args = parser.parse_args()
native = Native(args.binary)
root = pathlib.Path(__file__).resolve().parent.parent
for name, address, code_end in [('volu-load', 0x1004ba510, None), ('noise-initialize', 0x1004b72d0, 0x1004b74e3), ('cloud-initialize', 0x100211690, None), ('cloud-noise-sample', 0x100214810, None)]:
    (root / 'evidence' / (name + '.asm')).write_text(native.annotated(address, code_end))
slots = []
for i in range(20):
    pointer = struct.unpack('<Q', native.read(0x100c17500 + i * 8, 8))[0]
    slots.append({'slot': i, 'file': native.string(pointer), 'pointerOffset': hex(0x60 + i*8)})
targets = [hex(0x1004b74e4 + v) for v in struct.unpack('<18i', native.read(0x1004b74e4, 72))]
report = {'executableSha256': native.digest, 'noiseFileTable': slots, 'noiseInitializerJumpTargets': targets, 'cloudInputPointerOffset': '0xe8', 'cloudNoiseScale': struct.unpack('<f',native.read(0x100aa8694,4))[0], 'cpuNoiseWorldScale': struct.unpack('<f',native.read(0x100aabf20,4))[0]}
(root / 'docs/volu-evidence.json').write_text(json.dumps(report, indent=2) + '\n')
