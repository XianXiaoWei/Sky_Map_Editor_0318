import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import * as THREE from 'three';
import {readResourceMesh} from '../src/core/resources';
import {readResourceAnimationList} from '../src/core/resource-animation-list';
import {ResourceModelAnimationPreview,resourceModelPreviewActions,resourceModelDefaultAnimationSettings} from '../src/core/resource-model-animation-preview';
import {ObjectsDocument} from '../src/core/objects';
import {ModelAnimationPreviewController} from '../src/renderer/model-animation-preview';
import {resourceModelGeometry,exportResourceModel} from '../src/renderer/resource-model-renderer';
import {VulkanViewport} from '../src/renderer/vulkan-viewport';
const root=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',list=readResourceAnimationList(fs.readFileSync(root+'/Meshes/Bin/AnimationList.dat'));
const load=(name:string)=>readResourceMesh(fs.readFileSync(`${root}/Meshes/Bin/${name}.mesh`));
test('Bird motion weights blend original move/idle primary poses with independent clocks',()=>{
 const mesh=load('CharBirdAnim'),poses:Float32Array[]=[];
 for(const weight of [0,1,.5]){let captured!:Float32Array;const preview=new ResourceModelAnimationPreview(mesh,list,'critterMove',{secondaryName:'critterIdle',secondaryWeight:()=>weight,poseModifier:p=>{captured=p.slice();}});const result=preview.step(.2);assert.ok(result.positions.every(Number.isFinite));poses.push(captured);}
 assert.notDeepEqual(poses[0],poses[1]);for(let i=0;i<mesh.animation!.bones.length;i++)for(const k of [0,1,2,8,9,10])assert.ok(Math.abs(poses[2][i*12+k]-(poses[0][i*12+k]+poses[1][i*12+k])*.5)<1e-4,`bone ${i} lane ${k}`);
 const independent=new ResourceModelAnimationPreview(mesh,list,'critterMove',{secondaryName:'critterIdle',secondaryWeight:()=>.5,randomStart:123456789});assert.notEqual(independent.snapshot().phase,0);assert.throws(()=>new ResourceModelAnimationPreview(mesh,list,'critterMove',{secondaryName:'missing'}));
});
test('Saved default requests animate unnamed flags and night rays; speed, random starts and static default actions remain original',()=>{
 for(const name of ['FlagDAnim','FlagEAnim','FlagELoseAnim','DawnFlagsAnim_01','WireHangFlagAnim','CharSkyRayCNightAnim','CharSkyRayDNightAnim']){
  const mesh=load(name),a=new ResourceModelAnimationPreview(mesh,list),b=new ResourceModelAnimationPreview(mesh,list,undefined,{speedMult:.2}),c=new ResourceModelAnimationPreview(mesh,list,undefined,{randomStart:123456789});
  assert.notDeepEqual(a.step(0).packedPositions,a.step(.2).packedPositions,name);
  a.step(.2);b.step(.4);assert.ok(Math.abs(b.snapshot().phase-a.snapshot().phase*.2)<1e-6,name);
  assert.notEqual(c.snapshot().phase,0);assert.equal(c.snapshot().elapsed,0);
 }
 const crab=new ResourceModelAnimationPreview(load('CharCrabAAnim'),list);assert.equal(crab.snapshot().name,'idle');assert.deepEqual(crab.step(0).packedPositions,crab.step(1).packedPositions);
 const nodes=new ObjectsDocument(fs.readFileSync(root+'/Levels/SkyHub2/Objects.level.bin')).nodes;
 assert.deepEqual(resourceModelDefaultAnimationSettings(nodes[14]),{play:true,speedMult:Math.fround(.2),randomStart:true});
 assert.throws(()=>new ResourceModelAnimationPreview(load('FlagDAnim'),list,undefined,{speedMult:Infinity}),/速度/);
});
test('Original named bird, ray, crab run and flower tracks reach packed skinning with independent request clocks',()=>{
 for(const [name,action] of [['CharBirdAnim','critterMove'],['CharSkyRayCAnim','critterIdle'],['CharCrabAAnim','run'],['CharEnvFlowerAnim','closedLoop']]){
  const mesh=load(name),source=mesh.packedPositions!.slice(),a=new ResourceModelAnimationPreview(mesh,list,action),b=new ResourceModelAnimationPreview(mesh,list,action),first=a.step(0),next=a.step(.15);
  assert.notDeepEqual(next.packedPositions,first.packedPositions,name);assert.deepEqual(b.step(0).packedPositions,first.packedPositions);assert.equal(b.snapshot().elapsed,0);
  assert.deepEqual(mesh.packedPositions,source);assert.deepEqual(next.packedUvs,mesh.packedUvs);assert.equal(next.packedNormals!.length,mesh.packedNormals!.length);
  assert.ok([...next.positions,...next.normals].every(Number.isFinite));assert.throws(()=>a.step(-1));assert.equal(a.snapshot().elapsed,.15);
 }
 // The original crab idle is one frame; a clock must not invent motion.
 const idle=new ResourceModelAnimationPreview(load('CharCrabAAnim'),list,'idle');assert.deepEqual(idle.step(0).packedPositions,idle.step(1).packedPositions);
});
test('Viewport sends pose vertices through incremental IPC and resubmits materials and restored geometry when their identities change',async()=>{
 const names=['document','ImageData','requestAnimationFrame','cancelAnimationFrame'],previous=names.map(n=>Object.getOwnPropertyDescriptor(globalThis,n));
 const replacements=[{createElement:()=>({width:1,height:1,style:{},dataset:{},getContext:()=>({putImageData(){}})})},class {},()=>1,()=>{}];names.forEach((n,i)=>Object.defineProperty(globalThis,n,{value:replacements[i],configurable:true}));
 const controller=new ModelAnimationPreviewController();let viewport:VulkanViewport|undefined;
 try{
  let scenes=0,poses=0;viewport=new VulkanViewport({vulkanInfo:async()=>({backend:'Vulkan',device:'mock'}),vulkanScene:async()=>{scenes++;},vulkanModelTransforms:async()=>{},vulkanModelVertices:async updates=>{poses++;assert.equal(updates[0].nodeId,77);assert.ok('packedNormals' in updates[0]&&updates[0].packedNormals instanceof Int8Array);},vulkanFrame:async(width,height)=>({width,height,pixels:new Uint8Array(width*height*4)})},message=>assert.fail(message));
  viewport.setSize(8,8);viewport.setAnimationLoop(()=>{});await viewport.initialize();
  const mesh=load('CharBirdAnim'),g=resourceModelGeometry(mesh),material=new THREE.MeshBasicMaterial();material.userData.nativeModel={shader:'Diffuse',group:'Opaque'};const object=new THREE.Mesh(g,material);object.userData.nodeId=77;object.userData.sharedResource=true;
  const scene=new THREE.Scene();scene.add(object);scene.userData.level='Pose';scene.userData.animateModels=true;const camera=new THREE.PerspectiveCamera(50,1,.1,1000);camera.position.z=10;
  const draw=async()=>{viewport!.render(scene,camera);await new Promise<void>(r=>setImmediate(r));};
  controller.start(77,object,mesh,list,'critterMove');await draw();assert.equal(scenes,1);assert.equal(poses,0);
  controller.step(.1);await draw();assert.equal(scenes,1);assert.equal(poses,1);
  controller.start(77,object,mesh,list,'critterIdle');await draw();assert.equal(scenes,1);controller.start(77,object,mesh,list,'critterMove');controller.step(.2);await draw();assert.equal(scenes,1);assert.ok(poses>=2);material.needsUpdate=true;await draw();assert.equal(scenes,2);controller.stop();await draw();assert.equal(scenes,3);assert.equal(object.geometry,g);g.dispose();material.dispose();
 }finally{controller.stop();viewport?.dispose();names.forEach((n,i)=>{if(previous[i])Object.defineProperty(globalThis,n,previous[i]!);else Reflect.deleteProperty(globalThis,n);});}
});
test('Preview resolves original action names and rejects missing/external/mirrored/additive resources',()=>{
 const mesh=load('CharBirdAnim');assert.throws(()=>new ResourceModelAnimationPreview(mesh,list,'missing'),/不支持/);
 const modified={...list,files:list.files.map(file=>({...file,metaDatas:file.metaDatas.map(metadata=>({...metadata,mirrored:true}))}))};
 assert.ok(resourceModelPreviewActions(mesh,modified).every(a=>!a.available));assert.throws(()=>new ResourceModelAnimationPreview(mesh,modified,'critterMove'),/不支持/);
 const stripped=load('CharSkyKid_Body_Perfect_StripAnim_CompOcc_CompEdges');assert.ok(resourceModelPreviewActions(stripped,list).every(a=>!a.available));
});
test('Viewport animation clones only its own geometry, preserves UV/color/bake/transform, pauses and restores the source on stop',()=>{
 const mesh=load('CharBirdAnim'),g=resourceModelGeometry(mesh),material=new THREE.MeshBasicMaterial();material.userData.nativeModel={shader:'Diffuse',group:'Opaque'};
 const a=new THREE.Mesh(g,material),b=new THREE.Mesh(g,material);a.userData.nodeId=1;b.userData.nodeId=2;a.userData.sharedResource=b.userData.sharedResource=true;
 a.position.set(5,6,7);a.updateMatrixWorld();const controller=new ModelAnimationPreviewController(),before=exportResourceModel(b,material,0,mesh.indices.length);
 controller.start(1,a,mesh,list,'critterMove');controller.start(2,b,mesh,list,'critterIdle');assert.notEqual(a.geometry,b.geometry);assert.notEqual(a.geometry,g);
 controller.togglePause(2);const paused=exportResourceModel(b,material,0,mesh.indices.length);controller.step(.15);
 assert.deepEqual(exportResourceModel(b,material,0,mesh.indices.length),paused);const after=exportResourceModel(a,material,0,mesh.indices.length);assert.deepEqual(after.model.slice(12,15),[5,6,7]);
 for(let i=0;i<mesh.positions.length/3;i++){assert.deepEqual(after.vertices.subarray(i*48+20,i*48+48),before.vertices.subarray(i*48+20,i*48+48));assert.deepEqual(after.vertices.subarray(i*48+12,i*48+16),before.vertices.subarray(i*48+12,i*48+16));}
 controller.stop(1);assert.equal(a.geometry,g);assert.equal(a.userData.sharedResource,true);assert.equal(controller.snapshot(1),null);assert.equal(controller.running,false);
 controller.stop();assert.equal(b.geometry,g);assert.equal(controller.snapshot(2),null);assert.deepEqual(exportResourceModel(b,material,0,mesh.indices.length),before);g.dispose();material.dispose();
});

