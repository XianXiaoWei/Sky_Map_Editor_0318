#!/usr/bin/env python3
"""Extract reproducible shader loader/hash evidence from the supplied executable."""
import hashlib, json, pathlib, struct, sys
import capstone

binary = pathlib.Path(sys.argv[1]).read_bytes()
expected = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20'
digest = hashlib.sha256(binary).hexdigest()
if digest != expected:
    raise ValueError('This evidence extractor is specific to the supplied Sky 0.3.18 executable')
segments, at = [], 32
for _ in range(struct.unpack_from('<I', binary, 16)[0]):
    cmd, size = struct.unpack_from('<II', binary, at)
    if cmd == 0x19:
        vm, vs, fo, fs = struct.unpack_from('<4Q', binary, at + 24)
        segments.append((vm, fo, fs))
    at += size
def offset(address):
    return next(fo + address - vm for vm, fo, size in segments if vm <= address < vm + size)
cs = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
pathlib.Path('evidence').mkdir(exist_ok=True)
for name, start, end in [('shader-file-hash', 0x1007d1150, 0x1007d1340), ('shader-resource-load', 0x1007d1340, 0x1007d18c0), ('shader-registration', 0x1007d1ff0, 0x1007d2370), ('material-registration', 0x10040a2b0, 0x10040ba70)]:
    code = binary[offset(start):offset(end)]
    pathlib.Path(f'evidence/{name}.asm').write_text('\n'.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}' for i in cs.disasm(code, start)))
address = 0x100ba5ce8
p = offset(address)
report = {'executableSha256': digest, 'loader': '0x1007d1340', 'filenameFunction': '0x1007d1150', 'hashInstructions': '0x1007d120b..0x1007d123f', 'pathFormatAddress': hex(address), 'pathFormat': binary[p:binary.index(0, p)].decode(), 'algorithm': 'h = ((h + signed_char) * 4 + (h >> 5)) & 0xffff; initial h = 0; stop at NUL', 'defineOrderAndWhitespace': 'significant', 'shaderFields': {'vs': 112, 'fs': 136, 'defines': 208, 'group': 232}, 'scope': 'Filename selection, resource fields and GLSL declarations. Rendering states and default environment values are not recovered here.'}
pathlib.Path('docs/material-evidence.json').write_text(json.dumps(report, ensure_ascii=False, indent=2))
print(json.dumps(report, ensure_ascii=False, indent=2))
