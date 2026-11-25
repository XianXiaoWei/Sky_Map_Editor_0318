import test from 'node:test';import assert from 'node:assert/strict';
import {bottomUpVulkanTarget,sampledVulkanTarget} from '../src/main/vulkan-target';import {cloudRenderGraph} from '../src/core/cloud-render-graph';
test('Fullscreen target row conversion preserves signed depth, changes no channel bytes, and is reversible',()=>{
 const target=cloudRenderGraph(3,2).targets.fullRGBDepth,values=Float32Array.from([1,2,3,-4,5,6,7,8,9,10,11,12,13,14,15,-16,17,18,19,20,21,22,23,24]),original=sampledVulkanTarget(target,values),flipped=bottomUpVulkanTarget(original);
 assert.deepEqual(flipped.data.subarray(0,24),original.data.subarray(24));assert.deepEqual(flipped.data.subarray(24),original.data.subarray(0,24));assert.deepEqual(bottomUpVulkanTarget(flipped),original);assert.equal(flipped.linear,false);assert.equal(flipped.repeat,false);assert.notEqual(flipped.data,original.data);
});
test('Cloud motion half infinity is preserved only in explicitly allowed motion channels',()=>{
 const target=cloudRenderGraph(2,2).targets.cloudB,rgba=Float32Array.from([256,Infinity,-Infinity,1]);
 assert.throws(()=>sampledVulkanTarget(target,rgba),/超出有限范围/);
 const texture=sampledVulkanTarget(target,rgba,{infinityChannels:[1,2]}),view=new DataView(texture.data.buffer);
 assert.equal(view.getUint16(2,true),0x7c00);assert.equal(view.getUint16(4,true),0xfc00);assert.equal(view.getUint16(6,true),0x3c00);
 assert.deepEqual(bottomUpVulkanTarget(bottomUpVulkanTarget(texture)),texture);
 rgba[0]=Infinity;assert.throws(()=>sampledVulkanTarget(target,rgba,{infinityChannels:[1,2]}),/通道 0/);
 rgba[0]=256;rgba[1]=NaN;assert.throws(()=>sampledVulkanTarget(target,rgba,{infinityChannels:[1,2]}),/NaN/);
});
