"""SHA-gated guide call bodies and next creature update boundaries."""
import hashlib,json,pathlib,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
groups={
 'events':{'DetachFromBirdGuides.OnEnabled':0x1001aa480,'ReleaseBirds.OnEnabled':0x1001aa870},
 'helpers':{'AvatarBarn.GetPlayer':0x1001031d0,'Avatar.IsActive':0x1000fe050,'BirdGuideReference.Get':0x100133f30,'BirdGuideReference.Set':0x100133b50,'AvatarBarn.RequireAvatar':0x1000fc260},
 'next':{'Crab.Update':0x10025bc10,'BirdV2.Update':0x1001a2260,'BirdFlock.Update':0x10019bdc0,'BirdFlocks.Update':0x10019b6f0,'BirdFlock.Unload':0x10019bd00,'BirdFlocks.Unload':0x10019b680}}
report={'executableSha256':n.digest,'groups':{},'scope':'Guide normal call bodies and five helper bodies, with explicit Model fade/Avatar enabled/selection/statistics/metadata/Event services. Next group is investigation evidence only; it does not establish original creature updates.'}
for group,functions in groups.items():
 rows={}
 for name,address in functions.items():
  start,end=n.bounds(address);code=n.annotated(address);evidence='evidence/bird-guide-'+name+'.asm';pathlib.Path(evidence).write_text(code)
  rows[name]={'address':hex(address),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'instructions':len(code.splitlines()),'evidence':evidence,'investigationOnly':group=='next'}
 report['groups'][group]=rows
pathlib.Path('docs/bird-guide-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({'functions':sum(map(len,report['groups'].values())),'executableSha256':n.digest}))
