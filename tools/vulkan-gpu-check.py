#!/usr/bin/env python3
"""Actual offscreen Vulkan raster/readback checks with explicit test scenes.
The native production host executes all pipelines; this is not original-game
image parity or Windows GPU validation.
"""
import hashlib, json, os, pathlib, struct, subprocess

root = pathlib.Path(__file__).resolve().parent.parent
identity = [1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,1]
def request(kind, payload): return struct.pack('<II', kind, len(payload)) + payload
def triangle(color, depth=0, reverse=False, slope=0):
    p = [[-.8,-.8,depth-slope], [.8,-.8,depth+slope], [0,.8,depth]]
    if reverse: p.reverse()
    return [component for v in p for component in v + color]
def scene(draws):
    vertices, commands = [], []
    for values, state, mode in draws:
        commands.extend([len(vertices)//7,len(values)//7,state,mode]);vertices.extend(values)
    return struct.pack('<II',len(vertices)//7,len(commands)//4) + struct.pack(f'<{len(vertices)}f',*vertices) + struct.pack(f'<{len(commands)}I',*commands)
def frame(i, w=32, h=32): return request(2,struct.pack('<III16f',i,w,h,*identity))

cases = [
    ('front-face',[(triangle([1,0,0,1]),0,0)],[255,0,0,255]),
    ('back-face',[(triangle([1,0,0,1],reverse=True),0,0)],[16,32,48,255]),
    ('opaque-depth',[(triangle([1,0,0,1],-.5),0,0),(triangle([0,1,0,1],.5),0,0)],[255,0,0,255]),
    ('overlay-order-alpha',[(triangle([1,0,0,1]),0,0),(triangle([0,1,0,.5]),1,0),(triangle([0,0,1,.5]),2,0)],[64,64,128,255]),
    ('overlay-no-depth-write',[(triangle([1,0,0,1],.5),0,0),(triangle([0,1,0,.5],-.5),1,0),(triangle([0,0,1,1],0),0,0)],[0,0,255,255]),
    ('overlay-depth-test',[(triangle([1,0,0,1],-.5),0,0),(triangle([0,1,0,.5],.5),1,0)],[255,0,0,255]),
    ('ambient-fragment',[(triangle([128/255,64/255,32/255,1]),0,1)],[64,16,4,255]),
    ('coplanar-slope-bias',[(triangle([1,0,0,1],slope=.2),0,0),(triangle([0,1,0,.5],slope=.2),1,0)],[128,128,0,255]),
]
stream = b''.join(request(1,scene(draws)) + frame(i) for i,(_,draws,expected) in enumerate(cases))
stream += request(1,scene(cases[0][1])) + frame(len(cases),40,24)
result = subprocess.run([str(root/'dist/native/sky-vulkan')],input=stream,capture_output=True,check=True,timeout=60)
raw, at, records = result.stdout, 0, []
for i,(name,draws,expected) in enumerate(cases + [('resize',cases[0][1],[255,0,0,255])]):
    magic, request_id,w,h,n = struct.unpack_from('<5I',raw,at);at+=20
    assert magic==0x564b4652 and request_id==i and n==w*h*4
    image = raw[at:at+n];at+=n
    center = list(image[(h//2*w+w//2)*4:(h//2*w+w//2)*4+4])
    assert all(abs(a-b)<=1 for a,b in zip(center,expected)),(name,center,expected)
    records.append({'name':name,'width':w,'height':h,'centerRGBA':center,'expectedRGBA':expected,'rgbaSha256':hashlib.sha256(image).hexdigest(),'passed':True})
assert at==len(raw)
description=json.loads(result.stderr.decode().splitlines()[0])
report={'device':description,'scope':'Production native Vulkan host, actual SPIR-V rasterization and RGBA readback. Explicit diagnostic fixtures. No original-game image parity, original cloud shader execution or Windows GPU validation.','checks':records}
(root/'docs/vulkan-gpu.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'device':description,'passed':len(records)}))
