import {prepareCrabBehavior,CRAB_BEHAVIOR_ARENA_BYTES,CRAB_BEHAVIOR_TRACE_BYTES} from './crab-behavior-cases';
import {flockOriginalCreatureSteering} from '../src/core/creature-flocking-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
export {CRAB_BEHAVIOR_ARENA_BYTES as FLOCKING_ARENA_BYTES,CRAB_BEHAVIOR_TRACE_BYTES as FLOCKING_TRACE_BYTES};
export interface FlockingCase {mode:4;seed:number;count?:number;queryCount?:number;cached?:number;active?:number;selfIndex?:number;types?:('actor'|'avatar'|'generic')[];position?:number[];target?:number[];velocity?:number[];force?:number[];radius?:number;neighborRadius?:number;neighborWeight?:number;range?:number;weight?:number;alignment?:number;cohesion?:number;separation?:number;weightW?:number;alignmentW?:number;cohesionW?:number;separationW?:number;callback?:number;repeat?:number;arithmetic?:number[][];fallbackWeight?:number;}
const STATE=0x1000,TARGET=0x7000;
export function prepareFlocking(c:FlockingCase){
 const prepared=prepareCrabBehavior(c),{b,base}=prepared;
 const vector=(at:number,v:number[])=>v.forEach((n,i)=>b.writeFloatLE(n,at+i*4));
 b[STATE+16]=c.active??1;vector(STATE,c.force??[3,4,0,0]);vector(STATE+32,c.position??[0,0,0,0]);vector(STATE+96,c.velocity??[0,0,0,0]);
 b.writeFloatLE(c.radius??1,STATE+0x70);b.writeFloatLE(3,STATE+0x74);b.writeInt32LE(c.cached??0,STATE+0x1bc);b.writeUInt32LE(c.count??3,STATE+0x1b8);b.writeBigUInt64LE(base+0x5000n,STATE+0x1d0);
 for(let i=0;i<32;i++){
  const body=TARGET+i*0x200,position=c.target??[i+1,0,0,0],type=c.types?.[i%(c.types.length||1)]??'actor';
  b.writeBigUInt64LE(base+0x18800n,body);b[body+0xe0]=type==='actor'?1:type==='avatar'?2:0;
  vector(body+16,position);vector(body+32,[1,0,0,0]);vector(body+48,[0,1,0,0]);vector(body+64,[0,0,1,0]);vector(body+80,c.velocity??[1,0,0,0]);
  b.writeFloatLE(c.neighborRadius??1,body+96);b.writeFloatLE(c.neighborWeight??1,body+100);b.writeFloatLE(c.neighborWeight??1,body+104);
  for(let lane=0;lane<3;lane++)vector(body+0x100+lane*16,[[1,0,0,0],[0,1,0,0],[0,0,1,0]][lane]);vector(body+0x130,position);
  b.set(b.subarray(body+16,body+16+0x5c),body+0x190);
  b.writeBigUInt64LE(i===c.selfIndex?base+0x2000n:base+BigInt(body),STATE+0xb8+i*8);
  b.writeBigUInt64LE(i===c.selfIndex?base+0x2000n:base+BigInt(body),0x1e000+i*8);
 }
 b.writeBigUInt64LE(0x102220060n,0x18828);
 [c.weight??1,c.alignment??.5,c.cohesion??.5,c.separation??1,c.range??10].forEach((n,i)=>vector(0x1f100+i*16,[n,0,0,[c.weightW,c.alignmentW,c.cohesionW,c.separationW][i]??0]));
 b.writeUInt32LE(c.queryCount??c.count??3,0x1f208);b.writeUInt32LE(c.repeat??1,0x1f20c);
 b.writeFloatLE(c.fallbackWeight??0,0x1f210);b.writeUInt32LE(c.callback??0,0x1f000);return prepared;
}
export function evaluateFlocking(c:FlockingCase){
 const {b,m,base}=prepareFlocking(c),trace=Buffer.alloc(CRAB_BEHAVIOR_TRACE_BYTES);let used=0,casts=0,line=0,severity=0;
 const log=(...row:number[])=>{for(let i=0;i<8;i++)trace.writeUInt32LE((row[i]??0)>>>0,(used++)*4);},off=(p:bigint)=>p?Number(p-base)>>>0:0xffffffff;
 const probes=new Map((c.arithmetic??[]).map(row=>[`${row[0]}:${row[1]}:${row[2]}`,row[3]]));
 const arithmetic={resolveDualNaN:(op:'add'|'sub'|'mul'|'div',a:number,d:number)=>{const n=probes.get(`${['add','sub','mul','div'].indexOf(op)}:${a>>>0}:${d>>>0}`);if(n===undefined)throw new Error(`Missing flock arithmetic probe: ${op}:${a>>>0}:${d>>>0}`);return n;}};
 const state=base+BigInt(STATE);
 const s={arithmetic,query:(owner:bigint,position:bigint,out:bigint,capacity:32,filter:bigint,radiusBits:number)=>{log(8,off(owner),off(position),off(out),capacity,off(filter),radiusBits,0);m.bytes(out,32*8).set(m.bytes(base+0x1e000n,32*8));return b.readUInt32LE(0x1f208);},
  cast:(memory:typeof m,reference:bigint,kind:'Actor'|'Avatar')=>{const object=memory.read64(reference),tag=kind==='Actor'?0:1,flags=object?memory.bytes(object+0xe0n,1)[0]:0;let selected=flags&(1<<tag)?object:0n,current=object;casts++;
   if(c.callback===4&&tag===0&&selected)selected=base+0x10000n;
   if(c.callback===5&&tag===0&&casts===1){current=base+0x7800n;selected=0n;}
   if(c.callback===10&&casts===1)m.write32(state+0x1b8n,1);
   memory.write64(reference,current);log(1,tag,off(object),off(selected),off(current));return selected;},
  avatarMotion:(object:bigint)=>{log(2,off(object));return new Uint8Array(m.bytes(object+0x190n,0x5c));},fallbackWeightBits:(_index:number)=>bits(c.fallbackWeight??0),obb:(object:bigint)=>{log(9,off(object));return new Uint8Array(m.bytes(object+0x100n,64));}};
 try{for(let i=0;i<(c.repeat??1);i++)flockOriginalCreatureSteering(m,state,base+0x2000n,base+0x9900n,{weightBits:bits(c.weight??1),alignmentBits:bits(c.alignment??.5),cohesionBits:bits(c.cohesion??.5),separationBits:bits(c.separation??1),radiusBits:bits(c.range??10),weightWBits:bits(c.weightW??0),alignmentWBits:bits(c.alignmentW??0),cohesionWBits:bits(c.cohesionW??0),separationWBits:bits(c.separationW??0)},s);}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(8);header.writeUInt32LE(line|(severity<<16));header.writeUInt32LE(used,4);return Buffer.concat([header,trace,b]);
}
export function flockingCases(){const cases:FlockingCase[]=[],add=(rest:Omit<FlockingCase,'mode'|'seed'>={})=>cases.push({mode:4,seed:501+cases.length,...rest});
 for(const count of [0,1,3,16,32])for(const cached of [-1,0,1,8])add({count,cached});
 for(const types of [['actor'],['avatar'],['generic'],['actor','avatar','generic']] as FlockingCase['types'][])for(const selfIndex of [undefined,0,1])add({types,selfIndex});
 for(const target of [[0,0,0,0],[.001,0,0,0],[1,0,0,0],[3,4,0,0],[20,0,0,0],[NaN,0,0,0],[Infinity,0,0,0]])for(const types of [['actor'],['avatar'],['generic']] as FlockingCase['types'][])add({target,types});
 for(const range of [0,.001,1,2,10,-10,NaN,Infinity])add({range});
 for(const neighborWeight of [0,-1,.5,2,NaN])for(const neighborRadius of [0,1,10])add({neighborWeight,neighborRadius});
 for(const weight of [0,.00001,.0000101,-1,NaN,Infinity])add({weight});
 for(const alignment of [0,-1,1,NaN])for(const cohesion of [0,1])add({alignment,cohesion,separation:0});
 for(const weightW of [0,1])for(const target of [[3,4,0,2],[0,0,0,7]])add({weightW,alignmentW:1,cohesionW:1,separationW:1,target});
 for(const callback of [4,5,10])add({callback,types:['actor','avatar','generic'],count:3});
 for(const repeat of [2,8,9,10])add({repeat,types:['actor','avatar','generic']});
 for(const fallbackWeight of [0,1,-1])add({types:['generic'],fallbackWeight});add({active:0});return cases;
}
