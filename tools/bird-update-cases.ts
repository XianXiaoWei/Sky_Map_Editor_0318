import type {BirdFollowChainInput} from './bird-follow-chain-cases';
import type {BirdFollowServices} from '../src/core/bird-follow-runtime';
import {updateOriginalBirdV2,type BirdUpdateGlobals,type BirdUpdateServices} from '../src/core/bird-update-runtime';
import type {ModelBakeMemory} from '../src/core/model-baked-runtime';
import {NativeObjectFoundationFailure} from '../src/core/object-foundation-runtime';
import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';
import {originalBirdMotionUpdateServices} from '../src/core/bird-motion-runtime';
import {calculateOriginalBirdAcceleration} from '../src/core/bird-acceleration-runtime';
import type {BirdAccelerationServices} from '../src/core/bird-acceleration-runtime';
import type {BirdForceCaseInput} from './bird-force-cases';
import type {BirdRailChainInput} from './bird-rail-chain-cases';
import type {BirdRailServices} from '../src/core/bird-rail-runtime';
import {originalBirdForceAccelerationServices,originalBirdAiAccelerationServices,type BirdForceServices} from '../src/core/bird-force-runtime';
import type {CreatureFlockingServices} from '../src/core/creature-flocking-runtime';
import {originalBirdFlightUpdateServices} from '../src/core/bird-flight-runtime';
import {selectOriginalBirdTarget} from '../src/core/bird-target-runtime';
const base=0x440000000n;
export interface BirdUpdateCase extends BirdForceCaseInput,BirdRailChainInput,BirdFollowChainInput {label:string;enabled?:number;target?:boolean;targetEnabled?:number;targetValue?:number;timer?:number;timerBits?:number;valid?:number;resetTimer?:number;random?:number;distance?:number;cull?:boolean;attached?:boolean;kind?:number;counter?:number;index?:number;delta?:number;timeScale?:number;movementDelta?:number;debug?:boolean;debugScale?:number;drawDebug?:boolean;frames?:number;mutation?:number;nanLane?:number;targetChain?:boolean;landTargets?:number;chance?:number;targetCastFailure?:boolean;shrinkTargets?:boolean;landEnabledMask?:number;motionChain?:boolean;motionBank?:number;motionWeight?:number;motionHorizontal?:boolean;motionSuspended?:boolean;motionDeferred?:boolean;motionMutation?:number;motionDirection?:number[];flightChain?:boolean;steeringFlightChain?:boolean;aiTarget?:boolean;targetDistance?:number;flocking?:boolean;flockWeight?:number;rail?:boolean;railDistance?:number;followObject?:number;followResult?:number;radius?:number;steeringMaximum?:number;steeringMutation?:number;velocity?:number[];velocityBits?:number[];acceleration?:number[];drag?:number;maximumSpeed?:number;flightWeight?:number;flightWeightBits?:number;flightSuspended?:boolean;collisionSteps?:number;collisionVelocity?:number[];avoidance?:number;arrival?:boolean;arrivalPoint?:number[];arrivalTimer?:number;arrivalTimerBits?:number;neighbors?:number;flightMutation?:number;}
export function birdUpdateCases(){
 const out:BirdUpdateCase[]=[];const add=(label:string,c:Omit<BirdUpdateCase,'label'>)=>out.push({label,...c});
 for(const enabled of [0,1])for(const target of [false,true])for(const targetEnabled of [0,1])for(const targetValue of [.5,.5001,1])add('enabled / target '+[enabled,target,targetEnabled,targetValue],{enabled,target,targetEnabled,targetValue});
 for(const timer of [-1,0,.0001,.2])for(const valid of [0,1])add('target validation '+[timer,valid],{timer,valid});
 add('unordered target timer',{timerBits:0x7fc12345});
 for(const distance of [0,24.9,25,31.9,32,40])for(const counter of [0,8,9])for(const attached of [false,true])add('camera / attachment '+[distance,counter,attached],{distance,counter,attached,cull:true,kind:4});
 for(const kind of [0,1,2,3,4,0xffffffff])add('distance-cull kind '+kind,{kind,cull:true,distance:40});
 for(const delta of [0,1e-6,1/60,1,2])for(const debug of [false,true])add('clock '+[delta,debug],{delta,debug,debugScale:2,timeScale:.7,movementDelta:.031});
 for(const mutation of [1,2,3,4])add('callback changes live fields '+mutation,{mutation,target:true,targetEnabled:0,valid:0,timer:-1,random:0});
 for(const frames of [2,8,10])add('consecutive native frames '+frames,{frames,cull:true,distance:40,drawDebug:true});
 for(const counter of [0xffffffff,0xfffffffe])add('counter overflow '+counter,{counter,cull:true,distance:40,index:3});
 for(const nanLane of [0,3,4,7,8,11,12,15])add('transform NaN lane '+nanLane,{nanLane});
 return out;
}
export function prepareBirdUpdate(c:BirdUpdateCase){
 const b=Buffer.alloc(0x60000),at=(p:bigint)=>Number(p-base);
 const m:ModelBakeMemory={bytes:(p,n)=>b.subarray(at(p),at(p)+n),read32:p=>b.readUInt32LE(at(p)),read64:p=>b.readBigUInt64LE(at(p)),write32:(p,n)=>b.writeUInt32LE(n>>>0,at(p)),write64:(p,n)=>b.writeBigUInt64LE(n,at(p)),write8:(p,n)=>{b[at(p)]=n;},string:()=>{throw new Error('Bird update has no string service');}};
 const p=base+0x4000n,game=base+0x1000n,params=base+0x50000n;
 m.write64(p,base+0x5e000n);m.write64(p+0x3a0n,base+0x51000n);m.write64(base+0x51068n,base+0x55000n);m.write64(p+120n,params);
 m.write8(p+0xd0n,c.enabled??1);m.write8(p+0x71n,Number(c.attached??false));m.write32(p+0x74n,c.index??0);m.write64(p+0xf8n,c.target?base+0x54000n:0n);m.write64(base+0x54000n,base+0x5e000n);m.write32(p+0x104n,bits(c.targetValue??1));m.write32(p+0x50cn,c.timerBits??bits(c.timer??.2));
 for(const param of [params,base+0x52000n]){m.write8(param+0x3dn,Number(c.cull??false));m.write32(param+48n,c.kind??4);m.write32(param+24n,bits(2));}
 for(const offset of [0x70,0x138,0x280,0x380,0x3b8,0x450,0x3c8,0x4d0])m.write64(game+BigInt(offset),base+0x2000n+BigInt(offset)*16n);
 m.write64(game+0x160n,base+0x2000n);m.write32(base+0x2014n,bits(c.delta??1/60));m.write32(base+0x2020n,bits(c.timeScale??1));m.write32(base+0x2028n,bits(c.movementDelta??1/60));
 [c.distance??0,0,0,1].forEach((n,i)=>m.write32(p+16n+BigInt(i*4),bits(n)));[0,0,0,1].forEach((n,i)=>b.writeFloatLE(n,0x30000+i*4));
 [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1].forEach((n,i)=>b.writeFloatLE(n,0x30040+i*4));if(c.nanLane!==undefined)b.writeUInt32LE(0x7fc12345,0x30040+c.nanLane*4);
 b[0x5f000]=Number(c.debug??false);b.writeFloatLE(c.debugScale??1,0x5f004);b.writeUInt32LE(c.counter??0,0x5f008);b[0x5f00c]=Number(c.drawDebug??false);
 b.writeUInt32LE(c.random??0x12345678,0x5f01c);b.writeUInt32LE(c.mutation??0,0x5f020);b[0x5f024]=c.targetEnabled??1;b[0x5f025]=c.valid??1;b.writeFloatLE(c.resetTimer??.3,0x5f028);b.writeFloatLE(.15,0x5f02c);b.writeUInt32LE(c.frames??1,0x5f030);
 if(c.targetChain){
  m.write64(p+0xe8n,base+0x56000n);m.write64(base+0x56018n,c.landTargets===undefined?0n:base+0x57000n);m.write32(base+0x56084n,bits(c.chance??1));m.write32(base+0x57010n,c.landTargets??0);m.write64(base+0x57008n,base+0x57100n);
  for(let i=0;i<(c.landTargets??0);i++){const marker=base+0x58000n+BigInt(i*128);m.write64(base+0x57100n+BigInt(i*8),marker+8n);m.write64(marker,base+0x5e200n);m.write8(marker+12n,((c.landEnabledMask??0xffff)>>>i)&1);for(let j=0;j<16;j++)m.write32(marker+16n+BigInt(j*4),bits(j===15?1:j===12?i*3+1:j===13?i+2:j===14?i+3:j%5===0?1:0));}
  b[0x5f035]=Number(!!c.targetCastFailure);b[0x5f036]=Number(!!c.shrinkTargets);
 }
 if(c.flightChain){
  m.write64(p+0xe8n,base+0x56000n);m.write8(p+0x164n,Number(!!c.flightSuspended));m.write32(p+0x104n,c.flightWeightBits??bits(c.flightWeight??0));m.write8(p+0x128n,Number(!!c.arrival));
  m.write32(base+0x56068n,bits(c.avoidance??0));m.write32(params+28n,bits(c.maximumSpeed??5));m.write32(params+36n,bits(c.drag??0));
  (c.velocityBits??(c.velocity??[1,0,2,0]).map(bits)).forEach((n,i)=>m.write32(p+80n+BigInt(i*4),n));
  (c.arrivalPoint??[1,0,0,1]).forEach((n,i)=>m.write32(p+0x110n+BigInt(i*4),bits(n)));
  m.write32(p+0x510n,c.arrivalTimerBits??bits(c.arrivalTimer??0));
  (c.acceleration??[.3,.2,-.1,0]).forEach((n,i)=>b.writeFloatLE(n,0x5f200+i*4));
  (c.collisionVelocity??[.2,.5,.8,0]).forEach((n,i)=>b.writeFloatLE(n,0x5f210+i*4));
  b.writeUInt32LE(c.collisionSteps??0,0x5f220);b.writeUInt32LE(c.neighbors??0,0x5f224);b.writeUInt32LE(c.flightMutation??0,0x5f228);
 }
 if(c.steeringFlightChain){
  m.write64(base+0x58000n,base+0x5e000n);m.write64(p+0xf0n,p);m.write64(p+0xf8n,c.aiTarget?base+0x58000n:0n);m.write64(p+0x120n,c.rail?base+0x57000n:0n);m.write64(p+0x130n,c.followObject?base+0x58000n:0n);
  m.write64(base+0x56038n,c.followObject===2?base+0x58000n:0n);m.write64(base+0x56028n,c.flocking?base+0x58000n:0n);
  m.write32(params+32n,bits(c.steeringMaximum??10));m.write32(p+96n,bits(c.radius??1));m.write32(p+100n,bits(2));m.write32(p+104n,bits(3));
  [112,64,72,68,76].forEach((n,i)=>m.write32(base+0x56000n+BigInt(n),bits(i+.1)));
  b.writeFloatLE(c.targetDistance??1,0x5f230);b.writeFloatLE(c.railDistance??.5,0x5f234);b.writeUInt32LE(c.followResult??1,0x5f238);b.writeFloatLE(c.flockWeight??.3,0x5f23c);b.writeUInt32LE(c.steeringMutation??0,0x5f240);
 }
 if(c.motionChain){
  m.write32(p+0x104n,bits(c.motionWeight??0));m.write8(p+0x101n,Number(!!c.motionHorizontal));m.write8(p+0x164n,Number(!!c.motionSuspended));
  (c.velocity??[1,0,2,0]).forEach((n,i)=>m.write32(p+80n+BigInt(i*4),bits(n)));
  [0,0,-1,0].forEach((n,i)=>m.write32(p+64n+BigInt(i*4),bits(n)));[0,1,0,0].forEach((n,i)=>m.write32(p+48n+BigInt(i*4),bits(n)));
  [2,3,4,1].forEach((n,i)=>m.write32(p+0x3b0n+BigInt(i*4),bits(n)));m.write8(base+0x5132en,Number(!!c.motionDeferred));
  b.writeFloatLE(c.motionBank??15,0x5f250);b.writeUInt32LE(c.motionMutation??0,0x5f254);
  m.write32(p+0x3c0n,13);m.write32(p+0x3c4n,17);
  b[0x5f258]=Number(c.motionDirection!==undefined);(c.motionDirection??[0,0,1,0]).forEach((n,i)=>b.writeFloatLE(n,0x5f260+i*4));
 }
 if(c.forceChain){
  m.write64(base+0x58000n,base+0x5e400n);
  (c.forceTargetPosition??[10,3,4,1]).forEach((n,i)=>b.writeFloatLE(n,0x58040+i*4));
  [1,0,0,0,0,1,0,0,0,0,1,0].forEach((n,i)=>b.writeFloatLE(n,0x58010+i*4));
  for(const at of [0x56000,0x56100]){
   [64,72,68,76,80,84,88,92,96,108,112,116,120,124,128].forEach((offset,i)=>b.writeFloatLE([.5,.7,1,10,.2,1,2,.4,3,.9,.3,.2,.7,.8,.6][i]*(at===0x56100?2:1),at+offset));
   m.write64(base+BigInt(at+32),c.forceAvoidObject?base+0x5d400n:0n);
   if(c.forceWeights)[120,116,112,108,124,128,64].forEach((offset,i)=>b.writeFloatLE(c.forceWeights![i],at+offset));
  }
  b[0x4100]=c.forceLandingAllowed??0;if(c.forceLandingState!==undefined)b[0x4128]=c.forceLandingState;
  [0,0,1,0].forEach((n,i)=>b.writeFloatLE(n,0x4200+i*4));
  m.write64(base+0x4340n,base+0x5d700n);m.write32(base+0x432cn,c.forceCache??0);m.write32(base+0x4328n,c.forceNeighbors??0);
  for(let i=0;i<32;i++){
   const body=0x48000+i*0x200;
   (c.forceNeighborPosition??[i+1,i+2,0,1]).forEach((n,j)=>b.writeFloatLE(n,body+16+j*4));
   (c.forceNeighborVelocity??[1,0,2,0]).forEach((n,j)=>b.writeFloatLE(n,body+80+j*4));
   b.writeFloatLE(1,body+96);b.writeFloatLE(c.forceNeighborWeight??1,body+104);
   b[body+0xe0]=c.forceNeighborTypes?.[i%(c.forceNeighborTypes.length||1)]==='avatar'?2:1;
   b.copy(b,body+0x190,body+16,body+16+92);
   m.write64(base+0x4228n+BigInt(i*8),base+BigInt(body));m.write64(base+0x5d800n+BigInt(i*8),base+BigInt(body));
  }
  for(let i=0;i<16;i++){
   const body=0x10000+i*0x1000,motion=body+0x100;m.write64(base+0x5d000n+BigInt(i*8),base+BigInt(body));m.write64(base+BigInt(body+24),base+BigInt(motion));b[body+0xe1]=Number(i<(c.forcePlayers??0));b[motion+0xbb0]=c.forcePlayerGuiding??1;
   const position=c.forcePlayerPosition??[2+i*2,3,4,1],velocity=c.forcePlayerVelocity??[1,0,2,0];position.forEach((n,j)=>b.writeFloatLE(n,motion+16+j*4));position.forEach((n,j)=>b.writeFloatLE(n-velocity[j]*(c.delta??1/60),motion+32+j*4));
  }
  [1,0,0,0,0,1,0,0,0,0,1,0].forEach((n,i)=>b.writeFloatLE(n,0x5d500+i*4));[5,6,7,1].forEach((n,i)=>b.writeFloatLE(n,0x5d410+i*4));
  m.write32(base+0x5f280n,c.forceNeighbors??0);m.write32(base+0x5f284n,c.forceMutation??0);b[0x5f288]=Number(c.forceRayHit??false);
  (c.forceRayPosition??[1,2,3,1]).forEach((n,i)=>b.writeFloatLE(n,0x5f290+i*4));(c.forceRayNormal??[0,1,0,0]).forEach((n,i)=>b.writeFloatLE(n,0x5f2a0+i*4));
 }
 if(c.railChain){
  for(const at of [0x56028,0x56128])m.write64(base+BigInt(at),base+0x5b000n);
  m.write64(base+0x5b008n,base+0x5b100n);m.write32(base+0x5b010n,c.railListCount??1);
  const current=c.railListCurrent??-1;m.write64(p+0x120n,current<0?0n:base+0x57000n+BigInt(current*256));
  for(let i=0;i<8;i++){
   const rail=base+0x57000n+BigInt(i*256),cache=base+0x5b200n+BigInt(i*32);m.write64(base+0x5b100n+BigInt(i*8),rail+8n);m.write64(rail+0x90n,cache);m.write32(rail+40n,2);m.write8(rail+44n,c.railListLooped??0);
   (c.railPointStart??[1,0,2,1]).forEach((n,j)=>m.write32(cache+BigInt(j*4),bits(n)));(c.railPointEnd??[2,0,4,1]).forEach((n,j)=>m.write32(cache+16n+BigInt(j*4),bits(n)));
  }
  m.write32(base+0x5f2b0n,c.railCallbackMutation??0);m.write32(base+0x5f2b4n,Number(c.railCastFailure??false));
  (c.railNearestPosition??[3,0,6,1]).forEach((n,i)=>b.writeFloatLE(n,0x5f2c0+i*4));(c.railSamplePosition??[3,1,5,1]).forEach((n,i)=>b.writeFloatLE(n,0x5f2d0+i*4));b.writeFloatLE(c.railArcDistance??4,0x5f2e0);b.writeFloatLE(c.railSampleTime??.6,0x5f2e4);b.fill(0,0x5e900,0x5ea00);
 }
 if(c.followChain){
  m.write64(base+0x53020n,base+0x53100n);m.write64(base+0x533a0n,base+0x53400n);
  (c.followPlayerPosition??[0,0,3,1]).forEach((n,i)=>b.writeFloatLE(n,0x534b0+i*4));
  [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1].forEach((n,i)=>b.writeFloatLE(n,0x5aa00+i*4));
  (c.followProjected??[20,0,0,1]).forEach((n,i)=>b.writeFloatLE(n,0x5aa40+i*4));
  (c.followTargetPosition??[0,0,0,1]).forEach((n,i)=>b.writeFloatLE(n,0x4110+i*4));
  (c.followOldPosition??c.followTargetPosition??[0,0,0,1]).forEach((n,i)=>b.writeFloatLE(n,0x4150+i*4));
  b.writeUInt32LE(c.followState??1,0x412c);b.writeUInt32LE(c.followAttempts??0,0x4160);
  [c.followEmitterTimer??1,c.followCountdown??10,c.followElapsed??0,c.followNearTimer??0].forEach((n,i)=>b.writeFloatLE(n,0x4138+i*4));
 }
 return {b,m};
}
export interface BirdFlightMath {kind:number;input:number;result:number[];}
export function evaluateBirdUpdate(c:BirdUpdateCase,nativeMath?:readonly BirdFlightMath[],nativeArithmetic?:readonly number[][]){
 const {b,m}=prepareBirdUpdate(c),p=base+0x4000n,globals:BirdUpdateGlobals={debugEnabled:!!b[0x5f000],debugScaleBits:b.readUInt32LE(0x5f004),cameraCounter:b.readUInt32LE(0x5f008),drawDebug:!!b[0x5f00c]},calls:Buffer[]=[];
 const record=(kind:number,args:(bigint|number)[]=[],floats:number[]=[])=>{const row=Buffer.alloc(160);row.writeBigUInt64LE(BigInt(kind));args.forEach((v,i)=>row.writeBigUInt64LE(BigInt(v),8+i*8));floats.forEach((v,i)=>row.writeUInt32LE(v>>>0,56+i*4));calls.push(row);return row;};
 const services:BirdUpdateServices={globals,
  setModelEnabled:(model,n)=>{record(1,[model,n]);if(c.mutation===1)m.write8(p+0xd0n,0);},objectEnabled:target=>{record(2,[target]);return b[0x5f024];},random:()=>{const n=b.readUInt32LE(0x5f01c);record(3,[n]);return n;},
  validateTarget:(ai,timer)=>{record(4,[ai,timer]);if(c.mutation===2){globals.debugEnabled=true;globals.debugScaleBits=bits(2);}m.write32(timer,b.readUInt32LE(0x5f028));return b[0x5f025];},requireAvatar:barn=>{record(5,[barn]);return base+0x53000n;},targetLost:(bird,avatar)=>{record(6,[bird,avatar]);if(c.mutation===3)m.write64(p+120n,base+0x52000n);},cameraPosition:camera=>{record(7,[camera]);return b.subarray(0x30000,0x30010);},
  updateAi:(bird,ai,params,position,game,scene,delta)=>{record(8,[bird,ai,params,position,game,scene],[delta]);if(c.mutation===4)m.write64(p+0x3a0n,base+0x51000n);return b.readUInt32LE(0x5f02c);},updateMovement:(bird,ai,anim,position,turn,delta)=>{record(9,[bird,ai,anim,position],[turn,delta]);},transform:bird=>{record(10,[bird]);if(c.motionMutation===1){m.write64(p+0x3a0n,base+0x53000n);m.write32(p+0x3b0n,bits(5));}return b.subarray(0x30040,0x30080);},updateAnimation:(bird,ai,anim)=>{record(11,[bird,ai,anim]);},emitWake:(owner,position,radius,n)=>{record(12,[owner,position,n],[radius]);},
  updateGuide:(bird,ai,position,avatars,barn)=>{record(13,[bird,ai,position,avatars,barn]);},updateAiPost:(ai,motion,timer,avatars,delta)=>{record(14,[ai,timer,avatars],[delta]).set(motion,64);},updateEffects:(bird,anim,position,avatars)=>{record(15,[bird,anim,position,avatars]);},updateWind:bird=>{record(16,[bird]);},updateAttached:(bird,owner,effects,delta)=>{record(17,[bird,owner,effects],[delta]);},updateAttachedTransform:(bird,position)=>{record(18,[bird,position]);},updatePickup:(bird,position,avatars,owner,timer,delta)=>{record(19,[bird,position,avatars,owner,timer],[delta]);},debugDraw:(bird,position)=>{record(20,[bird,position]);}
 };
 if(c.targetChain)services.validateTarget=(ai,timer)=>selectOriginalBirdTarget(m,ai,timer,{random:services.random,castMarker:object=>{record(21,[object]);if(c.shrinkTargets)m.write32(base+0x57010n,0);return c.targetCastFailure?0n:object-8n;},enabled:marker=>{record(22,[marker]);return m.bytes(marker+12n,1)[0];},transform:marker=>{record(23,[marker]);return m.bytes(marker+16n,64).slice();}});
 let mathAt=0,collisionAt=0;
 const probes=new Map((nativeArithmetic??[]).map(row=>[`${row[0]}:${row[1]}:${row[2]}`,row[3]]));
 const arithmetic=c.forceChain?{resolveDualNaN:(op:'add'|'sub'|'mul'|'div',x:number,y:number)=>{const n=probes.get(`${['add','sub','mul','div'].indexOf(op)}:${x>>>0}:${y>>>0}`);if(n===undefined)throw new Error('Bird force requires native dual-NaN probe '+[op,x,y]);return n;}}:undefined;
 const force:BirdForceServices={arithmetic,random:()=>{const n=services.random();if(c.forceMutation===6)m.write64(p+0xe8n,base+0x56100n);return n;},identityBasis:b.subarray(0x5d500,0x5d530),
  targetTransform:target=>{record(46,[target]);if(c.forceMutation===2){m.write64(p+0xe8n,base+0x56100n);m.write32(p+16n,bits(2));}return m.bytes(target+16n,64).slice();},
  raycast:(scene,origin,direction,maximum,options)=>{const row=record(47,[scene,Number(c.forceRayHit??false)],[maximum]);row.set(origin,64);row.set(direction,80);row.writeUInt32LE(options.layer,96);row.writeUInt32LE(options.mask,100);row[104]=options.enabled;row.set(options.reserved,112);row.set(b.subarray(0x5f290,0x5f2a0),128);row.set(b.subarray(0x5f2a0,0x5f2b0),144);if(c.forceMutation===1)m.write8(p+0x128n,1);return {hit:c.forceRayHit??false,position:b.subarray(0x5f290,0x5f2a0).slice(),normal:b.subarray(0x5f2a0,0x5f2b0).slice()};},
  avatarAt:(owner,index)=>{const avatar=m.read64(base+0x5d000n+BigInt(index*8));record(48,[owner,index,avatar]);return avatar;},
  avatarActive:avatar=>{record(49,[avatar,b[Number(avatar-base)+0xe1]]);if(c.forceMutation===5)m.write8(p+0x128n,1);return m.bytes(avatar+0xe1n,1)[0];}
 };
 const flocking:CreatureFlockingServices={arithmetic,
  query:(owner,position,out,capacity,filter,radius)=>{record(42,[owner,position,out,capacity,filter],[radius]);m.bytes(out,256).set(b.subarray(0x5d800,0x5d900));if(c.forceMutation===3)m.write64(p+0xe8n,base+0x56100n);return c.forceNeighbors??0;},
  cast:(memory,reference,kind)=>{const before=memory.read64(reference),tag=kind==='Actor'?0:1,selected=(m.bytes(before+0xe0n,1)[0]&(1<<tag))?before:0n;record(43,[tag,reference,before,selected,before]);if(c.forceMutation===4)m.write32(p+0x328n,1);return selected;},
  avatarMotion:object=>{record(44,[object]);return m.bytes(object+0x190n,92).slice();},
  obb:object=>{record(45,[object]);throw new Error('Bird force fixtures require explicit generic OBB owner');},fallbackWeightBits:()=>{throw new Error('Bird generic flock scratch W requires an explicit caller service');}
 };
 const railMutate=(n:number)=>{if(c.railCallbackMutation!==n)return;if(n===3||n===5)m.write32(p+0x190n,bits(2));if(n===3||n===4)m.write32(p+0x1e4n,bits(5));if(n===4||n===6)m.write32(p+0x1d0n,bits(3));};
 const railServices:BirdRailServices={arithmetic,random:force.random,
  castRail:object=>{record(50,[object]);if(c.railCallbackMutation===1)m.write32(base+0x5b010n,1);if(c.railCallbackMutation===2)m.write64(p+0xe8n,base+0x56100n);return c.railCastFailure?0n:object-8n;},
  nearest:(rail,position)=>{const timeBits=b.readUInt32LE(0x5f234),row=record(51,[rail,timeBits]);row.set(position,64);row.set(b.subarray(0x5f2c0,0x5f2d0),80);railMutate(3);return {timeBits,position:b.subarray(0x5f2c0,0x5f2d0).slice()};},
  distanceAtTime:(rail,time)=>{const n=b.readUInt32LE(0x5f2e0);record(52,[rail,n],[time]);railMutate(4);return n;},
  timeAtDistance:(rail,distance)=>{const n=b.readUInt32LE(0x5f2e4);record(53,[rail,n],[distance]);railMutate(5);return n;},
  sample:(rail,time)=>{record(54,[rail],[time]).set(b.subarray(0x5f2d0,0x5f2e0),64);railMutate(6);return b.subarray(0x5f2d0,0x5f2e0).slice();}
 };
 const follow:BirdFollowServices={arithmetic,requireAvatar:services.requireAvatar,
  worldPosition:transform=>{record(55,[transform]).set(m.bytes(transform+176n,16),64);return m.bytes(transform+176n,16).slice();},
  targetTransform:force.targetTransform,
  targetObb:target=>{record(56,[target]).set(b.subarray(0x5aa00,0x5aa40),64);return b.subarray(0x5aa00,0x5aa40).slice();},
  projectSphereObb:(position,radius,world)=>{const row=record(57,[radius]);row.set(position,64);row.set(world,80);row.set(b.subarray(0x5aa40,0x5aa50),144);return b.subarray(0x5aa40,0x5aa50).slice();},
  random:services.random,
  emitCritters:(owner,bird,kind,texture,flags,enabled,local,scale,time)=>{record(58,[owner,bird,kind,texture,flags],[scale,time,enabled,local]);}
 };
 if(c.flightChain){
  const math=(kind:number,input:number,fallback:()=>number[])=>{if(!nativeMath)return fallback();const row=nativeMath[mathAt++];if(!row||row.kind!==kind||row.input!==input)throw new Error('Bird flight native math input/order differs: '+JSON.stringify({kind,input,row}));return row.result;};
  services.updateAi=originalBirdFlightUpdateServices(m,services,{arithmetic,
   acceleration:(ai,game)=>{if(c.steeringFlightChain){const acceleration:BirdAccelerationServices={arithmetic,
    debugScaleBits:globals.debugEnabled?globals.debugScaleBits:bits(1),
    targetDistance:(ai,scene,motion,speed)=>{record(29,[ai,scene],[speed]).set(m.bytes(motion,92),64);return b.readUInt32LE(0x5f230);},
    updateFlocking:(ai,params,motion,speed,delta)=>{record(30,[ai,params],[speed,delta]).set(m.bytes(motion,92),64);m.write32(ai+36n,b.readUInt32LE(0x5f23c));if(c.steeringMutation===1)m.write64(ai+64n,base+0x57000n);},
    pow:(input,power)=>{const result=math(31,input,()=>[bits(Math.pow(new DataView(new Uint32Array([input]).buffer).getFloat32(0,true),3))])[0];record(31,[input,power,result]);if(c.steeringMutation===2)m.write32(base+0x50020n,bits(1));return result;},
    railDistance:(rail,motion)=>{record(32,[rail]).set(m.bytes(motion,92),64);if(c.steeringMutation===3)m.write64(ai+64n,base+0x59000n);return b.readUInt32LE(0x5f234);},
    followRail:(state,rail,enabled,lookahead,weight,distance)=>{record(33,[state,rail,enabled],[lookahead,weight,distance]);m.bytes(state,16).set(b.subarray(0x5f200,0x5f210));},
    flock:(state,bird,filter,weights)=>{record(34,[state,bird,filter],Array.from(weights));},
    followObject:(ai,params,avatars,critters,motion,delta)=>{record(35,[ai,params,avatars,critters],[delta]).set(m.bytes(motion,92),64);m.bytes(ai+0x90n,16).set(b.subarray(0x5f200,0x5f210));return c.followResult??1;},
    steerTarget:(ai,params,motion,speed)=>{record(36,[ai,params],[speed]).set(m.bytes(motion,92),64);m.bytes(ai+0x90n,16).set(b.subarray(0x5f200,0x5f210));},
    steerGuide:(ai,avatars,motion,delta)=>{record(37,[ai,avatars],[delta]).set(m.bytes(motion,92),64);},
    collision:(position,velocity,lookahead,scene,blocked)=>{const row=record(38,[position,velocity,scene,blocked],[lookahead]);row.set(m.bytes(velocity,16),64);row.set(b.subarray(0x5f210,0x5f220),80);return b.subarray(0x5f210,0x5f220).slice();}
   };const resolved=c.railChain?originalBirdAiAccelerationServices(m,acceleration,force,flocking,railServices,c.followChain?follow:undefined):c.forceChain?originalBirdForceAccelerationServices(m,acceleration,force,flocking):acceleration;return calculateOriginalBirdAcceleration(m,ai,game,base+0x5c000n,resolved);}const v=b.subarray(0x5f200,0x5f210).slice();record(24,[ai,game]).set(v,64);if(c.flightMutation===1)m.write32(base+0x5001cn,bits(1));return v;},
   collision:(position,velocity,lookahead,scene,blocked)=>{const row=record(25,[position,velocity,scene,blocked],[lookahead]);row.set(m.bytes(velocity,16),64);const v=b.subarray(0x5f210,0x5f220).slice(),next=++collisionAt<(c.collisionSteps??0)?1:0;row.set(v,80);row.writeUInt32LE(next,96);if(c.flightMutation===2)m.write32(p+0x104n,bits(1));return {velocity:v,blocked:next};},
   acos:input=>{const result=math(26,input,()=>[bits(Math.acos(new DataView(new Uint32Array([input]).buffer).getFloat32(0,true)))])[0];record(26,[input,result]);return result;},
   sincos:input=>{const value=new DataView(new Uint32Array([input]).buffer).getFloat32(0,true),result=math(27,input,()=>[bits(Math.sin(value)),bits(Math.cos(value))]);record(27,[input,...result]);return {sin:result[0],cos:result[1]};},
   query:(owner,point,capacity,filter,radius)=>{const count=c.neighbors??0,row=record(28,[owner,capacity,filter,count],[radius]);row.set(point,64);return Array.from({length:count},(_,i)=>i===0?p:base+0x59000n);}
  }).updateAi;
 }
 if(c.motionChain){
  services.updateMovement=originalBirdMotionUpdateServices(m,services,{arithmetic,
   turnDirection:(maximum,before,desired)=>{const row=record(39,[maximum]);row.set(before,64);row.set(desired,80);return c.motionDirection?b.subarray(0x5f260,0x5f270).slice():desired;},
   bank:(state,motion,delta,strength,smoothing,limit)=>{record(40,[state,motion],[delta,strength,smoothing,limit]);m.write32(state+48n,b.readUInt32LE(0x5f250));if(c.motionMutation===2)m.write32(p+0x104n,bits(.8));},
   sincos:input=>{const row=nativeMath?.[mathAt++];if(nativeMath&&(!row||row.kind!==27||row.input!==input))throw new Error('Bird motion sincos input/order differs');const v=new DataView(new Uint32Array([input]).buffer).getFloat32(0,true),result=row?.result??[bits(Math.sin(v)),bits(Math.cos(v))];record(27,[input,...result]);return {sin:result[0],cos:result[1]};},
   setAnimationWeight:(animation,index,weight)=>{record(41,[animation,index>>>0],[weight]);if(c.motionMutation===3)m.write32(p+0x3c4n,99);},transform:services.transform
  }).updateMovement;
 }
 let line=0;try{for(let i=0;i<(c.frames??1);i++)updateOriginalBirdV2(m,p,base+0x1000n,services);}catch(e){if(!(e instanceof NativeObjectFoundationFailure))throw e;line=e.line;}
 if(c.steeringFlightChain)b.fill(0,0x5c000,0x5c080);
 if(c.forceChain)b.fill(0,0x5e400,0x5e800);
 if(nativeMath&&mathAt!==nativeMath.length)throw new Error('Bird flight math trace not consumed');
 b.writeUInt32LE(line,0x5f100);b[0x5f104]=Number(globals.debugEnabled);b.writeUInt32LE(globals.debugScaleBits,0x5f108);b.writeUInt32LE(globals.cameraCounter,0x5f10c);b.fill(0,0x5e000,0x5e100);
 if(c.targetChain)b.fill(0,0x5e000,0x5e300);
 const count=Buffer.alloc(4);count.writeUInt32LE(calls.length);return Buffer.concat([b,count,...calls]);
}
