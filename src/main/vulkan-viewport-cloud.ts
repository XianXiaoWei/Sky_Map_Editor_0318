import fs from 'node:fs';
import * as THREE from 'three';
import type { ObjectNode } from '../core/objects';
import type { MeshesDocument } from '../core/meshes';
import { editorCloudCardBakeLighting, loadEditorLevelDataModelBakes } from '../core/level-data-bake-adapter';
import { nativeMaterialDefs } from '../core/mesh-surfaces';
import { cloudRenderGraph } from '../core/cloud-render-graph';
import { cloudCardLevelLayout,cloudCardLevelDynamic } from '../core/cloud-card-level';
import { cloudCardVisibilityPlan } from '../core/cloud-card-visibility';
import { initialCloudWind,stepCloudWind } from '../core/cloud-wind';
import { queryCloudCamera,cloudCameraNoiseTweaks } from '../core/cloud-avatar-query';
import { packProbeHalf } from '../core/probe';
import { readResourceMesh } from '../core/resources';
import { decodePng } from '../core/png';
import { imageMipChain } from '../core/image-mips';
import {compositorRandomOffset} from '../core/compositor-noise';
import {cameraSampling,jitterViewProjection,correctPreviousViewProjection} from '../core/camera-sampling';
import {createVulkanTemporalAA} from './vulkan-temporal-aa';
import { assetPath } from '../core/storage';
import { createViewportEnvironment } from './viewport-environment';
import { compileVulkanShaders,type VulkanShaderCompilation } from './vulkan-shaders';
import { vulkanProgramSources } from './vulkan-program';
import { bindVulkanMaterial,type VulkanMaterialInput } from './vulkan-material';
import { sampledVulkanTarget,bottomUpVulkanTarget } from './vulkan-target';
import { renderVulkanCloudDepth,type DepthShader } from './vulkan-depth';
import { renderVulkanCloudPass } from './vulkan-cloud';
import { viewportCloudStage } from './vulkan-cloud-coordinates';
import type { AssetCatalog } from './assets';
import type { VulkanHost } from './vulkan';
import type {VulkanFrame} from '../core/vulkan-protocol';
import {FULL_SOURCE,type VulkanFullStage,type VulkanFullLink} from '../core/vulkan-full-preview';
import {vulkanHalfStorageSources} from './vulkan-half-storage';
import {createViewportFogVolumes} from './viewport-fog-volumes';
import {createViewportWaterEffects} from './viewport-water-effects';
import {createViewportFlowerEffects,viewportFlowerBackgroundSources} from './viewport-flower-effects';
import {createViewportCandleEffects} from './viewport-candle-effects';

type Texture=VulkanMaterialInput['textures'][string];
const f=Math.fround;
const quad=new Uint8Array(Float32Array.from([-1,-1,0,0,1,-1,1,0,1,1,1,1,-1,1,0,1]).buffer);
const quadIndices=Uint32Array.from([0,1,2,0,2,3]);
const quadAttributes={a_position:{format:'vec2' as const,offset:0},a_uv:{format:'vec2' as const,offset:8}};
const constant=(rgba:number[]):Texture=>({format:'rgba32f',dimensions:[1,1,1],linear:false,repeat:false,data:new Uint8Array(Float32Array.from(rgba).buffer)});
const zero=constant([0,0,0,0]);
export const VIEWPORT_CLOUD_SCOPE='Original sparse cloud fields and CloudFluffy.vol; CloudCore history/signed depth, three depth passes, 1/8 and 1/4 R16F coarse passes, half-resolution dual RGBA16F CloudFluffy plus dynamic CloudCard, original FogUpsample, MotionGen/MotionDilate/TemporalAa and Tonemap GLSL. Native eight-phase scene and 32-phase half jitter, Gaussian taps and current-jitter correction of previous projection; editor frame clock. Stage-sized viewport uniforms; native top-row depth for AIR FragCoord and explicit lower-left storage for projected Coarse/Fog UV. Shared original environment/weather event bodies and real Wind/extra Marker/cached Rail sampling feed material and cloud motion; prepared ambient/boundary/interaction and native Rail lifecycle remain pending. Camera used for local avatar, original loaded GUID/remap lighting for compatible CloudCards; explicit neutral preview lighting only for unbaked cards, no Visibility occlusion; GPU-resident local Water objects use original OceanMesh and WaterSim shaders, camera-focused grid and zero Avatar contact; FlowerPatch uses original generated texture and point shader in the color/log-depth alpha chain; CPU-readback reference omits Water and Flower draws; original saved FogVolume signed half-target accumulation feeds FogUpsample; bloom/motion-blur inputs zero; recovered transparent color/log-depth outputs use opaque depth and feed FogUpsample, static opaque motion with original temporal resolve; deterministic editor rand31 stream with native conversion, explicit preview composed-HDR geometric-mean exposure and sRGB display transfer. Native opaque RGBA32F converted once to half RTE; transparent targets use explicit RGBA32F preview storage; original per-draw Metal half rounding/game image parity remain unverified.';

