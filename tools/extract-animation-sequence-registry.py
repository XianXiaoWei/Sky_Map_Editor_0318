"""Capture relocatable sequence records from the whole original initializer."""
import hashlib, json, pathlib, struct, subprocess, sys, tempfile
from native import Native
n = Native(sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
exe = sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky'
with tempfile.TemporaryDirectory(prefix='sky-sequence-registry-') as temp:
    runner = str(pathlib.Path(temp) / 'oracle')
    subprocess.run(['x86_64-linux-gnu-gcc', '-O2', 'tools/native-animation-sequence-registry.c', '-o', runner], check=True, capture_output=True)
    raw = subprocess.run(['qemu-x86_64', '-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, exe], check=True, capture_output=True, timeout=60).stdout
p = 0
def take(size):
    global p
    out = raw[p:p+size]; assert len(out) == size; p += size; return out
def word(): return struct.unpack('<I', take(4))[0]
def address(): return hex(struct.unpack('<Q', take(8))[0])
def string(): return take(word()).decode('utf8')
records = []
for index in range(word()):
    at, image = address(), take(0xa8)
    row = {'address': at, 'name': string(), 'imageHex': image.hex(), 'steps': []}
    for _ in range(struct.unpack_from('<I', image, 0x18)[0]):
        step_at, step_image = address(), take(0x28)
        row['steps'].append({'address': step_at, 'name': string(), 'imageHex': step_image.hex()})
    records.append(row)
assert p == len(raw)
start, end = n.bounds(0x10009fe60)
report = {'executableSha256': n.digest, 'initializer': {'start': hex(start), 'end': hex(end), 'codeSha256': hashlib.sha256(n.read(start, end-start)).hexdigest(), 'wholeNativeInitializerExecuted': True, 'successfulPathExternalServices': ['memcpy']}, 'nativeOutputSha256': hashlib.sha256(raw).hexdigest(), 'nativeOutputBytes': len(raw), 'records': records}
serialized = (json.dumps(report, ensure_ascii=False, separators=(',', ':'))+'\n').encode()
target = pathlib.Path('src/core/original-animation-sequence-registry.json')
if '--check' in sys.argv:
    assert target.read_bytes() == serialized, 'Portable registry differs from whole native initializer capture'
else:
    target.write_bytes(serialized)
pathlib.Path('/root/sky-research/animation-sequence-registry-native.bin').write_bytes(raw)
print(json.dumps({'sequences': len(records), 'steps': sum(len(r['steps']) for r in records), 'bytes': len(raw), 'fish': [{'index': i, **r} for i, r in enumerate(records) if r['address'] in ['0x101da10a0', '0x101da1148']]}))
