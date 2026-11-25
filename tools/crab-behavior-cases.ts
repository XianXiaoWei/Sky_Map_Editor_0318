import {evaluateOriginalCrabBehavior,considerOriginalCrabBehavior,updateOriginalCrabBehaviorMetrics,type CrabBehaviorServices} from '../src/core/crab-behavior-runtime';
import {readOriginalCreatureMotionState,type CreatureMotionStateServices} from '../src/core/creature-motion-state-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
import {selectOriginalCrabState} from '../src/core/crab-state-runtime';
import {updateOriginalCrabAi} from '../src/core/crab-ai-update-runtime';
export interface CrabStateCaseFields {neighbors?:('actor'|'flame'|'marker'|'crab'|'generic'|'self')[];stackWord?:number;actorActive?:boolean;flameEnabled?:boolean;flameLit?:boolean;crabState?:number;actorIds?:number[];flameIds?:number[];avatarPresent?:boolean;stateWeights?:number[];queryTimer?:number;stateTimer?:number;followFlag?:number;stopFlag?:number;pathReady?:boolean;pathDistance?:number;pathTarget?:number[];angle?:number;actorLookup?:boolean;flameLookup?:boolean;selectedKind?:number;atanAngle?:number;flockPositions?:number[][];flockVelocities?:number[][];frames?:number;}
export const CRAB_BEHAVIOR_ARENA_BYTES=0x20000,CRAB_BEHAVIOR_TRACE_BYTES=8192;
export interface CrabBehaviorCase extends CrabStateCaseFields {mode:number;seed:number;kind?:number;current?:number;targetType?:'actor'|'avatar'|'marker'|'generic'|'none';position?:number[];target?:number[];velocity?:number[];radius?:number;speed?:number;ownRadius?:number;ownSpeed?:number;markerExtent?:number[];count?:number;ownCount?:number;sameParams?:boolean;sameTarget?:boolean;actorPresent?:boolean;flamePresent?:boolean;callback?:number;outAlias?:number;label?:string;arithmetic?:number[][];weight?:number;period?:number;stateScore?:number;duration?:number;bestScore?:number;bestAlias?:number;aiSeed?:number;asin?:number;recovery?:number;delta?:number;timeScale?:number;debugScale?:number;}
const BASE=0x440000000n,AI=0x1000,SELF=0x2000,RECORD=0x6000,TARGET=0x7000,OTHER=0x7800,OUT=0x12000;
const types={actor:5,avatar:2,marker:8,generic:0,none:0};
export function prepareCrabBehavior(c:CrabBehaviorCase){
 const b=Buffer.alloc(CRAB_BEHAVIOR_ARENA_BYTES);let seed=c.seed>>>0;for(let i=0;i<b.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;b[i]=seed>>>24;}
 const p=(at:number,n:number)=>b.writeBigUInt64LE(n?BASE+BigInt(n):0n,at),w=(at:number,n:number)=>b.writeUInt32LE(n>>>0,at),vector=(at:number,v:number[])=>{for(let i=0;i<4;i++)b.writeFloatLE(v[i]??0,at+i*4);};
 const type=c.targetType??'actor',position=c.position??[0,0,0,0],target=c.target??[4,0,0,0],velocity=c.velocity??[0,0,0,0];
 for(const body of [SELF,TARGET,OTHER]){
  p(body,0x18800);b[body+0xe0]=body===SELF?5:body===OTHER&&c.callback===5?2:types[type];
  const pos=body===SELF?position:target;vector(body+16,pos);vector(body+32,[1,0,0,0]);vector(body+48,[0,1,0,0]);vector(body+64,[0,0,1,0]);vector(body+80,body===SELF?[0,0,0,0]:velocity);
  b.writeFloatLE(body===SELF?(c.ownRadius??1):(c.radius??2),body+0x60);b.writeFloatLE(body===SELF?(c.ownSpeed??1):(c.speed??3),body+0x64);w(body+0x68,19);w(body+0x78,c.count??1);p(body+0x80,body===SELF||c.sameParams?0x9000:0x9100);
  for(let i=0;i<3;i++){vector(body+0x100+i*16,i===2?(c.markerExtent??[0,0,2,0]):[Number(i===0),Number(i===1),0,0]);vector(body+0x140+i*16,[1,1,1,0]);}vector(body+0x130,pos);vector(body+0x170,[0,0,0,0]);
  b.set(b.subarray(body+16,body+16+0x5c),body+0x190);
 }
 p(AI+8,0x9000);w(AI+64,c.aiSeed??c.seed);
 for(let kind=0;kind<=12;kind++)b.writeFloatLE(c.stateScore??.5,AI+0x94+kind*4);
 for(let kind=1;kind<=10;kind++){vector(0x9000+0x10+kind*16,[c.weight??1,c.period??2,c.recovery??4,0]);vector(0x9200+0x10+kind*16,[2,1,2,0]);}
 p(AI+16,SELF);p(AI+24,c.actorPresent===false?0:OTHER);p(AI+32,c.flamePresent===false?0:0x8000);vector(0x80c0,target);vector(AI+48,c.target??[3,0,0,0]);w(AI+0x50,c.current??c.kind??1);p(AI+0x58,c.sameTarget===false?OTHER+8:TARGET+8);w(AI+0x60,c.sameTarget===false?8:7);w(AI+0x64,c.ownCount??1);
 vector(AI+112,target);b.writeFloatLE(c.duration??.5,AI+128);
 p(0xa000+0x160,0xa800);b.writeFloatLE(c.delta??.1,0xa800+20);b.writeFloatLE(c.timeScale??1,0xa800+32);b.writeFloatLE(c.debugScale??1,0x1f01c);b[0x1f020]=c.debugScale===undefined?0:1;
 w(RECORD,c.kind??1);p(RECORD+8,type==='none'?0:TARGET+8);w(RECORD+16,7);vector(RECORD+32,target);b.writeFloatLE(c.duration??.5,RECORD+48);
 p(0x18040,0);b.writeBigUInt64LE(0x102220000n,0x18040);
 for(let kind=0;kind<4;kind++){p(0x18100+kind*0x100,0x18000);w(0x18108+kind*0x100,kind);}
 b.writeBigUInt64LE(0x102220020n,0x18818);
 for(let i=0;i<3;i++)vector(0x19000+i*16,i===2?(c.markerExtent??[0,0,2,0]):[Number(i===0),Number(i===1),0,0]);vector(0x19030,target);
 w(0x1f000,c.callback??0);w(0x1f004,c.mode);w(0x1f008,c.outAlias??-1);b.writeFloatLE(.9,0x1f010);b.writeFloatLE(c.asin??.25,0x1f014);w(0x1f018,c.bestAlias===undefined?0x6800:RECORD+c.bestAlias);
 if(c.mode===2)b.writeFloatLE(c.bestScore??-3.4028234663852886e38,c.bestAlias===undefined?0x6840:RECORD+c.bestAlias+64);
 if(c.mode>=5){
  p(0x18600,0x18000);w(0x18608,4);b.writeBigUInt64LE(0x102220080n,0x18810);
  p(0xa000+0x370,0xb000);p(0xa000+0x280,0xc000);p(0x1f240,c.avatarPresent===false?0:OTHER);w(0x1f248,c.stackWord??0);
  w(AI+0x1c8,c.neighbors?.length??0);p(AI+24,c.actorPresent===false?0:TARGET);p(AI+32,c.flamePresent===false?0:0x8000);
  const locations={actor:0x7000,flame:0x8000,marker:0xd000,crab:0xe000,generic:0xf000,self:SELF};
  for(const [name,body] of Object.entries(locations))if(name!=='self'){
   if(body!==TARGET&&body!==OTHER)b.set(new Uint8Array(b.subarray(TARGET,TARGET+0x240)),body);
   b[body+0xe0]=name==='actor'?1:name==='flame'?16:name==='marker'?8:name==='crab'?5:0;
   b[body+0xe1]=Number(c.actorActive!==false);b[body+0xb4]=Number(c.flameEnabled!==false);b[body+0xb6]=Number(c.flameLit!==false);
   w(body+0x74,7);w(body+0x150,7);w(body+0x140,c.crabState??10);vector(body+0xc0,target);
  }
  // The current followed crab remains a valid native cast independently
  // of the neighbor Actor fixture, as in the original pre-selection state.
  b[OTHER+0xe0]=5;if(c.current===11)p(AI+0x58,OTHER+8);
  (c.neighbors??[]).forEach((name,i)=>p(AI+0xc8+i*8,locations[name]+(name==='self'?0:8)));
  const actorIds=c.actorIds??[],flameIds=c.flameIds??[];w(0xb000+0x514,actorIds.length);w(0xb000+0x518,flameIds.length);
  actorIds.forEach((id,i)=>w(0xb000+0x414+i*4,id));flameIds.forEach((id,i)=>w(0xb000+0x494+i*4,id));
  (c.stateWeights??[]).forEach((weight,kind)=>{if(kind>=1&&kind<=11&&kind!==10)b.writeFloatLE(weight,0x9000+(kind===11?0xb0:0x10+kind*16));});
 }
 if(c.mode===6){
  vector(0x9010,[4,2,3,0]);p(SELF+0x80,0x9100);b.writeFloatLE(c.ownRadius??1,0x9110);
  b.writeFloatLE(c.queryTimer??.5,AI+0x1cc);b.writeFloatLE(c.stateTimer??.5,AI+0x90);b.writeFloatLE(c.followFlag??0,SELF+0x4d4);b.writeFloatLE(c.stopFlag??0,SELF+0x4d0);
  b[SELF+0x59d]=Number(c.pathReady!==false);b.writeFloatLE(c.pathDistance??1,SELF+0x590);vector(SELF+0x570,c.pathTarget??[20,0,20,0]);b.writeFloatLE(c.angle??0,SELF+0xd0);
  p(0xa000+0x220,0xc800);p(0xa000+0x398,0xc900);p(0xa000+0x418,0xcb00);p(AI+0x1d0+0x1d0,0xca00);w(AI+0x1d0+0x1bc,0);w(AI+0x1d0+0x1b8,0);
  w(0x1f208,c.flockPositions?.length??0);w(0x1f274,c.frames??1);b.fill(0,0x1e000,0x1e100);
  (c.flockPositions??[]).forEach((position,i)=>{const body=0x13000+i*0x400;p(0x1e000+i*8,body);b[body+0xe0]=1;vector(body+16,position);vector(body+80,c.flockVelocities?.[i]??[1,0,0,0]);b.writeFloatLE(.5,body+96);b.writeFloatLE(1,body+104);});
  b.writeFloatLE(.3,0x1f250);b.writeFloatLE(.6,0x1f254);b.writeFloatLE(.8,0x1f258);b.writeFloatLE(c.atanAngle??.7,0x1f25c);
  p(0x1f260,c.actorLookup===false?0:TARGET+8);p(0x1f268,c.flameLookup===false?0:0x8008);w(0x1f270,c.selectedKind??5);b.writeFloatLE(1,0xa800+36);
 }
 const at=(p:bigint,n:number)=>{const ix=Number(p-BASE);if(!Number.isSafeInteger(ix)||ix<0||ix+n>b.length)throw new Error(`Unmapped crab behavior memory: ${p.toString(16)} + ${n}`);return ix;};
 const m={bytes:(p:bigint,n:number)=>b.subarray(at(p,n),at(p,n)+n),read32:(p:bigint)=>b.readUInt32LE(at(p,4)),read64:(p:bigint)=>b.readBigUInt64LE(at(p,8)),write8:(p:bigint,n:number)=>{b[at(p,1)]=n;},write32:(p:bigint,n:number)=>{b.writeUInt32LE(n>>>0,at(p,4));},write64:(p:bigint,n:bigint)=>{b.writeBigUInt64LE(n,at(p,8));},string:()=>''};return {b,m,base:BASE};
}
export function evaluateCrabBehavior(c:CrabBehaviorCase){
 const {b,m,base}=prepareCrabBehavior(c),trace=Buffer.alloc(CRAB_BEHAVIOR_TRACE_BYTES);let used=0,casts=0,transforms=0,result=0;
 const off=(p:bigint)=>p?Number(p-base)>>>0:0xffffffff,log=(op:number,a=0,b=0,c=0,d=0)=>{for(const n of [op,a,b,c,d,0,0,0]){trace.writeUInt32LE(n>>>0,used*4);used++;}};
 const callback=c.callback??0;
 const probes=new Map((c.arithmetic??[]).map(row=>[`${row[0]}:${row[1]}:${row[2]}`,row[3]])),arithmetic={resolveDualNaN:(op:'add'|'sub'|'mul'|'div',a:number,d:number)=>{const n=probes.get(`${['add','sub','mul','div'].indexOf(op)}:${a>>>0}:${d>>>0}`);if(n===undefined)throw new Error(`Missing independent crab arithmetic probe: ${op}:${a>>>0}:${d>>>0}`);return n;}};
 const cast=(object:bigint,kind:number,reference:bigint|undefined)=>{
  const body=object?c.mode===6&&object>=base+0x13000n&&object<base+0x15000n?object:object-8n:0n,flags=body?m.bytes(body+0xe0n,1)[0]:0;let out=flags&(1<<kind)?body:0n;let current=object;casts++;
  if(callback===1&&kind===2&&casts===1)current=base+BigInt(OTHER+8);
  if(callback===2&&kind===2&&casts===1){m.write32(base+BigInt(SELF+16),bits(99));m.write64(base+BigInt(SELF+0x80),base+0x9100n);}
  if(callback===3&&kind===3)m.write32(base+BigInt(AI+0x50),3);
  if(callback===4&&kind===0&&out)out=base+0x10000n;
  if(callback===5&&kind===0&&casts===1){current=base+BigInt(OTHER+8);out=0n;}
  if(callback===9&&kind===2&&casts===1){m.write32(base+BigInt(AI+0x50),9);m.write64(base+BigInt(AI+8),base+0x9200n);}
  if(callback===7&&kind===2&&casts===1)m.write32(base+BigInt(RECORD),9);
  if(reference!==undefined)m.write64(reference,current);
  log(1,kind,off(object),off(out),off(current));return {object:current,cast:out};
 };
 const motionServices:CreatureMotionStateServices={arithmetic,cast:(object,kind)=>cast(object,kind==='Actor'?0:1,undefined),avatarMotion:(out,avatar)=>{log(2,off(avatar));m.bytes(out,0x5c).set(new Uint8Array(m.bytes(avatar+0x190n,0x5c)));},transform:object=>{log(3,off(object));return new Uint8Array(m.bytes((object?object-8n:base+BigInt(TARGET))+0x100n,64));},scale:object=>{log(4,off(object));return new Uint8Array(m.bytes((object?object-8n:base+BigInt(TARGET))+0x140n,64));},obb:(transform,scale)=>{const d=new DataView(transform.buffer,transform.byteOffset,transform.byteLength),v=new DataView(scale.buffer,scale.byteOffset,scale.byteLength);log(6,d.getUint32(0,true),v.getUint32(0,true));return new Uint8Array(m.bytes(base+0x19000n,64));}};
 // Each original motion reader call uses separate native stack scratch.
 // Keep that scratch outside the caller's arena instead of altering OUT.
 const scratchBase=0x660000000n,scratch=Buffer.alloc(0x2000),sd=new DataView(scratch.buffer,scratch.byteOffset,scratch.byteLength),isScratch=(p:bigint)=>p>=scratchBase&&p<scratchBase+0x2000n;
 const local={...m,bytes:(p:bigint,n:number)=>isScratch(p)?scratch.subarray(Number(p-scratchBase),Number(p-scratchBase)+n):m.bytes(p,n),read32:(p:bigint)=>isScratch(p)?sd.getUint32(Number(p-scratchBase),true):m.read32(p),read64:(p:bigint)=>isScratch(p)?sd.getBigUint64(Number(p-scratchBase),true):m.read64(p),write8:(p:bigint,n:number)=>{if(isScratch(p))scratch[Number(p-scratchBase)]=n;else m.write8(p,n);},write32:(p:bigint,n:number)=>{if(isScratch(p))sd.setUint32(Number(p-scratchBase),n,true);else m.write32(p,n);},write64:(p:bigint,n:bigint)=>{if(isScratch(p))sd.setBigUint64(Number(p-scratchBase),n,true);else m.write64(p,n);}};
 const localMotion={...motionServices,avatarMotion:(out:bigint,avatar:bigint)=>{log(2,off(avatar));local.bytes(out,0x5c).set(new Uint8Array(m.bytes(avatar+0x190n,0x5c)));}};
 const services:CrabBehaviorServices={arithmetic,heightThresholdBits:bits(.9),castCrab:(memory,ref)=>{const result=cast(memory.read64(ref),2,ref>=scratchBase?undefined:ref);if(ref>=scratchBase)memory.write64(ref,result.object);return result.cast;},castMarker:(memory,ref)=>{const result=cast(memory.read64(ref),3,ref>=scratchBase?undefined:ref);if(ref>=scratchBase)memory.write64(ref,result.object);return result.cast;},motionState:object=>{readOriginalCreatureMotionState(local,scratchBase,object,localMotion);return new Uint8Array(local.bytes(scratchBase,0x5c));},transform:marker=>{transforms++;log(5,off(marker));if(callback===6&&transforms===1){m.write32(base+BigInt(AI+0x50),3);m.write32(marker+0x120n,bits(4));}return new Uint8Array(m.bytes(marker+0x100n,64));}};
 if(c.mode===0)result=evaluateOriginalCrabBehavior(m,base+BigInt(AI),base+BigInt(RECORD),services);
 else if(c.mode===1){const out=c.outAlias===undefined?base+BigInt(OUT):base+BigInt(TARGET+c.outAlias),object=m.read64(base+BigInt(RECORD+8));result=off(readOriginalCreatureMotionState(m,out,object,motionServices));}
 else if(c.mode===2)considerOriginalCrabBehavior(m,base+BigInt(AI),base+BigInt(b.readUInt32LE(0x1f018)),base+BigInt(RECORD),{arithmetic,asin:argument=>{log(7,argument);if(callback===8){m.write32(base+BigInt(RECORD),9);m.write64(base+BigInt(RECORD+8),base+BigInt(OTHER+8));m.write32(base+BigInt(RECORD+48),bits(99));}return b.readUInt32LE(0x1f014);},evaluate:(ai,record)=>{const recordAt=scratchBase+0x80n;local.bytes(recordAt,record.length).set(record);return evaluateOriginalCrabBehavior(local,ai,recordAt,services);}});
 else if(c.mode===3)updateOriginalCrabBehaviorMetrics(m,base+BigInt(AI),base+0xa000n,{arithmetic,debugScaleBits:c.debugScale===undefined?undefined:bits(c.debugScale),evaluate:(ai,record)=>{const recordAt=scratchBase+0x80n;local.bytes(recordAt,record.length).set(record);return evaluateOriginalCrabBehavior(local,ai,recordAt,services);}});
 else if(c.mode===5){
  for(let at=0x200;at<0x660;at+=4)scratch.writeUInt32LE(c.stackWord??0,at);
  selectOriginalCrabState(local,base+BigInt(AI),base+0xa000n,scratchBase+0x200n,{arithmetic,
   consider:(ai,best,record)=>considerOriginalCrabBehavior(local,ai,best,record,{arithmetic,asin:argument=>{log(7,argument);return b.readUInt32LE(0x1f014);},evaluate:(ai,record)=>{const at=scratchBase+0x80n;local.bytes(at,record.length).set(record);return evaluateOriginalCrabBehavior(local,ai,at,services);}}),
   cast:(reference,target)=>{const result=cast(local.read64(reference),target==='CrabPointer'?2:target===0x10043ccc0n?3:target===0x10033abb0n?4:0,undefined);local.write64(reference,result.object);return result.cast;},
   actorActive:actor=>{log(11,off(actor));return m.bytes(actor+0xe1n,1)[0];},
   nearestAvatar:(owner,position,a,d,e)=>{log(10,off(owner),local.read32(position),local.read32(position+4n),local.read32(position+8n));trace.writeUInt32LE(a,(used-3)*4);trace.writeUInt32LE(d,(used-2)*4);trace.writeUInt32LE(e,(used-1)*4);return m.read64(base+0x1f240n);}
  });
 }
 else if(c.mode===6){
  for(let frame=0;frame<(c.frames??1);frame++)updateOriginalCrabAi(local,base+BigInt(AI),base+0xa000n,base+0x12000n,base+0x12004n,scratchBase+0x700n,{arithmetic,debugScaleBits:c.debugScale===undefined?undefined:bits(c.debugScale),
   query:(owner,position,out,capacity,filter,radius)=>{log(8,off(owner),local.read32(position),off(out),capacity);trace.writeUInt32LE(off(filter),(used-3)*4);trace.writeUInt32LE(radius,(used-2)*4);local.bytes(out,256).set(m.bytes(base+0x1e000n,256));return 0;},
   select:(ai,game)=>{log(17,off(ai),off(game));m.write32(ai+0x50n,c.selectedKind??5);m.write32(ai+0x90n,bits(.3));},
   evaluate:(ai,record)=>{const at=scratchBase+0x80n;local.bytes(at,record.length).set(record);return evaluateOriginalCrabBehavior(local,ai,at,services);},
   readMotion:(out,object)=>{readOriginalCreatureMotionState(local,out,object,localMotion);},
   sin:argument=>{log(12,argument);return b.readUInt32LE(0x1f250);},sincos:argument=>{log(13,argument);return {sin:b.readUInt32LE(0x1f254),cos:b.readUInt32LE(0x1f258)};},atan2:(x,y)=>{log(14,x,y);return b.readUInt32LE(0x1f25c);},
   actorById:(owner,id)=>{log(15,off(owner),id);return m.read64(base+0x1f260n);},flameById:(owner,id)=>{log(16,off(owner),id);return m.read64(base+0x1f268n);},
   cast:(reference,target)=>{const result=cast(local.read64(reference),target==='Actor'?0:4,undefined);local.write64(reference,result.object);return result.cast;},
   flocking:{arithmetic,query:(owner,position,out,capacity,filter,radius)=>{log(8,off(owner),local.read32(position),off(out),capacity);trace.writeUInt32LE(off(filter),(used-3)*4);trace.writeUInt32LE(radius,(used-2)*4);local.bytes(out,256).set(m.bytes(base+0x1e000n,256));return c.flockPositions?.length??0;},cast:(memory,reference,kind)=>{const result=cast(memory.read64(reference),kind==='Actor'?0:1,undefined);memory.write64(reference,result.object);return result.cast;},avatarMotion:()=>{throw new Error('Unexpected Actor-neighborhood Avatar');},obb:()=>{throw new Error('Unexpected Actor-neighborhood OBB');},fallbackWeightBits:()=>{throw new Error('Unexpected Actor-neighborhood fallback');}}
  });
 }
 else throw new Error('Unknown crab behavior mode');
 const header=Buffer.alloc(8);header.writeUInt32LE(result>>>0);header.writeUInt32LE(used,4);return Buffer.concat([header,trace,b]);
}
export function crabBehaviorCases(){const cases:CrabBehaviorCase[]=[],add=(mode:number,rest:Omit<CrabBehaviorCase,'mode'|'seed'>={})=>cases.push({mode,seed:31+cases.length,...rest});
 for(const kind of [0,1,2,3,4,5,6,7,8,9,10,11,12,0xffffffff])for(const targetType of ['actor','avatar','marker','generic','none'] as const){if(kind===11&&targetType!=='actor')continue;add(0,{kind,targetType});}
 for(const target of [[0,0,0,0],[1,0,0,0],[1,.89999,0,0],[1,.9,0,0],[10,0,0,0],[20,0,0,0],[NaN,0,0,0],[Infinity,0,0,0]])for(const kind of [1,2,4,9,11])add(0,{kind,target});
 for(const ownRadius of [-1,0,1,NaN,Infinity])for(const radius of [0,.5,1,2,NaN])add(0,{kind:2,ownRadius,radius,sameParams:false});
 for(const velocity of [[0,0,0,0],[3,4,0,0],[NaN,0,0,0]])for(const sameParams of [false,true])add(0,{kind:2,velocity,sameParams});
 for(const current of [1,3])for(const markerExtent of [[0,0,1,0],[0,0,1,5],[0,0,10,0]])add(0,{kind:3,targetType:'marker',current,markerExtent});
 for(const ownCount of [0,1,2,3,0xffffffff])for(const sameTarget of [false,true])add(0,{kind:9,current:9,ownCount,sameTarget});
 for(const actorPresent of [false,true])for(const flamePresent of [false,true])add(0,{kind:9,actorPresent,flamePresent,sameTarget:false});
 for(const count of [-1,0,1,2,0x7fffffff])for(const current of [1,11])add(0,{kind:11,count,current,sameTarget:false});
 for(const callback of [1,2,3,4,6,7])for(const kind of [1,2,3,9,11])add(0,{kind,callback,targetType:callback===3||callback===6?'marker':'actor',current:kind===11?11:1});
 // Non-Crab targets with kind 11 require the current target to match the
 // null cast; otherwise the original dereferences a null cast result.
 for(const targetType of ['actor','avatar','marker','generic','none'] as const)add(1,{targetType});
 for(const outAlias of [0,16,32,48])add(1,{outAlias});for(const callback of [4,5])add(1,{callback});
 for(const kind of [0,1,2,3,4,5,6,7,8,9,10,11,12])add(2,{kind});
 for(const kind of [1,2,3,4,9,11])for(const duration of [0,-0,-1,.5,2,4,8,NaN,Infinity])add(2,{kind,duration});
 for(const stateScore of [-1,0,.3,1,2,NaN])for(const weight of [0,1,-1,NaN])add(2,{kind:5,stateScore,weight});
 for(const period of [0,-1,1,Infinity,NaN])add(2,{kind:5,period});
 for(const bestScore of [0,1,2,NaN,Infinity])for(const weight of [0,1])add(2,{kind:5,bestScore,weight});
 for(const aiSeed of [0,1,0x7fffffff,0xffffffff])add(2,{kind:5,aiSeed});
 for(const bestAlias of [0,16,32])add(2,{kind:5,bestAlias});
 for(const callback of [1,2,3,4,6,7,8])add(2,{kind:callback===3||callback===6?3:2,callback,targetType:callback===3||callback===6?'marker':'actor'});
 for(const current of [0,1,2,3,4,5,6,7,8,9,10,11,12])add(3,{current,kind:current});
 for(const delta of [0,-1,1e-5,.1,1,NaN,Infinity])for(const current of [0,1,10,11])add(3,{delta,current});
 for(const period of [0,-1,1e-6,.5,NaN,Infinity])for(const recovery of [0,-1,4,NaN])add(3,{current:5,period,recovery});
 for(const stateScore of [-1,0,.5,1,2,NaN])add(3,{current:5,stateScore});
 for(const debugScale of [0,-1,.5,NaN])add(3,{current:2,debugScale});
 for(const callback of [1,2,3,4,6,7,9])add(3,{current:callback===3||callback===6?3:2,callback,targetType:callback===3||callback===6?'marker':'actor'});
 for(const current of [0,1,2,3,4,5,6,7,8,9,10,11,12])add(5,{current});
 for(const neighbors of [['actor'],['flame'],['marker'],['crab'],['generic'],['self'],['marker','actor','flame','crab'],['crab','flame','actor','marker']] as CrabBehaviorCase['neighbors'][])for(const current of [5,9,11])add(5,{current,neighbors});
 for(const actorActive of [false,true])for(const flameEnabled of [false,true])for(const flameLit of [false,true])add(5,{neighbors:['actor','flame'],actorActive,flameEnabled,flameLit});
 for(const crabState of [0,9,10,11])add(5,{neighbors:['crab'],crabState});
 for(const size of [0,1,15,16,17,31,32])add(5,{current:9,neighbors:['actor','flame'],actorIds:Array.from({length:size},(_,i)=>i%3?7:8),flameIds:Array.from({length:32-size},(_,i)=>i%2?7:8)});
 for(const stackWord of [0,0x3f800000,0x80000000,0x7fc00000])for(const current of [5,9,11])add(5,{current,neighbors:['marker','actor','flame','crab'],stackWord});
 for(const preferred of [1,3,4,5,6,7,8,9,11])add(5,{neighbors:['marker','actor','flame','crab'],stateWeights:Array.from({length:12},(_,kind)=>kind===preferred?100:0)});
 for(const avatarPresent of [false,true])for(const weight of [0,-1,NaN])add(5,{avatarPresent,weight});
 for(const target of [[0,0,0,0],[100,0,0,0],[1,2,3,4],[NaN,0,0,0]])add(5,{neighbors:['actor','flame','marker','crab'],target});
 for(const current of [0,1,2,3,4,5,6,7,8,9,10,11,12])add(6,{current});
 for(const current of [1,2,4,6,8,9,11])for(const target of [[0,0,0,0],[3,2,1,0],[100,0,0,0]])add(6,{current,target});
 for(const queryTimer of [0,-1,.5,NaN])for(const stateTimer of [0,-1,.5,NaN])add(6,{current:5,queryTimer,stateTimer});
 for(const selectedKind of [1,2,3,4,5,6,7,8,9,10,11])add(6,{current:5,stateTimer:0,selectedKind});
 for(const current of [1,6,10,11])for(const followFlag of [0,1])for(const stopFlag of [0,1])add(6,{current,followFlag,stopFlag});
 for(const actorLookup of [false,true])for(const flameLookup of [false,true])add(6,{current:9,actorLookup,flameLookup});
 for(const current of [1,4,6])for(const pathDistance of [-1,.5,1,1.9,2,3])add(6,{current,pathReady:false,pathDistance});
 for(const atanAngle of [-100,-Math.PI,-1,0,1,Math.PI,100])add(6,{current:6,atanAngle});
 for(const delta of [0,-1,.1,1,NaN,Infinity])add(6,{current:6,delta});
 for(const current of [1,2,4,5,6,8,9,11])for(const flockPositions of [[[1,0,0,0]],[[1,0,0,0],[-2,0,0,0]],[[.2,0,0,0],[.5,0,0,0]]])add(6,{current,flockPositions});
 for(const frames of [2,8,9])add(6,{current:6,flockPositions:[[1,0,0,0]],frames});
 return cases.filter(c=>!(c.kind===11&&c.targetType==='marker'));
}
