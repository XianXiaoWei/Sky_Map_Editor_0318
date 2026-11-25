"""SHA-gated Buddy load, shared parameter actions and query evidence."""
import hashlib,json,pathlib,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={'Buddy.Load':0x1001cfaf0,'BuddyParams.Initialize':0x1001cf940,'Buddy.Unload':0x1001d3790,'Buddy.GetPos':0x1001d37a0,'Buddy.GetVelocity':0x1001d37d0,'Buddy.GetObb':0x1001d2fe0,'Buddy.GetTransform':0x1001a6610,'Buddy.GetEnabled':0x1001a6600,'Buddy.MotionCache.Initialize':0x1007331f0}
rows={}
for name,address in functions.items():
 start,end=n.bounds(address);filename='evidence/buddy-'+name+'.asm';pathlib.Path(filename).write_text(n.annotated(address));rows[name]={'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':filename}
pathlib.Path('docs/buddy-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':rows,'scope':'Whole ordinary Buddy Load and shared parameter action lookup plus original motion-cache initialization. Parent constructors independently verified. Actual Model cloning, animation sequence registry, active-player/Marker and game owners remain explicit services; Buddy.Update, collision, network, dynamic drawing and complete owner lifecycle remain pending. Native Unload is an empty body and does not release the Model or Barn.', 'constants':{'thresholdBits':int.from_bytes(n.read(0x100aa78c4,4),'little'),'randomScaleBits':int.from_bytes(n.read(0x100aa70f0,4),'little')},'vectors':{'modelScaleHex':n.read(0x100aaa8c0,16).hex()}},indent=2)+'\n')
print(json.dumps({'functions':len(rows)}))
