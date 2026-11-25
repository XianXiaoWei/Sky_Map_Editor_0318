import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('DarkCreature.Detect',0x10026d410),('DarkCreature.Alert',0x10026d2a0)]:
 start,end=n.bounds(address);assembly='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(assembly).write_text(n.annotated(start));functions[name]={'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly}
constants={name:struct.unpack('<I',n.read(address,4))[0] for name,address in [('maximumDistanceSquared',0x100aa78b8),('minimumEnergy',0x100aaa940),('avatarRadiusBias',0x100aac9a8),('nearSquared',0x100aa77d8),('tipNearSquared',0x100aa95f4),('offsetNearSquared',0x100aa78c0),('epsilon',0x100aa6a9c)]}
offset=list(struct.unpack('<2I',n.read(0x100ab49c8,8)))*2
pathlib.Path('docs/dark-creature-detect-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'constants':constants,'offset':offset,'scope':'Whole original DarkCreature player/bird detector and its composition with the original alert caller. Live enabled/world-position/Avatar-query/bird-position, raycast and original atan2f/cosf remain explicit services. Exact candidate order, strict distance/cone/visibility conditions and alert-ID transitions are restored; full outer Update, attacks, real scene/resources and autonomous viewport behavior remain pending.'},indent=2)+'\n')
