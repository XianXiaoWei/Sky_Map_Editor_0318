import {executeFloatAdd,executeFloatEnable,type FloatCell,readFloatCell} from '../src/core/object-numeric-runtime';
import {executeIfEnabled} from '../src/core/object-flow-runtime';import {resetSetFloat,setFloatFrame,updateSetFloat} from '../src/core/set-float-runtime';
import {startOriginalEvent,constructOriginalEvent,resumeOriginalEvent,eventHasUniqueId,eventUniqueId,eventTypeIndex,forwardOriginalEventTransition} from '../src/core/event-start-runtime';
import type {ObjectBatchCase} from './object-batch-cases';
export const batchU32=(a:number[])=>{const b=Buffer.alloc(a.length*4);a.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));return b;};
export function evaluateObjectBatch(c:ObjectBatchCase,mathFixture:Buffer){
 const state=Buffer.from(c.stateHex,'hex'),barn=Buffer.alloc(32,0x5a);barn.writeUInt32LE(0xffffffff,0x10);
 const floats:FloatCell[]=c.cellHex.map(h=>({storage:Buffer.from(h,'hex')}));
 const trace:number[][]=[],mathBytes:Buffer[]=[];let casts=0,asserts=0,line=0,result=0xfffffffe,mathCalls=0,startCalls=0;
 const start=()=>{startCalls++;startOriginalEvent(state,barn,()=>{throw new Error('Unexpected null Barn');});};
 const index=(object:unknown)=>object===null?0xffffffff:floats.indexOf(object as FloatCell);
 const set=(object:unknown,enabled:boolean)=>{trace.push([1,index(object)],[2,+enabled]);if(object!==null)(object as FloatCell).storage[0xc]=+enabled;};
 const get=(object:unknown)=>{trace.push([3,index(object)]);return object===null?true:!!(object as FloatCell).storage[0xc];};
 const objects={count:()=>c.members.length,member:(i:number)=>c.members[i]===0xffffffff?null:floats[c.members[i]]};
 const events={count:()=>c.events.length,member:(i:number)=>c.events[i]===0xffffffff?null:floats[c.events[i]]};
 const math=(value:number)=>{if((mathCalls+1)*8>mathFixture.length)throw new Error('Missing native logf/expf output');const pair=Buffer.alloc(8);pair.writeFloatLE(value);pair.writeUInt32LE(mathFixture.readUInt32LE(mathCalls*8+4),4);mathBytes.push(pair);return mathFixture.readFloatLE(mathCalls++*8+4);};
 try{
  if(c.kind===0)executeFloatAdd({target:floats[c.target],amountFloat:c.amount===0xffffffff?null:floats[c.amount],output:c.output===0xffffffff?null:floats[c.output],amountBits:state.readUInt32LE(0x50),minimumBits:state.readUInt32LE(0x54),maximumBits:state.readUInt32LE(0x58),useMinimum:!!state[0x5c],useMaximum:!!state[0x5d],everyFrame:!!state[0x5e]},start);
  else if(c.kind===1)executeFloatEnable(floats[c.target],{objects:()=>objects,castObject:o=>{casts++;return o;},setEnabled:set});
  else if(c.kind===2)executeIfEnabled({objects:()=>objects,events:()=>events,getEnabled:get,setEnabled:set,startEvent:start,triggerOnDisabled:()=>!!state[0x40],checkOnce:()=>!!state[0x50]});
  else if(c.kind===3)resetSetFloat(state,floats[c.target]);
  else if(c.kind===4)updateSetFloat(state,floats[c.target],setFloatFrame(...c.frame as [number,number,number]),{logf:math,expf:math},start);
  else if(c.kind===5)constructOriginalEvent(state,c.target);
  else if(c.kind===6)resumeOriginalEvent(state,start);
  else if(c.kind===7)result=+eventHasUniqueId(state);
  else if(c.kind===8)result=eventUniqueId(state);
  else if(c.kind===9)result=eventTypeIndex(state);
  else forwardOriginalEventTransition(state,([0x30,0x38,0x40] as const)[c.kind-10],()=>{trace.push([4,state[0x21]|state[0x22]<<8|state[0x23]<<16]);});
 }catch(error){const msg=String(error);const location=/Clump.h:(\d+)|Event.cpp:(\d+)/.exec(msg);if(!location)throw error;asserts++;line=Number(location[1]??location[2]);}
 if(c.kind!==5)state.fill(0,0,8);state.fill(0,0x18,0x20);
 if(c.kind===0)state.fill(0,0x38,0x50);
 if(c.kind===1)state.fill(0,0x38,0x48);
 if(c.kind===2){state.fill(0,0x38,0x40);state.fill(0,0x48,0x50);}
 if(c.kind===3||c.kind===4)state.fill(0,0x40,0x48);
 return {startCalls,bytes:Buffer.concat([batchU32([result,casts,asserts,line,trace.length,mathCalls]),batchU32(trace.flat()),...mathBytes,state,barn,...floats.map(f=>Buffer.from(f.storage))])};
}
