import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
/** Whole motion Seek 0x10062cb10, distinct from the accumulating steering
 * Seek. Normalization retains squared-Y as the SIMD W divisor; scalar
 * weight's upper W lane is explicit for callers using a packed ABI. */
export function seekOriginalCreatureMotion(m:ModelBakeMemory,position:bigint,target:Uint8Array,weight:number,weightW=0,arithmetic?:NatureArithmeticServices){
 if(target.length!==16)throw new Error('Creature motion target requires 16 bytes');
 const a=natureArithmetic(arithmetic),d=new DataView(target.buffer,target.byteOffset,16),direction=[0,4,8,12].map(i=>a.sub(d.getUint32(i,true),m.read32(position+BigInt(i)))),q=direction.map(n=>a.mul(n,n)),sum=a.add(q[2],a.add(q[0],q[1])),length=(sum&0x7fffffff)>0x7f800000?(sum|0x400000)>>>0:value(sum)<0?0xffc00000:bits(Math.sqrt(value(sum)));
 if(value(length)>value(0x3727c5ac))for(let i=0;i<4;i++)direction[i]=a.div(direction[i],i===3?q[1]:length);
 const speed=m.read32(position+0x54n),out=new Uint8Array(16),v=new DataView(out.buffer);
 direction.forEach((n,i)=>v.setUint32(i*4,a.sub(a.mul(i===3?weightW:weight,a.mul(n,speed)),m.read32(position+0x40n+BigInt(i*4))),true));return out;
}
