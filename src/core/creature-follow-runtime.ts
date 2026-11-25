import type {ModelBakeMemory} from './model-baked-runtime';
import type {NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as valueBits,numericFloatValue as value} from './object-numeric-runtime';
import {originalForceVectors} from './creature-force-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
const epsilon=0x3727c5ac,one=0x3f800000;
const requireAccumulation=(m:ModelBakeMemory,state:bigint,line:number)=>{if(!m.bytes(state+16n,1)[0])throw new NativeObjectFoundationFailure('SteeringBehaviors.cpp',line,3,'m_accum');};
/** Whole direct Seek overload 0x10062f190. Unlike the arrival overload,
 * it scales desired velocity before subtracting the current velocity. */
export function seekOriginalCreatureDirection(m:ModelBakeMemory,state:bigint,target:Uint8Array,weight:number,speedScale:number,arithmetic?:NatureArithmeticServices,weightW=0,speedScaleW=0){
 requireAccumulation(m,state,507);if(value(weight&0x7fffffff)<=value(epsilon))return;
 const {a,read,bytes,normalize}=originalForceVectors(arithmetic),direction=normalize(read(target).map((x,i)=>a.sub(x,m.read32(state+32n+BigInt(i*4))))),speed=m.read32(state+0x74n);
 m.bytes(state,16).set(bytes(direction.map((x,i)=>a.add(a.mul(i===3?weightW:weight,a.sub(a.mul(i===3?speedScaleW:speedScale,a.mul(x,speed)),m.read32(state+0x60n+BigInt(i*4)))),m.read32(state+BigInt(i*4))))));
}
/** Whole Steering.Brake 0x100630480. Below maximum speed it subtracts the
 * live velocity; otherwise the original normalized maximum-speed vector. */
export function brakeOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,weight:number,arithmetic?:NatureArithmeticServices,weightW=0){
 requireAccumulation(m,state,680);if(value(weight&0x7fffffff)<=value(epsilon))return;
 const {a,read,bytes,sum,squared,sqrt}=originalForceVectors(arithmetic),speed=m.read32(state+0x74n);let velocity=read(m.bytes(state+0x60n,16));const q=squared(velocity),square=sum(q);
 if(!(value(a.mul(speed,speed))>value(square))){const n=sqrt(square);if(value(n)>value(epsilon))velocity=velocity.map((x,i)=>a.div(x,i===3?q[1]:n));velocity=velocity.map((x,i)=>a.mul(i===3?0:speed,x));}
 m.bytes(state,16).set(bytes(velocity.map((x,i)=>a.sub(m.read32(state+BigInt(i*4)),a.mul(i===3?weightW:weight,x)))));
}
/** Whole Steering.Orbit 0x100630190. Original fallback axes, signed orbit
 * direction and shuffled cross-product normalization retain SIMD W. */
export function orbitOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,target:Uint8Array,weight:number,distance:number,direction:number,arithmetic?:NatureArithmeticServices,weightW=0,distanceW=0){
 requireAccumulation(m,state,662);if(value(weight&0x7fffffff)<=value(epsilon))return;
 const {a,read,bytes,normalize,sum,squared,sqrt}=originalForceVectors(arithmetic),position=read(m.bytes(state+32n,16)),destination=read(target);
 let toward=normalize(destination.map((x,i)=>a.sub(x,position[i])));
 if(value(epsilon)>=value(sum(squared(toward))&0x7fffffff))toward=[0,0,one,0];
 let axis=[0,one,0,one];const dot=sum(toward.map((x,i)=>a.mul(x,axis[i])));
 if(value(epsilon)>=value(a.add(dot&0x7fffffff,0xbf800000)&0x7fffffff))axis=[one,0,0,0];
 const raw=[2,0,1,3].map((i,j)=>a.sub(a.mul(toward[i],axis[j]),a.mul(toward[j],axis[i]))),q=squared(raw),length=sqrt(a.add(q[1],a.add(q[2],q[0])));
 let tangent=[raw[2],raw[0],raw[1],raw[3]];
 if(value(length)>value(epsilon))tangent=tangent.map((x,i)=>a.div(x,i===3?q[3]:length));
 const offset=tangent.map((x,i)=>a.mul(valueBits(direction|0),a.mul(i===3?distanceW:distance,x)));
 const desired=normalize(destination.map((x,i)=>a.sub(a.add(x,offset[i]),position[i]))),speed=m.read32(state+0x74n);
 m.bytes(state,16).set(bytes(desired.map((x,i)=>a.add(a.mul(i===3?weightW:weight,a.sub(a.mul(x,speed),m.read32(state+0x60n+BigInt(i*4)))),m.read32(state+BigInt(i*4))))));
}
