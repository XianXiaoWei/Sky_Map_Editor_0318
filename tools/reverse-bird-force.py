import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('BirdV2Ai.TargetDistance',0x1001a0450),('BirdV2Ai.SteerTarget',0x1001a0d20),('BirdV2Ai.SteerGuide',0x1001a0e70),('Steering.Wander',0x10062e8f0),('Motion.Wander',0x10062d010),('Steering.Flee',0x10062f540)]:
 start,end=n.bounds(address);assembly='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(assembly).write_text(n.annotated(start));functions[name]={'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly}
constants={name:struct.unpack('<I',n.read(address,4))[0] for name,address in [('randomScale',0x100aa70f0),('randomOffset',0x100aa8620),('arrivalSpeedScale',0x100aa89a8),('minimumGuideDelta',0x100aa85b4),('guideRangeSquared',0x100aad940),('guideDistanceDivisor',0x100aa70ec),('guideVelocityScale',0x100aa70f4),('fleeMinimum',0x100aa77f0),('fleeMaximum',0x100aa6aa4)]}
vectors={name:list(struct.unpack('<4I',n.read(address,16))) for name,address in [('up',0x100aa80a0),('forward',0x100aa8a30),('backward',0x100aa7920),('probeOffset',0x100aa78f0),('probeDirection',0x100aa92e0)]}
pathlib.Path('docs/bird-force-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'constants':constants,'vectors':vectors,'scope':'Whole ordinary bird/manta target-distance, target-force and guide-force callers, raw/Wander accumulation and Flee force. Original Seek and shared Flocking execute in the same chain. World raycast/neighborhood, metadata, Avatar state and owners remain explicit services.'},indent=2)+'\n')
