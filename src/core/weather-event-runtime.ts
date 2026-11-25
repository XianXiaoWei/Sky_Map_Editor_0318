import type {ModelBakeMemory} from './model-baked-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {transformNativeObb} from './marker-transform-runtime';
import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
const f=Math.fround,add=(a:number,b:number)=>f(f(a)+f(b)),sub=(a:number,b:number)=>f(f(a)-f(b)),mul=(a:number,b:number)=>f(f(a)*f(b)),div=(a:number,b:number)=>f(f(a)/f(b));
const vec=(b:Uint8Array)=>{const v=new DataView(b.buffer,b.byteOffset,b.byteLength);return Array.from({length:4},(_,i)=>v.getFloat32(i*4,true));};
const pack=(v:number[])=>{const b=new Uint8Array(v.length*4),d=new DataView(b.buffer);v.forEach((n,i)=>d.setUint32(i*4,Number.isNaN(n)?0xffc00000:bits(n),true));return b;};
const words=(b:Uint8Array)=>{const d=new DataView(b.buffer,b.byteOffset,b.byteLength);return Array.from({length:b.length/4},(_,i)=>d.getUint32(i*4,true));};
const packWords=(v:number[])=>{const b=new Uint8Array(v.length*4),d=new DataView(b.buffer);v.forEach((n,i)=>d.setUint32(i*4,n,true));return b;};
const nan=(n:number)=>(n&0x7fffffff)>0x7f800000;
export interface WeatherArithmeticServices {resolveDualNaN(op:'add'|'sub'|'mul'|'div',a:number,b:number):number;}
function arithmetic(s?:WeatherArithmeticServices){
 const calc=(op:'add'|'sub'|'mul'|'div',a:number,b:number)=>{
  if(nan(a)&&nan(b)&&a!==b){if(s)return s.resolveDualNaN(op,a,b);throw new Error('Weather dual-NaN propagation requires a verified arithmetic service');}
  if(nan(a))return (a|0x400000)>>>0;if(nan(b))return (b|0x400000)>>>0;
  const x=value(a),y=value(b),n=op==='add'?x+y:op==='sub'?x-y:op==='mul'?x*y:x/y;return Number.isNaN(n)?0xffc00000:bits(n);
 };
 return {add:(a:number,b:number)=>calc('add',a,b),sub:(a:number,b:number)=>calc('sub',a,b),mul:(a:number,b:number)=>calc('mul',a,b),div:(a:number,b:number)=>calc('div',a,b),sqrt:(a:number)=>nan(a)?(a|0x400000)>>>0:value(a)<0?0xffc00000:bits(Math.sqrt(value(a)))};
}
/** The original vpermilpd/vaddss/vsqrtss followed by vpermilps 0xc0
 * produces [length,length,length,y*y], not four copies of length. */
function normalizeWords(v:number[],a:ReturnType<typeof arithmetic>){const square=v.map(n=>a.mul(n,n)),n=a.sqrt(a.add(square[2],a.add(square[0],square[1])));return value(n)>f(.00001)?v.map((x,i)=>a.div(x,i===3?square[1]:n)):v;}
const length=(v:number[])=>f(Math.sqrt(add(add(mul(v[0],v[0]),mul(v[1],v[1])),mul(v[2],v[2]))));
/** Original point-in-OBB 0x10078ccc0. Boundaries are inclusive; zero axes
 * retain their original coordinates, and unordered comparisons stay native. */
