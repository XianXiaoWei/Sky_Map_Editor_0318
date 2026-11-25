"""Whole BirdV2.Update boundary and its native literal inputs."""
import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
start,end=n.bounds(0x1001a2260);assembly='evidence/bird-update-BirdV2.Update.asm'
pathlib.Path(assembly).write_text(n.annotated(start))
constants={name:struct.unpack('<f',n.read(at,4))[0] for name,at in [('minimumDelta',0x100aa6a9c),('maximumDelta',0x100aa6aa0),('targetThreshold',0x100aa45b8),('randomScale',0x100aa70f0),('targetDelay',0x100aa77f0),('cullingDistanceSquared',0x100aad948),('wakeDistanceSquared',0x100aad940),('wakeRadiusScale',0x100aa8634)]}
pathlib.Path('docs/bird-update-native.json').write_text(json.dumps({'executableSha256':n.digest,'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'constants':constants,'scope':'Whole ordinary BirdV2.Update caller body with all target, distance, time, transform assertions and ordered downstream dispatch. Full AI, movement, animation, guide/effect, camera, Avatar and Model bodies remain explicit services; this caller alone does not complete BirdV2 or manta gameplay.'},indent=2)+'\n')
print(json.dumps(constants))
