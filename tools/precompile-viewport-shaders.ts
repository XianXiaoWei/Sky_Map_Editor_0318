import fs from 'node:fs/promises';import path from 'node:path';import {MeshesDocument} from '../src/core/meshes';import {nativeMaterialDefs,terrainSurfaces,skirtSurfaces} from '../src/core/mesh-surfaces';import {AssetCatalog} from '../src/main/assets';import {compileVulkanShaders} from '../src/main/vulkan-shaders';import {vulkanProgramSources} from '../src/main/vulkan-program';import {viewportSkyVertex,viewportSkyFragment} from '../src/main/viewport-environment';
import {ObjectsDocument} from '../src/core/objects';
import {viewportModelShaders} from '../src/main/viewport-model-shaders';
import {viewportBasicMaterialSources} from '../src/main/viewport-basic-material';
import {vulkanHalfStorageSources} from '../src/main/vulkan-half-storage';
import {viewportWaterBackgroundSources} from '../src/main/viewport-water-effects';
import {viewportFlowerBackgroundSources} from '../src/main/viewport-flower-effects';
import {originalOceanResourceNames} from '../src/core/water-render-state';
import {viewportWaterDepthFragment} from '../src/main/viewport-water-depth';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
async function main(){const output=path.resolve('dist/vulkan-shaders'),keys=new Set<string>(),names=new Set<string>(),modelNames=new Set<string>(),modelCoverage:{level:string;programs:string[]}[]=[],runtimeCoverage:{level:string;programs:string[];waterPrograms:string[]}[]=[];await fs.mkdir(output,{recursive:true});
 // SPIR-V is architecture independent. Reuse previously verified Linux
 // caches, then compile every viewport program actually used by the maps.
 for(const source of ['/tmp/sky-terrain-map-cache','/tmp/sky-cloud-preview-shaders','/tmp/sky-cloud-preview-shaders']){try{for(const key of await fs.readdir(source)){if(/^[0-9a-f]{64}$/.test(key))await fs.cp(path.join(source,key),path.join(output,key),{recursive:true});}}catch(error){if((error as NodeJS.ErrnoException).code!=='ENOENT')throw error;}}
 const save=async(sources:Parameters<typeof compileVulkanShaders>[0])=>{const result=await compileVulkanShaders(sources,output);if(!result.success)throw new Error(result.log);keys.add(result.key);};
 for(const level of await fs.readdir(path.join(data,'Levels'))){let mesh:MeshesDocument;try{mesh=new MeshesDocument(await fs.readFile(path.join(data,'Levels',level,'BstBaked.meshes')));}catch(error){if((error as NodeJS.ErrnoException).code==='ENOENT')continue;throw error;}
  const catalog=new AssetCatalog(data,level),defs=nativeMaterialDefs(level),programs=new Set<string>(['Sun','DepthDownsample','DepthDownsampleGather','DepthDownsampleQuarter','FogUpsample','MotionGen']);
  const objects=new ObjectsDocument(await fs.readFile(path.join(data,'Levels',level,'Objects.level.bin'))),modelPrograms=viewportModelShaders(objects.nodes,level,name=>catalog.program(name));
  if(objects.nodes.some(n=>n.className==='Water'))for(const name of ['WaterSim','WaterSimReset',originalOceanResourceNames(level,false).meshShader])programs.add(name);
  if(objects.nodes.some(n=>n.className==='FlowerPatch'))programs.add('Flower');
  if(objects.nodes.some(n=>n.className==='CandleObject'))programs.add('Candle');
  if(objects.nodes.some(n=>n.className==='CandleObject'||n.className==='Flame'))programs.add('Flame');
  modelCoverage.push({level,programs:modelPrograms});for(const name of modelPrograms){programs.add(name);modelNames.add(name);}
  for(const geometry of mesh.geometries.filter(g=>g.kind==='terrain'||g.kind==='skirt')){const vertices=mesh.geometryView(geometry),plan=geometry.kind==='terrain'?terrainSurfaces(vertices,defs):skirtSurfaces(vertices,defs);for(const batch of plan.batches)programs.add(batch.shaderName);}
  if(mesh.cloud)for(const name of ['CloudCore','CloudFluffySuperCoarse','CloudFluffyCoarse','CloudFluffy','CloudCard'])programs.add(name);
  // Ocean may be enabled by SetOceanRender even without saved Water nodes.
  // Compile the same opaque-depth adapter used by createViewportWaterEffects,
  // including its initial and subsequent simulation shaders.
  const ocean=originalOceanResourceNames(level,false),waterPrograms=[...new Set(['WaterSim','WaterSimReset',ocean.shader,ocean.meshShader])];
  for(const name of waterPrograms){const program=catalog.program(name);await save(vulkanProgramSources({...program,fragmentSource:viewportWaterDepthFragment(program.fragmentSource)}));names.add(name);}
  runtimeCoverage.push({level,programs:[...programs].sort(),waterPrograms});
  for(const name of programs){const program=catalog.program(name),reference=vulkanProgramSources(program),hardware=vulkanProgramSources(program,true);await save(reference);if(hardware.some((s,i)=>s.text!==reference[i].text))await save(hardware);names.add(name);}
  const reprojection=catalog.program('FogUpsample'),tone=catalog.program('Tonemap');await save([{stage:'vert',text:reprojection.vertexSource,coordinates:'opengl'},{stage:'frag',text:tone.fragmentSource,coordinates:'opengl'}]);
  await save([{stage:'vert',text:reprojection.vertexSource,coordinates:'opengl'},{stage:'frag',text:catalog.program('Fxaa').fragmentSource,coordinates:'opengl'}]);names.add('Fxaa');
  for(const name of ['MotionDilate','TemporalAa']){await save([{stage:'vert',text:reprojection.vertexSource,coordinates:'opengl'},{stage:'frag',text:catalog.program(name).fragmentSource,coordinates:'opengl'}]);names.add(name);}
 }
 await save([{stage:'vert',text:viewportSkyVertex,format:'vulkan450'},{stage:'frag',text:viewportSkyFragment,format:'vulkan450'}]);
 await save(vulkanHalfStorageSources);names.add('PreviewHalfStorage');
 await save(viewportWaterBackgroundSources);names.add('ViewportWaterBackground');
 await save(viewportFlowerBackgroundSources);names.add('ViewportFlowerBackground');
 for(const model of [false,true])for(const transparent of [false,true])await save(viewportBasicMaterialSources(model,transparent));
 for(const key of await fs.readdir(output))if(/^[0-9a-f]{64}$/.test(key)&&!keys.has(key))await fs.rm(path.join(output,key),{recursive:true});
 await fs.writeFile('docs/viewport-shader-bundle.json',JSON.stringify({programs:[...names].sort(),modelPrograms:[...modelNames].sort(),modelCoverage,runtimeCoverage,keys:[...keys].sort(),cacheEntries:keys.size,architectureIndependent:true,scope:'All available map terrain/skirt and model shaders, both cloud sampling policies, full/fast/basic composition, depth-adapted Ocean/Water including SetOceanRender-only maps, Flame, Candle, Flower, simulation and fullscreen adapters. SDK-free map rendering; unrelated shader editing/diagnostics can require compiler tools.'},null,2)+'\n');console.log(JSON.stringify({cacheEntries:keys.size,programs:names.size,modelPrograms:modelNames.size,modelLevels:modelCoverage.length}));
}
void main().catch(error=>{console.error(error);process.exitCode=1;});
