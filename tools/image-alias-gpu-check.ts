import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';import assert from 'node:assert/strict';import * as THREE from 'three';
import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {readResourceMesh} from '../src/core/resources';import {bindBake} from '../src/core/baking';import {resourceModelGeometry,applyResourceModelTransform} from '../src/renderer/resource-model-renderer';import {exportVulkanScene} from '../src/renderer/vulkan-viewport';import {AssetCatalog} from '../src/main/assets';import {VulkanHost} from '../src/main/vulkan';import {createVulkanBakedRenderer} from '../src/main/vulkan-baked';import {effectiveLevelMeshMaterial,modelDrawBoundary} from '../src/core/model-draw';import {decodePng} from '../src/core/png';import {VULKAN_TEXTURE_FORMATS,type VulkanMaterialScene} from '../src/core/vulkan-protocol';import {compileVulkanShaders} from '../src/main/vulkan-shaders';import {vulkanProgramSources} from '../src/main/vulkan-program';
import {writeEffectPng,effectDisplay} from './effect-png';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',before=JSON.parse(fs.readFileSync('/root/sky-research/object-effects-before/model-draw-availability.json','utf8')),hash=(bytes:Uint8Array|string)=>crypto.createHash('sha256').update(bytes).digest('hex');
async function main(){
 const host=new VulkanHost(path.resolve('dist/native/sky-vulkan')),rows:unknown[]=[];let bound:VulkanMaterialScene[]=[];
 const capture=host.setViewportMaterials.bind(host);host.setViewportMaterials=async scenes=>{bound=scenes;await capture(scenes);};
 const report:any={passed:false,scope:'Actual original LevelMesh shaders and geometry for the four previously misidentified Image aliases. GPU resource bytes, format, finite fragment output and original source hashes checked. Scene probe/light-grid are existing preview adapters; no full game or Windows FPS claim.',cases:rows};
 try{
  report.device=await host.start();
  for(const alias of ['HeatTex','BasicGeoAtlas1','LifeForceMural02Sh','BirdStripTex']){
   const map=before.maps.find((m:any)=>m.models.some((n:any)=>n.boundary==='Texture unavailable: '+alias)),record=map.models.find((n:any)=>n.boundary==='Texture unavailable: '+alias),level=map.level;
   const objectsFile=path.join(data,'Levels',level,'Objects.level.bin'),source=fs.readFileSync(objectsFile),doc=new ObjectsDocument(source),node=doc.nodes[record.nodeId],resource=readResourceMesh(fs.readFileSync(path.join(data,'Meshes/Bin',record.resourceName+'.mesh'))),catalog=new AssetCatalog(data,level),descriptor=effectiveLevelMeshMaterial(node,level),program=catalog.program(descriptor.shaderName);
   const material=new THREE.MeshStandardMaterial(),object=new THREE.Mesh(resourceModelGeometry(resource),material);object.userData.nodeId=node.id;material.userData.nativeModel={shader:descriptor.shaderName,group:program.definition.group};
   if(record.baked){const meshes=new MeshesDocument(fs.readFileSync(path.join(data,'Levels',level,'BstBaked.meshes'))),guid=(node.fields.find(f=>f.name==='bstGuid')!.value as {uint:number}).uint,bake=meshes.bakes.find(b=>b.guid===guid)!;object.userData.boundBake=bindBake(resource,meshes.bakeData(bake.id,0));}
   assert.equal(modelDrawBoundary(node,level,program,!!object.userData.boundBake),null);
   applyResourceModelTransform(object,node.fields.find(f=>f.name==='transform')!.value as number[]);const scene=new THREE.Scene();scene.add(object);
   const box=new THREE.Box3().setFromObject(object),center=box.getCenter(new THREE.Vector3()),extent=box.getSize(new THREE.Vector3()).length(),camera=new THREE.PerspectiveCamera(50,1,.01,64000),viewDirection=new THREE.Vector3(.8,.9,1);
   if(program.definition.group==='Decal'||descriptor.shaderName.includes('AlphaTest')){viewDirection.set(0,0,0);for(let i=0;i<resource.normals.length;i+=3)viewDirection.add(new THREE.Vector3().fromArray(resource.normals,i));assert.ok(viewDirection.length()>0);viewDirection.transformDirection(object.matrixWorld);}
   let focusedTriangle:number|undefined;
   if(alias==='BirdStripTex'){
    // The mesh spans thousands of units with individual birds only a few
    // units wide. A whole-mesh 96px thumbnail makes the alpha-tested atlas
    // disappear in its mip levels. Inspect a real triangle at useful scale,
    // retaining every original vertex, index, material and sampler setting.
    const point=(i:number)=>new THREE.Vector3().fromArray(resource.positions,resource.indices[i]*3).applyMatrix4(object.matrixWorld);
    let largest=0;
    for(let i=0;i<resource.indices.length;i+=3){const a=point(i),b=point(i+1),c=point(i+2),area=b.sub(a).cross(c.sub(a)).lengthSq();if(area>largest){largest=area;focusedTriangle=i;}}
    assert.ok(focusedTriangle!==undefined);
    const a=point(focusedTriangle),b=point(focusedTriangle+1),c=point(focusedTriangle+2),focus=a.clone().add(b).add(c).divideScalar(3);
    viewDirection.copy(b.clone().sub(a).cross(c.clone().sub(a))).normalize();
    camera.position.copy(focus).add(viewDirection.multiplyScalar(Math.max(a.distanceTo(b),b.distanceTo(c),c.distanceTo(a))*1.5));camera.lookAt(focus);
   }else{camera.position.copy(center).add(viewDirection.normalize().multiplyScalar(extent*1.2));camera.lookAt(center);}
   camera.updateMatrixWorld();
   const matrix=new THREE.Matrix4().multiplyMatrices(camera.projectionMatrix,camera.matrixWorldInverse).toArray(),renderer=createVulkanBakedRenderer(level,doc.nodes,catalog,host,'/tmp/sky-image-alias-gpu-shaders');
   renderer.setDraws([],exportVulkanScene(scene).models);await renderer.render(96,96,matrix,camera.matrixWorld.toArray());assert.equal(bound.length,1);
   const parameter=descriptor.parameters.find(p=>p.texture===alias)!,compiled=await compileVulkanShaders(vulkanProgramSources(program),'/tmp/sky-image-alias-gpu-shaders'),binding=compiled.descriptors.find(d=>d.name===parameter.name)!.binding,texture=bound[0].resources.find(r=>r.binding===binding)!;
   const file=catalog.imageFile(alias),originalTexture=fs.readFileSync(file),decoded=decodePng(originalTexture),fields=catalog.image(alias).declaration!.fields;
   assert.deepEqual(texture.dimensions,[decoded.width,decoded.height,1]);assert.equal(texture.format,fields.gammaCorrection===false?VULKAN_TEXTURE_FORMATS.rgba8:VULKAN_TEXTURE_FORMATS.rgba8srgb);assert.deepEqual(Buffer.from(texture.data.subarray(0,decoded.rgba.length)),Buffer.from(decoded.rgba));
   await host.setMaterialScene(bound[0]);const output=(await host.materialFrame(96,96)).attachments[0];assert.ok(output.every(Number.isFinite));let covered=0,distinct=new Set<number>();
   // Original Decal disables alpha writes; an isolated clear target retains
   // alpha zero even when the decal's RGB is successfully drawn.
   for(let i=0;i<output.length;i+=4)if(program.definition.group==='Decal'?output[i]+output[i+1]+output[i+2]>0:output[i+3]>0){covered++;distinct.add(Math.round(output[i]*10000));}assert.ok(covered>10,alias);
   const screenshot=`docs/image-alias-${alias}-render.png`;await writeEffectPng(screenshot,96,96,effectDisplay(output));
   assert.equal(hash(fs.readFileSync(objectsFile)),hash(source));assert.equal(hash(fs.readFileSync(file)),hash(originalTexture));
   rows.push({alias,source:path.basename(file),level,nodeId:node.id,resource:record.resourceName,shader:descriptor.shaderName,group:program.definition.group,time:renderer.time(),focusedTriangle,cameraWorld:camera.matrixWorld.toArray(),viewProj:matrix,dimensions:texture.dimensions,format:texture.format,sourceSha256:hash(originalTexture),vertexShaderSha256:hash(program.vertexSource),fragmentShaderSha256:hash(program.fragmentSource),coveredPixels:covered,distinctRed:distinct.size,outputSha256:hash(new Uint8Array(output.buffer)),screenshot,screenshotSha256:hash(fs.readFileSync(screenshot)),displayAdapter:'HDR RGB mapped with v/(1+v), then sRGB; alpha displayed opaque. Original GPU attachment bytes are independently hashed.',sourceUnchanged:true});
   console.log(JSON.stringify({alias,level,covered}));
  }report.passed=true;
 }finally{host.stop();fs.writeFileSync('docs/image-alias-gpu-check.json',JSON.stringify(report,null,2)+'\n');}
 console.log(JSON.stringify({passed:report.passed,cases:rows.length}));
}
void main().catch(e=>{console.error(e);process.exitCode=1});
