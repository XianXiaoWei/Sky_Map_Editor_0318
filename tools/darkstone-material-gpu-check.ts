import fs from 'node:fs';import path from 'node:path';import assert from 'node:assert/strict';import * as THREE from 'three';import {createHash} from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {readResourceMesh} from '../src/core/resources';import {AssetCatalog} from '../src/main/assets';import {VulkanHost} from '../src/main/vulkan';import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';
import {effectiveLevelMeshMaterial} from '../src/core/model-draw';import {savedDarkstoneMeshes,initialDarkstonePreviewMaterial} from '../src/core/darkstone-material';import {resourceModelGeometry,applyResourceModelTransform,exportResourceModel} from '../src/renderer/resource-model-renderer';import {loadEditorLevelDataModelBakes,bindEditorLoadedModelBake} from '../src/core/level-data-bake-adapter';import {objectScalar} from '../src/core/model-material-index';import {defaultModelLighting} from '../src/core/model-default-lighting';
import type {VulkanMaterialScene} from '../src/core/vulkan-protocol';import {writeEffectPng,effectDisplay} from './effect-png';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',sha=(b:Uint8Array)=>createHash('sha256').update(b).digest('hex');
function stats(output:Float32Array){let covered=0,total=0,maximum=0;for(let i=0;i<output.length;i+=4){assert.ok(output.subarray(i,i+4).every(Number.isFinite));if(output[i]||output[i+1]||output[i+2]){covered++;for(let k=0;k<3;k++){total+=output[i+k];maximum=Math.max(maximum,output[i+k]);}}}return {covered,mean:covered?total/(covered*3):0,maximum};}
async function main(){
 const report:any={passed:false,cases:[],scope:'Actual saved SoulTrap-owned LevelMesh geometry, loaded baked lighting, original DarkStone GLSL and production Vulkan binding. Before/after differs only by the four initial material bindings from original Darkstone.Initialize and exact static default diffuse color. Probe/scene adapters remain declared; complete burning Update, scene Model ownership and original Metal pixel parity are not claimed.'},host=new VulkanHost(path.resolve('dist/native/sky-vulkan'));let bound:VulkanMaterialScene[]=[];
 for(const method of ['setViewportMaterials','setViewportAlpha'] as const){const original=host[method].bind(host);host[method]=async scenes=>{bound.push(...scenes);await original(scenes);};}
 try{
  report.device=await host.start();
  for(const level of ['SkyHub2','RainForest','Dusk']){
   const source=fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')),nodes=new ObjectsDocument(source).nodes,catalog=new AssetCatalog(data,level),owned=savedDarkstoneMeshes(nodes),selected=nodes.filter(n=>owned.has(n.id)&&effectiveLevelMeshMaterial(n,level).shaderName==='DarkStone');
   const variants=new Set<string>();const representatives=selected.filter(n=>{const name=String(n.fields.find(f=>f.name==='resourceName')?.value);if(variants.has(name))return false;variants.add(name);return true;}).slice(0,level==='SkyHub2'?3:2);
   assert.ok(representatives.length,level+' saved Darkstone meshes');
   const cache=new Map<string,ReturnType<typeof readResourceMesh>>(),resolve=(name:string)=>{const f=catalog.meshFile(name);let mesh=cache.get(f);if(!mesh){mesh=readResourceMesh(fs.readFileSync(f));cache.set(f,mesh);}return mesh;};
   const bakeSource=fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes')),baked=new MeshesDocument(bakeSource),loaded=loadEditorLevelDataModelBakes(baked,name=>{try{return resolve(name);}catch(e){if((e as NodeJS.ErrnoException).code==='ENOENT')return null;throw e;}});
   for(const node of representatives){
    const id=node.id,description=effectiveLevelMeshMaterial(node,level),program=catalog.program(description.shaderName),file=catalog.meshFile(String(node.fields.find(f=>f.name==='resourceName')!.value)),bytes=fs.readFileSync(file),resource=resolve(String(node.fields.find(f=>f.name==='resourceName')!.value)),bake=bindEditorLoadedModelBake(baked,loaded,resource,objectScalar(node,'bstGuid'));
    const geometry=resourceModelGeometry(resource),material=new THREE.MeshStandardMaterial();material.userData.nativeModel={shader:description.shaderName,group:program.definition.group};const object=new THREE.Mesh(geometry,material);object.userData.nodeId=id;if(bake)object.userData.boundBake=bake.bound;else object.userData.defaultModelLighting=defaultModelLighting(geometry.getAttribute('position').count);applyResourceModelTransform(object,node.fields.find(f=>f.name==='transform')!.value as number[]);
    const box=new THREE.Box3().setFromObject(object),center=box.getCenter(new THREE.Vector3()),extent=box.getSize(new THREE.Vector3()).length(),camera=new THREE.PerspectiveCamera(50,1,.01,64000),renderer=createVulkanBakedRenderer(level,nodes,catalog,host,'/tmp/sky-darkstone-material');renderer.setDraws([],[exportResourceModel(object,material,0,resource.indices.length)]);
    let output:Float32Array|undefined,after:ReturnType<typeof stats>|undefined;
    for(const direction of [[.8,.9,1],[-.8,-.9,-1],[0,1,0]]){
     camera.position.copy(center).add(new THREE.Vector3(...direction).normalize().multiplyScalar(Math.max(.1,extent*1.2)));camera.lookAt(center);camera.updateMatrixWorld();bound=[];renderer.invalidateGpu();await renderer.render(96,96,new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),camera.matrixWorld.toArray());assert.equal(bound.length,1);await host.setMaterialScene(bound[0]);output=(await host.materialFrame(96,96)).attachments[0];after=stats(output);if(after.covered>10)break;
    }
    assert.ok(after!.covered>10,level+' #'+id+' visible plant pixels');
    const sampling=renderer.info().textureSampling;
    assert.equal(sampling.find(t=>t.name==='DarkstoneNorTex')?.gamma,false);assert.equal(sampling.find(t=>t.name==='DeerSpotTex')?.gamma,true);
    const afterHash=sha(new Uint8Array(output!.buffer)),image='docs/darkstone-material-'+level+'-'+id+'-after.png';await writeEffectPng(image,96,96,effectDisplay(output!));
    // Explicitly replay the previous saved-only binding via the existing sink.
    for(const p of description.parameters)if(['u_diffuseColor','u_texSpots','u_normal','u_spotsColor'].includes(p.name))renderer.setModelParameterBinding(id,p);
    bound=[];await renderer.render(96,96,new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),camera.matrixWorld.toArray());assert.equal(bound.length,1);await host.setMaterialScene(bound[0]);const beforeOutput=(await host.materialFrame(96,96)).attachments[0],before=stats(beforeOutput);assert.notEqual(sha(new Uint8Array(beforeOutput.buffer)),afterHash,'Initial bindings must reach GPU');
    const beforeImage=image.replace('-after','-before');await writeEffectPng(beforeImage,96,96,effectDisplay(beforeOutput));
    report.cases.push({level,id,shader:description.shaderName,resource:resource.name,baked:!!bake,after,before,afterHash,parameters:initialDarkstonePreviewMaterial(description).parameters,images:[beforeImage,image]});console.log(JSON.stringify({level,id,after,before}));geometry.dispose();material.dispose();
    assert.equal(sha(fs.readFileSync(file)),sha(bytes));
   }
   assert.equal(sha(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin'))),sha(source));assert.equal(sha(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),sha(bakeSource));
  }
  report.passed=true;report.sourcesUnchanged=true;
 }finally{host.stop();fs.writeFileSync('docs/darkstone-material-gpu-check.json',JSON.stringify(report,null,2)+'\n');}
}
void main().catch(e=>{console.error(e);process.exitCode=1;});
