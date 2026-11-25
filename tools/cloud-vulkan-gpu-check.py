#!/usr/bin/env python3
"""Compare actual native Vulkan cloud pixels with the unchanged original ES3
shader bodies on an independent GLES driver, using the same explicit fixtures.
This checks translation/bindings; it is not original-game image acceptance.
"""
import array, ctypes as C, hashlib, json, math, os, pathlib, subprocess, tempfile
os.environ['LIBGL_ALWAYS_SOFTWARE'] = '1'
os.environ['EGL_PLATFORM'] = 'surfaceless'
root = pathlib.Path(__file__).resolve().parent.parent

egl, gl = C.CDLL('libEGL.so.1'), C.CDLL('libGLESv2.so.2')
ptr, uint, integer, flt = C.c_void_p, C.c_uint, C.c_int, C.c_float
def fn(lib, name, result, args):
    f = getattr(lib, name); f.restype = result; f.argtypes = args; return f
getproc = fn(egl, 'eglGetProcAddress', ptr, [C.c_char_p])
getdisplay = C.CFUNCTYPE(ptr, uint, ptr, C.POINTER(integer))(getproc(b'eglGetPlatformDisplayEXT'))
display = getdisplay(0x31dd, None, None)
a, b = integer(), integer()
assert fn(egl,'eglInitialize',uint,[ptr,C.POINTER(integer),C.POINTER(integer)])(display,C.byref(a),C.byref(b))
attrs = (integer*15)(0x3033,1,0x3040,0x40,0x3024,8,0x3023,8,0x3022,8,0x3021,8,0x3025,24,0x3038)
config, count = ptr(), integer()
assert fn(egl,'eglChooseConfig',uint,[ptr,C.POINTER(integer),C.POINTER(ptr),integer,C.POINTER(integer)])(display,attrs,C.byref(config),1,C.byref(count)) and count.value
assert fn(egl,'eglBindAPI',uint,[uint])(0x30a0)
context = fn(egl,'eglCreateContext',ptr,[ptr,ptr,ptr,C.POINTER(integer)])(display,config,None,(integer*3)(0x3098,3,0x3038))
surface = fn(egl,'eglCreatePbufferSurface',ptr,[ptr,ptr,C.POINTER(integer)])(display,config,(integer*5)(0x3057,16,0x3056,16,0x3038))
assert fn(egl,'eglMakeCurrent',uint,[ptr,ptr,ptr,ptr])(display,surface,surface,context)
string = fn(gl,'glGetString',C.c_char_p,[uint])
create = fn(gl,'glCreateShader',uint,[uint]); source = fn(gl,'glShaderSource',None,[uint,integer,C.POINTER(C.c_char_p),C.POINTER(integer)])
compile_shader = fn(gl,'glCompileShader',None,[uint]); shaderiv = fn(gl,'glGetShaderiv',None,[uint,uint,C.POINTER(integer)]); shaderlog = fn(gl,'glGetShaderInfoLog',None,[uint,integer,C.POINTER(integer),ptr])
newprogram = fn(gl,'glCreateProgram',uint,[]); attach = fn(gl,'glAttachShader',None,[uint,uint]); link = fn(gl,'glLinkProgram',None,[uint]); programiv = fn(gl,'glGetProgramiv',None,[uint,uint,C.POINTER(integer)]); programlog = fn(gl,'glGetProgramInfoLog',None,[uint,integer,C.POINTER(integer),ptr])
use = fn(gl,'glUseProgram',None,[uint]); uniform = fn(gl,'glGetUniformLocation',integer,[uint,C.c_char_p]); attrib = fn(gl,'glGetAttribLocation',integer,[uint,C.c_char_p])
u1i = fn(gl,'glUniform1i',None,[integer,integer]); u1f = fn(gl,'glUniform1f',None,[integer,flt]); um4 = fn(gl,'glUniformMatrix4fv',None,[integer,integer,C.c_ubyte,C.POINTER(flt)])
uvec = {n:fn(gl,f'glUniform{n}fv',None,[integer,integer,C.POINTER(flt)]) for n in [2,3,4]}
genbuffers = fn(gl,'glGenBuffers',None,[integer,C.POINTER(uint)]); bindbuffer = fn(gl,'glBindBuffer',None,[uint,uint]); bufferdata = fn(gl,'glBufferData',None,[uint,C.c_ssize_t,ptr,uint])
enable = fn(gl,'glEnableVertexAttribArray',None,[uint]); attribute = fn(gl,'glVertexAttribPointer',None,[uint,integer,uint,C.c_ubyte,integer,ptr])
gentextures = fn(gl,'glGenTextures',None,[integer,C.POINTER(uint)]); active = fn(gl,'glActiveTexture',None,[uint]); bindtexture = fn(gl,'glBindTexture',None,[uint,uint]); texparam = fn(gl,'glTexParameteri',None,[uint,uint,integer])
teximage2 = fn(gl,'glTexImage2D',None,[uint,integer,integer,integer,integer,integer,uint,uint,ptr]); teximage3 = fn(gl,'glTexImage3D',None,[uint,integer,integer,integer,integer,integer,integer,uint,uint,ptr])
pixelstore = fn(gl,'glPixelStorei',None,[uint,integer]); genfb = fn(gl,'glGenFramebuffers',None,[integer,C.POINTER(uint)]); bindfb = fn(gl,'glBindFramebuffer',None,[uint,uint]); fbtexture = fn(gl,'glFramebufferTexture2D',None,[uint,uint,uint,uint,integer]); statusfb = fn(gl,'glCheckFramebufferStatus',uint,[uint])
drawbuffers = fn(gl,'glDrawBuffers',None,[integer,C.POINTER(uint)]); readbuffer = fn(gl,'glReadBuffer',None,[uint]); viewport = fn(gl,'glViewport',None,[integer,integer,integer,integer]); disable = fn(gl,'glDisable',None,[uint])
draw = fn(gl,'glDrawElements',None,[uint,integer,uint,ptr]); read = fn(gl,'glReadPixels',None,[integer,integer,integer,integer,uint,uint,ptr]); error = fn(gl,'glGetError',uint,[])
delete_tex = fn(gl,'glDeleteTextures',None,[integer,C.POINTER(uint)]); delete_buffer = fn(gl,'glDeleteBuffers',None,[integer,C.POINTER(uint)]); disable_attr = fn(gl,'glDisableVertexAttribArray',None,[uint])
def shader(text, stage):
    s = create(stage); raw = text.encode(); p = C.c_char_p(raw); source(s,1,C.byref(p),None); compile_shader(s); ok = integer(); shaderiv(s,0x8b81,C.byref(ok))
    if not ok.value:
        log = C.create_string_buffer(64000); shaderlog(s,len(log),None,log); raise ValueError(log.value.decode())
    return s

