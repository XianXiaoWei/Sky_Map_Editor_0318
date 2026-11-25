"""SHA-gated complete bodies for the two timed Objects camera controls."""
import hashlib
import json
import pathlib
import struct
import sys
from native import Native
root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
entries = {
    'SetCameraShake.OnStart': 0x1003a0ec0,
    'SetCameraShake.Update': 0x1003a0ee0,
    'SetCameraKeyFrameShake.OnStart': 0x100591d90,
    'SetCameraKeyFrameShake.Update': 0x100591da0,
    'CameraSystem.AcquireCameraHandle': 0x1001e2ac0,
    'CameraNode.GetMetaClass': 0x1001ddff0,
    'WhiskerCamera.GetMetaClass': 0x10073aa80,
    'CameraKeyFrame.GetMetaClass': 0x1001ddf40,
}
functions = []
for name, address in entries.items():
    start, end = n.bounds(address)
    assert start == address
    file = f'evidence/camera-events-{address:x}.asm'
    (root / file).write_text(n.annotated(address))
    functions.append({'name': name, 'address': hex(start), 'end': hex(end),
                      'instructions': len(n.instructions(address)),
                      'sha256': hashlib.sha256(n.read(start, end - start)).hexdigest(),
                      'evidence': file})
report = {'executableSha256': n.digest, 'functions': functions,
          'constants': [{'address': hex(a), 'float32': struct.unpack('<f', n.read(a, 4))[0], 'bytes': n.read(a, 4).hex()}
                        for a in [0x100aa6a9c, 0x100aa6aa0, 0x100aa78c4, 0x100aa95d0]],
          'verifiedStateWrites': {'SetCameraShake': {'timer': 'event+0x4c', 'speed': 'Whisker+0x378', 'force': 'Whisker+0x37c', 'weight': 'Whisker+0x380'},
                                  'SetCameraKeyFrameShake': {'timer': 'event+0x58', 'idle': 'CameraKeyFrame+0x78', 'moving': 'CameraKeyFrame+0x7c', 'speed': 'CameraKeyFrame+0x80'}},
          'oracle': 'docs/camera-events-oracle.json',
          'scope': 'Whole-function evidence and timed state-write oracle. Runtime clock/debug values, reflection/metadata cast and assertion/logging services remain explicit inputs. Constructor defaults, automatic scene dispatch, full handle lifecycle, continuous camera shake sampling and final rendering remain unresolved.'}
(root / 'docs/camera-events-native.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
print(json.dumps({'functions': len(functions), 'sha256': n.digest}))
