import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import zlib from 'node:zlib';
import {TransformObjectPreview,transformPreviewCandidates} from '../src/core/transform-object-preview';import type {ObjectNode} from '../src/core/objects';
interface Row {level:string;id:number;nodes:ObjectNode[];deltas:number[];initialStorageSha256:string;initialBarnSha256:string;frames:{storageSha256:string;barnSha256:string;math:number[][]}[];}
const fixture=()=>JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/transform-sequence-native.json.gz')).toString()) as {executableSha256:string;cases:Row[]};
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
test('Real completion chains and cycles match whole original EventBarn/TransformObject snapshots on every frame',()=>{
 const data=fixture();assert.equal(data.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(data.cases.length,5);
 for(const row of data.cases){
  let pairs:number[][]|undefined,at=0;const preview=new TransformObjectPreview({transform:()=>{},math:(op,x)=>{
   if(!pairs)return Math.fround(op==='acos'?Math.acos(x):op==='cos'?Math.cos(x):Math.sin(x));
   const pair=pairs[at++],b=Buffer.alloc(4);b.writeFloatLE(x);assert.ok(pair);assert.equal(pair[0],{cos:20,acos:21,sin:22}[op]);assert.equal(pair[1],b.readUInt32LE());b.writeUInt32LE(pair[2]);return b.readFloatLE();
  }});preview.configure(row.nodes);preview.start(row.id);
  const initial=preview.captureOriginalState();assert.equal(hash(initial.storage),row.initialStorageSha256);assert.equal(hash(initial.barn),row.initialBarnSha256);
  row.frames.forEach((frame,i)=>{pairs=frame.math;at=0;preview.step(row.deltas[i]);assert.equal(preview.snapshot()!.error,null);assert.equal(at,pairs.length);const state=preview.captureOriginalState();assert.equal(hash(state.storage),frame.storageSha256,`${row.level} #${row.id} frame ${i}`);assert.equal(hash(state.barn),frame.barnSha256);});
 }
});
test('A real cyclic chain hands off, returns, freezes and restores every affected object without changing serialized data',()=>{
 const row=fixture().cases.find(r=>r.level==='StormEnd'&&r.id===433)!,before=JSON.stringify(row.nodes),drawn=new Map<number,string>(),preview=new TransformObjectPreview({transform:(id,m)=>drawn.set(id,hash(m))});
 preview.configure(row.nodes);preview.start(row.id);const initial=new Map(drawn);
 for(let i=0;i<row.deltas.length;i++)preview.step(.25);
 assert.deepEqual(preview.snapshot()!.events.filter(e=>e.starts>=2).map(e=>e.id),[433,512]);assert.equal(preview.snapshot()!.running,true);assert.notDeepEqual(drawn,initial);
 preview.togglePause();const paused=preview.snapshot(),state=preview.captureOriginalState();preview.step(2);preview.update(1000,false);preview.update(3000,false);assert.deepEqual(preview.snapshot(),paused);assert.deepEqual(preview.captureOriginalState(),state);
 preview.reset();assert.deepEqual(drawn,initial);assert.equal(preview.snapshot(),null);preview.start(row.id);assert.deepEqual(drawn,initial);preview.configure([]);assert.deepEqual(drawn,initial);assert.equal(JSON.stringify(row.nodes),before);
});
test('Unsupported targets anywhere in a real completion cycle block the entire chain before any scene writes',()=>{
 const row=fixture().cases.find(r=>r.id===433)!,nodes=structuredClone(row.nodes),peer=nodes.find(n=>n.id===512)!;
 peer.fields.find(f=>f.name==='playDragSound')!.value=1;peer.fields.find(f=>f.name==='playDragSound')!.raw='01';
 assert.equal(transformPreviewCandidates(nodes).find(c=>c.id===433)!.available,false);let writes=0;
 const preview=new TransformObjectPreview({transform:()=>writes++});preview.configure(nodes);assert.throws(()=>preview.start(433),/音效/);assert.equal(writes,0);
 peer.fields.find(f=>f.name==='playDragSound')!.value=0;peer.fields.find(f=>f.name==='playDragSound')!.raw='00';peer.className='Timeline';
 assert.match(transformPreviewCandidates(nodes).find(c=>c.id===433)!.reason,/完成事件 Timeline/);
});
