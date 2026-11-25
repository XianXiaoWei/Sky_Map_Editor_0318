import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';

export interface CreatureFlockingServices {
 arithmetic?:NatureArithmeticServices;
 query(owner:bigint,position:bigint,out:bigint,capacity:32,filter:bigint,radiusBits:number):number;
 /** Casts mutate the actual cached Object* slot, retaining post-call input. */
 cast(memory:ModelBakeMemory,reference:bigint,kind:'Actor'|'Avatar'):bigint;
 avatarMotion(object:bigint):Uint8Array;
 obb(object:bigint):Uint8Array;
 /** Generic OBB fallback leaves the final motion lane unwritten. Supply
  * the caller's actual native scratch lane instead of inventing a weight. */
 fallbackWeightBits(index:number):number;
}
export interface CreatureFlockingWeights {
 weightBits:number;alignmentBits:number;cohesionBits:number;separationBits:number;radiusBits:number;
 /** The scalar native ABI keeps each incoming register's W lane. */
 weightWBits?:number;alignmentWBits?:number;cohesionWBits?:number;separationWBits?:number;
}
const sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
/** Whole shared flocking consumer 0x10062f800 called by CrabAi.Update.
 * Neighbor snapshots, the eight-call query cache, weighted cohesion,
 * alignment and radius-based separation retain original float32 order.
 * World queries, metadata, Avatar motion and generic OBB remain services. */
export function flockOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,self:bigint,filter:bigint,w:CreatureFlockingWeights,s:CreatureFlockingServices){
 if(!m.bytes(state+16n,1)[0])throw new NativeObjectFoundationFailure('SteeringBehaviors.cpp',600,3,'m_accum');
 if(value(w.weightBits&0x7fffffff)<=value(0x3727c5ac))return;
 const a=natureArithmetic(s.arithmetic),read=(p:bigint)=>[0,4,8,12].map(n=>m.read32(p+BigInt(n)));
 const vector=(bytes:Uint8Array,at:number)=>{const d=new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength);return [0,4,8,12].map(n=>d.getUint32(at+n,true));};
 const squared=(v:number[])=>{const sq=v.map(n=>a.mul(n,n));return {length:a.add(sq[2],a.add(sq[0],sq[1])),w:sq[1]};};
 const normalize=(v:number[])=>{const sq=squared(v),length=sqrt(sq.length);return value(length)>value(0x3727c5ac)?v.map((n,i)=>a.div(n,i===3?sq.w:length)):v;};
 const before=m.read32(state+0x1bcn)|0;m.write32(state+0x1bcn,(before-1)>>>0);
 let count:number;
 if(before>0)count=m.read32(state+0x1b8n);
 else{count=s.query(m.read64(state+0x1d0n),state+32n,state+0xb8n,32,filter,w.radiusBits)>>>0;m.write32(state+0x1b8n,count);m.write32(state+0x1bcn,8);}
 const neighbors:{position:number[];velocity:number[];radius:number;weight:number}[]=[];
 for(let i=0;i<count;i++){
  const reference=state+0xb8n+BigInt(i*8);if(m.read64(reference)===self)continue;
  let position:number[],velocity:number[],radius:number,weight:number;
  if(s.cast(m,reference,'Actor')){
   // This consumer uses the post-cast input directly, unlike the separate
   // motion-state reader's Object-subobject adjustment of minus eight.
   const object=m.read64(reference);position=read(object+16n);velocity=read(object+80n);radius=m.read32(object+96n);weight=m.read32(object+104n);
  }else if(s.cast(m,reference,'Avatar')){
   const motion=s.avatarMotion(m.read64(reference));position=vector(motion,0);velocity=vector(motion,64);
   const d=new DataView(motion.buffer,motion.byteOffset,motion.byteLength);radius=d.getUint32(80,true);weight=d.getUint32(88,true);
  }else{
   const obb=s.obb(m.read64(reference));position=vector(obb,48);
   const first=vector(obb,0),second=vector(obb,16),third=vector(obb,32);
   radius=sqrt(squared(first.map((n,i)=>a.add(a.add(n,second[i]),third[i]))).length);
   velocity=normalize(third.map(n=>(n^0x80000000)>>>0));weight=s.fallbackWeightBits(neighbors.length);
  }
  neighbors.push({position,velocity,radius,weight});count=m.read32(state+0x1b8n);
 }
 let force=[0,0,0,0];
 if(neighbors.length){
  const radiusSquared=a.mul(w.radiusBits,w.radiusBits),position=read(state+32n);
  let center=[0,0,0,0],aligned=[0,0,0,0],separated=[0,0,0,0],weightSum=0,separationSum=0;
  for(const neighbor of neighbors){
   const difference=position.map((n,i)=>a.sub(n,neighbor.position[i])),distance=squared(difference);
   if(value(distance.length)>value(0x3727c5ac)&&value(radiusSquared)>value(distance.length)){
    center=center.map((n,i)=>a.add(n,a.mul(neighbor.position[i],neighbor.weight)));
    aligned=aligned.map((n,i)=>a.add(n,a.mul(neighbor.weight,neighbor.velocity[i])));weightSum=a.add(weightSum,neighbor.weight);
   }
   const sumRadius=a.add(m.read32(state+0x70n),neighbor.radius);
   if(value(distance.length)>value(0x3727c5ac)&&value(a.mul(sumRadius,sumRadius))>value(distance.length)){
    separated=separated.map((n,i)=>a.add(n,a.mul(a.div(difference[i],i===3?distance.w:distance.length),neighbor.weight)));
    separationSum=a.add(separationSum,neighbor.weight);
   }
  }
  if(value(weightSum)>0){
   center=center.map((n,i)=>a.div(n,i===3?0:weightSum));aligned=aligned.map((n,i)=>a.div(n,i===3?0:weightSum));
   const direction=normalize(center.map((n,i)=>a.sub(n,position[i]))),speed=m.read32(state+0x74n),velocity=read(state+0x60n);
   force=direction.map((n,i)=>a.add(a.add(a.mul(i===3?w.alignmentWBits??0:w.alignmentBits,a.sub(aligned[i],velocity[i])),a.mul(i===3?w.cohesionWBits??0:w.cohesionBits,a.sub(a.mul(n,speed),velocity[i]))),0));
  }
  if(value(separationSum)>0){
   separated=normalize(separated);const speed=m.read32(state+0x74n),velocity=read(state+0x60n);
   force=force.map((n,i)=>a.add(n,a.mul(i===3?w.separationWBits??0:w.separationBits,a.sub(a.mul(separated[i],speed),velocity[i]))));
  }
 }
 force.forEach((n,i)=>m.write32(state+BigInt(i*4),a.add(a.mul(i===3?w.weightWBits??0:w.weightBits,n),m.read32(state+BigInt(i*4)))));
}
