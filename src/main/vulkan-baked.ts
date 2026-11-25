import {VULKAN_TEXTURE_FORMATS} from '../core/vulkan-protocol';
import fs from 'node:fs';
import {createHash} from 'node:crypto';
import * as THREE from 'three';
import { decodePng } from '../core/png';
import { imageMipChain } from '../core/image-mips';
import {initialMaterialDynamics,stepMaterialDynamics} from '../core/material-dynamics';
import { nativeMaterialDefs,nativeMaterialParameters } from '../core/mesh-surfaces';
import { PROBE_BASE_PIXELS } from '../core/probe';
import {originalProbeMissDirection,previewProbeCubeDirection} from '../core/probe-miss-runtime';
import {previewProbeMissRsqrt} from '../core/probe-miss-capability';
import { MODEL_PROBE_GLOBALS } from '../core/model-probe-globals';
import { viewportProbeBindings } from './viewport-probe';
import { createAtmosphereRaySampler } from '../core/atmosphere';
import { packSpirvUniforms } from '../core/spirv';
import type { ObjectNode } from '../core/objects';
import type {ShaderParameter} from '../core/materials';
import type { VulkanBakedDraw,VulkanModelDraw,VulkanModelVertices,VulkanMaterialResource } from '../core/vulkan-protocol';
import {orderViewportMaterialDraws} from '../core/viewport-material-order';
import {modelRenderStateCode,materialUsesAlphaPass} from '../core/model-render-state';
import {MODEL_ATTRIBUTES,MODEL_PREVIEW_GLOBALS,effectiveLevelMeshMaterial,modelDrawBoundary} from '../core/model-draw';
import {MOTE_ATTRIBUTES,MOTE_VERTEX_STRIDE} from '../core/mote-stream';
import {BIRD_FLOCK_ATTRIBUTES,BIRD_FLOCK_VERTEX_STRIDE} from '../core/bird-flock-stream';
import {MODEL_NATIVE_TEXTURE_GLOBALS} from '../core/model-global-textures';
import {savedDarkstoneMeshes,initialDarkstonePreviewMaterial} from '../core/darkstone-material';
import {beamoDrawMaterial} from '../core/beamo-draw';
import {serializedLevelMaterialIndex} from '../core/model-material-index';
import {materialDrawBoundary} from '../core/model-draw';
import { createViewportEnvironment } from './viewport-environment';
import { compileVulkanShaders,type VulkanShaderCompilation } from './vulkan-shaders';
import { vulkanProgramSources } from './vulkan-program';
import { bindVulkanMaterial,type VulkanMaterialInput } from './vulkan-material';
import {viewportBasicMaterialSources} from './viewport-basic-material';
import {basicViewportVisibility} from '../core/viewport-draw-visibility';
import {staticModelVertexVerified} from './viewport-static-model';
import {originalViewportVisibility} from './viewport-original-visibility';
import {ByteCache} from '../core/byte-cache';
import type { AssetCatalog } from './assets';
import type { VulkanHost } from './vulkan';
import {originalCreatureMaterial} from '../core/creature-model-binding';

export const BAKED_PREVIEW_SCOPE='Original terrain/skirt GLSL, real packed geometry/material textures with declared gamma/mip handling and supported anisotropy (16x preview request), recovered float32 shader time and three-layer scroll accumulation. Shared original Wind spatial/timer/order sampling, additional Marker OBBs and cached Rail equations feed original texture drift. Ambient/boundary/interaction force services and native Rail lifecycle remain pending. Shared float32 HDR color/depth and linear decal/skirt blending. Main material viewport feeds the cloud depth/FogUpsample/MotionGen/MotionDilate/TemporalAa/Tonemap chain. PNG area-filtered mip generation and anisotropy strength remain preview adapters, not original exporter/Metal parity. Scene probe, point lights/shadows, water/puddle, startup events, bloom/motion and original Metal per-draw half quantization remain pending.';
export const BAKED_VERTEX_ATTRIBUTES:VulkanMaterialInput['attributes']={a_position:{format:'vec3',offset:0},a_normal:{format:'snorm4',offset:12},a_material0:{format:'unorm4',offset:16},a_material1:{format:'unorm4',offset:20},a_light0:{format:'unorm4',offset:24},a_light1:{format:'unorm4',offset:28},a_light2:{format:'unorm4',offset:32},a_userData1:{format:'snorm4',offset:36}};
const identity=new THREE.Matrix4().toArray();
type Environment=ReturnType<ReturnType<typeof createViewportEnvironment>>;
const decodedTextures=new ByteCache<string,VulkanMaterialInput['textures'][string]>(64*1024*1024);

