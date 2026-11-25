#!/usr/bin/env python3
"""Translate only checked straight-line normal environment placement constructors.
Unknown instructions stop generation. Original metadata and child constructors
remain explicit services; allocation, TGCL defaults and updates are separate.
"""
import sys,json,re,struct,bisect
from pathlib import Path
from native import Native
from capstone.x86 import X86_OP_MEM,X86_OP_IMM,X86_OP_REG,X86_REG_RIP
n=Native(sys.argv[1])
creatures='--creatures' in sys.argv
items='--items' in sys.argv
entries={'Blaze':0x1001b1e20,'CloudBob':0x1004f7ed0,'CloudCard':0x100221b70,'DarkstoneRainRegion':0x100285be0,'DropOcclusion':0x1002cec10,'Emitter':0x1002dcf80,'EnvNode':0x10031c830,'FireWorkShow':0x1004f4840,'FlowerPatch':0x1003528e0,'FogVolumeSphere':0x1003594f0,'LensFlair':0x1003ee990,'OnBlaze':0x1001b2f50,'OnBoomDestroy':0x1004e2bc0,'PointLight':0x100540e30,'RainCurtainParams':0x100568920,'SetEmitterFlowRail':0x10052b080,'SetEnvDefault':0x10031d450,'SetEnvHull':0x10031dbd0,'SetOceanRender':0x1004d8170,'SetRainParams':0x10056b060,'SetWind':0x100593a90,'StarFallShower':0x100462440,'Water':0x1004d7320,'Wind':0x100329f90}
entries['SpawnMotes']=0x100480880
creature_sizes={}
if creatures or items:
 names=['BirdV2','BirdV2Params','BirdV2AiParams','BirdFlock','Crab','CrabParams','DarkCreature','DarkCreatureParams','SmallDarkCreature','SmallDarkCreatureZone','BirdV2AiSwap','BirdV2ParamSwap','ReleaseBirds','DetachFromBirdGuides','SetBirdGuidesEnabled','AwakenDarkCreatures','SetDarkCreaturesNetworked','Buddy','BuddyParams','Critter_Shout','CreateCritterV2','CritterMsg_Go','CritterV2Event','Critter_OnRegion','Critter_OnTouch','Critter_SendMsg','FishV2','FishV2Params','SetDarkCreaturesMusicFloat','SimpleBirdBrainParams','WhaleFairy']
 if items:names=['Flame','OnFlame','SetFlame','SetFlameOccIntensity','CandleObject']
 props=json.loads(Path('docs/native-properties.json').read_text());entries={}
 for name in names:
  getter=next(a for s,a in n.symbols.items() if s.startswith('__Z18GetMetaClassByTypeIP') and s.endswith(str(len(name))+name+'ERK9MetaClassv'))
  ins=next(i for i in n.instructions(getter) if i.mnemonic=='mov' and i.operands[1].type==X86_OP_MEM and i.operands[1].mem.base==X86_REG_RIP)
  record=ins.address+ins.size+ins.operands[1].mem.disp-40
  registration=n.instructions(int(next(iter(props[name].values()))['registrationFunction'],16))
  stores=[k for k,i in enumerate(registration) if i.mnemonic=='mov' and i.operands[0].type==X86_OP_MEM and i.operands[0].mem.base==X86_REG_RIP and i.address+i.size+i.operands[0].mem.disp==record]
  if len(stores)!=1:raise ValueError('Ambiguous creature metadata vptr '+name)
  k=stores[0];load,add=registration[k-2:k]
  if load.mnemonic!='mov' or load.operands[1].type!=X86_OP_MEM or load.operands[1].mem.base!=X86_REG_RIP or add.op_str!='rax, 0x10':raise ValueError('Unknown creature vptr '+name)
  vtable=struct.unpack('<Q',n.read(load.address+load.size+load.operands[1].mem.disp,8))[0]
  entries[name]=struct.unpack('<Q',n.read(vtable+26*8,8))[0]
  size_getter=struct.unpack('<Q',n.read(vtable+22*8,8))[0]
  size=next(i.operands[1].imm for i in n.instructions(size_getter) if i.mnemonic=='mov' and i.op_str.startswith('eax,'))
  creature_sizes[name]=(size,hex(size_getter))
prefix='object-item' if items else 'creature' if creatures else 'environment'
meta=set();global_reads={};global_writes=set();rows={};functions=[]
def canonical(reg):
 return {'eax':'rax','ebx':'rbx','edi':'rdi','esi':'rsi','ecx':'rcx','edx':'rdx'}.get(reg,reg)
