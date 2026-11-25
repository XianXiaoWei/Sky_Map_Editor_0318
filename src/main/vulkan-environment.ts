import {VULKAN_TEXTURE_FORMATS} from '../core/vulkan-protocol';
import * as THREE from 'three';
import type { AssetCatalog } from './assets';
import type { VulkanHost } from './vulkan';
import { compileVulkanShaders } from './vulkan-shaders';
import { bindVulkanMaterial } from './vulkan-material';
import { vulkanProgramSources } from './vulkan-program';
import { createViewportEnvironment,viewportSkyVertex,viewportSkyFragment } from './viewport-environment';
import type { ObjectNode } from '../core/objects';
import {packSpirvUniforms} from '../core/spirv';
import type {VulkanMaterialResource} from '../core/vulkan-protocol';

export function createVulkanEnvironment(nodes:ObjectNode[],catalog:AssetCatalog,host:VulkanHost,cache:string,evaluate= createViewportEnvironment(nodes)) {
 const quad=Float32Array.from([-1,-1,1,-1,1,1,-1,1]);
 const compile=()=>compileVulkanShaders([{stage:'vert',text:viewportSkyVertex,format:'vulkan450'},{stage:'frag',text:viewportSkyFragment,format:'vulkan450'}],cache);
 let compiled:ReturnType<typeof compile>|undefined,sunCompiled:ReturnType<typeof compile>|undefined;
 let lastSignature='',lastResult:Awaited<ReturnType<typeof prepare>>|undefined;
 let lastLut='';
 // The Sun shader consumes a disk mesh, not a square billboard (its fragment
 // stage intentionally has no discard outside the disk).
 const disk:number[]=[0,0],indices:number[]=[];
 for(let i=0;i<=64;i++){const angle=i*2*Math.PI/64;disk.push(Math.cos(angle),Math.sin(angle));if(i<64)indices.push(0,i+1,i+2);}
 async function prepare(width:number,height:number,matrix:number[],cameraMatrix:number[],hdr:boolean){
  if(matrix.length!==16||cameraMatrix.length!==16||![...matrix,...cameraMatrix].every(Number.isFinite))throw new Error('环境相机矩阵无效');
  const eye=cameraMatrix.slice(12,15),environment=evaluate(eye),projection=new THREE.Matrix4().fromArray(matrix).multiply(new THREE.Matrix4().fromArray(cameraMatrix));
  const uniforms={...environment.uniforms,u_camMat:cameraMatrix,u_projectionScale:[1/projection.elements[0],1/projection.elements[5]],
   u_exposure:environment.values.AmbienceToneMap.exposure,u_viewProj:matrix,u_time:0,u_viewportHDR:hdr};
  const lutKey=Buffer.from(environment.lut.buffer,environment.lut.byteOffset,environment.lut.byteLength).toString('base64');
  if(compiled&&sunCompiled&&lastLut){
   const updates=await Promise.all([compiled,sunCompiled].map(async pending=>(await pending).descriptors.filter(d=>d.kind==='uniform-buffer').map(d=>({binding:d.binding,kind:0,format:0,dimensions:[1,1,1],linear:false,repeat:false,data:packSpirvUniforms(d.type,uniforms)} as VulkanMaterialResource))));
   if(lutKey!==lastLut){
    const binding=(await compiled).descriptors.find(d=>d.name==='u_atmosphereTex')!.binding;
    updates[0].push({binding,kind:1,format:VULKAN_TEXTURE_FORMATS.rgba32f,dimensions:[64,1,1],linear:true,repeat:false,data:new Uint8Array(environment.lut.buffer,environment.lut.byteOffset,environment.lut.byteLength)});
    await host.updateViewportResources('background',updates);lastLut=lutKey;
   }else await host.updateViewportBackgroundUniforms(updates);
   return {direction:environment.direction,sunColor:environment.sunColor,values:environment.values,scope:environment.scope,width,height};
  }
  const sky=await bindVulkanMaterial(await(compiled??=compile()),{shader:'MapAtmosphere',state:4,stride:8,vertices:new Uint8Array(quad.buffer),indices:Uint32Array.from([0,1,2,0,2,3]),
   attributes:{a_position:{format:'vec2',offset:0}},uniforms,textures:{u_atmosphereTex:{format:'rgba32f',dimensions:[64,1,1],linear:true,repeat:false,data:new Uint8Array(environment.lut.buffer,environment.lut.byteOffset,environment.lut.byteLength)}}});
  const sunProgram=catalog.program('Sun');
  const sun=await bindVulkanMaterial(await(sunCompiled??=compileVulkanShaders(vulkanProgramSources(sunProgram),cache)),{shader:'Sun',state:6,stride:8,
   vertices:new Uint8Array(Float32Array.from(disk).buffer),indices:Uint32Array.from(indices),attributes:{a_position:{format:'vec2',offset:0}},uniforms,textures:{}});
  await host.setViewportBackground([sky,sun]);
  lastLut=lutKey;
  return {direction:environment.direction,sunColor:environment.sunColor,values:environment.values,scope:environment.scope,width,height};
 }
 return async(width:number,height:number,matrix:number[],cameraMatrix:number[],hdr=false)=>{
  const signature=JSON.stringify([width,height,matrix,cameraMatrix,hdr,evaluate.revision(),evaluate.frame()]);
  if(signature===lastSignature&&lastResult)return lastResult;
  const result=await prepare(width,height,matrix,cameraMatrix,hdr);
  lastSignature=signature;lastResult=result;return result;
 };
}
