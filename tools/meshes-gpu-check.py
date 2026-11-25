#!/usr/bin/env python3
"""Independent Mesa ES3 shader/raster verification on ARM PRoot.
All environment uniforms/textures below are explicit synthetic TEST inputs,
not game defaults. Original fragment bodies remain unchanged. This is neither
an Electron WebGL test nor a screenshot comparison against the original game.
"""
import ctypes as C, hashlib, json, os, pathlib, struct, subprocess
os.environ['LIBGL_ALWAYS_SOFTWARE']='1'
os.environ['EGL_PLATFORM']='surfaceless'
spec=json.loads(subprocess.run(['node_modules/.bin/tsx','tools/meshes-gpu-inputs.ts'],capture_output=True,check=True,text=True).stdout)
egl=C.CDLL('libEGL.so.1');gl=C.CDLL('libGLESv2.so.2')
def fn(lib,name,ret,args):
    f=getattr(lib,name);f.restype=ret;f.argtypes=args;return f
ptr=C.c_void_p;uint=C.c_uint;integer=C.c_int;flt=C.c_float
getproc=fn(egl,'eglGetProcAddress',ptr,[C.c_char_p])
getdisplay=C.CFUNCTYPE(ptr,uint,ptr,C.POINTER(integer))(getproc(b'eglGetPlatformDisplayEXT'))
display=getdisplay(0x31dd,None,None)
initialize=fn(egl,'eglInitialize',uint,[ptr,C.POINTER(integer),C.POINTER(integer)])
a=integer();b=integer();assert initialize(display,C.byref(a),C.byref(b))
attrs=(integer*15)(0x3033,1,0x3040,0x40,0x3024,8,0x3023,8,0x3022,8,0x3021,8,0x3025,24,0x3038)
config=ptr();count=integer()
assert fn(egl,'eglChooseConfig',uint,[ptr,C.POINTER(integer),C.POINTER(ptr),integer,C.POINTER(integer)])(display,attrs,C.byref(config),1,C.byref(count)) and count.value
assert fn(egl,'eglBindAPI',uint,[uint])(0x30a0)
context=fn(egl,'eglCreateContext',ptr,[ptr,ptr,ptr,C.POINTER(integer)])(display,config,None,(integer*3)(0x3098,3,0x3038))
surface=fn(egl,'eglCreatePbufferSurface',ptr,[ptr,ptr,C.POINTER(integer)])(display,config,(integer*5)(0x3057,32,0x3056,32,0x3038))
assert fn(egl,'eglMakeCurrent',uint,[ptr,ptr,ptr,ptr])(display,surface,surface,context)
string=fn(gl,'glGetString',C.c_char_p,[uint])
create=fn(gl,'glCreateShader',uint,[uint]);source=fn(gl,'glShaderSource',None,[uint,integer,C.POINTER(C.c_char_p),C.POINTER(integer)])
compile_shader=fn(gl,'glCompileShader',None,[uint]);shaderiv=fn(gl,'glGetShaderiv',None,[uint,uint,C.POINTER(integer)])
shaderlog=fn(gl,'glGetShaderInfoLog',None,[uint,integer,C.POINTER(integer),ptr])
newprogram=fn(gl,'glCreateProgram',uint,[]);attach=fn(gl,'glAttachShader',None,[uint,uint]);link=fn(gl,'glLinkProgram',None,[uint]);programiv=fn(gl,'glGetProgramiv',None,[uint,uint,C.POINTER(integer)]);programlog=fn(gl,'glGetProgramInfoLog',None,[uint,integer,C.POINTER(integer),ptr])
use=fn(gl,'glUseProgram',None,[uint]);uniform=fn(gl,'glGetUniformLocation',integer,[uint,C.c_char_p]);attrib=fn(gl,'glGetAttribLocation',integer,[uint,C.c_char_p])
u1i=fn(gl,'glUniform1i',None,[integer,integer]);u1f=fn(gl,'glUniform1f',None,[integer,flt])
um4=fn(gl,'glUniformMatrix4fv',None,[integer,integer,C.c_ubyte,C.POINTER(flt)])
uvec={n:fn(gl,f'glUniform{n}fv',None,[integer,integer,C.POINTER(flt)]) for n in [2,3,4]}
genbuffers=fn(gl,'glGenBuffers',None,[integer,C.POINTER(uint)]);bindbuffer=fn(gl,'glBindBuffer',None,[uint,uint]);bufferdata=fn(gl,'glBufferData',None,[uint,C.c_ssize_t,ptr,uint]);enable=fn(gl,'glEnableVertexAttribArray',None,[uint]);attribute=fn(gl,'glVertexAttribPointer',None,[uint,integer,uint,C.c_ubyte,integer,ptr])
gentextures=fn(gl,'glGenTextures',None,[integer,C.POINTER(uint)]);active=fn(gl,'glActiveTexture',None,[uint]);bindtexture=fn(gl,'glBindTexture',None,[uint,uint]);texparam=fn(gl,'glTexParameteri',None,[uint,uint,integer]);teximage=fn(gl,'glTexImage2D',None,[uint,integer,integer,integer,integer,integer,uint,uint,ptr])
draw=fn(gl,'glDrawArrays',None,[uint,integer,integer]);read=fn(gl,'glReadPixels',None,[integer,integer,integer,integer,uint,uint,ptr]);clearcolor=fn(gl,'glClearColor',None,[flt,flt,flt,flt]);clear=fn(gl,'glClear',None,[uint]);error=fn(gl,'glGetError',uint,[])
identity=(flt*16)(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1)
fixture={'u_eyePos':[0,2,5],'u_sunDir':[0,-1,0],'u_sunColor':[1,1,1],'u_averageSkyColor':[.25,.25,.25],'u_pointLight':[0,0,0],'u_viewportSize':[32,32],'u_lightShadowConsts':[0,-1,0,.01],'u_skirtDRange':[5]}
pixels=(C.c_ubyte*(32*32*4))();rows=[]
def shader(text,stage):
    s=create(stage);raw=text.encode();p=C.c_char_p(raw);source(s,1,C.byref(p),None);compile_shader(s);status=integer();shaderiv(s,0x8b81,C.byref(status))
    if not status.value:
        log=C.create_string_buffer(16000);shaderlog(s,len(log),None,log);raise ValueError(log.value.decode())
    return s
