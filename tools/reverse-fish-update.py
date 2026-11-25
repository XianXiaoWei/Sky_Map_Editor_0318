"""Inspect FishV2 Update and its direction/bank bodies in the supplied executable."""
import hashlib,json,pathlib,struct,sys
from native import Native

n=Native(sys.argv[1] if len(sys.argv)>1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky')
functions={}
for name,address in [('FishV2.Update',0x100337540),('Creature.MotionTransform',0x1001a6610),('Creature.TurnDirection',0x100168830),('Creature.Bank',0x100192550)]:
 start,end=n.bounds(address);assembly='evidence/'+name.lower().replace('.','-')+'.asm';pathlib.Path(assembly).write_text(n.annotated(start));ins=n.instructions(start)
 functions[name]={'start':hex(start),'end':hex(end),'wholeFunction':True,'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'instructions':len(ins)}
# The AI's function-start span contains a five-entry signed relative switch
# table. Its data is not an instruction stream, and is retained in the hash.
start,end=n.bounds(0x100335a40);code_end=0x1003370a4;table=code_end
ins=n.instructions(start,code_end);assert ins[-2].mnemonic=='ud2' and ins[-1].mnemonic=='nop'
targets=[table+struct.unpack('<i',n.read(table+4*i,4))[0] for i in range(5)]
assert all(target in {x.address for x in ins} for target in targets)
assembly='evidence/fishv2-ai.asm';pathlib.Path(assembly).write_text(n.annotated(start,code_end))
functions['FishV2.AI']={'start':hex(start),'end':hex(end),'codeEnd':hex(code_end),'wholeFunction':False,'implemented':False,'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),'assembly':assembly,'instructions':len(ins),'switchTable':{'start':hex(table),'entries':5,'targets':list(map(hex,targets)),'hex':n.read(table,20).hex()},'trailingPaddingHex':n.read(table+20,end-table-20).hex()}
addresses={'one':0x100aa50c0,'negativeOne':0x100aa50c4,'half':0x100aa45b8,'minimumDelta':0x100aa6a9c,'maximumDelta':0x100aa6aa0,'epsilon':0x100aa78c4,'collisionScale':0x100aa78bc,'poleHigh':0x100aad954,'poleLow':0x100aad958,'poleHighOffset':0x100aad95c,'piNegative':0x100aac9a0,'bankStrength':0x100abc71c,'bankLimit':0x100aaf930,'angleScale':0x100aa8600,'angleDivisor':0x100aa8604,'rippleRange':0x100ab3154,'rippleSize':0x100aa8634,'interactionCooldown':0x100aa9670,'interactionDelay':0x100aa77f0,'randomScale':0x100aa70f0,'emitInterval':0x100aa70f4,'emitRadiusScale':0x100aa77f4,'bankThreshold':0x100aa9678,'bankResponse':0x100aaa48c,'bankSmoothingDivisor':0x100aa7cb8,'bankWrap':0x100aa95dc}
constants={name:struct.unpack('<I',n.read(addr,4))[0] for name,addr in addresses.items()}
vectors={name:list(struct.unpack('<4I',n.read(addr,16))) for name,addr in [('up',0x100aa80a0),('fallbackDirection',0x100aa8a30),('down',0x100aa92e0),('rippleColor',0x100aab790)]}
pathlib.Path('docs/fish-update-native.json').write_text(json.dumps({'executableSha256':n.digest,'functions':functions,'constants':constants,'vectors':vectors,'bankLogDivisor':struct.unpack('<d',n.read(0x100aa86c0,8))[0],'scope':'Whole original FishV2.Update, MotionTransform, TurnDirection and Bank. AI boundary and embedded switch table are inspected; AI implementation and real world/collision/animation/light/interaction/resource owners remain pending. Packed sincos upper lanes are explicit input context; original libm results are recorded/replayed.'},indent=2)+'\n')
