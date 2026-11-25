import fs from 'node:fs';import {createRequire} from 'node:module';import assert from 'node:assert/strict';
import {readResourceMesh} from '../src/core/resources';import {readResourceAnimationList} from '../src/core/resource-animation-list';
import {resourceAnimationBoneMatrices} from '../src/core/resource-animation-matrices';
import {numericFloatBits as bits,numericFloatValue as value} from '../src/core/object-numeric-runtime';
const baseline=process.env.SKY_ANIMATION_BASELINE;if(!baseline)throw new Error('Supply the preserved pre-change bundle in SKY_ANIMATION_BASELINE');
const afterBundle=process.env.SKY_ANIMATION_AFTER;if(!afterBundle)throw new Error('Supply an identically bundled after module in SKY_ANIMATION_AFTER');
const before=createRequire(import.meta.url)(baseline),after=createRequire(import.meta.url)(afterBundle),data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus/Meshes/Bin',list=readResourceAnimationList(fs.readFileSync(data+'/AnimationList.dat'));
const newSkinFunction=after.skinResourcePositionsAndNormals;
const percentile=(a:number[],p:number)=>a.slice().sort((x,y)=>x-y)[Math.min(a.length-1,Math.floor(a.length*p))];
const summary=(a:number[])=>({medianMs:percentile(a,.5),p95Ms:percentile(a,.95)});
const rows=[];
for(const name of ['CharBirdAnim','CharSkyRayCAnim','CharCrabAAnim']){
 const mesh=readResourceMesh(fs.readFileSync(data+'/'+name+'.mesh')),palette=resourceAnimationBoneMatrices(mesh.animation!,mesh.animation!.defaultPose),services={rsqrt:(n:number)=>bits(1/Math.sqrt(value(n)))};
 const oldSkin=before.skinResourcePositionsAndNormals(mesh,palette,services),newSkin=after.skinResourcePositionsAndNormals(mesh,palette,services);assert.deepEqual(newSkin,oldSkin);
 const action=name==='CharCrabAAnim'?'idle':'critterMove',options=name==='CharCrabAAnim'?{}:{secondaryName:'critterIdle',secondaryWeight:()=>.25,randomStart:123456789};
 const oldAnimation=new before.ResourceModelAnimationPreview(mesh,list,action,options),newAnimation=new after.ResourceModelAnimationPreview(mesh,list,action,options);
 for(let i=0;i<32;i++){const a=oldAnimation.step(.016),b=newAnimation.step(.016);assert.deepEqual(b.packedPositions,a.packedPositions);assert.deepEqual(b.packedNormals,a.packedNormals);}
 const timings:{[key:string]:number[]}={beforeSkin:[],afterSkin:[],beforeAnimation:[],afterAnimation:[]};
 for(let i=0;i<160;i++){
  // Alternate order to limit warm-up and thermal bias; compare only after
  // identical warm-up with real decoded models and independently timed clips.
  for(const after of i%2?[true,false]:[false,true]){
   let start=performance.now();(after?newSkinFunction:before.skinResourcePositionsAndNormals)(mesh,palette,services);const skin=performance.now()-start;
   start=performance.now();(after?newAnimation:oldAnimation).step(.016);const animation=performance.now()-start;
   if(i>=32){timings[after?'afterSkin':'beforeSkin'].push(skin);timings[after?'afterAnimation':'beforeAnimation'].push(animation);}
  }
 }
 const row={model:name,vertices:mesh.positions.length/3,bones:mesh.animation!.bones.length,skin:{before:summary(timings.beforeSkin),after:summary(timings.afterSkin),speedup:percentile(timings.beforeSkin,.5)/percentile(timings.afterSkin,.5)},animation:{before:summary(timings.beforeAnimation),after:summary(timings.afterAnimation),speedup:percentile(timings.beforeAnimation,.5)/percentile(timings.afterAnimation,.5)},parityFrames:32};rows.push(row);console.log(JSON.stringify(row));
}
fs.writeFileSync('docs/creature-animation-performance.json',JSON.stringify({platform:process.platform,architecture:process.arch,comparison:'Both implementations are bundled with esbuild into CommonJS and loaded through the same require path; warm-up and alternating timing order are identical.',scope:'CPU only: original packed skinning and full move/idle pose sampling, blending, skeleton matrices and skinning. Excludes AI, IPC, Vulkan, map effects and presentation; does not establish whole-map FPS.',rows},null,2)+'\n');
