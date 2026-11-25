import * as THREE from 'three';
import {OBB} from 'three/addons/math/OBB.js';
import {MeshBVH} from 'three-mesh-bvh';
import type {ObjectNode} from '../core/objects';
import type {MeshesDocument} from '../core/meshes';
import {generateOriginalFlowerTexture} from '../core/flower-texture-runtime';
import {generateOriginalFlowerVertices,type FlowerVertexServices} from '../core/flower-vertices-runtime';
import {originalFlowerSeeds,prepareOriginalFlowerPatchRegion} from '../core/flower-distribution';
import {updateOriginalFlowerBarn} from '../core/flower-update-runtime';
import {cloudCardFrustumPlanes} from '../core/cloud-card-visibility';
import {originalPointInObb} from '../core/weather-event-runtime';
import {itemFloatBytes,itemFloats} from '../core/item-effect-arithmetic';
import {initialMaterialDynamics,stepMaterialDynamics} from '../core/material-dynamics';
import type {AssetCatalog} from './assets';
import type {createViewportEnvironment} from './viewport-environment';
import {compileVulkanShaders} from './vulkan-shaders';
import {vulkanProgramSources} from './vulkan-program';
import type {VulkanMaterialInput} from './vulkan-material';
import type {WaterEffectStageInput} from './viewport-water-effects';
import {FULL_SOURCE} from '../core/vulkan-full-preview';

type Texture=VulkanMaterialInput['textures'][string];
const f=Math.fround,add=(a:number,b:number)=>f(a+b),sub=(a:number,b:number)=>f(a-b),mul=(a:number,b:number)=>f(a*b);
const placeholder=(format:'rgba32f'|'rgba16f'):Texture=>({format,dimensions:[1,1,1],linear:true,repeat:false,data:new Uint8Array(format==='rgba32f'?16:8)});
const copySources=[{stage:'vert' as const,format:'vulkan450' as const,text:'#version 450\nvoid main(){vec2 p[4]=vec2[](vec2(-1,-1),vec2(1,-1),vec2(1,1),vec2(-1,1));gl_Position=vec4(p[gl_VertexIndex],0,1);}'},
 {stage:'frag' as const,format:'vulkan450' as const,text:'#version 450\nuniform sampler2D u_baseColor,u_baseDepth;layout(location=0) out vec4 color;layout(location=1) out vec4 depth;void main(){color=texelFetch(u_baseColor,min(ivec2(gl_FragCoord.xy),textureSize(u_baseColor,0)-1),0);depth=texelFetch(u_baseDepth,min(ivec2(gl_FragCoord.xy),textureSize(u_baseDepth,0)-1),0);}'}];
export const viewportFlowerBackgroundSources=copySources;
const attributes={a_position:{format:'vec3' as const,offset:0},a_normal:{format:'snorm4' as const,offset:12},a_color:{format:'unorm4' as const,offset:16},a_userData0:{format:'unorm4' as const,offset:20},a_light0:{format:'unorm4' as const,offset:24},a_light1:{format:'unorm4' as const,offset:28}};
/** Viewport ground services use real terrain triangles and packed lighting.
 * BVH tracing and OBB overlap are explicit editor services; native collision
 * jobs/occlusion remain pending; the verified dynamic pool runs below. */
