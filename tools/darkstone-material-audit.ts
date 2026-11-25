import fs from 'node:fs';import path from 'node:path';import assert from 'node:assert/strict';import {createHash} from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';import {effectiveLevelMeshMaterial} from '../src/core/model-draw';import {savedDarkstoneMeshes,initialDarkstonePreviewMaterial} from '../src/core/darkstone-material';import {AssetCatalog} from '../src/main/assets';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',sha=(b:Uint8Array|string)=>createHash('sha256').update(b).digest('hex'),rows:unknown[]=[],files:unknown[]=[],shaders:Record<string,number>={};let darkstoneBindings=0;
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;
 const source=fs.readFileSync(file),d=new ObjectsDocument(source),owned=savedDarkstoneMeshes(d.nodes),catalog=new AssetCatalog(data,level);
 for(const node of d.nodes.filter(n=>owned.has(n.id))){
  const saved=effectiveLevelMeshMaterial(node,level),material=initialDarkstonePreviewMaterial(saved),program=catalog.program(saved.shaderName),resource=String(node.fields.find(f=>f.name==='resourceName')?.value);
  shaders[saved.shaderName]=(shaders[saved.shaderName]??0)+1;
  if(saved.shaderName==='DarkStone'){
   darkstoneBindings++;
   for(const name of ['DeerSpotTex','DarkstoneNorTex'])assert.ok(catalog.image(name).exists,level+' '+name);
   assert.equal(catalog.image('DarkstoneNorTex').declaration?.fields.gammaCorrection,false);
   assert.equal(material.parameters.find(p=>p.name==='u_texSpots')?.texture,'DeerSpotTex');assert.equal(material.parameters.find(p=>p.name==='u_normal')?.texture,'DarkstoneNorTex');
  }else assert.equal(material,saved);
  rows.push({level,nodeId:node.id,resource,shader:saved.shaderName,resourceExists:fs.existsSync(catalog.meshFile(resource)),shaderHashes:[sha(program.vertexSource),sha(program.fragmentSource)],savedParameters:saved.parameters,initialPreviewParameters:material.parameters,completeRuntime:false});
 }
 assert.deepEqual(d.serialize(),source);assert.equal(sha(fs.readFileSync(file)),sha(source));files.push({level,sha256:sha(source),sourceUnchanged:true});
}
const report={passed:true,levels:files.length,ownedMeshInstances:rows.length,darkstoneBindings,shaders,scope:'All saved SoulTrap.meshes members and initial preview material projection. Original shader sources and map bytes stay unchanged. Shader/texture declaration and initial binding checks do not constitute full scene Model startup, burning effects, natural animation, or whole-class acceptance.',rows,files};
fs.writeFileSync('docs/darkstone-material-audit.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:true,levels:files.length,ownedMeshInstances:rows.length,darkstoneBindings,shaders}));
