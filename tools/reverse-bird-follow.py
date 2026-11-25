import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('BirdV2Ai.FollowObject',0x1001a08e0),('Steering.Orbit',0x100630190),('Steering.Brake',0x100630480),('Steering.SeekDirect',0x10062f190)]:
 start,end=n.bounds(address);assembly='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(assembly).write_text(n.annotated(start));functions[name]={'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly}
constants={name:struct.unpack('<I',n.read(address,4))[0] for name,address in [('targetResetSquared',0x100aa85b0),('targetReleaseSquared',0x100aa89cc),('timeout',0x100aa7cb8),('headingMinimum',0x100aa865c),('resetCountdown',0x100aaaf5c),('nearSquared',0x100aaabb0),('avatarRadius',0x100ac1844),('randomScale',0x100aa70f0)]}
pathlib.Path('docs/bird-follow-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'constants':constants,'scope':'Whole original object-follow state machine, accumulating Orbit and Brake, connected to recovered Seek. Actual Avatar selection/world position, target virtual transform/OBB, sphere/OBB projection and Critter emission remain explicit owner services. Matrix product follows the original four-column operation order. Full world, animation, GPU and lifecycle acceptance remain open.'},indent=2)+'\n')