export function createViewportCloud(level:string,nodes:ObjectNode[],mesh:MeshesDocument,catalog:AssetCatalog,host:VulkanHost,cache:string,loadedBakes?:ReturnType<typeof loadEditorLevelDataModelBakes>,evaluate=createViewportEnvironment(nodes)) {
 const volume=mesh.cloudVolume(),noise=volume?catalog.cloudNoise():undefined;
 const programs=new Map<string,Promise<VulkanShaderCompilation>>(),images=new Map<string,Texture>(),resources=new Map<string,ReturnType<typeof readResourceMesh>>();
 const temporal=createVulkanTemporalAA(catalog,host,cache);
 const resident=process.env.SKY_FULL_CPU_REFERENCE!=='1';let residentReset=true;
 const samplingOverride=process.env.SKY_CLOUD_SAMPLING;
 let nativeCloudFiltering=false;
 const samplingDevice=host.start().then(device=>{nativeCloudFiltering=samplingOverride==='hardware'||samplingOverride!=='reference'&&device.deviceType!==4;});
 let randomState=318,randomOffset:number[]|undefined;
 const nextRandomOffset=()=>{randomOffset=compositorRandomOffset(Array.from({length:3},()=>{randomState=(Math.imul(randomState,1103515245)+12345)&0x7fffffff;return randomState;}));};
 const resource=(name:string)=>{let result=resources.get(name);if(!result){result=readResourceMesh(fs.readFileSync(catalog.meshFile(name)));resources.set(name,result);}return result;};
 const layout=cloudCardLevelLayout(nodes,resource);
 const bakes=loadedBakes??loadEditorLevelDataModelBakes(mesh,name=>{try{return resource(name);}catch(error){if((error as NodeJS.ErrnoException).code==='ENOENT')return null;throw error;}});
 const cardBake=editorCloudCardBakeLighting(nodes,bakes,resource);
 const textures:Record<string,Texture>={u_waterSim:zero};
 if(volume)for(const field of volume.textures){const names={CloudSparseGrid:'u_cloudSparse',CloudPackedDistGrid:'u_cloudDist',CloudPackedAmb0Grid:'u_cloudAmb0',CloudPackedAmb1Grid:'u_cloudAmb1',CloudPackedAmb2Grid:'u_cloudAmb2'};textures[names[field.name]]={format:field.channels===1?'r8':'rgba8',dimensions:field.dimensions,linear:field.name!=='CloudSparseGrid',repeat:false,data:new Uint8Array(field.data),immutable:true};}
 if(noise)textures.u_cloudNoise3D={...noise,immutable:true};
 const cloudMaterial=nativeMaterialDefs(level).find(d=>d.materialId===80);
 if(volume&&!cloudMaterial)throw new Error('缺少原 CloudSh 材质 80');
 const proxy=mesh.cloud?.proxy;
 const coreVertices=proxy?new Uint8Array(mesh.lod.subarray(proxy.vertexOffset,proxy.vertexOffset+proxy.vertexCount*16)):undefined;
 let flowerDrawn=false;
 let history:Texture|undefined,dimensions='',wind=initialCloudWind(),oldMatrix:number[]|undefined,frames=0,visibleCards=0,lastPasses:string[]=[],lastUniforms:Record<string,unknown>={},lastMilliseconds=0;
 let sampling:ReturnType<typeof cameraSampling>|undefined,previousSampling:{jitter:number[];jitterHalf:number[]}|undefined,previousViewProj:number[]|undefined,previousProjectionShift:number[]|undefined;
 const statistics:Record<string,unknown>={};
 let completedInfo:ReturnType<typeof describe>|undefined;
 function describe(){return {scope:VIEWPORT_CLOUD_SCOPE,enabled:frames>0,frames,fogVolumes:{...fogVolumes.info(),renderPath:resident?'gpu-resident':'cpu-reference-fog-unavailable'},candles:candleEffects.info(),flowers:{...flowerEffects.info(),renderPath:resident?'gpu-resident':'cpu-reference-flowers-unavailable'},water:{...waterEffects.info(),renderPath:resident?'gpu-resident':'cpu-reference-water-unavailable',enabled:resident&&waterEffects.info().frames>0},volumeBlocks:volume?volume.coordinates.length/3:0,proxyTriangles:proxy?proxy.indices.length/3:0,visibleCards,bakedCards:cardBake.bakedCards,unbakedCards:cardBake.rejectedNodeIds.length,cardBakeScope:'Prepared LevelData GUID/first-LOD gate and original Mesh remap; native resource/CloudCard lifecycle and unbaked default-light generation pending',passes:lastPasses.slice(),noise:volume?'Tex3D/CloudFluffy.vol':undefined,screenNoiseImages:['NoiseBlue3Ch','HeatTex'],randomOffset:randomOffset?.slice(),sampling:sampling&&{frame:sampling.frame,phase:sampling.phase,halfPhase:sampling.halfPhase,pixelOffset:sampling.pixelOffset,jitter:sampling.jitter,jitterHalf:sampling.jitterHalf,clockScope:'Editor completed-frame counter; native sampling sequence, not original process frame timing'},randomStreamScope:'Deterministic editor 31-bit sequence with original Compositor conversion; process-wide Darwin rand stream not reproduced',wind:structuredClone(wind),undulationScale:lastUniforms.u_cloudUndulationScale,cloudMat:lastUniforms.u_cloudMat,cloudNoiseTweaks:lastUniforms.u_cloudNoiseTweaks,lastMilliseconds,averageLum:lastUniforms.u_averageLum,exposureScope:'Editor composed-HDR geometric mean and sRGB display transfer; original luminance feedback pending',statistics:structuredClone(statistics)};}
 const stats=(name:string,values:Float32Array)=>{const min=[Infinity,Infinity,Infinity,Infinity],max=[-Infinity,-Infinity,-Infinity,-Infinity],nonfinite=[0,0,0,0];for(let i=0;i<values.length;i++){if(!Number.isFinite(values[i])){nonfinite[i%4]++;continue;}min[i%4]=Math.min(min[i%4],values[i]);max[i%4]=Math.max(max[i%4],values[i]);}statistics[name]={min,max,nonfinite};};
 const compile=(name:string)=>{let result=programs.get(name);if(!result){result=samplingDevice.then(()=>compileVulkanShaders(vulkanProgramSources(catalog.program(name),nativeCloudFiltering),cache));programs.set(name,result);}return result;};
 const image=(name:string)=>{let result=images.get(name);if(!result){const fields=catalog.image(name).declaration?.fields??{},decoded=decodePng(fs.readFileSync(catalog.imageFile(name))),srgb=fields.gammaCorrection!==false;result={immutable:true,format:srgb?'rgba8srgb':'rgba8',dimensions:[decoded.width,decoded.height,1],linear:fields.filter!=='nearest',repeat:true,...imageMipChain(decoded.width,decoded.height,decoded.rgba,srgb,fields.disableMips!==true)};images.set(name,result);}return result;};
 const waterEffects=createViewportWaterEffects(level,nodes,catalog,cache,resource,image,evaluate);
 const flowerEffects=createViewportFlowerEffects(nodes,mesh,catalog,cache,image,evaluate);
 const candleEffects=createViewportCandleEffects(nodes,mesh,catalog,host,cache,resource,evaluate);
 const fogVolumes=createViewportFogVolumes(level,nodes,catalog,cache,resource);
 function uniforms(width:number,height:number,matrix:number[],cameraMatrix:number[],time:number) {
  const eye=cameraMatrix.slice(12,15),environment=evaluate(eye),projection=new THREE.Matrix4().fromArray(matrix).multiply(new THREE.Matrix4().fromArray(cameraMatrix)).elements;
  const right=cameraMatrix.slice(0,3).map(v=>v/projection[0]),up=cameraMatrix.slice(4,7).map(v=>v/projection[5]),forward=cameraMatrix.slice(8,11).map(v=>-v);
  const undulation=Number(environment.values.CloudEnvParams.undulationScale);
  const query=queryCloudCamera(volume,eye,{time,undulationScale:undulation,radius:2.5,enabled:!!volume},wind.scroll.slice(0,3),noise);
  const viewProj=jitterViewProjection(matrix,sampling!.projectionShift),cameraCut=!oldMatrix||oldMatrix.some((v,i)=>v!==matrix[i]);
  const viewProjOld=cameraCut||!previousViewProj?viewProj:correctPreviousViewProjection(previousViewProj,sampling!.projectionShift,previousProjectionShift!);
  return {...volume?.bindings,...environment.uniforms,u_sunColor:environment.sunColor.slice(0,3),u_averageSkyColor:environment.average.slice(0,3),u_pointLight:environment.pointLight,u_time:time,u_waterSimTerms:[0,0,0,0],
   u_viewportSize:[width,height],u_jitter:sampling!.jitter,u_jitterHalf:sampling!.jitterHalf,u_jitterOld:sampling!.jitterOld,u_jitterHalfOld:sampling!.jitterHalfOld,
   u_aaCornerUvs0:sampling!.u_aaCornerUvs0,u_aaCornerUvs1:sampling!.u_aaCornerUvs1,u_aaCornerWeights:sampling!.u_aaCornerWeights,u_aaCenterWeight:sampling!.u_aaCenterWeight,
   u_texSizeHalf:[Math.max(1,Math.floor(width/2)),Math.max(1,Math.floor(height/2))],u_invTexSizeHalf:[1/Math.max(1,Math.floor(width/2)),1/Math.max(1,Math.floor(height/2))],
   u_projPlaneU:right.map(v=>2*v),u_projPlaneV:up.map(v=>2*v),u_projPlaneOrigin:forward.map((v,i)=>v-right[i]-up[i]),u_viewProj:viewProj,u_viewProjOld:viewProjOld,u_localAvatarPos:eye,
   u_randomOffset:randomOffset,u_cloudWindMove:wind.move.slice(0,3),u_cloudWindScroll:wind.scroll.slice(0,3),u_cloudMat:[...cloudMaterial?.color.slice(0,3)??[0,0,0],mesh.cloud?.sunOcclusionScale??1],u_cloudUndulationScale:undulation,
   u_cloudNoiseTweaks:cloudCameraNoiseTweaks(query.distance),u_beaconPosEnable:[0,0,0,0],u_beaconColor:[0,0,0],u_averageLum:1,u_atmosphereTex:{format:'rgba32f',dimensions:[64,1,1],linear:true,repeat:false,data:new Uint8Array(environment.lut.buffer,environment.lut.byteOffset,environment.lut.byteLength)} as Texture,
   u_exposure:Number(environment.values.AmbienceToneMap.exposure)};
 }
 function fullscreen(shader:string,uniforms:Record<string,unknown>,inputTextures:Record<string,Texture>,colorFormats:VulkanMaterialInput['colorFormats']=['rgba16f']):VulkanMaterialInput {
  return {shader,stride:16,vertices:quad,indices:quadIndices,attributes:quadAttributes,state:4,uniforms,textures:inputTextures,colorFormats,immutableGeometry:true};
 }
 async function pass(input:VulkanMaterialInput,width:number,height:number) {const compiled=await compile(input.shader);await host.setCachedMaterialScene(await bindVulkanMaterial(compiled,input));lastPasses.push(input.shader);const frame=await host.materialFrame(width,height);stats(input.shader,frame.attachments[0]);return frame;}
 const targetPlaceholder=(format:Texture['format'],linear=false):Texture=>({format,dimensions:[1,1,1],linear,repeat:false,data:new Uint8Array(format==='rgba32f'?16:format==='rgba16f'?8:format==='rg16f'?4:2)});
 function complete(frame:VulkanFrame,matrix:number[],started:number){
  if(frame.surface&&!frame.presented)return frame;
  residentReset=false;candleEffects.commit();if(resident&&waterEffects.count)waterEffects.commit();if(resident&&flowerDrawn)flowerEffects.commit();frames++;oldMatrix=matrix.slice();previousSampling={jitter:sampling!.jitter.slice(),jitterHalf:sampling!.jitterHalf.slice()};previousViewProj=(lastUniforms.u_viewProj as number[]).slice();previousProjectionShift=sampling!.projectionShift.slice();lastMilliseconds=performance.now()-started;completedInfo=describe();return frame;
 }
 async function composeResident(width:number,height:number,matrix:number[],cameraMatrix:number[],started:number):Promise<VulkanFrame>{
  const graph=cloudRenderGraph(width,height),u=lastUniforms,stages:VulkanFullStage[]=[],full=targetPlaceholder('rgba16f'),depthHalf=targetPlaceholder('rgba16f'),depthQuarter=targetPlaceholder('rg16f'),cloudA=targetPlaceholder('rgba16f',true),cloudB=targetPlaceholder('rgba16f',true);
  type InputLink={source:number;attachment?:number;flip?:boolean};
  const stage=async(id:number,divisor:number,inputs:{input:VulkanMaterialInput;compiled:VulkanShaderCompilation;links:Record<string,InputLink>}[])=>{
   const links:VulkanFullLink[]=[];
   for(const [draw,entry] of inputs.entries())for(const descriptor of entry.compiled.descriptors){const source=entry.links[descriptor.name];if(!source)continue;const texture=entry.input.textures[descriptor.name];links.push({draw,binding:descriptor.binding,source:source.source,attachment:source.attachment??0,format:texture.format as VulkanFullLink['format'],flip:source.flip??false});}
   await host.setFullStage(id,await Promise.all(inputs.map(entry=>bindVulkanMaterial(entry.compiled,entry.input))));stages.push({id,divisor,links});
  };
  const screen=async(id:number,divisor:number,name:string,uniforms:Record<string,unknown>,textures:Record<string,Texture>,links:Record<string,InputLink>,formats:VulkanMaterialInput['colorFormats']=['rgba16f'],compiled?:VulkanShaderCompilation)=>stage(id,divisor,[{input:fullscreen(name,uniforms,textures,formats),compiled:compiled??await compile(name),links}]);
  const water=await waterEffects.stages(width,height,cameraMatrix,u);
  if(water)await stage(15,1,[water.simulation]);
  if(proxy)stages.push({id:0,divisor:1,links:[{draw:0,binding:(await compile('CloudCore')).descriptors.find(d=>d.name==='u_cloudTex0')!.binding,source:FULL_SOURCE.cloudHistory,attachment:0,format:'rgba16f',flip:false}]});
  lastPasses=proxy?['CloudCore','OpaqueRGBDepth']:['OpaqueRGBDepth'];
  if(candleEffects.info().visibleBodies)lastPasses.push('Candle');
  if(water){await stage(13,1,water.water);lastPasses.push(water.simulation.input.shader,...new Set(water.water.slice(1).map(w=>w.input.shader)));}
  const flowers=await flowerEffects.stages(width,height,cameraMatrix,u,!!water,waterEffects.info().terms);flowerDrawn=!!flowers;
  const flames=await candleEffects.flameStage(cameraMatrix,u,[...evaluate.wind(cameraMatrix.slice(12,15)),0]);
  const transparent=flowers??[];
  if(flames&&!transparent.length){let copy=programs.get('ViewportFlowerBackground');if(!copy){copy=compileVulkanShaders(viewportFlowerBackgroundSources,cache);programs.set('ViewportFlowerBackground',copy);}transparent.push({compiled:await copy,input:{shader:'ViewportFlowerBackground',stride:1,vertices:new Uint8Array(4),indices:quadIndices,attributes:{},state:4,uniforms:{},textures:{u_baseColor:targetPlaceholder('rgba32f'),u_baseDepth:targetPlaceholder('rgba32f')},colorFormats:['rgba32f','rgba32f'],immutableGeometry:true},links:{u_baseColor:{source:FULL_SOURCE.alpha},u_baseDepth:{source:FULL_SOURCE.alpha,attachment:1}}});}
  if(flames)transparent.push(flames);
  if(transparent.length){await stage(14,1,transparent);if(flowers)lastPasses.push('Flower');if(flames)lastPasses.push('Flame');}
  let halfStorage=programs.get('PreviewHalfStorage');if(!halfStorage){halfStorage=compileVulkanShaders(vulkanHalfStorageSources,cache);programs.set('PreviewHalfStorage',halfStorage);}
  await stage(12,1,[{compiled:await halfStorage,input:{shader:'PreviewHalfStorage',stride:1,vertices:new Uint8Array(4),indices:quadIndices,attributes:{},state:4,uniforms:{},textures:{u_source:targetPlaceholder('rgba32f')},colorFormats:['rgba16f']},links:{u_source:{source:water?13:FULL_SOURCE.opaque}}}]);
  for(const [index,depth] of graph.depthPasses.entries()){
   const name=depth.shader,shader=await compile(name),inputTextures:Record<string,Texture>={},links:Record<string,InputLink>={};
   for(const [binding,target] of Object.entries({...depth.inputs,...depth.globals})){inputTextures[binding]=targetPlaceholder(target!.format);links[binding]={source:index===0?12:index,flip:true};}
   const input:VulkanMaterialInput={shader:name,stride:1,vertices:new Uint8Array(4),indices:quadIndices,attributes:{},state:4,uniforms:u,colorFormats:[depth.output.format],textures:inputTextures};
   await stage(index+1,index===2?4:2,[{input,compiled:shader,links}]);lastPasses.push(name);
  }
  const common:Record<string,Texture>={...textures,u_depthHalfTex:depthHalf,u_depthQuarterTex:depthQuarter,u_texBlueNoise:image('NoiseBlue3Ch'),u_texPerturb:image('HeatTex')};
  if(volume){
   const depth={nativeDepthHalf:depthHalf,nativeDepthQuarter:depthQuarter};
   for(const [index,cloudPass] of graph.passes.slice(0,2).entries()){
    const name=cloudPass.shader as 'CloudFluffySuperCoarse'|'CloudFluffyCoarse',view=viewportCloudStage(width,height,name,u,depth),links:Record<string,InputLink>={u_depthHalfTex:{source:2},u_depthQuarterTex:{source:3,flip:index===1}};
    if(index===1)links.u_cloudCoarseTTex={source:4,flip:true};
    await screen(index+4,index===0?8:4,name,view.uniforms,{...common,...view.textures},links,[cloudPass.outputs[0].format]);common[name==='CloudFluffySuperCoarse'?'u_cloudCoarseTTex':'u_cloudTTex']=targetPlaceholder('r16f');lastPasses.push(name);
   }
   const visible=cloudCardVisibilityPlan(layout.cards.map(c=>c.sphere),Array.from(layout.renderOrder),matrix,layout.cards.map(()=>1),true).visibleOrder;visibleCards=visible.length;
   const view=viewportCloudStage(width,height,'CloudFluffy',u,depth),links={u_depthHalfTex:{source:2},u_depthQuarterTex:{source:3},u_cloudCoarseTTex:{source:4,flip:true},u_cloudTTex:{source:5,flip:true}},inputs=[{input:fullscreen('CloudFluffy',view.uniforms,{...common,...view.textures},['rgba16f','rgba16f']),compiled:await compile('CloudFluffy'),links}];
   if(visible.length){const dynamic=cloudCardLevelDynamic(nodes,resource,cameraMatrix.slice(12,15),visible,true,Uint8Array.from([128,128,128,255,128,255,128,0]),cardBake.lighting),cardView=viewportCloudStage(width,height,'CloudCard',u,depth);inputs.push({input:{...dynamic,shader:'CloudCard',state:8,uniforms:cardView.uniforms,textures:{...common,...cardView.textures,u_alphaTex:image('CloudFinTex')},colorFormats:['rgba16f','rgba16f']},compiled:await compile('CloudCard'),links});}
   await stage(6,2,inputs);lastPasses.push('CloudFluffy',...(visible.length?['CloudCard']:[]));
  }
  lastPasses.push('AlphaColorLogDepth');
  const fogDraws=await fogVolumes.stages(width,height,u.u_viewProj as number[],u,!!volume);
  if(fogDraws.length){await stage(16,2,fogDraws);lastPasses.push('FogVolume');}
  const fogLinks:Record<string,InputLink>={u_opaqueTexRGBDepth:{source:12,flip:true},u_depthHalfTex:{source:2,flip:true},u_alphaTex0:{source:transparent.length?14:FULL_SOURCE.alpha,attachment:0,flip:true},u_alphaTex1:{source:transparent.length?14:FULL_SOURCE.alpha,attachment:1,flip:true}};
  if(fogDraws.length)fogLinks.u_fogTex={source:16,flip:true};
  if(volume){fogLinks.u_cloudTex0={source:6,flip:true};fogLinks.u_cloudTex1={source:6,attachment:1,flip:true};}
  const fogProgram=await compile('FogUpsample');
  await screen(7,1,'FogUpsample',u,{u_opaqueTexRGBDepth:full,u_cloudTex0:cloudA,u_cloudTex1:cloudB,u_depthHalfTex:depthHalf,u_atmosphereTex:u.u_atmosphereTex as Texture,u_fogTex:fogDraws.length?targetPlaceholder('r16f',true):zero,u_alphaTex0:targetPlaceholder('rgba32f',true),u_alphaTex1:targetPlaceholder('rgba32f',true)},fogLinks,undefined,fogProgram);
  const meter=stages.length-1,exposure=fogProgram.descriptors.flatMap(d=>d.kind==='uniform-buffer'?(d.type.members??[]).filter(m=>m.name==='u_averageLum').map(m=>({binding:d.binding,offset:m.offset})):[]);
  if(exposure.length!==1)throw new Error('原雾合成曝光 uniform 反射不唯一');
  lastPasses.push('PreviewLuminance','FogUpsample');
  const motionLinks:Record<string,InputLink>={u_depthHalfMinTex:{source:1,flip:true}};if(volume)motionLinks.u_cloudTex1={source:6,attachment:1,flip:true};
  await screen(8,2,'MotionGen',{...u,u_viewportSize:[Math.max(1,Math.floor(width/2)),Math.max(1,Math.floor(height/2))]},{u_depthHalfMinTex:targetPlaceholder('rg16f'),u_cloudTex1:{...cloudB,linear:false}},motionLinks);
  const temporalCompile=async(name:string)=>{let result=programs.get(name);if(!result){result=compileVulkanShaders([{stage:'vert',text:catalog.program('FogUpsample').vertexSource,coordinates:'opengl'},{stage:'frag',text:catalog.program(name).fragmentSource,coordinates:'opengl'}],cache);programs.set(name,result);}return result;};
  await screen(9,2,'MotionDilate',{...u,u_texSizeFull:[width,height]},{u_texMotion:targetPlaceholder('rgba16f')},{u_texMotion:{source:8,flip:true}},undefined,await temporalCompile('MotionDilate'));
  const cut=residentReset||!oldMatrix||oldMatrix.some((v,i)=>v!==matrix[i]);
  await screen(10,1,'TemporalAa',{...u,u_cameraCut:cut?1:0},{u_texMotion:targetPlaceholder('rgba16f',true),u_texColorNew:targetPlaceholder('rgba16f',true),u_texColorAccum:targetPlaceholder('rgba16f',true)},{u_texMotion:{source:9,flip:true},u_texColorNew:{source:7,flip:true},u_texColorAccum:{source:FULL_SOURCE.temporalHistory,flip:true}},undefined,await temporalCompile('TemporalAa'));
  let tone=programs.get('ViewportTonemap');if(!tone){tone=compileVulkanShaders([{stage:'vert',text:catalog.program('FogUpsample').vertexSource,coordinates:'opengl'},{stage:'frag',text:catalog.program('Tonemap').fragmentSource,coordinates:'opengl'}],cache);programs.set('ViewportTonemap',tone);}
  await screen(11,1,'Tonemap',{...u,u_bloomTint:[1,1,1],u_bloomParams:[0,0,0,0],u_viewportSize:[width,height,width/height,0]},{u_texFull:targetPlaceholder('rgba16f',true),u_bloomTex:zero,u_texMotionBlur:zero},{u_texFull:{source:10,flip:true}},['rgba32f'],await tone);
  lastPasses.push('MotionGen','MotionDilate','TemporalAa','Tonemap');
  const frame=await host.fullFrame(width,height,u.u_viewProj as number[],{stages,meter,exposureBinding:exposure[0].binding,exposureOffset:exposure[0].offset,cloud:volume?6:0xffffffff,temporal:10,reset:residentReset});
  lastUniforms.u_averageLum=frame.averageLum;statistics.transport={gpuResident:true,cloudSampling:nativeCloudFiltering?'hardware-linear':'reference-float32',intermediateFrameReadbacks:0,nativeExposureSamples:Math.ceil(width*height/Math.max(1,Math.floor(width*height/2048))),cache:host.fullCacheInfo()};statistics.temporal={cameraCut:cut,frames:frames+1,scope:'Original motion/temporal fragments with GPU-resident cloud and color history'};
  return complete(frame,matrix,started);
 }
 return {
  advance(delta:number,time:number,sampledWind:number[]=[0,0,0,0]){waterEffects.advance(delta,sampledWind);flowerEffects.advance(delta,sampledWind);candleEffects.advance(delta);wind=stepCloudWind(wind,{delta,timeScale:1,time,wind:sampledWind,enabled:!!volume});if(delta>0)nextRandomOffset();},
  async prepare(width:number,height:number,matrix:number[],cameraMatrix:number[],time:number) {
   const key=width+'x'+height;if(key!==dimensions){dimensions=key;residentReset=true;waterEffects.reset();flowerEffects.reset();if(!resident)history=sampledVulkanTarget(cloudRenderGraph(width,height).targets.cloudA,new Float32Array(Math.max(1,Math.floor(width/2))*Math.max(1,Math.floor(height/2))*4));oldMatrix=undefined;previousSampling=undefined;previousViewProj=undefined;previousProjectionShift=undefined;temporal.reset();}if(!randomOffset)nextRandomOffset();
   sampling=cameraSampling(frames>>>0,width,height,previousSampling);
   lastUniforms=uniforms(width,height,matrix,cameraMatrix,time);
   await candleEffects.prepare(width,height,lastUniforms.u_viewProj as number[],cameraMatrix);
   if(proxy&&coreVertices){const scene=await bindVulkanMaterial(await compile('CloudCore'),{shader:'CloudCore',state:0,stride:16,vertices:coreVertices,indices:proxy.indices,attributes:{a_position:{format:'vec3',offset:0},a_normal:{format:'snorm4',offset:12}},uniforms:lastUniforms,textures:{u_cloudTex0:resident?targetPlaceholder('rgba16f',true):history!},immutableGeometry:true});if(resident)await host.setFullStage(0,[scene]);else await host.setViewportCore([scene]);}else if(resident)await host.setFullStage(0,[]);else await host.setViewportCore([]);
   return lastUniforms.u_viewProj as number[];
  },
  async compose(width:number,height:number,matrix:number[],cameraMatrix:number[]):Promise<VulkanFrame> {
   if(resident)return composeResident(width,height,matrix,cameraMatrix,performance.now());
   const started=performance.now(),graph=cloudRenderGraph(width,height),u=lastUniforms,lastTextures={...textures};lastPasses=proxy?['CloudCore','OpaqueRGBDepth']:['OpaqueRGBDepth'];
   if(candleEffects.info().visibleBodies)lastPasses.push('Candle');
   const opaque=await host.viewportHDR(width,height,u.u_viewProj as number[]),rgba=opaque.attachments[0];
   stats('Opaque',rgba);
   const alpha=await host.viewportAlpha(width,height);
   stats('AlphaColor',alpha.attachments[0]);stats('AlphaLogDepth',alpha.attachments[1]);
   if(!alpha.attachments.every(a=>a.every(Number.isFinite)))throw new Error('透明 HDR 含非有限值');
   if(!rgba.every(Number.isFinite))throw new Error('地形 HDR 含非有限值');
   const half=packProbeHalf(rgba,true),full:Texture={...graph.targets.fullRGBDepth,data:new Uint8Array(half.buffer)};
   const shaders={} as Record<DepthShader,VulkanShaderCompilation>;for(const depth of graph.depthPasses)shaders[depth.shader as DepthShader]=await compile(depth.shader);
   const depth=await renderVulkanCloudDepth(host,shaders,width,height,full,{u_texSizeHalf:u.u_texSizeHalf as [number,number],u_jitterHalf:sampling!.jitterHalf as [number,number]},true);lastPasses.push(...graph.depthPasses.map(p=>p.shader));
   lastTextures.u_depthHalfTex=depth.depthHalf;lastTextures.u_depthQuarterTex=depth.depthQuarter;
   // Original Compositor::Create resolves NoiseBlue3Ch at 0x10023d67c
   // and HeatTex at 0x10023d6e1, then binds the two global samplers.
   lastTextures.u_texBlueNoise=image('NoiseBlue3Ch');lastTextures.u_texPerturb=image('HeatTex');
   let cloudA=sampledVulkanTarget(graph.targets.cloudA,new Float32Array(graph.targets.cloudA.dimensions[0]*graph.targets.cloudA.dimensions[1]*4));
   let cloudB=sampledVulkanTarget(graph.targets.cloudB,new Float32Array(graph.targets.cloudB.dimensions[0]*graph.targets.cloudB.dimensions[1]*4));
   if(volume){
    for(const cloudPass of graph.passes.slice(0,2)){
     const target=cloudPass.outputs[0],stage=viewportCloudStage(width,height,cloudPass.shader as 'CloudFluffySuperCoarse'|'CloudFluffyCoarse',u,depth),frame=await pass(fullscreen(cloudPass.shader,stage.uniforms,{...lastTextures,...stage.textures},[target.format]),target.dimensions[0],target.dimensions[1]);
     lastTextures[cloudPass.shader==='CloudFluffySuperCoarse'?'u_cloudCoarseTTex':'u_cloudTTex']=bottomUpVulkanTarget(sampledVulkanTarget(target,frame.attachments[0]));
    }
    const visible=cloudCardVisibilityPlan(layout.cards.map(c=>c.sphere),Array.from(layout.renderOrder),matrix,layout.cards.map(()=>1),true).visibleOrder;visibleCards=visible.length;
    const list=[],fineStage=viewportCloudStage(width,height,'CloudFluffy',u,depth);
    if(visible.length){const dynamic=cloudCardLevelDynamic(nodes,resource,cameraMatrix.slice(12,15),visible,true,Uint8Array.from([128,128,128,255,128,255,128,0]),cardBake.lighting),stage=viewportCloudStage(width,height,'CloudCard',u,depth);list.push({compiled:await compile('CloudCard'),input:{...dynamic,shader:'CloudCard',state:8,uniforms:stage.uniforms,textures:{...lastTextures,...stage.textures,u_alphaTex:image('CloudFinTex')}}});}
    const fine=fullscreen('CloudFluffy',fineStage.uniforms,{...lastTextures,...fineStage.textures},['rgba16f','rgba16f']);
    const cloud=await renderVulkanCloudPass(host,width,height,{compiled:await compile('CloudFluffy'),input:fine},list);stats('CloudA',cloud.frame.attachments[0]);stats('CloudB',cloud.frame.attachments[1]);cloudA=cloud.cloudA;cloudB=cloud.cloudB;lastPasses.push('CloudFluffy',...(visible.length?['CloudCard']:[]));
   }
   history=cloudA;
   lastPasses.push('AlphaColorLogDepth');
   const alphaTexture=(values:Float32Array):Texture=>({format:'rgba32f',dimensions:[width,height,1],linear:true,repeat:false,data:new Uint8Array(values.buffer,values.byteOffset,values.byteLength)});
   const fogInput=fullscreen('FogUpsample',u,{u_opaqueTexRGBDepth:bottomUpVulkanTarget(full),u_cloudTex0:bottomUpVulkanTarget(cloudA),u_cloudTex1:bottomUpVulkanTarget(cloudB),u_depthHalfTex:depth.depthHalf,u_atmosphereTex:u.u_atmosphereTex as Texture,u_fogTex:zero,u_alphaTex0:bottomUpVulkanTarget(alphaTexture(alpha.attachments[0])),u_alphaTex1:bottomUpVulkanTarget(alphaTexture(alpha.attachments[1]))});
   const metering=await pass(fogInput,width,height);
   // Explicit editor exposure adaptation. Meter the reconstructed composed
   // radiance; the game's GPU luminance/history adaptation remains pending.
   let sum=0,count=0;const raw=metering.attachments[0];
   for(let pixel=0;pixel<width*height;pixel+=Math.max(1,Math.floor(width*height/2048))){const rgb=[0,1,2].map(lane=>Math.max(.0001,1/Math.max(.0001,raw[pixel*4+lane])-1));sum+=Math.log(Math.max(.0001,.2126*rgb[0]+.7152*rgb[1]+.0722*rgb[2]));count++;}
   const averageLum=Math.max(.0001,Math.exp(sum/count));lastUniforms.u_averageLum=averageLum;
   lastPasses[lastPasses.length-1]='PreviewLuminance';
   const fog=await pass({...fogInput,uniforms:{...u,u_averageLum:averageLum}},width,height),fogTexture=sampledVulkanTarget({...graph.targets.fullRGBDepth,name:'rtFogUpsample',linear:true},fog.attachments[0]);
   // Original Anti-Aliasing temporal branch (0x1002408a4). Treat editor
   // navigation as a cut, while ordinary animation uses motion reprojection.
   const aa=await temporal.resolve(width,height,u,{color:fogTexture,depthHalfMin:depth.nativeDepthHalfMin,cloudB},!!oldMatrix&&oldMatrix.some((v,i)=>v!==matrix[i]));
   lastPasses.push(...aa.passes);stats('MotionGen',aa.motion);stats('MotionDilate',aa.dilated);stats('TemporalAa',aa.resolved);statistics.temporal={cameraCut:aa.cameraCut,frames:aa.frames,scope:aa.scope};
   const aaTexture=aa.texture;
   // Original Fullscreen program generates oversized corners using vertex ID.
   // Reprojection supplies the same screen UV convention with explicit quad.
   const tonemapProgram=catalog.program('Tonemap'),reprojection=catalog.program('FogUpsample');
   let toneCompilation=programs.get('ViewportTonemap');if(!toneCompilation){toneCompilation=compileVulkanShaders([{stage:'vert',text:reprojection.vertexSource,coordinates:'opengl'},{stage:'frag',text:tonemapProgram.fragmentSource,coordinates:'opengl'}],cache);programs.set('ViewportTonemap',toneCompilation);}
   const tone=fullscreen('Tonemap',{...u,u_bloomTint:[1,1,1],u_bloomParams:[0,0,0,0],u_viewportSize:[width,height,width/height,0]}, {u_texFull:bottomUpVulkanTarget(aaTexture),u_bloomTex:zero,u_texMotionBlur:zero},['rgba32f']);
   await host.setCachedMaterialScene(await bindVulkanMaterial(await toneCompilation,tone));
   let frame:VulkanFrame;
   if((await host.start()).nativeSurface)frame=await host.presentMaterialFrame(width,height);
   else{
    const output=await host.materialFrame(width,height);stats('Tonemap',output.attachments[0]);
    const pixels=new Uint8Array(width*height*4);for(let i=0;i<pixels.length;i++){const v=output.attachments[0][i];if(!Number.isFinite(v))throw new Error('云合成含非有限像素');const linear=Math.min(1,Math.max(0,v)),display=linear<=.0031308?12.92*linear:1.055*Math.pow(linear,1/2.4)-.055;pixels[i]=i%4===3?255:Math.round(display*255);}
    frame={width,height,pixels};
   }
   lastPasses.push('Tonemap');
   if(frame.surface&&!frame.presented)return frame;
   return complete(frame,matrix,started);
  },
  // Publish a completed frame atomically. Reading IPC diagnostics during the
  // next frame must not expose a truncated pass list or mixed statistics.
  igniteCandle:(id:number)=>candleEffects.ignite(id),
  candleIgnitionStates:()=>candleEffects.info().states,
  resetItems:()=>candleEffects.reset(),
  resetCandleOwner:()=>candleEffects.resetOwner(),
  invalidateGpu:()=>{dimensions='';residentReset=true;completedInfo=undefined;candleEffects.reset();},
  info:()=>structuredClone(completedInfo??describe())
 };
}
