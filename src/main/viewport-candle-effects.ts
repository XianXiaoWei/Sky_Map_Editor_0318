import * as THREE from 'three';
import {MeshBVH} from 'three-mesh-bvh';
import type {ObjectNode} from '../core/objects';
import type {MeshesDocument} from '../core/meshes';
import type {ResourceMesh} from '../core/resources';
import {nativeIdentityMatrix} from '../core/marker-transform-runtime';
import {cloudCardInverse} from '../core/cloud-card-inverse';
import {itemEffectArithmetic,itemFloatBytes,itemFloats,itemView} from '../core/item-effect-arithmetic';
import {loadOriginalCandleLevel,updateOriginalCandleBarn,igniteOriginalCandle,type CandleLevelLoadServices,type CandleUpdateServices} from '../core/candle-runtime';
import {renderOriginalCandleBarn,type CandleRenderServices} from '../core/candle-render-runtime';
import {loadOriginalFlame,unloadOriginalFlame,type FlameLoadServices} from '../core/flame-runtime';
import {updateOriginalFlameMotionLight} from '../core/flame-motion-light-runtime';
import {gameScaledDelta} from '../core/material-dynamics';
import {unloadOriginalCandleLevel} from '../core/candle-unload-runtime';
import type {EnvFrameClock} from '../core/environment-runtime';
import type {PreparedEnvironmentObjectState} from '../core/environment-object-state';
import type {createViewportEnvironment} from './viewport-environment';
import type {AssetCatalog} from './assets';
import type {VulkanHost} from './vulkan';
import {compileVulkanShaders} from './vulkan-shaders';
import {vulkanProgramSources} from './vulkan-program';
import {bindVulkanMaterial,type VulkanMaterialInput} from './vulkan-material';
import {packSpirvUniforms} from '../core/spirv';
import {VULKAN_TEXTURE_FORMATS,type VulkanMaterialResource} from '../core/vulkan-protocol';
import {skyProbe} from './vulkan-baked';
import {candleRenderScratch} from './candle-render-scratch';
import {originalFlameSprite,originalFlameBillboard,flameSpriteBytes} from '../core/flame-sprite-runtime';
import flameEvidence from '../../docs/flame-sprite-native.json';
import type {WaterEffectStageInput} from './viewport-water-effects';

const f=Math.fround;
// These are the six entries selected by Initialize's jump table. Native
// resource observation/combined GPU buffer setup are editor services here.
const names=['CandleDefault_CompOcc','Candles_02','CandlePlayer_CompOcc','CandleDefault_CompOcc','CandlePlayer_CompOcc','Candles_02'];
const warm=[f(.6),f(.01),0,0],white=[f(.92),f(.92),f(.92),0];
const attributes={a_position:{format:'vec3' as const,offset:0},a_color:{format:'unorm4' as const,offset:12},a_normal:{format:'snorm4' as const,offset:16}};
type PendingDispatch={kind:'audio'|'effect'|'notification';name?:string;identifier?:number;owner?:string;options?:string;parameters?:string};
type CandleDraw={pointer:bigint;nodeId:number;template:number;model:number[];color:number[]};

/** A real editor owner for Candle's native-layout records and original shader.
 * Original load/update/render bodies run on the shared CandleObject addresses.
 * Mesh observation/templates, camera/BVH ground, GPU and dispatch queues are
 * explicitly editor services; full Flame Update/billboards are still pending. */
