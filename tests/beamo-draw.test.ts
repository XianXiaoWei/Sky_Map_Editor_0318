import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';import crypto from 'node:crypto';import * as THREE from 'three';
import {ObjectsDocument} from '../src/core/objects';import {readResourceMesh} from '../src/core/resources';import {MeshesDocument} from '../src/core/meshes';import {loadEditorLevelDataModelBakes} from '../src/core/level-data-bake-adapter';
import {findLoadedBake} from '../src/core/baked-lookup';
import {buildBeamoDrawGeometry,beamoDrawMaterial,originalBeamoRsqrtCapability} from '../src/core/beamo-draw';import {evaluatePreparedBeamoGeometry,prepareBeamoGeometryInput} from '../src/core/beamo-geometry-adapter';import {applyResourceModelTransform} from '../src/renderer/resource-model-renderer';import {exportVulkanScene} from '../src/renderer/vulkan-viewport';import metadata from '../docs/beamo-rsqrt-capability.json';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
const capability=fs.readFileSync('docs/beamo-rsqrt-capability.bin'),rsqrt=originalBeamoRsqrtCapability(capability);
test('Observed original RSQRTSS capability keeps source identity and rejects unknown edited inputs',()=>{
 assert.equal(sha(capability),metadata.binarySha256);const d=new DataView(capability.buffer,capability.byteOffset,capability.byteLength);
 for(let i=8;i<capability.length;i+=8){if(i>8)assert.ok(d.getUint32(i,true)>d.getUint32(i-8,true));assert.equal(rsqrt(d.getUint32(i,true)),d.getUint32(i+4,true));}
 assert.throws(()=>rsqrt(0xffffffff),/Unobserved/);assert.throws(()=>originalBeamoRsqrtCapability(capability.subarray(0,7)),/Invalid/);
});
test('Actual SkyHub2 Beamo and Decal draw bytes match independent original LOD0 upload observations',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-draw-native.json.gz')).toString()),nodes=new ObjectsDocument(fs.readFileSync(`${data}/Levels/SkyHub2/Objects.level.bin`)).nodes,meshes=new MeshesDocument(fs.readFileSync(`${data}/Levels/SkyHub2/BstBaked.meshes`));
 const resolve=(name:string)=>{try{const mesh=readResourceMesh(fs.readFileSync(`${data}/Meshes/Bin/${name}.mesh`));mesh.name=name;return mesh;}catch(e){if((e as NodeJS.ErrnoException).code==='ENOENT')return null;throw e;}};const loaded=loadEditorLevelDataModelBakes(meshes,resolve);let checked=0;
 for(const c of fixture.cases){const nodeId=Number(c.input.label.split('/')[1].slice(1)),name=c.input.resourceKey.split('/')[0],mesh=readResourceMesh(fs.readFileSync(`${data}/Meshes/Bin/${name}.mesh`));mesh.name=name;
  const expected=evaluatePreparedBeamoGeometry(prepareBeamoGeometryInput(c.input,fixture.resources[c.input.resourceKey]),Buffer.from(fixture.fallback,'base64'),rsqrt);
  assert.equal(sha(expected.snapshot),c.nativeSha256,c.input.label);
  const guid=(nodes[nodeId].fields.find(f=>f.name==='bstGuid')!.value as {uint:number}).uint,record=findLoadedBake(loaded,guid);
  const actual=buildBeamoDrawGeometry(nodes,'SkyHub2',nodeId,mesh,record,Buffer.from(fixture.fallback,'base64'),rsqrt);
  assert.equal(actual.acceptedBake,c.input.bake);assert.deepEqual(actual.counts,expected.counts);assert.deepEqual(actual.vertices,expected.vertices.slice(0,expected.counts.vertices*48));
  for(const pass of actual.passes){const start=pass.pass==='primary'?0:pass.pass==='secondary'?mesh.levels[0].indices.length:mesh.levels[0].indices.length*2;assert.deepEqual(new Uint8Array(pass.indices.buffer),expected.indices.subarray(start*4,(start+pass.indices.length)*4));const material=beamoDrawMaterial(nodes,'SkyHub2',nodeId,pass.pass);assert.equal(pass.materialNodeId,material.materialNodeId);assert.equal(pass.shader,material.material.shaderName);}checked++;
 }
 assert.equal(checked,189);
});
test('World-space Beamo draws preserve bytes, merge static owners and isolate moved or hidden instances',()=>{
 const scene=new THREE.Scene(),vertices=new Uint8Array(144);const d=new DataView(vertices.buffer);for(let i=0;i<3;i++){d.setFloat32(i*48,i+10,true);d.setFloat32(i*48+4,i,true);}
 const make=(id:number)=>{const root=new THREE.Group(),matrix=new THREE.Matrix4().makeTranslation(10,0,0).toArray();applyResourceModelTransform(root,matrix);const g=new THREE.BufferGeometry();g.setAttribute('position',new THREE.BufferAttribute(new Float32Array([0,0,0,1,1,0,2,2,0]),3));g.setIndex([0,1,2]);const m=new THREE.MeshBasicMaterial();m.userData.nativeModel={shader:'MeshSh',group:'Opaque',materialNodeId:77,beamoPass:'primary'};const child=new THREE.Mesh(g,m);child.userData.beamoDraw={nodeId:id,matrix,vertices,acceptedBake:true};root.add(child);scene.add(root);return root;};
 const a=make(20),b=make(21);let models=exportVulkanScene(scene).models!;assert.equal(models.length,1);assert.deepEqual(models[0].beamoNodeIds,[20,21]);assert.deepEqual(models[0].model,new THREE.Matrix4().toArray());assert.deepEqual(models[0].vertices.slice(0,144),vertices);assert.deepEqual([...models[0].indices],[0,1,2,3,4,5]);
 b.matrix.elements[12]+=5;models=exportVulkanScene(scene).models!;assert.equal(models.length,2);assert.equal(models.find(m=>m.nodeId===21)!.model[12],5);assert.deepEqual(models.find(m=>m.nodeId===21)!.vertices,vertices);a.visible=false;assert.equal(exportVulkanScene(scene).models!.length,1);
});
