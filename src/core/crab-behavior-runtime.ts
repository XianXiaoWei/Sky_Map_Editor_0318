import type {ModelBakeMemory} from './model-baked-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';

export interface CrabBehaviorServices {
 /** Original Object** metadata conversions, including post-call references. */
 castCrab(memory:ModelBakeMemory,reference:bigint):bigint;
 castMarker(memory:ModelBakeMemory,reference:bigint):bigint;
 motionState(object:bigint):Uint8Array;
 transform(marker:bigint):Uint8Array;
 heightThresholdBits:number;
 arithmetic?:NatureArithmeticServices;
}
const sqrt=(n:number)=>(n&0x7fffffff)>0x7f800000?(n|0x400000)>>>0:value(n)<0?0xffc00000:bits(Math.sqrt(value(n)));
/** Whole CrabAi behavior evaluator 0x100258790, including all eleven jump
 * table entries and default states. This scores a real candidate; it does
 * not choose a target or construct a replacement game owner. */
export function evaluateOriginalCrabBehavior(m:ModelBakeMemory,ai:bigint,record:bigint,s:CrabBehaviorServices){
 const a=natureArithmetic(s.arithmetic),vec=(p:bigint)=>[0,4,8,12].map(n=>m.read32(p+BigInt(n))),from=(v:Uint8Array,at:number)=>{const d=new DataView(v.buffer,v.byteOffset,v.byteLength);return [0,4,8,12].map(n=>d.getUint32(at+n,true));};
 const length=(v:number[],four=false)=>{const sq=v.map(n=>a.mul(n,n));return sqrt(four?a.add(a.add(sq[0],sq[2]),a.add(sq[1],sq[3])):a.add(sq[2],a.add(sq[0],sq[1])));};
 const distance=(x:number[],y:number[])=>length(x.map((n,i)=>a.sub(n,y[i]))),clamp=(n:number)=>a.min(0x3f800000,a.max(0,n));
 const smooth=(n:number)=>{const cube=a.mul(n,a.mul(n,n));return a.mul(cube,a.add(a.mul(n,a.add(a.mul(n,0x40c00000),0xc1700000)),0x41200000));};
 const inverse=(n:number)=>a.sub(0x3f800000,smooth(clamp(n)));
 const crab=m.read64(ai+16n),position=vec(crab+16n),ownRadius=m.read32(crab+0x60n),ownSpeed=m.read32(crab+0x64n),ownParams=m.read64(crab+0x80n);
 let cast=0n,target:number[],velocity:number[],radius:number;
 if(m.read64(record+8n)){
  cast=s.castCrab(m,record+8n);const motion=s.motionState(m.read64(record+8n));
  target=from(motion,0);velocity=from(motion,64);radius=new DataView(motion.buffer,motion.byteOffset,motion.byteLength).getUint32(80,true);
 }else{target=vec(record+32n);velocity=[0,0,0,0];radius=0x3f800000;}
 const kind=m.read32(record);
 if(kind===1){
  const limit=value(a.sub(target[1],position[1]))<value(s.heightThresholdBits)?0x41200000:0;
  return inverse(a.mul(a.add(a.sub(limit,distance(target,position)),0xbf800000),0xbf000000));
 }
 if(kind===2){
  const different=!cast||m.read64(cast+0x80n)!==ownParams;
  let size:number;
  if(0>=value(ownRadius))size=bits(value(ownRadius)<=value(radius)?1:0);
  else size=inverse(a.div(a.sub(a.sub(radius,ownRadius),ownRadius),a.sub(ownRadius^0x80000000,ownRadius)));
  if(!different)size=0;
  const speed=clamp(a.mul(a.add(a.sub(length(velocity),ownSpeed),0xbf800000),0xbf000000));
  size=a.mul(size,a.add(a.mul(smooth(speed),0xbf400000),0x3f800000));
  return a.mul(inverse(a.div(a.add(a.sub(0x40800000,distance(target,position)),0xc0200000),0xc0a00000)),size);
 }
 if(kind===3){
  const marker=s.castMarker(m,record+8n),current=m.read32(ai+0x50n);if(!marker)return current===3?0x3f800000:0;
  const first=s.transform(marker),range=distance(from(first,48),position),second=s.transform(marker),extent=length(from(second,32),true);
  const score=inverse(a.div(a.add(a.sub(a.add(extent,extent),range),0xc0400000),0xc0c00000));return current===3?0x3f800000:score;
 }
 if(kind===4)return inverse(a.div(a.add(a.add(distance(vec(ai+48n),position),0xc0a00000),0xc0400000),0xc0c00000));
 if(kind===9){
  const same=m.read32(ai+0x50n)===9&&m.read32(ai+0x60n)===m.read32(record+16n),actor=m.read64(ai+24n),flame=m.read64(ai+32n);
  if(!actor&&!flame)return 0;
  const score=inverse(a.mul(a.add(a.sub(0x41000000,distance(vec(actor?actor+16n:flame+0xc0n),position)),0xc0000000),0xbe800000));
  if(same)return score;
  const count=bits(m.read32(ai+0x64n));return a.mul(score,inverse(a.mul(a.add(a.sub(0x40000000,count),0xbf800000),0xbf000000)));
 }
 if(kind===11){
  const candidate=s.castCrab(m,record+8n);let same=false;
  if(m.read32(ai+0x50n)===11)same=s.castCrab(m,ai+0x58n)===candidate;
  const motion=s.motionState(m.read64(record+8n)),score=inverse(a.mul(a.add(a.add(distance(from(motion,0),position),0xc0800000),0xc0000000),0xbe800000));
  if(same)return score;
  const count=bits(m.read32(candidate+0x78n)|0),gate=a.div(a.add(a.sub(0x3fa66666,count),0xbf4ccccd),0xbfcccccd);
  return a.mul(score,inverse(gate));
 }
 return 0x3f800000;
}

