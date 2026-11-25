import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {ObjectsDocument} from '../src/core/objects';
import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';
import {effectiveLevelMeshMaterial} from '../src/core/model-draw';
import type {VulkanModelDraw} from '../src/core/vulkan-protocol';
import type {AssetCatalog} from '../src/main/assets';
import type {VulkanHost} from '../src/main/vulkan';
import * as THREE from 'three';
import {originalViewportVisibility} from '../src/main/viewport-original-visibility';
import {orderViewportMaterialDraws} from '../src/core/viewport-material-order';

test('Static model pose updates preserve geometry and reject invalid lists atomically',()=>{
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',nodes=new ObjectsDocument(fs.readFileSync(data+'/Levels/Dawn/Objects.level.bin')).nodes;
 const node=nodes.find(n=>n.className==='LevelMesh')!,material=effectiveLevelMeshMaterial(node,'Dawn');
 const matrix=Array.from({length:16},(_,i)=>Number(i%5===0)),vertices=new Uint8Array(144),indices=Uint32Array.from([0,1,2]);
 const draw:VulkanModelDraw={nodeId:node.id,shader:material.shaderName,group:'Opaque',state:0,stride:48,vertices,indices,model:matrix.slice(),baked:true};
 const renderer=createVulkanBakedRenderer('Dawn',nodes,{} as AssetCatalog,{} as VulkanHost,'/tmp');renderer.setDraws([], [draw]);
 const before=renderer.info().geometrySha256,next=matrix.slice();next[12]=42;
 renderer.setModelTransforms([{nodeId:node.id,matrix:next}]);assert.deepEqual(draw.model,next);assert.notEqual(draw.model,next);
 assert.equal(draw.vertices,vertices);assert.equal(draw.indices,indices);assert.equal(renderer.info().geometrySha256,before);
 const other=next.slice();other[12]=90;
 assert.throws(()=>renderer.setModelTransforms([{nodeId:node.id,matrix:other},{nodeId:-1,matrix}]));assert.deepEqual(draw.model,next);
 assert.throws(()=>renderer.setModelTransforms([{nodeId:node.id,matrix:other},{nodeId:node.id,matrix}]));assert.deepEqual(draw.model,next);
 assert.throws(()=>renderer.setModelTransforms([{nodeId:node.id,matrix:[NaN]}]));assert.deepEqual(draw.model,next);
});
test('Animation vertex replacements refresh cached bounds and transparent order with an unchanged model matrix',()=>{
 const make=(z:number):VulkanModelDraw=>{const vertices=new Uint8Array(144),view=new DataView(vertices.buffer);[[-.5,-.5,z],[.5,-.5,z],[0,.5,z]].forEach((p,i)=>p.forEach((n,j)=>view.setFloat32(i*48+j*4,n,true)));return {nodeId:1,shader:'MeshSh',group:'Blended',state:9,stride:48,vertices,indices:Uint32Array.from([0,1,2]),model:new THREE.Matrix4().toArray(),baked:true};};
 const a=make(-10),b=make(-20),camera=new THREE.PerspectiveCamera(90,1,.1,1000);camera.updateMatrixWorld();
 const query=()=>originalViewportVisibility([a],camera.projectionMatrix.toArray(),camera.matrixWorld.toArray());
 assert.deepEqual(query(),[true]);assert.deepEqual(orderViewportMaterialDraws([a,b],[0,0,0]),[b,a]);
 a.vertices=make(-30).vertices;assert.deepEqual(orderViewportMaterialDraws([a,b],[0,0,0]),[a,b]);
 const changed=new DataView(a.vertices.buffer);for(let i=0;i<3;i++)changed.setFloat32(i*48,100,true);assert.deepEqual(query(),[false]);
 a.vertices=make(-10).vertices;assert.deepEqual(query(),[true]);
});
test('Pose rendering negotiates native geometry support and falls back to material uploads for older binaries',async()=>{
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',nodes=new ObjectsDocument(fs.readFileSync(data+'/Levels/Dawn/Objects.level.bin')).nodes,node=nodes.find(n=>n.className==='LevelMesh')!,material=effectiveLevelMeshMaterial(node,'Dawn');
 for(const capability of [undefined,false,true]){
  let materialUploads=0,geometryUploads=0;
  const host={start:async()=>({dynamicGeometry:capability}),setViewportMaterials:async()=>{materialUploads++;},setViewportAlpha:async()=>{},updateViewportGeometry:async()=>{geometryUploads++;},updateViewportUniforms:async()=>{},setViewportDrawOrder:async()=>{},setViewportDrawVisibility:async()=>{}} as unknown as VulkanHost;
  const catalog={program:()=>({definition:{name:material.shaderName,group:'Opaque'},variables:[],vertexSource:'void main(){}'})} as unknown as AssetCatalog;
  const environment=Object.assign(()=>({values:{},direction:[0,1,0],sunColor:[1,1,1,1],average:[1,1,1,1],pointLight:[0,0,0,0]}),{revision:()=>0,frame:()=>0});
  const renderer=createVulkanBakedRenderer('Dawn',nodes,catalog,host,'/tmp/sky-animation-capability-shaders',environment as unknown as Parameters<typeof createVulkanBakedRenderer>[5]);
  const matrix=new THREE.Matrix4().toArray(),vertices=new Uint8Array(144),draw:VulkanModelDraw={nodeId:node.id,shader:material.shaderName,group:'Opaque',state:0,stride:48,vertices,indices:Uint32Array.from([0,1,2]),model:matrix,baked:true};
  renderer.setDraws([], [draw]);await renderer.render(16,16,matrix,matrix,'basic');
  const packedPositions=new Uint8Array(48),view=new DataView(packedPositions.buffer);view.setFloat32(0,.5,true);
  renderer.setModelVertices([{nodeId:node.id,packedPositions,packedNormals:new Int8Array(12)}]);await renderer.render(16,16,matrix,matrix,'basic');
  assert.equal(geometryUploads,capability===true?1:0);assert.equal(materialUploads,capability===true?1:2);
  await renderer.render(16,16,matrix,matrix,'basic');assert.equal(materialUploads,capability===true?1:2);
 }
});
test('Dynamic model vertices preserve UV/color/bake/index/material bytes and reject invalid batches before any write',()=>{
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',nodes=new ObjectsDocument(fs.readFileSync(data+'/Levels/Dawn/Objects.level.bin')).nodes,node=nodes.find(n=>n.className==='LevelMesh')!,material=effectiveLevelMeshMaterial(node,'Dawn');
 const vertices=Uint8Array.from({length:144},(_,i)=>i&255),indices=Uint32Array.from([0,1,2]),matrix=Array.from({length:16},(_,i)=>Number(i%5===0));
 const draw:VulkanModelDraw={nodeId:node.id,shader:material.shaderName,group:'Opaque',state:0,stride:48,vertices,indices,model:matrix,baked:true};
 const renderer=createVulkanBakedRenderer('Dawn',nodes,{} as AssetCatalog,{} as VulkanHost,'/tmp');renderer.setDraws([], [draw]);const originalHash=renderer.info().geometrySha256;
 const packedPositions=new Uint8Array(48),packedNormals=Int8Array.from({length:12},(_,i)=>i-6),position=new DataView(packedPositions.buffer);for(let i=0;i<3;i++){position.setFloat32(i*16,i+2,true);packedPositions.set(vertices.subarray(i*48+12,i*48+16),i*16+12);}
 const update={nodeId:node.id,packedPositions,packedNormals};renderer.setModelVertices([update]);assert.notEqual(draw.vertices,vertices);assert.equal(draw.indices,indices);assert.equal(draw.model,matrix);assert.notEqual(renderer.info().geometrySha256,originalHash);
 for(let i=0;i<3;i++){assert.deepEqual(draw.vertices.subarray(i*48,i*48+16),packedPositions.subarray(i*16,i*16+16));assert.deepEqual(draw.vertices.subarray(i*48+20,i*48+48),vertices.subarray(i*48+20,i*48+48));}
 const unchanged=draw.vertices;assert.throws(()=>renderer.setModelVertices([update,{...update,nodeId:-1}]));assert.equal(draw.vertices,unchanged);
 assert.throws(()=>renderer.setModelVertices([update,update]));assert.throws(()=>renderer.setModelVertices([{...update,packedNormals:new Int8Array(1)}]));position.setFloat32(0,NaN,true);assert.throws(()=>renderer.setModelVertices([update]));assert.equal(draw.vertices,unchanged);
});
