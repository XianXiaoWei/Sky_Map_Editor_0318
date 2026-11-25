import fs from 'node:fs';import {ObjectsDocument} from '../src/core/objects';
for(const level of ['Rain','Night']){
 const doc=new ObjectsDocument(fs.readFileSync(`/root/sky-research/original-runtime-corpus/Levels/${level}/Objects.level.bin`));
 const show=(id:number,depth=0,seen=new Set<number>())=>{if(depth>4||seen.has(id))return;seen.add(id);const n=doc.nodes.find(n=>n.id===id);if(!n)return;console.log(' '.repeat(depth*2),id,n.className,JSON.stringify(n.fields.map(f=>({name:f.name,value:f.value,refs:f.children?.filter(c=>c.kind==='reference').map(c=>c.value)}))));if(depth<4)for(const f of n.fields){if(f.kind==='reference')show(Number(f.value),depth+1,seen);for(const c of f.children??[])if(c.kind==='reference')show(Number(c.value),depth+1,seen);}};
 console.log(level);for(const n of doc.nodes.filter(n=>n.className==='OnBlaze'))show(n.id);
 const n=doc.nodes.find(n=>n.className==='Blaze')!;show(n.id);
}
