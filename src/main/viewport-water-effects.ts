import type {ObjectNode} from '../core/objects';
import type {ResourceMesh} from '../core/resources';
import {originalOceanResourceNames,WaterSimulationState} from '../core/water-render-state';
import type {AssetCatalog} from './assets';
import {compileVulkanShaders,type VulkanShaderCompilation} from './vulkan-shaders';
import {vulkanProgramSources} from './vulkan-program';
import type {VulkanMaterialInput} from './vulkan-material';
import {skyProbe} from './vulkan-baked';
import type {createViewportEnvironment} from './viewport-environment';
import {FULL_SOURCE} from '../core/vulkan-full-preview';
import {initialMaterialDynamics,stepMaterialDynamics} from '../core/material-dynamics';
import {buildOriginalOceanGeometry,type OceanGeometryMath} from '../core/ocean-geometry-runtime';
import {viewportWaterDepthFragment} from './viewport-water-depth';

type Texture=VulkanMaterialInput['textures'][string];
export interface WaterEffectStageInput {input:VulkanMaterialInput;compiled:VulkanShaderCompilation;links:Record<string,{source:number;attachment?:number;flip?:boolean}>;}
const fullIndices=Uint32Array.from([0,1,2,0,2,3]),fullVertices=new Uint8Array(4);
const copySources=[{stage:'vert' as const,format:'vulkan450' as const,text:'#version 450\nvoid main(){vec2 p[4]=vec2[](vec2(-1,-1),vec2(1,-1),vec2(1,1),vec2(-1,1));gl_Position=vec4(p[gl_VertexIndex],0,1);}'},
 {stage:'frag' as const,format:'vulkan450' as const,text:'#version 450\nuniform sampler2D u_source;layout(location=0) out vec4 color;void main(){color=texelFetch(u_source,ivec2(gl_FragCoord.xy),0);}'}];
export const viewportWaterBackgroundSources=copySources;
const placeholder=(format:'rgba16f'|'rgba32f',linear=false):Texture=>({format,dimensions:[1,1,1],linear,repeat:false,data:new Uint8Array(format==='rgba16f'?8:16)});
// Browser libm/reciprocal square root are explicit preview services. The
// algorithm is checked separately with original instruction/libm captures.
const oceanMath:OceanGeometryMath={rsqrt:n=>Math.fround(1/Math.sqrt(n)),asin:n=>Math.fround(Math.asin(n)),sincos:n=>({sin:Math.fround(Math.sin(n)),cos:Math.fround(Math.cos(n))}),pow:(n,e)=>Math.fround(Math.pow(n,e))};

/** Map Water consumers use the real Plane10x10 LOD0, original normal/caustic
 * assets and original OceanMesh GLSL. This is a viewport owner adapter, not a
 * claim that Ocean.Initialize/Update/RenderFlush have all been restored. */