export function originalPointInObb(point:Uint8Array,obb:Uint8Array):boolean {
 const p=vec(point),v=new DataView(obb.buffer,obb.byteOffset,obb.byteLength),axes=Array.from({length:3},(_,i)=>Array.from({length:4},(_,j)=>v.getFloat32(i*16+j*4,true))),center=Array.from({length:4},(_,i)=>v.getFloat32(48+i*4,true)),d=p.map((x,i)=>sub(x,center[i]));
 return axes.every(axis=>{const n=length(axis),unit=n>f(.00001)?axis.map(x=>div(x,n)):axis,dot=add(add(mul(d[0],unit[0]),mul(d[1],unit[1])),mul(d[2],unit[2]));return !(Math.abs(dot)>n);});
}
export interface SetWindServices {
 avatar(manager:bigint):bigint;
 castRegion(object:bigint):bigint;
 getRegionTransform(region:bigint):Uint8Array;
 getRegionObb(region:bigint):Uint8Array;
 start(event:bigint):void;
 arithmetic?:WeatherArithmeticServices;
}
/** Complete normal SetWind.Update 0x100593ba0. Regional mode averages
 * negative Z axes only for containing regions; an empty/no-hit set leaves
 * global wind intact. Direct/target vectors normalize before force scaling. */
export function updateOriginalSetWind(m:ModelBakeMemory,event:bigint,game:bigint,s:SetWindServices):void {
 const a=arithmetic(s.arithmetic);
 if(m.bytes(event+104n,1)[0]&&m.read64(event+96n)){
  const avatar=s.avatar(m.read64(game+0x280n));
  let clump=m.read64(event+96n);
  if(m.read32(clump+16n)){
   const position=new Uint8Array(m.bytes(m.read64(avatar+24n)+16n,16));let sum=[0,0,0,0],count=0;
   for(let i=0;;i=(i+1)>>>0){
    const region=s.castRegion(m.read64(m.read64(clump+8n)+BigInt(i)*8n));
    if(!region)throw new NativeObjectFoundationFailure('./Clump.h',71,3,'ret');
    const transform=s.getRegionTransform(region),local=s.getRegionObb(region),world=transformNativeObb(transform,local);
    if(originalPointInObb(position,world)){const z=words(world.subarray(32,48)),direction=normalizeWords(z.map(x=>(x^0x80000000)>>>0),a);sum=sum.map((x,j)=>a.add(x,direction[j]));count=(count+1)>>>0;}
    clump=m.read64(event+96n);if(((i+1)>>>0)>=m.read32(clump+16n))break;
   }
   if(count){const owner=m.read64(game+0x2c8n),force=m.read32(event+56n);addOriginalWindOverride(m,owner,packWords(sum.map((x,i)=>a.mul(a.div(x,i===3?0:bits(count)),force))),s.arithmetic);}
  }
 }else{
  const force=m.read32(event+56n);
  let direction:number[];
  if(m.bytes(event+80n,1)[0]){const target=m.read64(event+88n),avatar=s.avatar(m.read64(game+0x280n));const p=words(m.bytes(m.read64(avatar+24n)+16n,16));direction=words(m.bytes(target+16n,16)).map((x,i)=>a.sub(x,p[i]));}
  else direction=words(m.bytes(event+64n,16));
  // Original captures the owner before normalization, then applies live sum.
  const owner=m.read64(game+0x2c8n);addOriginalWindOverride(m,owner,packWords(normalizeWords(direction,a).map((x,i)=>a.mul(i===3?0:force,x))),s.arithmetic);
 }
 if(m.bytes(event+105n,1)[0])s.start(event);
}
/** Original EnvironmentForces.AddWind 0x100328010. */
export function addOriginalWindOverride(m:ModelBakeMemory,owner:bigint,vector:Uint8Array,s?:WeatherArithmeticServices){const a=arithmetic(s),v=words(vector),b=words(m.bytes(owner+16n,16));m.bytes(owner+16n,16).set(packWords(v.map((x,i)=>a.add(b[i],x))));m.write8(owner+80n,1);}
/** Whole SetRainParams.OnEnabled 0x10056b170. Exact original derivative
 * packet: frequency, amount slope, intensity slope, fall-rate slope. */
