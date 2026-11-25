import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import type {VulkanModelDraw} from '../src/core/vulkan-protocol';
import {originalViewportVisibility} from '../src/main/viewport-original-visibility';
const draw=(x:number,z=-10):VulkanModelDraw=>{
 const vertices=new Uint8Array(144),data=new DataView(vertices.buffer);
 [[-.5,-.5,0],[.5,-.5,0],[0,.5,0]].forEach((p,i)=>p.forEach((n,j)=>data.setFloat32(i*48+j*4,n,true)));
 const matrix=new THREE.Matrix4().makeTranslation(x,0,z).toArray();
 return {nodeId:1,shader:'MeshSh',group:'Opaque',state:0,stride:48,vertices,indices:Uint32Array.from([0,1,2]),model:matrix,baked:true};
};
test('Original Visibility frustum queries follow camera/model changes and keep intersecting bounds',()=>{
 const camera=new THREE.PerspectiveCamera(90,1,.1,1000);camera.updateMatrixWorld();
 const candidates=[draw(0),draw(100),draw(0,10),draw(10.4)],viewProjection=()=>new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray();
 assert.deepEqual(originalViewportVisibility(candidates,viewProjection(),camera.matrixWorld.toArray()),[true,false,false,true]);
 candidates[1].model[12]=0;assert.deepEqual(originalViewportVisibility(candidates,viewProjection(),camera.matrixWorld.toArray()),[true,true,false,true]);
 camera.position.x=100;camera.updateMatrixWorld();assert.deepEqual(originalViewportVisibility(candidates,viewProjection(),camera.matrixWorld.toArray()),[false,false,false,false]);
});
test('Original query adapter retains unsupported projections and projective model transforms',()=>{
 const candidate=draw(100);candidate.model[3]=.1;
 const camera=new THREE.PerspectiveCamera(90,1,.1,1000);camera.updateMatrixWorld();const vp=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray();
 assert.deepEqual(originalViewportVisibility([candidate],vp,camera.matrixWorld.toArray()),[true]);
 const ortho=new THREE.OrthographicCamera(-1,1,1,-1,.1,1000);ortho.updateMatrixWorld();assert.deepEqual(originalViewportVisibility([draw(100)],ortho.projectionMatrix.toArray(),ortho.matrixWorld.toArray()),[true]);
});
