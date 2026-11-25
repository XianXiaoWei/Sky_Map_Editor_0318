import fs from 'node:fs';import path from 'node:path';
import {ObjectsDocument,type ObjectNode} from '../src/core/objects';
import {transformPreviewCandidates} from '../src/core/transform-object-preview';
export interface TransformSequenceCase {level:string;id:number;nodes:ObjectNode[];deltas:number[];}
/** Complete serialized subgraphs of the five newly available real roots. */
export function transformSequenceCases(data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus'):TransformSequenceCase[]{
 const rows:TransformSequenceCase[]=[];
 for(const level of ['RainEnd','StormEnd']){
  const document=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels',level,'Objects.level.bin')));
  for(const candidate of transformPreviewCandidates(document.nodes).filter(c=>c.available&&c.events.length>1)){
   const ids=new Set<number>();
   const visit=(id:number)=>{if(id===0xffffffff||ids.has(id))return;ids.add(id);const node=document.nodes[id];if(!node)throw new Error('Missing serialized sequence node');
    const fields=node.className==='TransformObject'?node.fields.filter(f=>f.kind==='reference'):node.className==='Clump'?node.fields.flatMap(f=>f.children??[]):[];
    for(const f of fields)if(f.kind==='reference')visit(Number(f.value));
   };
   visit(candidate.id);const nodes=document.nodes.filter(n=>ids.has(n.id));
   const duration=candidate.events.reduce((total,id)=>{const f=document.nodes[id].fields.find(f=>f.name==='time')!,b=Buffer.from(f.raw,'hex');return total+Math.max(0,b.readFloatLE());},0);
   const steps=Math.max(16,Math.min(256,Math.ceil((duration*3+1)/.25)));
   rows.push({level,id:candidate.id,nodes,deltas:Array(steps).fill(.25)});
  }
 }
 return rows;
}
