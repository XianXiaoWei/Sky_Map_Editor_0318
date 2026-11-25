"""Evidence for the complete ordinary BirdV2 AI integration caller."""
import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
start,end=n.bounds(0x1001a2f30)
assembly='evidence/bird-flight-integration.asm'
pathlib.Path(assembly).write_text(n.annotated(start))
constants={name:struct.unpack('<I',n.read(at,4))[0] for name,at in [('minimumSpeed',0x100aa6a9c),('epsilon',0x100aa78c4),('collisionScale',0x100aa78bc),('maximumPitchAngle',0x100aad954),('minimumPitchAngle',0x100aad958),('negativeMaximumPitchAngle',0x100aad95c),('arrivalDistanceSquared',0x100aac9a4),('queryDistanceSquared',0x100aa8638),('queryRadius',0x100aa70f4)]}
pathlib.Path('docs/bird-flight-native.json').write_text(json.dumps({'executableSha256':n.digest,'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'constants':constants,'scope':'Whole ordinary BirdV2 AI integration caller, including acceleration application, drag, speed cap, up to three collision responses, pitch correction, arrival and neighborhood-driven target reselection. Acceleration selection, world collision/query and original acosf/sincosf remain explicit services. Autonomous AI, Model/GPU ownership and complete BirdV2/manta lifecycle are not yet complete.'},indent=2)+'\n')
print(json.dumps({'start':hex(start),'bytes':end-start}))
