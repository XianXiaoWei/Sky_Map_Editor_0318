"""SHA-gated complete flock manager/unload and helper function evidence."""
import hashlib,json,pathlib,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={'BirdFlock.Unload':0x10019bd00,'BirdFlocks.Unload':0x10019b680,'BirdFlocks.Update':0x10019b6f0,'Heap.Free':0x100795a70,'Heap.Reset':0x100795650,'ModelInstances.SetInstanceCount':0x100473d40,'VertexBuffer.GetData':0x100795060}
rows={}
for name,address in functions.items():
 start,end=n.bounds(address);evidence='evidence/bird-flock-'+name+'.asm';pathlib.Path(evidence).write_text(n.annotated(address))
 rows[name]={'address':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'instructions':len(n.instructions(address)),'evidence':evidence}
pathlib.Path('docs/bird-flock-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':rows,'scope':'Complete named manager/unload and helper bodies; BirdFlock.Update remains an explicit child service, allocator internals and reference virtuals remain services. No whole autonomous flock owner or GPU submission claim.'},indent=2)+'\n')
