import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import * as THREE from 'three';
import fixture from './fixtures/meshes-native.json';
import { MeshesDocument } from '../src/core/meshes';
import { nativeMaterialDefs, nativeMaterialParameters, terrainSurfaces, skirtSurfaces, materialAlpha } from '../src/core/mesh-surfaces';
import { createBakedObject, bakedGeometry, setBakedDisplay, updateBakedAttributes, nativeBakedMaterial } from '../src/renderer/baked-renderer';
import { AssetCatalog } from '../src/main/assets';
import { portableShader } from '../src/core/materials';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';

test('Original machine code fixtures retain all 59 surfaces and stable triangle index order',()=>{
  for(const c of fixture){const view={...c,indices:Uint32Array.from(c.indices),materialIds:Uint8Array.from(c.materialIds),weights:Uint8Array.from(c.weights)};const plan=terrainSurfaces(view,nativeMaterialDefs(c.level));assert.deepEqual([...plan.counts],c.counts);assert.deepEqual([...plan.indices],c.result);}
  const defs=nativeMaterialDefs('Dawn');assert.equal(defs.length,30);assert.equal(defs[29].materialId,80);
  assert.notDeepEqual(defs[19].color,nativeMaterialDefs('WorldEmpty')[19].color);defs[0].color[0]=99;assert.notEqual(nativeMaterialDefs('Dawn')[0].color[0],99);
});
test('Skirt presence includes zero-weight materials and slots after a zero ID',()=>{
  const defs=nativeMaterialDefs('WorldEmpty'), v={vertexCount:3,indices:Uint32Array.of(0,1,2),materialIds:Uint8Array.of(1,0,52,0,16,0,0,0,1,0,0,0),weights:new Uint8Array(12)};
  const skirt=skirtSurfaces(v,defs);assert.deepEqual(skirt.batches.map(b=>b.materialId),[1,16,52]);assert.ok(skirt.batches.every(b=>b.count===3&&b.start===0&&b.shaderName.endsWith('AlphaSkirt')));
  assert.equal(terrainSurfaces(v,defs).indices.length,0);
  assert.equal(materialAlpha([1,1,0,0],[200,200,0,0],1),400/255);assert.equal(materialAlpha([255,0,0,0],[255,0,0,0],255),0);
});
test('Real skirt GPU attributes preserve all original packed bytes and painting updates batch IDs',()=>{
  const doc=new MeshesDocument(fs.readFileSync(path.join(data,'Levels/Dawn/BstBaked.meshes'))), record=doc.geometries.find(g=>g.kind==='skirt')!, view=doc.geometryView(record), geometry=bakedGeometry(view);
  const bytes=doc.lod.subarray(record.vertexOffset,record.vertexOffset+record.vertexCount*40);
  for(let v=0;v<record.vertexCount;v++){for(let c=0;c<4;c++){assert.equal(view.userData1[v*4+c],bytes[v*40+36+c]);assert.equal(view.packedNormals[v*4+c],bytes.readInt8(v*40+12+c));}}
  assert.equal(geometry.attributes.a_userData1.normalized,true);assert.equal(geometry.attributes.a_normal.itemSize,4);assert.equal(geometry.attributes.a_light2.normalized,true);
  assert.ok(geometry.attributes.a_userData1.array instanceof Int8Array);
  for(let v=0;v<record.vertexCount;v++)for(let c=0;c<4;c++)assert.equal(geometry.attributes.a_userData1.getComponent(v,c),Math.max(-1,bytes.readInt8(v*40+36+c)/127));
  const object=createBakedObject(view,nativeMaterialDefs('Dawn'),'material',false), first=object.children[0];assert.equal((object.material as THREE.Material).visible,false);setBakedDisplay(object,'light0');assert.equal(first.visible,false);assert.equal((object.material as THREE.Material).visible,true);
  view.materialIds.fill(0);view.weights.fill(0);for(let i=0;i<view.vertexCount;i++){view.materialIds[i*4]=52;view.weights[i*4]=255;}
  updateBakedAttributes(object,'material',false);assert.deepEqual(object.userData.surfacePlan.batches.map((b:any)=>b.materialId),[52]);assert.deepEqual([...object.geometry.index!.array],[...view.indices]);
});
test('Occluder position edit preserves packed normals and the remaining reserved vertex byte',()=>{
  const levels=fs.readdirSync(path.join(data,'Levels'));
  let doc: MeshesDocument|undefined, record: any;
  for(const level of levels){const file=path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(file))continue;const d=new MeshesDocument(fs.readFileSync(file)), g=d.geometries.find(g=>g.kind==='occluder'&&g.vertexCount);if(g){doc=d;record=g;break;}}
  assert.ok(doc&&record);const view=doc.geometryView(record), before=Buffer.from(doc.lod.subarray(record.vertexOffset,record.vertexOffset+record.vertexCount*16));view.positions[0]+=1;doc.editGeometry(record.id,view.positions);
  const out=new MeshesDocument(doc.serialize()), next=out.geometries.find(g=>g.id===record.id)!;
  for(let i=0;i<record.vertexCount;i++)assert.deepEqual(out.lod.subarray(next.vertexOffset+i*16+12,next.vertexOffset+i*16+16),before.subarray(i*16+12,i*16+16));
  const packedView=out.geometryView(next); assert.equal(packedView.packedNormals.length,next.vertexCount*4);
  for(let v=0;v<next.vertexCount;v++)for(let c=0;c<4;c++)assert.equal(packedView.packedNormals[v*4+c],out.lod.readInt8(next.vertexOffset+v*16+12+c));
});
test('Original shader upload requires explicit globals and never inserts placeholder textures',()=>{
  const program=new AssetCatalog(data).program('SandSh'), defs=nativeMaterialDefs('Dawn'), def=defs.find(d=>d.shaderName==='SandSh')!;
  const bindings: Record<string,unknown>=Object.fromEntries(nativeMaterialParameters(def).map(p=>[p.name,p.vector]));
  const state={side:THREE.DoubleSide,transparent:false,depthTest:true,depthWrite:true,depthFunc:THREE.LessEqualDepth,blending:THREE.NoBlending};
  assert.throws(()=>nativeBakedMaterial(program,bindings,state),/u_sunDir/);
  for(const v of program.variables.filter(v=>v.storage==='uniform')){
    if(v.type==='mat4')bindings[v.name]=new THREE.Matrix4();
    else if(v.type==='float')bindings[v.name]=0;
    else if(/^vec[234]$/.test(v.type))bindings[v.name]=new Array(Number(v.type.at(-1))).fill(0);
    else if(v.type==='sampler2D')bindings[v.name]=new THREE.DataTexture(new Uint8Array(4),1,1);
    else if(v.type==='usampler2D')bindings[v.name]=new THREE.DataTexture(new Uint32Array(4),1,1,THREE.RGBAIntegerFormat,THREE.UnsignedIntType);
  }
  const material=nativeBakedMaterial(program,bindings,state);assert.equal(material.fragmentShader,portableShader(program.fragmentSource).replace(/^#version 300 es\s*\n/,''));assert.equal(material.glslVersion,THREE.GLSL3);assert.equal(material.uniforms.u_sunDir.value,bindings.u_sunDir);
  bindings.u_lightCountsTex=[];assert.throws(()=>nativeBakedMaterial(program,bindings,state),/usampler2D/);
});