with tempfile.TemporaryDirectory(prefix='sky-cloud-vulkan-gpu-') as temp:
    subprocess.run(['node_modules/.bin/tsx','tools/cloud-vulkan-inputs.ts',temp],cwd=root,check=True,timeout=60)
    spec = json.loads((pathlib.Path(temp)/'spec.json').read_text()); rows = []
    for p in spec['programs']:
        program = newprogram(); attach(program,shader(pathlib.Path(p['vertexFile']).read_text(),0x8b31)); attach(program,shader(pathlib.Path(p['fragmentFile']).read_text(),0x8b30)); link(program); ok = integer(); programiv(program,0x8b82,C.byref(ok))
        if not ok.value:
            log = C.create_string_buffer(64000); programlog(program,len(log),None,log); raise ValueError(log.value.decode())
        use(program); texids, bufids, locations = [], [], []
        for name,value in p['uniforms'].items():
            loc = uniform(program,name.encode())
            if loc < 0: continue
            if isinstance(value,list):
                if len(value)==16: um4(loc,1,0,(flt*16)(*value))
                else: uvec[len(value)](loc,1,(flt*len(value))(*value))
            else: u1f(loc,value)
        pixelstore(0x0cf5,1)
        for unit,(name,t) in enumerate(p['textures'].items()):
            loc = uniform(program,name.encode())
            if loc < 0: continue
            tex = uint(); gentextures(1,C.byref(tex)); texids.append(tex.value); active(0x84c0+unit)
            volume = name in ['u_cloudSparse','u_cloudDist','u_cloudAmb0','u_cloudAmb1','u_cloudAmb2','u_cloudNoise3D']; target = 0x806f if volume else 0x0de1
            bindtexture(target,tex); texparam(target,0x2801,0x2601 if t['linear'] else 0x2600); texparam(target,0x2800,0x2601 if t['linear'] else 0x2600)
            for axis in [0x2802,0x2803]+([0x8072] if volume else []): texparam(target,axis,0x2901 if t['repeat'] else 0x812f)
            internal, fmt, typ = {'r8':(0x8229,0x1903,0x1401),'rgba8':(0x8058,0x1908,0x1401),'r32f':(0x822e,0x1903,0x1406),'rgba32f':(0x8814,0x1908,0x1406)}[t['format']]
            raw = pathlib.Path(t['data']).read_bytes(); buf = C.create_string_buffer(raw); w,h,d = t['dimensions']
            if volume: teximage3(target,0,internal,w,h,d,0,fmt,typ,buf)
            else: teximage2(target,0,internal,w,h,0,fmt,typ,buf)
            u1i(loc,unit)
        assert error()==0,(p['name'],'texture upload')
        raw = pathlib.Path(p['vertices']).read_bytes(); vb = uint(); genbuffers(1,C.byref(vb)); bufids.append(vb.value); bindbuffer(0x8892,vb); bufferdata(0x8892,len(raw),C.create_string_buffer(raw),0x88e4)
        for name,a in p['attributes'].items():
            loc = attrib(program,name.encode())
            if loc<0: continue
            components,typ,norm = {'vec2':(2,0x1406,0),'vec3':(3,0x1406,0),'vec4':(4,0x1406,0),'snorm4':(4,0x1400,1),'unorm4':(4,0x1401,1)}[a['format']]
            locations.append(loc); enable(loc); attribute(loc,components,typ,norm,p['stride'],ptr(a['offset']))
        raw = pathlib.Path(p['indices']).read_bytes(); ib = uint(); genbuffers(1,C.byref(ib)); bufids.append(ib.value); bindbuffer(0x8893,ib); bufferdata(0x8893,len(raw),C.create_string_buffer(raw),0x88e4)
        framebuffer = uint(); genfb(1,C.byref(framebuffer)); bindfb(0x8d40,framebuffer); w,h = p['width'],p['height']
        active(0x84c0+31)
        for i in range(len(p['outputFiles'])):
            tex = uint(); gentextures(1,C.byref(tex)); texids.append(tex.value); bindtexture(0x0de1,tex); texparam(0x0de1,0x2801,0x2600); texparam(0x0de1,0x2800,0x2600)
            teximage2(0x0de1,0,0x8814,w,h,0,0x1908,0x1406,None); fbtexture(0x8d40,0x8ce0+i,0x0de1,tex,0)
        drawbuffers(len(p['outputFiles']),(uint*len(p['outputFiles']))(*[0x8ce0+i for i in range(len(p['outputFiles']))])); assert statusfb(0x8d40)==0x8cd5
        viewport(0,0,w,h)
        for state in [0x0b71,0x0b44,0x0be2]: disable(state)
        draw(4,len(raw)//4,0x1405,None); assert error()==0,(p['name'],'draw')
        attachments = []
        for output in p['outputs']:
            i = output['location']; count = output['type'].get('count',1); values = (flt*(w*h*4))(); readbuffer(0x8ce0+i); read(0,0,w,h,0x1908,0x1406,values); assert error()==0
            native = array.array('f'); native.frombytes(pathlib.Path(p['outputFiles'][i]).read_bytes())
            differences = [abs(values[pixel*4+c]-native[pixel*4+c]) for pixel in range(w*h) for c in range(count)]
            failed = [(pixel,c,values[pixel*4+c],native[pixel*4+c]) for pixel in range(w*h) for c in range(count) if not math.isfinite(values[pixel*4+c]) or not math.isfinite(native[pixel*4+c]) or abs(values[pixel*4+c]-native[pixel*4+c]) > .025 + .01*abs(values[pixel*4+c])]
            nonzero = sum(1 for pixel in range(w*h) if any(native[pixel*4+c]!=0 for c in range(count)))
            if count == 4 or p['cameraCase'] == 'outside': assert nonzero>0,(p['name'],i,'empty output does not exercise this pass')
            attachments.append({'location':i,'components':count,'comparedComponents':w*h*count,'maxAbsoluteDifference':max(differences),'nonzeroPixels':nonzero,'failedComponents':len(failed),'firstFailures':failed[:5],'nativeSha256':hashlib.sha256(pathlib.Path(p['outputFiles'][i]).read_bytes()).hexdigest(),'glesSha256':hashlib.sha256(bytes(values)).hexdigest(),'passed':not failed})
        rows.append({'name':p['name'],'cameraCase':p['cameraCase'],'attachments':attachments})
        bindfb(0x8d40,0)
        for loc in locations: disable_attr(loc)
        delete_tex(len(texids),(uint*len(texids))(*texids)); delete_buffer(len(bufids),(uint*len(bufids))(*bufids))
    passed = all(a['passed'] for r in rows for a in r['attachments'])
    report = {'passed':passed,'device':spec['device'],'referenceGLES':string(0x1f01).decode(),'scope':spec['fixture']+' Independent unchanged original GLSL ES GPU reference; compares declared outputs only. Relaxed-precision cross-driver tolerance: 0.025 + 1% of reference magnitude. No original Compositor, temporal history, game screenshot or Windows validation.','level':spec['level'],'blocks':spec['blocks'],'programs':rows}
    (root/'docs/cloud-vulkan-gpu.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({'device':report['device'],'programs':len(rows),'attachments':sum(len(r['attachments']) for r in rows),'passed':passed}))
    if not passed: raise SystemExit(1)
