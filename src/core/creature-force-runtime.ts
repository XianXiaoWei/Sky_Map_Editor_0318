import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import evidence from '../../docs/bird-force-native.json';
const one=0x3f800000,epsilon=0x3727c5ac;
export function originalForceVectors(arithmetic?:NatureArithmeticServices){
 const a=natureArithmetic(arithmetic),sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
 const squared=(v:readonly number[])=>v.map(n=>a.mul(n,n)),sum=(v:readonly number[])=>a.add(v[2],a.add(v[0],v[1]));
 const length=(v:readonly number[])=>sqrt(sum(squared(v)));
 const normalize=(v:readonly number[])=>{const q=squared(v),n=sqrt(sum(q));return value(n)>value(epsilon)?v.map((x,i)=>a.div(x,i===3?q[1]:n)):[...v];};
 const read=(v:Uint8Array,offset=0)=>{const d=new DataView(v.buffer,v.byteOffset,v.byteLength);return [0,4,8,12].map(i=>d.getUint32(offset+i,true));};
 const bytes=(v:readonly number[])=>{const b=new Uint8Array(v.length*4),d=new DataView(b.buffer);v.forEach((n,i)=>d.setUint32(i*4,n,true));return b;};
 return {a,sqrt,squared,sum,length,normalize,read,bytes};
}
export interface CreatureWanderServices {random():number;arithmetic?:NatureArithmeticServices;}
/** Whole raw Wander 0x10062d010. Persistent random direction is normalized
 * before projecting through the live motion basis; original W divisors and
 * matrix translation reduction retain their float operation order. */
export function wanderOriginalCreatureMotion(m:ModelBakeMemory,motion:bigint,cache:bigint,radius:number,distance:number,jitter:number,vertical:number,s:CreatureWanderServices){
 const {a,read,bytes,normalize}=originalForceVectors(s.arithmetic);
 const random=()=>{const n=a.mul(bits(s.random()|0),evidence.constants.randomScale);return a.add(n,a.sub(n,one));};
 const x=random(),y=a.mul(random(),vertical),z=random(),offset=[x,y,z,0];
 let direction=read(m.bytes(cache,16)).map((n,i)=>a.add(a.mul(i===3?0:jitter,offset[i]),n));m.bytes(cache,16).set(bytes(direction));direction=normalize(direction);m.bytes(cache,16).set(bytes(direction));
 const target=direction.map((n,i)=>a.add(a.mul(i===3?0:distance,evidence.vectors.backward[i]),a.mul(i===3?0:radius,n)));target[3]=one;
 const axes=[16n,32n,48n].map(offset=>read(m.bytes(motion+offset,16)).map((n,i)=>i===3?0:n)),position=read(m.bytes(motion,16)),translation=position.map((n,i)=>i===3?one:n);
 const world=[0,1,2,3].map(i=>a.add(a.mul(translation[i],target[3]),a.add(a.mul(axes[2][i],target[2]),a.add(a.mul(axes[0][i],target[0]),a.mul(axes[1][i],target[1])))));
 const force=normalize(world.map((n,i)=>a.sub(n,position[i]))),speed=m.read32(motion+0x54n),velocity=read(m.bytes(motion+64n,16));
 return bytes(force.map((n,i)=>a.sub(a.mul(n,speed),velocity[i])));
}
/** Whole accumulating Wander 0x10062e8f0. Even zero weight runs raw
 * Wander and consumes its three random calls after the accumulation check. */
export function wanderOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,weight:number,radius:number,distance:number,jitter:number,vertical:number,s:CreatureWanderServices,weightW=0){
 if(!m.bytes(state+16n,1)[0])throw new NativeObjectFoundationFailure('SteeringBehaviors.cpp',430,3,'m_accum');
 const {a,read,bytes}=originalForceVectors(s.arithmetic),force=read(wanderOriginalCreatureMotion(m,state+32n,state+0x90n,radius,a.add(distance,m.read32(state+0x70n)),jitter,vertical,s));
 m.bytes(state,16).set(bytes(force.map((n,i)=>a.add(a.mul(i===3?weightW:weight,n),m.read32(state+BigInt(i*4))))));
}
/** Whole Flee 0x10062f540: distance falloff and velocity minus projected
 * desired velocity, accumulated with the original scalar SIMD W lanes. */