export function enableOriginalSetRainParams(m:ModelBakeMemory,event:bigint,game:bigint,start:(p:bigint)=>void){
 const read=(p:bigint)=>new DataView(m.bytes(p,4).buffer,m.bytes(p,4).byteOffset,4).getFloat32(0,true),oscillation=read(event+64n);
 if(!(oscillation>f(.0001)))throw new NativeObjectFoundationFailure('Rain.cpp',950,3,'oscillationDuration > 0.0001f');
 const transition=read(event+72n);if(!(transition>f(.0001)))throw new NativeObjectFoundationFailure('Rain.cpp',951,3,'transitionDuration > 0.0001f');
 const rain=m.read64(game+0x3e0n),amount=sub(read(event+68n),read(rain+68n)),rate=read(event+56n),intensity=sub(read(event+60n),read(rain+60n)),fallRate=sub(rate,read(rain+20n));
 m.bytes(rain+72n,16).set(pack([div(1,oscillation),div(amount,transition),div(intensity,transition),div(fallRate,transition)]));m.write32(rain+88n,new DataView(pack([transition]).buffer).getUint32(0,true));m.write8(event+76n,1);start(event);
}
/** Whole SetOceanRender.Update 0x1004d8290; SetRainParams.Update is empty. */
export function updateOriginalSetOceanRender(m:ModelBakeMemory,event:bigint,game:bigint,start:(p:bigint)=>void){m.write8(m.read64(game+0x3d8n)+0x1390n,m.bytes(event+56n,1)[0]);start(event);}
export interface RainParameterServices {
 /** Existing emitter lookup. Creation/attachment of an absent emitter is a
  * separate dependency, before the parameter update in the original body. */
 existingEmitter(reference:bigint):bigint;
 avatar(barn:bigint):bigint;
 sinf(inputBits:number):number;
}
/** Rain.Update 0x100564fd3..0x1005651e7, up to camera-position sampling.
 * Covers the disabled return, original frame scaling/clamp, existing-emitter
 * lookup, phase wrap, three bounded transitions and periodic intensity.
 * Rain-drop geometry, collision, emitter creation and audio are later stages. */
export function updateOriginalRainParameters(m:ModelBakeMemory,rain:bigint,time:bigint,avatarBarn:bigint,debugScaleBits:number|undefined,s:RainParameterServices){
 if(!m.bytes(rain+56n,1)[0]){m.write32(rain+16n,0);return;}
 const a=arithmetic(),one=0x3f800000,scale=a.mul(m.read32(time+32n),debugScaleBits??one),rawDelta=a.mul(m.read32(time+20n),scale);
 const maxss=(x:number,y:number)=>value(x)>value(y)?x:y,minss=(x:number,y:number)=>value(x)<value(y)?x:y;
 const delta=minss(0x3e883127,maxss(0x38d1b717,rawDelta));
 if(!s.existingEmitter(rain+24n))throw new Error('Original Rain emitter creation/attachment service required before parameter update');
 const phase=a.add(a.mul(delta,m.read32(rain+72n)),m.read32(rain+64n)),phaseValue=value(phase),floor=Number.isNaN(phaseValue)?(phase|0x400000)>>>0:bits(Math.floor(phaseValue));m.write32(rain+64n,a.sub(phase,floor));
 const remaining=m.read32(rain+88n);if(value(remaining)>0){const used=minss(delta,remaining);for(const [destination,slope] of [[68,76],[60,80],[20,84]])m.write32(rain+BigInt(destination),a.add(a.mul(used,m.read32(rain+BigInt(slope))),m.read32(rain+BigInt(destination))));m.write32(rain+88n,a.sub(remaining,used));}
 s.avatar(avatarBarn);
 const argument=bits((value(m.read32(rain+64n))*Math.PI)*2),wave=a.add(a.mul(s.sinf(argument),0x3f000000),0x3f000000),modulation=a.sub(one,a.mul(wave,m.read32(rain+68n)));m.write32(rain+12n,a.mul(modulation,m.read32(rain+60n)));
}
