import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {updateOriginalCrabBehaviorMetrics,considerOriginalCrabBehavior,evaluateOriginalCrabBehavior,type CrabMetricServices,type CrabBehaviorServices} from './crab-behavior-runtime';
import {selectOriginalCrabState,type CrabStateServices} from './crab-state-runtime';
import {beginOriginalCreatureSteering,seekOriginalCreatureSteering,endOriginalCreatureSteering} from './creature-steering-runtime';
import {flockOriginalCreatureSteering,type CreatureFlockingServices} from './creature-flocking-runtime';

export interface CrabAiUpdateServices {
 arithmetic?:NatureArithmeticServices;
 debugScaleBits?:number;
 query(owner:bigint,position:bigint,out:bigint,capacity:32,filter:bigint,radiusBits:number):number;
 select(ai:bigint,game:bigint):void;
 evaluate:CrabMetricServices['evaluate'];
 readMotion(out:bigint,object:bigint):void;
 sin(argumentBits:number):number;
 sincos(argumentBits:number):{sin:number;cos:number};
 atan2(yBits:number,xBits:number):number;
 actorById(owner:bigint,id:number):bigint;
 flameById(owner:bigint,id:number):bigint;
 cast(reference:bigint,target:'Actor'|'Flame',source:'Actor'|'Flame'):bigint;
 flocking:CreatureFlockingServices;
}
export interface CrabAutonomousAiServices extends Omit<CrabAiUpdateServices,'select'|'evaluate'> {
 behavior:CrabBehaviorServices;
 state:Omit<CrabStateServices,'consider'|'arithmetic'>;
 asin(argumentBits:number):number;
}

/** Connect the whole state selector, candidate comparator, behavior evaluator
 * and per-frame update. All three scratch regions are private, disjoint and
 * supplied by the caller; saved creature storage and world services are shared.
 * This is the AI chain; Model ownership and outer Crab.Update are separate. */
export function updateOriginalCrabAutonomousAi(m:ModelBakeMemory,ai:bigint,game:bigint,turn:bigint,speed:bigint,stack:{state:bigint;update:bigint;score:bigint},s:CrabAutonomousAiServices){
 const evaluate=(ai:bigint,record:Uint8Array)=>{
  m.bytes(stack.score,record.length).set(record);return evaluateOriginalCrabBehavior(m,ai,stack.score,s.behavior);
 };
 updateOriginalCrabAi(m,ai,game,turn,speed,stack.update,{...s,evaluate,select:(ai,game)=>{
  selectOriginalCrabState(m,ai,game,stack.state,{...s.state,arithmetic:s.arithmetic,consider:(ai,best,record)=>{
   considerOriginalCrabBehavior(m,ai,best,record,{arithmetic:s.arithmetic,asin:s.asin,evaluate});
  }});
 }});
}
const sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));

/** Whole CrabAi.Update 0x10025a880. Updates the original timers, state scores,
 * target and steering accumulator, and outputs turn/speed for Crab.Update.
 * Native neighborhood, metadata, libm and state-selection dependencies stay
 * explicit. The aligned 0x280-byte scratch belongs to this invocation. */
