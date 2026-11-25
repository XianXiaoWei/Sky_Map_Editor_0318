import type {ModelBakeMemory} from './model-baked-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {originalForceVectors,wanderOriginalCreatureSteering,fleeOriginalCreatureSteering} from './creature-force-runtime';
import {seekOriginalCreatureSteering} from './creature-steering-runtime';
import {flockOriginalCreatureSteering,type CreatureFlockingServices} from './creature-flocking-runtime';
import type {BirdAccelerationServices} from './bird-acceleration-runtime';
import {originalBirdRailSteeringServices,type BirdRailServices} from './bird-rail-runtime';
import {originalBirdFollowAccelerationServices,type BirdFollowServices} from './bird-follow-runtime';
import evidence from '../../docs/bird-force-native.json';
const one=0x3f800000,c=evidence.constants,v=evidence.vectors;
export interface BirdForceServices {
 arithmetic?:NatureArithmeticServices;
 random():number;
 targetTransform(target:bigint):Uint8Array;
 raycast(scene:bigint,origin:Uint8Array,direction:Uint8Array,maximumBits:number,options:{layer:1;mask:0xffffffef;enabled:1;reserved:Uint8Array}):{hit:boolean;position:Uint8Array;normal:Uint8Array};
 avatarAt(owner:bigint,index:number):bigint;
 avatarActive(avatar:bigint):number;
 identityBasis:Uint8Array;
}
/** Whole 0x1001a0450, including the stochastic downward landing probe,
 * normal threshold and speed-dependent near-arrival direction flag. */
export function distanceOriginalBirdTarget(m:ModelBakeMemory,ai:bigint,scene:bigint,motion:bigint,speed:number,s:BirdForceServices){
 const {a,read,bytes,squared,sum,sqrt,length}=originalForceVectors(s.arithmetic),target=m.read64(ai+24n);
 const transform=target?s.targetTransform(target):bytes([one,0,0,0,...v.up,...v.forward,0,0,0,one]);if(transform.length!==64)throw new Error('Bird target transform requires 64 bytes');
 let landing=m.bytes(ai+72n,1)[0];const allowed=m.bytes(ai+32n,1)[0];let arrivalFlag=allowed?1:landing;
 if(allowed&&!landing){
  const random=()=>a.add(a.mul(bits(s.random()|0),c.randomScale),c.randomOffset),x=random(),z=random();
  const local=Array.from({length:4},(_,i)=>a.add(a.add(a.mul(i===0?one:0,x),a.mul(v.forward[i],z)),v.probeOffset[i]));
  const columns=[0,16,32,48].map(offset=>read(transform,offset));
  const origin=[0,1,2,3].map(i=>a.add(a.add(a.add(a.mul(local[0],columns[0][i]),a.mul(columns[1][i],local[1])),a.mul(local[2],columns[2][i])),columns[3][i]));
  const q=squared(columns[1]),maximum=sqrt(a.add(a.add(q[0],q[2]),a.add(q[1],q[3])));
  const ray=s.raycast(scene,bytes(origin),bytes(v.probeDirection),maximum,{layer:1,mask:0xffffffef,enabled:1,reserved:new Uint8Array(16)});
  if(ray.hit){if(ray.position.length!==16||ray.normal.length!==16)throw new Error('Bird ray hit requires 16-byte position and normal');if(value(sum(read(ray.normal).map((n,i)=>a.mul(n,v.up[i]))))>.5){m.bytes(ai+48n,16).set(ray.position);m.write8(ai+72n,1);}}
  landing=m.bytes(ai+72n,1)[0];arrivalFlag=landing;
 }
 let position:Uint8Array;if(landing)position=m.bytes(ai+48n,16).slice();else{position=transform.slice(48,64);m.bytes(ai+48n,16).set(position);}
 const distance=length(read(position).map((n,i)=>a.sub(n,m.read32(motion+BigInt(i*4)))));
 m.write8(ai+33n,value(a.add(a.mul(speed,c.arrivalSpeedScale),m.read32(motion+80n)))>value(distance)?arrivalFlag:0);return distance;
}
const targetMotion=(position:Uint8Array,velocity:Uint8Array,radius:number,identity:Uint8Array)=>{if(identity.length!==48)throw new Error('Bird target motion requires a 48-byte identity basis');const b=new Uint8Array(92);b.set(position);b.set(identity,16);b.set(velocity,64);const d=new DataView(b.buffer);d.setUint32(80,radius,true);d.setUint32(84,one,true);d.setUint32(88,0,true);return b;};
/** Whole 0x1001a0d20: Seek + Wander + shared Flocking + optional Flee.
 * Parameter and target references are reread after each service boundary. */
export function steerOriginalBirdTarget(m:ModelBakeMemory,ai:bigint,motion:bigint,speed:number,s:BirdForceServices,flocking:CreatureFlockingServices){
 const {a}=originalForceVectors(s.arithmetic),state=ai+0x90n;let params=m.read64(ai+8n);
 seekOriginalCreatureSteering(m,state,ai+48n,m.read32(params+120n),m.read32(params+96n),s.arithmetic);
 params=m.read64(ai+8n);wanderOriginalCreatureSteering(m,state,a.mul(m.bytes(ai+72n,1)[0]?0:one,m.read32(params+116n)),m.read32(params+84n),m.read32(params+88n),m.read32(params+80n),m.read32(params+92n),s);
 params=m.read64(ai+8n);const weight=a.mul(a.min(one,a.max(0,a.mul(speed,0x3f000000))),m.read32(params+112n));
 flockOriginalCreatureSteering(m,state,m.read64(ai+16n),0x1001a6760n,{weightBits:weight,alignmentBits:m.read32(params+64n),cohesionBits:m.read32(params+72n),separationBits:m.read32(params+68n),radiusBits:m.read32(params+76n)},flocking);
 params=m.read64(ai+8n);const object=m.read64(params+32n);
 if(object){const target=targetMotion(m.bytes(object+16n,16).slice(),new Uint8Array(16),m.read32(motion+80n),s.identityBasis);fleeOriginalCreatureSteering(m,state,target,m.read32(params+108n),c.fleeMinimum,c.fleeMaximum,one,s.arithmetic);}
}
/** Whole 0x1001a0e70. The original low-delta landing path clears velocity
 * XYZ while carrying the previous loop's W through its blend mask. */
