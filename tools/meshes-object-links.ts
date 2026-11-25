import fs from 'node:fs';import path from 'node:path';import assert from 'node:assert/strict';
import {ObjectsDocument,type Field} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const number=(f:Field|undefined)=>f?.kind==='bits32'?(f.value as {uint:number}).uint:typeof f?.value==='number'?f.value:undefined;
const resource=(fields:Field[])=>String(fields.find(f=>f.name==='resourceName')?.value??fields.find(f=>f.name==='meshName')?.value??'');
const levels:any[]=[],classStats:Record<string,{guidObjects:number;bakeOwners:number;nameMatchedOwners:number;outgoingClasses:Record<string,number>}>= {},segments:Record<string,{bytes:number;records:number;levels:number}>= {},versions:Record<number,number>={},unresolved:any[]=[];
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const folder=path.join(data,'Levels',level);if(!fs.existsSync(path.join(folder,'BstBaked.meshes')))continue;
 const objects=new ObjectsDocument(fs.readFileSync(path.join(folder,'Objects.level.bin'))),mesh=new MeshesDocument(fs.readFileSync(path.join(folder,'BstBaked.meshes'))),nodes=objects.nodes;
 const guidMap=new Map<number,typeof nodes>();versions[mesh.version]=(versions[mesh.version]??0)+1;
 const walk=(fields:Field[],cb:(f:Field)=>void)=>{for(const f of fields){cb(f);if(f.children)walk(f.children,cb);}};
 for(const n of nodes){const guid=number(n.fields.find(f=>f.name==='bstGuid'));if(guid!==undefined){const group=guidMap.get(guid)??[];group.push(n);guidMap.set(guid,group);classStats[n.className]??={guidObjects:0,bakeOwners:0,nameMatchedOwners:0,outgoingClasses:{}};classStats[n.className].guidObjects++;}}
 const records=mesh.bakes.map(b=>{
  const owners=(guidMap.get(b.guid)??[]).map(n=>{
   const name=resource(n.fields),matched=name===b.name,stat=classStats[n.className];stat.bakeOwners++;if(matched)stat.nameMatchedOwners++;
   const references:any[]=[];walk(n.fields,f=>{if(f.kind!=='reference'||f.value===0xffffffff)return;const target=nodes[Number(f.value)];if(!target){references.push({field:f.id,missing:f.value});return;}references.push({field:f.id,nodeId:target.id,className:target.className});stat.outgoingClasses[target.className]=(stat.outgoingClasses[target.className]??0)+1;});
   return {nodeId:n.id,className:n.className,name:n.name,resource:name,resourceNameMatches:matched,references};
  });
  const record={id:b.id,resource:b.name,guid:b.guid,lods:b.submeshes.length,uniform:b.uniform,owners};if(!owners.some(o=>o.resourceNameMatches))unresolved.push({level,...record});return record;
 });
 let end=0;for(const s of mesh.logicalSegments){assert.equal(s.offset,end);end+=s.length;segments[s.name]??={bytes:0,records:0,levels:0};segments[s.name].bytes+=s.length;segments[s.name].records+=s.records;if(s.records)segments[s.name].levels++;}assert.equal(end,mesh.lod.length);
 const terrains=mesh.geometries.filter(g=>g.kind==='terrain').map(g=>({id:g.id,linkedId:g.linkedId,guidCandidates:(guidMap.get(g.linkedId!)??[]).map(n=>({id:n.id,className:n.className}))}));
 levels.push({level,version:mesh.version,logicalSegments:mesh.logicalSegments,fullyPartitionedLod:true,records,terrains,skirtRecords:mesh.skirtCount,occluderRecords:mesh.geometries.filter(g=>g.kind==='occluder').length});
}
const records=levels.flatMap(l=>l.records),summary={levels:levels.length,versions,segments,bakeRecords:records.length,guidMatchedRecords:records.filter(r=>r.owners.length).length,nameAndGuidMatchedRecords:records.filter(r=>r.owners.some((o:any)=>o.resourceNameMatches)).length,unresolvedNameAndGuidRecords:unresolved.length,classesWithBakeOwners:Object.keys(classStats).filter(n=>classStats[n].bakeOwners>0),METR:{presentLevels:0,applicable:false,reason:'Supplied v51/v52 LOD0 is fully partitioned into five logical regions; no METR TOC tag or trailing bytes. Later-version reference-project METR definitions are not adopted as this executable evidence.'}};
fs.writeFileSync('docs/meshes-object-links.json',JSON.stringify({scope:'Read-only complete supplied-map data/reference association. Object references are not native call targets. GUID-only candidates remain distinct from exact resource-name/GUID matches; unresolved rows preserved. Skirt/occluder records have no serialized object GUID; no invented one-to-one owner mapping.',summary,classStats,unresolved,levels},null,2)+'\n');console.log(JSON.stringify(summary));
