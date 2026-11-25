import test from 'node:test';import assert from 'node:assert/strict';
import type {ObjectNode} from '../src/core/objects';import type {ResourceMesh} from '../src/core/resources';import type {VulkanModelDraw} from '../src/core/vulkan-protocol';
import {ViewportModelLod,type ViewportLodServices} from '../src/main/viewport-model-lod';
const identity=()=>Array.from({length:16},(_,i)=>Number(i%5===0));
const packed=(count:number,color:number)=>{const vertices=new Uint8Array(count*48),v=new DataView(vertices.buffer);for(let i=0;i<count;i++){v.setFloat32(i*48,i/10,true);vertices.fill(color,i*48+12,i*48+16);vertices.fill(color+1,i*48+20,i*48+36);vertices.fill(color+2,i*48+36,i*48+48);}return vertices;};
const mesh={lods:2,animated:false,levels:[{bounds:[-1,-1,-1,1,1,1],lodDistance:10},{lodDistance:Infinity}]} as ResourceMesh;
function node(id:number,x:number):ObjectNode {const matrix=identity();matrix[12]=x;return {id,className:'Beamo',fields:[{name:'meshName',value:'NativeLOD'},{name:'transform',raw:Buffer.from(new Float32Array(matrix).buffer).toString('hex')}]} as ObjectNode;}
test('Per-owner Beamo LOD changes retain merge identity and the untouched instance bytes, then restore exact high geometry',()=>{
 const nodes=[node(0,0),node(1,1000)],a=packed(6,20),b=packed(6,80),vertices=new Uint8Array(576);vertices.set(a);vertices.set(b,288);let uploads=0;
 const draw:VulkanModelDraw={nodeId:0,shader:'MeshSh',group:'Opaque',state:0,stride:48,vertices,indices:Uint32Array.from([0,1,2,3,4,5,6,7,8,9,10,11]),model:identity(),baked:false,beamoPass:'primary',beamoNodeIds:[0,1],beamoRanges:[{nodeId:0,vertexStart:0,vertexCount:6,indexStart:0,indexCount:6},{nodeId:1,vertexStart:6,vertexCount:6,indexStart:6,indexCount:6}]};
 const service:ViewportLodServices={mesh:()=>mesh,bake:()=>null,beamoPlan:()=>({count:2,distances:[10,Infinity],enables:[1,1,1]}),beamo:(id,lod)=>{uploads++;return {acceptedBake:false,vertices:packed(3,100+id),passes:[{pass:'primary',indices:Uint32Array.from([0,1,2])}]} as any;}};
 const lod=new ViewportModelLod(nodes,service);lod.setDraws([draw]);const camera=identity(),apply=()=>{const updates=lod.update(camera);updates.forEach(u=>{u.draw.vertices=u.vertices;u.draw.indices=u.indices;});return updates;};
 const originalVertices=draw.vertices,originalIndices=draw.indices;assert.equal(apply().length,1);assert.equal(draw.vertices.length,432);assert.deepEqual(draw.vertices.subarray(0,288),a);assert.deepEqual(Array.from(draw.indices),[0,1,2,3,4,5,6,7,8]);assert.equal(lod.info().lowOwners,1);assert.equal(uploads,1);assert.equal(apply().length,0);
 camera[12]=1000;assert.equal(apply().length,1);assert.deepEqual(draw.vertices.subarray(144),b);assert.equal(uploads,2);camera[12]=0;apply();assert.equal(uploads,2,'Cached low LOD must be reused');
 const restore=lod.update(camera,undefined,false);assert.equal(restore.length,1);assert.equal(restore[0].vertices,originalVertices);assert.equal(restore[0].indices,originalIndices);assert.deepEqual(draw.beamoNodeIds,[0,1]);assert.equal(draw.shader,'MeshSh');
});
test('A failed low-level resource retains high geometry, and edited transforms are read on the next decision',()=>{
 const nodes=[node(0,0)],draw:VulkanModelDraw={nodeId:0,shader:'MeshSh',group:'Opaque',state:0,stride:48,vertices:packed(6,20),indices:Uint32Array.from([0,1,2,3,4,5]),model:identity(),baked:false,beamoPass:'primary'};
 let requests=0;const lod=new ViewportModelLod(nodes,{mesh:()=>mesh,bake:()=>null,beamoPlan:()=>({count:2,distances:[10,Infinity],enables:[1,1,1]}),beamo:()=>{requests++;throw new Error('Unavailable low LOD');}});lod.setDraws([draw]);const camera=identity();assert.deepEqual(lod.update(camera),[]);draw.model[12]=100;assert.deepEqual(lod.update(camera),[]);assert.equal(requests,1);assert.equal(lod.info().boundaries[0].reason,'Unavailable low LOD');assert.deepEqual(lod.update(camera),[]);assert.equal(requests,1);
});
