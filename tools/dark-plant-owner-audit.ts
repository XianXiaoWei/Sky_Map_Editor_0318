import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';import assert from 'node:assert/strict';import {ObjectsDocument} from '../src/core/objects';
const root=process.env.SKY_DATA?path.join(process.env.SKY_DATA,'Levels'):'/root/sky-research/original-runtime-corpus/Levels',counts:Record<string,number>={},directOwners:Record<string,number>={},blazeFields:unknown[]=[],soulTraps:unknown[]=[],files:unknown[]=[];let darkshroomModels=0;
for(const level of fs.readdirSync(root).sort()){
 const file=path.join(root,level,'Objects.level.bin');if(!fs.existsSync(file))continue;
 const source=fs.readFileSync(file),doc=new ObjectsDocument(source);assert.equal(doc.end,source.length);assert.deepEqual(Buffer.from(doc.serialize()),source);const plants=new Set(doc.nodes.filter(n=>n.className==='LevelMesh'&&/^Darkshroom_/.test(String(n.fields.find(f=>f.name==='resourceName')?.value))).map(n=>n.id));darkshroomModels+=plants.size;
 for(const node of doc.nodes){
  if(['Flame','Blaze','SoulTrap'].includes(node.className))counts[node.className]=(counts[node.className]??0)+1;
  for(const field of node.fields)if(field.kind==='reference'&&plants.has(Number(field.value)))directOwners[node.className]=(directOwners[node.className]??0)+1;
  if(node.className==='SoulTrap'){const clump=doc.nodes[Number(node.fields.find(f=>f.name==='meshes')?.value)],data=clump?.fields.find(f=>f.name==='data')?.children??[],members=data.map(f=>Number(f.value)),plantsOwned=members.filter(id=>plants.has(id));if(plantsOwned.length)soulTraps.push({level,id:node.id,clump:clump.id,plants:plantsOwned,useHierarchy:node.fields.find(f=>f.name==='useHierarchy')?.value});}
  if(node.className==='Blaze')blazeFields.push({level,id:node.id,meshType:node.fields.find(f=>f.name==='meshType')?.value,root:node.fields.find(f=>f.name==='root')?.value});
 }
 files.push({level,sha256:crypto.createHash('sha256').update(source).digest('hex'),unchangedRoundTrip:true});
}
const report={passed:true,levels:files.length,counts,darkshroomModels,directOwners,soulTraps,blazeFields,files,scope:'All original map files unchanged; direct top-level saved references and SoulTrap.meshes → Clump.data members only. Absent direct Blaze/Flame references do not rule out native dynamic Darkstone ownership; no automatic plant burning or complete classes inferred.'};fs.writeFileSync('docs/dark-plant-owner-dependencies.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:true,levels:files.length,counts,darkshroomModels,directOwners,soulTraps:soulTraps.length}));
