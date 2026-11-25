import {constructNativeMarker,constructNativeMarkerBarn,initializeNativeMarkerBarn,createNativeBarnMarker,releaseNativeBarnMarker,unloadNativeMarkerBarn,setNativeMarkerEnabled,getNativeMarkerEnabledByte} from '../src/core/marker-runtime';
import {tryResumeNativeObject,resumeNativeClump,type NativeObjectResumeServices} from '../src/core/object-resume-runtime';
import crypto from 'node:crypto';
import {constructOriginalFloatSplit,constructOriginalOnFloat,dispatchOriginalFloatConditionVirtual} from '../src/core/float-condition-event-runtime';
import {growNativeStringAndReplace,NativeStringLengthError} from '../src/core/native-string-runtime';
import {constructOriginalDelay,dispatchOriginalDelayVirtual} from '../src/core/delay-event-runtime';
import {setFloatFrame} from '../src/core/set-float-runtime';
import {R,O,E,C,M,kinds,logicMemory,logicMetaOffset,type LogicCase} from './logic-chain-cases';
import {NativeObjectFoundationFailure,constructNativeFloat} from '../src/core/object-foundation-runtime';
import {initializeNativeValueBarn,createNativeBarnValue,unloadNativeValueBarn} from '../src/core/value-barn-runtime';
import {constructNativeClump,destroyNativeClumpData,initializeNativeClumpBarn,createNativeBarnClump,allocateNativeClumpData,releaseNativeBarnClump,unloadNativeClumpBarn,setNativeClumpEnabled,type NativeClumpServices} from '../src/core/clump-runtime';
import {initializeNativeEventBarn,createNativeTriggerEvent,clearNativeEventTypeMap,type NativeTriggerEventServices} from '../src/core/native-event-barn-runtime';
import {constructOriginalEnable,constructOriginalIfEnabled,constructOriginalResumeEnable,updateOriginalResumeEnable,dispatchOriginalLogicEventVirtual} from '../src/core/logic-event-runtime';
import {constructOriginalFloatAdd,constructOriginalFloatMult} from '../src/core/event-foundation-runtime';
import {getNativeObjectEnabled,setNativeObjectEnabled,type NativeObjectEnabledServices} from '../src/core/object-enabled-runtime';
import {readNativeTgclFields,resolveNativeTgclPointers,type NativeTgclFieldServices} from '../src/core/tgcl-field-runtime';
import type {NativeStringMemory} from '../src/core/native-string-runtime';
import {bindNativeEventBarnView} from '../src/core/native-event-barn-view';
import {loadOriginalEventBarn,updateOriginalEventBarn,releaseAllOriginalEvents,type OriginalEventBarnServices} from '../src/core/event-barn-runtime';
import {startOriginalEvent,setOriginalEventEnabled,resumeOriginalEvent} from '../src/core/event-start-runtime';
import {dispatchOriginalNumericEventVirtual} from '../src/core/numeric-event-runtime';
export interface LogicResult {line:number;severity:number;services:number[][];frames:{objectsHex:string;markersHex:string;sequence:number}[];objectsHex:string;markerBarnSha256:string;clumpSha256:string;eventBarnSha256:string;cursorHex:string;tableHex:string;}
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
export function evaluateLogic(c:LogicCase):LogicResult {
 const registry=logicMemory(c),objects=Buffer.alloc(0x10000,0xa5),cb=Buffer.alloc(0x2b000,0x5a),eb=Buffer.alloc(0x105100),mb=Buffer.alloc(0x140c0,0x5a),services:number[][]=[];
 const result:LogicResult={line:0,severity:0,services,frames:[],objectsHex:'',markerBarnSha256:'',clumpSha256:'',eventBarnSha256:'',cursorHex:'',tableHex:''};
 const locate=(p:bigint):[Buffer,number]=>p>=M?[mb,Number(p-M)]:p>=C?[cb,Number(p-C)]:p>=E?[eb,Number(p-E)]:p>=O?[objects,Number(p-O)]:[registry,Number(p-R)];
 const memory:NativeStringMemory={read8:p=>{const [b,i]=locate(p);return b[i];},write8:(p,v)=>{const[b,i]=locate(p);b[i]=v;},read32:p=>{const[b,i]=locate(p);return b.readUInt32LE(i);},write32:(p,v)=>{const[b,i]=locate(p);b.writeUInt32LE(v>>>0,i);},read64:p=>{const[b,i]=locate(p);return b.readBigUInt64LE(i);},write64:(p,v)=>{const[b,i]=locate(p);b.writeBigUInt64LE(v,i);},string:p=>{const[b,i]=locate(p);return b.subarray(i,b.indexOf(0,i));},copy:(d,s,n)=>{const[b,i]=locate(s),[t,j]=locate(d);b.copy(t,j,i,i+n);},move:(d,s,n)=>{const[b,i]=locate(s),[t,j]=locate(d);b.copy(t,j,i,i+n);}};
 const norm=(p:bigint)=>!p?0xffffffff:p>=M&&p<M+0x140c0n?0x200000+Number(p-M):p>=C&&p<C+0x2b000n?0x100000+Number(p-C):Number(BigInt.asUintN(32,p-O));
 const log=(op:number,meta=0n,arg=0)=>services.push([op,meta?Number(meta-R):0,arg>>>0]);
 let bodies=0,arrayAt=0x4000,poolAt=0xf800,stringAt=0x8000;
 const allocate=(heap:bigint,size:bigint,_label:bigint,alignment:bigint)=>{log(34,0n,norm(heap));log(35,0n,Number(size));log(36,0n,Number(alignment));if(heap===R+0x5f00n)return 0x280000000n;if(heap===C+0x10n){const p=O+BigInt(arrayAt);arrayAt+=Number((size+15n)&~15n);return p;}return O+BigInt(bodies++*256);};
 const release=(heap:bigint,p:bigint)=>{log(37,0n,norm(heap));log(38,0n,norm(p));};
 const clearHeap=(heap:bigint)=>log(39,0n,norm(heap));
 const clumps:NativeClumpServices={classId:2,allocationLabel:R+0x5800n,allocate,release,clearHeap,zero:(p,n)=>{if(n){const[b,i]=locate(p);b.fill(0,i,i+Number(n));}}};
 const size=(meta:bigint)=>{const k=memory.read32(meta+0x38n);return BigInt(k===1?24:k===3?72:k===4?88:k===5?96:k===10?72:k===11?192:k===13?64:80);};
 const constructInPlace=(meta:bigint,p:bigint)=>{const k=memory.read32(meta+0x38n),[b,i]=locate(p),bytes=b.subarray(i,i+Number(size(meta))),base={eventClassId:7,eventVptr:0x100c14ea0n};
  if(k===1)constructNativeFloat(bytes,1);else if(k===3)constructOriginalEnable(bytes,3,base);else if(k===4)constructOriginalIfEnabled(bytes,4,base);else if(k===5)constructOriginalFloatAdd(bytes,5,base);else if(k===9)constructOriginalDelay(bytes,9,base);else if(k===10)constructOriginalFloatSplit(bytes,10,base);else if(k===11)constructOriginalOnFloat(bytes,11,base);else if(k===12)constructNativeMarker(bytes,12);else if(k===13)constructOriginalResumeEnable(bytes,13,base);else constructOriginalFloatMult(bytes,6,0x100d0cbf8n,base);return p;};
 const pool={getPool:()=>R+0x5e00n,allocate:(_pool:bigint,n:bigint)=>{if(n===40n){const p=R+BigInt(poolAt);poolAt+=Number(n);return p;}const p=O+BigInt(stringAt);stringAt+=Number(n);if(stringAt>0x10000)throw new Error('String pool fixture capacity');log(45,0n,norm(p));log(46,0n,Number(n));return p;},release:(_pool:bigint,p:bigint)=>{if(p>=O+0x8000n&&p<O+0x10000n)log(47,0n,norm(p));}};
 const events:NativeTriggerEventServices={eventClass:R+0x5700n,allocationLabel:R+0x5800n,size,alignment:()=>8n,allocate,constructInPlace,castEvent:(_t,p)=>p,pool,maxTypeIndex:()=>255};
 const values={valuePointerType:R+0x5d00n,allocationLabel:R+0x5800n,size,alignment:()=>8n,allocate,constructInPlace,castValue:(_t:bigint,p:bigint)=>p,release,clearHeap};
 const body=(p:bigint)=>{const[b,i]=locate(p),id=memory.read32(p+8n);return b.subarray(i,i+Number(size(R+BigInt(logicMetaOffset(id)))));};
 const fail=():never=>{throw new Error('Unrestored service outside logic scope');};
 const asClass=(meta:bigint)=>{if(meta===R+0x6000n){log(42,meta);throw new NativeObjectFoundationFailure('unimplemented-class-service',0xfffffffe,0,'metadata behavior unavailable');}return c.failure===2&&meta===R+0x5500n?0n:meta;};
 const receiver=(type:bigint,p:bigint,source:bigint)=>{log(33,type,norm(p));if(c.failure===1)return 0n;
  if(c.failure===3&&!registry[0xbffc]&&type===R+0x5c00n){const group=memory.read64(R+0xe800n);memory.write32(group+0x10n,1);memory.write64(group+8n,memory.read64(group+8n)+8n);registry[0xbffc]=1;}
  return (type===R+0x5c00n||type===R+0x6800n||type===R+0x5300n)&&source===R+0x5000n?p-8n:p;};
 const enabled:NativeObjectResumeServices={registry:R,cacheEnabled:()=>false,asClass,fallbackClass:()=>R+0x5000n,objectPointerType:()=>R+0x5000n,boolType:()=>R+0x5800n,voidType:()=>R+0x5900n,callParentGetter:()=>{log(31);return R+0x5700n;},cachedLookup:fail,
  receiverType:method=>method===R+0x6300n||method===R+0x6d00n?R+0x5b00n:method===R+0x6a00n||method===R+0x6b00n?R+0x6800n:method===R+0x6c00n?R+0x5300n:R+0x5c00n,castReceiver:receiver,
  invoke:(method,p,_result,argument)=>{if(method===R+0x6b00n){const v=getNativeMarkerEnabledByte(body(p));log(32,R+0x5800n,v);return !!v;}if(method===R+0x6200n){const v=memory.read8(p+0x23n);log(32,R+0x5800n,v);return !!v;}
   log(32,R+0x5800n,Number(argument));if(method===R+0x6a00n)setNativeMarkerEnabled(body(p),Number(argument));else if(method===R+0x6300n)setNativeClumpEnabled(memory,p,!!argument,(o,e)=>setNativeObjectEnabled(memory,o,e,enabled));else setOriginalEventEnabled(body(p),!!argument,eb,fail);return true;},
  gameType:()=>{log(56);return R+0x8a00n;},
  invokeResume:(method,p,game,gameType)=>{log(57,gameType,Number(game-R));if(method===R+0x6d00n)resumeGroup(p,game);else if(method===R+0x6c00n){debugResume('Enable',p);setOriginalEventEnabled(body(p),true,eb,fail);}else fail();},
 };
 const debugResume=(kind:'Clump'|'Enable',p:bigint)=>{log(48,0n,2);const text=kind==='Clump'?'Resuming Clump ':'Resuming Enable ';let h=2166136261;for(const x of new TextEncoder().encode(text))h=Math.imul(h^x,16777619)>>>0;log(49,0n,text.length);log(50,0n,h);log(53,0n,norm(p));log(52);};
 const resumeGroup=(p:bigint,game:bigint):void=>resumeNativeClump(memory,p,game,{debugResume,tryResume:(o,g)=>tryResumeNativeObject(memory,o,g,false,enabled),setEnabled:(o,e)=>setNativeObjectEnabled(memory,o,e,enabled)});
 const markers={destroy:(_p:bigint)=>{}};
 const fields:NativeTgclFieldServices={registry:R,nullObjectType:R+0x5900n,integerType:R+0x5a00n,asClass,castObject:(meta,p)=>{const id=memory.read32(meta+0x38n);return ((id>=3&&id<=7)||(id>=9&&id<=13))?p-8n:p;},methodReceiverType:()=>R+0x5b00n,castReceiver:receiver,invokeArrayAllocator:(_method,p,n)=>allocateNativeClumpData(memory,p,n,clumps),fieldReceiverType:()=>R+0x5200n,fieldAddress:(_type,p,_root,member)=>p+member,elementType:()=>R+0x5000n,elementObject:fail,growAndReplace:(...args)=>growNativeStringAndReplace(memory,...args,pool)};
 try {
  mb.fill(0,0x30,0xb0);constructNativeMarkerBarn(memory,M,14);initializeNativeMarkerBarn(memory,M);initializeNativeValueBarn(memory,R+0xa000n);initializeNativeClumpBarn(memory,C);initializeNativeEventBarn(memory,E,(tree,root)=>clearNativeEventTypeMap(memory,tree,root,pool));
  c.nodes.forEach((node,i)=>{const id=kinds.indexOf(node.kind as any),meta=R+BigInt(logicMetaOffset(id));let p:bigint;if(id<0){p=allocate(R+0x6e00n,24n,0n,8n);memory.write32(p,8);}else p=id===12?createNativeBarnMarker(memory,M,12)+8n:id===1?createNativeBarnValue(memory,R+0xa000n,meta,values):id===2?createNativeBarnClump(memory,C,clumps):createNativeTriggerEvent(memory,E,meta,events)+8n;
   if(id>=0)readNativeTgclFields(memory,R+0xc000n,p,R+0xe000n+BigInt(i*12),fields);memory.write64(R+0xe800n+BigInt(i*8),p);
  });
  resolveNativeTgclPointers(memory,R+0xc000n,R+0xe800n);
  const bound=bindNativeEventBarnView(memory,E,eb,body,e=>O+BigInt(e.byteOffset-objects.byteOffset)),barn=bound.barn;
  const bs:OriginalEventBarnServices<bigint>={barnFor:()=>eb,logNullBarn:fail,virtual:(slot,event)=>{
   const id=new DataView(event.buffer,event.byteOffset,event.byteLength).getUint32(8,true),start=()=>startOriginalEvent(event,eb,fail);
   if(id===3||id===4)dispatchOriginalLogicEventVirtual(id===3?'Enable':'IfEnabled',slot,event,{resolveClump:p=>({count:()=>memory.read32(p+0x10n),member:i=>memory.read64(memory.read64(p+8n)+BigInt(i*8))}),castObject:v=>v as bigint,castEvent:p=>{const id=memory.read32(p);return ((id>=3&&id<=6)||(id>=9&&id<=11)||id===13)?body(p-8n):null;},setEnabled:(p,on)=>setNativeObjectEnabled(memory,p,on,enabled),getEnabled:p=>getNativeObjectEnabled(memory,p,enabled),resumeEvent:e=>resumeOriginalEvent(e,()=>startOriginalEvent(e,eb,fail)),startEvent:start});
   else if(id===13){if(slot===0x48)updateOriginalResumeEnable(event,R+0x9000n,resumeGroup,start);else if(![0,0x10,0x18,0x30,0x38,0x40].includes(slot))fail();}
   else if(id===9)dispatchOriginalDelayVirtual(slot,event,{frame:()=>setFloatFrame(registry.readFloatLE(0x9814),registry.readFloatLE(0x9820),registry[0x9844]?registry.readFloatLE(0x9840):1),onBeat:()=>{log(43,0n,registry[0x99c0]);return !!registry[0x99c0];},resolveClump:p=>({count:()=>memory.read32(p+0x10n),member:i=>memory.read64(memory.read64(p+8n)+BigInt(i*8))}),castObject:v=>v as bigint,setEnabled:(p,on)=>setNativeObjectEnabled(memory,p,on,enabled),startEvent:start});
   else if(id===10||id===11)dispatchOriginalFloatConditionVirtual(id===10?'FloatSplit':'OnFloat',slot,event,{memory,pool,resolveFloat:p=>{const[b,i]=locate(p);return {storage:b.subarray(i,i+24)};},resolveOnFloat:p=>body(p),resolveClump:p=>({count:()=>memory.read32(p+0x10n),member:i=>memory.read64(memory.read64(p+8n)+BigInt(i*8))}),castFloat:value=>{const p=value as bigint;log(54,0n,norm(p));if(c.failure===4&&!registry[0xbffc]){memory.write32(memory.read64(R+0xe800n)+0x10n,1);registry[0xbffc]=1;}if(!p||memory.read32(p)!==1)return null;const[b,i]=locate(p);return {storage:b.subarray(i,i+24)};},setEnabled:(p,on)=>setNativeObjectEnabled(memory,p,on,enabled),startEvent:start,debugValue:bits=>{log(48,0n,8);for(const text of ['value->value',': ']){log(49,0n,text.length);let h=2166136261;for(const x of new TextEncoder().encode(text))h=Math.imul(h^x,16777619)>>>0;log(50,0n,h);}log(51,0n,bits);log(49,0n,1);log(50,0n,Math.imul(2166136261^32,16777619)>>>0);log(52);}});
   else dispatchOriginalNumericEventVirtual(id===5?'FloatAdd':'FloatMult',slot,event,{resolveFloat:p=>{const[b,i]=locate(p);return {storage:b.subarray(i,i+24)};},startEvent:start,frame:()=>1,math:{logf:fail,expf:fail}});
  },scratchHeap:()=>R+0x5f00n,allocateScratch:(heap,n,a)=>{allocate(heap as bigint,BigInt(n),0n,BigInt(a));return [];},free:(heap,p)=>release(heap as bigint,Array.isArray(p)?0x280000000n:p?O+BigInt(p.byteOffset-objects.byteOffset):0n),eventHeap:()=>E+0x5040n,loadHeapUsed:()=>17};
  const snapshot=()=>result.frames.push({objectsHex:objects.subarray(0,0x4000).toString('hex'),markersHex:mb.subarray(0,0x10b0).toString('hex'),sequence:eb.readUInt32LE(0x10)});
  loadOriginalEventBarn(barn,R+0x9000n,bs);bound.commit();snapshot();
  for(const a of c.actions){const p=a[1]===0xffffffff?0n:memory.read64(R+0xe800n+BigInt(a[1]*8));
   switch(a[0]){case 15:releaseNativeBarnMarker(memory,M,p?p-8n:0n,markers);break;case 16:createNativeBarnMarker(memory,M,12);break;case 18:memory.write32(M+BigInt(a[2]===0?0x140b0:a[2]===1?0x10:0x30),a[3]);break;case 19:releaseNativeBarnMarker(memory,M,memory.read64(M+0x28n)+(a[2]===0?-80n:81920n),markers);break;case 20:unloadNativeMarkerBarn(memory,M,markers,true);break;case 21:constructNativeMarker(body(p-8n),12);break;case 22:tryResumeNativeObject(memory,p,R+0x9000n,!!a[2],enabled);break;case 24:for(let i=0;i<a[1];i++)createNativeBarnMarker(memory,M,12);break;case 0:updateOriginalEventBarn(barn,R+0x9000n,bs);bound.commit();snapshot();break;case 1:setNativeObjectEnabled(memory,p,!!a[2],enabled);break;case 2:log(40,0n,Number(getNativeObjectEnabled(memory,p,enabled)));break;case 3:allocateNativeClumpData(memory,p,a[2],clumps);break;case 4:releaseNativeBarnClump(memory,C,p,clumps);break;case 5:createNativeBarnClump(memory,C,clumps,a[2]);break;case 6:memory.write64(p+0x18n,0n);break;case 14:memory.write32(p+BigInt(a[2]),a[3]);break;case 12:registry.writeUInt32LE(a[3]>>>0,0x9800+a[2]);break;case 13:registry[0x99c0]=a[2];break;case 9:memory.write32(p-8n+BigInt(a[2]),a[3]);break;case 10:constructNativeClump(memory,p,2);break;case 11:destroyNativeClumpData(memory,p,clumps);break;case 8:for(let i=0;i<a[1];i++)createNativeBarnClump(memory,C,clumps);break;default:fail();}
  }
  releaseAllOriginalEvents(barn,R+0x9000n,bs);bound.commit();unloadNativeClumpBarn(memory,C,clumps);unloadNativeMarkerBarn(memory,M,markers);unloadNativeValueBarn(memory,R+0xa000n,values);initializeNativeEventBarn(memory,E,(tree,root)=>clearNativeEventTypeMap(memory,tree,root,pool));
 }catch(e){if(e instanceof NativeStringLengthError){log(55);result.line=0xfffffffd;result.severity=0;}else{if(!(e instanceof NativeObjectFoundationFailure))throw e;result.line=e.line;result.severity=e.severity;}}
 result.objectsHex=objects.toString('hex');result.markerBarnSha256=hash(mb.subarray(0,0x140b4));result.clumpSha256=hash(cb.subarray(0,0x2a070));result.eventBarnSha256=hash(eb.subarray(0,0x5100));result.cursorHex=registry.subarray(0xd478,0xd490).toString('hex');result.tableHex=registry.subarray(0xe800,0xe800+c.nodes.length*8).toString('hex');return result;
}
