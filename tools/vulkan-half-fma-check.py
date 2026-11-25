#!/usr/bin/env python3
"""Exact fused half fast multiply/add check against directly compiled LLVM."""
import ctypes as C, hashlib, importlib.util, json, math, pathlib, random, struct, subprocess, tempfile
ROOT=pathlib.Path(__file__).resolve().parent.parent
module=importlib.util.spec_from_file_location('air',ROOT/'tools/air-to-vulkan.py')
air=importlib.util.module_from_spec(module);module.loader.exec_module(air)

def main():
    report_path=ROOT/'docs/vulkan-half-fma-check.json'
    report_path.write_text(json.dumps({'passed':False,'complete':False})+'\n')
    with tempfile.TemporaryDirectory(prefix='sky-half-fma-') as directory:
        tmp=pathlib.Path(directory)
        # Small, unchanged LLVM instruction bodies model the original AIR fast
        # half multiply/add boundary. These are synthetic arithmetic fixtures.
        llvm=''
        for name,operation in [('add','fadd'),('subtract','fsub')]:
            llvm+=f'define float @half_{name}(half %a, half %b, half %c) #0 {{\n  %product = fmul fast half %a, %b\n  %result = {operation} fast half %product, %c\n  %float = fpext half %result to float\n  ret float %float\n}}\n'
        llvm+='declare half @llvm.fma.f16(half, half, half)\n'
        for name,negate in [('fused_add',False),('fused_subtract',True)]:
            llvm+=f'define float @half_{name}(half %a, half %b, half %c) #0 {{\n'
            if negate:llvm+='  %negative = fneg half %c\n'
            llvm+='  %result = call half @llvm.fma.f16(half %a, half %b, half '+('%negative' if negate else '%c')+')\n  %float = fpext half %result to float\n  ret float %float\n}\n'
        llvm+='attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "unsafe-fp-math"="true" }\n'
        ll=tmp/'oracle.ll';ll.write_text(llvm);obj=tmp/'oracle.o'
        subprocess.run(['clang','--target=aarch64-linux-gnu','-Wno-override-module','-fPIC','-O0','-c',str(ll),'-o',str(obj)],check=True,capture_output=True)
        c=tmp/'wrapper.c';c.write_text('extern float half_add(_Float16,_Float16,_Float16);extern float half_subtract(_Float16,_Float16,_Float16);extern float half_fused_add(_Float16,_Float16,_Float16);extern float half_fused_subtract(_Float16,_Float16,_Float16);\nvoid run(const float* v,float* out){out[0]=half_fused_add(v[0],v[1],v[2]);out[1]=half_fused_subtract(v[0],v[1],v[2]);out[2]=half_add(v[0],v[1],v[2]);out[3]=half_subtract(v[0],v[1],v[2]);}\n')
        wrapper=tmp/'wrapper.o';lib=tmp/'reference.so'
        subprocess.run(['clang','--target=aarch64-linux-gnu','--sysroot=/','--gcc-toolchain=/usr','-fPIC','-O0','-c',str(c),'-o',str(wrapper)],check=True,capture_output=True)
        subprocess.run(['gcc','-shared',str(obj),str(wrapper),'-lm','-o',str(lib)],check=True,capture_output=True)
        cpu=C.CDLL(str(lib)).run;cpu.argtypes=[C.POINTER(C.c_float),C.POINTER(C.c_float)];cpu.restype=None
        rng=random.Random(318);values=[];expected=[];contraction_differences=0
        half=lambda v:struct.unpack('<e',struct.pack('<e',v))[0]
        for i in range(4096):
            a,b,c=[half(rng.uniform(-8,8)) for _ in range(3)]
            if i%2==0:c=-half(a*b) # Cancellation exposes premature product rounding.
            values.extend([a,b,c,0]);out=(C.c_float*4)();cpu((C.c_float*3)(a,b,c),out);expected.extend([out[0],out[1],0,1]);contraction_differences+=sum(out[j]!=out[j+2] for j in range(2))
        src=tmp/'inputs.bin';src.write_bytes(struct.pack('<'+'f'*len(values),*values))
        # Use exactly the generated runtime rounding helper, not native casts.
        generated=(ROOT/'evidence/cloud-air-vulkan/CloudFluffy0.frag').read_text()
        helpers=generated[generated.index('float air_quantize('):generated.index('ivec3 air_texel_coord(')]
        vert=tmp/'quad.vert';vert.write_text('#version 450\nlayout(location=0) in vec2 a_position;void main(){gl_Position=vec4(a_position,0,1);}\n')
        frag=tmp/'fma.frag';frag.write_text('#version 450\nuniform sampler2D u_texture;layout(location=0) out vec4 result;\n'+helpers+'\nvoid main(){vec3 v=texelFetch(u_texture,ivec2(gl_FragCoord.xy),0).xyz;result=vec4(air_quantize(fma(v.x,v.y,v.z)),air_quantize(fma(v.x,v.y,-v.z)),0,1);}\n')
        output=tmp/'output.f32';spec=tmp/'spec.json';spec.write_text(json.dumps({'fixtures':[{'name':'half fast FMA','vert':str(vert),'frag':str(frag),'width':64,'height':64,'uniforms':{},'textures':{'u_texture':{'format':'rgba32f','dimensions':[64,64,1],'linear':False,'repeat':False,'data':str(src)}},'output':str(output)}]}))
        subprocess.run(['node_modules/.bin/tsx','tools/vulkan-sampler-inputs.ts',str(spec)],cwd=ROOT,check=True,timeout=90)
        actual=struct.unpack('<'+'f'*len(expected),output.read_bytes())
        failures=[[i,a,b] for i,(a,b) in enumerate(zip(actual,expected)) if a!=b or not math.isfinite(a)]
        passed=not failures
        report={'passed':passed,'complete':True,'device':json.loads(spec.read_text())['device'],
            'scope':'4,096 synthetic half operand triples, including cancellation. Independent LLVM llvm.fma.f16 intrinsic compiled at O0 to AArch64 versus Vulkan float32 FMA with explicit half rounding. Exact float32 values checked. Separate fmul fast half plus fadd/fsub fast half fixture measures the compiler choice to contract: fast permits fusion but does not require it. Original Metal hardware and game acceptance remain separate.',
            'referenceLlvmSha256':hashlib.sha256(llvm.encode()).hexdigest(),'triples':4096,'operations':8192,'compilerContractionDifferences':contraction_differences,'failedComponents':len(failures),'firstFailures':failures[:5]}
        report_path.write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({'operations':8192,'failedComponents':len(failures),'passed':passed}))
        if not passed:raise SystemExit(1)
if __name__=='__main__':main()
