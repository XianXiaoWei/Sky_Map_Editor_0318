import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {natureArithmetic,originalNatureDelta,type NatureArithmeticServices} from './nature-event-runtime';

export interface FlameEventServices {
 castObject(object:bigint):bigint;
 castFlame(object:bigint):bigint;
 castCandle(object:bigint):bigint;
 getFlameEnabled(flame:bigint):number;
 setObjectEnabled(object:bigint,enabled:number):void;
 /** Original 0x10033a780 includes audio and private state resets. */
 extinguish(flame:bigint,withSound:number):void;
 start(event:bigint):void;
 arithmetic?:NatureArithmeticServices;
}
const failure=(line:number,expression:string):never=>{throw new NativeObjectFoundationFailure('./Clump.h',line,3,expression);};
/** Both original event bodies cast the first member, cast it to Flame,
 * reload/check that same Clump index, then cast the second live member to
 * Candle. Keeping both lookups is essential when reflection mutates a Clump. */
function flameTargets(m:ModelBakeMemory,event:bigint,offset:bigint,index:number,clump:bigint,s:FlameEventServices){
 const object=(c:bigint)=>{const out=s.castObject(m.read64(m.read64(c+8n)+BigInt(index)*8n));if(!out)failure(71,'ret');return out;};
 const flame=s.castFlame(object(clump));
 const live=m.read64(event+offset);if(index>=m.read32(live+16n))failure(54,'idx < size');
 const candle=s.castCandle(object(live));
 const record=candle?m.read64(candle+0x90n):0n;
 return {flame:candle?m.read64(m.read64(record+64n)+16n):flame,candle,record,directFlame:flame};
}
export function enableOriginalSetFlame(m:ModelBakeMemory,event:bigint){m.write32(event+76n,0);}
/** Whole SetFlame.Update 0x100343280. Audio/Meta casts and real Candle
 * records remain explicit services/dependencies; no records are synthesized. */
export function updateOriginalSetFlame(m:ModelBakeMemory,event:bigint,game:bigint,debugScaleBits:number|undefined,s:FlameEventServices){
 const a=natureArithmetic(s.arithmetic),elapsed=a.add(originalNatureDelta(m,game,debugScaleBits,a),m.read32(event+76n));m.write32(event+76n,elapsed);
 let clump=m.read64(event+64n),count=m.read32(clump+16n);
 for(let i=0;i<count;i++){
  // Original snapshots clock, delay and duration before the reflection calls.
  const delta=originalNatureDelta(m,game,debugScaleBits,a),delay=a.mul(bits(i),m.read32(event+72n)),duration=m.read32(event+60n),frameElapsed=m.read32(event+76n);
  const target=flameTargets(m,event,64n,i,clump,s),flame=target.flame;
  const previous=a.min(duration,a.max(0,a.sub(a.sub(frameElapsed,delta),delay))),current=a.min(duration,a.max(0,a.sub(frameElapsed,delay)));
  const liveDuration=m.read32(event+60n);
  if(value(liveDuration)>0){
   const intensity=m.bytes(event+56n,1)[0]?a.add(a.div(a.mul(current,0x3f666666),liveDuration),0x3dcccccd):a.sub(0x3f666666,a.div(a.mul(0x3f666666,m.read32(event+76n)),liveDuration));
   m.write32(flame+0x110n,intensity);
   if(value(intensity)<=0&&m.bytes(flame+182n,1)[0])s.extinguish(flame,1);
  }
  const endDuration=m.read32(event+60n),d=value(endDuration),p=value(previous),c=value(current);
  if(c>=d&&!(p===c&&d!==0)){
   if(m.bytes(event+56n,1)[0]){m.write8(flame+182n,1);m.write32(flame+0x110n,0x3f800000);m.write8(flame+185n,1);}
   else s.extinguish(flame,1);
   if(target.candle){const lit=m.bytes(event+56n,1)[0];m.write8(m.read64(target.candle+0x90n)+97n,lit);m.write8(target.candle+161n,lit);}
  }
  clump=m.read64(event+64n);count=m.read32(clump+16n);
 }
 if(value(m.read32(event+76n))>=value(a.add(a.mul(bits(count),m.read32(event+72n)),m.read32(event+60n))))s.start(event);
}
/** Whole OnFlame.Update 0x100342910. Completion may request an arbitrary
 * reflected Object, then consumes the second live set in original order. */
export function updateOriginalOnFlame(m:ModelBakeMemory,event:bigint,s:FlameEventServices){
 const a=natureArithmetic(s.arithmetic);let clump=m.read64(event+56n),count=m.read32(clump+16n),complete=m.bytes(event+73n,1)[0]?bits(count):0;
 for(let i=0;i<count;i++){
  const {flame}=flameTargets(m,event,56n,i,clump,s);if(!flame)throw new NativeObjectFoundationFailure('FlameBarn.cpp',1296,3,'flame');
  if(m.bytes(event+73n,1)[0]){
   let matches:boolean;
   if(m.bytes(event+75n,1)[0])matches=!m.bytes(flame+182n,1)[0];
   else {const active=m.bytes(event+72n,1)[0]?m.bytes(flame+0x138n,1)[0]:m.bytes(flame+182n,1)[0];matches=!!active&&!!(s.getFlameEnabled(flame)&255);}
   if(!matches)complete=a.add(complete,0xbf800000);
  }else if(s.getFlameEnabled(flame)&255){
   const matches=m.bytes(event+72n,1)[0]?!!m.bytes(flame+0x138n,1)[0]:m.bytes(event+75n,1)[0]?!m.bytes(flame+182n,1)[0]:!!m.bytes(flame+182n,1)[0];
   if(matches){complete=0x3f800000;break;}
  }
  clump=m.read64(event+56n);count=m.read32(clump+16n);
 }
 const all=m.bytes(event+73n,1)[0],threshold=a.mul(bits(m.read32(m.read64(event+56n)+16n)),m.read32(event+80n)),ceil=Number.isNaN(value(threshold))?(threshold|0x400000)>>>0:bits(Math.ceil(value(threshold)));
 if(all?!(value(complete)>=value(ceil)):value(complete)!==1)return;
 s.setObjectEnabled(m.read64(event+64n),1);
 if(!m.bytes(event+75n,1)[0]){
  clump=m.read64(event+56n);count=m.read32(clump+16n);
  for(let i=0;i<count;i++){
   const target=flameTargets(m,event,56n,i,clump,s);
   if(target.candle){
    const flame=target.flame;m.write8(flame+182n,1);const duration=m.read32(event+76n);
    if(value(duration)>0){m.write8(target.record+96n,1);m.write32(target.record+84n,duration);m.write32(target.record+88n,0);m.write32(flame+0x10cn,0x3f000000);m.write8(flame+0x138n,1);}
   }
   if(target.directFlame){
    const flame=target.directFlame;m.write8(flame+182n,1);const duration=m.read32(event+76n);
    if(value(duration)>0){m.write8(flame+184n,1);m.write32(flame+160n,duration);m.write32(flame+0x10cn,0x3f000000);m.write8(flame+0x138n,1);}
   }
   clump=m.read64(event+56n);count=m.read32(clump+16n);
  }
 }
 if(m.bytes(event+74n,1)[0]){m.write8(event+84n,1);s.start(event);}
}
/** Whole SetFlameOccIntensity.Update 0x1003439a0. */
export function updateOriginalSetFlameOccIntensity(m:ModelBakeMemory,event:bigint,game:bigint,start:(p:bigint)=>void){m.write32(m.read64(game+0x418n)+12n,m.read32(event+56n));start(event);}