def address(i,o):
 if o.mem.index:raise ValueError('Indexed constructor memory')
 if o.mem.base==X86_REG_RIP:return hex(i.address+i.size+o.mem.disp)+'n'
 r=canonical(i.reg_name(o.mem.base));return r+(('+'+hex(o.mem.disp)+'n') if o.mem.disp>0 else ('-'+hex(-o.mem.disp)+'n') if o.mem.disp<0 else '')
def read(i,o):
 if o.type==X86_OP_IMM:return hex(o.imm&((1<<(8*o.size))-1))+'n'
 if o.type==X86_OP_REG:return canonical(i.reg_name(o.reg))
 if o.type==X86_OP_MEM:
  a=address(i,o)
  if o.mem.base==X86_REG_RIP:global_reads[int(a[:-1],16)]=max(global_reads.get(int(a[:-1],16),0),o.size)
  if o.size==8:return 'm.read64('+a+')'
  if o.size==4:return 'BigInt(m.read32('+a+'))'
  if o.size in [1,2]:return 'readSmall(m,'+a+','+str(o.size)+')'
 raise ValueError('Unknown scalar constructor operand')
for name,entry in entries.items():
 code=n.instructions(entry);body=[];registers={'rax','rbx','rdi','rsi'};vectors=set();children=[]
 for i in code:
  ops=i.operands;mn=i.mnemonic
  if mn=='ret':break
  if mn in ['push','pop','nop','vzeroupper']:continue
  if mn=='mov' and i.op_str=='rbp, rsp':continue
  if mn in ['add','sub'] and ops[0].type==X86_OP_REG and i.reg_name(ops[0].reg)=='rsp':continue
  if mn=='mov' or mn=='movabs':
   d,src=ops
   if d.type==X86_OP_REG:
    r=canonical(i.reg_name(d.reg));registers.add(r);body.append(r+'='+read(i,src)+';')
   elif d.type==X86_OP_MEM:
    a=address(i,d);v=read(i,src)
    if d.mem.base==X86_REG_RIP:global_writes.add(int(a[:-1],16))
    body.append(('m.write64('+a+','+v+');') if d.size==8 else ('m.write32('+a+',Number('+v+'));') if d.size==4 else 'writeSmall(m,'+a+','+v+','+str(d.size)+');')
   else:raise ValueError('Unknown mov destination')
  elif mn=='lea':
   r=canonical(i.reg_name(ops[0].reg));registers.add(r);body.append(r+'='+address(i,ops[1])+';')
   if ops[1].mem.base==X86_REG_RIP:
    a=i.address+i.size+ops[1].mem.disp;global_reads[a]=max(global_reads.get(a,0),16)
  elif mn=='add' and ops[0].type==X86_OP_REG:
   r=canonical(i.reg_name(ops[0].reg));registers.add(r);body.append(r+'+='+read(i,ops[1])+';')
  elif mn in ['vxorps','vpxor'] and ops[1].reg==ops[2].reg:
   r=i.reg_name(ops[0].reg);vectors.add(r);body.append(r+'=new Uint8Array('+str(ops[0].size)+');')
  elif mn in ['vmovaps','vmovups','vmovdqa','vmovdqu','vmovss','vmovlps']:
   d,src=ops
   if d.type==X86_OP_REG:
    r=i.reg_name(d.reg);vectors.add(r)
    if src.type==X86_OP_MEM:
     a=address(i,src)
     if src.mem.base==X86_REG_RIP:global_reads[int(a[:-1],16)]=max(global_reads.get(int(a[:-1],16),0),src.size)
     body.append(r+'='+('scalarVector(m.bytes('+a+',4));' if mn=='vmovss' else 'Uint8Array.from(m.bytes('+a+','+str(d.size)+'));'))
    elif src.type==X86_OP_REG:body.append(r+'=Uint8Array.from('+i.reg_name(src.reg)+');')
    else:raise ValueError('Unknown vector source')
   elif d.type==X86_OP_MEM:
    body.append('m.bytes('+address(i,d)+','+str(d.size)+').set('+i.reg_name(src.reg)+'.subarray(0,'+str(d.size)+'));')
   else:raise ValueError('Unknown vector destination')
  elif mn=='call' and ops[0].type==X86_OP_IMM:
   a=ops[0].imm
   if a==0x10032eea0:body.append('s.constructEvent(m,rdi);')
   elif a in [0x1007f5010,0x1007f5d80]:body.append('s.constructChild(m,'+hex(a)+'n,rdi);');children.append(hex(a))
   else:meta.add(a);body.append('rax=s.metadata('+hex(a)+'n);')
  else:raise ValueError(f'Unsupported {name}: {i.address:#x} {mn} {i.op_str}')
 else:raise ValueError('Constructor does not reach ret')
 normal_end=i.address+i.size
 Path('evidence/'+prefix+'-'+name+'-construction.asm').write_text(n.annotated(entry,code_end=normal_end))
 rows[name]={'entry':hex(entry),'normalEnd':hex(normal_end),'objectArgument':'rdi' if name in ['EnvNode','SetEnvDefault','SetEnvHull'] else 'rsi','childServices':children}
 # Ordinary allocator call and reflected size getter are independent of the
 # placement body. EnvNode's size is also the exact inline queue stride.
 sizes=[]
 at=bisect.bisect_left(n.starts,entry)
 for a in n.starts[max(0,at-10):at]:
  allocation=n.instructions(a)
  for k,ins in enumerate(allocation):
   if ins.mnemonic=='call' and ins.op_str=='0x100aa2498':
    for prior in allocation[max(0,k-4):k]:
     if prior.mnemonic=='mov' and prior.op_str.startswith('edi, '):
      sizes.append((int(prior.op_str.split(', ')[1],0),hex(prior.address)))
 if name=='EnvNode':sizes=[(0x410,'0x10031c750')]
 if creatures or items:sizes=[creature_sizes[name]]
 if not sizes:raise ValueError('Unresolved environment allocation size '+name)
 rows[name]['storageBytes']=sizes[-1][0]
 rows[name]['sizeEvidence']=sizes[-1][1]
 declaration='let '+','.join(r+'='+(('out') if r in ['rsi','rdi'] else '0n') for r in sorted(registers))+';'
 if vectors:declaration+='let '+','.join(r+':Uint8Array=new Uint8Array(32)' for r in sorted(vectors))+';'
 functions.append(" case '"+name+"':{\n  "+declaration+'\n  '+'\n  '.join(body)+'\n  return rax;\n }')
