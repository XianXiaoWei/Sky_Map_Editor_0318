import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import {ObjectsDocument} from '../src/core/objects';
import {MeshesDocument} from '../src/core/meshes';
import {nativeMaterialDefs,terrainSurfaces,skirtSurfaces} from '../src/core/mesh-surfaces';
import {originalOceanResourceNames} from '../src/core/water-render-state';
import {AssetCatalog} from '../src/main/assets';
import {viewportModelShaders} from '../src/main/viewport-model-shaders';
import {compileVulkanShaders,configureBundledShaderCache,type VulkanShaderSource} from '../src/main/vulkan-shaders';
import {vulkanProgramSources} from '../src/main/vulkan-program';
import {viewportWaterDepthFragment} from '../src/main/viewport-water-depth';
import {viewportSkyVertex,viewportSkyFragment} from '../src/main/viewport-environment';
import {viewportBasicMaterialSources} from '../src/main/viewport-basic-material';
import {viewportWaterBackgroundSources} from '../src/main/viewport-water-effects';
import {viewportFlowerBackgroundSources} from '../src/main/viewport-flower-effects';
import {vulkanHalfStorageSources} from '../src/main/vulkan-half-storage';

async function main(){
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',bundle=path.resolve(process.env.SKY_SHADER_BUNDLE??'dist/vulkan-shaders');
 const temp=await fs.mkdtemp(path.join(os.tmpdir(),'sky-shader-release-')),cache=path.join(temp,'空缓存 profile'),previousPath=process.env.PATH;
 const maps:{level:string;requests:number;waterPrograms:string[]}[]=[],misses:{level:string;program:string;variant:string;key:string;error:string}[]=[],keys=new Set<string>();let requests=0;
 try{
  await fs.mkdir(cache);configureBundledShaderCache(bundle);process.env.PATH='';
  const check=async(level:string,program:string,variant:string,sources:VulkanShaderSource[])=>{
   const result=await compileVulkanShaders(sources,cache);requests++;keys.add(result.key);
   if(!result.success||!result.cached||result.artifacts.some(a=>!a.path.startsWith(bundle+path.sep)))misses.push({level,program,variant,key:result.key,error:result.log});
  };
  for(const level of (await fs.readdir(path.join(data,'Levels'))).sort()){
   const source=path.join(data,'Levels',level,'Objects.level.bin');try{await fs.access(source);}catch{continue;}
   const nodes=new ObjectsDocument(await fs.readFile(source)).nodes,mesh=new MeshesDocument(await fs.readFile(path.join(data,'Levels',level,'BstBaked.meshes'))),catalog=new AssetCatalog(data,level),start=requests;
   const names=new Set(['Sun','DepthDownsample','DepthDownsampleGather','DepthDownsampleQuarter','FogUpsample','MotionGen']);
   for(const name of viewportModelShaders(nodes,level,name=>catalog.program(name)))names.add(name);
   const defs=nativeMaterialDefs(level);
   for(const g of mesh.geometries.filter(g=>g.kind==='terrain'||g.kind==='skirt'))for(const b of (g.kind==='terrain'?terrainSurfaces(mesh.geometryView(g),defs):skirtSurfaces(mesh.geometryView(g),defs)).batches)names.add(b.shaderName);
   if(mesh.cloud)for(const name of ['CloudCore','CloudFluffySuperCoarse','CloudFluffyCoarse','CloudFluffy','CloudCard'])names.add(name);
   if(nodes.some(n=>n.className==='CandleObject'))names.add('Candle');
   if(nodes.some(n=>n.className==='CandleObject'||n.className==='Flame'))names.add('Flame');
   if(nodes.some(n=>n.className==='FlowerPatch'))names.add('Flower');
   for(const name of names)for(const hardware of [false,true])await check(level,name,hardware?'hardware':'reference',vulkanProgramSources(catalog.program(name),hardware));
   const water=originalOceanResourceNames(level,false),waterPrograms=[...new Set(['WaterSimReset','WaterSim',water.meshShader,water.shader])];
   for(const name of waterPrograms){const program=catalog.program(name);await check(level,name,'viewport-water-depth',vulkanProgramSources({...program,fragmentSource:viewportWaterDepthFragment(program.fragmentSource)}));}
   const fullscreen=catalog.program('FogUpsample').vertexSource;
   for(const name of ['Tonemap','Fxaa','MotionDilate','TemporalAa'])await check(level,name,'fullscreen-adapter',[{stage:'vert',text:fullscreen,coordinates:'opengl'},{stage:'frag',text:catalog.program(name).fragmentSource,coordinates:'opengl'}]);
   maps.push({level,requests:requests-start,waterPrograms});
  }
  for(const [name,sources] of [['Sky',[{stage:'vert',text:viewportSkyVertex,format:'vulkan450'},{stage:'frag',text:viewportSkyFragment,format:'vulkan450'}]],['HalfStorage',vulkanHalfStorageSources],['WaterBackground',viewportWaterBackgroundSources],['FlowerBackground',viewportFlowerBackgroundSources]] as [string,VulkanShaderSource[]][])await check('*',name,'viewport',sources);
  for(const model of [false,true])for(const transparent of [false,true])await check('*','BasicMaterial',`model=${model},transparent=${transparent}`,viewportBasicMaterialSources(model,transparent));
  const profileRemainedEmpty=(await fs.readdir(cache)).length===0,passed=maps.length===33&&misses.length===0&&profileRemainedEmpty;
  const report={passed,bundle,maps,requests,shaderKeys:keys.size,misses,compilerExecutablesAvailable:false,profileRemainedEmpty,policies:['basic','fast','full','cloud-reference','cloud-hardware'],scope:'All 33 original map terrain/model/effect shader requests, actual depth-specialized Water/Ocean, Flame, fullscreen composition and basic material variants with no compiler tools or writable shader cache. Shader availability only; hardware pixels and frame rate are separate.'};
  await fs.writeFile(process.env.SKY_SHADER_REPORT??'docs/viewport-shader-bundle-verification.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed,maps:maps.length,requests,shaderKeys:keys.size,misses}));if(!passed)process.exitCode=1;
 }finally{process.env.PATH=previousPath;configureBundledShaderCache();await fs.rm(temp,{recursive:true,force:true});}
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
