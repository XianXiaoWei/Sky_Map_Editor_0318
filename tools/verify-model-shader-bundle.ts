import fs from 'node:fs/promises';import os from 'node:os';import path from 'node:path';import assert from 'node:assert/strict';
import {ObjectsDocument} from '../src/core/objects';
import {AssetCatalog} from '../src/main/assets';
import {viewportModelShaders} from '../src/main/viewport-model-shaders';
import {compileVulkanShaders,configureBundledShaderCache} from '../src/main/vulkan-shaders';
import {vulkanProgramSources} from '../src/main/vulkan-program';
import {viewportWaterBackgroundSources} from '../src/main/viewport-water-effects';
import {viewportFlowerBackgroundSources} from '../src/main/viewport-flower-effects';
import {originalOceanResourceNames} from '../src/core/water-render-state';
async function main(){
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data',report=JSON.parse(await fs.readFile('docs/viewport-shader-bundle.json','utf8'));
const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-model-bundle-check-')),previousPath=process.env.PATH;
let levels=0,requests=0;const programs=new Set<string>(),effects=new Set<string>(),keys=new Set<string>();
try{
 configureBundledShaderCache(path.resolve('dist/vulkan-shaders'));
 // Prove that the prepared model viewport needs no compiler executable.
 process.env.PATH='';
 for(const level of (await fs.readdir(path.join(data,'Levels'))).sort()){
  const doc=new ObjectsDocument(await fs.readFile(path.join(data,'Levels',level,'Objects.level.bin'))),catalog=new AssetCatalog(data,level),names=viewportModelShaders(doc.nodes,level,name=>catalog.program(name));
  assert.deepEqual(names,report.modelCoverage.find((row:{level:string})=>row.level===level)?.programs,level);
  for(const name of names){const compiled=await compileVulkanShaders(vulkanProgramSources(catalog.program(name)),temp);assert.equal(compiled.success,true,`${level}/${name}: ${compiled.log}`);assert.equal(compiled.cached,true,`${level}/${name} needs a compiler`);assert.ok(report.keys.includes(compiled.key));programs.add(name);keys.add(compiled.key);requests++;}
  const required=new Set<string>();
  if(doc.nodes.some(n=>n.className==='Water'))for(const name of ['WaterSim','WaterSimReset',originalOceanResourceNames(level,false).meshShader])required.add(name);
  if(doc.nodes.some(n=>n.className==='FlowerPatch'))required.add('Flower');
  if(doc.nodes.some(n=>n.className==='CandleObject'))required.add('Candle');
  for(const name of required){const compiled=await compileVulkanShaders(vulkanProgramSources(catalog.program(name)),temp);assert.equal(compiled.success,true,`${level}/${name}: ${compiled.log}`);assert.equal(compiled.cached,true,`${level}/${name} needs a compiler`);assert.ok(report.keys.includes(compiled.key));effects.add(name);requests++;}
  levels++;
 }
 assert.equal(levels,33);assert.ok(programs.size>0);assert.deepEqual([...programs].sort(),report.modelPrograms);
 for(const [name,sources] of [['ViewportWaterBackground',viewportWaterBackgroundSources],['ViewportFlowerBackground',viewportFlowerBackgroundSources]] as const){const compiled=await compileVulkanShaders(sources,temp);assert.equal(compiled.success,true,name+': '+compiled.log);assert.equal(compiled.cached,true,name+' needs a compiler');assert.ok(report.keys.includes(compiled.key));effects.add(name);}
 const result={passed:true,levels,requests,modelPrograms:[...programs].sort(),effectPrograms:[...effects].sort(),modelShaderCacheEntries:keys.size,compilerExecutablesAvailable:false,scope:'Every accepted LevelMesh/Beamo/BeamoDecal material and saved Water/FlowerPatch/CandleObject effect program across 33 maps loads verified bundled SPIR-V with an empty PATH and an empty writable cache. Resource/bake/Model lifecycle and Windows runtime remain separate.'};
 await fs.writeFile('docs/model-shader-bundle-verification.json',JSON.stringify(result,null,2)+'\n');console.log(JSON.stringify(result));
}finally{process.env.PATH=previousPath;configureBundledShaderCache();await fs.rm(temp,{recursive:true,force:true});}

}
void main().catch(error=>{console.error(error);process.exitCode=1;});
