import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
type Memory=Omit<ModelBakeMemory,'string'>;
const f=Math.fround,mul=(a:number,b:number)=>f(f(a)*f(b)),add=(a:number,b:number)=>f(f(a)+f(b)),read=(m:Memory,p:bigint)=>value(m.read32(p));
const radius=(matrix:Uint8Array)=>{const v=new DataView(matrix.buffer,matrix.byteOffset,matrix.byteLength),x=v.getFloat32(0,true),y=v.getFloat32(4,true),z=v.getFloat32(8,true);return f(Math.sqrt(add(mul(z,z),add(mul(x,x),mul(y,y)))));};
export interface DropOcclusionRecord {type:number;maxSize:number;radius:number;intensity:number;sharpness:number;position:Uint8Array;tint:Uint8Array;}
export interface DropOcclusionServices {
 castObject(object:bigint):bigint;
 getTransform(object:bigint):Uint8Array;
 getEnabled(object:bigint):boolean;
 delta():number;
 math(operation:'logf'|'expf',inputBits:number):number;
 emit(record:DropOcclusionRecord):void;
 /** Original verbose ostream diagnostic is a separate logging dependency. */
 oversized(radius:number,maxSize:number):void;
}
/** Complete ordinary Load/Unload bodies 0x1002ce410/460. The alpha
 * allocation is separate from the saved fields and reset on every load. */
export function loadOriginalDropOcclusion(m:Memory,event:bigint,heap:bigint,allocate:(heap:bigint,size:number,alignment:number)=>bigint){
 const size=m.read32(m.read64(event+56n)+16n)*4,out=allocate(heap,size,16);m.write64(event+120n,out);
 m.bytes(out,m.read32(m.read64(event+56n)+16n)*4).fill(0);
}
export function unloadOriginalDropOcclusion(m:Memory,event:bigint,heap:bigint,release:(heap:bigint,pointer:bigint)=>void){release(heap,m.read64(event+120n));m.write64(event+120n,0n);}
/** Normal OnEnabled 0x1002ce490: validate each original Object transform,
 * issue the original oversize diagnostic, and reset every member alpha. */
export function enableOriginalDropOcclusion(m:Memory,event:bigint,s:DropOcclusionServices){
 if(!m.read32(m.read64(event+56n)+16n))return;
 for(let index=0;;index++){
  const object=s.castObject(m.read64(m.read64(m.read64(event+56n)+8n)+BigInt(index*8)));
  if(!object)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
  const rad=radius(s.getTransform(object)),max=read(m,event+80n);if(rad>max)s.oversized(rad,max);
  m.write32(m.read64(event+120n)+BigInt(index*4),0);if(index+1>=m.read32(m.read64(event+56n)+16n))return;
 }
}
/** Complete normal Update 0x1002ce7b0. The original smooth enable math
 * converts logf through double / (1/30) before multiplying scaled delta.
 * Fade state and all saved fields are re-read after the math boundaries. */
export function updateOriginalDropOcclusion(m:Memory,event:bigint,s:DropOcclusionServices){
 if(!m.read32(m.read64(event+56n)+16n))return;
 for(let index=0;;index++){
  const object=s.castObject(m.read64(m.read64(m.read64(event+56n)+8n)+BigInt(index*8)));
  if(!object)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
  const enabled=s.getEnabled(object);let alpha=Number(enabled);
  if(m.bytes(event+112n,1)[0]){
   const snap=read(m,event+BigInt(enabled?104:108)),delta=s.delta(),normalized=Math.min(1,Math.max(0,f(snap/30))),log=value(s.math('logf',bits(f(1-normalized)))),rate=f(log/(1/30)),decay=value(s.math('expf',bits(mul(rate,delta)))),blend=f(1-decay),old=read(m,m.read64(event+120n)+BigInt(index*4));alpha=add(mul(blend,Number(enabled)),mul(f(1-blend),old));
  }
  m.write32(m.read64(event+120n)+BigInt(index*4),bits(alpha));
  if(alpha>0){
   const matrix=s.getTransform(object),v=new DataView(matrix.buffer,matrix.byteOffset,matrix.byteLength),rad=radius(matrix),float=m.read64(event+88n),intensity=read(m,float?float+16n:event+84n),result=mul(mul(intensity,read(m,event+116n)),read(m,m.read64(event+120n)+BigInt(index*4)));
   s.emit({type:m.read32(event+100n),maxSize:read(m,event+80n),radius:rad,intensity:result,sharpness:read(m,event+96n),position:new Uint8Array(matrix.subarray(48,64)),tint:new Uint8Array(m.bytes(event+64n,16))});
  }
  if(index+1>=m.read32(m.read64(event+56n)+16n))return;
 }
}
