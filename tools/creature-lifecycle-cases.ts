import {loadOriginalFishV2,unloadOriginalFishV2,getOriginalFishV2Transform,type FishLoadServices} from '../src/core/fish-load-runtime';
import {alertOriginalDarkCreature,returnOriginalDarkCreature,originalDarkCreatureRailStateServices,originalDarkCreatureMotionStateServices,type DarkCreatureStateServices} from '../src/core/dark-creature-state-runtime';
import {assignOriginalCrabAuthority,updateOriginalCrabBarn,OriginalCrabAuthorityDivideFailure} from '../src/core/crab-barn-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import type {DarkCreatureRailServices} from '../src/core/dark-creature-rail-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from '../src/core/object-numeric-runtime';

export type CreatureLifecycleMode='fish-load'|'fish-unload'|'dark-alert'|'dark-return'|'crab-authority'|'crab-barn-update'|'fish-transform';
export const CREATURE_LIFECYCLE_MODES:CreatureLifecycleMode[]=['fish-load','fish-unload','dark-alert','dark-return','crab-authority','crab-barn-update','fish-transform'];
export interface CreatureLifecycleCase {
 label:string;mode:CreatureLifecycleMode;seed?:number;mutation?:number;steps?:number;profile?:number;animation?:boolean;light?:boolean;missingMesh?:boolean;missingClone?:boolean;
 awake?:number;enabled?:number;cooldown?:number;alert?:number;detect?:number;state?:number;visible?:number;time?:number;delta?:number;direction?:boolean;playerCount?:number;crabCount?:number;owners?:number[];stream?:number;invalidId?:number;nativeSeek?:boolean;transform?:boolean;outputOffset?:number;
}
const base=0x440000000n,p=base+0x1000n,game=base+0x3000n;
export function creatureLifecycleCases():CreatureLifecycleCase[]{
 const cases:CreatureLifecycleCase[]=[];
 const add=(mode:CreatureLifecycleMode,label:string,c:Partial<CreatureLifecycleCase>={})=>cases.push({mode,label:mode+' '+label,...c});
 for(const seed of [0,19,43])for(const animation of [false,true])for(const light of [false,true])for(const profile of [0,1,2])add('fish-load','basis/actions/light '+[seed,animation,light,profile],{seed,animation,light,profile});
 for(const mutation of [1,2,3,4,5,6])add('fish-load','live callback '+mutation,{mutation});
 add('fish-load','missing mesh assertion',{missingMesh:true});add('fish-load','clone assertion',{missingClone:true});add('fish-load','reload keeps unrelated bytes',{steps:2});
 for(const seed of [0,19])for(const light of [false,true])for(const mutation of [0,1])add('fish-unload','release/repeat '+[seed,light,mutation],{seed,light,mutation,steps:2});
 for(const profile of [0,1,2])for(const outputOffset of [0x9c00,0x1120,0x6120])for(const steps of [1,2])add('fish-transform','scale/model/alias '+[profile,outputOffset,steps],{profile,outputOffset,steps});
 for(const profile of [0,1,2])for(const animation of [false,true])add('fish-load','transform composed '+[profile,animation],{profile,animation,transform:true});
 for(const awake of [0,1])for(const enabled of [0,1])for(const cooldown of [0,1])for(const state of [0,2,3,4])add('dark-alert','gates '+[awake,enabled,cooldown,state],{awake,enabled,cooldown,state});
 for(const time of [0,.25,1,2])for(const alert of [0,1])for(const direction of [false,true])add('dark-alert','rail expiry '+[time,alert,direction],{time,alert,direction,cooldown:1,steps:3});
 for(const mutation of [7,9,10,11])for(const alert of [0,1])add('dark-alert','callback transition '+[mutation,alert],{mutation,alert,cooldown:mutation===7?1:0,time:2,steps:2});
 for(const visible of [0,1])for(const detect of [0,1,255])add('dark-alert','detector '+[visible,detect],{visible,detect,mutation:9});
 for(const profile of [0,1,2])for(const time of [0,.25,.332,1])for(const delta of [0,.125,-.25])add('dark-return','force/timer '+[profile,time,delta],{profile,time,delta,direction:true});
 for(const mutation of [7,8])for(const steps of [1,3])add('dark-return','callback/repeated '+[mutation,steps],{mutation,steps,direction:true});
 for(const profile of [0,1,2])for(const time of [0,.25,.332,1])for(const steps of [1,3])add('dark-return','actual motion seek '+[profile,time,steps],{profile,time,steps,nativeSeek:true,direction:true});
 for(const crabCount of [0,1,4,16])for(const playerCount of [0,1,3,5])for(const profile of [0,1,2])add('crab-authority','round robin '+[crabCount,playerCount,profile],{crabCount,playerCount,profile,steps:2});
 add('crab-authority','alternative invalid sentinel',{invalidId:17,crabCount:4,owners:[17,0xffffffff,23,17],playerCount:3});
 for(const stream of [0,1,2])for(const mutation of [0,12,13])for(const steps of [1,3])add('crab-barn-update','stream/history '+[stream,mutation,steps],{stream,mutation,steps});
 return cases;
}
export function prepareCreatureLifecycle(c:CreatureLifecycleCase){
 const b=Buffer.alloc(0x20000),v=new DataView(b.buffer,b.byteOffset,b.byteLength);let rng=c.seed??37;
 for(let i=0;i<b.length;i++){rng=(Math.imul(rng,1664525)+1013904223)>>>0;b[i]=rng>>>24;}
 const m={string:()=>{throw new Error('Lifecycle oracle consumes no arena strings');},bytes:(p:bigint,n:number)=>{const at=Number(p-base);if(at<0||at+n>b.length)throw new Error('Creature lifecycle arena address '+p.toString(16));return b.subarray(at,at+n);},read32:(p:bigint)=>v.getUint32(Number(p-base),true),read64:(p:bigint)=>v.getBigUint64(Number(p-base),true),write32:(p:bigint,n:number)=>v.setUint32(Number(p-base),n,true),write64:(p:bigint,n:bigint)=>v.setBigUint64(Number(p-base),n,true),write8:(p:bigint,n:number)=>{b[Number(p-base)]=n;}};
 const ptr=(at:number,to:number)=>m.write64(base+BigInt(at),base+BigInt(to)),u32=(at:number,n:number)=>v.setUint32(at,n>>>0,true),float=(at:number,n:number)=>v.setFloat32(at,n,true),floats=(at:number,ns:number[])=>ns.forEach((n,i)=>float(at+i*4,n));
 ptr(0x1078,0x4000);ptr(0x4008,0x5000);ptr(0x4108,0x5100);ptr(0x5000,0x9100);ptr(0x5100,0x9100);u32(0x9118,0);u32(0x911c,0);ptr(0x5228,0xa000);ptr(0x5328,0xa100);
 for(const [at,to] of [[0x3138,0xa000],[0x3220,0xa100],[0x3398,0xa200],[0x35a8,0xa100],[0x33f0,0xa200]])ptr(at,to);
 for(const at of [0x4000,0x4100]){float(at+16,2.5+(at===0x4100?1:0));float(at+20,4);b[at+32]=Number(c.light??true);}
 if(c.missingMesh)m.write64(base+0x4008n,0n);
 for(const at of [0x6068,0x6168])m.write64(base+BigInt(at),c.animation===false?0n:base+0x7000n+(at===0x6168?0x100n:0n));
 const profile=c.profile??0;
 const saved=profile===1?[[0,0,0,0],[0,1e-7,0,0],[0,0,0,1]]:profile===2?[[3,4,0,2],[0,-2,3,0],[1,0,4,0]]:[[2,0,0,0],[0,3,0,0],[0,0,4,0]];
 saved.forEach((ns,i)=>floats(0x1080+i*16,ns));floats(0x10b0,[7,8,9,1]);floats(0x9000,[1,0,0,0,0,1,0,0,0,0,1,0]);
 for(let i=0;i<3;i++)floats(0x9200+i*64,[1+i,0,0,0,0,2+i,0,0,0,0,3+i,0,9,8,7,1]);
 floats(0x9500,[2,-3,4,0]);floats(0x9600,[9,-4,7,1]);floats(0x9800,[3,4,5,0,4,5,6,0,5,6,7,0]);floats(0x9900,[6,3,11,1,4,9,3,1]);
 m.write64(p+0x158n,(c.light??true)?base+0x8000n:0n);
 u32(0x1f000,c.mutation??0);u32(0x1f004,Number(c.missingClone??false));u32(0x1f008,c.detect??1);u32(0x1f00c,c.stream??0);[0xffffffff,3,5,7].forEach((n,i)=>u32(0x1f010+i*4,n));float(0x1f024,c.delta??.125);u32(0x1f028,c.steps??1);u32(0x1f02c,c.playerCount??3);float(0x1f030,.25);float(0x1f034,.5);u32(0x1f038,c.invalidId??0xffffffff);
 u32(0x1f03c,Number(c.nativeSeek??false));u32(0x1f040,Number(c.transform??false));u32(0x1f044,c.outputOffset??0x9c00);
 for(const at of [0x6120,0x6220])floats(at,[1,2,3,0,4,5,6,0,7,8,9,0,10,11,12,1]);
 if(c.mode==='fish-transform'){ptr(0x1110,0x6000);floats(0x1120,profile===0?[2,3,4,0]:profile===1?[0,0,0,0]:[-2,.5,4,1]);}
 if(c.mode.startsWith('dark-')){
  ptr(0x1050,0x4000);ptr(0x4010,0x5000);ptr(0x4018,0x5100);float(0x4008,1);b[0x4005]=Number(c.direction??false);ptr(0x1208,0x9a00);
  floats(0x1060,[5,6,7,1]);floats(0x10a0,profile===1?[0,0,0,0]:profile===2?[0,-2,0,0]:[2,-3,4,0]);floats(0x10c0,[1,2,3,0]);float(0x10b4,4);float(0x1178,c.time??0);float(0x117c,c.time??0);float(0x11d0,8);
  b[0x12c3]=c.awake??1;b[0x12c4]=c.enabled??1;b[0x12c5]=c.cooldown??0;b[0x12d0]=c.alert??0;b[0x11d4]=c.visible??1;u32(0x12e0,c.state??0);
 }
 if(c.mode==='crab-authority'){
  const count=c.crabCount??4,invalid=c.invalidId??0xffffffff;u32(0x1410,count);for(let i=0;i<count;i++){const at=0x10000+i*0x800;ptr(0x1010+i*8,at);u32(at+0x500,c.owners?.[i]??(profile===0?invalid:profile===1?10+i:i%2?10+i:invalid));}
  [101,202,303,404,505].forEach((n,i)=>u32(0x9000+i*4,n));
 }
 if(c.mode==='crab-barn-update'){
  u32(0x1410,4);u32(0x1514,5);u32(0x5000,c.stream===2?1:0);ptr(0x3178,0x4000);ptr(0x4020,0x7000);u32(0xed18,123);
 }
 return {b,m,ptr,u32};
}
export function evaluateCreatureLifecycle(c:CreatureLifecycleCase){
 const {b,m,ptr,u32}=prepareCreatureLifecycle(c),calls:Buffer[]=[];let meshes=0,actions=0,loops=0,samples=0,status=0,line=0,severity=0;
 const mutation=c.mutation??0,record=(kind:number,x=0n,y=0n,z=0n,w=0n)=>{const row=Buffer.alloc(128);[BigInt(kind),x,y,z,w].forEach((n,i)=>row.writeBigUInt64LE(n,i*8));calls.push(row);return row;};
 const fish:FishLoadServices={
  identityBasis:m.bytes(base+0x9000n,48),initializeSteering:(state,world,neighbors,scene)=>{record(1,state,world,neighbors,scene).set(m.bytes(p+16n,64),48);m.bytes(state,64).set(m.bytes(base+0x9700n,64));if(mutation===1){ptr(0x1078,0x4100);ptr(0x35a8,0xa200);}},
  cloneModel:(owner,source)=>{const model=c.missingClone?0n:base+0x6000n;record(2,owner,source,model);if(mutation===2){ptr(0x1078,0x4100);m.bytes(p+0x80n,16).set(m.bytes(base+0x9800n,16));}return model;},
  meshTransform:mesh=>{const transform=Uint8Array.from(m.bytes(base+0x9200n+BigInt(meshes*64),64));record(3,mesh,BigInt(meshes)).set(transform,48);if(mutation===3){ptr(0x1078,meshes%2?0x4000:0x4100);m.bytes(p+0x80n+BigInt(meshes*16),16).set(m.bytes(base+0x9800n+BigInt(meshes*16),16));}meshes++;return transform;},
  playNamed:(animation,_name,speed)=>{const result=m.read32(base+0x1f010n+BigInt(actions*4));record(4,animation,BigInt(actions),BigInt(speed),BigInt(result));if(mutation===4){ptr(0x1110,0x6100);ptr(0x1078,0x4100);if(actions===3)u32(0x1130,123);}actions++;return result|0;},
  loop:(animation,index)=>{record(5,animation,BigInt(index>>>0));if(mutation===5&&!loops){u32(0x1130,234);u32(0x1138,345);u32(0x113c,456);ptr(0x33f0,0xa300);}loops++;},
  createLight:owner=>{record(6,owner,base+0x8000n);if(mutation===6)ptr(0x1158,0x8100);return base+0x8000n;}
 };
 const stateServices:Omit<DarkCreatureStateServices,'switchRail'>={
  seek:(position,target,speed)=>{const row=record(11,position,BigInt(speed));row.set(target,48);row.set(m.bytes(position,16),64);row.set(m.bytes(base+0x9500n,16),80);if(mutation===8){m.bytes(p+0xc0n,16).set(m.bytes(base+0x9800n,16));u32(0x1178,m.read32(base+0x1f034n));}return Uint8Array.from(m.bytes(base+0x9500n,16));},
  detect:(creature,result,target,radius,world)=>{const row=record(12,creature,result,target,BigInt(radius));world.forEach((n,i)=>row.writeBigUInt64LE(n,48+i*8));if(mutation===9){m.write8(p+0x2d0n,1);ptr(0x1208,0x9a00);m.bytes(p+0xa0n,16).set(m.bytes(base+0x9800n,16));}if(mutation===10)m.write8(p+0x2d0n,0);return c.detect??1;},
  worldPosition:transform=>{record(13,transform).set(m.bytes(base+0x9600n,16),48);if(mutation===11)m.bytes(p+0xa0n,16).set(m.bytes(base+0x9800n,16));return Uint8Array.from(m.bytes(base+0x9600n,16));}
 };
 const railServices:DarkCreatureRailServices={
  nearestTime:(rail,position)=>{record(8,rail).set(position,48);if(mutation===7){u32(0x12e0,2);m.write8(p+0x2d0n,1);}return m.read32(base+0x1f030n);},
  remainder:(x,y)=>{const result=bits(value(x)%value(y));record(9,BigInt(x),BigInt(y),BigInt(result));return result;},
  sample:(rail,time)=>{const result=Uint8Array.from(m.bytes(base+0x9900n+BigInt((samples++%2)*16),16));record(10,rail,BigInt(time)).set(result,48);return result;}
 };
 const dark=c.nativeSeek?originalDarkCreatureMotionStateServices(m,stateServices,railServices):originalDarkCreatureRailStateServices(m,stateServices,railServices);
 const networkChanges=()=>{if(mutation===13){m.bytes(p+0x414n,128).set(m.bytes(base+0x9b00n,128));u32(0x1514,8);}};
 try{for(let step=0;step<(c.steps??1);step++){
  if(c.mode==='fish-load'){meshes=actions=loops=0;loadOriginalFishV2(m,p,game,fish);if(c.transform)getOriginalFishV2Transform(m,p,m.bytes(base+BigInt(c.outputOffset??0x9c00),64));}
  if(c.mode==='fish-transform')getOriginalFishV2Transform(m,p,m.bytes(base+BigInt(c.outputOffset??0x9c00),64));
  if(c.mode==='fish-unload')unloadOriginalFishV2(m,p,game,{releaseLight:(owner,light)=>{record(7,owner,light).set(m.bytes(light+0x50n,16),48);if(mutation===1){ptr(0x1158,0x8100);ptr(0x33f0,0xa300);}}});
  if(c.mode==='dark-alert')alertOriginalDarkCreature(m,p,m.read32(base+0x1f024n),[base+0xa000n,base+0xa100n,base+0xa200n,base+0xa300n],dark);
  if(c.mode==='dark-return')returnOriginalDarkCreature(m,p,m.read32(base+0x1f024n),dark);
  if(c.mode==='crab-authority')assignOriginalCrabAuthority(m,p,base+0x9000n,c.playerCount??3,c.invalidId??0xffffffff);
  if(c.mode==='crab-barn-update')updateOriginalCrabBarn(m,p,game,base+0xa000n,{
   findStream:owner=>{const stream=c.stream?base+0x5000n:0n;record(14,owner,stream);if(mutation===12){u32(0x1410,3);u32(0xed18,987);}return stream;},
   receive:(barn,stream,game)=>{record(15,barn,stream,game);networkChanges();},
   send:(stream,game,crabs,count,player,delta)=>{const row=record(16,stream,game,crabs,BigInt(count));row.writeUInt32LE(player,48);row.writeUInt32LE(delta,52);networkChanges();}
  });
 }}catch(e){if(e instanceof NativeObjectFoundationFailure){status=1;line=e.line;severity=e.severity;}else if(e instanceof OriginalCrabAuthorityDivideFailure)status=2;else throw e;}
 const header=Buffer.alloc(16);[status,line,severity,calls.length].forEach((n,i)=>header.writeUInt32LE(n,i*4));return Buffer.concat([header,b,...calls]);
}
