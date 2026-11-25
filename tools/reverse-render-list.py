"""Read-only, SHA-gated whole-function evidence for the shared RenderList CPU chain."""
import hashlib
import json
import sys
from pathlib import Path
from native import Native

source = sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky'
native = Native(source)
entries = {
    'register': 0x1007b97b0, 'unregister': 0x1007b9820,
    'append': 0x1007b9990, 'primitive-count': 0x1007f65d0,
    'queue': 0x1007f6540, 'end-queue': 0x1007f6770,
    'find-context': 0x1007ba080, 'set-context': 0x1007b9fc0,
}
rows = []
for name, address in entries.items():
    start, end = native.bounds(address)
    assert start == address
    file = Path('evidence/render-list-' + name + '.asm')
    file.write_text(native.annotated(address) + '\n')
    rows.append({'name': name, 'entry': hex(address), 'end': hex(end), 'wholeFunction': True,
                 'originalBytesSha256': hashlib.sha256(native.read(start, end-start)).hexdigest(),
                 'assemblyFile': str(file)})
Path('docs/render-list-native.json').write_text(json.dumps({'executableSha256': native.digest, 'entries': rows}, indent=2)+'\n')
print(json.dumps({'entries': len(rows), 'sourceSha256': native.digest}))