export function createViewportFlowerEffects(nodes:ObjectNode[],mesh:MeshesDocument,catalog:AssetCatalog,cache:string,image:(name:string)=>Texture,evaluate:ReturnType<typeof createViewportEnvironment>){
 const nodeIds=nodes.filter(n=>n.className==='FlowerPatch').map(n=>n.id),base=0x570000000n;
 let fieldKey='',vertices=new Uint8Array(),indices=new Uint32Array(),frames=0,visiblePoints=0;
 let updateFrame:((eye:number[],forward:number[],matrix:number[])=>void)|undefined;
 const renderVariables:Record<string,number>={u_flowerHeight:1,u_flowerSize:1};
 let dynamics=initialMaterialDynamics(),geometry:ReturnType<typeof terrain>|undefined,diagnostics:Record<string,unknown>={},pending:{nodeId:number;reason:string}[]=[];
 let shader:ReturnType<typeof compileVulkanShaders>|undefined,copy:ReturnType<typeof compileVulkanShaders>|undefined;
 const sprite=generateOriginalFlowerTexture(),rgba=new Uint8Array(32*32*4);for(let i=0;i<1024;i++){rgba[i*4]=sprite[i*2];rgba[i*4+1]=sprite[i*2+1];rgba[i*4+3]=255;}
 const spriteTexture:Texture={format:'rgba8',dimensions:[32,32,1],linear:true,repeat:false,data:rgba,immutable:true};
 function terrain(){return mesh.geometries.filter(g=>g.kind==='terrain').map((g,i)=>{
  const view=mesh.geometryView(g),buffer=new THREE.BufferGeometry();buffer.setAttribute('position',new THREE.BufferAttribute(view.positions,3));buffer.setIndex(new THREE.BufferAttribute(view.indices,1));
  const bvh=new MeshBVH(buffer,{indirect:true}),triangles=Array.from({length:view.indices.length/3},(_,t)=>{const ids=Array.from(view.indices.subarray(t*3,t*3+3));return {vertices:ids.map(id=>Array.from(view.positions.subarray(id*3,id*3+3))),normalY:view.packedNormals[ids[0]*4+1],material:view.materialIds[ids[0]*4]};});
  return {view,bvh,buffer,triangles,pointer:base+0x600000n+BigInt(i)*0x300n};
 });}
 function overlap(bytes:Uint8Array,center:number[],extent:number[]){
  const matrix=itemFloats(bytes.subarray(144,208)),axes=[0,1,2].map(i=>new THREE.Vector3(...matrix.slice(i*4,i*4+3) as [number,number,number])),half=axes.map(a=>a.length());axes.forEach(a=>a.normalize());
  const rotation=new THREE.Matrix3().set(axes[0].x,axes[1].x,axes[2].x,axes[0].y,axes[1].y,axes[2].y,axes[0].z,axes[1].z,axes[2].z);
  return new OBB(new THREE.Vector3(...matrix.slice(12,15) as [number,number,number]),new THREE.Vector3(...half as [number,number,number]),rotation).intersectsOBB(new OBB(new THREE.Vector3(...center as [number,number,number]),new THREE.Vector3(...extent as [number,number,number])));
 }
 function rebuild(patches:ReturnType<typeof evaluate.flowerPatchStates>){
  pending=[];for(const p of patches)if(new DataView(p.bytes.buffer,p.bytes.byteOffset).getUint32(124,true)!==0)try{prepareOriginalFlowerPatchRegion(p.bytes);}catch(error){p.bytes[120]=0;pending.push({nodeId:p.nodeId,reason:String(error)});}
  geometry??=terrain();const outputOffset=Math.max(0x800000,Math.ceil((0x600000+geometry.length*0x300)/16)*16),temporary=outputOffset+65536*32;
  const arena=new Uint8Array(temporary+0x10000),offset=(p:bigint)=>Number(p-base),data=(p:bigint,n:number)=>new DataView(arena.buffer,offset(p),n),m={bytes:(p:bigint,n:number)=>arena.subarray(offset(p),offset(p)+n),read32:(p:bigint)=>data(p,4).getUint32(0,true),read64:(p:bigint)=>data(p,8).getBigUint64(0,true),write8:(p:bigint,n:number)=>{arena[offset(p)]=n;},write32:(p:bigint,n:number)=>data(p,4).setUint32(0,n,true),write64:(p:bigint,n:bigint)=>data(p,8).setBigUint64(0,n,true),string:()=>''};
  patches.forEach((p,i)=>arena.set(p.bytes,0xed0+i*272));geometry.forEach(g=>{m.write64(g.pointer+0x1d0n,g.pointer+0x200n);});
  const plan=originalFlowerSeeds(patches,geometry.map(g=>g.triangles),overlap),byPointer=new Map(geometry.map(g=>[g.pointer,g])),ray=new THREE.Ray(),success=new Uint8Array(1024);let points=0;
  const generatorServices:FlowerVertexServices={
    contains:(point,region)=>originalPointInObb(itemFloatBytes(point),m.bytes(region,64)),
    trace:(origins,_direction,distance)=>origins.map(origin=>{ray.origin.fromArray(origin);ray.direction.set(0,-1,0);let nearest=distance,triangle=0,handle=0n;for(const g of geometry!){const hit=g.bvh.raycastFirst(ray,THREE.DoubleSide);if(hit&&hit.distance<=nearest){nearest=hit.distance;triangle=hit.faceIndex!;handle=g.pointer;}}return {distance:f(nearest),triangle,mesh:handle};}),
    material:(handle,triangle)=>byPointer.get(handle)!.triangles[triangle].material,
    normal:(handle,triangle)=>{const [a,b,c]=byPointer.get(handle)!.triangles[triangle].vertices,u=c.map((n,i)=>sub(n,a[i])),v=c.map((n,i)=>sub(n,b[i])),normal=[sub(mul(u[1],v[2]),mul(u[2],v[1])),sub(mul(u[2],v[0]),mul(u[0],v[2])),sub(mul(u[0],v[1]),mul(u[1],v[0]))],length=f(Math.sqrt(add(add(mul(normal[0],normal[0]),mul(normal[1],normal[1])),mul(normal[2],normal[2]))));return [...normal.map(n=>length>f(.00001)?f(n/length):n),0];},
    lighting:(handle,triangle)=>{const g=byPointer.get(handle)!,first=g.view.indices[triangle*3];return g.view.light.subarray(first*12,first*12+8);},defaultUserByte:()=>0
   };
  m.write32(base+0x35dd0n,plan.seeds.length);data(base+0x35dd4n,4).setFloat32(0,plan.densityScale,true);
  for(const [index,seed] of plan.seeds.entries()){
   const sphere=base+0x11dd0n+BigInt(index)*16n,cluster=base+0x21dd0n+BigInt(index)*16n;arena.set(itemFloatBytes(seed.sphere),offset(sphere));data(cluster,4).setFloat32(0,seed.density,true);seed.patches.forEach((p,i)=>arena[offset(cluster)+10+i]=p);arena[offset(cluster)+14]=seed.patches.length;data(cluster+8n,2).setUint16(0,seed.reserve,true);
   if(Math.trunc(add(mul(seed.density,plan.densityScale),1))>seed.reserve)m.write8(base+0x455de0n,1);
   if(points+seed.reserve>98304||seed.reserve>1024)throw new Error('Original initial flower candidate reservation exceeds connected capacity');
   const outputs=Array.from({length:seed.reserve},(_,i)=>base+0x35dd8n+BigInt(points+i)*32n);generateOriginalFlowerVertices(m,base,cluster,sphere,outputs,success,seed.reserve,index<<12,false,generatorServices);
   const accepted=outputs.filter((_,i)=>success[i]).map(p=>new Uint8Array(m.bytes(p,32)));accepted.forEach((v,i)=>arena.set(v,0x35dd8+(points+i)*32));data(cluster+6n,2).setUint16(0,accepted.length,true);points+=accepted.length;
  }
  arena.fill(255,0x435dd8,0x455dd8);let head=0n;for(let slot=32767;slot>=0;slot--){const p=base+0x335dd8n+BigInt(slot)*32n;m.write64(p,head);head=p;}m.write64(base+0x455dd8n,head);m.write8(base+0x988n,1);m.write8(base+0xec8n,1);m.write32(base+0x110n,32);m.write32(base+0x160n,2);
  vertices=new Uint8Array();indices=new Uint32Array();diagnostics={candidateTriangles:plan.candidateTriangles,seeds:plan.seeds.length,connectedSeeds:plan.seeds.length,initialPoints:points,patchOverflow:plan.patchOverflow,dynamicPoolCapacity:32768};
  updateFrame=(eye,forward,matrix)=>{
   let cursor=temporary;const stack:{pointer:bigint;end:number;start:number;freed:boolean}[]=[],planes=cloudCardFrustumPlanes(matrix);
   const result=updateOriginalFlowerBarn(m,base,base+0x700000n,base+0x700100n,base+0x700200n,base+0x700300n,{
    enabled:()=>true,height:()=>1,size:()=>1,defaultUserByte:()=>0,debugEnabled:()=>true,uniform:(_render,name,value)=>{renderVariables[name]=value;},cameraPosition:()=>[...eye,1],cameraForward:()=>[...forward,0],mapVertices:()=>base+BigInt(outputOffset),
    visibility:(_owner,spheres,count,results)=>{for(let i=0;i<count;i++){const sphere=itemFloats(m.bytes(spheres+BigInt(i)*16n,16)),visible=planes.every(p=>!(-sphere[3]>add(add(mul(sphere[0],p[0]),mul(sphere[2],p[2])),add(mul(sphere[1],p[1]),p[3]))));m.write32(results+BigInt(i)*4n,Number(visible));}},
    allocator:()=>base+0x700400n,heap:()=>base+0x700500n,
    allocate:(_owner,bytes,_heap,alignment)=>{const start=cursor;cursor=Math.ceil(cursor/alignment)*alignment;const pointer=base+BigInt(cursor);cursor+=bytes;if(cursor>arena.length)throw new Error('Flower frame scratch allocation exceeded');stack.push({pointer,start,end:cursor,freed:false});return pointer;},
    free:(_owner,p)=>{const entry=stack.find(e=>e.pointer===p);if(!entry)throw new Error('Flower frame scratch release is not owned');entry.freed=true;while(stack.at(-1)?.freed){cursor=stack.pop()!.start;}},
    generate:(_barn,_collision,cluster,sphere,points,success,count,seed,instant)=>{const outputs=Array.from({length:count},(_,i)=>m.read64(points+BigInt(i)*8n));generateOriginalFlowerVertices(m,base,cluster,sphere,outputs,m.bytes(success,count),count,seed,instant,generatorServices);},
    statistics:(_barn,_camera,_stats,extra,initial,total,generated)=>{Object.assign(diagnostics,{dynamicPoints:extra,initialDrawnPoints:initial,drawnPoints:total,generatedThisFrame:generated});}
   });
   const count=result.updated?result.drawCount:0;vertices=new Uint8Array(m.bytes(base+BigInt(outputOffset),count*32));if(indices.length!==count)indices=Uint32Array.from({length:count},(_,i)=>i);visiblePoints=count;
  };
 }
 return {
  count:nodeIds.length,
  advance(delta:number,wind:number[]){dynamics=stepMaterialDynamics(dynamics,{delta,timeScale:1,wind,scrollScale:1});},
  reset(){visiblePoints=0;},
  async stages(width:number,height:number,cameraMatrix:number[],uniforms:Record<string,unknown>,water:boolean,waterTerms:number[]){
   if(!nodeIds.length)return undefined;
   const patches=evaluate.flowerPatchStates(),key=patches.map(p=>Buffer.from(p.bytes.subarray(16,136)).toString('hex')).join('|');if(key!==fieldKey){rebuild(patches);fieldKey=key;}
   visiblePoints=0;
   const eye=cameraMatrix.slice(12,15),forward=cameraMatrix.slice(8,11).map(n=>-n),environment=evaluate(eye);visiblePoints=0;
   updateFrame!(eye,forward,uniforms.u_viewProj as number[]);if(!indices.length)return undefined;
   shader??=compileVulkanShaders(vulkanProgramSources(catalog.program('Flower')),cache);copy??=compileVulkanShaders(copySources,cache);
   const draws:WaterEffectStageInput[]=[{compiled:await copy,input:{shader:'ViewportFlowerBackground',stride:1,vertices:new Uint8Array(4),indices:Uint32Array.of(0,1,2,0,2,3),attributes:{},state:4,uniforms:{},textures:{u_baseColor:placeholder('rgba32f'),u_baseDepth:placeholder('rgba32f')},colorFormats:['rgba32f','rgba32f'],immutableGeometry:true},links:{u_baseColor:{source:FULL_SOURCE.alpha},u_baseDepth:{source:FULL_SOURCE.alpha,attachment:1}}}];
   const textures={u_texture:spriteTexture,u_windPattern:image('GrassNorTex1'),u_waterSim:placeholder('rgba16f'),u_waterSimNorm:placeholder('rgba16f')};
   const projection=new THREE.Matrix4().fromArray(uniforms.u_viewProj as number[]).multiply(new THREE.Matrix4().fromArray(cameraMatrix));
   draws.push({compiled:await shader,input:{shader:'Flower',topology:'points',state:10,stride:32,vertices,indices,attributes,colorFormats:['rgba32f','rgba32f'],textures,
    uniforms:{...uniforms,...renderVariables,u_view:new THREE.Matrix4().fromArray(cameraMatrix).invert().toArray(),u_averageSkyColor:environment.average.slice(0,3),u_viewportSize:[width,height],u_unitHeightFrac:projection.elements[5],u_windScroll1:dynamics.scrolls[1].slice(0,3),u_windScroll2:dynamics.scrolls[2].slice(0,3),u_waterSimTerms:water?waterTerms:[0,0,0,0]}},links:water?{u_waterSim:{source:15,flip:true},u_waterSimNorm:{source:15,attachment:1,flip:true}}:{}});
   return draws;
  },
  commit(){frames++;},
  info:()=>({objects:nodeIds.length,frames,visiblePoints,initialPoints:Number(diagnostics.initialPoints??0),...diagnostics,pending:pending.map(p=>({...p})),scope:'Original Flower point GLSL; native-verified RG texture, seed setup, 32-byte generation and whole Update including 300-per-frame growth budget, general pool, LOD/fade/free and mapped vertices. Editor BVH ground tracing/OBB overlap, camera/frustum-only Visibility and GPU map/allocator services use actual terrain/material/first-vertex lighting. FlowerShadow, native collision/spatial jobs/occlusion, complete GPU owner/resource lifecycle and game image acceptance remain pending.'})
 };
}
