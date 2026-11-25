import {centeredTemporalCorners} from '../core/compositor-noise';
import {cloudRenderGraph} from '../core/cloud-render-graph';
import {bindVulkanMaterial,type VulkanMaterialInput} from './vulkan-material';
import {compileVulkanShaders,type VulkanShaderCompilation} from './vulkan-shaders';
import {vulkanProgramSources} from './vulkan-program';
import {bottomUpVulkanTarget,sampledVulkanTarget} from './vulkan-target';
import type {AssetCatalog} from './assets';
import type {VulkanHost} from './vulkan';
type Texture=VulkanMaterialInput['textures'][string];
const quad=new Uint8Array(Float32Array.from([-1,-1,0,0,1,-1,1,0,1,1,1,1,-1,1,0,1]).buffer);
const base={stride:16,vertices:quad,indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{a_position:{format:'vec2' as const,offset:0},a_uv:{format:'vec2' as const,offset:8}},state:4};
export function createVulkanTemporalAA(catalog:AssetCatalog,host:VulkanHost,cache:string){
 const programs=new Map<string,Promise<VulkanShaderCompilation>>();let history:Texture|undefined,key='',frames=0;
 const compile=(name:string)=>{let compiled=programs.get(name);if(!compiled){const program=catalog.program(name);compiled=compileVulkanShaders(name==='MotionGen'?vulkanProgramSources(program):[{stage:'vert',text:catalog.program('FogUpsample').vertexSource,coordinates:'opengl'},{stage:'frag',text:program.fragmentSource,coordinates:'opengl'}],cache);programs.set(name,compiled);}return compiled;};
 return {
  reset(){history=undefined;key='';frames=0;},
  async resolve(width:number,height:number,uniforms:Record<string,unknown>,inputs:{color:Texture;depthHalfMin:Texture;cloudB:Texture},cameraCut=false){
   const graph=cloudRenderGraph(width,height),size=width+'x'+height;
   if(key!==size){history=undefined;key=size;frames=0;}
   const motionTarget={name:'rtMotion',dimensions:[Math.max(1,Math.floor(width/2)),Math.max(1,Math.floor(height/2)),1] as [number,number,number],format:'rgba16f' as const,linear:false,repeat:false};
   const dilateTarget={...motionTarget,name:'rtMotionDilated'},resolveTarget={...graph.targets.fullRGBDepth,name:'rtTemporalAccum',linear:true};
   const execute=async(name:string,textures:Record<string,Texture>,target:typeof motionTarget|typeof resolveTarget,u=uniforms)=>{
    await host.setCachedMaterialScene(await bindVulkanMaterial(await compile(name),{...base,shader:name,uniforms:u,textures,colorFormats:[target.format]}));
    return (await host.materialFrame(target.dimensions[0],target.dimensions[1])).attachments[0];
   };
   // The original descriptor uses nearest sampling here. Interpolating half
   // motion infinity with adjacent zero motion can introduce NaN before clamp.
   const motion=await execute('MotionGen',{u_depthHalfMinTex:{...bottomUpVulkanTarget(inputs.depthHalfMin),linear:false},u_cloudTex1:{...bottomUpVulkanTarget(inputs.cloudB),linear:false}} ,motionTarget,{...uniforms,u_viewportSize:motionTarget.dimensions.slice(0,2)});
   const motionTexture=sampledVulkanTarget(motionTarget,motion,{infinityChannels:[2]});
   const dilated=await execute('MotionDilate',{u_texMotion:bottomUpVulkanTarget(motionTexture)},dilateTarget,{...uniforms,u_texSizeFull:[width,height]});
   const dilatedTexture=sampledVulkanTarget(dilateTarget,dilated);
   const cut=cameraCut||!history;
   const suppliedCorners=uniforms.u_aaCornerUvs0!==undefined||uniforms.u_aaCornerUvs1!==undefined;
   if(suppliedCorners&&![uniforms.u_aaCornerUvs0,uniforms.u_aaCornerUvs1].every(v=>Array.isArray(v)&&v.length===4&&v.every(Number.isFinite)))throw new Error('原时间抗锯齿角点无效');
   const corners=suppliedCorners?{}:centeredTemporalCorners(width,height);
   const resolved=await execute('TemporalAa',{u_texMotion:{...bottomUpVulkanTarget(dilatedTexture),linear:true},u_texColorNew:bottomUpVulkanTarget(inputs.color),u_texColorAccum:bottomUpVulkanTarget(history??inputs.color)},resolveTarget,{...uniforms,...corners,u_cameraCut:cut?1:0});
   const texture=sampledVulkanTarget(resolveTarget,resolved);history=texture;frames++;
   return {texture,motion,dilated,resolved,cameraCut:cut,frames,passes:['MotionGen','MotionDilate','TemporalAa'],scope:`Original GLES motion and temporal fragments, ${suppliedCorners?'supplied native camera Gaussian taps':'explicit centered Gaussian taps'}, previous composed color. Static opaque motion; moving model Motion list and original Metal quantization pending.`};
  }
 };
}
