#!/usr/bin/env python3
"""Check real Vulkan half texture uploads, attachment storage and readback."""
import json, math, pathlib, struct, subprocess, tempfile
ROOT=pathlib.Path(__file__).resolve().parent.parent

def main():
    report_path=ROOT/'docs/vulkan-target-formats.json'
    report_path.write_text(json.dumps({'passed':False,'complete':False})+'\n')
    with tempfile.TemporaryDirectory(prefix='sky-target-format-') as directory:
        tmp=pathlib.Path(directory);vert=tmp/'quad.vert';frag=tmp/'copy.frag'
        vert.write_text('#version 450\nlayout(location=0) in vec2 a_position;void main(){gl_Position=vec4(a_position,0,1);}\n')
        frag.write_text('#version 450\nuniform sampler2D u_texture;layout(location=0) out vec4 result;void main(){result=texelFetch(u_texture,ivec2(gl_FragCoord.xy),0);}\n')
        bits=[i for i in range(65536) if i&0x7c00!=0x7c00]
        fixtures=[];expected=[]
        for channels,fmt in [(1,'r16f'),(2,'rg16f'),(4,'rgba16f')]:
            width=256;height=len(bits)//channels//width
            source=tmp/(fmt+'.bin');source.write_bytes(struct.pack('<'+'H'*len(bits),*bits))
            output=tmp/(fmt+'.f32')
            fixtures.append({'name':fmt,'vert':str(vert),'frag':str(frag),'width':width,'height':height,
                'textures':{'u_texture':{'format':fmt,'dimensions':[width,height,1],'linear':False,'repeat':False,'data':str(source)}},
                'uniforms':{},'colorFormats':[fmt],'output':str(output)})
            values=list(struct.unpack('<'+'e'*len(bits),source.read_bytes()))
            rgba=[]
            for at in range(0,len(values),channels):rgba.extend(values[at:at+channels]+([0,0,1] if channels==1 else [0,1] if channels==2 else []))
            expected.append(rgba)
        # Float32 shader values must actually be quantized by the attachment,
        # including negative zero, subnormals, ties and overflow boundaries.
        values=[]
        for value in [0.,-0.,2**-25,-2**-25,2**-24,-2**-24,.3333,-.3333,1.,-1.,65504.,-65504.,65520.,-65520.]:
            values.extend([value, math.nextafter(value,math.inf), math.nextafter(value,-math.inf)])
        # Use float32 predecessor/successor, not double neighbors lost on upload.
        for value in [.00006103515625,.5,1.,32.,65520.]:
            code=struct.unpack('<I',struct.pack('<f',value))[0]
            values.extend(struct.unpack('<3f',struct.pack('<3I',code-1,code,code+1)))
        values.extend([1+2**-11,-1-2**-11,.5+2**-12,-.5-2**-12])
        values += [0.] * ((256-len(values)%256)%256)
        source=tmp/'quantize.bin';source.write_bytes(struct.pack('<'+'f'*len(values),*values));output=tmp/'quantize.f32'
        fixtures.append({'name':'float32-to-r16f','vert':str(vert),'frag':str(frag),'width':256,'height':len(values)//256,
            'textures':{'u_texture':{'format':'r32f','dimensions':[256,len(values)//256,1],'linear':False,'repeat':False,'data':str(source)}},
            'uniforms':{},'colorFormats':['r16f'],'output':str(output)})
        rgba=[]
        for v in struct.unpack('<'+'f'*len(values),source.read_bytes()):
            try:half=struct.unpack('<e',struct.pack('<e',v))[0]
            except OverflowError:half=math.copysign(math.inf,v)
            rgba.extend([half,0.,0.,1.])
        expected.append(rgba)
        spec=tmp/'spec.json';spec.write_text(json.dumps({'fixtures':fixtures}))
        subprocess.run(['node_modules/.bin/tsx','tools/vulkan-sampler-inputs.ts',str(spec)],cwd=ROOT,check=True,timeout=90)
        rows=[]
        for f,reference in zip(fixtures,expected):
            actual=list(struct.unpack('<'+'f'*len(reference),pathlib.Path(f['output']).read_bytes()))
            printable=lambda value: value if math.isfinite(value) else 'Infinity' if value > 0 else '-Infinity' if value < 0 else 'NaN'
            failures=[[i,printable(a),printable(b)] for i,(a,b) in enumerate(zip(actual,reference)) if struct.pack('<f',a)!=struct.pack('<f',b)]
            rows.append({'name':f['name'],'pixels':f['width']*f['height'],'components':len(reference),'failedComponents':len(failures),'firstFailures':failures[:5],'passed':not failures})
        passed=all(r['passed'] for r in rows)
        report={'passed':passed,'complete':True,'device':json.loads(spec.read_text())['device'],
            'scope':'All 63,488 finite half encodings uploaded in each of R16F/RG16F/RGBA16F, copied through matching native Vulkan attachments and read back as float32 RGBA. Float32-to-R16F storage checks include subnormals, negative zero, ties and overflow. Exact float32 bytes checked, including missing channels. No original Metal GPU acceptance.', 'fixtures':rows}
        report_path.write_text(json.dumps(report,indent=2,allow_nan=False)+'\n')
        print(json.dumps({'pixels':sum(r['pixels'] for r in rows),'failedComponents':sum(r['failedComponents'] for r in rows),'passed':passed}))
        if not passed:raise SystemExit(1)
if __name__=='__main__':main()
