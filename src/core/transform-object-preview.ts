import type {ObjectNode} from './objects';
import {objectPlaybackCandidates,transformPreviewFields,logicPreviewFields,playbackField as field,playbackRaw as raw,type ObjectPlaybackCandidate,type ObjectPlaybackKind} from './object-playback-plan';
import {constructOriginalTransformObject,dispatchOriginalTransformObjectVirtual,type TransformObjectMemory,type TransformObjectServices} from './transform-object-runtime';
import {constructOriginalEnable,constructOriginalIfEnabled,dispatchOriginalLogicEventVirtual} from './logic-event-runtime';
import {constructOriginalDelay,dispatchOriginalDelayVirtual} from './delay-event-runtime';
import {setFloatFrame} from './set-float-runtime';
import {constructNativeClump,setNativeClumpEnabled} from './clump-runtime';
import {constructNativeMarker,setNativeMarkerEnabled,getNativeMarkerEnabledByte} from './marker-runtime';
import {getNativeMarkerTransform,setNativeMarkerTransform} from './marker-transform-runtime';
import {constructOriginalLevelMesh,getOriginalLevelMeshTransform,setOriginalLevelMeshTransform,setOriginalLevelMeshEnabled,getOriginalLevelMeshEnabled} from './level-mesh-runtime';
import {updateOriginalEventBarn,type OriginalEventBarn,type OriginalEventBarnServices} from './event-barn-runtime';
import {requestOriginalEventEnabled,startOriginalEvent,setOriginalEventEnabled,resumeOriginalEvent} from './event-start-runtime';
import {constructOriginalFloatAdd,constructOriginalFloatMult,constructOriginalSetFloat} from './event-foundation-runtime';
import {constructNativeFloat} from './object-foundation-runtime';
import {dispatchOriginalNumericEventVirtual} from './numeric-event-runtime';
import {constructOriginalFloatSplit,constructOriginalOnFloat,dispatchOriginalFloatConditionVirtual} from './float-condition-event-runtime';
import {constructOriginalEvent as constructEnvironmentEventHeader} from './event-start-runtime';
import {readEnvironmentStorage} from './environment-storage';
import type {NativeStringMemory} from './native-string-runtime';
import {isRestoredEnvironmentEvent,isContinuousEnvironmentEvent} from './environment-event-types';
export {transformPreviewFields};
export type TransformPreviewCandidate=ObjectPlaybackCandidate;
export function transformPreviewCandidates(nodes:ObjectNode[]){return objectPlaybackCandidates(nodes,['TransformObject']);}
export interface TransformPreviewSnapshot {
 id:number;kind:ObjectPlaybackKind;running:boolean;paused:boolean;progress:number;elapsed:number;
 events:{id:number;kind:ObjectPlaybackKind;running:boolean;pending:boolean;progress:number;elapsed:number;starts:number}[];
 objects:{id:number;matrix:number[];enabled:boolean}[];error:string|null;
 values:{id:number;value:number;bits:number}[];
}
export interface TransformPreviewHost {
 transform(id:number,matrix:Uint8Array):void;
 environmentEvent?(id:number,controllers:{id:number;matrix:Uint8Array;enabled:boolean}[]):void;
 environmentEventEnabled?(id:number,enabled:boolean):void;
 environmentEventPaused?(id:number,paused:boolean):void;
 environmentValues?(values:{id:number;bits:number}[]):void;
 resetEnvironment?():void;
 enabled?(id:number,enabled:boolean):void;
 /** Optional independently probed math service for native verification. */
 math?(operation:'cos'|'acos'|'sin',input:number):number;
 /** logf/expf are explicit preview services; native verification replays
  * independently captured float32 results and checks every input bit. */
 numericMath?(operation:'logf'|'expf',input:number):number;
}
export const transformPreviewObjectBase=0x240000000n,transformPreviewBarnBase=0x260000000n;
const O=transformPreviewObjectBase,E=transformPreviewBarnBase;
/** Diagnostic prepared snapshots; registry/allocations and initial editor state
 * are inputs, never evidence that native construction or loading completed. */
