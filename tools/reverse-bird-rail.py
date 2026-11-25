import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('BirdV2Ai.SelectRail',0x1001a06a0),('Steering.FollowRail',0x100630020),('Rail.GetPoint',0x100560300)]:
 start,end=n.bounds(address);assembly='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(assembly).write_text(n.annotated(start));functions[name]={'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly}
constants={name:struct.unpack('<I',n.read(address,4))[0] for name,address in [('randomScale',0x100aa70f0),('randomRange',0x100aaaf40),('headingMinimum',0x100aa91ec)]}
pathlib.Path('docs/bird-rail-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'constants':constants,'scope':'Whole original bird/manta rail selection and shared accumulating FollowRail. Original Rail.GetPoint reads the live initialized point cache. Metadata casts, nearest-point/arc/sample services and real world/resource ownership retain explicit boundaries.'},indent=2)+'\n')
