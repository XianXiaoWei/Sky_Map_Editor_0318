import hashlib,json,pathlib,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('Crab.NetState',0x10025ead0),('CrabBarn.Receive',0x10025ee60),('CrabBarn.Send',0x10025f0d0),('CrabBarn.Update',0x10025ed80)]:
 start,end=n.bounds(address);assembly='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(assembly).write_text(n.annotated(start));functions[name]={'start':hex(start),'end':hex(end),'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly}
pathlib.Path('docs/crab-network-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'scope':'Whole original Crab state snapshot and CrabBarn receive/send, composed with its existing Update. Metadata casts, stream lookup/count and state serializer retain explicit boundaries. Caller supplies initialized 120-byte private state scratch; original state field/copy order, ownership gates, preselected sends and per-object timer writes are preserved. Original packet codec, actual network, Crab outer Update and world/animation/GPU ownership remain pending.'},indent=2)+'\n')
