#!/usr/bin/env python3
"""SHA-gated evidence for ordinary scene foundation constructors/operations."""
import json,pathlib,struct,sys
from native import Native
root=pathlib.Path(__file__).resolve().parent.parent;n=Native(sys.argv[1])
functions={'Parent.placement':0x100523e80,'Parent.allocate':0x100523dc0,'Parent.SetEnabled':0x100522250,'Parent.GetEnabled':0x100522260,
 'CameraKeyFrame.placement':0x1001e2eb0,'CameraKeyFrame.allocate':0x1001e2de0,'CameraKeyFrame.HotDate':0x1001ddf50,'CameraKeyFrame.SetTransform':0x1001ddf60,'CameraKeyFrame.GetTransform':0x1001ddf90,
 'TerrainBlob.placement':0x1006b0f30,'TerrainBlob.allocate':0x1006b0ea0,'TerrainBlob.SetTransform':0x1006ae960,'TerrainBlob.GetTransform':0x1006ae9d0,'TerrainBlob.GetObb':0x1006aea00,'TerrainBlob.worldAabb':0x10078c720}
for name,address in functions.items():
 assert n.bounds(address)[0]==address
 (root/'evidence'/('foundation-'+name+'.asm')).write_text(n.annotated(address))
constants={hex(a):n.read(a,size).hex() for a,size in [(0x100ab9580,16),(0x100ab5480,16),(0x100adb450,16),(0x100aa7900,16)]}
assert struct.unpack('<4f',n.read(0x100ab5480,16))==(1e9,1e9,1e9,0)
assert struct.unpack('<4f',n.read(0x100adb450,16))==(-1e9,-1e9,-1e9,0)
report={'executableSha256':n.digest,'functions':{name:hex(a) for name,a in functions.items()},'bytes':{'Parent':144,'CameraKeyFrame':144,'TerrainBlob':640},'constants':constants,'scope':'Normal constructors and direct operation entries. Object metadata/allocator are explicit services. TGCL default caches, actual Barn startup/lifecycle, TerrainBlob shape/rail generation/rebaking, CameraSystem and Parent following/joints remain open; no complete original class acceptance.'}
(root/'docs/scene-foundation-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
