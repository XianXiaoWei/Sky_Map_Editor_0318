import {snapshotOriginalCrabNetState,receiveOriginalCrabBarn,sendOriginalCrabBarn,originalCrabNetworkBarnServices,type CrabNetStateServices,type CrabNetworkServices,type CrabNetworkCountCell} from '../src/core/crab-network-runtime';
import {updateOriginalCrabBarn} from '../src/core/crab-barn-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
export interface CrabNetworkCase {label:string;mode:0|1|2|3|4;count?:number;owners?:number[];timerBits?:number[];player?:number;kind?:number;targetType?:'none'|'crab'|'avatar'|'other';castMutation?:number;mutation?:number;packets?:number;packetIndices?:number[];countOverride?:number;steps?:number;deltaBits?:number;invalidId?:number;seed?:number;scratchFill?:number;positionBits?:number[];velocityBits?:number[];}
const base=0x440000000n;
export function crabNetworkCases(){const cases:CrabNetworkCase[]=[],add=(mode:0|1|2|3|4,label:string,c:Partial<CrabNetworkCase>={})=>cases.push({label:'Crab network '+mode+' '+label,mode,...c});
 for(const kind of [0,1,9,11])for(const targetType of ['none','crab','avatar','other'] as const)for(const castMutation of [0,1])add(0,'behavior/target/cast '+[kind,targetType,castMutation],{kind,targetType,castMutation});
 for(const invalidId of [0xffffffff,17])for(const owners of [[23],[0xffffffff],[17]])add(0,'owner sentinel '+[invalidId,owners],{invalidId,owners});
 for(const mode of [1,3] as const)for(const count of [0,1,3,16])for(const packets of [0,1,3])add(mode,'receive counts '+[count,packets],{count,packets:Math.min(packets,count),packetIndices:[0,0,0],steps:3});
 for(const owners of [[23,23,23],[24,24,24],[23,24,23]])for(const packetIndices of [[0,1,2],[2,1,0],[1,1,1]])add(1,'receive ownership/order '+[owners,packetIndices],{count:3,packets:3,owners,packetIndices});
 for(const packetIndices of [[3],[255]])add(1,'invalid packet index '+packetIndices,{count:3,packets:1,packetIndices});
 for(const mode of [2,4] as const)for(const count of [0,1,2,3,16])for(const owners of [[23],[24],[23,24]])add(mode,'send owned/due '+[count,owners],{count,owners,steps:3,targetType:'crab'});
 for(const timerBits of [[bits(-1)],[bits(0)],[0x80000000],[bits(.001)],[0x7fc00000],[bits(-1),bits(.1),bits(0)]])for(const count of [1,2,3])add(2,'send timer and pair/odd '+[timerBits,count],{timerBits,count,owners:[23]});
 for(const kind of [0,9,11])for(const targetType of ['none','crab','avatar','other'] as const)add(2,'actual snapshots '+[kind,targetType],{kind,targetType,count:3,owners:[23]});
 for(const mutation of [1,2,3,4])for(const mode of [1,2,3,4] as const)add(mode,'callback mutation '+[mutation,mode],{mutation,count:3,owners:[mode===1||mode===3?24:23],packets:3,packetIndices:[0,1,2]});
 for(const mode of [2,4] as const)for(const countOverride of [0,1])add(mode,'count service reduction '+countOverride,{count:3,owners:[23],countOverride});
 for(const mode of [0,1,2,3,4] as const)for(const scratchFill of [0,90,255])add(mode,'private scratch preservation '+scratchFill,{scratchFill,count:3,owners:[mode===1||mode===3?24:23],packets:3,steps:3});
 for(const mode of [0,2] as const)for(const x of [0x7fc00000,0xffc00000])for(const y of [0x7fc00000,0xffc00000])add(mode,'snapshot NaN lanes '+[x,y],{positionBits:[x,bits(2),bits(3),x],velocityBits:[y,bits(-2),bits(-3),y],count:1,owners:[23]});
 return cases;}
