import fs from 'node:fs';import path from 'node:path';import * as THREE from 'three';
import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {nativeMaterialDefs} from '../src/core/mesh-surfaces';import {savedWaterRenderStates} from '../src/core/water-render-state';
import {AssetCatalog} from '../src/main/assets';import {VulkanHost} from '../src/main/vulkan';import {createViewportEnvironment} from '../src/main/viewport-environment';import {createViewportCloud} from '../src/main/vulkan-viewport-cloud';import {createVulkanEnvironment} from '../src/main/vulkan-environment';import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';
import {createBakedObject} from '../src/renderer/baked-renderer';import {exportVulkanScene} from '../src/renderer/vulkan-viewport';import {compileVulkanShaders} from '../src/main/vulkan-shaders';import {bindVulkanMaterial} from '../src/main/vulkan-material';import {writeEffectPng} from './effect-png';
async function main(){
 const level=process.argv[2]??'Dusk',data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',nodes=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin'))).nodes,mesh=new MeshesDocument(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),catalog=new AssetCatalog(data,level),scene=new THREE.Scene(),host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));
 try{
  await host.start();for(const g of mesh.geometries.filter(g=>g.kind==='terrain'||g.kind==='skirt'))scene.add(createBakedObject(mesh.geometryView(g),nativeMaterialDefs(level),'material',false));
  const env=createViewportEnvironment(nodes,undefined,{level}),cloud=createViewportCloud(level,nodes,mesh,catalog,host,'/tmp/sky-water-visibility',undefined,env),baked=createVulkanBakedRenderer(level,nodes,catalog,host,'/tmp/sky-water-visibility',env),background=createVulkanEnvironment(nodes,catalog,host,'/tmp/sky-water-visibility',env);baked.setDraws(exportVulkanScene(scene).baked??[]);await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});
  const target=new THREE.Vector3().fromArray(savedWaterRenderStates(nodes)[0].model.slice(12,15)),camera=new THREE.PerspectiveCamera(55,4/3,.05,64000);camera.position.copy(target).add(new THREE.Vector3(0,4,6));camera.lookAt(target);camera.updateMatrixWorld();const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),cameraMatrix=camera.matrixWorld.toArray();
  env.beginFrame(camera.position.toArray());cloud.advance(0,0,[0,0,0,0]);const jittered=await cloud.prepare(128,96,matrix,cameraMatrix,0);await background(128,96,jittered,cameraMatrix,true);await baked.render(128,96,jittered,cameraMatrix);
  const original=host.fullFrame.bind(host);
  const vertex='#version 450\nvoid main(){vec2 p[4]=vec2[](vec2(-1,-1),vec2(1,-1),vec2(1,1),vec2(-1,1));gl_Position=vec4(p[gl_VertexIndex],0,1);}';
  for(const mode of ['water','absolute','negative','depth','fog','temporal','final']){
   host.fullFrame=async(w,h,m,graph)=>{
    if(mode!=='final'){
     const source=['water','absolute','negative','depth'].includes(mode)?13:mode==='fog'?7:10,format=source===13?'rgba32f':'rgba16f',expr=mode==='depth'?'vec3(log2(1.+abs(p.w))/16.)':mode==='water'?'p.rgb*1000.':mode==='absolute'?'abs(p.rgb)*1000000.':mode==='negative'?'vec3(lessThan(p.rgb,vec3(0.)))':'vec3(1.)-p.rgb';
     const compiled=await compileVulkanShaders([{stage:'vert',text:vertex,format:'vulkan450'},{stage:'frag',text:`#version 450\nuniform sampler2D u_source;layout(location=0)out vec4 color;void main(){vec4 p=texelFetch(u_source,ivec2(gl_FragCoord.xy),0);color=vec4(${expr},1);}`,format:'vulkan450'}],'/tmp/sky-water-diagnostic');
     const material=await bindVulkanMaterial(compiled,{shader:'Diagnostic',state:4,stride:1,vertices:new Uint8Array(4),indices:Uint32Array.from([0,1,2,0,2,3]),attributes:{},uniforms:{},textures:{u_source:{format,dimensions:[1,1,1],linear:false,repeat:false,data:new Uint8Array(format==='rgba32f'?16:8)}},colorFormats:['rgba32f']});
     await host.setFullStage(11,[material]);const last=graph.stages.at(-1)!;last.links=[{draw:0,binding:compiled.descriptors.find(d=>d.name==='u_source')!.binding,source,attachment:0,format,flip:false}];
    }
    return original(w,h,m,graph);
   };
   const output=await cloud.compose(128,96,matrix,cameraMatrix);await writeEffectPng(`/root/sky-research/water-stage-${level}-${mode}.png`,128,96,output.pixels);
   let visible=0,maximum=0;for(let i=0;i<output.pixels.length;i+=4){const n=Math.max(...output.pixels.slice(i,i+3));visible+=Number(n>2);maximum=Math.max(maximum,n);}console.log(JSON.stringify({mode,visible,maximum,averageLum:cloud.info().averageLum}));
  }
  env.dispose();
 }finally{host.stop();scene.traverse(o=>{if(o instanceof THREE.Mesh){o.geometry.dispose();for(const m of Array.isArray(o.material)?o.material:[o.material])m.dispose();}});}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