export interface CrabCandidateServices {
 arithmetic?:NatureArithmeticServices;
 /** Original external asinf dependency, with the exact float32 argument. */
 asin(argumentBits:number):number;
 /** Evaluate the private native-stack record. Casts can update its target
  * reference without changing the original candidate or saved winner. */
 evaluate(ai:bigint,record:Uint8Array):number;
}
/** Whole CrabAi candidate comparison 0x100258f00. The caller supplies the
 * actual best record; ties replace it, unordered scores leave it intact.
 * Full neighborhood enumeration and state transitions remain separate. */
export function considerOriginalCrabBehavior(m:ModelBakeMemory,ai:bigint,best:bigint,record:bigint,s:CrabCandidateServices){
 const a=natureArithmetic(s.arithmetic),kind=m.read32(record),params=m.read64(ai+8n);
 const offset=kind>=1&&kind<=9?0x10+kind*16:kind===11?0xb0:0;
 const weight=offset?m.read32(params+BigInt(offset)):0,period=offset?m.read32(params+BigInt(offset+4)):0;
 const duration=m.read32(record+48n),twice=a.add(period,period),remaining=a.div(a.sub(twice,value(duration)===0?0x7f7fffff:duration),twice);
 const smooth=(n:number)=>a.mul(a.mul(n,a.mul(n,n)),a.add(a.mul(n,a.add(a.mul(n,0x40c00000),0xc1700000)),0x41200000));
 const clamp=(n:number)=>a.min(0x3f800000,a.max(0,n));
 const baseWeight=a.mul(smooth(clamp(m.read32(ai+0x94n+BigInt(kind)*4n))),weight);
 const timeWeight=smooth(clamp(remaining));
 const saved=new Uint8Array(52);saved.set(m.bytes(record,24),0);saved.set(m.bytes(record+32n,16),32);
 new DataView(saved.buffer).setUint32(48,duration,true);
 const seed=m.read32(ai+64n);m.write32(ai+64n,(seed+1)>>>0);
 const mixed=(seed^(seed<<13))>>>0,random=(Math.imul((Math.imul(Math.imul(mixed,mixed),0x3d73)+0xc0ae5)|0,mixed)+0x5208dd0d)&0x7fffffff;
 const unit=a.mul(a.add(a.add(a.mul(bits(random),0xb0800000),0x3f800000),0x3f800000),0x3f000000);
 const angle=s.asin(a.add(unit,a.sub(unit,0x3f800000)));
 const randomWeight=bits(value(a.mul(angle,0x3f000000))*0.6366197723675814+1);
 const metric=a.add(a.mul(randomWeight,baseWeight),a.mul(weight,timeWeight));
 // The evaluator gets a second snapshot after the math callback; only the
 // earlier snapshot is committed when this candidate wins.
 const evaluated=new Uint8Array(52);evaluated.set(m.bytes(record,24),0);evaluated.set(m.bytes(record+32n,16),32);
 new DataView(evaluated.buffer).setUint32(48,duration,true);
 const score=a.mul(s.evaluate(ai,evaluated),metric);
 if(value(score)>=value(m.read32(best+64n))){
  m.write32(best+64n,score);m.write64(best+16n,new DataView(saved.buffer).getBigUint64(16,true));
  m.bytes(best,16).set(saved.subarray(0,16));m.bytes(best+32n,16).set(saved.subarray(32,48));m.write32(best+48n,duration);
 }
}

export interface CrabMetricServices {
 arithmetic?:NatureArithmeticServices;
 debugScaleBits?:number;
 evaluate(ai:bigint,record:Uint8Array):number;
}
/** Whole CrabAi per-state metric update 0x1002591f0. The active state's
 * score decays with its actual behavior score; all others recover using
 * their own parameter interval. State and params are reloaded each turn. */
export function updateOriginalCrabBehaviorMetrics(m:ModelBakeMemory,ai:bigint,game:bigint,s:CrabMetricServices){
 const a=natureArithmetic(s.arithmetic),clock=m.read64(game+0x160n);
 const delta=a.min(0x3e883127,a.max(0x38d1b717,a.mul(a.mul(s.debugScaleBits??0x3f800000,m.read32(clock+32n)),m.read32(clock+20n))));
 const halfDelta=a.mul(delta,0x3f000000);
 for(let kind=1;kind<=11;kind++){
  const offset=kind<=9?0x10+kind*16:kind===11?0xb0:0,params=m.read64(ai+8n);
  const activePeriod=offset?m.read32(params+BigInt(offset+4)):0,recoveryPeriod=offset?m.read32(params+BigInt(offset+8)):0;
  const destination=ai+0x94n+BigInt(kind*4);let metric:number;
  if(m.read32(ai+80n)===kind){
   const record=new Uint8Array(52);record.set(m.bytes(ai+80n,24),0);record.set(m.bytes(ai+112n,16),32);
   new DataView(record.buffer).setUint32(48,m.read32(ai+128n),true);
   const behavior=s.evaluate(ai,record),decay=a.div(a.mul(halfDelta,behavior),a.max(activePeriod,0x358637bd));
   metric=a.sub(m.read32(destination),decay);
  }else metric=a.add(a.div(halfDelta,a.max(recoveryPeriod,0x358637bd)),m.read32(destination));
  m.write32(destination,metric);m.write32(destination,a.min(0x3f800000,a.max(0,metric)));
 }
}