header="""// Generated by tools/reverse-environment-construction.py from SHA-gated original
// normal placement bodies. Do not edit stores independently of their evidence.
import type {ModelBakeMemory} from './model-baked-runtime';
export interface EnvironmentConstructionServices {
 /** Original zero-argument metadata lookup; returned storage has class ID +0x38. */
 metadata(functionAddress:bigint):bigint;
 /** Original Event base constructor, including metadata bootstrap. */
 constructEvent(memory:ModelBakeMemory,out:bigint):void;
 /** Original VertexData/VertexRender construction remains an explicit child service. */
 constructChild(memory:ModelBakeMemory,functionAddress:bigint,out:bigint):void;
}
const scalarVector=(b:Uint8Array)=>{const out=new Uint8Array(16);out.set(b);return out;};
const readSmall=(m:ModelBakeMemory,a:bigint,n:number)=>{const b=m.bytes(a,n);return BigInt(b[0]|(n===2?b[1]<<8:0));};
const writeSmall=(m:ModelBakeMemory,a:bigint,v:bigint,n:number)=>{const b=m.bytes(a,n);b[0]=Number(v&255n);if(n===2)b[1]=Number((v>>8n)&255n);};
/** Parent construction only. Native globals/default vectors are supplied by
 * memory; unknown allocation bytes remain intact. TGCL fields and class update,
 * Barn registration, rendering, child bodies and abnormal unwind are separate. */
export function constructOriginalEnvironmentObject(m:ModelBakeMemory,out:bigint,className:EnvironmentConstructionClass,s:EnvironmentConstructionServices):bigint {
 switch(className){
"""
output=header+'\n'.join(functions)+'\n }\n}\nexport type EnvironmentConstructionClass = '+ '|'.join("'"+n+"'" for n in entries)+';\n'
if creatures:output=output.replace('EnvironmentConstruction','CreatureConstruction').replace('constructOriginalEnvironmentObject','constructOriginalCreatureObject')
if items:output=output.replace('EnvironmentConstruction','ObjectItemConstruction').replace('constructOriginalEnvironmentObject','constructOriginalObjectItem')
Path('src/core/'+prefix+'-construction-runtime.ts').write_text(output)
report={'executableSha256':n.digest,'classes':rows,'metadataFunctions':[hex(a) for a in sorted(meta)],'globalReads':{hex(a):v for a,v in sorted(global_reads.items())},'globalWrites':[hex(a) for a in sorted(global_writes)],'scope':'Normal parent placement bodies only; live native metadata/global storage and Event/Vertex child constructors are explicit services. Untouched allocation bytes, class IDs, vptrs, vector initialization and Default/Hull intrusive global list order retained. No TGCL defaults, allocator, unwind, class Update or game lifecycle claim.'}
report['globalReads']['0x101df4208']=8
report['initialGlobalHex']={}
for address,size in report['globalReads'].items():
 try:raw=n.read(int(address,16),size)
 except StopIteration:raw=bytes(size)
 report['initialGlobalHex'][address]=raw.hex()
Path('docs/'+prefix+'-construction.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps({'classes':len(rows),'metadataFunctions':len(meta),'globalReads':len(global_reads)}))
