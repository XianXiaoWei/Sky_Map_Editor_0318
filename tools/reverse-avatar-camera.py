"""SHA-gated camera entry points, whole function evidence and direct frontiers.
No complete CameraSystem/Whisker update parity is implied by disassembly."""
import hashlib
import json
import pathlib
import sys
from capstone.x86 import X86_OP_IMM
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
entries = {
    'CameraSystem.registration': 0x1001e4810,
    'CameraSystem.Initialize': 0x1001de020,
    'CameraSystem.OnLevelLoad': 0x1001de6e0,
    'CameraSystem.OnLevelUnload': 0x1001dec60,
    'CameraSystem.Update': 0x1001def10,
    'CameraSystem.projectionPreparation': 0x1001e1400,
    'CameraGuideBarn.registration': 0x1001dc530,
    'WhiskerCamera.registration': 0x1007446e0,
    'WhiskerCamera.Initialize': 0x10073aa90,
    'WhiskerCamera.Reset': 0x10073ab80,
    'Avatar.eulerToForward': 0x100147510,
}
functions = []
for name, address in entries.items():
    start, end = n.bounds(address)
    assert start == address
    instructions = n.instructions(address)
    calls = []
    for ins in instructions:
        if ins.mnemonic != 'call':
            continue
        op = ins.operands[0]
        calls.append({'site': hex(ins.address), 'operand': ins.op_str,
                      'target': hex(op.imm) if op.type == X86_OP_IMM else None,
                      'resolved': op.type == X86_OP_IMM})
    file = f'evidence/avatar-camera-{address:x}.asm'
    (root / file).write_text(n.annotated(address))
    functions.append({'name': name, 'address': hex(start), 'end': hex(end),
                      'instructions': len(instructions), 'sha256': hashlib.sha256(n.read(start, end - start)).hexdigest(),
                      'calls': calls, 'evidence': file})
report = {'executableSha256': n.digest,
          'scope': 'Whole body disassembly and registered entry evidence. The separate physical oracle now verifies complete Whisker initializer/reset state for finite supplied snapshots, including original Euler-forward/readiness with explicit runtime/libm/handhold services. Continuous update, TouchInput, collision, CameraGuide/lens mixing and final game view remain unverified.',
          'renderer': {'independentEditorAndAvatarCameras': True, 'originalFinalViewVerified': False},
          'functions': functions, 'poseOracle': 'docs/avatar-camera-oracle.json',
          'resetStateOracle': 'docs/avatar-physical-oracle.json'}
(root / 'docs/avatar-camera-native.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
print(json.dumps({'entries': len(functions), 'directCalls': sum(c['resolved'] for f in functions for c in f['calls']),
                  'indirectCalls': sum(not c['resolved'] for f in functions for c in f['calls'])}))
