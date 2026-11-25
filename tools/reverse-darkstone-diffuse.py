"""Record the exact original diffuse-color subregion and literal inputs."""
import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
start,end=0x10027daeb,0x10027dd44
assembly='evidence/darkstone-diffuse-update.asm'
pathlib.Path(assembly).write_text('\n'.join(line for line in n.annotated(0x10027b7f0).splitlines() if start<=int(line.split(':')[0],16)<end)+'\n')
colors={name:list(struct.unpack('<4f',n.read(address,16))) for name,address in [('diffuse',0x100ab5100),('blocked',0x100ab5150),('dynamic',0x100ab5150),('pulseLow',0x100ab5130),('pulseHigh',0x100ab5140)]}
addresses={'threshold':0x100aa78c4,'dynamicRgb':0x100aa92f0,'dynamicAlpha':0x100aaea0c,'unavailable':0x100ab50f0,'pulseFrequency':0x100aa8640,'smoothing':0x100aaad40}
report={'executableSha256':n.digest,'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'colors':colors,'constants':{name:struct.unpack('<f',n.read(address,4))[0] for name,address in addresses.items()},'constantAddresses':{name:hex(address) for name,address in addresses.items()},'scope':'Only the original diffuse selection, pulse and smoothing subregion, with explicit caller-owned state and dynamic global color. The dynamic value here is an editor preview input; its global initialization is not recovered by this extraction. Burning, spots/UV, rewards, network and whole Update are excluded.'}
pathlib.Path('docs/darkstone-diffuse-native.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'start':hex(start),'end':hex(end),'constants':len(addresses)}))
