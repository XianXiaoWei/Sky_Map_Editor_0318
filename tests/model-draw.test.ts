import fs from 'node:fs';import assert from 'node:assert/strict';import test from 'node:test';import {ObjectsDocument} from '../src/core/objects';import {AssetCatalog} from '../src/main/assets';import {effectiveLevelMeshMaterial,modelDrawBoundary} from '../src/core/model-draw';
import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';
import type {VulkanHost} from '../src/main/vulkan';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
test('Mesh declaration resolves original preprocessing exports and skybox consumes the original half UV pair',()=>{
 for(const [level,name,filename] of [['CandleSpace','TutorialRocks_03','TutorialRocks_03_CompOcc.mesh'],['DayHubCave','CharOreoAAnim','CharOreoAAnim_CompOcc_CompEdges.mesh'],['Prairie_Cave','PropSpiritDarkCreatureFLAnim','PropSpiritDarkCreatureFLAnim_CompOcc.mesh'],['RainForest','CharSkyRayYoungAnim','CharSkyRayYoungAnim_CompOcc.mesh']])assert.ok(new AssetCatalog(data,level).meshFile(name).endsWith('/'+filename));
 const level='SkyHub2',node=new ObjectsDocument(fs.readFileSync(`${data}/Levels/${level}/Objects.level.bin`)).nodes[669],catalog=new AssetCatalog(data,level);
 assert.equal(modelDrawBoundary(node,level,catalog.program('SkyboxCloud'),false),null);
});
test('Original default MaterialDef shader and textures replace stale saved custom fields before model drawing',()=>{const level='CandleSpace',node=new ObjectsDocument(fs.readFileSync(`${data}/Levels/${level}/Objects.level.bin`)).nodes[342],material=effectiveLevelMeshMaterial(node,level),program=new AssetCatalog(data,level).program(material.shaderName);assert.equal(material.custom,false);assert.equal(material.shaderName,'RockFaceShMesh');assert.equal(material.parameters.find(p=>p.name==='u_topGeoTexture')?.texture,'WallSh');assert.equal(modelDrawBoundary(node,level,program,true),null);});
test('Original model preflight leaves baked-lighting and native animation dependencies explicit',()=>{const level='DayHubCave',nodes=new ObjectsDocument(fs.readFileSync(`${data}/Levels/${level}/Objects.level.bin`)).nodes,node=nodes[339],program=new AssetCatalog(data,level).program(effectiveLevelMeshMaterial(node,level).shaderName);assert.equal(modelDrawBoundary(node,level,program,true),null);assert.equal(modelDrawBoundary(node,level,program,false),'Baked vertex lighting unavailable');assert.equal(modelDrawBoundary(node,level,program,true,true),'Native skinning/animation unavailable');});
test('Original Black fallback and Scene Caustics image identity satisfy baked DarkStone bindings without changing saved names',()=>{const level='Dusk',node=new ObjectsDocument(fs.readFileSync(`${data}/Levels/${level}/Objects.level.bin`)).nodes[3],material=effectiveLevelMeshMaterial(node,level),catalog=new AssetCatalog(data,level);assert.equal(material.shaderName,'DarkStone');assert.equal(material.parameters.find(p=>p.name==='u_texSpots')?.texture,'Black');assert.equal(material.parameters.find(p=>p.name==='u_normal')?.texture,'Black');assert.ok(catalog.image('Black').exists);assert.ok(catalog.image('Caustics').exists);assert.equal(modelDrawBoundary(node,level,catalog.program('DarkStone'),true),null);assert.equal(node.fields.find(f=>f.name==='shaderParams')?.children?.find(p=>p.children?.some(f=>f.name==='uniformName'&&f.value==='u_texSpots'))?.children?.find(f=>f.name==='texValue')?.value,'');});
test('Scene diffuse probe inputs unblock real directional and alpha materials while retaining type checks',()=>{
 for(const [level,id] of [['CandleSpace',84],['DayEnd',216]] as const){
  const node=new ObjectsDocument(fs.readFileSync(`${data}/Levels/${level}/Objects.level.bin`)).nodes[id],catalog=new AssetCatalog(data,level),program=catalog.program(effectiveLevelMeshMaterial(node,level).shaderName);
  assert.equal(modelDrawBoundary(node,level,program,true),null,`${level} #${id}`);
  const global=program.variables.find(v=>v.name==='u_averageProbeColor'||v.name==='u_probeShR0')!;
  assert.ok(global);
  const invalid={...program,variables:program.variables.map(v=>v===global?{...v,type:'float'}:v)};
  assert.equal(modelDrawBoundary(node,level,invalid,true),`Scene probe global type ${global.name}`);
 }
});
test('SH creature models bind scene lighting and keep it owned by the scene',()=>{
 const level='Night',nodes=new ObjectsDocument(fs.readFileSync(`${data}/Levels/${level}/Objects.level.bin`)).nodes,node=nodes[732],catalog=new AssetCatalog(data,level);
 assert.equal(modelDrawBoundary(node,level,catalog.program('CreatureSl'),true),null);
 const renderer=createVulkanBakedRenderer(level,nodes,catalog,{} as VulkanHost,'/tmp/sky-model-global-ownership');
 assert.throws(()=>renderer.setModelParameterBinding(node.id,{name:'u_probeShR0',nativeType:1,vector:[1,1,1,1],texture:''}),/场景全局/);
});
