import test from 'node:test';
import assert from 'node:assert/strict';
import * as THREE from 'three';
import { createBakedObject,setBakedDisplay,type BakedView } from '../src/renderer/baked-renderer';
import { nativeMaterialDefs } from '../src/core/mesh-surfaces';
import { exportVulkanScene } from '../src/renderer/vulkan-viewport';

function geometry(id:string):BakedView {
  return {id,name:id,kind:'terrain',stride:36,vertexCount:3,indexCount:3,vertexOffset:0,recordOffset:0,recordEnd:0,
    positions:new Float32Array([0,0,0,1,0,0,0,1,0]),indices:new Uint32Array([0,1,2]),normals:new Float32Array([0,0,1,0,0,1,0,0,1]),
    packedNormals:new Int8Array([0,0,127,-128,0,0,127,1,0,0,127,2]),materialIds:new Uint8Array([16,0,0,0,16,0,0,0,16,0,0,0]),
    weights:new Uint8Array([255,0,0,0,255,0,0,0,255,0,0,0]),light:new Uint8Array([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]),userData1:new Uint8Array(0)};
}
test('Vulkan material export merges identical passes while preserving packed normal/lighting bytes and triangle order',()=>{
  const scene=new THREE.Scene(),defs=nativeMaterialDefs('Dawn');scene.add(createBakedObject(geometry('a'),defs,'material',false),createBakedObject(geometry('b'),defs,'material',false));
  const result=exportVulkanScene(scene);assert.equal(result.vertices.length,0);assert.equal(result.baked!.length,1);
  const draw=result.baked![0];assert.equal(draw.shader,'RockFaceSh');assert.equal(draw.state,0);assert.deepEqual(Array.from(draw.indices),[0,1,2,3,4,5]);
  assert.deepEqual(Array.from(draw.vertices.subarray(12,36)),[0,0,127,128,16,0,0,0,255,0,0,0,1,2,3,4,5,6,7,8,9,10,11,12]);
  assert.deepEqual(draw.vertices.subarray(0,120),draw.vertices.subarray(120));
});
test('Vulkan material export respects world transforms and attribute inspection removes programmable material draws',()=>{
  const scene=new THREE.Scene(),object=createBakedObject(geometry('a'),nativeMaterialDefs('Dawn'),'material',false);object.position.set(3,4,5);scene.add(object);
  const material=exportVulkanScene(scene),v=new DataView(material.baked![0].vertices.buffer);assert.deepEqual([v.getFloat32(0,true),v.getFloat32(4,true),v.getFloat32(8,true)],[3,4,5]);
  setBakedDisplay(object,'light0');const inspected=exportVulkanScene(scene);assert.equal(inspected.baked!.length,0);assert.equal(inspected.vertices.length,21);assert.deepEqual(Array.from(inspected.vertices.subarray(3,7)),[Math.fround(1/255),Math.fround(2/255),Math.fround(3/255),1]);
});
