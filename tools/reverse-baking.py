#!/usr/bin/env python3
"""Evidence for original Mesh LOD lighting remap and LevelData expansion."""
import hashlib, json, pathlib, struct, sys
import capstone
binary = pathlib.Path(sys.argv[1]).read_bytes()
digest = hashlib.sha256(binary).hexdigest()
if digest != '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20':
    raise ValueError('This extractor requires the supplied Sky 0.3.18 executable')
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
for name, start, end in [('mesh-lod-reader', 0x100455e90, 0x100456640), ('bake-load-expand', 0x1003f4840, 0x1003f4f67), ('bake-record-serializer', 0x1003f1800, 0x1003f1958)]:
    pathlib.Path(f'evidence/{name}.asm').write_text('\n'.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}' for i in cs.disasm(binary[offset(start):offset(end)], start)))
report = {'executableSha256': digest, 'resourceLodReader': '0x100455e90', 'resourceLodStride': 184, 'renderVertexCount': {'nativeOffset': 52, 'readInstructions': '0x100456065..0x100456075'}, 'bakeVertexCount': {'nativeOffset': 64, 'readInstructions': '0x10045609c..0x1004560a8', 'fileField': 'Second count after render vertex/index counts'}, 'bakeRemap': {'nativeOffset': 152, 'readInstructions': '0x1004562bc..0x100456307', 'format': 'u32 array, renderVertexCount entries, present when bakeVertexCount > 0'}, 'bakeLoader': '0x1003f4840', 'countCheck': '0x1003f4dfa..0x1003f4e09', 'expandInstructions': '0x1003f4f20..0x1003f4f60', 'expansion': 'Copy 12 bytes per render vertex from sample 0 when uniform, otherwise from Mesh LOD bakeRemap[vertex]', 'opaqueExtraBlock': 'Preserved bytes after lighting; does not provide the lighting remap', 'shaderEvidence': {'vertex': 'Mesh49525.vert: v_light0/1/2 = a_light0/1/2', 'fragment': 'Mesh49525.frag lines 63..72; UNORM8 light0 RGB squared / alpha, sky blend, squared sun visibility, packed direction and point-light exponent'}, 'notImplemented': ['Native rendering state and complete environment uniforms', 'New lighting bake', 'GPU drawing verification']}
pathlib.Path('docs/bake-evidence.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
print(json.dumps(report, ensure_ascii=False, indent=2))
