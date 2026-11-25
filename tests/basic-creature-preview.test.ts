import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import fs from 'node:fs';
import {readResourceMesh} from '../src/core/resources';
import {readResourceAnimationList} from '../src/core/resource-animation-list';
import type {ObjectNode,Field} from '../src/core/objects';
import {basicCreaturePlans,creatureNumber,sampleCreaturePath} from '../src/core/basic-creature-plan';
import {BasicCreaturePreview} from '../src/renderer/basic-creature-preview';
import {exportVulkanScene} from '../src/renderer/vulkan-viewport';
import {DARK_CREATURE_MODEL_SCALE} from '../src/renderer/dark-creature-skeleton-preview';
import {AssetCatalog} from '../src/main/assets';
const field=(name:string,value:unknown,kind='reference')=>({name,value,kind,encoding:'float'} as Field);
const node=(id:number,className:string,fields:Field[]=[])=>({id,className,fields} as ObjectNode);

test('Basic creature plan follows saved model references, float speeds, dormant instances and fish ownership',()=>{
 const nodes=[node(0,'BirdV2',[field('boidParams',1),field('enabled',0,'u8')]),node(1,'BirdV2Params',[field('meshType',2),field('maxSpeed',{float:6,uint:1086324736},'bits32')]),node(2,'LevelMesh',[field('resourceName','CharSkyRayYoungAnim','string')]),node(3,'Buddy',[field('params',4)]),node(4,'BuddyParams',[field('meshType',5)]),node(5,'LevelMesh',[field('resourceName','CharOreoAAnim','string')]),node(6,'LevelMesh',[field('resourceName','CharFishGroupAnim','string')])];
 const plans=basicCreaturePlans(nodes);assert.deepEqual(plans.map(p=>p.kind),['ray','buddy','fish']);assert.equal(plans[0].resource,'CharSkyRayYoungAnim');assert.equal(plans[0].fallback,'CharSkyRayCAnim');assert.equal(plans[0].speed,6);assert.equal(plans[0].savedEnabled,false);assert.equal(creatureNumber(nodes[1],'missing',3),3);
});
test('Open rail motion turns around continuously; closed rail wraps and degenerate points stay finite',()=>{
 const open=[[0,0,0],[10,0,0]];assert.deepEqual(sampleCreaturePath(open,9).position,[9,0,0]);assert.deepEqual(sampleCreaturePath(open,11),{position:[9,0,0],direction:[-1,-0,-0]});assert.deepEqual(sampleCreaturePath(open,20).position,[0,0,0]);
 const closed=[[0,0,0],[10,0,0],[0,0,0]];assert.deepEqual(sampleCreaturePath(closed,21).position,[1,0,0]);assert.deepEqual(sampleCreaturePath([[1,2,3],[1,2,3]],100).position,[1,2,3]);
});
test('Visible creature fallback moves, pauses without catch-up, restores and clears on map reset',async()=>{
 const c=new BasicCreaturePreview(),root=new THREE.Group(),objects=new Map<number,THREE.Object3D>(),nodes=[node(0,'Crab')];
 await c.load(nodes,root,objects,async()=>{throw new Error('missing fixture model');},undefined,(_n,o)=>o.position.set(2,1,3),()=>true);
 const mesh=objects.get(0)!;assert.equal(mesh.visible,true);assert.equal(mesh.userData.editorHelper,undefined);c.update(1000);c.update(1100);assert.notDeepEqual(mesh.position.toArray(),[2,1,3]);
 c.togglePause();const position=mesh.position.toArray();c.update(5000);c.update(5100);assert.deepEqual(mesh.position.toArray(),position);c.togglePause();c.update(6000);assert.deepEqual(mesh.position.toArray(),position);c.stop();assert.deepEqual(mesh.position.toArray(),[2,1,3]);c.update(7000);assert.deepEqual(mesh.position.toArray(),[2,1,3]);
 const scene=new THREE.Scene();scene.add(root);assert.equal(exportVulkanScene(scene,false).vertices.length,0);assert.ok(exportVulkanScene(scene,true).vertices.length>0);
 c.reset();assert.equal(c.snapshot().instances,0);assert.equal(objects.size,0);assert.equal(root.children.length,0);assert.equal(exportVulkanScene(scene,true).vertices.length,0);
});

