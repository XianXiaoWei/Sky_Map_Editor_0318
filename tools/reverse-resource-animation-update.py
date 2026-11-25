"""Bind shared animation composition and lazy Transform cache evidence."""
import hashlib, json, pathlib, sys
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions = {}
for name, address in {
    'Animation.Update': 0x100098b90,
    'Animation.UpdatePrimary': 0x100098be0,
    'Animation.UpdateSecondary': 0x100099680,
    'Animation.UpdateAdditive': 0x100099ea0,
    'Animation.FlushMatricesAndEvents': 0x10009a980,
    'AnimationRequest.UpdateClock': 0x100097df0,
    'Transform.UpdateWorldMatrices': 0x1007f2c20,
    'Transform.GetWorldMatrix': 0x1007f26e0,
    'Transform.MarkDirty': 0x1007f2740,
}.items():
    start, end = n.bounds(address)
    # The clock's LC_FUNCTION_STARTS range ends with undecodable alignment
    # bytes. Its return and decoded NOP end at 0x100098134, as recorded in
    # the prior clock evidence; retain the complete range's code hash.
    code_end = 0x100098134 if name == 'AnimationRequest.UpdateClock' else None
    assembly = f'evidence/resource-animation-update-{name}.asm'
    (root / assembly).write_text(n.annotated(start, code_end))
    functions[name] = {'start': hex(start), 'end': hex(end), 'codeEnd': hex(code_end or end), 'instructions': len(n.instructions(start, code_end)), 'codeSha256': hashlib.sha256(n.read(start, end-start)).hexdigest(), 'assembly': assembly}
report = {
    'executableSha256': n.digest, 'functions': functions,
    'updatePhaseOrder': ['Animation.UpdatePrimary', 'Animation.UpdateSecondary', 'Animation.UpdateAdditive', 'Animation.FlushMatricesAndEvents'],
    'clockOnlyArgument': 0,
    'secondaryMaskSelection': {'start': '0x100099a87', 'end': '0x100099c20', 'primaryGlobal': '0x100d22ed0', 'secondaryGlobal': '0x100d232d0', 'dynamicToggle': '0x100c7dc91', 'humanByteOffset': '0x5830', 'bodyBlendOffset': '0x5834', 'requestFlagOffset': '0x62', 'formula': 'float(body * secondary[i]) + float((1 - body) * primary[i]), unclamped'},
    'zeroDelayClockCorrection': {'start': '0x100098068', 'end': '0x1000980c4', 'nativeClampOrder': 'MINSS(1, MAXSS(0, -(remaining * fadeRate)))', 'equalOperandSelection': 'second operand; preserves negative zero from zero remaining'},
    'scope': 'Whole Animation.Update composition and Transform world-cache/GetWorldMatrix bodies, restored human/nonhuman secondary mask selection and exact-zero request fade clamp. Original metadata/pack/global-weight ownership, effects and QEMU arithmetic boundaries remain explicit. This evidence is not complete creature or scene acceptance.',
}
(root / 'docs/resource-animation-update-native.json').write_text(json.dumps(report, indent=2)+'\n')
print(json.dumps({'passed': True, 'functions': len(functions), 'executableSha256': n.digest}))