export function prepareCrabNetwork(c:CrabNetworkCase){const b=Buffer.alloc(0x40000);let seed=c.seed??71;for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const m={bytes:(p:bigint,n:number)=>b.subarray(Number(p-base),Number(p-base)+n),read32:(p:bigint)=>b.readUInt32LE(Number(p-base)),read64:(p:bigint)=>b.readBigUInt64LE(Number(p-base)),write32:(p:bigint,n:number)=>b.writeUInt32LE(n>>>0,Number(p-base)),write64:(p:bigint,n:bigint)=>b.writeBigUInt64LE(n,Number(p-base)),write8:(p:bigint,n:number)=>{b[Number(p-base)]=n;},string:()=>{throw new Error('Crab network state reads no strings');}};
 const ptr=(at:number,to:number)=>b.writeBigUInt64LE(to?base+BigInt(to):0n,at),floats=(at:number,v:number[])=>v.forEach((n,i)=>b.writeFloatLE(n,at+i*4)),count=c.count??3;
 b.writeUInt32LE(count,0x1410);ptr(0x4178,0x5000);ptr(0x5020,0x26000);b.writeUInt32LE(c.player??23,0x2dd18);b.writeUInt32LE(c.mode===2||c.mode===4?1:0,0x3000);b.writeUInt32LE(3,0x1514);b.writeUInt32LE(9,0x1518);
 for(let i=0;i<16;i++){const at=0x6000+i*0x800;ptr(0x1010+i*8,at);b.writeUInt32LE(c.owners?.[i%(c.owners.length||1)]??(i%2?24:23),at+0x598);b.writeUInt32LE(c.owners?.[i%(c.owners.length||1)]??23,at+0x500);b[at+0x594]=i;b.writeUInt32LE(c.timerBits?.[i%(c.timerBits.length||1)]??bits(-1),at+0xdc);b.writeUInt32LE(100+i,at+0x130);b.writeUInt32LE(c.kind??1,at+0x140);
  ptr(at+0x148,c.targetType==='none'||!c.targetType?0:c.targetType==='crab'?0x2b000:c.targetType==='avatar'?0x2b800:0x2bc00);b.writeUInt32LE(0x12345678,at+0x150);floats(at+0x160,[3,4,5,1]);floats(at+0x120,[1,2,3,1]);floats(at+16,[i,2,3,1]);floats(at+80,[1,2,3,0]);
  c.positionBits?.forEach((n,j)=>b.writeUInt32LE(n,at+16+j*4));c.velocityBits?.forEach((n,j)=>b.writeUInt32LE(n,at+80+j*4));
 }
 b[0x2b594]=42;b[0x2b994]=43;b.writeUInt32LE(77,0x2b8e0);
 for(let i=0;i<16;i++){const at=0x20000+i*128;b.writeUInt32LE(1000+i,at);b[at+4]=c.packetIndices?.[i%(c.packetIndices.length||1)]??i;b[at+12]=1;b[at+13]=3;}
 if(c.scratchFill!==undefined)b.fill(c.scratchFill,0x2d100,0x2d178);
 b.copy(b,0x2d000,0x2d100,0x2d178);b.fill(0,0x2e000,0x2e040);b.writeUInt32LE(c.packets??1,0x2e000);b.writeUInt32LE(c.countOverride??0xffffffff,0x2e004);b.writeUInt32LE(c.castMutation??0,0x2e008);b.writeUInt32LE(c.mutation??0,0x2e00c);b.writeUInt32LE(c.steps??1,0x2e010);b.writeUInt32LE(c.deltaBits??bits(1),0x2e014);b.writeUInt32LE(c.invalidId??0xffffffff,0x2e018);b.writeUInt32LE(count,0x2e01c);b.fill(0,0x3f000,0x3fa00);return {b,m};}
export function evaluateCrabNetwork(c:CrabNetworkCase,probes:readonly number[][]){const {b,m}=prepareCrabNetwork(c),rows:Buffer[]=[],map=new Map(probes.map(r=>[`${r[0]}:${r[1]}:${r[2]}`,r[3]]));let casts=0,serials=0,cell:CrabNetworkCountCell|undefined;
 const record=(kind:number,x:bigint|number=0,y:bigint|number=0,z:bigint|number=0)=>{const r=Buffer.alloc(192);[kind,x,y,z].forEach((n,i)=>r.writeBigUInt64LE(BigInt(n),i*8));rows.push(r);return r;};
 const arithmetic={resolveDualNaN:(op:'add'|'sub'|'mul'|'div',x:number,y:number)=>{const n=map.get(`${['add','sub','mul','div'].indexOf(op)}:${x>>>0}:${y>>>0}`);if(n===undefined)throw new Error('Crab native arithmetic probe missing');return n;}};
 const snapshot:CrabNetStateServices={arithmetic,invalidId:c.invalidId??0xffffffff,cast:(reference,type)=>{
  const d=new DataView(reference.buffer,reference.byteOffset,8),before=d.getBigUint64(0,true),selected=type==='Crab'&&(before===base+0x2b000n||before===base+0x2b400n)?before:type==='Avatar'&&before===base+0x2b800n?before:0n;record(1,type==='Crab'?1:2,before,selected);
  if(c.castMutation&&casts++===0)d.setBigUint64(0,selected?base+0x2b400n:base+0x2b800n,true);return selected;
 }};
 const state=b.subarray(0x2d000,0x2d078),network:CrabNetworkServices={snapshot:(crab,state)=>snapshotOriginalCrabNetState(m,crab,state,snapshot),count:(stream,count,minimum,maximum)=>{
  const result=c.mode===1||c.mode===3?c.packets??1:c.countOverride??count.value;if(result===undefined)throw new Error('Send count input missing');record(2,stream,count.value??0,maximum).writeUInt32LE(result,32);count.value=result;cell=count;state.set(b.subarray(0x2d100,0x2d178));if(c.mutation===1)b.writeUInt32LE(1,0x1410);
 },serialize:(state,stream)=>{
  record(3,stream,b.readUInt32LE(0x3000)).set(state,40);
  if(c.mode===1||c.mode===3)state.set(b.subarray(0x20000+(serials%16)*128,0x20078+(serials%16)*128));serials++;
  if(c.mutation===2&&cell)cell.value=1;if(c.mutation===3){m.write64(base+0x1010n,base+0x6800n);m.write32(base+0x6598n,24);}if(c.mutation===4){b.fill(91,0x1414,0x1494);b.writeUInt32LE(7,0x1514);}
 }};
 const barnServices=originalCrabNetworkBarnServices(m,(owner,name)=>{record(4,owner);return base+0x3000n;},state,network,snapshot);
 let line=0,severity=0;try{for(let step=0;step<(c.steps??1);step++){
  if(c.mode===0)snapshotOriginalCrabNetState(m,base+0x6000n,state,snapshot);
  if(c.mode===1)receiveOriginalCrabBarn(m,base+0x1000n,base+0x3000n,base+0x4000n,state,network);
  if(c.mode===2)sendOriginalCrabBarn(m,base+0x3000n,base+0x1010n,c.count??3,c.player??23,c.deltaBits??bits(1),state,network);
  if(c.mode===3||c.mode===4)updateOriginalCrabBarn(m,base+0x1000n,base+0x4000n,base+0x3200n,barnServices);
 }}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;severity=e.severity;}
 const header=Buffer.alloc(12);[line,severity,rows.length].forEach((n,i)=>header.writeUInt32LE(n,i*4));return Buffer.concat([header,b,...rows]);}
