#!/usr/bin/env python3
"""SHA-gated numeric/Event and dependent sound driver evidence extraction."""
import json
import pathlib
import struct
import sys
from native import Native
n = Native(sys.argv[1])
root = pathlib.Path(__file__).resolve().parent.parent
functions = {
    'float-mult': 0x1007191a0, 'float-split': 0x100717b20,
    'event-start': 0x10032ef60, 'numeric-object-type': 0x1007abc10,
    'play-sound-2d-update': 0x100534410,
    'play-sound-2d-resume': 0x1005343d0,
    'play-sound-2d-preload': 0x100534710,
    'play-sound-3d-update': 0x100534840,
    'sound-event-registration': 0x100538940,
    'sound-emitter-registration': 0x100611240,
    'numeric-class-registration': 0x10071a7e0,
    'float-add': 0x1007194a0, 'float-enable': 0x100717f80,
    'if-enabled': 0x100718320, 'set-float-reset': 0x1007176f0,
    'set-float-update': 0x100717730, 'event-constructor': 0x10032eea0,
    'event-resume': 0x10032f0f0, 'event-has-unique-id': 0x10032f110,
    'event-unique-id': 0x10032f130, 'event-type-index': 0x10032f170,
    'event-forward-30': 0x10032f1e0, 'event-forward-38': 0x10032f200,
    'event-forward-40': 0x10032f220,
    'event-set-enabled': 0x10032e2c0, 'event-request-enabled': 0x10032e2f0,
    'event-barn-dispatch': 0x10032f5b0, 'event-barn-update': 0x10032ea90,
    'event-barn-level-load': 0x10032e540, 'event-barn-release-all': 0x10032e920,
    'event-barn-render': 0x10032ec50, 'event-barn-find-uid': 0x10032f3e0,
    'event-unique-sort': 0x100330980, 'event-sequence-sort': 0x1003315d0,
}
code_ends = {0x100330980: 0x100331018, 0x1003315d0: 0x100331cc0}
for name, address in functions.items():
    assert n.bounds(address)[0] == address
    if '--check-only' not in sys.argv:
        (root / 'evidence' / (name + '.asm')).write_text(n.annotated(address, code_end=code_ends.get(address)))
        if address in code_ends:
            (root / 'evidence' / ('event-sort-' + hex(address)[2:] + '.asm')).write_text(n.annotated(address, code_end=code_ends[address]))
# Actual import destinations used by the unmodified Event::Start body.
imports = {0x100aa2450: 0x100c0e440,
           0x100aa23ba: 0x100c0e378,
           0x100aa245c: 0x100c0e450,
           0x100aa2858: 0x100c0e9a0, 0x100aa2708: 0x100c0e7e0}
for stub, slot in imports.items():
    instruction = next(n.cs.disasm(n.read(stub, 6), stub))
    assert instruction.mnemonic == 'jmp'
    assert stub + instruction.size + instruction.operands[0].mem.disp == slot
getter = n.instructions(0x1007abc10)[2]
assert getter.address + getter.size + getter.operands[1].mem.disp == 0x102047f70
report = {
    'executableSha256': n.digest,
    'functions': {k: hex(v) for k, v in functions.items()},
    'explicitCodeEndsBeforeEmbeddedSortJumpTables': {hex(k): hex(v) for k, v in code_ends.items()},
    'eventBarnLayout': {'capacity':1280,'nodeStart':'0x30','nodeStride':16,'nodeEndExclusive':'0x5030','freeHead':'0x5030','sequenceCounter':'0x10','eventHeap':'0x5040','loadHeap':'0x85098','loadHeapUsedSnapshot':'0x1050f0'},
    'eventStartImports': {hex(k): hex(v) for k, v in imports.items()},
    'floatSplitConstants': {
        'oneBits': hex(struct.unpack('<I', n.read(0x100aa50c0, 4))[0]),
        'positiveWidthThresholdBits': hex(struct.unpack('<I', n.read(0x100aa78c4, 4))[0]),
        'negativeWidthThresholdBits': hex(struct.unpack('<I', n.read(0x100aa95d0, 4))[0]),
    },
    'scope': 'Original disassembly and dependency/constant assertions only; '
             'execution parity is scoped separately in the numeric/sound oracle reports.',
}
if '--check-only' not in sys.argv:
    (root / 'docs' / 'object-runtime-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps(report))