export function createViewportWaterEffects(level:string,nodes:ObjectNode[],catalog:AssetCatalog,cache:string,
 resource:(name:string)=>ResourceMesh,image:(name:string)=>Texture,evaluate:ReturnType<typeof createViewportEnvironment>){
 const nodeIds=nodes.filter(n=>n.className==='Water').map(n=>n.id),simulation=new WaterSimulationState(),names=originalOceanResourceNames(level,false);
 const programs=new Map<string,Promise<VulkanShaderCompilation>>();
 const compile=(name:string)=>{let p=programs.get(name);if(!p){const program=catalog.program(name);p=compileVulkanShaders(vulkanProgramSources({...program,fragmentSource:viewportWaterDepthFragment(program.fragmentSource)}),cache);programs.set(name,p);}return p;};
 let first=true,delta=0,frames=0,stream:Uint8Array|undefined,indices:Uint32Array|undefined,probe:ReturnType<typeof skyProbe>|undefined,probeKey='';
 let lastTerms:number[]=[0,0,0,0],dynamics=initialMaterialDynamics(),oceanIndexCount=0,oceanRows=0,oceanGrid:ReturnType<typeof buildOriginalOceanGeometry>|undefined,oceanGridKey='';
 function geometry(){
  if(stream)return;
  const mesh=resource('Plane10x10'),count=mesh.positions.length/3;
  if(mesh.animated||!mesh.packedPositions||!mesh.packedNormals)throw new Error('Original Plane10x10 packed streams unavailable');
  stream=new Uint8Array(count*20);for(let i=0;i<count;i++){stream.set(mesh.packedPositions.subarray(i*16,i*16+16),i*20);stream.set(new Uint8Array(mesh.packedNormals.buffer,mesh.packedNormals.byteOffset+i*4,4),i*20+16);}indices=mesh.indices;
 }
 return {
  get count(){return nodeIds.length+Number(evaluate.oceanRenderEnabled());},
  advance(dt:number,wind:number[]=[0,0,0,0]){if(!Number.isFinite(dt)||dt<0)throw new Error('Water frame delta invalid');delta+=dt;dynamics=stepMaterialDynamics(dynamics,{delta:dt,timeScale:1,wind,scrollScale:1});},
  reset(){first=true;delta=0;simulation.reset();},
  async stages(width:number,height:number,cameraMatrix:number[],uniforms:Record<string,unknown>){
   const oceanEnabled=evaluate.oceanRenderEnabled();oceanIndexCount=oceanRows=0;
   if(!nodeIds.length&&!oceanEnabled)return undefined;
   const saved=evaluate.waterRenderStates();
   geometry();const eye=cameraMatrix.slice(12,15),environment=evaluate(eye),key=JSON.stringify([environment.values,eye]);
   if(!probe||probeKey!==key){probe=skyProbe(environment,eye);probeKey=key;}
   const terms=simulation.next({position:eye,delta,radius:0,depthImpulse:0,sinkImpulse:0});lastTerms=terms.u_waterSimTerms;delta=0;
   const simName=first?'WaterSimReset':'WaterSim';
   const sim:WaterEffectStageInput={compiled:await compile(simName),input:{shader:simName,state:4,stride:1,vertices:fullVertices,indices:fullIndices,attributes:{},uniforms:terms,textures:{u_previous:placeholder('rgba16f',true)},colorFormats:['rgba16f','rgba16f'],immutableGeometry:true},links:{u_previous:{source:FULL_SOURCE.waterHistory}}};
   let copy=programs.get('ViewportWaterBackground');if(!copy){copy=compileVulkanShaders(copySources,cache);programs.set('ViewportWaterBackground',copy);}
   const draws:WaterEffectStageInput[]=[{compiled:await copy,input:{shader:'ViewportWaterBackground',state:4,stride:1,vertices:fullVertices,indices:fullIndices,attributes:{},uniforms:{},textures:{u_source:placeholder('rgba32f')},colorFormats:['rgba32f'],immutableGeometry:true},links:{u_source:{source:FULL_SOURCE.opaque}}}];
   const compiled=await compile(names.meshShader),normal=image(names.normal),caustics=image(names.caustics);
   const shaderUniforms={...uniforms,...probe.uniforms,u_averageProbeColor:environment.average.slice(0,3),u_averageSkyOcclusion:1,u_oceanOffset:[0,0,0],u_waterSimTerms:terms.u_waterSimTerms,u_viewportSize:[width,height],u_windScroll0:dynamics.scrolls[0].slice(0,3),u_windScroll1:dynamics.scrolls[1].slice(0,3),u_windScroll2:dynamics.scrolls[2].slice(0,3)};
   const textures:VulkanMaterialInput['textures']={...probe.textures,u_normalTex:normal,u_causticTex:caustics,u_waterSim:placeholder('rgba16f',true),u_waterSimNorm:placeholder('rgba16f',true),u_opaqueTexRGBDepth:placeholder('rgba16f',true),
    u_lightOffsetsTex:{format:'r32ui',dimensions:[32,16,1],linear:false,repeat:false,data:new Uint8Array(32*16*4)},u_lightCountsTex:{format:'rgba8ui',dimensions:[32,16,1],linear:false,repeat:false,data:new Uint8Array(32*16*4)},u_lightPositionsTex:placeholder('rgba32f'),u_lightColorsTex:placeholder('rgba32f')};
   // Wet variants have a separate PuddleSim normal input. Use the original zero-gradient reset until PuddleSim owns its real target;
   // the local WaterSim history is a different resource and is not reused here.
   if(compiled.descriptors.some(d=>d.name==='u_puddleSimNorm'))textures.u_puddleSimNorm=placeholder('rgba16f');
   if(oceanEnabled){
    const u=uniforms.u_projPlaneU as number[],v=uniforms.u_projPlaneV as number[],origin=uniforms.u_projPlaneOrigin as number[];
    const input={eye,sphere:environment.sphere,axis:cameraMatrix.slice(0,3),planeU:u,planeV:v,planeOrigin:origin,tanHalfFov:Math.hypot(...v)/2},gridKey=JSON.stringify(input);
    if(!oceanGrid||gridKey!==oceanGridKey){oceanGrid=buildOriginalOceanGeometry(input,oceanMath);oceanGridKey=gridKey;}
    const grid=oceanGrid;
    oceanIndexCount=grid.indexCount;oceanRows=grid.rows;
    if(grid.indexCount)draws.push({compiled:await compile(names.shader),input:{shader:names.shader,state:6,stride:16,vertices:grid.vertices,indices:grid.indices,attributes:{a_position:{format:'vec4',offset:0},a_normal:{format:'snorm4',offset:12}},uniforms:{...shaderUniforms,u_model:[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1],u_specScale:1},textures,colorFormats:['rgba32f']},links:{u_waterSim:{source:15,flip:true},u_waterSimNorm:{source:15,attachment:1,flip:true},u_opaqueTexRGBDepth:{source:FULL_SOURCE.opaque,flip:true}}});
   }
   for(const water of saved)draws.push({compiled,input:{shader:names.meshShader,state:6,stride:20,vertices:stream!,indices:indices!,attributes:{a_position:{format:'vec4',offset:0},a_normal:{format:'snorm4',offset:16}},uniforms:{...shaderUniforms,u_model:water.model,u_specScale:water.specScale},textures,colorFormats:['rgba32f'],immutableGeometry:true},
    links:{u_waterSim:{source:15,flip:true},u_waterSimNorm:{source:15,attachment:1,flip:true},u_opaqueTexRGBDepth:{source:FULL_SOURCE.opaque,flip:true}}});
   return {simulation:sim,water:draws};
  },
  commit(){first=false;frames++;},
  info:()=>({objects:nodeIds.length,frames,shader:names.meshShader,ocean:{enabled:evaluate.oceanRenderEnabled(),shader:names.shader,indices:oceanIndexCount,rows:oceanRows,grid:[96,96],math:'Browser float libm and reciprocal square root; original captured arithmetic verified independently'},normal:names.normal,caustics:names.caustics,puddleNormal:names.meshShader.endsWith('Wet')?'PuddleSim zero-gradient reset':null,grid:[256,256],terms:lastTerms.slice(),waterNodeIds:nodeIds.slice(),
   scope:'Original 96x96 Ocean projected sphere grid under the shared SetOceanRender state, Plane10x10 local Water transforms and original Ocean/OceanMesh variants; WaterSim/Reset two-target GLSL with GPU history and restored material wind scroll. The water opaque sampler maps viewport zero sky depth to the equivalent 256000m far distance; actual surface depth is unchanged. Browser Ocean math, editor camera grid focus, zero Avatar contact impulses, sky-only probe and empty point-light grid are explicit adapters. Wet variants bind the PuddleSim signed zero-gradient reset. Actual PuddleSim/rain drops, scene reflections, complete Ocean lifecycle and Metal image parity remain pending'})
 };
}
