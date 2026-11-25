import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import type {BirdAccelerationServices} from './bird-acceleration-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {originalForceVectors} from './creature-force-runtime';
import {brakeOriginalCreatureSteering,orbitOriginalCreatureSteering,seekOriginalCreatureDirection} from './creature-follow-runtime';
import evidence from '../../docs/bird-follow-native.json';
const one=0x3f800000,c=evidence.constants;
export interface BirdFollowServices {
 arithmetic?:NatureArithmeticServices;
 requireAvatar(owner:bigint):bigint;
 worldPosition(transform:bigint):Uint8Array;
 targetTransform(target:bigint):Uint8Array;
 targetObb(target:bigint):Uint8Array;
 projectSphereObb(position:Uint8Array,radiusBits:number,worldObb:Uint8Array):Uint8Array;
 random():number;
 emitCritters(owner:bigint,bird:bigint,kind:number,texture:0x10203f6b0n,flags:0,enabled:1,local:1,scaleBits:number,timeBits:0):void;
}
/** Original Matrix4 multiplication 0x100076df0 order, including operand
 * order in columns 1..3 and capturing both matrices before any writes. */
function multiply(left:Uint8Array,right:Uint8Array,arithmetic?:NatureArithmeticServices){
 if(left.length!==64||right.length!==64)throw new Error('Bird follow transform and OBB require 64 bytes');
 const {a,read,bytes}=originalForceVectors(arithmetic),l=[0,16,32,48].map(n=>read(left,n)),r=[0,16,32,48].map(n=>read(right,n));
 return bytes(r.flatMap((column,col)=>[0,1,2,3].map(row=>{const q=column.map((x,i)=>col===0&&i>0?a.mul(x,l[i][row]):a.mul(l[i][row],x));return col===0?a.add(a.add(a.add(q[0],q[1]),q[2]),q[3]):a.add(q[3],a.add(q[2],a.add(q[0],q[1])));}))); 
}
/** Whole BirdV2Ai.FollowObject 0x1001a08e0. Target reset/release, approach,
 * countdown, periodic Critter requests, braking and orbit retries preserve
 * the original callback rereads and low-byte return value. */
export function followOriginalBirdObject(m:ModelBakeMemory,ai:bigint,avatars:bigint,critters:bigint,motion:bigint,delta:number,s:BirdFollowServices):number {
 const {a,read,bytes,sum,squared,sqrt}=originalForceVectors(s.arithmetic),state=ai+0x90n,targetPosition=read(m.bytes(ai+48n,16));
 if(value(sum(squared(targetPosition.map((x,i)=>a.sub(x,m.read32(ai+112n+BigInt(i*4)))))))>value(c.targetResetSquared)){
  m.write32(ai+128n,0);m.write64(ai+92n,0n);m.write32(ai+100n,0);m.bytes(ai+112n,16).set(bytes(targetPosition));m.write32(ai+76n,1);
 }
 const avatar=s.requireAvatar(avatars),position=s.worldPosition(m.read64(m.read64(avatar+32n)+0x2a0n));if(position.length!==16)throw new Error('Bird follow avatar position requires 16 bytes');
 let target=m.read64(ai+24n);
 if(target){
  const transform=s.targetTransform(target);target=m.read64(ai+24n);const obb=s.targetObb(target),world=multiply(transform,obb,s.arithmetic),projected=s.projectSphereObb(position,c.avatarRadius,world);
  const q=squared(read(projected).map((x,i)=>a.sub(x,read(position)[i]))),distance=a.sub(sum(q),a.mul(c.avatarRadius,c.avatarRadius));
  if(value(c.targetReleaseSquared)>value(distance)){
   target=m.read64(ai+24n);m.write8(target+64n,0);m.write64(ai+24n,0n);m.write64(ai+80n,0n);m.write32(m.read64(ai+16n)+0x50cn,0);
  }
 }
 if(m.read32(ai+128n)>2)return 1;
 let result=1;
 if(m.read32(ai+76n)){
  const arrival=m.read32(m.read64(ai+8n)+96n),distance=sum(squared(read(m.bytes(motion,16)).map((x,i)=>a.sub(x,m.read32(ai+48n+BigInt(i*4))))));
  if(value(a.mul(arrival,arrival))>value(distance)){m.write32(ai+76n,0);m.write32(ai+92n,bits(10));}
  if(!(value(m.read32(ai+96n))>value(c.timeout)))return result;
 }else{
  const countdown=a.sub(m.read32(ai+92n),delta);m.write32(ai+92n,countdown);
  if(value(countdown)>0){
   let direction=read(position).map((x,i)=>a.sub(x,m.read32(motion+BigInt(i*4)))),q=squared(direction),length=sqrt(sum(q));
   if(value(length)>value(0x3727c5ac))direction=direction.map((x,i)=>a.div(x,i===3?q[1]:length));
   const backward=read(m.bytes(motion+48n,16)).map(x=>(x^0x80000000)>>>0),dot=sum(backward.map((x,i)=>a.mul(x,direction[i])));
   if(value(c.headingMinimum)>value(dot)){
    const seek=bytes(read(m.bytes(motion,16)).map((x,i)=>a.add(x,direction[i])));
    seekOriginalCreatureDirection(m,state,seek,one,one,s.arithmetic);
   }else{
    const timer=a.sub(m.read32(ai+88n),delta);m.write32(ai+88n,timer);
    if(0>value(timer)){
     const bird=m.read64(ai+16n);s.random();const params=m.read64(bird+120n),kind=m.read32(params+48n),selected=((kind-1)>>>0)<3?(kind+3)>>>0:3;
     s.emitCritters(critters,bird,selected,0x10203f6b0n,0,1,1,a.mul(m.read32(params+24n),0x3f000000),0);
     const random=a.mul(bits(s.random()|0),c.randomScale);m.write32(ai+88n,a.add(a.add(random,random),a.sub(one,random)));
    }
   }
   brakeOriginalCreatureSteering(m,state,one,s.arithmetic);result=0;
  }else if(value(c.resetCountdown)>value(countdown))m.write32(ai+92n,bits(10));
  const elapsed=a.add(delta,m.read32(ai+96n));m.write32(ai+96n,elapsed);if(!(value(elapsed)>value(c.timeout)))return result;
 }
 m.write32(ai+76n,2);
 if(value(one)>value(m.read32(ai+100n))){
  orbitOriginalCreatureSteering(m,state,position,one,0x3f000000,1,s.arithmetic);
  if(value(c.nearSquared)>value(sum(squared(read(position).map((x,i)=>a.sub(x,m.read32(motion+BigInt(i*4)))))))){
   const timer=a.add(delta,m.read32(ai+100n));m.write32(ai+100n,timer);
   if(value(timer)>=1){const count=(m.read32(ai+128n)+1)>>>0;m.write32(ai+128n,count);if(count<=2)m.write64(ai+96n,0n);m.write32(ai+76n,1);}
  }
  return 0;
 }
 return result;
}
export function originalBirdFollowAccelerationServices(m:ModelBakeMemory,s:Omit<BirdAccelerationServices,'followObject'>,follow:BirdFollowServices):BirdAccelerationServices {
 const arithmetic=s.arithmetic??follow.arithmetic;return {...s,arithmetic,followObject:(ai,_params,avatars,critters,motion,delta)=>followOriginalBirdObject(m,ai,avatars,critters,motion,delta,{...follow,arithmetic})};
}
