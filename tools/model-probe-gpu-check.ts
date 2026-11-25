import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';import assert from 'node:assert/strict';import * as THREE from 'three';
import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {readResourceMesh} from '../src/core/resources';import {bindBake} from '../src/core/baking';
import {resourceModelGeometry,applyResourceModelTransform} from '../src/renderer/resource-model-renderer';import {exportVulkanScene} from '../src/renderer/vulkan-viewport';
import {AssetCatalog} from '../src/main/assets';import {VulkanHost} from '../src/main/vulkan';import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';import {effectiveLevelMeshMaterial,modelDrawBoundary} from '../src/core/model-draw';
import {compileVulkanShaders} from '../src/main/vulkan-shaders';import {vulkanProgramSources} from '../src/main/vulkan-program';import {decodePng} from '../src/core/png';import type {VulkanMaterialScene} from '../src/core/vulkan-protocol';
import {writeEffectPng,effectDisplay} from './effect-png';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',before=JSON.parse(fs.readFileSync('/root/sky-research/model-texture-before.json','utf8'));
const hash=(b:Uint8Array|string)=>crypto.createHash('sha256').update(b).digest('hex');
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),rows:unknown[]=[];let bound:VulkanMaterialScene[]=[];
 for(const method of ['setViewportMaterials','setViewportAlpha'] as const){const original=host[method].bind(host);host[method]=async scenes=>{bound.push(...scenes);await original(scenes);};}
 const report:any={passed:false,scope:'Previously blocked real model materials, original shader/texture/packed geometry and production Vulkan binding. Atmosphere cubemap/SH are explicit editor lighting inputs; original scene intersection lighting and complete native animation/lifecycles remain pending.',excluded:{shader:'CreatureSl',instances:6,reason:'Original-input MoteKeyDiamond05 vertex occlusion produced nonfinite GPU fragments in a preliminary check. SH globals remain blocked in production.'},cases:rows};
 try{
  report.device=await host.start();
  for(const shader of ['DirectionalLighting','DirectionalLightingNoUv','LitAlpha','LitAlphaColor','LitAlphaTest','LitAlphaDual','LitAlphaFading']){
   const candidates=before.maps.flatMap((m:any)=>m.models.filter((n:any)=>n.shader===shader&&/Uniform u_(averageProbeColor|probeSh)/.test(n.boundary??'')).map((n:any)=>({level:m.level,...n})));
   // Prefer an enabled object with a real patterned image over constant White.
   const scored=candidates.map((record:any)=>{
    const nodes=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',record.level,'Objects.level.bin'))).nodes;
    const material=effectiveLevelMeshMaterial(nodes[record.nodeId],record.level);
    const fade=material.parameters.find(p=>p.name==='u_alphaFade')?.vector[0]??0;
    return {record,score:Number(fade<1&&!material.parameters.some(p=>p.texture==='Clear'))*1000+Number(record.render!==0&&record.enabled!==0)*10+Number(material.parameters.some(p=>p.texture&&!['White','Black'].includes(p.texture)))*100};
   }).sort((a:any,b:any)=>b.score-a.score);
   assert.ok(scored.length,shader);const record=scored[0].record,level=record.level;
   const file=path.join(data,'Levels',level,'Objects.level.bin'),source=fs.readFileSync(file),nodes=new ObjectsDocument(source).nodes,node=nodes[record.nodeId],catalog=new AssetCatalog(data,level),descriptor=effectiveLevelMeshMaterial(node,level),program=catalog.program(shader);
   const meshFile=path.join(data,'Meshes/Bin',record.resourceName+'.mesh'),meshBytes=fs.readFileSync(meshFile),resource=readResourceMesh(meshBytes);
   assert.equal(modelDrawBoundary(node,level,program,record.baked,resource.animated),null);
   const material=new THREE.MeshStandardMaterial(),object=new THREE.Mesh(resourceModelGeometry(resource),material);object.userData.nodeId=node.id;material.userData.nativeModel={shader,group:program.definition.group};
   if(record.baked){const meshes=new MeshesDocument(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),guid=(node.fields.find(f=>f.name==='bstGuid')!.value as {uint:number}).uint,bake=meshes.bakes.find(b=>b.guid===guid)!;object.userData.boundBake=bindBake(resource,meshes.bakeData(bake.id,0));}
   applyResourceModelTransform(object,node.fields.find(f=>f.name==='transform')!.value as number[]);const scene=new THREE.Scene();scene.add(object);
   const box=new THREE.Box3().setFromObject(object),center=box.getCenter(new THREE.Vector3()),extent=box.getSize(new THREE.Vector3()).length(),camera=new THREE.PerspectiveCamera(50,1,.01,64000);
   let direction=new THREE.Vector3(.8,.9,1);
   if(program.definition.group.startsWith('Alpha')){direction=new THREE.Vector3();for(let i=0;i<resource.normals.length;i+=3)direction.add(new THREE.Vector3().fromArray(resource.normals,i));if(direction.lengthSq()<1e-10)direction.set(.8,.9,1);else direction.transformDirection(object.matrixWorld);}
   camera.position.copy(center).add(direction.normalize().multiplyScalar(extent*1.2));camera.lookAt(center);camera.updateMatrixWorld();
   const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),renderer=createVulkanBakedRenderer(level,nodes,catalog,host,'/tmp/sky-model-probe-shaders');
   renderer.setDraws([],exportVulkanScene(scene).models);bound=[];await renderer.render(128,128,matrix,camera.matrixWorld.toArray());assert.equal(bound.length,1,shader);
   const compiled=await compileVulkanShaders(vulkanProgramSources(program),'/tmp/sky-model-probe-shaders');assert.ok(compiled.success,compiled.log);
   const images=[];
   for(const d of compiled.descriptors.filter(d=>d.kind==='combined-image-sampler')){
    const parameter=descriptor.parameters.find(p=>p.name===d.name);if(!parameter?.texture)continue;
    const imageFile=catalog.imageFile(parameter.texture),imageBytes=fs.readFileSync(imageFile),decoded=decodePng(imageBytes),uploaded=bound[0].resources.find(r=>r.binding===d.binding)!;
    assert.deepEqual(Buffer.from(uploaded.data.subarray(0,decoded.rgba.length)),Buffer.from(decoded.rgba));images.push({uniform:d.name,image:parameter.texture,sourceSha256:hash(imageBytes)});
   }
   const block=compiled.descriptors.find(d=>d.type.members?.some(m=>m.name==='u_averageProbeColor'||m.name==='u_probeShR0'))!,ubo=bound[0].resources.find(r=>r.binding===block.binding)!,view=new DataView(ubo.data.buffer,ubo.data.byteOffset,ubo.data.byteLength),probeValues:Record<string,number[]>={};
   for(const member of block.type.members!.filter(m=>/u_(averageProbeColor|probeSh)/.test(m.name)))probeValues[member.name]=Array.from({length:member.type.count??1},(_,i)=>view.getFloat32(member.offset+i*4,true));
   assert.ok(Object.values(probeValues).flat().every(Number.isFinite));assert.ok(Object.values(probeValues).flat().some(v=>v!==0),shader);
   await host.setMaterialScene(bound[0]);const output=(await host.materialFrame(128,128)).attachments[0];assert.ok(output.every(Number.isFinite));let covered=0;
   for(let i=0;i<output.length;i+=4)if(Math.abs(output[i])+Math.abs(output[i+1])+Math.abs(output[i+2])>1e-8)covered++;
   assert.ok(covered>10,`${shader} produced no colored pixels`);
   const screenshot=`docs/model-probe-${shader}.png`;await writeEffectPng(screenshot,128,128,effectDisplay(output));
   const uploads=renderer.uploadInfo().materialUploads;renderer.advance(.1);await renderer.render(128,128,matrix,camera.matrixWorld.toArray());assert.equal(renderer.uploadInfo().materialUploads,uploads,'Time update must reuse geometry and images');
   assert.throws(()=>renderer.setModelParameterBinding(node.id,{name:'u_averageProbeColor',nativeType:1,vector:[1,1,1],texture:''}),/场景全局/);
   assert.equal(hash(fs.readFileSync(file)),hash(source));assert.equal(hash(fs.readFileSync(meshFile)),hash(meshBytes));
   rows.push({shader,level,nodeId:node.id,resource:record.resourceName,previousBoundary:record.boundary,images,probeValues,coveredPixels:covered,outputSha256:hash(new Uint8Array(output.buffer)),screenshot,uploadsAfterTimeUpdate:renderer.uploadInfo().materialUploads,sourceUnchanged:true});
   console.log(JSON.stringify({shader,level,nodeId:node.id,covered,images:images.length}));
  }
  report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/model-probe-gpu-check.json',JSON.stringify(report,null,2)+'\n');}
 console.log(JSON.stringify({passed:report.passed,cases:rows.length}));
}
void main().catch(e=>{console.error(e);process.exitCode=1});
