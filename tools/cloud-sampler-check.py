#!/usr/bin/env python3
"""Independent CPU C sampler against Vulkan using real cloud upload bytes."""
import argparse, ctypes as C, hashlib, importlib.util, json, math, pathlib, random, struct, subprocess, tempfile
ROOT = pathlib.Path(__file__).resolve().parent.parent
module = importlib.util.spec_from_file_location('air', ROOT/'tools/air-to-vulkan.py')
air = importlib.util.module_from_spec(module); module.loader.exec_module(air)
module = importlib.util.spec_from_file_location('check', ROOT/'tools/cloud-air-check.py')
check = importlib.util.module_from_spec(module); module.loader.exec_module(check)

def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--spec', type=pathlib.Path, required=True); args = parser.parse_args()
    report_path = ROOT/'docs/cloud-sampler-check.json'
    report_path.write_text(json.dumps({'passed': False, 'complete': False})+'\n')
    source_spec = json.loads(args.spec.read_text())
    textures = source_spec['programs'][0]['textures']
    # Supercoarse does not use ambience; take all original fields from fine.
    textures = {**textures, **next(p['textures'] for p in source_spec['programs'] if p['name'] == 'CloudFluffy')}
    names = list(air.CLOUD_SAMPLERS)
    with tempfile.TemporaryDirectory(prefix='sky-sampler-') as directory:
        tmp = pathlib.Path(directory)
        c = tmp/'reference.c'; lib = tmp/'reference.so'
        sampler_source = (ROOT/'tools/air-reference-sampler.c').read_text()
        c.write_text(sampler_source+'\nvoid reference(const Texture* t, const float* uv, const int* offset, float* out) { F4 v=sample(t,(F3){uv[0],uv[1],uv[2]},(I3){offset[0],offset[1],offset[2]},3); for(int i=0;i<4;i++)out[i]=v[i]; }\n')
        obj=tmp/'reference.o'
        subprocess.run(['clang','--target=aarch64-linux-gnu','--sysroot=/','--gcc-toolchain=/usr',
                        '-I/usr/include/aarch64-linux-gnu','-fPIC','-O0','-ffp-contract=off','-c',str(c),'-o',str(obj)],check=True,capture_output=True)
        subprocess.run(['gcc','-shared',str(obj),'-lm','-o',str(lib)],check=True,capture_output=True)
        cpu = C.CDLL(str(lib)).reference
        cpu.argtypes = [C.POINTER(check.Texture), C.POINTER(C.c_float), C.POINTER(C.c_int), C.POINTER(C.c_float)]
        cpu.restype = None
        vert = tmp/'sampler.vert'; vert.write_text('#version 450\nlayout(location=0) in vec2 a_position; void main(){gl_Position=vec4(a_position,0,1);}\n')
        fixtures = []; rows = []
        rng = random.Random(318)
        for name in names:
            t = textures[name]; linear, repeat = air.CLOUD_SAMPLERS[name]
            if (linear, repeat) != (t['linear'], t['repeat']): raise ValueError('Sampler descriptor fixture mismatch')
            points = []; offsets = []
            for i in range(1024):
                if i < 128:
                    xyz = [(-1,0,.5,1,2)[(i >> (axis*2)) % 5] + ((i % 3)-1)*2**-19 for axis in range(3)]
                elif i == 128: xyz = [.43142393231391907,1.8156828880310059,-14.976093292236328]
                elif i < 256: xyz = [(rng.randrange(t['dimensions'][axis])+.5)/t['dimensions'][axis] for axis in range(3)]
                else: xyz = [rng.uniform(-16,16) for _ in range(3)]
                points.append([*map(lambda v: C.c_float(v).value, xyz),0])
                offsets.append([*(0 if i < 256 else rng.randrange(-2,3) for _ in range(3)),0])
            raw = pathlib.Path(t['data']).read_bytes(); buffer = C.create_string_buffer(raw)
            texture = check.Texture(C.cast(buffer,C.c_void_p),(C.c_int*3)(*t['dimensions']),4 if t['format']=='rgba8' else 1,0,linear,repeat)
            expected=[]
            for uv, offset in zip(points, offsets):
                out=(C.c_float*4)();cpu(C.byref(texture),(C.c_float*3)(*uv[:3]),(C.c_int*3)(*offset[:3]),out);expected.extend(out)
            fragment = tmp/(name+'.frag')
            fragment.write_text('#version 450\nuniform vec4 u_points[1024]; uniform ivec4 u_offsets[1024]; uniform sampler3D u_texture;\nlayout(location=0) out vec4 result;\n'+air.SAMPLER_SOURCE+'\nvoid main(){int i=int(gl_FragCoord.x)+(int(gl_FragCoord.y)<<4);result=air_sample3d(u_texture,u_points[i].xyz,u_offsets[i].xyz,'+str(linear).lower()+','+str(repeat).lower()+');}\n')
            output = tmp/(name+'.f32')
            fixtures.append({'name':name,'vert':str(vert),'frag':str(fragment),'width':16,'height':64,
                'uniforms':{'u_points':points,'u_offsets':offsets},'textures':{'u_texture':t},'output':str(output)})
            rows.append({'name':name,'textureSha256':hashlib.sha256(raw).hexdigest(),'samples':1024,'expected':expected,'output':str(output)})
        spec = tmp/'spec.json';spec.write_text(json.dumps({'fixtures':fixtures}))
        subprocess.run(['node_modules/.bin/tsx','tools/vulkan-sampler-inputs.ts',str(spec)],cwd=ROOT,check=True,timeout=90)
        for row in rows:
            values=struct.unpack('<4096f',pathlib.Path(row.pop('output')).read_bytes());expected=row.pop('expected')
            differences=[abs(a-b) for a,b in zip(values,expected)]
            failures=[[i,a,b] for i,(a,b) in enumerate(zip(values,expected)) if not math.isfinite(a) or abs(a-b)>2e-6]
            row.update({'maxAbsoluteDifference':max(differences),'failedComponents':len(failures),'firstFailures':failures[:5],'passed':not failures})
        report={'passed':all(r['passed'] for r in rows),'complete':True,'device':json.loads(spec.read_text())['device'],
            'scope':'Six real Dawn cloud upload textures including normalized CloudFluffy.vol. Independent CPU C normalized sampler; Vulkan production helper with texelFetch. Negative repeat coordinates, clamp edges, texel centers, seams, integer offsets and deterministic random points. Float32 result tolerance 0.000002; no Metal hardware filtering claim.',
            'helperSha256':hashlib.sha256(air.SAMPLER_SOURCE.encode()).hexdigest(),'referenceSha256':hashlib.sha256(sampler_source.encode()).hexdigest(),'textures':rows}
        report_path.write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({'samples':6144,'failedComponents':sum(r['failedComponents'] for r in rows),'passed':report['passed']}))
        if not report['passed']:raise SystemExit(1)

if __name__=='__main__':main()
