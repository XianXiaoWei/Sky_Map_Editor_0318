import test from 'node:test';import assert from 'node:assert/strict';
import {EventEmitter} from 'node:events';import {PassThrough} from 'node:stream';
import fs from 'node:fs';import os from 'node:os';import path from 'node:path';
import {VulkanHost,type VulkanTransport} from '../src/main/vulkan';
import type {VulkanMaterialScene} from '../src/core/vulkan-protocol';
test('Resident cache skips static updates but detects mutable textures, uniforms and geometry edits',async()=>{
 const directory=fs.mkdtempSync(path.join(os.tmpdir(),'sky-full-cache-')),executable=path.join(directory,'renderer');fs.writeFileSync(executable,'');const writes:Buffer[]=[];
 const transport=new EventEmitter() as VulkanTransport;transport.stdin=new PassThrough();transport.stdout=new PassThrough();transport.stderr=new PassThrough();transport.exitCode=null;transport.killed=false;transport.kill=()=>{transport.killed=true;return true;};transport.stdin.on('data',b=>writes.push(Buffer.from(b)));
 const host=new VulkanHost(executable,()=>{queueMicrotask(()=>transport.stderr.emit('data',Buffer.from('{"engine":"test","backend":"Vulkan","device":"test","apiVersion":1,"deviceType":4}\n')));return transport;});
 const spirv=new Uint8Array(20);new DataView(spirv.buffer).setUint32(0,0x07230203,true);
 const uniform=new Uint8Array(16),image=new Uint8Array(256),mutable=new Uint8Array(4);
 const scene:VulkanMaterialScene={vertexSpirv:spirv,fragmentSpirv:spirv,stride:4,attributes:[],state:4,colorCount:1,colorFormats:['rgba32f'],vertices:new Uint8Array(12),indices:Uint32Array.from([0,1,2]),resources:[{binding:0,kind:0,format:0,dimensions:[1,1,1],linear:false,repeat:false,data:uniform},{binding:1,kind:1,format:2,dimensions:[8,8,1],linear:false,repeat:false,data:image,immutable:true},{binding:2,kind:1,format:2,dimensions:[1,1,1],linear:false,repeat:false,data:mutable}]};
 try{
  await host.setFullStage(1,[scene]);const initialBytes=host.fullCacheInfo().resourceHashBytes;
  await host.setFullStage(1,[scene]);assert.equal(writes.length,1);assert.ok(host.fullCacheInfo().digestCacheHits>=3);assert.ok(host.fullCacheInfo().resourceHashBytes-initialBytes<256);
  uniform[0]=1;await host.setFullStage(1,[scene]);assert.equal(writes.length,2);assert.equal(writes[1].readUInt32LE(12),1);
  mutable[0]=2;await host.setFullStage(1,[scene]);assert.equal(writes.length,3);
  scene.vertices[0]=1;await host.setFullStage(1,[scene]);assert.equal(writes.length,4);
  const replacement=new Uint8Array(image);replacement[0]=3;scene.resources[1]={...scene.resources[1],data:replacement};await host.setFullStage(1,[scene]);assert.equal(writes.length,5);
  const beforeTopology=writes.length;scene.topology='points';await host.setFullStage(1,[scene]);assert.equal(writes.length,beforeTopology+1);assert.equal(writes.at(-1)!.readUInt32LE(12),0);
  await host.setFullStage(1,[scene]);assert.equal(writes.length,beforeTopology+1);
  scene.topology='triangles';await host.setFullStage(1,[scene]);assert.equal(writes.length,beforeTopology+2);assert.equal(writes.at(-1)!.readUInt32LE(12),0);
  await host.setCachedMaterialScene(scene);const beforeMaterial=writes.length;scene.topology='points';await host.setCachedMaterialScene(scene);assert.equal(writes.length,beforeMaterial+1);assert.equal(writes.at(-1)!.readUInt32LE(0),24);await host.setCachedMaterialScene(scene);assert.equal(writes.length,beforeMaterial+2);assert.equal(writes.at(-1)!.readUInt32LE(0),25);
  const beforeClear=writes.length;await host.setFullStage(1,[]);await host.setFullStage(1,[]);assert.equal(writes.length,beforeClear+1);assert.equal(host.fullCacheInfo().stages,0);
 }finally{host.stop();fs.rmSync(directory,{recursive:true,force:true});}
});