export interface TransformPreviewOriginalState {storage:Uint8Array;barn:Uint8Array;eventPointers:bigint[];heapCursor:number;}
export class TransformObjectPreview {
 private nodes:ObjectNode[]=[];
 private session?:{
  candidate:TransformPreviewCandidate;memory:TransformObjectMemory;storage:Uint8Array;barn:OriginalEventBarn;heapCursor():number;getEnabled(pointer:bigint):boolean;
  events:Map<number,{pointer:bigint;event:Uint8Array;kind:ObjectPlaybackKind;services:TransformObjectServices;starts:number}>;
  endpoints:Map<number,{pointer:bigint;kind:string;initial:Uint8Array;initialEnabled:boolean}>;values:Map<number,bigint>;dispatch:OriginalEventBarnServices<undefined>;
 };
 private running=false;private paused=false;private lastTime?:number;private delta=0;private error:string|null=null;
 constructor(private host:TransformPreviewHost){}
 configure(nodes:ObjectNode[]){this.reset();this.nodes=nodes;}
 list(){return objectPlaybackCandidates(this.nodes);}
 start(id:number,dispatchInitial=true){
  const candidates=this.list(),c=candidates.find(c=>c.id===id);
  if(!c?.available)throw new Error(c?.reason??'请选择对象变换');this.reset();
  const lookup=new Map(this.nodes.map(n=>[n.id,n])),plans=c.plans;
  const ids=new Set(c.endpoints);
  const controlIds=new Set(plans.flatMap(p=>p.control===null?[]:[p.control]));
  const storage=new Uint8Array(4096+plans.reduce((n,p)=>n+(p.kind==='SetEnvDefault'||p.kind==='SetEnvHull'?1024:512),0)+ids.size*0xb00+c.valueObjects.filter(id=>!controlIds.has(id)).length*32+c.clumps.reduce((n,g)=>n+48+g.members.length*8,0)+plans.reduce((n,p)=>n+p.objects.length*160+(p.targets?.length??0)*8+p.finish.length*8+128,0)),v=new DataView(storage.buffer);
  const bytes=(p:bigint,n:number)=>{const at=Number(p-O);if(at<0||at+n>storage.length)throw new Error('变换预览内存不足');return storage.subarray(at,at+n);};
  const memory:TransformObjectMemory & NativeStringMemory={bytes,string:()=>{throw new Error('字符串服务未接入对象组播放');},copy:(d,s,n)=>bytes(d,n).set(bytes(s,n)),move:(d,s,n)=>bytes(d,n).set(bytes(s,n).slice()),read8:p=>bytes(p,1)[0],write8:(p,n)=>{bytes(p,1)[0]=n;},read32:p=>new DataView(bytes(p,4).buffer,Number(p-O),4).getUint32(0,true),write32:(p,n)=>v.setUint32(Number(p-O),n>>>0,true),read64:p=>v.getBigUint64(Number(p-O),true),write64:(p,n)=>v.setBigUint64(Number(p-O),n,true)};
  let used=c.kind==='SetEnvDefault'||c.kind==='SetEnvHull'?1024:256;
  const allocate=(n:number,alignment:number)=>{used=Math.ceil(used/alignment)*alignment;const p=O+BigInt(used);bytes(p,n);used+=n;return p;};
  const events=new Map<number,{pointer:bigint;event:Uint8Array;kind:ObjectPlaybackKind;services:TransformObjectServices;starts:number}>();
  for(const p of plans){
   const node=lookup.get(p.id)!,size=p.kind==='SetEnvDefault'||p.kind==='SetEnvHull'?readEnvironmentStorage(node).storage.length:p.kind==='TransformObject'?216:p.kind==='OnFloat'?192:p.kind==='Enable'||p.kind==='FloatSplit'?72:p.kind==='IfEnabled'||p.kind==='SetFloat'?88:p.kind==='FloatAdd'?96:80,pointer=p.id===id?O:allocate(size,16),event=bytes(pointer,size),metadata={eventClassId:7,eventVptr:0x100c14ea0n};
   if(isRestoredEnvironmentEvent(p.kind)){if(p.kind==='SetEnvDefault'||p.kind==='SetEnvHull')event.set(readEnvironmentStorage(node).storage);constructEnvironmentEventHeader(event,metadata.eventClassId);}
   else if(p.kind==='TransformObject')constructOriginalTransformObject(event,14,metadata);
   else if(p.kind==='Enable')constructOriginalEnable(event,3,metadata);
   else if(p.kind==='IfEnabled')constructOriginalIfEnabled(event,4,metadata);
   else if(p.kind==='FloatAdd')constructOriginalFloatAdd(event,5,metadata);
   else if(p.kind==='FloatMult')constructOriginalFloatMult(event,6,0x100d0cbf8n,metadata);
   else if(p.kind==='SetFloat')constructOriginalSetFloat(event,10,metadata);
   else if(p.kind==='OnFloat')constructOriginalOnFloat(event,11,metadata);
   else if(p.kind==='FloatSplit')constructOriginalFloatSplit(event,13,metadata);
   else constructOriginalDelay(event,9,metadata);
   const offsets:Readonly<Record<string,number>>=p.kind==='TransformObject'?transformPreviewFields:logicPreviewFields[p.kind];
   for(const [name,offset] of Object.entries(offsets))event.set(raw(field(node,name)!),offset);
   event[12]=Number(field(node,'autoStart')?.value??0);event[32]=0;
   if(p.kind==='TransformObject'){event[128]=0;for(const offset of [64,80,88,96])memory.write64(pointer+BigInt(offset),0n);}
   memory.write64(pointer+24n,E);memory.write32(pointer+40n,1);
   events.set(p.id,{pointer,event,kind:p.kind,services:undefined!,starts:0});
  }
  const endpoints=new Map<number,{pointer:bigint;kind:string;initial:Uint8Array;initialEnabled:boolean}>(),byPointer=new Map<bigint,number>();
  for(const id of ids){
   const n=lookup.get(id)!,p=allocate(n.className==='LevelMesh'?0xa60:80,16),b=bytes(p,n.className==='LevelMesh'?0xa60:80);
   if(n.className==='LevelMesh'){constructOriginalLevelMesh(b,p,16,17);b.set(raw(field(n,'transform')!),16);memory.write64(p+0x228n,0n);memory.write8(p+0xd0n,Number(field(n,'enabled')?.value??1));}
   else{constructNativeMarker(b,12);setNativeMarkerEnabled(b,Number(field(n,'enabled')?.value??0));for(const [name,offset] of [['pos',16],['quat',32],['scale',48]] as const)b.set(raw(field(n,name)!),offset);}
   endpoints.set(id,{pointer:p,kind:n.className,initial:new Uint8Array(64),initialEnabled:n.className==='LevelMesh'?!!getOriginalLevelMeshEnabled(memory,p):!!getNativeMarkerEnabledByte(b)});byPointer.set(p+8n,id);
  }
  const endpoint=(pointer:bigint)=>{const id=byPointer.get(pointer);if(id===undefined)throw new Error('对象变换引用未接通');return {id,...endpoints.get(id)!};};
  const getTransform=(pointer:bigint)=>{const e=endpoint(pointer);return e.kind==='LevelMesh'?getOriginalLevelMeshTransform(memory,e.pointer):getNativeMarkerTransform(bytes(e.pointer,80));};
  for(const e of endpoints.values())e.initial=getTransform(e.pointer+8n);
  const controls=new Map<number,bigint>();
  const floatPointer=(id:number)=>{let p=controls.get(id);if(p===undefined){p=allocate(24,8);if(c.valueObjects.includes(id))constructNativeFloat(bytes(p,24),1);bytes(p+16n,4).set(raw(field(lookup.get(id)!,'value')!));controls.set(id,p);}return p;};
  const clumps=new Map(c.clumps.map(g=>{const pointer=allocate(32,8);constructNativeClump(memory,pointer,2);return [g.id,pointer] as const;}));
  const objectPointer=(id:number):bigint=>id===0xffffffff?0n:events.has(id)?events.get(id)!.pointer+8n:endpoints.has(id)?endpoints.get(id)!.pointer+8n:lookup.get(id)?.className==='Float'?floatPointer(id):clumps.get(id)!;
  const fillGroup=(p:bigint,ids:number[])=>{const array=allocate(ids.length*8,8);memory.write64(p+8n,array);memory.write32(p+16n,ids.length);ids.forEach((id,i)=>memory.write64(array+BigInt(i*8),objectPointer(id)));};
  for(const g of c.clumps)fillGroup(clumps.get(g.id)!,g.members);
  const group=(ids:number[]|null)=>{if(ids===null)return 0n;const p=allocate(24,8);fillGroup(p,ids);return p;};
  const barn:OriginalEventBarn={bytes:new Uint8Array(0x105100),nodes:Array.from({length:1280},()=>({event:null,next:null})),freeHead:null};
  const eventFor=(pointer:bigint)=>[...events.values()].find(e=>e.pointer+8n===pointer);
  const setEnabled=(pointer:bigint,on:boolean):void=>{
   if(!pointer)return;const e=eventFor(pointer);if(e){setOriginalEventEnabled(e.event,on,barn.bytes,()=>{});return;}
   if(byPointer.has(pointer)){const e=endpoint(pointer);if(e.kind==='LevelMesh')setOriginalLevelMeshEnabled(memory,e.pointer,Number(on));else setNativeMarkerEnabled(bytes(e.pointer,80),Number(on));return;}
   if([...clumps.values()].includes(pointer)){setNativeClumpEnabled(memory,pointer,on,setEnabled);return;}
   if([...controls.values()].includes(pointer))return;
   throw new Error('启用目标尚未接入');
  };
  const getEnabled=(pointer:bigint):boolean=>{
   if(!pointer)return true;const e=eventFor(pointer);if(e)return !!e.event[35];
   if([...clumps.values()].includes(pointer)||[...controls.values()].includes(pointer))return true; // Object missing-method default; not an aggregate.
   const target=endpoint(pointer);return target.kind==='LevelMesh'?!!getOriginalLevelMeshEnabled(memory,target.pointer):!!getNativeMarkerEnabledByte(bytes(target.pointer,80));
  };
  const castObject=(pointer:bigint)=>{if(pointer&&!byPointer.has(pointer)&&!eventFor(pointer)&&![...clumps.values()].includes(pointer)&&![...controls.values()].includes(pointer))throw new Error('事件引用未接通');return pointer;};
  for(const [i,p] of plans.entries()){
   const entry=events.get(p.id)!,pointer=entry.pointer;barn.nodes[i].event=entry.event;
   if(p.kind==='TransformObject'){
    memory.write64(pointer+72n,group(p.objects));memory.write64(pointer+64n,group(p.targets));memory.write64(pointer+80n,group(p.finish));memory.write64(pointer+56n,p.target===null?0n:objectPointer(p.target));
    if(p.control!==null)memory.write64(pointer+96n,floatPointer(p.control));
   }else if(p.kind==='OnFloat'){
    for(const [name,offset] of [['value',56],['conditionOneFloat',128],['conditionTwoFloat',160]] as const)memory.write64(pointer+BigInt(offset),p.floats[name]===null?0n:floatPointer(p.floats[name]!));
    for(const [name,offset] of [['conditionOneOnFloat',144],['conditionTwoOnFloat',176]] as const)memory.write64(pointer+BigInt(offset),p.conditions![name]===null?0n:events.get(p.conditions![name]!)!.pointer);
    for(const [name,offset] of [['trueEvents',72],['falseEvents',80]] as const)memory.write64(pointer+BigInt(offset),p.branches![name]===null?0n:objectPointer(p.branches![name]!));
    const name=new TextEncoder().encode(p.debugName!);entry.event[96]=name.length*2;entry.event.set(name,97);
   }else if(p.kind==='FloatSplit'){
    memory.write64(pointer+56n,p.floats.input===null?0n:floatPointer(p.floats.input));memory.write64(pointer+64n,clumps.get(p.outputClump!)!);
   }else if(p.kind==='FloatAdd'||p.kind==='FloatMult'||p.kind==='SetFloat'){
    const names=p.kind==='SetFloat'?['target']:p.kind==='FloatAdd'?['target','amountFloat','output']:['a','b','output'];
    names.forEach((name,i)=>memory.write64(pointer+BigInt(p.kind==='SetFloat'?64:56+i*8),p.floats[name]===null?0n:floatPointer(p.floats[name]!)));
   }else if(p.kind==='Delay')memory.write64(pointer+64n,group(p.finish));
   else if(!isRestoredEnvironmentEvent(p.kind)){memory.write64(pointer+56n,group(p.objects));if(p.kind==='IfEnabled')memory.write64(pointer+72n,group(p.finish));}
   entry.services={allocate,castObject,getTransform,
    setTransform:(p,matrix)=>{const e=endpoint(p);if(e.kind==='LevelMesh')setOriginalLevelMeshTransform(memory,e.pointer,matrix);else setNativeMarkerTransform(bytes(e.pointer,80),matrix);},
    setEnabled,startEvent:()=>startOriginalEvent(entry.event,barn.bytes,()=>{}),resumeEvent:()=>requestOriginalEventEnabled(entry.event,barn.bytes,()=>{}),deltaTime:()=>this.delta,
    math:(op,x)=>this.host.math?.(op,x)??Math.fround(op==='acos'?Math.acos(x):op==='cos'?Math.cos(x):Math.sin(x)),stopSound:()=>{}
   };
  }
  const resolveClump=(p:bigint)=>({count:()=>memory.read32(p+16n),member:(i:number)=>memory.read64(memory.read64(p+8n)+BigInt(i*8))});
  const byEvent=new Map([...events.values()].map(e=>[e.event,e]));
  const unexpected=()=>{throw new Error('Event 生命周期依赖尚未接入');};
  const bridged=new Set<number>();
  const dispatch:OriginalEventBarnServices<undefined>={
   barnFor:()=>barn.bytes,logNullBarn:unexpected,
   virtual:(slot,event)=>{
    const e=byEvent.get(event)!;if(![0x10,0x30,0x38,0x40,0x48].includes(slot))unexpected();if(slot===0x30)e.starts++;
    if(isRestoredEnvironmentEvent(e.kind)){
     const id=[...events].find(([,entry])=>entry===e)![0],node=lookup.get(id)!,continuous=isContinuousEnvironmentEvent(node);
     if(slot===0x30)bridged.delete(id);
     if(slot===0x48){if(!bridged.has(id)){if(!this.host.environmentEvent)throw new Error('环境共享 owner 尚未接入');this.host.environmentEvent(id,[...endpoints].map(([id,entry])=>({id,matrix:getTransform(entry.pointer+8n),enabled:getEnabled(entry.pointer+8n)})));bridged.add(id);}if(!continuous)e.services.startEvent();}
     if(slot===0x40&&continuous)this.host.environmentEventEnabled?.(id,false);
    }
    else if(e.kind==='TransformObject')dispatchOriginalTransformObjectVirtual(slot as 0x10|0x30|0x38|0x40|0x48,memory,e.pointer,e.services);
    else if(e.kind==='Delay')dispatchOriginalDelayVirtual(slot,event,{frame:()=>setFloatFrame(this.delta,1,1),onBeat:unexpected,resolveClump,castObject:value=>castObject(value as bigint),setEnabled,startEvent:e.services.startEvent});
    else if(e.kind==='FloatAdd'||e.kind==='FloatMult'||e.kind==='SetFloat')dispatchOriginalNumericEventVirtual(e.kind,slot,event,{resolveFloat:p=>({storage:bytes(p,24)}),startEvent:e.services.startEvent,frame:()=>setFloatFrame(this.delta,1,1),math:{logf:x=>this.host.numericMath?.('logf',x)??Math.fround(Math.log(x)),expf:x=>this.host.numericMath?.('expf',x)??Math.fround(Math.exp(x))}});
    else if(e.kind==='OnFloat'||e.kind==='FloatSplit')dispatchOriginalFloatConditionVirtual(e.kind,slot,event,{memory,pool:{getPool:unexpected,allocate:unexpected,release:unexpected},resolveFloat:p=>({storage:bytes(p,24)}),resolveOnFloat:p=>bytes(p,192),resolveClump,castFloat:member=>{const p=member as bigint;return p&&memory.read32(p)===1?{storage:bytes(p,24)}:null;},setEnabled,startEvent:e.services.startEvent,debugValue:unexpected});
    else dispatchOriginalLogicEventVirtual(e.kind,slot,event,{resolveClump,castObject:value=>castObject(value as bigint),castEvent:p=>eventFor(p)?.event??null,setEnabled,getEnabled,resumeEvent:event=>resumeOriginalEvent(event,()=>startOriginalEvent(event,barn.bytes,()=>{})),startEvent:e.services.startEvent});
   },
   scratchHeap:()=>null,allocateScratch:()=>[],free:()=>{},eventHeap:unexpected,loadHeapUsed:unexpected
  };
  this.session={candidate:c,memory,storage,barn,events,endpoints,values:controls,dispatch,heapCursor:()=>used,getEnabled};this.error=null;this.running=true;this.paused=false;this.lastTime=undefined;
  requestOriginalEventEnabled(events.get(id)!.event,barn.bytes,()=>{});if(dispatchInitial)this.step(0);
 }
 update(now:number,paused:boolean){const previous=this.lastTime;this.lastTime=now;if(previous===undefined||paused||this.paused||!this.running)return;this.step(Math.max(0,(now-previous)/1000));}
 step(delta:number){
  const s=this.session;if(!s||!this.running||this.paused)return;
  try{
   this.delta=Math.fround(delta);updateOriginalEventBarn(s.barn,undefined,s.dispatch);
   for(const id of s.candidate.transformedObjects){const e=s.endpoints.get(id)!,matrix=e.kind==='LevelMesh'?getOriginalLevelMeshTransform(s.memory,e.pointer):getNativeMarkerTransform(s.memory.bytes(e.pointer,80));this.host.transform(id,matrix);}
   for(const id of s.candidate.enabledObjects)this.host.enabled?.(id,s.getEnabled(s.endpoints.get(id)!.pointer+8n));
   if(s.candidate.plans.some(p=>isRestoredEnvironmentEvent(p.kind)))this.host.environmentValues?.([...s.values].map(([id,p])=>({id,bits:s.memory.read32(p+16n)})));
   this.running=[...s.events.values()].some(e=>!!e.event[35]||!!e.event[33]);
  }catch(e){this.error=(e as Error).message;this.running=false;this.restore();}
 }
 togglePause(){if(this.running){this.paused=!this.paused;for(const [id,e] of this.session?.events??[]){const n=this.nodes.find(n=>n.id===id)!;if(e.event[35]&&isContinuousEnvironmentEvent(n)){if(this.host.environmentEventPaused)this.host.environmentEventPaused(id,this.paused);else this.host.environmentEventEnabled?.(id,!this.paused);}}}this.lastTime=undefined;}
 snapshot():TransformPreviewSnapshot|null{
  const s=this.session;if(!s)return null;
  const floats=(b:Uint8Array)=>{const v=new DataView(b.buffer,b.byteOffset,b.byteLength);return Array.from({length:16},(_,i)=>v.getFloat32(i*4,true));};
  const states=[...s.events].map(([id,e])=>{
   const v=new DataView(e.event.buffer,e.event.byteOffset),elapsed=e.kind==='TransformObject'?v.getFloat32(156,true):e.kind==='Delay'?v.getFloat32(72,true):0;
   const progress=e.kind==='TransformObject'?v.getFloat32(160,true):e.kind==='SetFloat'?(e.starts>0&&!e.event[35]&&!e.event[33]?1:Math.min(1,Math.max(0,v.getFloat32(76,true)/(v.getFloat32(60,true)||1)))):e.kind==='Delay'?(e.starts>0&&!e.event[35]&&!e.event[33]?1:Math.min(1,Math.max(0,elapsed/(v.getFloat32(56,true)||1)))):e.kind==='Enable'?Number(!!e.event[66]):Number(!e.event[35]&&!e.event[33]);
   return {id,kind:e.kind,running:!!e.event[35],pending:!!e.event[33],progress,elapsed,starts:e.starts};
  }),root=states.find(e=>e.id===s.candidate.id)!;
  return {id:s.candidate.id,kind:s.candidate.kind,running:this.running,paused:this.paused,progress:root.progress,elapsed:root.elapsed,events:states,objects:s.candidate.affectedObjects.map(id=>{const e=s.endpoints.get(id)!;return {id,matrix:floats(e.kind==='LevelMesh'?getOriginalLevelMeshTransform(s.memory,e.pointer):getNativeMarkerTransform(s.memory.bytes(e.pointer,80))),enabled:s.getEnabled(e.pointer+8n)};}),values:[...s.values].map(([id,p])=>({id,value:new DataView(s.memory.bytes(p+16n,4).buffer,Number(p+16n-O),4).getFloat32(0,true),bits:s.memory.read32(p+16n)})),error:this.error};
 }
 captureOriginalState():TransformPreviewOriginalState{
  const s=this.session;if(!s)throw new Error('没有变换播放状态');
  const barn=new Uint8Array(s.barn.bytes.subarray(0,0x5040)),v=new DataView(barn.buffer),eventPointers=[...s.events.values()].map(e=>e.pointer);
  eventPointers.forEach((p,i)=>v.setBigUint64(0x30+i*16,p,true));
  return {storage:new Uint8Array(s.storage),barn,eventPointers,heapCursor:s.heapCursor()};
 }
 private restore(){if(!this.session)return;if(this.session.candidate.plans.some(p=>isRestoredEnvironmentEvent(p.kind)))this.host.resetEnvironment?.();for(const id of this.session.candidate.transformedObjects){const e=this.session.endpoints.get(id)!;this.host.transform(id,e.initial);}for(const id of this.session.candidate.enabledObjects){const e=this.session.endpoints.get(id)!;this.host.enabled?.(id,e.initialEnabled);}}
 reset(){this.restore();this.session=undefined;this.running=false;this.paused=false;this.lastTime=undefined;this.error=null;}
}
