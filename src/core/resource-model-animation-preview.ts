import type {ResourceMesh} from './resources';
import type {ResourceAnimationList} from './resource-animation-list';
import {findResourceAnimationFile} from './resource-animation-list';
import {createOriginalNamedAnimationRequest,RESOURCE_ANIMATION_REQUEST_POOLS,type ResourceAnimationRequestServices} from './resource-animation-request';
import {resourceAnimationClipForRange,resourceAnimationHasRange,resourceAnimationLoopSigns} from './resource-animation-loop';
import {updateResourceAnimationClock} from './resource-animation-clock';
import {sampleOriginalResourceAnimationRequest} from './resource-animation-request-sample';
import {resourceModelPose} from './resource-model-pose';
import {numericFloatBits,numericFloatValue} from './object-numeric-runtime';
import {playOriginalDefaultAnimation} from './resource-animation-control';
import type {ObjectNode} from './objects';
import type {ResourceMeshLOD} from './resources';
import {updateOriginalResourceAnimationPrimary} from './resource-animation-primary';
export type ResourceAnimationFrameCache=Map<ResourceMesh,Map<string,ResourceMeshLOD>>;

export function resourceModelDefaultAnimation(mesh:ResourceMesh,list:ResourceAnimationList){
 const pack=mesh.animation,file=pack&&findResourceAnimationFile(list,pack.name),first=file?.metaDatas[0];
 const available=!!mesh.animated&&!!pack?.frameCount&&!!pack.defaultPose.length&&(first?
  resourceModelPreviewActions(mesh,list).some(a=>a.name===first.name&&a.available):resourceAnimationHasRange(pack,0,pack.frameCount-1));
 return {name:first?.name??'默认循环',available};
}
/** Saved LevelMesh.Create policy at 0x100401884..0x1004018d8. The
 * animationPlayDefault flag belongs to the owner; action/AI events are separate. */
export function resourceModelDefaultAnimationSettings(node:ObjectNode){
 const field=(name:string)=>node.fields.find(f=>f.name===name)?.value;
 const raw=field('animationSpeedMult'),speedMult=typeof raw==='object'&&raw!==null&&!Array.isArray(raw)&&'float' in raw?Number(raw.float):Number(raw??1);
 return {play:node.className==='LevelMesh'&&Number(field('animationPlayDefault')??1)!==0,speedMult,randomStart:Number(field('animationRandomStartFrame')??0)!==0};
}
export interface ResourceModelAnimationOptions {speedMult?:number;randomStart?:number;poseModifier?:(pose:Float32Array,delta:number)=>void;secondaryName?:string;secondaryWeight?:()=>number;}

/** Editor single named-pose preview. It owns a real request record/mask and
 * invokes the restored named request, clock, sampler, matrices and skinning.
 * It does not stand in for Model/Barn AI, layered blending, root extraction,
 * timed sequences, sound/emitter dispatch or external/mirrored/additive packs. */
