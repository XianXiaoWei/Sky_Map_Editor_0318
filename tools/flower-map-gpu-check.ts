import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';import assert from 'node:assert/strict';import * as THREE from 'three';
import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {nativeMaterialDefs} from '../src/core/mesh-surfaces';
import {createBakedObject,type BakedView} from '../src/renderer/baked-renderer';import {exportVulkanScene} from '../src/renderer/vulkan-viewport';import {createViewportEnvironment} from '../src/main/viewport-environment';import {createViewportCloud} from '../src/main/vulkan-viewport-cloud';import {createVulkanEnvironment} from '../src/main/vulkan-environment';import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';import {VulkanHost} from '../src/main/vulkan';import {AssetCatalog} from '../src/main/assets';import {writeEffectPng} from './effect-png';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
async function main(){const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),report:any={passed:false,scope:'Actual map terrain, original water/flower/cloud shaders and shared environment; camera near saved FlowerPatch, disable/re-enable and resize checks. Linux software Vulkan; not complete game/class or device visual acceptance.',maps:[]};
 try{
  report.device=await host.start();
  for(const level of ['SkyHub2','Dawn']){
   const source=fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')),meshSource=fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes')),nodes=new ObjectsDocument(source).nodes,mesh=new MeshesDocument(meshSource),catalog=new AssetCatalog(data,level),env=createViewportEnvironment(nodes),cache='/tmp/sky-cloud-preview-shaders',preview=createViewportCloud(level,nodes,mesh,catalog,host,cache,undefined,env),baked=createVulkanBakedRenderer(level,nodes,catalog,host,cache,env),background=createVulkanEnvironment(nodes,catalog,host,cache,env),scene=new THREE.Scene();
   for(const g of mesh.geometries.filter(g=>g.kind==='terrain'||g.kind==='skirt'))scene.add(createBakedObject(mesh.geometryView(g) as BakedView,nativeMaterialDefs(level),'material',false));baked.setDraws(exportVulkanScene(scene).baked??[]);await host.setScene({vertices:new Float32Array(),draws:new Uint32Array()});
   const patches=env.flowerPatchStates(),patch=patches.find(p=>p.bytes[120]&&new DataView(p.bytes.buffer).getUint32(124,true)>0)??patches.find(p=>p.bytes[120]);assert.ok(patch);const view=new DataView(patch.bytes.buffer),center=new THREE.Vector3(view.getFloat32(16,true),view.getFloat32(20,true),view.getFloat32(24,true)),camera=new THREE.PerspectiveCamera(55,4/3,.1,64000);camera.position.copy(center).add(new THREE.Vector3(3,2.5,4));camera.lookAt(center);camera.updateMatrixWorld();
   const rows=[];
   for(let frame=0;frame<5;frame++){
    if(frame===2)for(const p of patches)assert.equal(env.setControllerEnabled(p.nodeId,false),true);
    if(frame===3)for(const p of patches)assert.equal(env.setControllerEnabled(p.nodeId,!!p.bytes[120]),true);
    const width=frame===4?192:160,height=frame===4?144:120;camera.aspect=width/height;camera.updateProjectionMatrix();const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),cameraMatrix=camera.matrixWorld.toArray();
    env.advance({delta:1/60,timeScale:1});env.beginFrame(camera.position.toArray());const wind=[...env.wind(camera.position.toArray()),0];baked.advance(1/60,wind);preview.advance(1/60,frame/60,wind);const renderMatrix=await preview.prepare(width,height,matrix,cameraMatrix,frame/60);await background(width,height,renderMatrix,cameraMatrix,true);await baked.render(width,height,renderMatrix,cameraMatrix);const result=await preview.compose(width,height,matrix,cameraMatrix),info=preview.info();assert.equal(result.pixels.length,width*height*4);assert.ok(result.averageLum!>0);
    rows.push({frame,width,height,sha256:hash(result.pixels),water:info.water,flowers:info.flowers,passes:info.passes});if(frame===2){assert.equal(info.flowers.visiblePoints,0);assert.ok(!info.passes.includes('Flower'));}else{assert.ok(info.flowers.initialPoints as number>0);assert.ok(info.passes.includes('Flower'));assert.equal(info.flowers.pending.length,0);}
    if(frame===1)await writeEffectPng(`docs/flower-map-${level}.png`,width,height,result.pixels);
   }
   assert.notEqual(rows[1].sha256,rows[2].sha256,`${level}: disabling FlowerPatch did not change pixels`);assert.notEqual(rows[2].sha256,rows[3].sha256,`${level}: re-enabling FlowerPatch did not change pixels`);
   assert.equal(hash(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin'))),hash(source));assert.equal(hash(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),hash(meshSource));report.maps.push({level,rows,screenshot:`docs/flower-map-${level}.png`,sourcesUnchanged:true});env.dispose();
  }
  report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/flower-map-gpu-check.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:report.passed,maps:report.maps.map((m:any)=>({level:m.level,frames:m.rows.length,points:m.rows[0].flowers.initialPoints,screenshot:m.screenshot}))}));}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
