import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {natureArithmetic,type NatureArithmeticServices} from './nature-event-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
import {updateOriginalBirdV2,type BirdUpdateServices} from './bird-update-runtime';
import evidence from '../../docs/bird-target-native.json';
export interface BirdTargetServices {
 random():number;
 castMarker(object:bigint):bigint;
 enabled(marker:bigint):number;
 transform(marker:bigint):Uint8Array;
 arithmetic?:NatureArithmeticServices;
}
/** Whole ordinary SelectNextTarget 0x1001a29d0. Lead targets use the
 * avatar position and end-direction test; seek/land targets are sampled
 * by Marker volume. This is separate from the perch selector below. */
export function selectOriginalBirdNextTarget(m:ModelBakeMemory,bird:bigint,avatar:bigint,s:Pick<BirdTargetServices,'random'|'castMarker'|'enabled'|'arithmetic'>){
 const a=natureArithmetic(s.arithmetic),params=m.read64(bird+0xe8n),lead=m.read64(params+48n);
 const position=(p:bigint)=>[0,4,8,12].map(k=>m.read32(p+BigInt(k))),sum=(q:number[])=>a.add(q[2],a.add(q[0],q[1]));
 const markerAt=(clump:bigint,i:number)=>{
  if(i>=m.read32(clump+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');
  const marker=s.castMarker(m.read64(m.read64(clump+8n)+BigInt(i*8)));
  if(!marker)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');return marker;
 };
 const assign=(marker:bigint,landing:number,leading:boolean)=>{
  const target=s.castMarker(marker+8n);m.write64(bird+0xf8n,target);m.write8(bird+0x100n,landing);m.write8(bird+0x128n,0);
  if(leading)m.write64(bird+0x130n,marker);
  const r=a.mul(bits(s.random()|0),0x30000000);
  m.write32(bird+0x50cn,a.add(a.mul(r,bits(33)),a.mul(a.sub(0x3f800000,r),bits(13))));
 };
 if(lead&&m.read32(lead+16n)){
  const player=position(m.read64(avatar+24n)+16n),fallback=m.read64(params+56n);let selected=0n,closest=0x7f7fffff;
  for(let i=0;i<m.read32(m.read64(params+48n)+16n);i++){
   const marker=markerAt(m.read64(params+48n),i);if(!(s.enabled(marker)&255))continue;
   const point=position(marker+16n),offset=point.map((v,k)=>a.sub(v,player[k])),end=m.read64(params+56n);
   if(end&&value(sum(position(end+16n).map((v,k)=>a.mul(a.sub(v,point[k]),offset[k]))))<0)continue;
   const distance=sum(offset.map(v=>a.mul(v,v)));if(value(closest)>value(distance))selected=marker;
   closest=a.min(distance,closest);
  }
  if(selected||fallback){assign(selected||fallback,0,true);return;}
 }
 const seek=m.read64(params+8n),land=m.read64(params+16n),seekCount=seek?m.read32(seek+16n):0,landCount=land?m.read32(land+16n):0;
 const candidates:{marker:bigint;weight:number;landing:number}[]=[];let total=0;
 for(let i=0;i<seekCount+landCount;i++){
  const landing=Number(i>=seekCount),marker=markerAt(m.read64(params+BigInt(landing?16:8)),landing?i-seekCount:i);
  if(!(s.enabled(marker)&255))continue;
  const weight=a.mul(a.mul(m.read32(marker+48n),m.read32(marker+52n)),m.read32(marker+56n));
  candidates.push({marker,weight,landing});total=a.add(total,weight);
 }
 const sample=s.random()|0;if(!candidates.length)return;
 const r=a.mul(bits(sample),0x30000000);let remaining=a.add(a.mul(r,total),a.mul(a.sub(0x3f800000,r),0));
 for(const candidate of candidates){remaining=a.sub(remaining,candidate.weight);if(value(remaining)<=0){assign(candidate.marker,candidate.landing,false);return;}}
}
/** Whole 0x1001a2770, including original EAX high bits on success. Its
 * caller consumes AL; this preserves that ABI instead of returning a bool. */
export function selectOriginalBirdTarget(m:ModelBakeMemory,ai:bigint,timer:bigint,s:BirdTargetServices){
 const a=natureArithmetic(s.arithmetic),c=evidence.constants,params=m.read64(ai+8n);
 if(!m.read64(params+24n))return 0;
 const chance=m.read32(params+132n),first=a.mul(bits(s.random()|0),c.randomScale);
 if(!(value(chance)>value(first)))return 0;
 const count=m.read32(m.read64(params+24n)+16n),accepted:bigint[]=[];
 for(let i=0;i<count;i++){
  const clump=m.read64(params+24n);
  if(i>=m.read32(clump+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');
  const marker=s.castMarker(m.read64(m.read64(clump+8n)+BigInt(i)*8n));
  if(!marker)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
  if(s.enabled(marker)&255)accepted.push(marker);
 }
 if(!accepted.length)return 0;
 const scaled=a.mul(a.mul(bits(s.random()|0),c.randomScale),c.selectionScale),n=value(scaled);
 const integer=Number.isFinite(n)&&n>=-2147483648&&n<2147483648?Math.trunc(n):-2147483648;
 const product=Math.imul(accepted.length,integer),wide=BigInt(product)*0x14f8b589n,index=Number(BigInt.asIntN(32,(wide>>45n)+(BigInt.asUintN(64,wide)>>63n)));
 if(index<0||index>=accepted.length)throw new Error('Original Bird target index is outside its initialized candidate scratch');
 const matrix=s.transform(accepted[index]);m.bytes(ai+48n,16).set(matrix.subarray(48,64));m.write8(ai+32n,1);m.write8(ai+72n,1);m.write64(ai+24n,0n);
 const r=a.mul(bits(s.random()|0),c.randomScale);m.write32(timer,a.add(a.mul(r,c.delayHigh),a.mul(a.sub(0x3f800000,r),c.delayLow)));
 return ((product&0xffffff00)|1)>>>0;
}
/** Uses the actual restored target body inside the ordinary update caller.
 * Remaining movement, animation and effect dependencies stay explicit. */
export function updateOriginalBirdV2WithTargetSelection(m:ModelBakeMemory,p:bigint,game:bigint,s:Omit<BirdUpdateServices,'validateTarget'> & {targetSelection:BirdTargetServices}){
 updateOriginalBirdV2(m,p,game,{...s,validateTarget:(ai,timer)=>selectOriginalBirdTarget(m,ai,timer,s.targetSelection)});
}
