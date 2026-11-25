import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('FloppySpine.Initialize',0x10034d0d0),('FloppySpine.Update',0x10034d360),('DarkCreature.ModelCallback',0x100272160),('Model.UpdateSkeleton',0x10046a690),('Transform.Aim',0x1007f3180)]:
 start,end=n.bounds(address);file='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(file).write_text(n.annotated(address))
 functions[name]={'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':file}
constants={name:struct.unpack('<f',n.read(address,4))[0] for name,address in [('retainedPositionWeight',0x100aa8cc0),('historyTargetWeight',0x100aaa050),('constraintSplit',0x100aa7670),('spacingMultiplier',0x100aa91dc),('historyFraction',0x100abcce0),('scaleChangeTolerance',0x100aa85b0)]}
pathlib.Path('docs/floppy-spine-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'constants':constants,'historyCapacity':128,'constraintPasses':10,'ownerOrder':['primary animation','secondary animation','additive animation','palette flush','head callback','palette flush','FloppySpine.Update','palette flush','skinning'],'scope':'Original supplied Sky 0.3.18 executable inspection. Original FloppySpine body is confirmed through source assertions, the _Sim name search, Model creation/enable and Model.Update calls. Native numerical comparison scope is separately recorded in floppy-spine-oracle.json.'},indent=2)+'\n')