test('Single-frame crab idle retains the original clock but avoids skinning and redundant GPU revisions',()=>{
 const mesh=load('CharCrabAAnim'),preview=new ResourceModelAnimationPreview(mesh,list,'idle'),pose=preview.step(0);assert.equal(preview.step(.1),pose);assert.equal(preview.step(.2),pose);assert.ok(preview.snapshot().elapsed>.29);
 const object=new THREE.Mesh(resourceModelGeometry(mesh),new THREE.MeshBasicMaterial()),controller=new ModelAnimationPreviewController();controller.start(1,object,mesh,list,'idle');const revision=object.geometry.userData.nativePoseRevision;for(let i=0;i<60;i++)controller.step(1/60);assert.equal(object.geometry.userData.nativePoseRevision,revision);object.visible=false;const time=controller.snapshot(1)!.elapsed;controller.step(.2);assert.equal(controller.snapshot(1)!.elapsed,time);controller.stop();object.geometry.dispose();(object.material as THREE.Material).dispose();
});

test('Settled single-frame idle keeps byte-identical original request clocks across delta changes',async()=>{
 const {updateResourceAnimationClock}=await import('../src/core/resource-animation-clock');
 const preview=new ResourceModelAnimationPreview(load('CharCrabAAnim'),list,'idle',{speedMult:2,randomStart:12345});
 const internal=preview as unknown as {storage:Uint8Array;request:bigint};const offset=Number(internal.request);let expected=internal.storage.slice(offset,offset+0x70);
 for(const delta of [0,.016,.2,0,1,10,.1]){expected=updateResourceAnimationClock(expected,delta,0).state;preview.step(delta);assert.deepEqual(internal.storage.slice(offset,offset+0x70),expected);}
});