export function createViewportCandleEffects(nodes:ObjectNode[],mesh:MeshesDocument,catalog:AssetCatalog,host:VulkanHost,cache:string,resource:(name:string)=>ResourceMesh,evaluate:ReturnType<typeof createViewportEnvironment>){
 const ids=nodes.filter(n=>n.className==='CandleObject').map(n=>n.id),flameIds=nodes.filter(n=>n.className==='Flame').map(n=>n.id),geometry:ResourceMesh[]=[],streams:Uint8Array[]=[],dispatches:PendingDispatch[]=[];
 let owner:ReturnType<typeof attach>|undefined,shader:ReturnType<typeof compileVulkanShaders>|undefined,ready=false,frames=0,draws:CandleDraw[]=[],lastOrder='',uploaded=false,pendingDelta=0,ownerAdvances=0,lastOwnerAdvance=0;
 let probe:ReturnType<typeof skyProbe>|undefined,probeKey='',lastRender={candidates:0,drawn:0};
 let flameShader:ReturnType<typeof compileVulkanShaders>|undefined,visibleFlames=0,flameSources:{nodeId:number;standalone:boolean;width:number;height:number}[]=[];
 const queue=(event:PendingDispatch)=>{dispatches.push(event);if(dispatches.length>256)dispatches.shift();};
 function attach(objects:PreparedEnvironmentObjectState){
  const m=objects.runtimeMemory,barn=objects.effectBarns.get('CandleObject')!,game=objects.allocate(0x500),clock=objects.allocate(0x30),identity=objects.allocate(64),camera=objects.allocate(0x200),scratch=objects.allocate(16384),pool=objects.allocate(256*0x570),bits=objects.allocate(32),flamePool=objects.allocate(256*0x1b0),a=itemEffectArithmetic();
  // Native OnLevelUnload also clears the saved-object pool count. A same-map
  // preview reset keeps its metadata addresses and reloads the pre-load bytes;
  // otherwise OnLevelLoad skips every object and leaves null render records.
  const objectCount=m.read32(barn+0xf6d0n),unloadedObjects=ids.map(id=>({pointer:objects.require(id).pointer,bytes:objects.require(id).bytes.slice()}));
  m.bytes(identity,64).set(nativeIdentityMatrix());m.write64(game+0x160n,clock);m.write64(game+0x460n,barn);m.write64(game+0x70n,camera);
  m.write32(barn+0xf980n,256);m.write32(barn+0xf984n,32);m.write32(barn+0xf988n,0);m.write64(barn+0xf990n,bits);m.write64(barn+0xf998n,pool);
  let nextFlame=0,randomSeed=0x736b79,debugTime=false,debugScale=1,eye=[0,0,0,1];const scratchArena=candleRenderScratch(scratch,16384),colors=new Map<string,number[]>(),byCandle=new Map<string,number>();
  const sound={play:(soundOwner:bigint,name:'firebreathein'|'fireextinguish',options:Uint8Array,parameters:Uint8Array)=>queue({kind:'audio',owner:soundOwner.toString(),name,options:Buffer.from(options).toString('hex'),parameters:Buffer.from(parameters).toString('hex')})};
  // The editor owns a deterministic rand31 stream. The native conversion and
  // exact loop request run in Flame.Load; unresolved audio returns a null pair.
  const flameLoad:FlameLoadServices={rand:()=>{randomSeed=(Math.imul(randomSeed,1103515245)+12345)&0x7fffffff;return randomSeed;},playLoop:(soundOwner,name,options,parameters)=>{queue({kind:'audio',owner:soundOwner.toString(),name,options:Buffer.from(options).toString('hex'),parameters:Buffer.from(parameters).toString('hex')});return [0n,0n];},sound};
  for(const [i,g] of geometry.entries()){
   const p=barn+0xf6e0n+BigInt(i)*0x70n,bounds=g.bounds!;
   if(bounds.length!==6||!bounds.every(Number.isFinite))throw new Error('Candle resource has no finite native bounds');
   const center=Array.from({length:3},(_,j)=>a.mul(a.add(bounds[j],bounds[j+3]),.5)),extent=center.map((n,j)=>a.sub(bounds[j+3],n)),obb=new Uint8Array(64);
   for(let j=0;j<3;j++)itemView(obb).setFloat32(j*20,extent[j],true);obb.set(itemFloatBytes([...center,1]),48);m.bytes(p,64).set(obb);
   const radius=a.length4([extent[0],0,0,0]),flameRadius=a.mul(radius,i===1?f(.4):i===5?.5:1);m.bytes(p+0x40n,16).set(itemFloatBytes([center[0],a.add(center[1],extent[1]),center[2],flameRadius]));
   // Palette comes from original startup constants 0x100ac16b0/0x100ac16c0.
   m.bytes(p+0x50n,16).set(itemFloatBytes(i>=3?white:warm));m.bytes(p+0x68n,8).set(itemFloatBytes([i===4?f(1.3):1,i>=3?f(.3):f(.1)]));
  }
  const ground=mesh.geometries.filter(g=>g.kind==='terrain').map(g=>{const view=mesh.geometryView(g),buffer=new THREE.BufferGeometry();buffer.setAttribute('position',new THREE.BufferAttribute(view.positions,3));buffer.setIndex(new THREE.BufferAttribute(view.indices,1));return {buffer,bvh:new MeshBVH(buffer,{indirect:true})};}),ray=new THREE.Ray(),normal=new THREE.Vector3();
  const services:CandleLevelLoadServices&CandleUpdateServices={globalBarn:()=>barn,defaultRenderMatrix:()=>identity,specialTune:()=>false,flameScale:()=>f(2.2),debugTimeEnabled:()=>debugTime,debugTimeScale:()=>debugScale,
   createFlame:()=>{if(nextFlame>=256)throw new Error('Candle Flame pool capacity exceeded');const p=flamePool+BigInt(nextFlame)*0x1b0n;objects.constructFlame(p);m.write32(p+0x150n,nextFlame++);m.write32(p+0xa4n,0x3f800000);return p;},loadFlame:(p,resources,audio)=>loadOriginalFlame(m,p,resources,audio,flameLoad),
   setupVertex:(p)=>{m.write8(p+0x538n,1);m.write8(p+0x52an,0);},shaderParameter:()=>0,
   raycast:(_owner,start,direction,_config,distance)=>{ray.origin.fromArray(itemFloats(start));ray.direction.fromArray(itemFloats(direction));let nearest=distance,result:ReturnType<CandleLevelLoadServices['raycast']>;for(const g of ground){const hit=g.bvh.raycastFirst(ray,THREE.DoubleSide);if(hit&&hit.distance<=nearest){nearest=hit.distance;normal.copy(hit.face!.normal);if(normal.y<0)normal.negate();result={position:itemFloatBytes([...hit.point.toArray(),1]),normal:itemFloatBytes([...normal.toArray(),0])};}}return result;},
   acos:n=>f(Math.acos(n)),tan:n=>f(Math.tan(n)),effectMetadata:()=>0n,createEffect:()=>objects.allocate(0x80),activateEffect:p=>queue({kind:'effect',owner:p.toString()}),notify:(_game,id)=>queue({kind:'notification',identifier:id}),
   sound
  };
  loadOriginalCandleLevel(m,barn,game,services);
  flameIds.forEach(id=>{const e=objects.require(id);loadOriginalFlame(m,e.pointer,0n,0n,flameLoad);e.pending=e.pending.filter(p=>!p.startsWith('FlameBarn 原池'));e.pending.push('Flame 原 Load／Unload 与运动／亮度更新前段已接入；交互／音效更新后段、粒子／音效播放、原火焰绘制和完整资源生命周期仍待接入');});
  ids.forEach(id=>{const e=objects.require(id),record=m.read64(e.pointer+0x90n),candle=m.read64(record+0x40n);byCandle.set(candle.toString(),id);e.pending=e.pending.filter(p=>!p.startsWith('CandleBarn 原资源装载'));e.pending.push('Candle 原 load/update/render 已接入编辑器 owner；原 Initialize 资源/GPU、Flame 运动/亮度前段已接入；火焰绘制、交互后段、音效/蜡奖励和完整资源生命周期仍待接入');});
  const renderServices:CandleRenderServices={specialTune:()=>false,allocator:()=>scratch,heap:()=>scratch,
   allocate:(_owner,n,_heap,align)=>scratchArena.allocate(n,align),
   free:(_owner,p)=>scratchArena.free(p),cameraPosition:()=>itemFloatBytes(eye),
   visibility:(_owner,_spheres,count,statuses)=>{for(let i=0;i<count;i++)m.write32(statuses+BigInt(i)*4n,1);},
   parameter:(p,_index,value)=>{colors.set((p-0x290n).toString(),itemFloats(value));},render:p=>{const candle=p-0x20n;if(!m.bytes(candle+0x549n,1)[0])return;const nodeId=byCandle.get(candle.toString());if(nodeId===undefined)throw new Error('Candle draw has no shared object');draws.push({pointer:candle,nodeId,template:m.read32(candle+0x560n),model:itemFloats(m.bytes(candle+0x30n,64)),color:colors.get(candle.toString())!});}
  };
  return {
   sound,
   restoreObjects(){for(const object of unloadedObjects)m.bytes(object.pointer,object.bytes.length).set(object.bytes);m.write32(barn+0xf6d0n,objectCount);},
   advance(c:EnvFrameClock){ownerAdvances++;debugTime=!!c.debugEnabled;debugScale=c.debugScale??1;m.bytes(clock+0x14n,8).set(itemFloatBytes([c.delta,c.delta]));m.bytes(clock+0x20n,4).set(itemFloatBytes([c.timeScale]));updateOriginalCandleBarn(m,barn,game,services);const delta=gameScaledDelta(c.delta,c.timeScale,debugTime?debugScale:1),lightServices={debugTimeEnabled:()=>debugTime,debugTimeScale:()=>debugScale,expf:(n:number)=>f(Math.exp(n)),powf:(n:number,e:number)=>f(Math.pow(n,e))};for(let i=0;i<nextFlame;i++)updateOriginalFlameMotionLight(m,flamePool+BigInt(i)*0x1b0n,game,delta,lightServices);flameIds.forEach(id=>updateOriginalFlameMotionLight(m,objects.require(id).pointer,game,delta,lightServices));},
   render(matrix:number[],position:number[]){draws=[];colors.clear();scratchArena.reset();eye=[...position,1];m.bytes(camera+0x1c0n,64).set(itemFloatBytes(matrix));lastRender=renderOriginalCandleBarn(m,barn,game,renderServices);if(scratchArena.pending)throw new Error('Candle render scratch not released');},
   ignite(id:number){const e=objects.require(id);if(e.node.className!=='CandleObject')throw new Error('Target is not a CandleObject');const record=m.read64(e.pointer+0x90n);igniteOriginalCandle(m,barn,game,m.read32(record+0x48n),0,services);},
   states:()=>ids.map(nodeId=>{const e=objects.require(nodeId),record=m.read64(e.pointer+0x90n),candle=m.read64(record+0x40n),flame=m.read64(candle+0x10n);return {nodeId,position:itemFloats(m.bytes(flame+0xc0n,16)).slice(0,3),enabled:!!m.bytes(record+0x64n,1)[0],lit:!!m.bytes(record+0x61n,1)[0],burnt:!!m.bytes(record+0x62n,1)[0],elapsed:itemView(m.bytes(record+0x58n,4)).getFloat32(0,true),duration:itemView(m.bytes(record+0x54n,4)).getFloat32(0,true),intensity:itemView(m.bytes(flame+0x110n,4)).getFloat32(0,true),light:itemView(m.bytes(flame+0x114n,4)).getFloat32(0,true),lightRadius:itemView(m.bytes(flame+0x118n,4)).getFloat32(0,true),flameEnabled:!!m.bytes(flame+0xb4n,1)[0],loaded:!!m.bytes(flame+0x13en,1)[0],template:m.read32(candle+0x560n),model:itemFloats(m.bytes(candle+0x30n,64))};}),
   flameVertices(position:number[],wind:number[],time:number,matrix:number[]){
    const pointers=ids.map(nodeId=>{const record=m.read64(objects.require(nodeId).pointer+0x90n),candle=m.read64(record+0x40n);return {nodeId,standalone:false,pointer:m.read64(candle+0x10n)};}).concat(flameIds.map(nodeId=>({nodeId,standalone:true,pointer:objects.require(nodeId).pointer})));
    const frustum=new THREE.Frustum().setFromProjectionMatrix(new THREE.Matrix4().fromArray(matrix)),eye=[...position,1];
    const visible=pointers.filter(({pointer:p})=>m.bytes(p+0xb4n,1)[0]&&m.bytes(p+0x13en,1)[0]&&itemView(m.bytes(p+0x110n,4)).getFloat32(0,true)>0).map(entry=>{
     // White/unoccluded color and point-sampled global wind are explicit editor
     // caller services; the primary sprite span and quad expansion are original.
     const sprite=originalFlameSprite(m,entry.pointer,[1,1,1,1],wind,flameEvidence.constants.cameraOffset,time,{sinf:n=>f(Math.sin(n))});
     const vertices=originalFlameBillboard(flameSpriteBytes(sprite),eye,0,{rsqrtEstimate:n=>f(1/Math.sqrt(n))});
     const center=new THREE.Vector3(...sprite.position.slice(0,3) as [number,number,number]).addScaledVector(new THREE.Vector3(...sprite.direction.slice(0,3) as [number,number,number]),sprite.height*.5);
     return {...entry,sprite,vertices,distance:center.distanceToSquared(new THREE.Vector3(...position as [number,number,number])),visible:frustum.intersectsSphere(new THREE.Sphere(center,Math.hypot(sprite.width,sprite.height)*.5))};
    }).filter(entry=>entry.visible&&entry.sprite.width>0&&Array.from({length:4},(_,i)=>itemFloats(entry.vertices.subarray(i*24,i*24+12)).concat(itemFloats(entry.vertices.subarray(i*24+16,i*24+24)))).flat().every(Number.isFinite)).sort((a,b)=>b.distance-a.distance);
    visibleFlames=visible.length;flameSources=visible.map(e=>({nodeId:e.nodeId,standalone:e.standalone,width:e.sprite.width,height:e.sprite.height}));
    const vertices=new Uint8Array(visible.length*96),indices=new Uint32Array(visible.length*6);visible.forEach((entry,i)=>{vertices.set(entry.vertices,i*96);indices.set([0,1,2,0,2,3].map(n=>n+i*4),i*6);});return {vertices,indices};
   },
   dispose(){unloadOriginalCandleLevel(m,barn,p=>{m.write8(p+0x538n,0);});for(let i=0;i<nextFlame;i++)unloadOriginalFlame(m,flamePool+BigInt(i)*0x1b0n);flameIds.forEach(id=>unloadOriginalFlame(m,objects.require(id).pointer));ids.forEach(id=>m.write64(objects.require(id).pointer+0x90n,0n));ground.forEach(g=>g.buffer.dispose());m.write32(barn+0xf988n,0);m.bytes(bits,32).fill(0);}
  };
 }
 return {
  count:ids.length,
  advance(delta:number){pendingDelta+=delta;},
  async prepare(width:number,height:number,matrix:number[],cameraMatrix:number[]){
   if(!ids.length&&!flameIds.length){if(!ready){await host.setViewportItems([]);ready=true;}return;}
   if(!owner){
    shader=compileVulkanShaders(vulkanProgramSources(catalog.program('Candle')),cache);await shader;
    for(const name of names){const g=resource(name);if(g.animated||!g.packedPositions||!g.packedNormals)throw new Error(`Candle packed resource unavailable: ${name}`);geometry.push(g);const stream=new Uint8Array(g.positions.length/3*20);for(let i=0;i<g.positions.length/3;i++){stream.set(g.packedPositions.subarray(i*16,i*16+16),i*20);stream.set(new Uint8Array(g.packedNormals.buffer,g.packedNormals.byteOffset+i*4,4),i*20+16);}streams.push(stream);}
    evaluate.attachCandleOwner(objects=>owner=attach(objects));owner!.advance({delta:pendingDelta||1/60,timeScale:1});
   }
   const active=owner!;if(ownerAdvances===lastOwnerAdvance&&pendingDelta>0)active.advance({delta:pendingDelta,timeScale:1});lastOwnerAdvance=ownerAdvances;pendingDelta=0;
   active.render(matrix,cameraMatrix.slice(12,15));const environment=evaluate(cameraMatrix.slice(12,15)),key=JSON.stringify([environment.values,cameraMatrix.slice(12,15)]),probeChanged=key!==probeKey;
   if(probeChanged||!probe){probe=skyProbe(environment,cameraMatrix.slice(12,15));probeKey=key;}
   const compiled=await shader!,order=draws.map(d=>d.pointer.toString()).join('|'),inputs:VulkanMaterialInput[]=draws.map(d=>{
    const inverse=cloudCardInverse(d.model),it=Array.from({length:16},(_,i)=>inverse[(i%4)*4+Math.floor(i/4)]);
    return {shader:'Candle',state:6,stride:20,vertices:streams[d.template],indices:geometry[d.template].indices,attributes,immutableGeometry:true,textures:probe!.textures,
     uniforms:{...environment.uniforms,u_viewProj:matrix,u_model:d.model,u_modelIT:it,u_color:d.color,u_averageSkyColor:environment.average.slice(0,3),u_averageSkyOcclusion:0,u_viewportSize:[width,height]}};
   });
   if(!uploaded||order!==lastOrder){await host.setViewportItems(await Promise.all(inputs.map(input=>bindVulkanMaterial(compiled,input))));uploaded=true;lastOrder=order;}
   else if(inputs.length){const updates=inputs.map(input=>{const resources=compiled.descriptors.filter(d=>d.kind==='uniform-buffer').map(d=>({binding:d.binding,kind:0,format:0,dimensions:[1,1,1],linear:false,repeat:false,data:packSpirvUniforms(d.type,input.uniforms)} as VulkanMaterialResource));if(probeChanged){const sampler=compiled.descriptors.find(d=>d.name==='u_probeCube');if(sampler)resources.push({binding:sampler.binding,kind:3,...probe!.textures.u_probeCube,format:VULKAN_TEXTURE_FORMATS.rgba16f});}return resources;});await host.updateViewportResources('items',updates);}
   ready=true;
  },
  reset(){uploaded=false;lastOrder='';},
  async flameStage(cameraMatrix:number[],uniforms:Record<string,unknown>,wind:number[]):Promise<WaterEffectStageInput|undefined>{
   visibleFlames=0;flameSources=[];if(!owner)return undefined;
   const geometry=owner.flameVertices(cameraMatrix.slice(12,15),wind,Number(uniforms.u_time??0),uniforms.u_viewProj as number[]);if(!geometry.indices.length)return undefined;
   flameShader??=compileVulkanShaders(vulkanProgramSources(catalog.program('Flame')),cache);
   return {compiled:await flameShader,input:{shader:'Flame',state:10,stride:24,...geometry,attributes:{a_position:{format:'vec3',offset:0},a_color:{format:'unorm4',offset:12},a_uv0:{format:'vec2',offset:16}},uniforms,textures:{},colorFormats:['rgba32f','rgba32f']},links:{}};
  },
  resetOwner(){if(owner){evaluate.detachCandleOwner(owner);owner.restoreObjects();owner=undefined;}geometry.length=streams.length=dispatches.length=0;draws=[];visibleFlames=0;flameSources=[];uploaded=ready=false;lastOrder='';pendingDelta=ownerAdvances=lastOwnerAdvance=0;},
  commit(){if(ready&&(ids.length||flameIds.length))frames++;},
  // Action repaint must refresh native light even while shader time is paused.
  // The original Candle body owns its minimum delta; no scene clock advances.
  ignite(id:number){if(!owner)throw new Error('Candle resources have not been prepared');owner.ignite(id);owner.advance({delta:0,timeScale:1});},
  info:()=>({objects:ids.length,standaloneFlames:flameIds.length,frames,ownerAdvances,lastOwnerAdvance,ready,...lastRender,visibleBodies:draws.length,visibleFlames,flameSources:flameSources.slice(),states:owner?.states()??[],pendingDispatches:dispatches.slice(),scope:'Original Candle GLSL/body mesh and native-verified whole load/update/render/ignition plus whole Flame.Load operate on shared records. Original primary FlameBarn sprite subregion and camera-facing SpriteRenderer vertices feed original Flame GLSL into shared-depth transparent color/log-depth stage. Editor caller services supply white unoccluded color, wind, clock, mathematical rsqrt estimate, frustum and distance sorting; native sinf/hardware-rsqrt are independently replayed in oracle only. Mesh observation/template setup, deterministic rand31, BVH/JS libm, scratch/GPU and local dispatch queues are editor services. Full FlameBarn, glow/particles, Flame interaction/audio remainder, reward/audio/effect/network dispatch and original GPU/resource owner remain pending.'})
 };
}