export function updateOriginalCrabAi(m:ModelBakeMemory,ai:bigint,game:bigint,turn:bigint,speedOut:bigint,stack:bigint,s:CrabAiUpdateServices){
 const a=natureArithmetic(s.arithmetic),p=(n:number)=>stack+0x280n-BigInt(n),read=(at:bigint)=>[0,4,8,12].map(n=>m.read32(at+BigInt(n)));
 const store=(at:bigint,v:number[])=>v.forEach((n,i)=>m.write32(at+BigInt(i*4),n));
 const copy=(out:bigint,input:bigint,n:number)=>m.bytes(out,n).set(new Uint8Array(m.bytes(input,n)));
 const sub=(x:number[],y:number[])=>x.map((n,i)=>a.sub(n,y[i]));
 const length=(v:number[])=>{const q=v.map(n=>a.mul(n,n));return sqrt(a.add(q[2],a.add(q[0],q[1])));};
 const normalize=(v:number[])=>{const n=length(v),w=a.mul(v[1],v[1]);return value(n)>value(0x3727c5ac)?v.map((x,i)=>a.div(x,i===3?w:n)):v;};
 const clock=m.read64(game+0x160n),delta=a.min(0x3e883127,a.max(0x38d1b717,a.mul(m.read32(clock+20n),a.mul(s.debugScaleBits??0x3f800000,m.read32(clock+32n)))));
 const self=m.read64(ai+16n);copy(p(0x150),self+16n,0x5c);
 if(value(m.read32(ai+0x1ccn))<=0){
  m.write32(ai+0x1c8n,s.query(m.read64(game+0x220n),p(0x150),ai+0xc8n,32,0x10025f330n,0x41200000));m.write32(ai+0x1ccn,0x3f000000);
 }
 m.write32(ai+0x1ccn,a.sub(m.read32(ai+0x1ccn),delta));
 if(value(m.read32(ai+0x90n))<=0)s.select(ai,game);
 m.write32(ai+0x90n,a.sub(m.read32(ai+0x90n),delta));m.write32(ai+0x80n,a.add(delta,m.read32(ai+0x80n)));
 updateOriginalCrabBehaviorMetrics(m,ai,game,{arithmetic:s.arithmetic,debugScaleBits:s.debugScaleBits,evaluate:s.evaluate});
 let target=read(p(0x150)),params=m.read64(ai+8n),maximum=m.read32(params+20n),kind=m.read32(ai+0x50n);
 const forward=()=>read(p(0x120));
 if(kind===2){
  s.readMotion(p(0x90),m.read64(ai+0x58n));const direction=normalize(sub(read(p(0x150)),read(p(0x90))));
  const now=m.read64(game+0x160n),wave=s.sin(a.add(a.add(m.read32(ai+0x80n),m.read32(ai+0x80n)),m.read32(now+36n)));
  const q=s.sincos(a.mul(a.mul(wave,0x3f400000),0x3f000000)),[x,y,z]=direction,zero=0;
  // Original quaternion product order, including multiplication by zero.
  const cy=a.mul(y,q.cos),xz=a.add(a.mul(x,q.cos),a.mul(z,q.sin)),sy=a.mul(y,zero);
  const u=a.sub(xz,sy),v=a.sub(a.add(a.mul(x,zero),cy),a.mul(z,zero));
  const w=a.sub(a.add(sy,a.mul(z,q.cos)),a.mul(x,q.sin)),t=a.add(a.mul(z,zero),a.add(a.mul(x,zero),a.mul(y,q.sin)));
  const rx=a.add(a.mul(q.sin,w),a.sub(a.add(a.mul(t,zero),a.mul(q.cos,u)),a.mul(v,zero)));
  const ry=a.add(a.sub(a.add(a.mul(q.sin,t),a.mul(q.cos,v)),a.mul(w,zero)),a.mul(u,zero));
  const rz=a.add(a.sub(a.add(a.mul(q.cos,w),a.mul(t,zero)),a.mul(q.sin,u)),a.mul(v,zero));
  target=[rx,ry,rz,0].map((n,i)=>a.add(a.mul(n,i===3?0:0x41200000),read(p(0x150))[i]));
  params=m.read64(ai+8n);maximum=m.read32(params+24n);kind=m.read32(ai+0x50n);
 }else if(kind===4)target=read(ai+48n);
 else if(kind===6)target=read(ai+0x70n);
 else if(kind===8){
  const q=s.sincos(a.mul(delta,0x41200000)),basis=forward().map((n,i)=>a.mul(n,i===3?0:0x41200000));
  const rotated=[a.add(a.mul(q.sin,basis[2]),a.add(a.mul(0,basis[1]),a.mul(q.cos,basis[0]))),a.add(a.mul(0,basis[2]),a.add(a.mul(0,basis[0]),a.mul(0x3f800000,basis[1]))),a.add(a.mul(q.cos,basis[2]),a.add(a.mul(0,basis[1]),a.mul(q.sin^0x80000000,basis[0]))),0];
  target=sub(target,rotated);maximum=a.mul(maximum,0x3f000000);
 }
 if(kind===1){s.readMotion(p(0x90),m.read64(ai+0x58n));target=read(p(0x90));params=m.read64(ai+8n);maximum=m.read32(params+24n);kind=m.read32(ai+0x50n);}
 if(kind===9){
  const reference=p(0x210);m.write64(reference,s.actorById(m.read64(game+0x398n),m.read32(ai+0x60n)));const actor=s.cast(reference,'Actor','Actor');
  m.write64(reference,s.flameById(m.read64(game+0x418n),m.read32(ai+0x60n)));const flame=s.cast(reference,'Flame','Flame');
  target=actor?read(actor+16n):flame?read(flame+0xc0n):forward().map((n,i)=>a.mul(n,i===3?0:0xc1200000));
  params=m.read64(ai+8n);maximum=a.mul(m.read32(params+24n),0x40200000);kind=m.read32(ai+0x50n);
 }
 let crab=m.read64(ai+16n);
 if(kind===11||value(m.read32(crab+0x4d4n))>0){
  s.readMotion(p(0x90),m.read64(ai+0x58n));s.readMotion(p(0x210),m.read64(ai+0x58n));const direction=normalize(sub(read(p(0x210)),read(p(0x150))));
  s.readMotion(p(0x270),m.read64(ai+0x58n));const radius=(a.add(a.mul(0x3f99999a,m.read32(p(0x220))),a.mul(0x3f99999a,m.read32(p(0x100))))^0x80000000)>>>0;
  target=direction.map((n,i)=>a.add(a.mul(n,i===3?0:radius),read(p(0x90))[i]));
  m.write32(ai+0x90n,0x3f800000);params=m.read64(ai+8n);crab=m.read64(ai+16n);
  maximum=a.mul(m.read32(params+24n),value(m.read32(crab+0x4d4n))>0?0:0x3f4ccccd);
 }
 kind=m.read32(ai+0x50n);
 if(kind===10||value(m.read32(crab+0x4d0n))>0){m.write32(ai+0x90n,0x3f800000);target=read(p(0x150));}
 let desired=([3,5,7,10].includes(kind)?0:maximum),scale=a.min(0x3f800000,a.max(0,a.mul(a.add(m.read32(m.read64(crab+0x80n)+16n),0xbf000000),0xc0800000)));
 scale=a.mul(a.add(a.mul(scale,0x3f000000),0x3f000000),0x40a00000);
 if(!m.bytes(crab+0x59dn,1)[0]&&value(length(sub(target,read(p(0x150)))))>value(0x3c23d70a)){
  const fraction=a.min(0x3f800000,a.max(0,a.div(a.add(m.read32(crab+0x590n),0xc0000000),0xbfc00000))),position=read(crab+16n),probe=read(crab+0x570n);
  const diverted=position.map((n,i)=>a.add(n,a.mul(a.sub(probe[i],n),i===3?0:fraction)));
  if(value(length(sub(diverted,position)))>2){target=diverted;desired=a.max(a.mul(0x3fa00000,m.read32(params+24n)),desired);scale=a.mul(scale,0x3fa00000);}
 }
 store(p(0xc0),target);copy(p(0x1b0),crab+16n,0x5c);const state=ai+0x1d0n;
 beginOriginalCreatureSteering(m,state,p(0x1b0),delta,desired);
 seekOriginalCreatureSteering(m,state,p(0xc0),0x3f800000,0x3f800000,s.arithmetic);
 flockOriginalCreatureSteering(m,state,m.read64(ai+16n),0x10025f450n,{weightBits:0x40000000,alignmentBits:0x3f800000,cohesionBits:0x3f800000,separationBits:0x40000000,radiusBits:m.read32(params+16n)},s.flocking);
 endOriginalCreatureSteering(m,p(0x90),state,0,{arithmetic:s.arithmetic,collision:()=>{throw new Error('CrabAi.End passes false avoidance');}});
 const velocity=read(p(0x90)),speed=length(velocity);m.write32(speedOut,speed);let angular=0;
 if(value(speed)>0){
  const angle=a.sub(s.atan2(velocity[0],velocity[2]),m.read32(m.read64(ai+16n)+0xd0n));
  const wrapped=a.sub(angle,a.mul(bits(Math.floor(value(a.div(a.add(angle,0x40490fdb),0x40c90fdb)))),0x40c90fdb));
  angular=a.mul(a.min(0x3f800000,a.max(0xbf800000,wrapped)),scale);
 }
 m.write32(turn,angular);
}
