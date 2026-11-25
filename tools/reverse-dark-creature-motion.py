import hashlib,json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address,cut in [('DarkCreature.Update.MotionPhase',0x10026ddb0,0x10026e7da),('DarkCreature.Appear',0x100270010,None),('Motion.FollowRail',0x10062e300,None)]:
 start,end=n.bounds(address);code_end=cut or end;assembly='evidence/'+name.lower().replace('.','-')+'.asm'
 pathlib.Path(assembly).write_text(n.annotated(start,code_end if cut else None))
 instructions=n.instructions(start);prefix=next(i.address+i.size-start for i in instructions if i.address+i.size-start>=14)
 functions[name]={'start':hex(start),'end':hex(code_end),'wholeFunctionEnd':hex(end),'wholeFunction':cut is None,'codeSha256':hashlib.sha256(n.read(start,code_end-start)).hexdigest(),'assembly':assembly,'trampolinePrefixBytes':prefix}
addresses={'one':0x100aa50c0,'half':0x100aa45b8,'epsilon':0x100aa6a9c,'normalizeThreshold':0x100aa78c4,'upThreshold':0x100aa78cc,'appearHeight':0x100ab4908,'speedSmooth':0x100ab4900,'fadeDuration':0x100aa77f0,'waveScale':0x100aa89b8,'returnDuration':0x100aa8658,'chaseWave':0x100aa866c,'five':0x100aa6aa8}
constants={name:struct.unpack('<I',n.read(addr,4))[0] for name,addr in addresses.items()}
vectors={name:list(struct.unpack('<4I',n.read(addr,16))) for name,addr in [('up',0x100aa80a0),('duplicatedUp',0x100aa78d8),('fallbackUp',0x100aa7920),('boundY',0x100ab4920),('boundZ',0x100ab4930),('modelScale',0x100ab4940)]}
vectors['duplicatedUp']=vectors['duplicatedUp'][:2]*2 # vmovddup reads and duplicates only the first qword
pathlib.Path('docs/dark-creature-motion-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'constants':constants,'vectors':vectors,'scope':'Exact original DarkCreature.Update motion phase 0x10026ddb0..0x10026e7da, stopping after Model.SetTransform and callback-owner writes. This is a partial outer Update, not the complete function. Complete original appearance/return-to-patrol helper and Motion.FollowRail are separately compared and composed. Caller-owned palette and private force scratch, original libm and world/model/audio services remain explicit; chase/attack consumers and the outer Update remainder are pending.'},indent=2)+'\n')
