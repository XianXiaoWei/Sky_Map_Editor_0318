"""SHA-gated boundaries and constants for Darkstone state consumers."""
import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
entries={'Darkstone.ApplyState':0x10027e530,'Darkstone.SetHealth':0x10027e3d0,'Darkstone.IsKillable':0x10027e410,'Darkstone.SetNetworkHealth':0x10027b6e0,'SoulTrap.Update':0x10027b120,'SoulTrap.IsBurnt':0x10027b310}
functions={}
for name,start in entries.items():
 end=n.starts[n.starts.index(start)+1];file='evidence/darkstone-state-'+name+'.asm'
 pathlib.Path(file).write_text(n.annotated(start)+'\n')
 functions[name]={'address':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':file}
ranges={'consume':(0x10027c8b5,0x10027c9bb),'shape':(0x10027d909,0x10027d9af)}
assembly=n.annotated(0x10027b7f0).splitlines()
for name,(start,end) in ranges.items():
 file='evidence/darkstone-state-'+name+'.asm';pathlib.Path(file).write_text('\n'.join(line for line in assembly if start<=int(line.split(':')[0],16)<end)+'\n')
 functions[name]={'address':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':file}
addresses={'minimum':(0x100ab50b0,'f'),'burntThreshold':(0x100aae880,'f'),'displaySmoothing':(0x100ab50d0,'f'),'recoveryDelay':(0x100aa77f0,'f'),'shapeMinimum':(0x100aaa590,'d'),'loadShapeMinimum':(0x100ab10b0,'d'),'childBurntThreshold':(0x100ab50e0,'f')}
report={'executableSha256':n.digest,'functions':functions,'constants':{name:struct.unpack('<'+typ,n.read(addr,struct.calcsize(typ)))[0] for name,(addr,typ) in addresses.items()},'scope':'Whole ordinary state application, health setters, killability and SoulTrap completion bodies; two unchanged burning-consumption/shape subregions. Full burning Update, Avatar/fire eligibility, regeneration, reward/network dispatch and actual Model/resource owners remain separate dependencies.'}
pathlib.Path('docs/darkstone-state-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report['constants']))
