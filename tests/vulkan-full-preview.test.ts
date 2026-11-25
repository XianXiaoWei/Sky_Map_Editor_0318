import test from 'node:test';
import assert from 'node:assert/strict';
import {VulkanResponseDecoder} from '../src/main/vulkan-response';
import {VULKAN_FULL_MAGIC,FULL_SOURCE,vulkanFullGraphBytes,type VulkanFullGraph} from '../src/core/vulkan-full-preview';

const matrix=Array.from({length:16},(_,i)=>Number(i%5===0));
const graph:VulkanFullGraph={stages:[{id:1,divisor:1,links:[{draw:0,binding:1,source:FULL_SOURCE.opaque,attachment:0,format:'rgba16f',flip:true}]},{id:2,divisor:1,links:[{draw:0,binding:1,source:1,attachment:0,format:'rgba16f',flip:true}]}],meter:0,exposureBinding:0,exposureOffset:16,cloud:0xffffffff,temporal:1,reset:true};
test('Resident render graph rejects forward dependencies, duplicate outputs and invalid exposure offsets',()=>{
 const bytes=vulkanFullGraphBytes(17,320,180,matrix,graph,true);assert.equal(bytes.readUInt32LE(76),1);assert.equal(bytes.readUInt32LE(80),1);
 const copy=()=>structuredClone(graph);
 let bad=copy();bad.stages[0].links[0].source=2;assert.throws(()=>vulkanFullGraphBytes(1,320,180,matrix,bad,false));
 bad=copy();bad.stages[1].id=1;assert.throws(()=>vulkanFullGraphBytes(1,320,180,matrix,bad,false));
 bad=copy();bad.stages[1].links.push({...bad.stages[1].links[0]});assert.throws(()=>vulkanFullGraphBytes(1,320,180,matrix,bad,false));
 bad=copy();bad.exposureOffset=3;assert.throws(()=>vulkanFullGraphBytes(1,320,180,matrix,bad,false));
 bad=copy();bad.temporal=14;assert.throws(()=>vulkanFullGraphBytes(1,320,180,matrix,bad,false));
 bad=copy();bad.stages[1].divisor=2;assert.throws(()=>vulkanFullGraphBytes(1,320,180,matrix,bad,false));
});
function response(mode:number){const bytes=Buffer.alloc(32+(mode?0:24));[VULKAN_FULL_MAGIC,12,3,2,mode?0:24,mode].forEach((v,i)=>bytes.writeUInt32LE(v,i*4));bytes.writeDoubleLE(.0014861518835898927,24);bytes.fill(127,32);return bytes;}
test('Resident responses carry exposure and only final pixels or native status under arbitrary pipe fragmentation',()=>{
 const frames=[response(0),response(1),response(2)],stream=Buffer.concat(frames);
 for(const step of [1,7,20,24,31,32,stream.length]){const decoder=new VulkanResponseDecoder(),received:Buffer[]=[];for(let at=0;at<stream.length;at+=step)decoder.push(stream.subarray(at,at+step),message=>received.push(message));assert.deepEqual(received,frames);assert.equal(decoder.copiedBytes,stream.length);}
 for(const change of [(b:Buffer)=>b.writeUInt32LE(3,20),(b:Buffer)=>b.writeDoubleLE(NaN,24),(b:Buffer)=>b.writeUInt32LE(1,16)]){const bad=response(2);change(bad);assert.throws(()=>new VulkanResponseDecoder().push(bad,()=>assert.fail()));}
});
