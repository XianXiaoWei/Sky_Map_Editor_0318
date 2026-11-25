#!/usr/bin/env python3
"""Analytical pixel oracle for original Cloud blend/state in a native batch."""
import json, pathlib, struct, subprocess, tempfile
ROOT = pathlib.Path(__file__).resolve().parent.parent

def main():
    report_path = ROOT/'docs/cloud-blend-check.json'
    report_path.write_text(json.dumps({'passed':False,'complete':False})+'\n')
    with tempfile.TemporaryDirectory(prefix='sky-cloud-blend-') as directory:
        subprocess.run(['node_modules/.bin/tsx','tools/cloud-blend-inputs.ts',directory],cwd=ROOT,check=True,timeout=90)
        spec=json.loads(pathlib.Path(directory,'spec.json').read_text());rows=[]
        for case in spec['cases']:
            failures=[];components=0
            for frame,files in enumerate(case['files']):
                actual=[struct.unpack('<'+'f'*(case['width']*case['height']*4),pathlib.Path(f).read_bytes()) for f in files]
                for y in range(case['height']):
                    for x in range(case['width']):
                        value=[list(c) for c in case['colors'][0]]
                        for i,covered in [(1,x<case['width']//2),(2,y<case['height']//2)]:
                            if not covered or i>=len(case['colors']):continue
                            for attachment,source in enumerate(case['colors'][i]):
                                value[attachment]=[source[c]*source[3]+value[attachment][c] for c in range(3)]+[source[3]+value[attachment][3]] if attachment<2 else list(source)
                                if case['format']=='rgba16f':value[attachment]=list(struct.unpack('<4e',struct.pack('<4e',*value[attachment])))
                        for attachment,rgba in enumerate(value):
                            for c,expected in enumerate(rgba):
                                got=actual[attachment][(y*case['width']+x)*4+c];components+=1
                                if struct.pack('<f',got)!=struct.pack('<f',expected):failures.append([frame,x,y,attachment,c,expected,got])
            rows.append({'kind':case['kind'],'format':case['format'],'attachments':case['count'],'frames':len(case['files']),'comparedComponents':components,'failedComponents':len(failures),'firstFailures':failures[:8],'passed':not failures})
        passed=all(r['passed'] for r in rows)
        report={'passed':passed,'complete':True,'device':spec['device'],'scope':'Independent analytical blend oracle for native same-pass multi-draw: first draw writes both/all attachments and depth, two overlapping Cloud draws use distinct pipeline/geometry/uniform descriptors, reversed winding, and depths behind baseline. RGB srcAlpha+dstOne and alpha srcOne+dstOne only for first two attachments; third/fourth overwrite. RGBA16F/RGBA32F exact bytes, repeated frames, single-scene reset and empty list draw checked. Explicit small shaders/geometry; not original Metal or full CloudCard/game execution.','fixtures':rows}
        report_path.write_text(json.dumps(report,indent=2,allow_nan=False)+'\n');print(json.dumps({'passed':passed,'fixtures':len(rows),'comparedComponents':sum(r['comparedComponents'] for r in rows),'failedComponents':sum(r['failedComponents'] for r in rows)}))
        if not passed:raise SystemExit(1)
if __name__=='__main__':main()
