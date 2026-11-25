import fs from 'node:fs/promises';
import assert from 'node:assert/strict';
import {createRequire} from 'node:module';
const require=createRequire(import.meta.url),before=require('/root/sky-research/spirv-before-final.cjs').packSpirvUniforms,after=require('/root/sky-research/spirv-after-final.cjs').packSpirvUniforms;
const value=t=>t.kind==='struct'?Object.fromEntries(t.members.map(m=>[m.name,value(m.type)])):t.kind==='matrix'?Float32Array.from({length:t.count*t.element.count},(_,i)=>(i+1)*.125):t.kind==='vector'||t.kind==='array'?Array.from({length:t.count},()=>value(t.element)):t.kind==='bool'?true:t.kind==='float'?.125:1;
const fixtures=[];
for(const key of await fs.readdir('dist/vulkan-shaders'))if(/^[a-f0-9]{64}$/.test(key)){const manifest=JSON.parse(await fs.readFile('dist/vulkan-shaders/'+key+'/manifest.json','utf8'));for(const d of manifest.descriptors??[])if(d.kind==='uniform-buffer')fixtures.push({block:d.type,values:value(d.type)});}
assert.ok(fixtures.length>50);for(const {block,values} of fixtures)assert.deepEqual(after(block,values),before(block,values));
const measure=fn=>{const start=performance.now();let checksum=0;for(let i=0;i<16000;i++){const f=fixtures[i%fixtures.length];checksum+=fn(f.block,f.values)[0];}return {ms:performance.now()-start,checksum};};
measure(before);measure(after);const results=[];for(let i=0;i<5;i++){const b=measure(before),a=measure(after);assert.equal(a.checksum,b.checksum);results.push({beforeMs:b.ms,afterMs:a.ms,speedup:b.ms/a.ms});}
const sorted=key=>results.map(r=>r[key]).sort((a,b)=>a-b)[2],report={passed:true,fixtures:fixtures.length,iterationsPerRound:16000,beforeMs:sorted('beforeMs'),afterMs:sorted('afterMs'),speedup:sorted('speedup'),results,scope:'Same-process CommonJS packing of all bundled original uniform layouts, exact byte equality, same values and validation. CPU uniform packing only; not map FPS.'};await fs.writeFile('docs/uniform-packing-performance.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));
