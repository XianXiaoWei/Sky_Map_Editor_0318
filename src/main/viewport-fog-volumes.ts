import * as THREE from 'three';
import type {ObjectNode} from '../core/objects';
import type {ResourceMesh} from '../core/resources';
import {effectiveLevelMeshMaterial} from '../core/model-draw';
import {objectScalar,objectText} from '../core/model-material-index';
import type {AssetCatalog} from './assets';
import {compileVulkanShaders} from './vulkan-shaders';
import {vulkanProgramSources} from './vulkan-program';
import type {WaterEffectStageInput} from './viewport-water-effects';

/** Original Fog Gen list: double-sided ONE/ONE signed surface accumulation
 * into rtFogHalf, sampled by FogUpsample. This owner reads saved transforms
 * and materials; it does not put scalar fog density in the opaque RGB target. */
export function createViewportFogVolumes(level:string,nodes:ObjectNode[],catalog:AssetCatalog,cache:string,resource:(name:string)=>ResourceMesh){
 const owners=nodes.filter(n=>n.className==='LevelMesh'&&catalog.program(effectiveLevelMeshMaterial(n,level).shaderName).definition.group==='FogVolume');
 let compiled:ReturnType<typeof compileVulkanShaders>|undefined;
 const geometry=new Map<string,{vertices:Uint8Array;indices:Uint32Array}>();
 let rendered:number[]=[];
 return {
  async stages(width:number,height:number,viewProj:number[],uniforms:Record<string,unknown>,cloud:boolean):Promise<WaterEffectStageInput[]>{
   const output:WaterEffectStageInput[]=[];rendered=[];
   for(const node of owners){
    if(objectScalar(node,'render')===0||objectScalar(node,'enabled')===0)continue;
    const material=effectiveLevelMeshMaterial(node,level),name=objectText(node,'resourceName');
    let stream=geometry.get(name);
    if(!stream){const mesh=resource(name);if(mesh.animated)throw new Error('Animated FogVolume skinning unavailable');stream={vertices:new Uint8Array(mesh.positions.buffer,mesh.positions.byteOffset,mesh.positions.byteLength),indices:mesh.indices};geometry.set(name,stream);}
    const transform=node.fields.find(f=>f.name==='transform')?.value;if(!Array.isArray(transform)||transform.length!==16)throw new Error('FogVolume transform unavailable');
    const intensity=material.parameters.find(p=>p.name==='u_intensity')?.vector[0];if(!Number.isFinite(intensity))throw new Error('FogVolume intensity unavailable');
    const depth={format:'rgba16f' as const,dimensions:[1,1,1] as [number,number,number],linear:false,repeat:false,data:new Uint8Array(8)},cloudTexture={...depth,linear:true};
    compiled??=compileVulkanShaders(vulkanProgramSources(catalog.program('FogVolume')),cache);
    output.push({compiled:await compiled,input:{shader:'FogVolume',state:12,stride:12,...stream,attributes:{a_position:{format:'vec3',offset:0}},uniforms:{u_modelViewProj:new THREE.Matrix4().fromArray(viewProj).multiply(new THREE.Matrix4().fromArray(transform)).toArray(),u_jitterHalf:uniforms.u_jitterHalf,u_viewportSize:[Math.max(1,Math.floor(width/2)),Math.max(1,Math.floor(height/2))],u_intensity:intensity},textures:{u_depthHalfTex:depth,u_cloudTex1:cloudTexture},colorFormats:['r16f'],immutableGeometry:true},links:{u_depthHalfTex:{source:2,flip:true},...cloud?{u_cloudTex1:{source:6,attachment:1,flip:true}}:{}}});
    rendered.push(node.id);
   }
   return output;
  },
  info:()=>({objects:owners.length,renderedNodeIds:rendered.slice(),target:'rtFogHalf',format:'r16f',scope:'Original saved FogVolume geometry/transform/intensity and shader, native double-sided ONE/ONE Fog Gen state, scene depth/cloud inputs and FogUpsample density binding.'})
 };
}