// This is a documented preview probe derived from the recovered atmosphere,
// not the game's scene-intersection probe. Never pass it as game parity data.
let skyProbeDirections:number[][]|undefined;
export function skyProbe(environment:Environment,eye:number[]) {
  if(!skyProbeDirections){skyProbeDirections=[];for(let face=0;face<6;face++)for(let y=0;y<32;y++)for(let x=0;x<32;x++)skyProbeDirections.push(originalProbeMissDirection(previewProbeCubeDirection(face,x,y),previewProbeMissRsqrt));}
  const history=new Float32Array(PROBE_BASE_PIXELS*4);
  const shared={eye:[...eye,1],planetSphere:environment.sphere,sunDirection:[...environment.direction,0],sunColor:environment.sunColor,averageSkyboxColor:environment.average,atmosphereSunColor:environment.atmosphereSunColor,atmosphereDensity:Number(environment.values.AmbienceSky.atmosphereDensity),fogDensity:0,fogHeight:1,atmosphereSample:environment.atmosphereSample,tintLookup:environment.lut};
  const sample=createAtmosphereRaySampler(shared);
  for(let face=0;face<6;face++)for(let y=0;y<32;y++)for(let x=0;x<32;x++) {
    const direction=skyProbeDirections[face*1024+y*32+x];
    const color=sample(direction);
    color.forEach((value,lane)=>history[(face*1024+y*32+x)*4+lane]=Math.max(.0001,value));
  }
  return viewportProbeBindings(history,eye);
}
export function createVulkanBakedRenderer(level:string,nodes:ObjectNode[],catalog:AssetCatalog,host:VulkanHost,cache:string,evaluate=createViewportEnvironment(nodes)) {
  const defs=nativeMaterialDefs(level),textures=new Map<string,VulkanMaterialInput['textures'][string]>(),compiled=new Map<string,Promise<VulkanShaderCompilation>>();
  type Draw=VulkanBakedDraw|VulkanModelDraw;
  const modelNodes=new Map(nodes.filter(n=>n.className==='LevelMesh').map(n=>[n.id,n]));
  const darkstoneMeshes=savedDarkstoneMeshes(nodes);
  // GPU sink for the original endpoint/Vertex service. Overrides are transient
  // instance bindings, never edits to the saved document or a Model allocator.
  const modelParameters=new Map<number,Map<string,ShaderParameter>>();
  let parameterRevision=0;
  let beamoMaterials:ReturnType<typeof serializedLevelMaterialIndex>|undefined;
  const materialForDraw=(nodeId:number,draw?:VulkanModelDraw)=>{
    if(draw?.creatureNodeId!==undefined)return originalCreatureMaterial(nodes,level,draw.creatureNodeId);
    if(draw?.beamoPass){const index=beamoMaterials??=serializedLevelMaterialIndex(nodes,level),selected=beamoDrawMaterial(nodes,level,nodeId,draw.beamoPass,index);if(draw.materialNodeId!==selected.materialNodeId)throw new Error('Original Beamo material identity differs');for(const owner of draw.beamoNodeIds??[]){if(beamoDrawMaterial(nodes,level,owner,draw.beamoPass,index).materialNodeId!==selected.materialNodeId)throw new Error('Merged Beamo material identity differs');}return selected.material;}
    const savedMaterial=effectiveLevelMeshMaterial(modelNodes.get(nodeId)!,level);
    const material=darkstoneMeshes.has(nodeId)?initialDarkstonePreviewMaterial(savedMaterial):savedMaterial,overrides=modelParameters.get(nodeId);
    if(!overrides)return material;
    const parameters=material.parameters.map(p=>overrides.get(p.name)??p);
    for(const p of overrides.values())if(!parameters.some(v=>v.name===p.name))parameters.push(p);
    return {...material,parameters};
  };
  let modelBoundaries:{nodeId:number;reason:string}[]=[];
  let geometryKey='',drawOrder='';
  let draws:VulkanBakedDraw[]=[],models:VulkanModelDraw[]=[],bindings:{draw:Draw;compiled:VulkanShaderCompilation}[]=[],dirty=true,probe:ReturnType<typeof skyProbe>|undefined,probeKey='',lastFrame='';
  let dynamics=initialMaterialDynamics(),cachedEnvironment:Environment|undefined,cachedEye='';
  let avatarPosition:number[]|undefined;
  let samplerPolicy='device-request',maxAnisotropy=16;
  let materialUploads=0,orderUpdates=0,probeUpdates=0,usesProbe=false;
  const missingCreatureTextures=new Set<string>();
  let lastQuality='original';
  let visibilityKey='',visibleDraws=0;
  let configured:Draw[]=[];
  const pendingGeometry=new Set<Draw>();let geometryRevision=0,geometryUploads=0,geometryHashDirty=false;
  const staticPrograms=new Map<string,boolean>();
  const parameterCache=new WeakMap<Draw,{revision:number;parameters:Record<string,unknown>;tint?:number[]}>();
  const inverseCache=new WeakMap<Draw,{model:number[];inverse:number[]}>();
  const loadTexture=(name:string)=>{
    if(textures.has(name))return textures.get(name)!;
    if(!catalog.image(name).exists)throw new Error(`原地形贴图不存在：${name}`);
    const fields=catalog.image(name).declaration?.fields??{},file=catalog.imageFile(name),stat=fs.statSync(file,{bigint:true});
    const key=JSON.stringify([file,String(stat.mtimeNs),String(stat.size),fields]),cached=decodedTextures.get(key);
    if(cached){textures.set(name,cached);return cached;}
    const {width,height,rgba}=decodePng(fs.readFileSync(file)),srgb=fields.gammaCorrection!==false;
    const texture:VulkanMaterialInput['textures'][string]={format:srgb?'rgba8srgb':'rgba8',dimensions:[width,height,1],linear:fields.filter!=='nearest',repeat:true,
      addressModes:[fields.clampToEdgeU===true?'clamp':'repeat',fields.clampToEdgeV===true?'clamp':'repeat','repeat'],anisotropy:fields.enableAniso===true?16:1,...imageMipChain(width,height,rgba,srgb,fields.disableMips!==true)};
    decodedTextures.set(key,texture,key.length*2+texture.data.byteLength);textures.set(name,texture);return texture;
  };
  const image=(rgba:number[])=>({format:'rgba32f' as const,dimensions:[1,1,1] as [number,number,number],linear:false,repeat:false,data:new Uint8Array(Float32Array.from(rgba).buffer)});
  const previewTextures:VulkanMaterialInput['textures']={u_lightOffsetsTex:{format:'r32ui',dimensions:[32,16,1],linear:false,repeat:false,data:new Uint8Array(32*16*4)},
    u_lightCountsTex:{format:'rgba8ui',dimensions:[32,16,1],linear:false,repeat:false,data:new Uint8Array(32*16*4)},u_lightPositionsTex:image([0,0,0,0]),u_lightColorsTex:image([0,0,0,0]),u_waterSim:image([0,0,0,0]),u_puddleSimNorm:image([0,0,0,0])};
  function uniforms(draw:Draw,width:number,height:number,matrix:number[],eye:number[],environment:Environment) {
    const isModel='nodeId' in draw;
    let resolved=parameterCache.get(draw);
    if(!resolved||resolved.revision!==parameterRevision){
      const params=isModel?materialForDraw(draw.nodeId,draw).parameters:nativeMaterialParameters(defs[draw.materialIndex]),variables=isModel?catalog.program(draw.shader).variables:undefined;
      const parameters=Object.fromEntries(params.filter(p=>p.vector.length&&(!('texture' in p)||!p.texture)).map(p=>{const type=variables?.find(v=>v.storage==='uniform'&&v.name===p.name)?.type;const count=type==='float'?1:type?.startsWith('vec')?Number(type.slice(3)):p.vector.length;return [p.name,count===1?p.vector[0]:p.vector.slice(0,count)];}));
      const tint=isModel?params.find(p=>['u_color','u_tint','u_diffuseColor','u_baseColor'].includes(p.name)&&p.vector.length>=3)?.vector:undefined;
      resolved={revision:parameterRevision,parameters,tint:tint?.slice()};parameterCache.set(draw,resolved);
    }
    const model=isModel?draw.model:identity;
    let inverse=inverseCache.get(draw);
    if(isModel&&inverse?.model!==model){inverse={model,inverse:new THREE.Matrix4().fromArray(model).invert().transpose().toArray()};inverseCache.set(draw,inverse);}
    return {...resolved.parameters,...probe?.uniforms,u_viewProj:matrix,u_modelViewProj:new THREE.Matrix4().fromArray(matrix).multiply(new THREE.Matrix4().fromArray(model)).toArray(),u_model:model,u_modelIT:isModel?inverse!.inverse:identity,u_worldToLevel:identity,u_eyePos:eye,u_sunDir:environment.direction,u_sunColor:environment.sunColor.slice(0,3),
      u_averageSkyColor:environment.average.slice(0,3),u_pointLight:environment.pointLight,u_viewportSize:[width,height],u_lightShadowConsts:[0,0,0,1],u_time:dynamics.time,u_waterSimTerms:[0,0,0,0],
      u_windScroll1:dynamics.scrolls[1].slice(0,3),u_windScroll2:dynamics.scrolls[2].slice(0,3),u_localAvatarPos:avatarPosition??eye,u_skirtDRange:5};
  }
  function drawUniforms(draw:Draw,width:number,height:number,matrix:number[],eye:number[],environment:Environment,quality:'original'|'basic') {
    const values=uniforms(draw,width,height,matrix,eye,environment);
    if(quality==='original')return values;
    const model='nodeId' in draw;
    const tint=parameterCache.get(draw)?.tint;
    const color=tint?[...tint.slice(0,3),tint[3]??1]:model?[.8,.8,.8,1]:[...defs[draw.materialIndex].color.slice(0,3),1];
    return {...values,u_color:color,u_materialId:model?0:defs[draw.materialIndex].materialId,u_opaque:draw.state===0||draw.state===6};
  }
  const compileDraw=(draw:Draw,quality:'original'|'basic')=>{
    if(draw.shader==='BirdFlock'||draw.shader==='MoteAnim')quality='original';
    const isModel='nodeId' in draw,key=quality==='basic'?`basic/${isModel}/${materialUsesAlphaPass(draw.state)}`:draw.shader;
    let result=compiled.get(key);if(!result){result=compileVulkanShaders(quality==='basic'?viewportBasicMaterialSources(isModel,materialUsesAlphaPass(draw.state)):vulkanProgramSources(catalog.program(draw.shader)),cache);compiled.set(key,result);}return result;
  };
  function hashGeometry(ordered:Draw[]){
    const hash=createHash('sha256');
    for(const d of ordered){const parameters='nodeId' in d?materialForDraw(d.nodeId,d).parameters.map(p=>[p.name,p.nativeType,p.texture]):undefined;hash.update(JSON.stringify([d.shader,d.state,d.stride,'nodeId' in d?[d.nodeId,d.group,d.baked,d.beamoPass,parameters]:d.materialIndex,d.vertices.length,d.indices.length]));hash.update(d.vertices);hash.update(new Uint8Array(d.indices.buffer,d.indices.byteOffset,d.indices.byteLength));}
    return hash.digest('hex');
  }
  function currentGeometryHash(){if(geometryHashDirty){geometryKey=hashGeometry(configured);geometryHashDirty=false;}return geometryKey;}
  const ignitionBounds=new WeakMap<Uint8Array,THREE.Box3>();
  return {
    darkstoneIgnitionTargets:()=>models.filter(d=>!d.beamoPass&&darkstoneMeshes.has(d.nodeId)&&d.shader==='DarkStone').map(d=>{
      let local=ignitionBounds.get(d.vertices);
      if(!local){local=new THREE.Box3();const view=new DataView(d.vertices.buffer,d.vertices.byteOffset,d.vertices.byteLength);for(let offset=0;offset+12<=view.byteLength;offset+=d.stride)local.expandByPoint(new THREE.Vector3(view.getFloat32(offset,true),view.getFloat32(offset+4,true),view.getFloat32(offset+8,true)));ignitionBounds.set(d.vertices,local);}
      const box=local.clone().applyMatrix4(new THREE.Matrix4().fromArray(d.model)),position=box.getCenter(new THREE.Vector3()).toArray(),radius=box.getSize(new THREE.Vector3()).length()*.5;
      const half=local.getSize(new THREE.Vector3()).multiplyScalar(.5).toArray(),center=local.getCenter(new THREE.Vector3()).applyMatrix4(new THREE.Matrix4().fromArray(d.model)).toArray();
      const worldObb=[...d.model.slice(0,3).map(v=>v*half[0]),0,...d.model.slice(4,7).map(v=>v*half[1]),0,...d.model.slice(8,11).map(v=>v*half[2]),0,...center,1];
      const scale=[0,4,8].map(o=>Math.hypot(...d.model.slice(o,o+3)));
      return {nodeId:d.nodeId,position,radius,scale,worldObb};
    }),
    hasDraws:()=>draws.length+models.length>0,
    uploadInfo:()=>({materialUploads,geometryUploads,geometryRevision,orderUpdates,probeUpdates,visibleDraws,materialQuality:lastQuality}),
    time:()=>dynamics.time,
    invalidateGpu(){dirty=true;bindings=[];lastFrame='';probeKey='';drawOrder='';visibilityKey='';},
    setModelParameterBinding(nodeId:number,parameter:Pick<ShaderParameter,'name'|'nativeType'|'vector'|'texture'>){
      if(!modelNodes.has(nodeId))throw new Error('原模型参数绑定的对象身份不存在');
      if(MODEL_PREVIEW_GLOBALS.has(parameter.name)||parameter.name in MODEL_PROBE_GLOBALS||parameter.name in MODEL_NATIVE_TEXTURE_GLOBALS)throw new Error(`场景全局参数应由场景所有者绑定：${parameter.name}`);
      const material=materialForDraw(nodeId),previous=material.parameters.find(p=>p.name===parameter.name);
      const variable=catalog.program(material.shaderName).variables.find(v=>v.storage==='uniform'&&v.name===parameter.name);
      if(!variable)throw new Error(`原模型 shader 参数不存在：${parameter.name}`);
      const texture=variable.type.startsWith('sampler'),count=variable.type==='float'?1:/^vec[234]$/.test(variable.type)?Number(variable.type.slice(3)):0;
      if(variable.count!==1||texture&&(!parameter.texture||parameter.nativeType!==(material.custom?2:1))||!texture&&(!count||parameter.vector.length<count||!parameter.vector.slice(0,count).every(Number.isFinite)||material.custom&&parameter.nativeType!==(count===1?0:1)))throw new Error(`原模型参数 GPU 绑定无效：${parameter.name}`);
      if(texture&&!catalog.image(parameter.texture).exists)throw new Error(`原模型参数贴图不存在：${parameter.texture}`);
      const next={...parameter,vector:parameter.vector.slice(),fieldId:previous?.fieldId??`runtime:${nodeId}:${parameter.name}`};
      if(previous&&JSON.stringify(previous)===JSON.stringify(next))return;
      let overrides=modelParameters.get(nodeId);if(!overrides){overrides=new Map();modelParameters.set(nodeId,overrides);}overrides.set(next.name,next);
      if(texture||!previous)dirty=true;parameterRevision++;
    },
    clearModelParameterBindings(nodeId?:number){
      const changed=nodeId===undefined?modelParameters.size>0:modelParameters.has(nodeId);
      if(!changed)return;if(nodeId===undefined)modelParameters.clear();else modelParameters.delete(nodeId);dirty=true;parameterRevision++;
    },
    setDraws(next:VulkanBakedDraw[],nextModels:VulkanModelDraw[]=[],boundaries:{nodeId:number;reason:string}[]=[]) {
      beamoMaterials=undefined;
      const ordered:Draw[]=orderViewportMaterialDraws([...next,...nextModels]);
      const key=hashGeometry(ordered);
      if(key!==currentGeometryHash()||pendingGeometry.size){dirty=true;geometryKey=key;}
      pendingGeometry.clear();geometryHashDirty=false;

      draws=next;models=nextModels;configured=ordered;modelBoundaries=boundaries;lastFrame='';
      for(const draw of configured){parameterCache.delete(draw);inverseCache.delete(draw);}
    },
    setModelTransforms(updates:{nodeId:number;matrix:number[]}[]){
      if(!Array.isArray(updates)||updates.length>4096||new Set(updates.map(u=>u.nodeId)).size!==updates.length)throw new Error('模型变换更新列表无效');
      for(const update of updates)if(!Number.isInteger(update.nodeId)||update.matrix.length!==16||!update.matrix.every(Number.isFinite)||!models.some(draw=>!draw.beamoPass&&draw.nodeId===update.nodeId))throw new Error('模型变换身份或矩阵无效');
      for(const update of updates)for(const draw of models)if(!draw.beamoPass&&draw.nodeId===update.nodeId)draw.model=update.matrix.slice();
      lastFrame='';
    },
    setModelVertices(updates:VulkanModelVertices[]){
      if(!Array.isArray(updates)||updates.length>4096||new Set(updates.map(u=>u.nodeId)).size!==updates.length)throw new Error('模型动画更新列表无效');
      const planned:{draw:VulkanModelDraw;vertices:Uint8Array;indices?:Uint32Array}[]=[];
      for(const update of updates){
        const affected=models.filter(d=>!d.beamoPass&&d.nodeId===update.nodeId);
        if('moteVertices' in update){
          if(!Number.isInteger(update.nodeId)||!affected.length||!(update.moteVertices instanceof Uint8Array)||!(update.indices instanceof Uint32Array))throw new Error('蝴蝶顶点更新身份无效');
          const count=update.moteVertices.length/MOTE_VERTEX_STRIDE;
          if(!Number.isInteger(count)||count<1||count>1000000||update.indices.length>3000000)throw new Error('蝴蝶顶点流长度无效');
          const view=new DataView(update.moteVertices.buffer,update.moteVertices.byteOffset,update.moteVertices.byteLength);
          for(let i=0;i<count;i++)for(const offset of [0,4,8,16,20,24,28,32,36,40,44,48,52,56,60,64,68])if(!Number.isFinite(view.getFloat32(i*MOTE_VERTEX_STRIDE+offset,true)))throw new Error('蝴蝶顶点或相位无效');
          for(const ix of update.indices)if(ix>=count)throw new Error('蝴蝶索引越界');
          for(const draw of affected){if(draw.shader!=='MoteAnim'||draw.stride!==MOTE_VERTEX_STRIDE||nodes[draw.creatureNodeId??-1]?.className!=='SpawnMotes')throw new Error('蝴蝶绘制所有者无效');planned.push({draw,vertices:update.moteVertices.slice(),indices:update.indices.slice()});}
          continue;
        }
        if('flockVertices' in update){
          if(!Number.isInteger(update.nodeId)||!affected.length||!(update.flockVertices instanceof Uint8Array)||!(update.indices instanceof Uint32Array))throw new Error('鸟群顶点更新身份无效');
          const count=update.flockVertices.length/BIRD_FLOCK_VERTEX_STRIDE;
          if(!Number.isInteger(count)||count<8||count>10240*8||count%8||update.indices.length!==count/8*12)throw new Error('鸟群顶点流长度无效');
          const view=new DataView(update.flockVertices.buffer,update.flockVertices.byteOffset,update.flockVertices.byteLength);
          for(let i=0;i<count;i++)for(let k=0;k<4;k++)if(!Number.isFinite(view.getFloat32(i*24+k*4,true)))throw new Error('鸟群位置或振翅相位无效');
          for(const ix of update.indices)if(ix>=count)throw new Error('鸟群索引越界');
          for(const draw of affected){if(draw.shader!=='BirdFlock'||draw.stride!==24||nodes[draw.creatureNodeId??-1]?.className!=='BirdFlock')throw new Error('鸟群绘制所有者无效');planned.push({draw,vertices:update.flockVertices.slice(),indices:update.indices.slice()});}
          continue;
        }
        if(!Number.isInteger(update.nodeId)||!affected.length||!(update.packedPositions instanceof Uint8Array)||!(update.packedNormals instanceof Int8Array))throw new Error('模型动画身份或顶点流无效');
        const position=new DataView(update.packedPositions.buffer,update.packedPositions.byteOffset,update.packedPositions.byteLength);
        for(const draw of affected){
          const count=draw.vertices.length/48;
          if(draw.stride!==48||!Number.isInteger(count)||update.packedPositions.length!==count*16||update.packedNormals.length!==count*4)throw new Error('模型动画顶点流长度不符');
          for(let i=0;i<count;i++)for(let k=0;k<3;k++)if(!Number.isFinite(position.getFloat32(i*16+k*4,true)))throw new Error('模型动画坐标无效');
          const vertices=draw.vertices.slice(),normals=new Uint8Array(update.packedNormals.buffer,update.packedNormals.byteOffset,update.packedNormals.byteLength);
          for(let i=0;i<count;i++){vertices.set(update.packedPositions.subarray(i*16,i*16+16),i*48);vertices.set(normals.subarray(i*4,i*4+4),i*48+16);}
          planned.push({draw,vertices});
        }
      }
      for(const p of planned){p.draw.vertices=p.vertices;if(p.indices)p.draw.indices=p.indices;pendingGeometry.add(p.draw);}
      if(planned.length){geometryRevision++;geometryHashDirty=true;lastFrame='';}
    },
    setModelGeometry(updates:{draw:VulkanModelDraw;vertices:Uint8Array;indices:Uint32Array}[]){
      if(!Array.isArray(updates)||updates.length>4096||new Set(updates.map(u=>u.draw)).size!==updates.length)throw new Error('模型 LOD 几何更新列表无效');
      for(const update of updates){
        if(!models.includes(update.draw)||update.draw.stride!==48||!(update.vertices instanceof Uint8Array)||!(update.indices instanceof Uint32Array)||update.vertices.length%48||update.vertices.length>400000000||update.indices.length>20000000||update.indices.length%3||update.indices.some(i=>i>=update.vertices.length/48))throw new Error('模型 LOD 几何或身份无效');
        const view=new DataView(update.vertices.buffer,update.vertices.byteOffset,update.vertices.byteLength);for(let i=0;i<update.vertices.length/48;i++)for(let j=0;j<3;j++)if(!Number.isFinite(view.getFloat32(i*48+j*4,true)))throw new Error('模型 LOD 位置无效');
      }
      for(const update of updates){update.draw.vertices=update.vertices;update.draw.indices=update.indices;pendingGeometry.add(update.draw);}
      if(updates.length){geometryRevision++;geometryHashDirty=true;lastFrame='';}
    },
    setAvatarPosition(position?:number[]) {if(position&&(position.length!==3||!position.every(Number.isFinite)))throw new Error('玩家交互位置无效');avatarPosition=position?.slice();},
    advance(delta:number,wind:number[]=[0,0,0,0]) {dynamics=stepMaterialDynamics(dynamics,{delta,timeScale:1,wind,scrollScale:1});},
    async render(width:number,height:number,matrix:number[],cameraMatrix:number[],quality:'original'|'basic'='original') {
      if(quality!==lastQuality){dirty=true;lastQuality=quality;}
      const device=await host.start();samplerPolicy=device.samplerAnisotropyPolicy??'device-request';maxAnisotropy=device.maxSamplerAnisotropy??16;
      // Older native binaries (including existing Android installs) do not
      // implement opcode 29. Rebuild their material batch with the new pose.
      if(pendingGeometry.size&&device.dynamicGeometry!==true)dirty=true;
      const frameKey=JSON.stringify([width,height,matrix,cameraMatrix,dynamics,avatarPosition,parameterRevision,geometryRevision,evaluate.revision(),evaluate.frame()]);if(!dirty&&frameKey===lastFrame)return;
      const eye=cameraMatrix.slice(12,15),eyeKey=JSON.stringify([eye,evaluate.revision(),evaluate.frame()]);
      if(!cachedEnvironment||eyeKey!==cachedEye){cachedEnvironment=evaluate(eye);cachedEye=eyeKey;}
      const environment=cachedEnvironment,environmentKey=JSON.stringify([environment.values,eye,environment.sphere,environment.sunColor,environment.atmosphereSunColor,environment.average,environment.atmosphereSample]);
      if(dirty&&quality==='original')usesProbe=(await Promise.all(configured.map(draw=>compileDraw(draw,quality)))).some(result=>result.descriptors.some(d=>d.name==='u_probeCube'||d.type.members?.some(member=>member.name in MODEL_PROBE_GLOBALS)));
      let probeChanged=false;
      if(quality==='original'&&usesProbe&&environmentKey!==probeKey){probe=skyProbe(environment,eye);probeKey=environmentKey;probeChanged=true;probeUpdates++;}
      const ordered=orderViewportMaterialDraws(configured,eye);
      const order=JSON.stringify(ordered.map(d=>'nodeId' in d?[d.nodeId,d.shader,d.beamoPass]:[d.materialIndex,d.shader]));
      const updateOrder=dirty||order!==drawOrder;
      if(!dirty&&bindings.length===configured.length)bindings.forEach((binding,i)=>binding.draw=configured[i]);
      for(const draw of configured)if('nodeId' in draw&&!staticPrograms.has(draw.shader))staticPrograms.set(draw.shader,staticModelVertexVerified(catalog.program(draw.shader).vertexSource));
      const staticDraws=quality==='original'?configured.filter(draw=>'nodeId' in draw&&staticPrograms.get(draw.shader)):configured.filter(draw=>draw.shader!=='BirdFlock'&&draw.shader!=='MoteAnim');
      const culled=quality==='original'?originalViewportVisibility(staticDraws as VulkanModelDraw[],matrix,cameraMatrix):basicViewportVisibility(staticDraws,matrix),visibility=new Map(staticDraws.map((draw,i)=>[draw,culled[i]]));
      const visible=configured.map(draw=>visibility.get(draw)??true),nextVisibility=JSON.stringify(visible);
      if(dirty) {
        bindings=[];
        const scenes=[];
        for(const draw of configured) {
          const isModel='nodeId' in draw,program=catalog.program(draw.shader);
          const def=isModel?undefined:defs[draw.materialIndex];
          let modelMaterial:ReturnType<typeof effectiveLevelMeshMaterial>|undefined;
          if(isModel){
            const node=nodes[draw.creatureNodeId??draw.nodeId];if(!node||(!draw.beamoPass&&draw.creatureNodeId===undefined&&!modelNodes.has(draw.nodeId)))throw new Error('原模型对象身份不存在');
            const attributes=draw.shader==='MoteAnim'?MOTE_ATTRIBUTES:draw.shader==='BirdFlock'?BIRD_FLOCK_ATTRIBUTES:MODEL_ATTRIBUTES;
            const boundary=draw.creatureNodeId!==undefined?materialDrawBoundary(materialForDraw(draw.nodeId,draw),program,true,false,'model',attributes):draw.beamoPass?materialDrawBoundary(materialForDraw(draw.nodeId,draw),program,true,false,'material'):modelDrawBoundary(node,level,program,draw.baked||draw.defaultLighting===true);if(boundary)throw new Error(`原模型 #${draw.nodeId} 绘制依赖：${boundary}`);
            if(draw.stride!==(draw.shader==='MoteAnim'?MOTE_VERTEX_STRIDE:draw.shader==='BirdFlock'?BIRD_FLOCK_VERTEX_STRIDE:48)||draw.state!==modelRenderStateCode(draw.group)||draw.group!==program.definition.group||draw.model.length!==16||!draw.model.every(Number.isFinite))throw new Error('原模型绘制状态无效');
            modelMaterial=materialForDraw(draw.nodeId,draw);
          }else if(!def||!Number.isInteger(draw.materialIndex)||![def.shaderName,def.shaderName+'Alpha',def.shaderName+'AlphaSkirt'].includes(draw.shader))throw new Error('原地形材质批次与定义不符');
          const result=await compileDraw(draw,quality),materialTextures:VulkanMaterialInput['textures']={...previewTextures,...probe?.textures};
          if(modelMaterial){for(const d of result.descriptors.filter(d=>d.kind==='combined-image-sampler')){const p=modelMaterial.parameters.find(p=>p.name===d.name),global=MODEL_NATIVE_TEXTURE_GLOBALS[d.name];if(global)materialTextures[d.name]=loadTexture(global);else if(p?.texture){if(isModel&&draw.creatureNodeId!==undefined&&!catalog.image(p.texture).exists){missingCreatureTextures.add(p.texture);materialTextures[p.name]=image([0,0,0,0]);}else materialTextures[p.name]=loadTexture(p.texture);}}}
          else if(quality==='original')for(const texture of def!.textures)materialTextures[texture.name]=loadTexture(texture.texture);
          // PuddleSim emits signed gradients, so its reset state is zero;
          // encoded UpNormal image channels would tilt every wet surface.
          scenes.push(await bindVulkanMaterial(result,{...draw,attributes:isModel?draw.shader==='MoteAnim'?MOTE_ATTRIBUTES:draw.shader==='BirdFlock'?BIRD_FLOCK_ATTRIBUTES:MODEL_ATTRIBUTES:BAKED_VERTEX_ATTRIBUTES,uniforms:drawUniforms(draw,width,height,matrix,eye,environment,quality),textures:materialTextures}));
          bindings.push({draw,compiled:result});
        }
        const opaque=scenes.filter(s=>!materialUsesAlphaPass(s.state)),alpha=scenes.filter(s=>materialUsesAlphaPass(s.state));
        if(opaque.some(s=>s.colorCount!==1)||alpha.some(s=>s.colorCount!==2))throw new Error('原模型输出需要不透明RGBDepth或透明颜色/log-depth附件');
        await host.setViewportMaterials(opaque);await host.setViewportAlpha(alpha);dirty=false;pendingGeometry.clear();materialUploads++;
      } else if(bindings.length) {
        if(pendingGeometry.size){
          for(const [target,group] of [['materials',configured.filter(d=>!materialUsesAlphaPass(d.state))],['alpha',configured.filter(d=>materialUsesAlphaPass(d.state))]] as const){
            if(group.some(d=>pendingGeometry.has(d)))await host.updateViewportGeometry(target,group.map(d=>pendingGeometry.has(d)?d:null));
          }
          pendingGeometry.clear();geometryUploads++;
        }
        const updates=bindings.map(({draw,compiled},i)=>{
          const resources=(visible[i]?compiled.descriptors.filter(d=>d.kind==='uniform-buffer'):[]).map(d=>({binding:d.binding,kind:0,format:0,dimensions:[1,1,1],linear:false,repeat:false,
            data:packSpirvUniforms(d.type,drawUniforms(draw,width,height,matrix,eye,environment,quality))} as VulkanMaterialResource));
          const sampler=compiled.descriptors.find(d=>d.name==='u_probeCube');
          if(probeChanged&&sampler)resources.push({binding:sampler.binding,kind:3,...probe!.textures.u_probeCube,format:VULKAN_TEXTURE_FORMATS.rgba16f});
          return resources;
        });
        const opaque=updates.filter((_,i)=>!materialUsesAlphaPass(bindings[i].draw.state)),alpha=updates.filter((_,i)=>materialUsesAlphaPass(bindings[i].draw.state));
        if(opaque.length){if(probeChanged)await host.updateViewportResources('materials',opaque);else await host.updateViewportUniforms(opaque);}
        if(alpha.length){if(probeChanged)await host.updateViewportResources('alpha',alpha);else await host.updateViewportAlphaUniforms(alpha);}
      }
      if(updateOrder){
        const opaque=configured.filter(d=>!materialUsesAlphaPass(d.state)),alpha=configured.filter(d=>materialUsesAlphaPass(d.state));
        const opaqueIndices=new Map(opaque.map((d,i)=>[d,i])),alphaIndices=new Map(alpha.map((d,i)=>[d,i]));
        await host.setViewportDrawOrder(ordered.filter(d=>!materialUsesAlphaPass(d.state)).map(d=>opaqueIndices.get(d)!),ordered.filter(d=>materialUsesAlphaPass(d.state)).map(d=>alphaIndices.get(d)!));drawOrder=order;orderUpdates++;
      }
      // Mesh0.vert has the verified affine model->world->clip position chain;
      // its cubemap sampling changes lighting only. Keep unknown/deforming
      // programs visible until their displacement bounds are established.
      visibleDraws=visible.filter(Boolean).length;
      if(updateOrder||nextVisibility!==visibilityKey){await host.setViewportDrawVisibility(visible.filter((_,i)=>!materialUsesAlphaPass(configured[i].state)),visible.filter((_,i)=>materialUsesAlphaPass(configured[i].state)));visibilityKey=nextVisibility;}
      lastFrame=frameKey;
    },
    info:()=>({scope:BAKED_PREVIEW_SCOPE+' Resource models and prepared Beamo LOD0 draws use original GLSL, packed float3/color/SNORM normals/half4 UV pairs and baked lighting. Transparent descriptor states use original blend/depth/cull evidence; back-to-front bounds ordering is an editor adapter, not the original Scene sort. Beamo normals use observed RSQRTSS capability; external weight volumes, automatic LOD/Visibility, Barn/GPU ownership and complete original classes remain open.',geometrySha256:currentGeometryHash(),draws:draws.length+models.length,terrainDraws:draws.length,modelDraws:models.length,beamoDraws:models.filter(d=>d.beamoPass).length,beamoInstances:new Set(models.filter(d=>d.beamoPass).flatMap(d=>d.beamoNodeIds??[d.nodeId])).size,levelMeshDraws:models.filter(d=>!d.beamoPass).length,modelBoundaries,missingCreatureTextures:[...missingCreatureTextures],modelParameterBindings:[...modelParameters].map(([nodeId,parameters])=>({nodeId,parameters:[...parameters.values()].map(p=>({...p,vector:p.vector.slice()}))})),modelBindings:models.map(d=>({nodeId:d.nodeId,model:d.model.slice(),creatureNodeId:d.creatureNodeId,shader:d.shader,group:d.group,baked:d.baked,defaultLighting:d.defaultLighting,triangles:d.indices.length/3,beamoPass:d.beamoPass,beamoNodeIds:d.beamoNodeIds,materialNodeId:d.materialNodeId,verticesSha256:createHash('sha256').update(d.vertices).digest('hex')})),shaders:[...new Set([...draws,...models].map(d=>d.shader))],triangles:[...draws,...models].reduce((n,d)=>n+d.indices.length/3,0),textures:[...textures.keys()],samplerPolicy,textureSampling:[...textures].map(([name,t])=>({name,mipLevels:t.mipLevels??1,anisotropy:t.anisotropy??1,effectiveAnisotropy:samplerPolicy==='llvmpipe-trilinear'?1:Math.min(t.anisotropy??1,maxAnisotropy),gamma:t.format==='rgba8srgb'})),dynamics:structuredClone(dynamics),avatarPosition:avatarPosition?.slice()})
  };
}
