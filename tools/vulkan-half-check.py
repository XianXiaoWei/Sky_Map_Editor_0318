#!/usr/bin/env python3
"""Check generated AIR half rounding against Python's independent IEEE RTE.
All finite binary16 encodings, rounding ties/neighbors, signed zero, subnormals,
and overflow boundaries. Executes the actual Vulkan host; no game acceptance.
"""
import array, json, math, pathlib, struct, subprocess, tempfile
ROOT = pathlib.Path(__file__).resolve().parent.parent

def half(v):
    try: return struct.unpack('<e', struct.pack('<e', v))[0]
    except OverflowError: return math.copysign(math.inf, v)

def bits(v): return struct.pack('<f', v)

def main():
    report_path=ROOT/'docs/vulkan-half-check.json'
    report_path.write_text(json.dumps({'passed':False,'complete':False,'status':'Check started; no completed result yet'})+'\n')
    cases = []
    for encoding in range(65536):
        value = struct.unpack('<e', struct.pack('<H', encoding))[0]
        if math.isfinite(value): cases.append(value)
    for encoding in range(0x7bff):
        a, b = (struct.unpack('<e',struct.pack('<H',h))[0] for h in [encoding,encoding+1])
        midpoint = (a+b)*.5; word = struct.unpack('<I',bits(midpoint))[0]
        for w in [word-1,word,word+1]:
            value=struct.unpack('<f',struct.pack('<I',w))[0]; cases.extend([value,-value])
    for value in [65504.,65519.,65520.,65521.,1e10]: cases.extend([value,-value])
    if len(cases)>512*512: raise ValueError('Probe texture too small')
    values=array.array('f',cases+[0.]*(512*512-len(cases)))
    with tempfile.TemporaryDirectory(prefix='sky-half-probe-') as temporary:
        temp=pathlib.Path(temporary);(temp/'values.f32').write_bytes(values.tobytes())
        subprocess.run(['node_modules/.bin/tsx','tools/vulkan-half-inputs.ts',str(temp)],cwd=ROOT,check=True,timeout=60)
        actual=array.array('f');actual.frombytes((temp/'actual.f32').read_bytes());failures=[];raw_failures=0
        for i,value in enumerate(cases):
            expected=half(value)
            if bits(expected)!=bits(actual[i*4]): failures.append([i,value,expected,actual[i*4]])
            raw_failures+=bits(expected)!=bits(actual[i*4+1])
        report={'passed':not failures,'complete':True,'device':json.loads((temp/'device.json').read_text()),'cases':len(cases),'finiteHalfEncodings':63488,'rounding':'IEEE binary16 nearest ties to even; independent Python struct reference, float32 texture inputs','explicitBitRoundingFailures':len(failures),'firstFailures':failures[:10],'rawFloat16CastFailures':raw_failures,'scope':'Native Vulkan generated AIR rounding helper vs independent IEEE binary16 conversion. All finite encodings, positive/negative ties and neighbors, subnormal/signed-zero and overflow boundaries. No original Metal or game-render acceptance.'}
        report_path.write_text(json.dumps(report,indent=2)+'\n')
        print(json.dumps({k:report[k] for k in ['passed','cases','explicitBitRoundingFailures','rawFloat16CastFailures']}))
        if failures:raise SystemExit(1)

if __name__=='__main__':main()
