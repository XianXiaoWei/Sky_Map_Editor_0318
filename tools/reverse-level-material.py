#!/usr/bin/env python3
"""Keep original MaterialDef slots, pointers and bytes for parameter replay."""
import json, pathlib, subprocess, sys, tempfile
from native import Native

n = Native(sys.argv[1])
existing = json.loads(pathlib.Path('docs/meshes-evidence.json').read_text())
functions = {
    'constructor': 0x100407ce0, 'setParamCount': 0x100407a40,
    'barnInitialize': 0x100407ae0, 'barnUpdateModels': 0x100407b20,
    'barnUpdateMaterials': 0x100407b70, 'barnReset': 0x100407b90,
    'allocate': 0x100407c80, 'findGuid': 0x100408960,
    'defaultMaterials': 0x100408360, 'materialChanged': 0x100407a70,
    'barnChanged': 0x100408330, 'findDefinition': 0x1004434f0,
    'generateParameters': 0x100443a70,
}
for name, address in functions.items():
    pathlib.Path(f'evidence/level-material-{name}.asm').write_text(n.annotated(address))
strings = {}
for address in [0x100b88dcc, 0x100b88dd9, 0x100b88e00, 0x100b88df1, 0x100b88de6]:
    strings[hex(address)] = n.string(address)
tables = {}
with tempfile.TemporaryDirectory() as temp:
    runner = str(pathlib.Path(temp, 'oracle'))
    subprocess.run(['x86_64-linux-gnu-gcc', '-O2', '-no-pie', 'tools/native-meshes-oracle.c', '-lm', '-o', runner], check=True)
    for level in ['', *existing['levels']]:
        raw = subprocess.run(['qemu-x86_64', '-L', '/usr/x86_64-linux-gnu', '-cpu', 'max', runner, sys.argv[1], level], input=b'', capture_output=True, check=True).stdout
        assert int.from_bytes(raw[:4], 'little') == 30 and len(raw) == 4 + 30 * 0x1a0
        definitions = []
        for i in range(30):
            d = raw[4+i*0x1a0:4+(i+1)*0x1a0]
            for off in [8, *range(0x68, 0xc8, 8), *range(0x110, 0x130, 8), *range(0x170, 0x190, 8)]:
                ptr = int.from_bytes(d[off:off+8], 'little')
                if ptr:
                    value = n.string(ptr)
                    assert value is not None, hex(ptr)
                    strings[hex(ptr)] = value
            definitions.append({'index': i, 'materialId': d[0], 'rawHex': d.hex()})
        tables[level or 'default'] = definitions
report = {'executableSha256': n.digest, 'functions': {k: hex(v) for k, v in functions.items()},
          'scope': 'Original initialized MaterialDef bytes and slot identities. Class IDs/base color, heap policy, startup and model rendering are separate dependencies.',
          'strings': strings, 'tables': tables}
pathlib.Path('docs/level-material-evidence.json').write_text(json.dumps(report, ensure_ascii=False, indent=2)+'\n')
print(json.dumps({'tables': len(tables), 'definitions': sum(map(len, tables.values())), 'strings': len(strings)}))
