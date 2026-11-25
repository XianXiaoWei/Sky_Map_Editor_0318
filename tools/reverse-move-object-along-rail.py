"""SHA-gated lifecycle evidence; Update remains reference assembly."""
import hashlib, json, pathlib, sys
from native import Native
n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions = {}
for name, address, restored in [('placement', 0x100486f40, True), ('Load', 0x1004844b0, True), ('Enable', 0x100484640, True), ('Finish', 0x100484a70, True), ('Unload', 0x1004845f0, True), ('Size.reference', 0x100486ea0, False), ('Update.reference', 0x100484a90, False)]:
    start, end = n.bounds(address); file = 'evidence/move-object-along-rail-' + name.lower().replace('.', '-') + '.asm'
    pathlib.Path(file).write_text(n.annotated(address))
    functions[name] = {'start': hex(start), 'end': hex(end), 'codeSha256': hashlib.sha256(n.read(start, end-start)).hexdigest(), 'instructions': len(n.instructions(start)), 'assembly': file, 'wholeFunctionRestored': restored}
assert any(i.mnemonic == 'mov' and i.op_str == 'eax, 0xf8' for i in n.instructions(0x100486ea0))
constants = {name: {'address': hex(at), 'bits': int.from_bytes(n.read(at, 4), 'little')} for name, at in [('minimumTime', 0x100aa6a9c), ('normalizationThreshold', 0x100aa78c4), ('randomScale', 0x100aa70f0), ('randomAmplitude', 0x100aa77f0), ('randomPhase', 0x100ac3a18)]}
report = {'executableSha256': n.digest, 'storageBytes': 0xf8, 'vptr': '0x100c17210', 'functions': functions, 'constants': constants, 'stateRecordBytes': 96, 'swayRecordBytes': 32, 'privateScaleW': 'Unwritten rbp-0xa0 W supplied explicitly by caller. Native Enable retains it across objects.', 'swayPhaseZW': 'Native memory VMOVSS clears upper XMM0 lanes; VINSERTPS zero masks and packing leave phase Z/W zero. No incoming-register W is required.', 'scope': 'Five whole lifecycle functions restored and independently compared. Update is reference evidence only. Heap/metadata/Object transform/Rail queries/random are explicit services; full scene and creature behavior remain pending.'}
pathlib.Path('docs/move-object-along-rail-native.json').write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps({'functions': len(functions), 'restored': 5, 'storageBytes': 248, 'executableSha256': n.digest}))
