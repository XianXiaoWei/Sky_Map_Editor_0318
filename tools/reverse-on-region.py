"""Record LC_FUNCTION_STARTS boundaries and SHA-gated scene event evidence."""
import hashlib, json, pathlib, sys
from native import Native
n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions = {}
for name, address in [('OnRegion.placement', 0x1004df970), ('OnRegion.Enable', 0x1004dfa90), ('OnRegion.Update', 0x1004dfab0), ('RegionPointInObb', 0x10078d450), ('ClosestRegionPoint.reference', 0x10078d250), ('PlayAnimation.placement', 0x1005311f0)]:
    start, end = n.bounds(address); assembly = 'evidence/' + name.lower().replace('.', '-') + '.asm'
    pathlib.Path(assembly).write_text(n.annotated(address))
    functions[name] = {'start': hex(start), 'end': hex(end), 'codeSha256': hashlib.sha256(n.read(start, end-start)).hexdigest(), 'instructions': len(n.instructions(start)), 'assembly': assembly, 'wholeFunctionRestored': not name.endswith('.reference')}
report = {'executableSha256': n.digest, 'functions': functions, 'regionToleranceBits': int.from_bytes(n.read(0x100aa85b0, 4), 'little'), 'pointLengthThresholdBits': int.from_bytes(n.read(0x100aa70e4, 4), 'little'), 'closestPointScope': 'Whole 0x10078d450 wrapper result verified; its callee closest-point writes are to private discarded storage. Callee 0x10078d250 is reference evidence, not a separately restored closest-point API.'}
pathlib.Path('docs/on-region-native.json').write_text(json.dumps(report, indent=2)+'\n')
