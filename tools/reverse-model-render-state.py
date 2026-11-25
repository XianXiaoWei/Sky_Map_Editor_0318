#!/usr/bin/env python3
"""SHA-gated native opaque and transparent pass state extraction; no game/GPU startup."""
import json, pathlib, struct, subprocess, sys, tempfile
from native import Native

n = Native(sys.argv[1])
functions = {
    'model-compositor-outline': (0x10023de50, None),
    'outline-add-render-list': (0x1007bcc00, None),
    'outline-add-depth-state': (0x1007bc670, None),
    'scene-list-descriptor': (0x10058f9d0, 0x10058fc7c),
    'vertex-refresh-pipeline': (0x1007f6280, None),
    'metal-depth-state': (0x100a69680, None),
    'metal-cull-state': (0x100a6d9c0, None),
    'metal-depth-bias': (0x100a6da50, None),
    'metal-render-pass': (0x100a6d530, None),
    'metal-command-context': (0x100a6ede0, None),
    'scene-render-flush': (0x10058ed00, None),
    'render-list-sort': (0x1007b9cd0, None),
    'render-list-shader-key': (0x1007f6a50, None),
    'render-list-shader-compare': (0x1007b9f90, None),
    'render-list-introsort': (0x1007ba0c0, 0x1007ba9d8),
}
for name, (address, code_end) in functions.items():
    pathlib.Path('evidence', name+'.asm').write_text(n.annotated(address, code_end))
targets = sorted({i.operands[0].imm for i in n.instructions(0x10023de50)
                  if i.address < 0x10023f230 and i.mnemonic == 'call' and i.op_str.startswith('0x')})
factor_table = list(struct.unpack('<10Q', n.read(0x100b06650, 80)))
metal_factors = ['zero', 'one', 'sourceColor', 'oneMinusSourceColor', 'sourceAlpha',
                 'oneMinusSourceAlpha', 'destinationColor', 'oneMinusDestinationColor',
                 'destinationAlpha', 'oneMinusDestinationAlpha', 'sourceAlphaSaturated']
compare_names = ['never','less','equal','lessEqual','greater','notEqual','greaterEqual','always']
operation_names = ['add','subtract','reverseSubtract','min','max']
def factor(enum):
    return metal_factors[factor_table[enum-1] if 1 <= enum <= 10 else 0]
def operation(enum):
    return operation_names[enum if 1 <= enum <= 4 else 0]
def decode(raw):
    depth_states = []
    for i in range(3):
        d = raw[i*44:(i+1)*44]
        depth_states.append({'index':i,'test':bool(d[0]),'write':bool(d[1]),
                             'compareEnum':struct.unpack_from('<I',d,4)[0], 'stencil':bool(d[8])})
    count, = struct.unpack_from('<I',raw,132)
    if count != 15 or len(raw) != 136 + count*160 + 23*36 + 36 + count*12 + 256:
        raise ValueError('Invalid native state capture')
    at = 136+count*160
    descriptors = []
    for i in range(23):
        d = raw[at+i*36:at+(i+1)*36];capacity,sort = struct.unpack_from('<II',d)
        descriptors.append({'index':i,'name':d[8:].split(b'\0')[0].decode(),'capacity':capacity,'sortMode':sort})
    backend = struct.unpack_from('<9I',raw,at+23*36)
    for i,d in enumerate(depth_states):
        d['metalCompare'] = backend[i*2];d['compare'] = compare_names[backend[i*2]]
        if backend[i*2+1] != int(d['write']): raise ValueError('Metal write conversion mismatch')
    lists = []
    for i in range(count):
        p = raw[136+i*136:136+(i+1)*136]
        s = raw[136+count*136+i*24:136+count*136+(i+1)*24]
        index,pass_index = struct.unpack_from('<II',p)
        depth_index,cull,*bias,flag0,flag1,flag2,flag3 = struct.unpack('<II3f4B',s)
        captured_bias=list(struct.unpack_from('<3f',raw,at+23*36+36+i*12))
        if captured_bias != bias: raise ValueError('Native Metal bias conversion mismatch')
        colors = []
        for j in range(4):
            rgb,alpha,blend,reserved,src,dst,srca,dsta,op,opa = struct.unpack_from('<4B6I',p,8+j*28)
            colors.append({'rgbWrite':bool(rgb),'alphaWrite':bool(alpha),'blend':bool(blend),
                           'sourceRGB':factor(src),'destinationRGB':factor(dst),
                           'sourceAlpha':factor(srca),'destinationAlpha':factor(dsta),
                           'operationRGB':operation(op),'operationAlpha':operation(opa),
                           'nativeFactors':[src,dst,srca,dsta],'nativeOperations':[op,opa]})
        lists.append({'index':index,'name':descriptors[index]['name'],'outlineOrder':i,'passIndex':pass_index,
                      'depth':depth_states[depth_index], 'cullEnum':cull, 'metalCull':backend[6+cull],
                      'cull':['none','front','back'][backend[6+cull]],
                      'depthBias':bias,'metalDepthBias':captured_bias,'colors':colors,'contextFlags':[flag0,flag1,flag2,flag3]})
    sort_at=at+23*36+36+count*12
    keys=list(struct.unpack_from('<32i',raw,sort_at));order=list(struct.unpack_from('<32I',raw,sort_at+128))
    if sorted(order)!=list(range(32)) or [keys[i] for i in order]!=sorted(keys):raise ValueError('Native shader sort failed')
    return {'sceneLists':descriptors,'depthStates':depth_states,'renderLists':lists,
            'metalCullMap':list(backend[6:]),'shaderSort':{'mode':3,'keys':keys,'order':order,
                'key':'signed DWORD at VertexRender shader descriptor +0; uninitialized render or null shader descriptor yields -1',
                'comparison':'signed ascending; equal-key order follows original unstable introsort',
                'scope':'32 explicit synthetic shader handles; real native resource handles are not reconstructed'}}
