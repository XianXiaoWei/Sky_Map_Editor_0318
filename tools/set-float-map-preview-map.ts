import fs from 'node:fs';
import crypto from 'node:crypto';
import {ObjectsDocument} from '../src/core/objects';
import {objectPlaybackCandidates} from '../src/core/object-playback-plan';

/** A clearly labelled temporary demonstration. Keep the saved original model,
 * transforms and endpoints; record every changed control and event link. */
export function prepareSetFloatMap(source:Buffer){
 const doc=new ObjectsDocument(source),changes:{node:number;field:string;before:unknown;after:unknown}[]=[];
 const edit=(node:number,name:string,value:number,representation?:string)=>{
  const f=doc.nodes[node].fields.find(f=>f.name===name)!;changes.push({node,field:name,before:f.value,after:value});doc.edit(f.id,value,representation);
 };
 edit(43,'time',1,'float');edit(43,'snappiness',.3,'float');
 edit(270,'progress01',874);edit(270,'completeAtEnd',0);
 edit(444,'enable',1);edit(444,'objects',84);
 const members=doc.nodes[84].fields.find(f=>f.name==='data')!.children!;
 assertClass(doc.nodes[43].className,'SetFloat');assertClass(doc.nodes[270].className,'TransformObject');
 for(const [i,id] of [43,270].entries()){const f=members[i];changes.push({node:84,field:f.name,before:f.value,after:id});doc.edit(f.id,id);}
 const bytes=doc.serialize(),parsed=new ObjectsDocument(bytes),candidate=objectPlaybackCandidates(parsed.nodes).find(c=>c.id===444)!;
 if(!candidate.available)throw new Error(candidate.reason);
 return {bytes,nodes:parsed.nodes,candidate,changes,sourceSha256:crypto.createHash('sha256').update(source).digest('hex')};
}
function assertClass(actual:string,expected:string){if(actual!==expected)throw new Error(`Expected ${expected}, found ${actual}`);}
if(process.argv[1]?.endsWith('set-float-map-preview-map.ts')&&process.argv[2]){
 const prepared=prepareSetFloatMap(fs.readFileSync(process.argv[2]));fs.writeFileSync(process.argv[3],prepared.bytes);
 console.log(JSON.stringify({sourceSha256:prepared.sourceSha256,changes:prepared.changes,root:prepared.candidate.id,events:prepared.candidate.events,objects:prepared.candidate.affectedObjects}));
}