test('Repeated creature loads remove effects and generated meshes while preserving borrowed fish',async()=>{
 const c=new BasicCreaturePreview(),root=new THREE.Group(),fish=new THREE.Mesh(new THREE.BoxGeometry(),new THREE.MeshBasicMaterial()),objects=new Map<number,THREE.Object3D>([[1,fish]]);fish.visible=false;fish.position.set(4,2,6);root.add(fish);
 const nodes=[node(0,'DarkCreature'),node(1,'LevelMesh',[field('resourceName','CharFishGroupAnim','string')])],load=async()=>{throw new Error('fixture');},transform=(_n:ObjectNode,o:THREE.Object3D)=>o.position.set(0,20,0);
 await c.load(nodes,root,objects,load,undefined,transform,()=>true);assert.equal(root.children.length,4);assert.equal(fish.visible,true);c.update(1000);c.update(1100);
 await c.load(nodes,root,objects,load,undefined,transform,()=>true);assert.equal(root.children.length,4);assert.equal(c.snapshot().instances,2);c.reset();assert.deepEqual(root.children,[fish]);assert.deepEqual(fish.position.toArray(),[4,2,6]);assert.equal(fish.visible,false);assert.equal(fish.userData.basicCreature,undefined);assert.equal(objects.get(1),fish);
});

test('A late resource response cannot resurrect a reset scene',async()=>{
 const c=new BasicCreaturePreview(),root=new THREE.Group(),objects=new Map<number,THREE.Object3D>();let reject!:(error:Error)=>void;
 const loading=c.load([node(0,'Crab')],root,objects,()=>new Promise((_resolve,r)=>{reject=r;}),undefined,()=>{},()=>true);c.reset();reject(new Error('cancelled'));await loading;assert.equal(root.children.length,0);assert.equal(objects.size,0);assert.equal(c.snapshot().instances,0);
});

