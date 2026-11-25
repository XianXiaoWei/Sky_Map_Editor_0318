"""SHA-gated complete ordinary DarkCreature.Load and literal vectors."""
import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
start,end=n.bounds(0x10026c670);assembly='evidence/dark-creature-load-DarkCreature.Load.asm';pathlib.Path(assembly).write_text(n.annotated(start))
addresses={'halfScale':0x100aa8090,'windColor':0x100ab4920,'windDirection':0x100ab4930,'markerAxisY':0x100aa80a0,'markerAxisZ':0x100aa8a30,'markerPosition':0x100aa8a00}
report={'executableSha256':n.digest,'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'vectors':{name:list(struct.unpack('<4f',n.read(at,16))) for name,at in addresses.items()},'constants':{name:struct.unpack('<f',n.read(at,4))[0] for name,at in [('minimumScale',0x100aa6a9c),('randomScale',0x100aa70f0),('randomLow',0x100aa866c),('randomHigh',0x100aa7cb8)]},'scope':'Whole ordinary DarkCreature.Load with exact saved transform, state, resource/ref order, own model/material/bones, wind and Marker dependency calls and final rail assertions. ResourceManager, actual Model/Animation/Wind/Marker owners and SwitchRail geometry remain explicit services. This loader does not complete patrol/attack/collision, autonomous drawing, network or unload lifecycle.'}
pathlib.Path('docs/dark-creature-load-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({'vectors':report['vectors'],'constants':report['constants']}))