export function fleeOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,motion:Uint8Array,weight:number,minimum:number,maximum:number,prediction:number,arithmetic?:NatureArithmeticServices,weightW=0,predictionW=0){
 if(!m.bytes(state+16n,1)[0])throw new NativeObjectFoundationFailure('SteeringBehaviors.cpp',488,3,'m_accum');if(value(weight&0x7fffffff)<=value(epsilon))return;
 const {a,read,bytes,normalize,length}=originalForceVectors(arithmetic),position=read(m.bytes(state+32n,16)),target=read(motion),span=a.sub(maximum,minimum);
 const fraction=value(span)>value(epsilon)||value(0xb727c5ac)>value(span)?a.div(a.sub(length(position.map((n,i)=>a.sub(n,target[i]))),minimum),span):one;
 const falloff=a.sub(one,a.min(one,a.max(0,fraction))),velocity=read(motion,64),direction=normalize(target.map((n,i)=>a.sub(a.add(n,a.mul(i===3?predictionW:prediction,velocity[i])),position[i]))),speed=m.read32(state+0x74n),own=read(m.bytes(state+0x60n,16));
 m.bytes(state,16).set(bytes(direction.map((n,i)=>a.add(a.mul(i===3?weightW:weight,a.mul(i===3?0:falloff,a.sub(own[i],a.mul(n,speed)))),m.read32(state+BigInt(i*4))))));
}

/** Whole Pursuit 0x10062f660. Target motion and the separately supplied
 * target velocity are snapshots; scalar ABI upper lanes remain explicit. */
export function pursueOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,motion:Uint8Array,velocity:Uint8Array,weight:number,prediction:number,arithmetic?:NatureArithmeticServices,weightW=0,predictionW=0){
 if(!m.bytes(state+16n,1)[0])throw new NativeObjectFoundationFailure('SteeringBehaviors.cpp',498,3,'m_accum');
 if(value(weight&0x7fffffff)<=value(epsilon))return;
 const {a,read,bytes,normalize}=originalForceVectors(arithmetic),target=read(motion),speed=read(velocity);
 const direction=normalize(target.map((n,i)=>a.sub(a.add(a.mul(i===3?predictionW:prediction,speed[i]),n),m.read32(state+32n+BigInt(i*4)))));
 m.bytes(state,16).set(bytes(direction.map((n,i)=>a.add(a.mul(i===3?weightW:weight,a.sub(a.mul(n,m.read32(state+0x74n)),m.read32(state+0x60n+BigInt(i*4)))),m.read32(state+BigInt(i*4))))));
}

export interface CreatureAvoidanceServices {
 arithmetic?:NatureArithmeticServices;
 avoidance(motion:bigint,world:bigint,flag:number,lookahead:number):Uint8Array;
}
/** Whole accumulating Avoidance 0x10062e860. The raw world consumer owns
 * its result and may mutate the live accumulator before accumulation. */
export function avoidOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,weight:number,lookahead:number,flag:number,s:CreatureAvoidanceServices,weightW=0){
 if(!m.bytes(state+16n,1)[0])throw new NativeObjectFoundationFailure('SteeringBehaviors.cpp',421,3,'m_accum');
 if(value(weight&0x7fffffff)<=value(epsilon))return;
 const {a,read,bytes}=originalForceVectors(s.arithmetic),force=read(s.avoidance(state+32n,m.read64(state+0x1e0n),flag&255,lookahead));
 m.bytes(state,16).set(bytes(force.map((n,i)=>a.add(a.mul(i===3?weightW:weight,n),m.read32(state+BigInt(i*4))))));
}
