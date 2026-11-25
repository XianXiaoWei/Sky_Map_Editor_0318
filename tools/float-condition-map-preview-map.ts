import fs from 'node:fs';
import crypto from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';
import {objectPlaybackCandidates} from '../src/core/object-playback-plan';

/** Explicitly prepared inputs. Preserve the original platform model, target,
 * mesh and transform fields; route its controller through a condition/delay. */
export function prepareFloatConditionMap(source:Buffer){
 const doc=new ObjectsDocument(source),changes:{node:number;field:string;before:unknown;after:unknown}[]=[];
 const edit=(node:number,name:string,value:number,representation?:string)=>{const f=doc.nodes[node].fields.find(f=>f.name===name)!;changes.push({node,field:name,before:f.value,after:value});doc.edit(f.id,value,representation);};
 edit(229,'value',874);edit(229,'conditionOneValue',.35,'float');edit(229,'conditionOneOperator',1,'uint');
 edit(43,'time',1,'float');edit(43,'snappiness',.3,'float');edit(270,'progress01',874);edit(270,'completeAtEnd',0);
 edit(444,'enable',1);edit(444,'objects',84);
 edit(229,'trueEvents',65);edit(65,'events',359);edit(65,'delay',.5,'float');
 for(const [node,index,target] of [[84,0,43],[84,1,229],[359,0,270]]){const f=doc.nodes[node].fields.find(f=>f.name==='data')!.children![index];changes.push({node,field:f.name,before:f.value,after:target});doc.edit(f.id,target);}
 const bytes=doc.serialize(),parsed=new ObjectsDocument(bytes),candidate=objectPlaybackCandidates(parsed.nodes).find(c=>c.id===444)!;
 if(!candidate.available)throw new Error(candidate.reason);
 return {bytes,nodes:parsed.nodes,candidate,changes,sourceSha256:crypto.createHash('sha256').update(source).digest('hex')};
}
if(process.argv[1]?.endsWith('float-condition-map-preview-map.ts')&&process.argv[2]){
 const p=prepareFloatConditionMap(fs.readFileSync(process.argv[2]));fs.writeFileSync(process.argv[3],p.bytes);
 console.log(JSON.stringify({sourceSha256:p.sourceSha256,changes:p.changes,root:p.candidate.id,events:p.candidate.events,objects:p.candidate.affectedObjects}));
}