export function steerOriginalBirdGuide(m:ModelBakeMemory,ai:bigint,avatars:bigint,motion:bigint,delta:number,s:BirdForceServices){
 const {a,read,bytes,sum,squared,length,sqrt}=originalForceVectors(s.arithmetic),state=ai+0x90n,divisor=[delta,delta,delta,0];let carry=[...divisor];
 for(let i=0;i<16;i++){
  const avatar=s.avatarAt(avatars,i);if(!(s.avatarActive(avatar)&255))continue;
  let transform=m.read64(avatar+24n);
  if(m.bytes(ai+72n,1)[0]){
   let velocity:number[];
   if(value(delta)>value(c.minimumGuideDelta))velocity=read(m.bytes(transform+16n,16)).map((n,i)=>a.div(a.sub(n,m.read32(transform+32n+BigInt(i*4))),divisor[i]));else velocity=[0,0,0,carry[3]];
   const position=m.bytes(transform+16n,16).slice();carry=velocity;
   const relative=velocity.map((n,i)=>a.sub(n,m.read32(motion+64n+BigInt(i*4)))),weight=a.mul(a.min(one,a.max(0,a.mul(length(relative),c.guideVelocityScale))),m.read32(m.read64(ai+8n)+128n));
   // Original target motion writes zero velocity. The observed player
   // velocity selects weight and loop carry, without target prediction.
   fleeOriginalCreatureSteering(m,state,targetMotion(position,new Uint8Array(16),m.read32(motion+80n),s.identityBasis),weight,c.fleeMinimum,c.fleeMaximum,one,s.arithmetic);
  }else{
   if(!m.bytes(transform+0xbb0n,1)[0])continue;
   const position=read(m.bytes(motion,16)),player=read(m.bytes(transform+16n,16)),difference=position.map((n,i)=>a.sub(n,player[i])),distance=sum(squared(difference));if(!(value(c.guideRangeSquared)>value(distance)))continue;
   const towardsPlayer=player.map((n,i)=>a.sub(n,position[i])),towardsTarget=read(m.bytes(ai+48n,16)).map((n,i)=>a.sub(n,position[i]));if(!(value(sum(towardsPlayer.map((n,i)=>a.mul(n,towardsTarget[i]))))>0))continue;
   const fraction=a.sub(one,a.min(one,a.max(0,a.div(sqrt(distance),c.guideDistanceDivisor)))),weight=a.mul(a.mul(fraction,fraction),m.read32(m.read64(ai+8n)+124n));
   seekOriginalCreatureSteering(m,state,transform+16n,weight,c.fleeMinimum,s.arithmetic);
  }
 }
}
/** The recovered target/guide forces and existing original shared Flocking
 * plug into the same acceleration→flight→motion Update composition. */
export function originalBirdForceAccelerationServices(m:ModelBakeMemory,s:Omit<BirdAccelerationServices,'targetDistance'|'steerTarget'|'steerGuide'|'flock'>,force:BirdForceServices,flocking:CreatureFlockingServices):BirdAccelerationServices {
 const arithmetic=s.arithmetic??force.arithmetic??flocking.arithmetic,resolvedForce={...force,arithmetic},resolvedFlock={...flocking,arithmetic};
 return {...s,arithmetic,targetDistance:(ai,scene,motion,speed)=>distanceOriginalBirdTarget(m,ai,scene,motion,speed,resolvedForce),steerTarget:(ai,_params,motion,speed)=>steerOriginalBirdTarget(m,ai,motion,speed,resolvedForce,resolvedFlock),steerGuide:(ai,avatars,motion,delta)=>steerOriginalBirdGuide(m,ai,avatars,motion,delta,resolvedForce),flock:(state,self,filter,weights)=>flockOriginalCreatureSteering(m,state,self,filter,{weightBits:weights[0],alignmentBits:weights[1],cohesionBits:weights[2],separationBits:weights[3],radiusBits:weights[4]},resolvedFlock)};
}
/** Complete recovered force/rail composition. Resolve arithmetic before
 * building closures so every force, rail and dispatcher shares the same
 * native float service, including when supplied by the rail owner. */
export function originalBirdAiAccelerationServices(m:ModelBakeMemory,s:Omit<BirdAccelerationServices,'targetDistance'|'steerTarget'|'steerGuide'|'flock'|'updateFlocking'|'railDistance'|'followRail'>,force:BirdForceServices,flocking:CreatureFlockingServices,rail:BirdRailServices,follow?:BirdFollowServices):BirdAccelerationServices {
 const arithmetic=s.arithmetic??force.arithmetic??flocking.arithmetic??rail.arithmetic??follow?.arithmetic;
 const rails={...s,arithmetic,...originalBirdRailSteeringServices(m,{...rail,arithmetic})};
 const forces=originalBirdForceAccelerationServices(m,rails,{...force,arithmetic},{...flocking,arithmetic});
 return follow?originalBirdFollowAccelerationServices(m,forces,{...follow,arithmetic}):forces;
}
