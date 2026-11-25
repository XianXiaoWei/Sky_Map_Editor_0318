import test from 'node:test';import assert from 'node:assert/strict';
import {vulkanMaterialSceneBytes,type VulkanMaterialScene} from '../src/core/vulkan-protocol';
const spirv=new Uint8Array(20);new DataView(spirv.buffer).setUint32(0,0x07230203,true);
const scene:VulkanMaterialScene={vertexSpirv:spirv,fragmentSpirv:spirv,stride:4,attributes:[],state:10,colorCount:1,vertices:new Uint8Array(12),indices:Uint32Array.of(0,1,2),resources:[]};
test('Point topology is independent of render state and leaves triangle protocol unchanged',()=>{
 const legacy=vulkanMaterialSceneBytes(scene),explicit=vulkanMaterialSceneBytes({...scene,topology:'triangles'}),points=vulkanMaterialSceneBytes({...scene,topology:'points'});
 assert.deepEqual(legacy,explicit);assert.equal(legacy.readUInt32LE(24),10);assert.equal(points.readUInt32LE(24),0x10a);
 points.writeUInt32LE(10,24);assert.deepEqual(points,legacy);
 assert.doesNotThrow(()=>vulkanMaterialSceneBytes({...scene,topology:'points',indices:Uint32Array.of(2)}));
 assert.throws(()=>vulkanMaterialSceneBytes({...scene,indices:Uint32Array.of(2)}));
 assert.throws(()=>vulkanMaterialSceneBytes({...scene,topology:'points',indices:Uint32Array.of(3)}));
 for(const state of [3,5])assert.throws(()=>vulkanMaterialSceneBytes({...scene,state,topology:'points'}));
});
