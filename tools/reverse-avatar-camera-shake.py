"""SHA-gated Whisker positional shake helper and its original caller."""
import hashlib
import json
import pathlib
import struct
import sys
from native import Native

root=pathlib.Path(__file__).resolve().parent.parent
n=Native(sys.argv[1])
functions=[]
for name,address in [('WhiskerCamera.shakeAndBasisHelper',0x10073afd0),('WhiskerCamera.continuousUpdateCaller',0x10073e320)]:
    start,end=n.bounds(address)
    assert start==address
    file=f'evidence/avatar-camera-{address:x}.asm'
    (root/file).write_text(n.annotated(address))
    functions.append({'name':name,'address':hex(start),'end':hex(end),'instructions':len(n.instructions(address)),'sha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'evidence':file,'wholeBodyOracleVerified':address==0x10073afd0})
constants=[]
for address in [0x100aa89cc,0x100ac183c,0x100aaaf4c,0x100aa7cb4,0x100aa70f4,0x100ada264,0x100aa8634,0x100aa8608,0x100aa86a8,0x100aa9670,0x100aa91c8,0x100aa89b0,0x100aa6aa4,0x100aa6aa8,0x100aaf6c8,0x100aaf6cc,0x100aaf6d0,0x100aaabb8,0x100aa45b8,0x100aa8600,0x100aa8658,0x100aa78bc,0x100aaf6d4,0x100aa70e4]:
    raw=n.read(address,4)
    constants.append({'address':hex(address),'hex':raw.hex(),'float32':struct.unpack('<f',raw)[0]})
report={'executableSha256':n.digest,'functions':functions,'constants':constants,'caller':{'callSite':'0x100740e9d','addOffsetToEye':'0x100740eab','avoidanceCall':'0x100740ed2','basisStores':'0x100740f32..0x100740f44','scope':'Evidence only for surrounding caller. Only the complete helper, not this complete Update, is executed/compared by the new oracle.'},'oracle':'docs/avatar-camera-shake-oracle.json','scope':'Complete shake helper with supplied physical/Wind/ray/sound and captured native math services. Noise offset is positional; orientation scratch uses value*0. Original continuous Update, avoidance, key-frame/lens mixing and final projection remain unresolved.'}
(root/'docs/avatar-camera-shake-native.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'functions':len(functions),'sha256':n.digest}))