test('Stopping restores a real crab pose and playing again restarts its independent animation',async()=>{
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',resource=readResourceMesh(fs.readFileSync(data+'/Meshes/Bin/CharCrabAAnim.mesh')),list=readResourceAnimationList(fs.readFileSync(data+'/Meshes/Bin/AnimationList.dat'));
 const c=new BasicCreaturePreview(),root=new THREE.Group(),objects=new Map<number,THREE.Object3D>();await c.load([node(0,'Crab')],root,objects,async()=>resource,list,()=>{},()=>true);
 const mesh=objects.get(0) as THREE.Mesh;c.update(1000);c.update(1100);assert.ok(c.animations.snapshot(0)!.elapsed>0);c.stop();const geometry=mesh.geometry;assert.equal(c.animations.snapshot(0),null);assert.notEqual(geometry.userData.nativeSkinPose,'preview');c.togglePause();assert.notEqual(mesh.geometry,geometry);assert.equal(c.animations.snapshot(0)!.elapsed,0);c.update(2000);c.update(2100);assert.ok(c.animations.snapshot(0)!.elapsed>0);c.reset();assert.equal(root.children.length,0);
});
test('Dark patrol spotlight hits terrain, becomes red near player, returns blue and hides on stop',async()=>{
 const c=new BasicCreaturePreview(),root=new THREE.Group(),objects=new Map<number,THREE.Object3D>();const ground=new THREE.Mesh(new THREE.PlaneGeometry(500,500),new THREE.MeshBasicMaterial({side:THREE.DoubleSide}));ground.rotation.x=-Math.PI/2;root.add(ground);ground.updateMatrixWorld(true);
 await c.load([node(0,'DarkCreature')],root,objects,async()=>{throw new Error('fixture');},undefined,(_n,o)=>o.position.set(0,20,0),()=>true);c.update(1000);c.update(1100);
 let state=c.snapshot().objects[0];assert.equal(state.spotlight?.color,0x53bfff);assert.ok(Math.abs(state.spotlight!.position[1]-.08)<.001);c.update(1200,false,[0,20,0]);state=c.snapshot().objects[0];assert.equal(state.state,'alert');assert.equal(state.spotlight?.color,0xff4949);assert.equal(state.spotlight?.radius,2.5);c.update(1300,false,[1000,20,0]);assert.equal(c.snapshot().objects[0].spotlight?.color,0x53bfff);c.stop();assert.equal(c.snapshot().objects[0].spotlight,undefined);
});
test('Real dragon uses the original nine-joint spine, scale and negative Z forward; pause and restart retain ownership',async()=>{
 const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data',catalog=new AssetCatalog(data,'Dusk'),resource=readResourceMesh(fs.readFileSync(catalog.meshFile('CharDarkCreatureAnim'))),list=catalog.animationList();
 const c=new BasicCreaturePreview(),root=new THREE.Group(),objects=new Map<number,THREE.Object3D>();await c.load([node(0,'DarkCreature')],root,objects,async()=>resource,list,(_n,o)=>o.position.set(0,20,0),()=>true);
 const mesh=objects.get(0) as THREE.Mesh;assert.equal(c.report[0].error,undefined);assert.equal(DARK_CREATURE_MODEL_SCALE,.1875);assert.deepEqual(mesh.scale.toArray(),[.1875,.1875,.1875]);
 const rest=c.snapshot().objects[0].skeleton!;assert.deepEqual(rest.bones,['M_neckLow_Sim','M_belly_Sim',...Array.from({length:7},(_,i)=>`M_tail${i+1}_Sim`)]);
 c.update(1000);for(let i=1;i<=80;i++)c.update(1000+i*33);
 const moved=c.snapshot().objects[0].skeleton!;assert.notDeepEqual(moved.positions,rest.positions);assert.ok(Array.from(mesh.geometry.getAttribute('position').array).every(Number.isFinite));
 for(let i=1;i<moved.lengths.length;i++){const a=(i-1)*4,b=i*4;assert.ok(Math.abs(Math.hypot(...[0,1,2].map(k=>moved.positions[b+k]-moved.positions[a+k]))-moved.lengths[i])<1e-4);}
 // Native aiming changes rotations, retaining the clip's small translation
 // changes; each actual segment must aim at its solved point from its actual
 // parent, rather than forcing animated translations to fixed lengths.
 for(let i=1;i<moved.lengths.length;i++){const parent=new THREE.Vector3().fromArray(moved.boneWorldPositions,(i-1)*3),actual=new THREE.Vector3().fromArray(moved.boneWorldPositions,i*3).sub(parent).normalize(),wanted=new THREE.Vector3().fromArray(moved.positions,i*4).sub(parent).normalize();assert.ok(actual.dot(wanted)>.99999,`actual bone ${i} aims at the solved point`);}
 const position=mesh.position.clone(),forward=new THREE.Vector3(0,0,-1).applyQuaternion(mesh.quaternion);c.update(3700);assert.ok(forward.dot(mesh.position.clone().sub(position).normalize())>0);
 c.togglePause();const paused=Array.from(mesh.geometry.getAttribute('position').array);c.update(8000);assert.deepEqual(Array.from(mesh.geometry.getAttribute('position').array),paused);
 c.stop();assert.deepEqual(mesh.position.toArray(),[0,20,0]);assert.equal(c.animations.snapshot(0),null);const original=mesh.geometry;c.togglePause();assert.notEqual(mesh.geometry,original);assert.equal(c.report[0].error,undefined);c.reset();assert.equal(root.children.length,0);assert.equal(objects.size,0);
});
