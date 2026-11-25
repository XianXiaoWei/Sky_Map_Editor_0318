import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';

export interface CreatureMotionStateServices {
 /** Original metadata conversion may replace the local Object* even when
  * the cast fails. The returned object is the post-conversion input. */
 cast(object:bigint,kind:'Actor'|'Avatar'):{object:bigint;cast:bigint};
 avatarMotion(out:bigint,avatar:bigint):void;
 transform(object:bigint):Uint8Array;
 scale(object:bigint):Uint8Array;
 obb(transform:Uint8Array,scale:Uint8Array):Uint8Array;
 arithmetic?:NatureArithmeticServices;
}
const sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
/** Whole SteeringBehaviors motion-state reader 0x10062e430. Actor storage
 * comes from the post-cast Object* minus 8, not the cast result. Avatar and
 * generic transform/scale services retain the original fallback order. */
export function readOriginalCreatureMotionState(m:ModelBakeMemory,out:bigint,object:bigint,s:CreatureMotionStateServices){
 let selected=s.cast(object,'Actor');object=selected.object;
 if(selected.cast){
  const actor=object?object-8n:0n;
  m.bytes(out,16).set(m.bytes(actor+16n,16));
  // Two overlapping 32-byte SIMD loads happen before either store.
  const first=new Uint8Array(m.bytes(actor+32n,32)),second=new Uint8Array(m.bytes(actor+48n,32));
  m.bytes(out+32n,32).set(second);m.bytes(out+16n,32).set(first);
  m.bytes(out+64n,16).set(m.bytes(actor+80n,16));
  m.write32(out+0x58n,m.read32(actor+0x68n));m.write64(out+0x50n,m.read64(actor+0x60n));return out;
 }
 selected=s.cast(object,'Avatar');object=selected.object;
 if(selected.cast){s.avatarMotion(out,object?object-8n:0n);return out;}
 const transform=s.transform(object),scale=s.scale(object),obb=s.obb(transform,scale);
 if(obb.length!==64)throw new Error('原生物运动OBB服务必须返回64字节');
 const a=natureArithmetic(s.arithmetic),d=new DataView(obb.buffer,obb.byteOffset,obb.byteLength);
 m.bytes(out,16).set(obb.subarray(48,64));
 const diagonal=[0,1,2,3].map(lane=>a.add(a.add(d.getUint32(lane*4,true),d.getUint32(16+lane*4,true)),d.getUint32(32+lane*4,true))),sq=diagonal.map(n=>a.mul(n,n));
 m.write32(out+0x50n,sqrt(a.add(sq[2],a.add(sq[0],sq[1]))));
 m.bytes(out+64n,16).fill(0);m.write32(out+0x54n,0);return out;
}