for p in spec['programs']:
    v=shader(p['vertex'],0x8b31);f=shader(p['fragment'],0x8b30);program=newprogram();attach(program,v);attach(program,f);link(program);status=integer();programiv(program,0x8b82,C.byref(status))
    if not status.value:
        log=C.create_string_buffer(16000);programlog(program,len(log),None,log);raise ValueError(p['name']+': '+log.value.decode())
    use(program);parameters={q['name']:q.get('vector',[]) for q in p['parameters']}
    seen=set();unit=0
    for item in p['variables']:
        name=item['name'];typ=item['type']
        if item['storage']!='uniform' or name in seen:continue
        seen.add(name);loc=uniform(program,name.encode())
        if loc<0:continue
        if typ=='mat4':um4(loc,1,0,identity)
        elif typ.startswith('sampler') or typ.startswith('usampler'):
            tex=uint();gentextures(1,C.byref(tex));active(0x84c0+unit);target=0x8513 if typ=='samplerCube' else 0x0de1;bindtexture(target,tex);texparam(target,0x2801,0x2600);texparam(target,0x2800,0x2600);texparam(target,0x2802,0x812f);texparam(target,0x2803,0x812f)
            if typ.startswith('usampler'):
                buf=(uint*(32*16*4))();teximage(target,0,0x8d70,32,16,0,0x8d99,0x1405,buf)
            else:
                buf=(C.c_ubyte*4)(128,128,255,255)
                for face in range(6 if target==0x8513 else 1):teximage(0x8515+face if target==0x8513 else target,0,0x8058,1,1,0,0x1908,0x1401,buf)
            u1i(loc,unit);unit+=1
        else:
            value=fixture.get(name,parameters.get(name,[]))
            if typ=='float':u1f(loc,value[0] if value else 0)
            elif typ.startswith('vec'):
                n=int(typ[-1]);value=(value+[0]*n)[:n];uvec[n](loc,1,(flt*n)(*value))
            elif typ in ['int','bool']:u1i(loc,0)
            else:raise ValueError(f'Unhandled test uniform {name}:{typ}')
    attrs={'a_position':([-0.8,-0.8,0, .8,-.8,0, 0,.8,0],3,0x1406,0),
           'position':([-0.8,-0.8,0, .8,-.8,0, 0,.8,0],3,0x1406,0),
           'a_normal':([0,127,0,0]*3,4,0x1400,1),
           'a_material0':([int(parameters.get('u_materialId',[1])[0]),0,0,0]*3,4,0x1401,1),
           'a_material1':([255,0,0,0]*3,4,0x1401,1),
           'a_light0':([128,64,32,255]*3,4,0x1401,1),
           'a_light1':([255,255,128,0]*3,4,0x1401,1),
           'a_light2':([128,255,128,0]*3,4,0x1401,1),
           'a_userData1':([255,255,255,0]*3,4,0x1401,1)}
    for name,(values,size,typ,normalized) in attrs.items():
        loc=attrib(program,name.encode())
        if loc<0:continue
        buf=(flt*len(values))(*values) if typ==0x1406 else (C.c_int8*len(values))(*values) if typ==0x1400 else (C.c_ubyte*len(values))(*values)
        buffer=uint();genbuffers(1,C.byref(buffer));bindbuffer(0x8892,buffer);bufferdata(0x8892,C.sizeof(buf),buf,0x88e4);enable(loc);attribute(loc,size,typ,normalized,0,None)
    if p['name']=='MeshesAttributeDiagnostic':
        um4(uniform(program,b'modelViewMatrix'),1,0,identity);um4(uniform(program,b'projectionMatrix'),1,0,identity);u1i(uniform(program,b'u_mode'),1);u1i(uniform(program,b'u_opaque'),1)
    clearcolor(0,0,0,0);clear(0x4000);draw(4,0,3);read(0,0,32,32,0x1908,0x1401,pixels);err=error();assert err==0,(p['name'],hex(err))
    raw=bytes(pixels);center=list(raw[(16*32+16)*4:(16*32+16)*4+4]);changed=sum(1 for i in range(0,len(raw),4) if raw[i:i+4]!=b'\0\0\0\0')
    if p['name']=='MeshesAttributeDiagnostic':assert center==[128,64,32,255],center
    rows.append({'name':p['name'],'compiled':True,'linked':True,'glError':err,'drawnPixels':changed,'centerRGBA':center,'rgbaSha256':hashlib.sha256(raw).hexdigest()})
