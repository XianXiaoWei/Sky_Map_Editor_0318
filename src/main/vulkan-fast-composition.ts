import {VULKAN_TEXTURE_FORMATS} from '../core/vulkan-protocol';
import * as THREE from 'three';
import {packSpirvUniforms} from '../core/spirv';
import {createViewportEnvironment} from './viewport-environment';
import {bindVulkanMaterial,type VulkanMaterialInput} from './vulkan-material';
import {compileVulkanShaders,type VulkanShaderCompilation} from './vulkan-shaders';
import {vulkanProgramSources} from './vulkan-program';
import type {VulkanMaterialResource} from '../core/vulkan-protocol';
import type {VulkanHost} from './vulkan';import type {AssetCatalog} from './assets';

// Reduced graphics only: original FogUpsample/transparent reconstruction and
// Tonemap remain on GPU. Volumetric clouds, temporal AA and per-frame HDR
// metering are omitted. Scene state/events run through the same runtime.
export function createVulkanFastComposition(catalog:AssetCatalog,host:VulkanHost,cache:string,evaluate:ReturnType<typeof createViewportEnvironment>){
 const vertices=new Uint8Array(Float32Array.from([-1,-1,0,0,1,-1,1,0,1,1,1,1,-1,1,0,1]).buffer),indices=Uint32Array.from([0,1,2,0,2,3]);
 const attributes={a_position:{format:'vec2' as const,offset:0},a_uv:{format:'vec2' as const,offset:8}};
 const zero={format:'rgba32f' as const,dimensions:[1,1,1] as [number,number,number],linear:false,repeat:false,data:new Uint8Array(16)};
 let fog:VulkanShaderCompilation|undefined,tone:VulkanShaderCompilation|undefined,lutKey='',frames=0,setups=0,textureUpdates=0;
 const blocks=(compiled:VulkanShaderCompilation,uniforms:Record<string,unknown>):VulkanMaterialResource[][]=>[compiled.descriptors.filter(d=>d.kind==='uniform-buffer').map(d=>({binding:d.binding,kind:0,format:0,dimensions:[1,1,1],linear:false,repeat:false,data:packSpirvUniforms(d.type,uniforms)}))];
 return {
  async prepare(width:number,height:number,matrix:number[],camera:number[],time:number){
   const environment=evaluate(camera.slice(12,15)),projection=new THREE.Matrix4().fromArray(matrix).multiply(new THREE.Matrix4().fromArray(camera)).elements,right=camera.slice(0,3).map(v=>v/projection[0]),up=camera.slice(4,7).map(v=>v/projection[5]),forward=camera.slice(8,11).map(v=>-v);
   const uniforms={...environment.uniforms,u_time:time,u_eyePos:camera.slice(12,15),u_viewProj:matrix,u_viewProjOld:matrix,u_averageLum:1,u_randomOffset:[0,0,0],u_jitter:[0,0],u_jitterHalf:[0,0],u_texSizeHalf:[width,height],u_invTexSizeHalf:[1/width,1/height],u_viewportSize:[width,height,width/height,0],u_projPlaneU:right.map(v=>2*v),u_projPlaneV:up.map(v=>2*v),u_projPlaneOrigin:forward.map((v,i)=>v-right[i]-up[i]),u_sunColor:environment.sunColor.slice(0,3),u_beaconPosEnable:[0,0,0,0],u_beaconColor:[0,0,0],u_bloomTint:[1,1,1],u_bloomParams:[0,0,0,0],u_exposure:environment.values.AmbienceToneMap.exposure};
   const key=Buffer.from(environment.lut.buffer,environment.lut.byteOffset,environment.lut.byteLength).toString('base64');
   if(!fog||!tone){
    const p=catalog.program('FogUpsample'),t=catalog.program('Tonemap');
    fog??=await compileVulkanShaders(vulkanProgramSources(p),cache);
    tone??=await compileVulkanShaders([{stage:'vert',text:p.vertexSource,coordinates:'opengl'},{stage:'frag',text:t.fragmentSource,coordinates:'opengl'}],cache);
    const input=(shader:string,textures:VulkanMaterialInput['textures']):VulkanMaterialInput=>({shader,stride:16,vertices,indices,attributes,state:4,uniforms,textures,colorFormats:['rgba32f']});
    const fogScene=await bindVulkanMaterial(fog,input('FogUpsample',{u_opaqueTexRGBDepth:zero,u_alphaTex0:zero,u_alphaTex1:zero,u_cloudTex0:zero,u_cloudTex1:zero,u_depthHalfTex:zero,u_fogTex:zero,u_atmosphereTex:{format:'rgba32f',dimensions:[64,1,1],linear:true,repeat:false,data:new Uint8Array(environment.lut.buffer,environment.lut.byteOffset,environment.lut.byteLength)}}));
    const toneScene=await bindVulkanMaterial(tone,input('Tonemap',{u_texFull:zero,u_bloomTex:zero,u_texMotionBlur:zero}));
    const binding=(c:VulkanShaderCompilation,name:string)=>{const d=c.descriptors.find(d=>d.name===name);if(!d)throw new Error(`性能路径缺少 ${name}`);return d.binding;};
    await host.setFastComposition(fogScene,toneScene,[binding(fog,'u_opaqueTexRGBDepth'),binding(fog,'u_alphaTex0'),binding(fog,'u_alphaTex1'),binding(tone,'u_texFull')]);lutKey=key;setups++;
   }else if(key!==lutKey){
    const updates=blocks(fog,uniforms);updates[0].push({binding:fog.descriptors.find(d=>d.name==='u_atmosphereTex')!.binding,kind:1,format:VULKAN_TEXTURE_FORMATS.rgba32f,dimensions:[64,1,1],linear:true,repeat:false,data:new Uint8Array(environment.lut.buffer,environment.lut.byteOffset,environment.lut.byteLength)});
    await host.updateViewportResources('fog',updates);await host.updateViewportResources('tone',blocks(tone,uniforms));lutKey=key;textureUpdates++;
   }else await host.updateFastComposition(blocks(fog,uniforms),blocks(tone,uniforms));
   frames++;
  },
  info:()=>({frames,setups,textureUpdates,path:'gpu-resident-fog-tonemap',hdrReadbacks:0,clouds:false,temporalAA:false,metering:'fixed preview luminance 1'})
 };
}
