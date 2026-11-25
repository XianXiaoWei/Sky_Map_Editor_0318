"""Extract unchanged Avatar/Flame contact and consumption region."""
import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
start,end=0x10027c239,0x10027c9bb
assembly='evidence/darkstone-contact-update.asm'
pathlib.Path(assembly).write_text('\n'.join(line for line in n.annotated(0x10027b7f0).splitlines() if start<=int(line.split(':')[0],16)<end)+'\n')
addresses={'avatarRadius':0x100ac1844,'avatarDensity':0x100ac1838,'volumeFactor':0x100aa8600,'energyFactor':0x100aa8634,'maximumDistance':0x100aa78b8,'nearThreshold':0x100aad940,'flameGate':0x100aaad30,'flameMinimumRadius':0x100aa85b0,'flameGrowth':0x100aa70f4,'contactThreshold':0x100aa85f4,'levelOffset':0x100aa50c4,'levelDivisor':0x100aa6aa8,'verticalOffset':0x100aa77e0,'verticalDivisor':0x100aab838,'volumeDivisor':0x100aa77e8,'minimumEnergy':0x100ab50b4,'maximumEnergy':0x100aa77f0,'lowWeight':0x100ab50b8,'highWeight':0x100ab50bc,'negativeLevelDivisor':0x100aa8660,'negativeLevelWeight':0x100aa45b8,'particleScale':0x100aa8670,'healthMinimum':0x100ab50b0}
report={'executableSha256':n.digest,'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'constants':{name:struct.unpack('<f',n.read(address,4))[0] for name,address in addresses.items()},'constantAddresses':{name:hex(address) for name,address in addresses.items()},'scope':'Unchanged Avatar/Flame contact, native heat formula, level accumulation and consumption region. Closest-point geometry, Flame selection/activity, hint construction and dispatch remain explicit services. Whole Update, regeneration, propagation, rewards/network and game ownership are separate dependencies.'}
pathlib.Path('docs/darkstone-contact-native.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report['constants']))