with tempfile.TemporaryDirectory() as tmp:
    tmp = pathlib.Path(tmp);exe = tmp/'oracle';target_file = tmp/'targets.bin'
    target_file.write_bytes(struct.pack('<'+'Q'*len(targets),*targets))
    subprocess.run(['x86_64-linux-gnu-gcc','-O2','-Wall','-Wextra','tools/native-model-render-state-oracle.c','-o',str(exe)],check=True)
    runs = [decode(subprocess.run(['qemu-x86_64','-L','/usr/x86_64-linux-gnu','-cpu','max',str(exe),
                                  sys.argv[1],str(target_file),str(alpha)],capture_output=True,check=True).stdout)
            for alpha in [0,1]]
    for a,b in zip(runs[0]['renderLists'],runs[1]['renderLists']):
        if a['colors'] != b['colors'] or a['depth'] != b['depth'] or a['depthBias'] != b['depthBias']:
            raise ValueError('Unexpected state dependency on alpha-in-color capability')
report = {'executableSha256':n.digest,
          'scope':'Original descriptor writes, native AddRenderList storage, 23 Scene list descriptors, mode 3 shader-key sort and Metal depth/cull/bias conversion instructions executed. Resource creation, shader parameters and outline setup use explicit mocks; exit after transparent pass. Sort uses explicit synthetic handles. No original GPU or complete Compositor execution.',
          'functions':{k:hex(a) for k,(a,_) in functions.items()},
          'metalSelectors':{hex(a):n.string(struct.unpack('<Q',n.read(a,8))[0]) for a in [0x100c69f00,0x100c69f08,0x100c6a0e0,0x100c6a0f0,0x100c6a0c8]},
          'redirectedSetupTargets':[hex(a) for a in targets if a != 0x1007bcc00],
          'stop':{'patchedJump':'0x10023f230','originalEpilogue':'0x100241cc8'},
          'blendFactorTable':{'address':'0x100b06650','nativeEnums1To10':factor_table,
                              'method':'Static executable table referenced by Metal blend conversion at 0x100a67caa; full Metal pipeline constructor not executed.'},
          'winding':{'method':'Static Metal render-pass instructions 0x100a6d65a..0x100a6d6f9',
                     'offscreenMetal':'clockwise','backbufferMetal':'counterClockwise',
                     'webgl':'Editor uses its existing OpenGL projection/front-face convention; full native target/projection conversion remains unresolved.'},
          'captureWithoutAlphaDepth':runs[0], 'captureWithAlphaDepth':runs[1],
          'unresolved':['Real native shader handle allocation and complete draw scheduling; mode 3 comparator/sort executed with synthetic handles',
                        'Native render-target/projection conventions in the full WebGL pipeline',
                        'Ambience/probe/shadow/light-grid resources and actual original shader activation']}
pathlib.Path('docs/model-render-state.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'sceneLists':23,'capturedRenderLists':15,'capabilityVariants':2,
                  'bakedListOrder':[r['name'] for r in runs[1]['renderLists'] if r['name'] in ['Opaque','Decal','Skirts']],
                  'nativeDepthAndCull':True}))
