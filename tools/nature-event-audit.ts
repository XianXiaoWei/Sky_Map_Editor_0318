import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';import {createViewportEnvironment} from '../src/main/viewport-environment';import {restoredNatureEventClasses} from '../src/core/environment-event-types';
const root=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',files:unknown[]=[],events:unknown[]=[],available:Record<string,number>={},blocked:Record<string,number>={};
for(const level of fs.readdirSync(path.join(root,'Levels')).sort()){
 const filename=path.join(root,'Levels',level,'Objects.level.bin'),source=fs.readFileSync(filename),doc=new ObjectsDocument(source),owner=createViewportEnvironment(doc.nodes,undefined,{level});
 const statuses=owner.info().events.filter(e=>(restoredNatureEventClasses as readonly string[]).includes(e.kind));
 for(const status of statuses){const count=status.available?available:blocked;count[status.kind]=(count[status.kind]??0)+1;const node=doc.nodes[status.id];events.push({level,...status,fields:node.fields.map(f=>({name:f.name,raw:f.raw,value:f.value})),runtimeComplete:false});}
 if(!Buffer.from(doc.serialize()).equals(source))throw new Error('Original corpus modified');owner.dispose();
 files.push({level,sha256:crypto.createHash('sha256').update(source).digest('hex'),natureEvents:statuses.length,sourceUnchanged:true});
}
const plants=JSON.parse(fs.readFileSync('docs/objects-nature-audit.json','utf8')).plantModels;
const controlCounts:Record<string,number>={},controlIds=new Set<string>();
for(const plant of plants)for(const control of plant.controlNodes){const key=plant.level+':'+control.nodeId;if(controlIds.has(key))continue;controlIds.add(key);controlCounts[control.className]=(controlCounts[control.className]??0)+1;}
const report={passed:true,maps:files.length,available,blocked,originalEventBodies:Object.keys(JSON.parse(fs.readFileSync('docs/nature-events-native.json','utf8')).functions).length,completeClasses:0,scope:'Dependency-satisfied events in the shared original Barn; creature parameter/guide/network writes and direct Flame light-on events. Original kernel oracle separately includes blocked branches through injected services. Creature AI/animation, Candle records, player authority, reflected event chains and downstream rendering remain pending.',files,events,plantControlTrace:{models:plants.length,uniqueControls:controlIds.size,classes:controlCounts,source:'docs/objects-nature-audit.json',scope:'Saved reverse-reference edges, maximum six; event relationships are evidence of references only, not proof of native burning behavior or a completed plant lifecycle'}};
fs.writeFileSync('docs/nature-event-audit.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({passed:true,maps:files.length,available,blocked,plantControlTrace:report.plantControlTrace}));
