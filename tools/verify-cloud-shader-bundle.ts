import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import {AssetCatalog} from '../src/main/assets';
import {compileVulkanShaders,configureBundledShaderCache} from '../src/main/vulkan-shaders';
import {vulkanProgramSources} from '../src/main/vulkan-program';

async function main(){
 const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data',catalog=new AssetCatalog(data,'Dawn'),bundle=JSON.parse(await fs.readFile('docs/viewport-shader-bundle.json','utf8'));
 const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-cloud-bundle-')),previousPath=process.env.PATH,requests=[];
 try{
  configureBundledShaderCache(path.resolve('dist/vulkan-shaders'));process.env.PATH='';
  for(const program of ['CloudCore','CloudFluffy','CloudFluffySuperCoarse','CloudFluffyCoarse','CloudCard','DepthDownsample','DepthDownsampleGather','DepthDownsampleQuarter'])for(const hardware of [false,true]){
   const compiled=await compileVulkanShaders(vulkanProgramSources(catalog.program(program),hardware),temp);assert.equal(compiled.success,true,compiled.log);assert.equal(compiled.cached,true);assert.ok(bundle.keys.includes(compiled.key));
   requests.push({program,cloudSampling:hardware?'hardware':'reference',key:compiled.key});
  }
  const report={passed:true,compilerExecutablesAvailable:false,requests,scope:'Both cloud sampling policies load verified shipped SPIR-V with empty PATH and empty writable cache; no Windows runtime/FPS acceptance.'};
  await fs.writeFile('docs/cloud-shader-bundle-verification.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
 }finally{process.env.PATH=previousPath;configureBundledShaderCache();await fs.rm(temp,{recursive:true,force:true});}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
