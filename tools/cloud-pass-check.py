#!/usr/bin/env python3
"""Check original fine/Card/particle outputs accumulated in a single pass."""
import argparse,json,math,pathlib,struct,subprocess,tempfile
ROOT=pathlib.Path(__file__).resolve().parent.parent
def main():
    parser=argparse.ArgumentParser();parser.add_argument('--fine',required=True);parser.add_argument('--cards',required=True);args=parser.parse_args()
    report_path=ROOT/'docs/cloud-pass-check.json';report_path.write_text(json.dumps({'passed':False,'complete':False})+'\n')
    with tempfile.TemporaryDirectory(prefix='sky-cloud-pass-') as directory:
        subprocess.run(['node_modules/.bin/tsx','tools/cloud-pass-inputs.ts',directory,args.fine,args.cards],cwd=ROOT,check=True,timeout=90)
        spec=json.loads(pathlib.Path(directory,'spec.json').read_text());count=spec['width']*spec['height']*4
        read=lambda f:list(struct.unpack('<'+'f'*count,pathlib.Path(f).read_bytes()))
        f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
        half=lambda x:struct.unpack('<e',struct.pack('<e',x))[0]
        standalone=[[read(f) for f in stage] for stage in spec['standalone']];actual=[read(f) for f in spec['outputs']];failures=[];nonzero=[]
        for stage in standalone[1:]:nonzero.append(sum(stage[0][i*4+3]>0 for i in range(count//4)))
        for attachment in range(2):
            expected=list(standalone[0][attachment])
            for stage in standalone[1:]:
                source=stage[attachment]
                for at in range(0,count,4):
                    for c in range(4):expected[at+c]=half(f32(source[at+c]+expected[at+c])) if c==3 else half(f32(f32(source[at+c]*source[at+3])+expected[at+c]))
            for i,(a,b) in enumerate(zip(actual[attachment],expected)):
                if struct.pack('<f',a)!=struct.pack('<f',b):failures.append([attachment,i,b,a])
        empty_failures=sum(pathlib.Path(a).read_bytes()!=pathlib.Path(b).read_bytes() for a,b in zip(spec['emptyOutputs'],spec['standalone'][0]))
        def rtz(v):
            raw=struct.pack('<e',v);q=struct.unpack('<e',raw)[0]
            return struct.unpack('<e',struct.pack('<H',struct.unpack('<H',raw)[0]-1))[0] if abs(q)>abs(v) else q
        rtz_failures=0
        for attachment in range(2):
            expected=list(standalone[0][attachment])
            for stage in standalone[1:]:
                source=stage[attachment]
                for at in range(0,count,4):
                    for c in range(4):expected[at+c]=rtz(f32(source[at+c]+expected[at+c])) if c==3 else rtz(f32(f32(source[at+c]*source[at+3])+expected[at+c]))
            rtz_failures+=sum(struct.pack('<f',a)!=struct.pack('<f',b) for a,b in zip(actual[attachment],expected))
        probe_path=ROOT/'docs/vulkan-blend-rounding-check.json';probe=json.loads(probe_path.read_text()) if probe_path.is_file() else {}
        independent_rtz=probe.get('complete') and probe.get('device',{}).get('device')==spec['device']['device'] and probe['fixtures'][0]['modes']['rtz']['matched'] and probe['fixtures'][1]['modes']['float32']['matched']
        passed=not failures and not empty_failures and all(nonzero)
        report={'passed':passed,'complete':True,'device':spec['device'],'scope':spec['scope']+' Independent blend arithmetic uses standalone original half outputs and checks final half bytes; actual shader output correctness is covered separately by the original AIR CPU oracle.',
            'shaders':spec['shaders'],'size':[spec['width'],spec['height']],'comparedComponents':count*2,'nonzeroCloudPixels':nonzero,'failedComponents':len(failures),'firstFailures':failures[:12],'emptyListFailedAttachments':empty_failures,
            'rteReferencePassed':not failures,'rtzFailedComponents':rtz_failures,'driverReproductionPassed':bool(independent_rtz and not rtz_failures and not empty_failures and all(nonzero)),
            'independentRoundingProbe':'docs/vulkan-blend-rounding-check.json','observedDriverHalfBlendConversion':'RTZ' if independent_rtz else 'unverified','originalMetalBlendConversionVerified':False}
        report['scope']+=' RTE remains the strict reference and its failures are retained. An independent non-game blend probe confirms this llvmpipe driver converts half blend results with RTZ; RTZ reproduction is reported separately, not substituted for original Metal acceptance.'
        report_path.write_text(json.dumps(report,indent=2,allow_nan=False)+'\n');print(json.dumps({k:report[k] for k in ['passed','comparedComponents','nonzeroCloudPixels','failedComponents','emptyListFailedAttachments']}))
        if not passed:raise SystemExit(1)
if __name__=='__main__':main()
