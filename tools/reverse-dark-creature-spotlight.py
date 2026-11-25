"""SHA-gated eye/searchlight phase evidence; boundaries are partial Update."""
import hashlib, json, pathlib, struct, sys
from native import Native
n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
start, projection, end = 0x10026e7da, 0x10026eda3, 0x10026f41e
assert n.bounds(start) == (0x10026ddb0, 0x10026ffc0)
pathlib.Path('evidence/dark-creature-update-reference.asm').write_text(n.annotated(start))
addresses = {'half': 0x100aa45b8, 'pi': 0x100aa8600, 'radiusRange': 0x100aa77dc, 'radiusLocked': 0x100aa7cc0, 'five': 0x100aa6aa8, 'rayLength': 0x100aa89cc, 'groundSmooth': 0x100ab4904, 'colorAmbient': 0x100aa77ec, 'colorGain': 0x100aa6aac, 'colorRange': 0x100aa85f4, 'eyeReadThreshold': 0x100aa70e4}
constants = {k: struct.unpack('<I', n.read(a, 4))[0] for k, a in addresses.items()}
vectors = {k: list(struct.unpack('<4I', n.read(a, 16))) for k, a in {'verticalOffset': 0x100ab4950, 'up': 0x100aa78d8, 'fallbackUp': 0x100aa7920}.items()}
vectors['up'] = vectors['up'][:2] * 2
report = {'executableSha256': n.digest, 'start': hex(start), 'projectionStart': hex(projection), 'end': hex(end), 'wholeFunctionStart': '0x10026ddb0', 'wholeFunctionEnd': '0x10026ffc0', 'codeSha256': hashlib.sha256(n.read(start, end-start)).hexdigest(), 'constants': constants, 'vectors': vectors, 'scope': 'Consecutive eye look/smoothing and spotlight projection/radius/color/marker/expiration phases of original DarkCreature.Update 0x10026e7da..0x10026f41e. Includes velocity/target eye direction, alert sweep and cached quaternion, shortest-path quaternion interpolation with native NaN fallback, actual eye-model transform, rotating projected direction, native ray query, current target and radius. The same preceding body motion matrix, packed delta, absolute time and original palette scratch are caller inputs; subsequent interaction/audio, real resource/world owners and full viewport remain pending.'}
pathlib.Path('docs/dark-creature-spotlight-native.json').write_text(json.dumps(report, indent=2) + '\n')
