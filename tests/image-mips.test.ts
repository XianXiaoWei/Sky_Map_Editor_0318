import test from 'node:test';
import assert from 'node:assert/strict';
import { imageMipChain } from '../src/core/image-mips';
import { vulkanTextureDataBytes } from '../src/core/vulkan-protocol';

test('Mip filtering preserves original base bytes and removes an unresolved checker pattern',()=>{
 const rgba=Uint8Array.from({length:4*4*4},(_,i)=>i%4===3?255:((Math.floor(i/4)%4+Math.floor(i/16))%2?255:0));
 const chain=imageMipChain(4,4,rgba);assert.equal(chain.mipLevels,3);assert.deepEqual(chain.data.subarray(0,rgba.length),rgba);
 assert.equal(chain.data.length,vulkanTextureDataBytes([4,4,1],1,2,3));
 for(let i=rgba.length;i<chain.data.length;i++)assert.equal(chain.data[i],i%4===3?255:128);
 const disabled=imageMipChain(4,4,rgba,false,false);assert.equal(disabled.mipLevels,1);assert.deepEqual(disabled.data,rgba);
});
test('sRGB mip color averages in linear light while alpha remains linear',()=>{
 const chain=imageMipChain(2,1,Uint8Array.from([0,0,0,0,255,255,255,255]),true);
 assert.deepEqual(chain.data.subarray(8),Uint8Array.from([188,188,188,128]));
});
test('Odd dimensions account for every source texel and constant packed data stays constant',()=>{
 const source=Uint8Array.from({length:3*3*4},(_,i)=>i%4===3?255:Math.floor(i/4)===8?255:0),chain=imageMipChain(3,3,source);
 assert.deepEqual(chain.data.subarray(36),Uint8Array.from([28,28,28,255]));
 const constant=Uint8Array.from({length:5*3*4},(_,i)=>[53,125,237,77][i%4]),flat=imageMipChain(5,3,constant);
 for(let i=0;i<flat.data.length;i++)assert.equal(flat.data[i],[53,125,237,77][i%4]);
});
