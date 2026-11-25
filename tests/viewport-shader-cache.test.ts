import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs/promises';import os from 'node:os';import path from 'node:path';import {compileVulkanShaders,configureBundledShaderCache,type VulkanShaderSource} from '../src/main/vulkan-shaders';
test('Shipped SPIR-V validates and loads without installed compiler tools; corruption is rejected',async()=>{
 const directory=await fs.mkdtemp(path.join(os.tmpdir(),'sky-shipped-shaders-')),originalPath=process.env.PATH;
 const sources:VulkanShaderSource[]=[{stage:'vert',format:'vulkan450',text:'#version 450\nvoid main(){gl_Position=vec4(0,0,0,1);}'},{stage:'frag',format:'vulkan450',text:'#version 450\nlayout(location=0) out vec4 color;void main(){color=vec4(1);}'}];
 try{const bundled=path.join(directory,'bundle'),first=await compileVulkanShaders(sources,bundled);assert.equal(first.success,true);
  configureBundledShaderCache(bundled);process.env.PATH=path.join(directory,'no-compiler');const loaded=await compileVulkanShaders(sources,path.join(directory,'profile'));assert.equal(loaded.success,true);assert.equal(loaded.cached,true);assert.equal(loaded.key,first.key);assert.ok(loaded.artifacts.every(a=>a.path.startsWith(bundled+path.sep)));
  await fs.writeFile(loaded.artifacts[0].path,new Uint8Array(32));await assert.rejects(compileVulkanShaders(sources,path.join(directory,'empty-profile')),/缓存校验失败/);
 }finally{process.env.PATH=originalPath;configureBundledShaderCache();await fs.rm(directory,{recursive:true,force:true});}
});
