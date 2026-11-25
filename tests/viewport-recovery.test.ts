import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import {VulkanViewport} from '../src/renderer/vulkan-viewport';

test('Failed frames retain the displayed canvas and recover with all GPU scene bindings resubmitted',async()=>{
 const names=['document','ImageData','requestAnimationFrame','cancelAnimationFrame'];
 const before=names.map(n=>Object.getOwnPropertyDescriptor(globalThis,n));
 let displayed=0,frames=0,scenes=0,overlays=0,restarts=0,fail=false;
 const replacements=[{createElement:()=>({width:1,height:1,style:{},dataset:{},getContext:()=>({putImageData(){displayed++;}})})},class {},()=>1,()=>{}];
 names.forEach((n,i)=>Object.defineProperty(globalThis,n,{value:replacements[i],configurable:true}));
 let viewport:VulkanViewport|undefined;
 try{
  viewport=new VulkanViewport({vulkanInfo:async()=>({backend:'Vulkan',device:'mock'}),vulkanRestart:async()=>{restarts++;fail=false;},vulkanScene:async()=>{scenes++;},vulkanOverlay:async()=>{overlays++;},vulkanFrame:async(width,height)=>{frames++;if(fail)throw new Error('isolated frame failure');return {width,height,pixels:new Uint8Array(width*height*4)};}},()=>{});
  viewport.setSize(8,8);viewport.setAnimationLoop(()=>{});await viewport.initialize();
  const scene=new THREE.Scene(),mesh=new THREE.Mesh(new THREE.BoxGeometry(),new THREE.MeshBasicMaterial()),camera=new THREE.PerspectiveCamera(50,1,.1,1000);scene.add(mesh);scene.userData.level='Recovery';camera.position.z=10;
  const draw=async()=>{viewport!.render(scene,camera);await new Promise<void>(r=>setImmediate(r));};
  await draw();assert.equal(displayed,1);fail=true;viewport.invalidate();await draw();assert.equal(displayed,1);assert.equal(viewport.domElement.dataset.vulkanError,'isolated frame failure');
  const failedRequests=frames;await draw();await draw();assert.equal(frames,failedRequests);assert.equal(viewport.recoveryElement.hidden,false);
  mesh.position.x=3;await viewport.recover();await draw();
  assert.equal(restarts,1);assert.equal(scenes,2);assert.equal(overlays,2);assert.equal(displayed,2);assert.equal(mesh.position.x,3);
  assert.equal(viewport.domElement.dataset.vulkanError,undefined);assert.equal(viewport.recoveryElement.hidden,true);
  mesh.geometry.dispose();(mesh.material as THREE.Material).dispose();
 }finally{viewport?.dispose();names.forEach((n,i)=>{if(before[i])Object.defineProperty(globalThis,n,before[i]!);else Reflect.deleteProperty(globalThis,n);});}
});
test('Scene owners can wait for the submitted frame before map rebuild and disposal',async()=>{
 const names=['document','ImageData','requestAnimationFrame','cancelAnimationFrame'],before=names.map(n=>Object.getOwnPropertyDescriptor(globalThis,n));
 const replacements=[{createElement:()=>({width:1,height:1,style:{},dataset:{},getContext:()=>({putImageData(){}})})},class {},()=>1,()=>{}];names.forEach((n,i)=>Object.defineProperty(globalThis,n,{value:replacements[i],configurable:true}));
 let viewport:VulkanViewport|undefined,release:()=>void=()=>{},finished=false;
 try{
  viewport=new VulkanViewport({vulkanInfo:async()=>({backend:'Vulkan',device:'mock'}),vulkanScene:async()=>{},vulkanFrame:async(width,height)=>{await new Promise<void>(resolve=>{release=resolve;});return {width,height,pixels:new Uint8Array(width*height*4)};}},message=>assert.fail(message));
  viewport.setAnimationLoop(()=>{});await viewport.initialize();const scene=new THREE.Scene(),camera=new THREE.PerspectiveCamera(50,1,.1,1000);scene.userData.level='Drain';viewport.render(scene,camera);
  const pending=viewport.whenIdle().then(()=>{finished=true;});await new Promise<void>(r=>setImmediate(r));assert.equal(finished,false);release();await pending;assert.equal(finished,true);assert.equal(viewport.domElement.dataset.frameSequence,'1');
 }finally{viewport?.dispose();names.forEach((n,i)=>{if(before[i])Object.defineProperty(globalThis,n,before[i]!);else Reflect.deleteProperty(globalThis,n);});}
});
