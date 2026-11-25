"""SHA-gated Crab AI scoring, state selection and whole update evidence."""
import hashlib
import json
import pathlib
import struct
import sys
from native import Native

n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions = {
    'CrabAi.BehaviorScore': (0x100258790, 0x100258ed0, 11),
    'CrabAi.ConsiderCandidate': (0x100258f00, 0x1002591c4, 11),
    'CrabAi.UpdateMetrics': (0x1002591f0, 0x100259488, 12),
    'SteeringBehaviors.ReadMotionState': (0x10062e430, None, 0),
    'SteeringBehaviors.Flocking': (0x10062f800, None, 0),
    'CrabAi.SelectState': (0x1002594c0, None, 0),
    'CrabAi.Update': (0x10025a880, 0x10025b498, 0),
}
rows = {}
for name, (address, code_end, table_entries) in functions.items():
    start, end = n.bounds(address)
    code_end = code_end or end
    evidence = 'evidence/crab-behavior-' + name + '.asm'
    pathlib.Path(evidence).write_text(n.annotated(address, code_end))
    row = {
        'address': hex(start), 'end': hex(end), 'codeEnd': hex(code_end),
        'codeSha256': hashlib.sha256(n.read(start, code_end - start)).hexdigest(),
        'wholeFunctionSha256': hashlib.sha256(n.read(start, end - start)).hexdigest(),
        'instructions': len(n.instructions(address, code_end)), 'evidence': evidence,
    }
    if table_entries:
        table = n.read(code_end, table_entries * 4)
        row['jumpTable'] = {
            'address': hex(code_end), 'entries': table_entries,
            'sha256': hashlib.sha256(table).hexdigest(),
            'targets': [hex(code_end + struct.unpack_from('<i', table, i * 4)[0]) for i in range(table_entries)],
        }
    rows[name] = row
    if name == 'CrabAi.Update':
        row['jumpTables'] = []
        for address, entries in [(0x10025b498, 12), (0x10025b4c8, 7)]:
            table = n.read(address, entries * 4)
            row['jumpTables'].append({'address': hex(address), 'entries': entries, 'sha256': hashlib.sha256(table).hexdigest(), 'targets': [hex(address + struct.unpack_from('<i', table, i * 4)[0]) for i in range(entries)]})

start, end = n.bounds(0x10025bc10)
evidence = 'evidence/bird-guide-Crab.Update.asm'
pathlib.Path(evidence).write_text(n.annotated(start))
report = {
    'executableSha256': n.digest, 'functions': rows,
    'nextDependency': {'address': hex(start), 'end': hex(end), 'codeSha256': hashlib.sha256(n.read(start, end - start)).hexdigest(), 'evidence': evidence, 'investigationOnly': True},
    'scope': 'Seven whole scoring/motion/selection/AI bodies, including every jump-table case and shared flocking. SelectState and CrabAi.Update are implemented and independently verified against original machine code. External libm, metadata conversions, neighbor queries, Avatar motion, generic transform/scale/OBB, caller scratch weights and Marker virtual transforms remain explicit services. Complete Crab.Update, world collision, actual Model/animation ownership and live viewport behavior remain pending.',
}
pathlib.Path('docs/crab-behavior-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({'functions': len(rows), 'instructions': sum(r['instructions'] for r in rows.values())}))
