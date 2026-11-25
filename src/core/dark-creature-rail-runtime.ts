import type {ModelBakeMemory} from './model-baked-runtime';
import {originalCreatureLength3} from './bird-load-runtime';
import {natureArithmetic} from './nature-event-runtime';
import {numericFloatValue as value} from './object-numeric-runtime';
const a=natureArithmetic();
export interface DarkCreatureRailServices {
 /** Native Rail.GetNearestTime 0x10055d820 returns a float bit pattern. */
 nearestTime(rail:bigint,position:Uint8Array):number;
 remainder(inputBits:number,divisorBits:number):number;
 sample(rail:bigint,timeBits:number):Uint8Array;
}
/** Whole DarkCreature rail switch 0x10026d0f0, used by its Load/update.
 * Patrol and cooldown rails come from this creature's own params. The two
 * samples and saved heading select the native traversal direction. Actual
 * Rail geometry/nearest-time and libm remain explicit services. */
export function switchOriginalDarkCreatureRail(m:ModelBakeMemory,p:bigint,cooldown:number,s:DarkCreatureRailServices){
 m.write8(p+0x2c5n,cooldown);const params=m.read64(p+0x50n),rail=m.read64(params+((cooldown&255)?24n:16n));m.write32(p+((cooldown&255)?0x17cn:0x1a0n),0);
 const position=new Uint8Array(16),v=new DataView(position.buffer);for(let i=0;i<4;i++)v.setUint32(i*4,a.add(m.read32(p+0x60n+BigInt(i*4)),m.read32(p+0xa0n+BigInt(i*4))),true);
 const time=s.remainder(s.nearestTime(rail,position),0x3f800000);m.write32(p+0x2d4n,time);
 if(!m.bytes(m.read64(p+0x50n)+5n,1)[0]){m.write8(p+0x2c6n,1);return;}
 const forward=s.sample(rail,a.add(time,0x3dcccccd)),backward=s.sample(rail,a.add(time,0xbdcccccd));
 const vector=(input:Uint8Array,subtractPosition:boolean)=>{
  const out=new Uint8Array(16),d=new DataView(out.buffer),source=new DataView(input.buffer,input.byteOffset,input.byteLength);
  for(let i=0;i<4;i++)d.setUint32(i*4,subtractPosition?a.sub(source.getUint32(i*4,true),m.read32(p+0x60n+BigInt(i*4))):source.getUint32(i*4,true),true);
  const length=originalCreatureLength3(out),w=a.mul(d.getUint32(4,true),d.getUint32(4,true));
  if(value(length)>value(0x3727c5ac))for(let i=0;i<4;i++)d.setUint32(i*4,a.div(d.getUint32(i*4,true),i===3?w:length),true);
  return [0,1,2].map(i=>d.getUint32(i*4,true));
 };
 const f=vector(forward,true),b=vector(backward,true),heading=vector(new Uint8Array(m.bytes(p+0xa0n,16)),false);
 const dot=(direction:number[])=>{const product=direction.map((n,i)=>a.mul(n,heading[i]));return a.add(product[2],a.add(product[0],product[1]));};
 m.write8(p+0x2c6n,value(dot(f))>value(dot(b))?1:0);
}
