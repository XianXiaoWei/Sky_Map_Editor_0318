import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
const squareRoot=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
const accum=(m:ModelBakeMemory,p:bigint,line:number)=>{if(!m.bytes(p+16n,1)[0])throw new NativeObjectFoundationFailure('SteeringBehaviors.cpp',line,3,'m_accum');};
export interface CreatureSteeringCounters {wander:number;flock:number;avoid:number;}
/** Whole SteeringBehaviors.Initialize 0x10062e5b0. Staggered queries use
 * shared signed counters, including native overflow and signed remainder. */
export function initializeOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,query:bigint,actors:bigint,scene:bigint,counters:CreatureSteeringCounters){
 m.write64(state+0x1d0n,query);m.write64(state+0x1d8n,actors);m.write64(state+0x1e0n,scene);
 m.bytes(state+0x90n,16).set(new Uint8Array(Float32Array.of(0,0,1,0).buffer));m.bytes(state+0xa0n,16).fill(0);
 const counter=(key:keyof CreatureSteeringCounters,modulus:number)=>{const n=counters[key]|0;counters[key]=(n+1)|0;return (n%modulus)>>>0;};
 m.write32(state+0xb4n,counter('wander',5));m.write8(state+0xb0n,0);m.write32(state+0x1b8n,0);
 m.write32(state+0x1bcn,counter('flock',9));m.write64(state+0x1c0n,0n);m.write32(state+0x1c8n,counter('avoid',9));
}
/** Whole SteeringBehaviors.Begin 0x10062e690, as called by CrabAi.Update.
 * Copies the actual motion snapshot in native order; no target is created. */
export function beginOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,motion:bigint,deltaBits:number,maximumBits:number){
 m.bytes(state,16).fill(0);m.write8(state+16n,1);m.write32(state+0x80n,deltaBits);
 for(let i=0;i<5;i++)m.bytes(state+32n+BigInt(i)*16n,16).set(m.bytes(motion+BigInt(i)*16n,16));
 m.write32(state+0x78n,m.read32(motion+0x58n));m.write64(state+0x70n,m.read64(motion+0x50n));m.write32(state+0x84n,maximumBits);
}
export interface CreatureSteeringServices {
 arithmetic?:NatureArithmeticServices;
 /** Original collision/avoidance consumer 0x10062d590, including its live
  * position/velocity/world arguments and initial false collision flag. */
 collision(position:bigint,velocity:bigint,lookaheadBits:number,world:bigint,initialBlocked:0):Uint8Array;
}
/** Whole SteeringBehaviors.End 0x10062e700. Native fmax/fmin explicitly map
 * an unordered length to 0.0001 and an unordered scale to 1. W retains the
 * original zero SIMD multiplier lane. */
export function endOriginalCreatureSteering(m:ModelBakeMemory,out:bigint,state:bigint,avoid:number,s:CreatureSteeringServices){
 accum(m,state,397);m.write8(state+16n,0);const a=natureArithmetic(s.arithmetic),v=[0,4,8,12].map(n=>m.read32(state+BigInt(n))),squares=v.map(n=>a.mul(n,n)),length=squareRoot(a.add(squares[2],a.add(squares[0],squares[1])));
 const divisor=Number.isNaN(value(length))?0x38d1b717:a.max(0x38d1b717,length),ratio=a.div(m.read32(state+0x84n),divisor),scale=Number.isNaN(value(ratio))?0x3f800000:a.min(0x3f800000,ratio);
 v.forEach((n,i)=>m.write32(state+BigInt(i)*4n,a.mul(n,i===3?0:scale)));
 if(avoid&255){const velocity=s.collision(state+32n,state,a.mul(m.read32(state+0x80n),0x40a00000),m.read64(state+0x1e0n),0);if(velocity.length!==16)throw new Error('原生物避障服务必须返回16字节向量');m.bytes(state,16).set(velocity);}
 m.bytes(out,16).set(m.bytes(state,16));return out;
}
/** Whole SteeringBehaviors.Seek 0x10062f710. The scalar ABI's upper weight
 * lane is supplied explicitly when nonzero; XYZ follows
 * original distance normalization, arrival ratio and accumulation order. */
export function seekOriginalCreatureSteering(m:ModelBakeMemory,state:bigint,target:bigint,weightBits:number,arrivalBits:number,s?:NatureArithmeticServices,weightWBits=0){
 accum(m,state,590);if(value(weightBits&0x7fffffff)<=value(0x3727c5ac))return;
 const a=natureArithmetic(s),direction=[0,4,8,12].map(n=>a.sub(m.read32(target+BigInt(n)),m.read32(state+32n+BigInt(n)))),squares=direction.map(n=>a.mul(n,n)),length=squareRoot(a.add(squares[2],a.add(squares[0],squares[1])));
 // The scalar length keeps the shuffled squared-Y upper lane, which the
 // subsequent PERMILPS uses as W's divisor.
 if(value(length)>value(0x3a83126f))for(let i=0;i<4;i++)direction[i]=a.div(direction[i],i===3?squares[1]:length);
 const ratio=a.div(length,arrivalBits),arrival=value(arrivalBits),candidate=arrival<value(0xb727c5ac)?ratio:0x3f800000;
 const factor=a.min(0x3f800000,a.max(0,value(0x3727c5ac)<arrival?ratio:candidate)),speed=m.read32(state+0x74n);
 direction.forEach((n,i)=>{const desired=a.mul(a.mul(n,i===3?0:factor),speed),force=a.sub(desired,m.read32(state+0x60n+BigInt(i)*4n));m.write32(state+BigInt(i)*4n,a.add(a.mul(i===3?weightWBits:weightBits,force),m.read32(state+BigInt(i)*4n)));});
}
