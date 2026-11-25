import {dispatchOriginalEvent,updateOriginalEventBarn,loadOriginalEventBarn,releaseAllOriginalEvents,renderOriginalEvents,findOriginalEventByUniqueId,type OriginalEventBarn,type OriginalEventBarnServices,type OriginalEventNode} from '../src/core/event-barn-runtime';
import {runOriginalDerivedEventSlot,type OriginalDerivedEventDriver} from '../src/core/event-derived-drivers';
import type {OriginalSoundHandle} from '../src/core/sound-event-runtime';
import {eventUniqueId,requestOriginalEventEnabled,setOriginalEventEnabled,startOriginalEvent} from '../src/core/event-start-runtime';
import {sortOriginalEventPointers} from '../src/core/event-original-sort';
export interface EventBarnCase {name:string;states:string[];slots:number[];links:number[];counter:number;freeHead:number;heapUsed:number;flag:number;previousUsed:number;actions:number[][];rules:number[][];cells?:string[];drivers?:number[][];sound?:string;}
export const barnU32=(a:number[])=>{const b=Buffer.alloc(a.length*4);a.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));return b;};
export function encodeEventBarnCase(c:EventBarnCase):Buffer {
 const name=Buffer.alloc(128);name.write(c.sound??'');if(Buffer.byteLength(c.sound??'')>126)throw new Error('Sound name too long');
 return Buffer.concat([barnU32([c.states.length,c.actions.length,c.rules.length,c.counter,c.freeHead,c.heapUsed,c.flag,c.previousUsed,c.cells?.length??0]),...c.states.map(h=>Buffer.from(h,'hex')),barnU32(c.drivers?.flat()??c.states.flatMap(()=>[0,0,0,0])),...(c.cells??[]).map(h=>Buffer.from(h,'hex')),name,barnU32(c.rules.flat()),barnU32(c.actions.flat()),barnU32(c.slots),barnU32(c.links)]);
}
export function evaluateEventBarn(c:EventBarnCase):Buffer {
 const bytes=Buffer.alloc(0x105100,0xa5),events=c.states.map(h=>Buffer.from(h,'hex'));
 bytes.writeUInt32LE(c.counter,0x10);bytes[0x5038]=c.flag;bytes.writeUInt32LE(c.previousUsed,0x1050f0);
 const nodes:OriginalEventNode[]=c.slots.map(i=>({event:i===0xffffffff?null:events[i],next:null}));c.links.forEach((v,i)=>nodes[i].next=v===0xffffffff?null:nodes[v]);
 const barn:OriginalEventBarn={bytes,nodes,freeHead:c.freeHead===0xffffffff?null:nodes[c.freeHead]};
 const trace:number[][]=[],hits=new Map<string,number>();let asserts=0,line=0,logs=0,chars=0;
 const id=(e:Uint8Array|null)=>e===null?0xffffffff:events.findIndex(p=>p===e);
 const log=(message:string)=>{logs++;chars+=Buffer.byteLength(message);};
 const barnFor=(e:Uint8Array)=>new DataView(e.buffer,e.byteOffset,e.byteLength).getBigUint64(0x18,true)?bytes:null;
 const start=(e:Uint8Array)=>startOriginalEvent(e,barnFor(e),log);
 const set=(e:Uint8Array,enabled:boolean)=>setOriginalEventEnabled(e,enabled,barnFor(e),log);
 const record=(k:number,a=0,b=0,d=0,e=0,f=0,g=0)=>trace.push([k,a,b,d,e,f,g]);
 const cells=(c.cells??[]).map(h=>({storage:Buffer.from(h,'hex')}));
 const derived:Map<Uint8Array,OriginalDerivedEventDriver>=new Map();
 const hash=(b:Uint8Array)=>{let h=2166136261;for(const v of b)h=Math.imul(h^v,16777619)>>>0;return h;};
 const packet=(index:number,kind:number,b:Uint8Array)=>{record(118,index,kind,b.length);for(let i=0;i<b.length;i+=12){const row=Buffer.alloc(12);row.set(b.subarray(i,i+12));record(117,index,kind,i,row.readUInt32LE(0),row.readUInt32LE(4),row.readUInt32LE(8));}};
 for(const [i,d] of (c.drivers??[]).entries()){
  const p=events[i];
  if(d[0]===1)derived.set(p,{kind:'FloatAdd',state:{target:cells[d[1]],amountFloat:d[2]===0xffffffff?null:cells[d[2]],output:d[3]===0xffffffff?null:cells[d[3]],amountBits:p.readUInt32LE(0x50),minimumBits:p.readUInt32LE(0x54),maximumBits:p.readUInt32LE(0x58),useMinimum:!!p[0x5c],useMaximum:!!p[0x5d],everyFrame:!!p[0x5e]},startEvent:()=>start(p)});
  else if(d[0]===2){
   const handle:OriginalSoundHandle={id:()=>{const v=p[0x78];record(110,i,v);return BigInt(v);},playing:()=>{record(111,i,p[0x79]);return !!p[0x79];},description:()=>{record(112,i);return {playing:()=>{record(113,i,p[0x7a]);return !!p[0x7a];}};},stop:immediate=>record(114,i,+immediate),parameters:parameters=>{record(115,i,hash(parameters));packet(i,3,parameters);}};
   const time=Buffer.alloc(0x1090);time.writeFloatLE(12.5,0x108c);time.writeFloatLE(0.75,0x18);
   derived.set(p,{kind:'PlaySound2D',state:{launched:!!p[0x70],handle:p.readBigUInt64LE(0x60)?handle:null,handleId:p.readBigUInt64LE(0x68),sound:c.sound??'',volumeBits:p.readUInt32LE(0x50),mixChannel:p.readUInt32LE(0x54),gameTime:p.readBigUInt64LE(0x58)?time:null},services:{startEvent:()=>start(p),play:(name,options,parameters)=>{record(116,i,hash(Buffer.from(name)),hash(options),hash(parameters));packet(i,0,Buffer.from(name));packet(i,1,options);packet(i,2,parameters);return {handle:d[1]?handle:null,id:BigInt(d[2])};}}});
  }
 }
 const scratchHeap={},eventHeap={};
 const services:OriginalEventBarnServices<object>={barnFor,logNullBarn:log,
  scratchHeap:()=>{record(100);return scratchHeap;},
  allocateScratch:(heap,size,alignment)=>{if(heap!==scratchHeap)throw new Error('Wrong scratch heap');record(101,size,alignment);return [];},
  free:(heap,p)=>{if(heap===scratchHeap)record(102);else if(heap===eventHeap)record(102,1,id(p as Uint8Array|null));else throw new Error('Wrong free heap');},
  eventHeap:()=>eventHeap,loadHeapUsed:()=>{record(103,c.heapUsed);return c.heapUsed;},
  virtual:(slot,e,game,heap)=>{
   const p=e as Buffer,index=id(p);if(slot!==0&&game!==gameState)throw new Error('Wrong game context');if((slot===0x10||slot===0x18)&&heap!==0x85098)throw new Error('Wrong load heap');
   record(slot,index,p.readUInt32LE(0x20),p.readUInt32LE(0x10),p.readUInt32LE(0x30),p.readUInt32LE(0x34),slot===0x10||slot===0x18?0x85098:slot?1:0);
   const driver=derived.get(e);if(driver){runOriginalDerivedEventSlot(slot,driver);if(driver.kind==='PlaySound2D'){p[0x70]=+driver.state.launched;p.writeBigUInt64LE(driver.state.handleId,0x68);}}
   const key=`${index}:${slot}`,occurrence=(hits.get(key)??0)+1;hits.set(key,occurrence);
   for(const r of c.rules)if(r[0]===index&&r[1]===slot&&r[2]===occurrence){const target=events[r[4]];
    if(r[3]===0)target[r[5]]=r[6];else if(r[3]===1)target.writeUInt16LE(r[6]&0xffff,r[5]);else if(r[3]===2)target.writeUInt32LE(r[6]>>>0,r[5]);
    else if(r[3]===3)start(target);else if(r[3]===4||r[3]===5)set(target,r[3]===4);
    else if(r[3]===6)nodes[r[4]].event=r[6]===0xffffffff?null:events[r[6]];
    else if(r[3]===7)bytes.writeUInt32LE(r[6]>>>0,0x10);
    else if(r[3]===8)dispatchOriginalEvent(barn,target,gameState,services);
    else throw new Error('Unknown rule');
   }
  },
 };
 const gameState={};
 try{for(const a of c.actions){
  if(a[0]===0)start(events[a[1]]);
  else if(a[0]===1)requestOriginalEventEnabled(events[a[1]],barnFor(events[a[1]]),log);
  else if(a[0]===2)set(events[a[1]],!!a[2]);
  else if(a[0]===3)dispatchOriginalEvent(barn,events[a[1]],gameState,services);
  else if(a[0]===4)updateOriginalEventBarn(barn,gameState,services);
  else if(a[0]===5)loadOriginalEventBarn(barn,gameState,services);
  else if(a[0]===6)releaseAllOriginalEvents(barn,gameState,services);
  else if(a[0]===7)renderOriginalEvents(barn,gameState,services);
  else if(a[0]===8)record(104,id(findOriginalEventByUniqueId(barn,a[1])));
  else if(a[0]===9){const list=nodes.slice(0,events.length);sortOriginalEventPointers(list,(a,b)=>(a.event as Buffer).readUInt32LE(0x10)<(b.event as Buffer).readUInt32LE(0x10));list.forEach((n,i)=>record(105,i,id(n.event)));}
  else if(a[0]===10){const list=[...events];sortOriginalEventPointers(list,(a,b)=>eventUniqueId(a)<eventUniqueId(b));list.forEach((e,i)=>record(105,i,id(e)));}
  else throw new Error('Unknown action');
 }}catch(error){const m=/Event.cpp:(\d+)/.exec(String(error));if(!m)throw error;asserts++;line=Number(m[1]);}
 for(const [i,e] of events.entries()){e.fill(0,0,8);e.fill(0,0x18,0x20);if(c.drivers?.[i][0])e.fill(0,0x38,0x50);if(c.drivers?.[i][0]===2)e.fill(0,0x58,0x68);}
 for(const [i,n] of nodes.entries()){bytes.writeBigUInt64LE(n.event?BigInt(id(n.event)+1):0n,0x30+i*16);bytes.writeBigUInt64LE(n.next?BigInt(nodes.indexOf(n.next)+1):0n,0x38+i*16);}
 bytes.writeBigUInt64LE(barn.freeHead?BigInt(nodes.indexOf(barn.freeHead)+1):0n,0x5030);
 return Buffer.concat([barnU32([asserts,line,logs,chars,trace.length]),barnU32(trace.flat()),...events,bytes.subarray(0,0x5040),bytes.subarray(0x1050f0,0x1050f4),...cells.map(c=>c.storage)]);
}