# Pixel checks exercise the production state adapter, independently of game
# resources. The small color shader and triangles are explicit test fixtures.
cap_enable=fn(gl,'glEnable',None,[uint]);cap_disable=fn(gl,'glDisable',None,[uint])
depth_mask=fn(gl,'glDepthMask',None,[C.c_ubyte]);depth_func=fn(gl,'glDepthFunc',None,[uint])
color_mask=fn(gl,'glColorMask',None,[C.c_ubyte]*4);cull_face=fn(gl,'glCullFace',None,[uint])
front_face=fn(gl,'glFrontFace',None,[uint]);polygon_offset=fn(gl,'glPolygonOffset',None,[flt,flt])
blend_func=fn(gl,'glBlendFuncSeparate',None,[uint]*4);blend_equation=fn(gl,'glBlendEquationSeparate',None,[uint,uint])
depth_bits=integer();fn(gl,'glGetIntegerv',None,[uint,C.POINTER(integer)])(0x0d56,C.byref(depth_bits));assert depth_bits.value>=16
state_program=newprogram()
attach(state_program,shader('#version 300 es\nprecision highp float;in vec3 p;void main(){gl_Position=vec4(p,1.0);}',0x8b31))
attach(state_program,shader('#version 300 es\nprecision highp float;uniform vec4 color;out vec4 result;void main(){result=color;}',0x8b30))
link(state_program);status=integer();programiv(state_program,0x8b82,C.byref(status));assert status.value
use(state_program);position=attrib(state_program,b'p');color_location=uniform(state_program,b'color')
buffer=uint();genbuffers(1,C.byref(buffer));bindbuffer(0x8892,buffer);enable(position);attribute(position,3,0x1406,0,0,None)
states={s['group']:s for s in spec['states']};factors={'zero':0,'one':1,'sourceAlpha':0x0302,'oneMinusSourceAlpha':0x0303}
def apply_state(group):
    s=states[group]
    for cap,on in [(0x0b71,s['depthTest']),(0x0be2,s['blend']),(0x0b44,s['cull']=='back'),(0x8037,s['polygonOffset'])]:
        (cap_enable if on else cap_disable)(cap)
    depth_mask(s['depthWrite']);depth_func(0x0203);color_mask(*([s['colorWrite']]*4));cull_face(0x0405);front_face(0x0901)
    blend_func(*[factors[s[k]] for k in ['sourceRGB','destinationRGB','sourceAlpha','destinationAlpha']]);blend_equation(0x8006,0x8006)
    polygon_offset(s['polygonOffsetFactor'],s['polygonOffsetUnits'])
