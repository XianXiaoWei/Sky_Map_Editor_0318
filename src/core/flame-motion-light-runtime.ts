import type {ModelBakeMemory} from './model-baked-runtime';
import type {NativeMarkerArithmeticServices} from './marker-transform-runtime';
import {itemEffectArithmetic,itemFloatBytes,itemFloats,itemView,itemMin,itemMax} from './item-effect-arithmetic';

export interface FlameMotionLightServices {
 debugTimeEnabled():boolean;debugTimeScale():number;
 expf(input:number):number;powf(input:number,exponent:number):number;
 arithmetic?:NativeMarkerArithmeticServices;
}
/** Original Flame.Update prefix 0x10033c045..0x10033c2ec, ending before
 * interactions and audio. Restores velocity, capped exponential positional
 * lag, intensity-to-light/radius conversion and consumption decay. It does
 * not replace the remainder of Update or implement ignition propagation. */
export function updateOriginalFlameMotionLight(m:ModelBakeMemory,out:bigint,game:bigint,delta:number,s:FlameMotionLightServices){
 const a=itemEffectArithmetic(s.arithmetic),read=(at:bigint)=>itemView(m.bytes(at,4)).getFloat32(0,true),write=(at:bigint,n:number)=>m.bytes(at,4).set(itemFloatBytes([n]));
 const current=itemFloats(m.bytes(out+0xc0n,16)),previous=itemFloats(m.bytes(out+0xd0n,16)),clock=m.read64(game+0x160n),debug=s.debugTimeEnabled()?s.debugTimeScale():1;
 const velocityDelta=itemMin(Math.fround(.266),itemMax(Math.fround(.0001),a.mul(read(clock+0x18n),a.mul(debug,read(clock+0x20n))))),velocity=current.slice(0,3).map((n,i)=>a.div(a.sub(n,previous[i]),velocityDelta));
 m.bytes(out+0xe0n,12).set(itemFloatBytes(velocity));
 // VPERMILPS 0xc0 leaves the fourth divisor at zero. Preserve the native
 // negative indefinite NaN from 0/0; this lane is not used for speed/length.
 const fourth=a.sub(current[3],previous[3]);if(fourth===0)m.write32(out+0xecn,0xffc00000);else write(out+0xecn,fourth>0?Infinity:-Infinity);
 m.bytes(out+0xd0n,16).set(itemFloatBytes(current));
 const alpha=itemMin(1,itemMax(0,a.sub(1,s.expf(a.mul(delta,Math.fround(-12.163954734802246)))))),lag=itemFloats(m.bytes(out+0xf0n,16)),weight=a.sub(1,alpha);
 const offset=current.map((n,i)=>a.sub(a.add(a.mul(n,i===3?0:alpha),a.mul(lag[i],i===3?0:weight)),n)),length=a.length3(offset),safeLength=Number.isNaN(length)?Math.fround(.0001):itemMax(Math.fround(.0001),length),ratio=a.div(.25,safeLength),limit=Number.isNaN(ratio)?1:itemMin(1,ratio);
 m.bytes(out+0xf0n,16).set(itemFloatBytes(current.map((n,i)=>a.add(n,a.mul(offset[i],i===3?0:limit)))));
 if(!m.bytes(out+0xb4n,1)[0])return;
 const intensity=read(out+0x110n),light=s.powf(intensity,Math.fround(1/3)),oldConsumption=read(out+0x10cn),size=read(out+0x108n),safeSize=Number.isNaN(size)?Math.fround(.01):itemMax(Math.fround(.01),size),volume=a.mul(safeSize,a.add(a.mul(oldConsumption,.25),1)),volumeCube=s.powf(volume,3);
 const consumption=itemMin(2,itemMax(0,a.sub(oldConsumption,delta)));
 write(out+0x114n,light);write(out+0x118n,a.sqrt(a.div(a.mul(a.mul(volumeCube,intensity),1000),.5)));write(out+0x10cn,consumption);
 if(consumption!==1||!m.bytes(out+0x138n,1)[0])m.write8(out+0x138n,Number(consumption===1));
 m.write8(out+0x142n,Number(a.add(a.mul(velocity[2],velocity[2]),a.add(a.mul(velocity[0],velocity[0]),a.mul(velocity[1],velocity[1])))>0));
}
