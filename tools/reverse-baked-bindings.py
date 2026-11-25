#!/usr/bin/env python3
"""SHA-gated baked GUID lookup and actual direct consumer evidence.

Only decoded direct E8 calls count as callers. Virtual GUID getters remain
unresolved; instruction-slice acceptance oracles do not prove full lifecycle.
"""
import json
import pathlib
import struct
import sys
from native import Native

n = Native(sys.argv[1])
functions = {'baked-guid-lookup': 0x1003f68d0,
             'baked-beamo-consumer': 0x100195050,
             'baked-cloud-card-consumer': 0x10021fb40,
             'baked-model-consumer': 0x10045fa00}
for name, address in functions.items():
    pathlib.Path('evidence', name + '.asm').write_text(n.annotated(address))
callers = []
for section, address, length in n.sections:
    if section != '__text':
        continue
    blob = n.read(address, length)
    p = blob.find(b'\xe8')
    while p >= 0:
        if p + 5 <= length and address + p + 5 + struct.unpack_from('<i', blob, p + 1)[0] == functions['baked-guid-lookup']:
            start, _ = n.bounds(address + p)
            if any(i.address == address + p and i.mnemonic == 'call' and i.op_str == '0x1003f68d0' for i in n.instructions(start)):
                callers.append({'function': hex(start), 'site': hex(address + p)})
        p = blob.find(b'\xe8', p + 1)
report = {
    'executableSha256': n.digest, 'functions': {k: hex(v) for k, v in functions.items()},
    'directCallers': callers,
    'lookup': {'recordStride': 48, 'recordGuidOffset': 24,
               'tableCountOffset': 208, 'tablePointerOffset': 232,
               'resourceLoadIndexOffset': 612, 'gate': 'non-null handle and resource; signed load index >= 0',
               'selection': 'linear scan, first equal uint32 GUID; no name comparison',
               'failure': 'false; output pointer remains unchanged'},
    'acceptance': [
        {'consumer': 'BeamoBarn', 'start': '0x100195427', 'endExclusive': '0x100195440',
         'rule': 'found record LOD count (+0x1c) equals mesh LOD count (+0x40)'},
        {'consumer': 'CloudCardBarn', 'start': '0x10021fc86', 'endExclusive': '0x10021fcb2',
         'rule': 'first expanded record LOD vertex count equals first resource LOD render vertex count (+0x34)'},
        {'consumer': 'model mesh binding', 'start': '0x10045fb24', 'endExclusive': '0x10045fb55',
         'rule': 'same first expanded LOD vertex-count gate; retained record pointer or null'},
    ],
    'loaderNotes': {'resourceMissing': '0x1003f4c63..0x1003f4c6e rewrites record GUID to 0xffffffff when resource lookup is absent',
                    'lodMismatch': '0x1003f4dfa..0x1003f4e09 checks sample count against resource LOD bakeVertexCount; failure reads/skips bytes and zeros loaded LOD',
                    'expansion': '0x1003f4f20..0x1003f4f60 uniform sample 0 or resource bakeRemap; 12 bytes per rendered vertex'},
    'unresolved': ['virtual Object GUID getter at +0x30 used by Beamo and CloudCard consumers',
                   'complete resource lookup, loaded-state/invalid-GUID rewriting and arbitrary class registration',
                   '61 unassociated serialized records, model/LevelMaterial lifecycle, Skirt/Visibility dependencies',
                   'full Beamo/CloudCard consumer execution; Model consumer has separate prepared-service whole-body oracle in model-baked-oracle.json; actual lifecycle/rendering/original game validation remains open'],
}
pathlib.Path('docs/baked-bindings-native.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
print(json.dumps({'functions': len(functions), 'directCallers': callers}))