test('Crab idle/run transitions reuse geometry and index while preserving independent clocks and final restoration',()=>{
 const mesh=load('CharCrabAAnim'),g=resourceModelGeometry(mesh),object=new THREE.Mesh(g,new THREE.MeshBasicMaterial()),controller=new ModelAnimationPreviewController();object.userData.sharedResource=true;
 controller.start(8,object,mesh,list,'idle');const owned=object.geometry,index=owned.index;controller.start(8,object,mesh,list,'run');controller.step(.2);assert.equal(object.geometry,owned);assert.equal(object.geometry.index,index);assert.ok(controller.snapshot(8)!.elapsed>.19);controller.start(8,object,mesh,list,'idle');assert.equal(object.geometry,owned);assert.equal(controller.snapshot(8)!.elapsed,0);controller.stop();assert.equal(object.geometry,g);assert.equal(object.userData.sharedResource,true);g.dispose();(object.material as THREE.Material).dispose();
});

test('Unchanged static pose cache still restores externally edited or replaced vertex attributes',()=>{
 const mesh=load('CharCrabAAnim'),g=resourceModelGeometry(mesh),object=new THREE.Mesh(g,new THREE.MeshBasicMaterial()),controller=new ModelAnimationPreviewController();controller.start(9,object,mesh,list,'idle');const a=object.geometry.getAttribute('position') as THREE.BufferAttribute,x=a.getX(0);a.setX(0,x+20);a.needsUpdate=true;controller.step(.1);assert.equal(a.getX(0),x);const replacement=a.clone();replacement.setX(0,x+30);object.geometry.setAttribute('position',replacement);controller.step(.1);assert.equal(replacement.getX(0),x);controller.stop();g.dispose();(object.material as THREE.Material).dispose();
});
