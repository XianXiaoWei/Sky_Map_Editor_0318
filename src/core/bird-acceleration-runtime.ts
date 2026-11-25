import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {beginOriginalCreatureSteering,endOriginalCreatureSteering,type CreatureSteeringServices} from './creature-steering-runtime';
import {originalBirdFlightUpdateServices,type BirdFlightServices} from './bird-flight-runtime';
import type {BirdUpdateServices} from './bird-update-runtime';

export interface BirdAccelerationServices {
 arithmetic?:NatureArithmeticServices;
 debugScaleBits?:number;
 targetDistance(ai:bigint,scene:bigint,motion:bigint,speedBits:number):number;
 updateFlocking(ai:bigint,params:bigint,motion:bigint,speedBits:number,deltaBits:number):void;
 pow(argumentBits:number,powerBits:number):number;
 railDistance(rail:bigint,motion:bigint):number;
 followRail(state:bigint,rail:bigint,enabled:1,lookaheadBits:number,weightBits:number,distanceBits:number):void;
 flock(state:bigint,bird:bigint,filter:bigint,weights:readonly number[]):void;
 followObject(ai:bigint,params:bigint,avatars:bigint,critters:bigint,motion:bigint,deltaBits:number):number;
 steerTarget(ai:bigint,params:bigint,motion:bigint,speedBits:number):void;
 steerGuide(ai:bigint,avatars:bigint,motion:bigint,deltaBits:number):void;
 collision:CreatureSteeringServices['collision'];
}
const sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
/** Complete 0x1001a0060. The private scratch holds the captured 92-byte
 * motion snapshot across callbacks. It must not overlap original objects. */
export function calculateOriginalBirdAcceleration(m:ModelBakeMemory,ai:bigint,game:bigint,scratch:bigint,s:BirdAccelerationServices):Uint8Array {
 const a=natureArithmetic(s.arithmetic),read=(p:bigint)=>[0,4,8,12].map(n=>m.read32(p+BigInt(n))),length=(v:number[])=>{const q=v.map(n=>a.mul(n,n));return sqrt(a.add(q[2],a.add(q[0],q[1])));};
 m.write8(ai+33n,0);
 // The native delta is calculated before target callbacks and then clamped.
 const clock=m.read64(game+0x160n),rawDelta=a.mul(a.mul(s.debugScaleBits??0x3f800000,m.read32(clock+32n)),m.read32(clock+20n));
 const bird=m.read64(ai+16n);m.bytes(scratch,92).set(m.bytes(bird+16n,92).slice());
 const speed=length(read(scratch+64n));
 const distance=m.read64(ai+24n)?s.targetDistance(ai,m.read64(game+0x138n),scratch,speed):length(read(ai+48n).map((n,i)=>a.sub(n,read(scratch)[i])));
 const delta=a.min(0x3e883127,a.max(0x38d1b717,rawDelta));
 m.write32(ai+40n,m.read32(ai+36n));let weight=0;
 if(m.bytes(ai+72n,1)[0]){
  const radius=m.read32(scratch+80n),span=a.sub(a.mul(radius,0x3e4ccccd),radius);
  const fraction=value(span)>value(0x3727c5ac)||value(0xb727c5ac)>value(span)?a.div(a.sub(distance,radius),span):0x3f800000;
  weight=a.min(0x3f800000,a.max(0,fraction));
 }
 m.write32(ai+36n,weight);
 if(value(speed)>.5&&m.read64(m.read64(ai+8n)+40n)){
  s.updateFlocking(ai,m.read64(m.read64(ai+16n)+120n),scratch,speed,delta);weight=m.read32(ai+36n);
 }
 // Capture parameters before powf; callbacks can change later live reads.
 const params=m.read64(m.read64(ai+16n)+120n),power=s.pow(weight,0x40400000),maximum=a.mul(a.sub(0x3f800000,power),m.read32(params+32n)),state=ai+0x90n;
 beginOriginalCreatureSteering(m,state,scratch,delta,maximum);
 const rail=m.read64(ai+64n);
 if(rail){
  const liveParams=m.read64(m.read64(ai+16n)+120n),railDistance=s.railDistance(rail,scratch);
  if(!(value(railDistance)>=value(0x3f7d70a4))){
   s.followRail(state,m.read64(ai+64n),1,0x40800000,0x3f000000,a.mul(a.mul(delta,m.read32(liveParams+28n)),0x41000000));
   const aiParams=m.read64(ai+8n);
   s.flock(state,m.read64(ai+16n),0x1001a66e0n,[112,64,72,68,76].map(n=>m.read32(aiParams+BigInt(n))));
  }else m.write64(ai+64n,0n);
 }else{
  const object=m.read64(ai+80n);
  if(!object||object===m.read64(m.read64(ai+8n)+56n)||s.followObject(ai,m.read64(m.read64(ai+16n)+120n),m.read64(game+0x280n),m.read64(game+0x3c8n),scratch,delta)&255){
   s.steerTarget(ai,m.read64(m.read64(ai+16n)+120n),scratch,speed);
   s.steerGuide(ai,m.read64(game+0x280n),scratch,delta);
  }
 }
 const avoid=Number(!(value(0x3727c5ac)>=value(m.read32(m.read64(ai+8n)+104n)&0x7fffffff)));
 endOriginalCreatureSteering(m,scratch+96n,state,avoid,{arithmetic:s.arithmetic,collision:s.collision});
 return m.bytes(scratch+96n,16).slice();
}
/** Shared original per-frame owner composition; target and Model bindings
 * can be supplied by the existing target/animation owners independently. */
export function originalBirdSteeringFlightUpdateServices(m:ModelBakeMemory,s:Omit<BirdUpdateServices,'updateAi'>,flight:Omit<BirdFlightServices,'acceleration'>,scratch:bigint,acceleration:BirdAccelerationServices):BirdUpdateServices {
 return originalBirdFlightUpdateServices(m,s,{...flight,acceleration:(ai,game)=>calculateOriginalBirdAcceleration(m,ai,game,scratch,{...acceleration,debugScaleBits:s.globals.debugEnabled?s.globals.debugScaleBits:0x3f800000})});
}
