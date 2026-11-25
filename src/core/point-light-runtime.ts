import {numericFloatBits as bits,numericFloatValue as value} from './object-numeric-runtime';
const f=Math.fround,add=(a:number,b:number)=>f(f(a)+f(b)),mul=(a:number,b:number)=>f(f(a)*f(b)),div=(a:number,b:number)=>f(f(a)/f(b));
/** Ambience.Update 0x10005aa46..0x10005aa80, ordinary point-light
 * parameter prefix. The global multiplier defaults to the original 1.
 * Gameplay override branches later in Update remain separate. */
export function deriveOriginalPointLightUniform(color:number[],intensity:number,multiplier=1){
 if(color.length<3||!color.slice(0,3).every(Number.isFinite)||![intensity,multiplier].every(Number.isFinite))throw new Error('Point-light parameters incomplete');
 const scaled=mul(intensity,multiplier);return {intensity:scaled,color:color.slice(0,3).map(c=>div(mul(scaled,c),1000))};
}
/** Whole PointLight directional attenuation 0x100540ac0. Radius derives
 * from all four components of transform X; dot/output remains untouched
 * when the original body takes the zero-dot or distance cutoff return. */
export function originalPointLightAttenuation(xAxis:number[],a:number[],b:number[],distance:number){
 if([xAxis,a,b].some(v=>v.length!==4||!v.every(Number.isFinite))||!Number.isFinite(distance))throw new Error('PointLight attenuation input incomplete');
 const products=a.map((x,i)=>mul(x,b[i])),dot=Math.max(0,add(products[2],add(products[0],products[1])));
 if(dot===0)return {value:0,dot:undefined};
 const square=xAxis.map(x=>mul(x,x)),radius=mul(f(Math.sqrt(add(add(square[0],square[2]),add(square[1],square[3])))),.5),cutoff=mul(radius,999);
 if(f(distance)>=cutoff)return {value:0,dot:undefined};
 const ratio=div(distance,cutoff),soft=f(1-mul(ratio,ratio)),inverse=div(1,mul(add(div(div(distance,soft),radius),1),add(div(div(distance,soft),radius),1)));
 return {value:mul(dot,inverse),dot};
}
/** Preserve native scalar words, including the untouched fourth output lane
 * of the ordinary Ambience prefix (0/0 produces the native indefinite NaN). */
export function writeOriginalPointLightUniform(storage:Uint8Array,multiplier:number){
 const v=new DataView(storage.buffer,storage.byteOffset,storage.byteLength),out=deriveOriginalPointLightUniform(Array.from({length:4},(_,i)=>v.getFloat32(0x270+i*4,true)),v.getFloat32(0x280,true),multiplier);
 v.setUint32(0x280,bits(out.intensity),true);out.color.forEach((x,i)=>v.setUint32(0x2a0+i*4,bits(x),true));v.setUint32(0x2ac,0xffc00000,true);return out;
}
