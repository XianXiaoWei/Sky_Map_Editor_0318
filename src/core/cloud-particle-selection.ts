const f=Math.fround,mul=(a:number,b:number)=>f(f(a)*f(b)),add=(a:number,b:number)=>f(f(a)+f(b));
export interface CloudParticleInteractionSource {
 // Original 192-byte temporary source: previous vec4 at +0; range terms
 // at +0x8c/+0x90. Queued sphere radius is a different field (+0x94).
 previous:number[];range8c:number;range90:number;
}
export interface CloudParticleCandidate {sourceIndex:number;offset:number[];distanceSquared:number;}
// Original 0x100226920..0x100226fc2. Compact in source order, make a
// max heap of up to three, replace only for a strictly closer candidate,
// then sort that heap. Equal keys move through the original left-child
// sift (including equality); a stable all-source sort changes the result.
export function selectCloudParticleSources(position:number[],sources:CloudParticleInteractionSource[]) {
 const finite=(v:number)=>Number.isFinite(v)&&Number.isFinite(f(v));
 if(position.length!==3||!position.every(finite)||sources.length>48||!sources.every(s=>s.previous.length===4&&s.previous.every(finite)&&finite(s.range8c)&&finite(s.range90)))throw new Error('原云粒子交互源输入无效');
 const candidates:CloudParticleCandidate[]=[];
 for(let sourceIndex=0;sourceIndex<sources.length;sourceIndex++) {
  const s=sources[sourceIndex],offset=[...position,0].map((v,i)=>f(f(v)-f(s.previous[i])));
  const distanceSquared=add(mul(offset[2],offset[2]),add(mul(offset[0],offset[0]),mul(offset[1],offset[1])));
  const range=mul(mul(1.5,s.range8c),s.range90),limit=mul(range,range);
  // Native ucomiss/setbe includes unordered products as well as equality.
  if(distanceSquared<=limit||Number.isNaN(distanceSquared)||Number.isNaN(limit))candidates.push({sourceIndex,offset,distanceSquared});
 }
 const selectedCount=Math.min(3,candidates.length);
 const sift=(root:number,count:number)=>{
  const value=candidates[root];let at=root;
  while(at*2+1<count) {
   let child=at*2+1;
   if(child+1<count&&candidates[child+1].distanceSquared>candidates[child].distanceSquared)child++;
   if(value.distanceSquared>candidates[child].distanceSquared)break;
   candidates[at]=candidates[child];at=child;
  }
  candidates[at]=value;
 };
 for(let root=Math.floor((selectedCount-2)/2);root>=0;root--)sift(root,selectedCount);
 for(let i=selectedCount;i<candidates.length;i++)if(candidates[0].distanceSquared>candidates[i].distanceSquared){[candidates[0],candidates[i]]=[candidates[i],candidates[0]];sift(0,selectedCount);}
 for(let count=selectedCount;count>1;count--){[candidates[0],candidates[count-1]]=[candidates[count-1],candidates[0]];if(count>2)sift(0,count-1);}
 return {candidates,selected:candidates.slice(0,selectedCount)};
}