def reset_state_pixels():
    depth_mask(1);color_mask(1,1,1,1);clearcolor(0,0,0,0);clear(0x4000|0x0100)
def submit(group,color,z=0,clockwise=False,sloped=False):
    apply_state(group)
    vertices=[-.8,-.8,z,.8,-.8,z,0,.8,z]
    if sloped:vertices[2]=z-.15;vertices[5]=z+.15
    if clockwise:vertices[3:6],vertices[6:9]=vertices[6:9],vertices[3:6]
    data=(flt*9)(*vertices);bufferdata(0x8892,C.sizeof(data),data,0x88e4);uvec[4](color_location,1,(flt*4)(*color));draw(4,0,3)
def center():
    pixel=(C.c_ubyte*4)();read(16,16,1,1,0x1908,0x1401,pixel);err=error();assert err==0,hex(err);return list(pixel)
state_checks=[]
def check(name,actual,expected):
    assert all(abs(a-b)<=1 for a,b in zip(actual,expected)),(name,actual,expected)
    state_checks.append({'name':name,'actualRGBA':actual,'expectedRGBA':expected,'tolerance':1,'glError':0})
reset_state_pixels();submit('Opaque',[1,0,0,.25]);submit('Decal',[0,1,0,.5]);submit('Skirts',[0,0,1,.5])
check('decalThenSkirtBlendPreservesOpaqueAlpha',center(),[64,64,128,64])
reset_state_pixels();submit('Opaque',[1,0,0,.25]);submit('Decal',[0,1,0,.5],z=-.4);submit('Skirts',[0,0,1,.5],z=-.2)
check('overlaysDoNotWriteDepth',center(),[64,64,128,64])
reset_state_pixels();submit('Opaque',[1,0,0,.25]);submit('Decal',[0,1,0,.5],z=.4)
check('overlayBehindOpaqueFailsDepthTest',center(),[255,0,0,64])
reset_state_pixels();submit('Opaque',[1,0,0,.25]);submit('Opaque',[0,1,0,1],z=.4)
check('opaqueWritesDepth',center(),[255,0,0,64])
reset_state_pixels();submit('Opaque',[1,0,0,1],clockwise=True)
check('backFaceCulled',center(),[0,0,0,0])
reset_state_pixels();submit('Opaque',[1,0,0,.25],sloped=True);submit('Decal',[0,1,0,.5],sloped=True)
check('slopedCoplanarDecalWithNativeBias',center(),[128,128,0,64])
report={'renderer':string(0x1f01).decode(),'version':string(0x1f02).decode(),'scope':__doc__,'fixture':fixture,'textureFixture':'Explicit 1x1 RGBA8 [128,128,255,255], zero RGBA32UI 32x16 light grid; no native game textures/environment assumed. Other test-only scalar uniforms are zero and matrices identity.', 'programs':rows,'missingShaderDeclarations':spec['missing'],
        'bakedRenderStates':spec['states'],'stateChecks':state_checks,'depthBits':depth_bits.value,
        'stateCheckScope':'Production Three state adapter translated to GLES; explicit color shader and synthetic triangles. Native mask disabling alpha is represented by ZERO/ONE alpha blend factors. Editor OpenGL CCW front convention. No original game screenshot comparison.'}
pathlib.Path('docs/meshes-gpu.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'renderer':report['renderer'],'programs':len(rows),'drawnPixels':sum(r['drawnPixels'] for r in rows),'diagnosticRGBA':rows[-1]['centerRGBA'],'stateChecks':len(state_checks),'missing':spec['missing']}))