export function resourceModelPreviewActions(mesh:ResourceMesh,list:ResourceAnimationList){
 const pack=mesh.animation,file=pack&&findResourceAnimationFile(list,pack.name);
 return file?.metaDatas.map(metadata=>{
  const available=!!pack?.frameCount&&!!pack.defaultPose.length&&resourceAnimationHasRange(pack,metadata.start-1,metadata.stop-1)&&
   !metadata.mirrored&&(metadata.animType===0||metadata.animType===1)&&metadata.easingFunction===0;
  return {name:metadata.name,available};
 })??[];
}
export class ResourceModelAnimationPreview {
 private storage:Uint8Array;
 private view:DataView;
 private request:bigint;
 private secondary?:bigint;
 private memory;
 private elapsed=0;
 private constantPose=false;private cachedConstantPose?:ResourceMeshLOD;private constantClockSettled=false;
 readonly name:string;
 constructor(readonly mesh:ResourceMesh,list:ResourceAnimationList,name?:string,private options:ResourceModelAnimationOptions={}){
  this.storage=new Uint8Array(options.secondaryName?0x20000:0x9000);this.view=new DataView(this.storage.buffer);
  const fallback=resourceModelDefaultAnimation(mesh,list);
  if(name===undefined?!fallback.available:!resourceModelPreviewActions(mesh,list).some(a=>a.name===name&&a.available))throw new Error('该动作的动画资源尚不支持预览');
  this.name=name??fallback.name;
  const metadata=findResourceAnimationFile(list,mesh.animation!.name)?.metaDatas.find(m=>m.name===this.name);
  this.constantPose=!!metadata&&metadata.start===metadata.stop&&!options.poseModifier&&!options.secondaryName;
  const pack=mesh.animation!,packAddress=0x6300n,maskAddress=0x6400n;
  const at=(address:bigint,length:number)=>{const n=Number(address);if(!Number.isSafeInteger(n)||n<0||n+length>this.storage.length)throw new Error('动画预览请求存储越界');return n;};
  const m=this.memory={bytes:(p:bigint,n:number)=>this.storage.subarray(at(p,n),at(p,n)+n),read32:(p:bigint)=>this.view.getUint32(at(p,4),true),read64:(p:bigint)=>this.view.getBigUint64(at(p,8),true),write8:(p:bigint,n:number)=>{this.storage[at(p,1)]=n&255;},write32:(p:bigint,n:number)=>this.view.setUint32(at(p,4),n>>>0,true),write64:(p:bigint,n:bigint)=>this.view.setBigUint64(at(p,8),n,true),string:()=>{throw new Error('Unused animation preview string storage');}};
  m.write64(0x6020n,packAddress);m.write32(0x6220n,1);m.write32(packAddress+0x48n,pack.frameCount);m.write32(packAddress+0x50n,pack.sampleRate);m.write32(0x5864n,1);
  for(const pool of RESOURCE_ANIMATION_REQUEST_POOLS)for(let i=0;i<pool.capacity;i++)m.write64(BigInt(pool.first+i*0x70)+0x68n,maskAddress+BigInt((pool.index+i)*32));
  const services:ResourceAnimationRequestServices={
   hasRange:(_p,start,stop)=>resourceAnimationHasRange(pack,start,stop),clipForRange:(_p,start,stop)=>resourceAnimationClipForRange(pack,start,stop),
   loopSigns:(_p,start,length,mask)=>{const result=resourceAnimationLoopSigns(pack,start,length,m.bytes(mask,Math.ceil(pack.bones.length/8)));m.bytes(mask,result.mask.length).set(result.mask);return result.negative;}
  };
  const index=name===undefined?playOriginalDefaultAnimation(m,0n,list,[pack],services):createOriginalNamedAnimationRequest(m,0n,list,[pack],name,1,services);
  const pool=RESOURCE_ANIMATION_REQUEST_POOLS.find(p=>index>=p.index&&index<p.index+p.capacity)!;
  this.request=BigInt(pool.first+(index-pool.index)*0x70);
  if(options.secondaryName){
   const action=resourceModelPreviewActions(mesh,list).find(a=>a.name===options.secondaryName&&a.available);if(!action)throw new Error('生物次动作的动画资源不支持预览');
   const secondaryIndex=createOriginalNamedAnimationRequest(m,0n,list,[pack],options.secondaryName,0,services);
   if(index>=152||secondaryIndex>=152)throw new Error('生物移动/静止混合需要原 Primary 动作');
   this.secondary=BigInt(0x18+secondaryIndex*0x70);m.write64(0x6018n,packAddress);m.write32(packAddress+0x54n,pack.bones.length);m.write64(packAddress+0x58n,0x18000n);m.bytes(0x18000n,pack.defaultPose.byteLength).set(new Uint8Array(pack.defaultPose.buffer,pack.defaultPose.byteOffset,pack.defaultPose.byteLength));m.write64(0x5838n,0x8000n);
  }
  // Original MultSpeed 0x100097bb0 multiplies the metadata frame rate.
  const speed=Math.fround(numericFloatValue(m.read32(this.request+0x20n))*Math.fround(options.speedMult??1));
  if(!Number.isFinite(speed))throw new Error('模型动画速度无效');m.write32(this.request+0x20n,numericFloatBits(speed));
  if(options.randomStart!==undefined){
   const rand=options.randomStart;if(!Number.isInteger(rand)||rand<0||rand>0x7fffffff)throw new Error('模型动画随机起始值无效');
   // Original Randomize 0x100097d30 calls the clock with rand * 2^-31 * 100 seconds.
   const delta=Math.fround(Math.fround(Math.fround(rand)*2**-31)*100);
   m.bytes(this.request,0x70).set(updateResourceAnimationClock(m.bytes(this.request,0x70),delta,0).state);
   if(this.secondary){const nextRandom=(Math.imul(rand,1103515245)+12345)>>>1,secondaryDelta=Math.fround(Math.fround(Math.fround(nextRandom)*2**-31)*100);m.bytes(this.secondary,0x70).set(updateResourceAnimationClock(m.bytes(this.secondary,0x70),secondaryDelta,0).state);}
  }
 }
 step(delta:number,cache?:ResourceAnimationFrameCache){
  if(!Number.isFinite(delta)||delta<0||!Number.isFinite(Math.fround(delta)))throw new Error('动画预览时间无效');
  let blended:Float32Array|undefined;
  if(this.secondary){
   const weight=Math.fround(this.options.secondaryWeight?.()??0);if(!Number.isFinite(weight)||weight<0||weight>1)throw new Error('生物动画权重无效');this.memory.write32(this.request+20n,numericFloatBits(Math.fround(1-weight)));this.memory.write32(this.secondary+20n,numericFloatBits(weight));
   blended=updateOriginalResourceAnimationPrimary(this.memory,0n,delta,0,{sample:(_pack,request)=>sampleOriginalResourceAnimationRequest(this.memory,0x6300n,this.mesh.animation!,request),rsqrt:n=>numericFloatBits(1/Math.sqrt(numericFloatValue(n)))});
  }else if(!this.constantClockSettled){
   const next=updateResourceAnimationClock(this.memory.bytes(this.request,0x70),delta,0);this.memory.bytes(this.request,0x70).set(next.state);
   // A non-action one-frame request reaches a fixed point: phase/blend are
   // zero and every frame index is start. No delay or weight clock is active.
   const state=new DataView(next.state.buffer);this.constantClockSettled=this.constantPose&&!next.state[0x4f]&&state.getInt32(0x34,true)===state.getInt32(0x3c,true);
  }
  this.elapsed+=delta;
  if(this.constantPose&&this.cachedConstantPose)return this.cachedConstantPose;
  const cacheable=cache&&!this.options.poseModifier;
  const state=this.memory.bytes(this.request,0x70),key=cacheable?[state,...this.secondary?[this.memory.bytes(this.secondary,0x70)]:[]].map(b=>Array.from(new Uint32Array(b.buffer,b.byteOffset,b.byteLength/4)).join(',')).join('|'):'';
  let poses=cacheable?cache.get(this.mesh):undefined;
  const cached=poses?.get(key);if(cached)return cached;
  // Continuous preview normals use an explicit JS reciprocal-square-root
  // service. The observed native RSQRTSS table covers default poses only;
  // unknown dynamic inputs are not silently added to that verified table.
  const pose=blended??sampleOriginalResourceAnimationRequest(this.memory,0x6300n,this.mesh.animation!,this.request);
  this.options.poseModifier?.(pose,delta);
  const projected=resourceModelPose(this.mesh,pose,0,input=>numericFloatBits(1/Math.sqrt(numericFloatValue(input))));
  if(this.constantPose)this.cachedConstantPose=projected;
  if(cacheable){if(!poses){poses=new Map();cache.set(this.mesh,poses);}poses.set(key,projected);}
  return projected;
 }
 snapshot(){return {name:this.name,elapsed:this.elapsed,phase:this.view.getFloat32(Number(this.request)+0x1c,true)};}
}
