#!/usr/bin/env python3
"""Extract exact native MaterialDefs per map and meshes CPU/GPU evidence.
Requires x86_64-linux-gnu-gcc and qemu-x86_64; native text SHA is mandatory.
"""
import json, pathlib, struct, subprocess, sys, tempfile
from native import Native

n = Native(sys.argv[1])
data = pathlib.Path(sys.argv[1]).parent.parent / 'Data'
functions = {'material-initialize': 0x10043fb70, 'material-reset': 0x100443f50,
             'material-upload': 0x100443810, 'material-parameters': 0x100443a70,
             'terrain-scatter': 0x1006a7280, 'skirt-load': 0x1005abf50,
             'vertex-buffer-format': 0x1007f5430}
for name, address in functions.items():
    pathlib.Path('evidence', name + '.asm').write_text(n.annotated(address))

def decode(raw):
    count, = struct.unpack_from('<I', raw)
    if count != 30 or len(raw) != 4 + count * 416: raise ValueError('Invalid native output')
    definitions = []
    for i in range(count):
        d = raw[4 + i*416:4 + (i+1)*416]
        def string(at):
            address, = struct.unpack_from('<Q', d, at)
            if not address: return ''
            value = n.string(address)
            if value is None: raise ValueError(f'Unresolved native string {address:#x}')
            return value
        def floats(at, count): return list(struct.unpack_from(f'<{count}f', d, at))
        textures = [{'name': string(0x68+j*8), 'texture': string(0x88+j*8)} for j in range(4)]
        parameters = []
        for names, values, components in [(0xa8,0xd0,4),(0x110,0x130,3),(0x170,0x190,1)]:
            for j in range(4):
                name=string(names+j*8)
                if name: parameters.append({'name':name,'vector':floats(values+j*(4 if components==1 else 16),components)})
        definitions.append({'index':i,'materialId':d[0],'shaderName':string(8),
                            'color':floats(0x20,4),'metalness':floats(0x54,1)[0],
                            'roughness':floats(0x58,1)[0],'uvScale':floats(0x5c,1)[0],
                            'minimumWeight':d[0x60],'stopWeight':d[0x61],
                            'textures':[t for t in textures if t['name'] and t['texture']],
                            'parameters':parameters})
    return definitions

with tempfile.TemporaryDirectory() as tmp:
    exe=pathlib.Path(tmp,'oracle')
    subprocess.run(['x86_64-linux-gnu-gcc','-O2','-no-pie','tools/native-meshes-oracle.c','-lm','-o',str(exe)],check=True)
    levels={}
    for directory in sorted((data/'Levels').iterdir()):
        if not (directory/'BstBaked.meshes').exists(): continue
        raw=subprocess.run(['qemu-x86_64','-L','/usr/x86_64-linux-gnu','-cpu','max',str(exe),sys.argv[1],directory.name],capture_output=True,check=True).stdout
        levels[directory.name]=decode(raw)
    default=decode(subprocess.run(['qemu-x86_64','-L','/usr/x86_64-linux-gnu','-cpu','max',str(exe),sys.argv[1],''],capture_output=True,check=True).stdout)

report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},
        'scope':'Original material initialization incl. HSV/gamma conversion and level overrides. Linux libc imports; no game startup or GPU rendering.',
        'default':default,'levelsAudited':list(levels),'levels':{k:v for k,v in levels.items() if v!=default},
        'scatter':{'count':59,'ordering':'30 opaque surfaces then 29 decal surfaces, definition order',
                   'vertexRule':'scan up to 4 slots, stop on ID 0 or weight >= stopWeight; include iff weight > minimumWeight',
                   'triangleRule':'union vertex masks; lowest ordinal remains opaque, remaining bits shift by materialCount-1',
                   'indices':'stable input triangle order in each surface; counts-only call supported'},
        'skirt':{'stride':40,'baseVertexBytes':36,'extraAttribute':'a_userData1, UNORM8 vec4, bytes 36..39',
                 'distanceRange':struct.unpack('<f',n.read(0x100aa6aa8,4))[0],
                 'materialRule':'whole skirt drawn once per nonzero material ID present in any vertex; ignores weight'},
        'unresolved':['Complete native draw scheduling, initial global environment outputs and GPU resources; basic Opaque/Decal/Skirts states are in meshes-render-state.json',
                      'Terrain patch visibility/jobs/tessellation and collision regeneration',
                      'Cloud sparse texture upload, preceding ray march/composite passes and occluder pipeline']}
pathlib.Path('docs/meshes-evidence.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'levels':len(levels),'materials':len(default),'differentFromDefault':[k for k,v in levels.items() if v!=default]},ensure_ascii=False))
