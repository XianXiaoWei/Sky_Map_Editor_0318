import {sampleCloudDistance,type CloudDistanceField} from './cloud-volume';
import {sampleCloudNoise} from './volu';
const f=Math.fround,add=(a:number,b:number)=>f(f(a)+f(b)),mul=(a:number,b:number)=>f(f(a)*f(b));
export interface CloudAvatarQueryState {time:number;undulationScale:number;radius:number;enabled:boolean;}
// Complete original 0x1002149c0 with r8=0 (the actual Avatar call).
// Trig arguments/accumulation use the original mixture of double and float.
// The CPU distance field is separate from the GPU noise field.
export function queryCloudAvatar(field:CloudDistanceField|undefined,position:number[],state:CloudAvatarQueryState,sin:(v:number)=>number=v=>f(Math.sin(v)),sample:(p:number[])=>number=p=>sampleCloudDistance(field!,p)) {
 return queryCloud(field,position,state,sin,sample);
}
// CloudBarn::Update invokes the same query with r8=1. Only an available
// surface query samples CPU noise, at the undulated position minus scroll.
export function queryCloudCamera(field:CloudDistanceField|undefined,position:number[],state:CloudAvatarQueryState,scroll:number[],noise:{dimensions:number[];data:Uint8Array}|undefined,sin:(v:number)=>number=v=>f(Math.sin(v)),sample:(p:number[])=>number=p=>sampleCloudDistance(field!,p)) {
 if(scroll.length!==3||!scroll.every(v=>Number.isFinite(f(v))))throw new Error('相机云噪声偏移无效');
 return queryCloud(field,position,state,sin,sample,p=>{if(!noise)throw new Error('相机云查询缺少原噪声');return sampleCloudNoise(noise,p.map((v,i)=>f(v-f(scroll[i]))));});
}
// Original Update instructions 0x100212727..0x10021277c retain xmm0 as the
// positive query distance; its negation is written only to a scratch slot.
export function cloudCameraNoiseTweaks(distance:number,radius=2.5,translucentDepth=.5,sparkle=.15) {
 const depth=Math.max(f(radius),f(.001));
 return [depth,f(f(distance)+depth),f(translucentDepth),f(sparkle)];
}
function queryCloud(field:CloudDistanceField|undefined,position:number[],state:CloudAvatarQueryState,sin:(v:number)=>number,sample:(p:number[])=>number,cameraNoise?:(p:number[])=>number) {
 if(position.length!==3||![...position,state.time,state.undulationScale,state.radius].every(v=>Number.isFinite(f(v)))||state.radius<0)throw new Error('玩家云查询输入无效');
 const [x,y,z]=position.map(f),time=f(state.time);
 const a=f(sin(f(time*.09325+(x*.2+y)*.13))),b=f(sin(f(time*.1865+(y*.2-z)*.065))),c=f(sin(f(time*.373+(z*.2-x)*.0325)));
 const offset=f(a*.25+b*.5+c),samplePosition=[x,add(y,add(mul(add(offset,-1),state.undulationScale),mul(add(offset,-1),state.undulationScale))),z];
 const normal=[-0,-1,-0],fallback=add(mul(state.radius,.8),-4);
 if(!field||!state.enabled||!field.distanceResolution)return {available:false,distance:fallback,normal,samplePosition};
 const raw=f(sample(samplePosition));
 if(raw>=4)return {available:false,distance:fallback,normal,samplePosition};
 if(raw<=-6)return {available:false,distance:add(mul(state.radius,.8),6),normal,samplePosition};
 const step=f(16/field.distanceResolution),gradient=[0,1,2].map(lane=>{
  const positive=samplePosition.slice(),negative=samplePosition.slice();positive[lane]=add(positive[lane],step);negative[lane]=add(negative[lane],-step);
  return f(f(sample(positive))-f(sample(negative)));
 });
 const squared=gradient.map(v=>mul(v,v)),length=f(Math.sqrt(add(squared[2],add(squared[0],squared[1]))));
 const inward=length>f(1e-5)?gradient.map(v=>f(-f(v/length))):[-0,-1,-0];
 return {available:true,distance:f(mul(state.radius,cameraNoise?cameraNoise(samplePosition):.8)-raw),normal:inward,samplePosition};
}
