import test from 'node:test';
import assert from 'node:assert/strict';
import {ByteCache} from '../src/core/byte-cache';
import {vulkanResourceBatchBytes,vulkanUniformBatchBytes,vulkanGeometryBatchBytes,type VulkanMaterialResource} from '../src/core/vulkan-protocol';

test('Resource reuse respects memory bounds, recent use and oversized replacements',()=>{
 const cache=new ByteCache<string,string>(10);cache.set('a','A',4);cache.set('b','B',4);assert.equal(cache.get('a'),'A');
 cache.set('c','C',4);assert.equal(cache.get('b'),undefined);assert.equal(cache.bytes,8);
 cache.set('a','too large',11);assert.equal(cache.get('a'),undefined);assert.equal(cache.get('c'),'C');assert.equal(cache.bytes,4);
 cache.clear();assert.equal(cache.bytes,0);assert.throws(()=>cache.set('d','D',NaN));assert.throws(()=>new ByteCache(-1));
});
test('Dynamic geometry packets retain unchanged draws and honor sliced array byte offsets',()=>{
 const storage=new Uint8Array(64),vertices=storage.subarray(16,52),indices=Uint32Array.from([9,0,1,2,9]).subarray(1,4);vertices.fill(7);
 const packet=vulkanGeometryBatchBytes([null,{vertices,indices,stride:12}]);assert.equal(packet.readUInt32LE(0),2);assert.deepEqual(packet.subarray(4,16),Buffer.alloc(12));
 assert.equal(packet.readUInt32LE(16),36);assert.equal(packet.readUInt32LE(20),3);assert.equal(packet.readUInt32LE(24),12);assert.deepEqual(packet.subarray(28,64),Buffer.from(vertices));assert.deepEqual(packet.subarray(64),Buffer.from(indices.buffer,indices.byteOffset,indices.byteLength));
 assert.throws(()=>vulkanGeometryBatchBytes([]));assert.throws(()=>vulkanGeometryBatchBytes([{vertices,indices:Uint32Array.of(3),stride:12}]));assert.throws(()=>vulkanGeometryBatchBytes([{vertices,indices,stride:0}]));
});
test('Existing texture patches share bytes while uniforms preserve their original wire layout',()=>{
 const data=new Uint8Array(16),texture:VulkanMaterialResource={binding:2,kind:1,format:4,dimensions:[1,1,1],linear:false,repeat:false,data};
 const encoded=vulkanResourceBatchBytes([[texture],[texture]]);
 assert.equal(encoded.length,4+4+8+16+4+8);
 assert.equal(encoded.readUInt32LE(encoded.length-4),0x80000000);
 const uniform:VulkanMaterialResource={...texture,binding:1,kind:0,data:new Uint8Array(4)};
 assert.deepEqual(vulkanResourceBatchBytes([[uniform],[uniform]]),vulkanUniformBatchBytes([[uniform],[uniform]]));
 assert.throws(()=>vulkanUniformBatchBytes([[texture]]));
 assert.throws(()=>vulkanResourceBatchBytes([[texture,texture]]));
 assert.throws(()=>vulkanResourceBatchBytes([[{...texture,data:new Uint8Array(15)}]]));
});
