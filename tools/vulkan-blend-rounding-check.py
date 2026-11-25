#!/usr/bin/env python3
"""Independent finite half blend precision probe, without game shaders."""
import json,pathlib,random,struct,subprocess,tempfile
ROOT=pathlib.Path(__file__).resolve().parent.parent
def main():
    report_path=ROOT/'docs/vulkan-blend-rounding-check.json';report_path.write_text(json.dumps({'complete':False})+'\n')
    rng=random.Random(1803);count=4096;half=lambda x:struct.unpack('<e',struct.pack('<e',x))[0]
    f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
    base=[];source=[]
    values=[0.,-0.,2**-24,-2**-24,2**-14,-2**-14,1.,-1.,32.,-32.,.1776123046875,.79150390625]
    for i in range(count):
        base.extend([rng.choice(values) if i<512 else half(rng.uniform(-32,32)) for _ in range(3)]+[half(rng.random())])
        source.extend([rng.choice(values) if i<512 else half(rng.uniform(-32,32)) for _ in range(3)]+[half(rng.random())])
    def convert(v,mode):
        if mode=='float32':return f32(v)
        raw=struct.pack('<e',v);q=struct.unpack('<e',raw)[0]
        if mode=='rtz' and abs(q)>abs(v):q=struct.unpack('<e',struct.pack('<H',struct.unpack('<H',raw)[0]-1))[0]
        return q
    with tempfile.TemporaryDirectory(prefix='sky-blend-rounding-') as directory:
        tmp=pathlib.Path(directory);a=tmp/'base.bin';b=tmp/'source.bin';a.write_bytes(struct.pack('<'+'e'*len(base),*base));b.write_bytes(struct.pack('<'+'e'*len(source),*source))
        fixtures=[{'format':fmt,'width':128,'height':32,'base':str(a),'source':str(b),'output':str(tmp/(fmt+'.f32'))} for fmt in ['rgba16f','rgba32f']]
        file=tmp/'spec.json';file.write_text(json.dumps({'fixtures':fixtures}));subprocess.run(['node_modules/.bin/tsx','tools/vulkan-blend-rounding-inputs.ts',str(file)],cwd=ROOT,check=True,timeout=90)
        rows=[]
        for c in fixtures:
            actual=struct.unpack('<'+'f'*len(base),pathlib.Path(c['output']).read_bytes());modes={}
            for mode in (['rte','rtz'] if c['format']=='rgba16f' else ['float32']):
                failures=[]
                for i,got in enumerate(actual):
                    value=f32(base[i]+source[i]) if i%4==3 else f32(base[i]+f32(source[i]*source[i//4*4+3]));expected=convert(value,mode)
                    if struct.pack('<f',got)!=struct.pack('<f',expected):failures.append([i,expected,got])
                modes[mode]={'failedComponents':len(failures),'firstFailures':failures[:5],'matched':not failures}
            rows.append({'format':c['format'],'pixels':count,'components':len(base),'modes':modes})
        report={'complete':True,'device':json.loads(file.read_text())['device'],'scope':'Independent same-pass fixed-function blend over 4,096 finite half base/source texels, including signed zero/subnormals and seeded random non-tie values. Float32 result and RTE/RTZ half references are reported separately. A matching conversion describes this driver; original Metal conversion remains unverified.','fixtures':rows,'originalMetalVerified':False}
        report_path.write_text(json.dumps(report,indent=2,allow_nan=False)+'\n');print(json.dumps(rows))
        if not rows[1]['modes']['float32']['matched'] or not any(r['matched'] for r in rows[0]['modes'].values()):raise SystemExit(1)
if __name__=='__main__':main()
