import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
start,end=n.bounds(0x1001a34c0);assembly='evidence/bird-motion.asm';pathlib.Path(assembly).write_text(n.annotated(start))
constants={name:struct.unpack('<I',n.read(at,4))[0] for name,at in [('bankStrength',0x100aa8640),('bankLimit',0x100aad960),('angleScale',0x100aa8600),('angleDivisor',0x100aa8604)]}
pathlib.Path('docs/bird-motion-native.json').write_text(json.dumps({'executableSha256':n.digest,'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'constants':constants,'scope':'Whole ordinary BirdV2 motion/orientation caller and original matrix product/Model.SetTransform composed inside BirdV2.Update. Direction interpolation, bank filter, sincosf, animation weights and actor transform are explicit services. Full AI forces, world collision and real Model/animation/GPU lifecycle remain pending.'},indent=2)+'\n')
