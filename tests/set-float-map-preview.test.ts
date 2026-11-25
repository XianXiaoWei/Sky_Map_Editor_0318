import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import zlib from 'node:zlib';
import {TransformObjectPreview} from '../src/core/transform-object-preview';
import type {ObjectLogicPreviewCase} from '../tools/object-logic-preview-cases';

interface Row extends ObjectLogicPreviewCase {
 initialStorageSha256:string;initialBarnSha256:string;
 frames:{storageSha256:string;barnSha256:string;heapCursor:number;math:number[][]}[];
}
const fixture=()=>JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/set-float-map-preview-native.json.gz')).toString()) as {executableSha256:string;cases:Row[]};
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');

test('All four saved SetFloat roots, five prepared controllers and both single-pulse modes match original memory and math inputs',()=>{
 const data=fixture(),rows=data.cases.filter(c=>c.kind==='SetFloat'||c.level.startsWith('prepared-set-float-')||c.level.startsWith('prepared-single-pulse-'));
 assert.equal(data.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.equal(rows.filter(c=>c.sourceSha256!==null).length,4);assert.equal(rows.filter(c=>c.sourceSha256===null).length,7);
 for(const row of rows){
  let pairs:number[][]=[],at=0;
  const replay=(op:'cos'|'acos'|'sin'|'logf'|'expf',x:number)=>{
   const pair=pairs[at++],b=Buffer.alloc(4);b.writeFloatLE(x);assert.ok(pair);
   assert.equal(pair[0],{cos:20,acos:21,sin:22,logf:30,expf:31}[op]);assert.equal(pair[1],b.readUInt32LE());
   b.writeUInt32LE(pair[2]);return b.readFloatLE();
  };
  const p=new TransformObjectPreview({transform:()=>{},math:replay,numericMath:replay});p.configure(row.nodes);p.start(row.id,false);
  let s=p.captureOriginalState();assert.equal(hash(s.storage),row.initialStorageSha256);assert.equal(hash(s.barn),row.initialBarnSha256);
  row.frames.forEach((frame,i)=>{
   pairs=frame.math;at=0;p.step(row.deltas[i]);assert.equal(p.snapshot()!.error,null);assert.equal(at,pairs.length);
   s=p.captureOriginalState();assert.equal(s.heapCursor,frame.heapCursor);
   assert.equal(hash(s.storage),frame.storageSha256,`${row.level} #${row.id} frame ${i}`);assert.equal(hash(s.barn),frame.barnSha256);
  });
  if(row.kind==='SetFloat'){assert.equal(p.snapshot()!.running,false);assert.equal(p.snapshot()!.progress,1);}
 }
});

test('SetFloat changes a shared TransformObject controller, freezes with Pause and restores saved values and matrices',()=>{
 const row=fixture().cases.find(c=>c.level==='prepared-set-float-transform-2-1')!,saved=JSON.stringify(row.nodes);
 const matrices:string[]=[],p=new TransformObjectPreview({transform:(_id,m)=>matrices.push(hash(m))});p.configure(row.nodes);p.start(row.id);
 for(let i=0;i<5;i++)p.step(.25);
 const active=p.snapshot()!;assert.equal(active.error,null);assert.ok(active.events.find(e=>e.kind==='SetFloat')!.running);
 assert.ok(active.values.some(v=>v.value>0&&v.value<1));assert.ok(new Set(matrices).size>1);
 p.togglePause();const frozen=p.captureOriginalState();p.step(3);assert.deepEqual(p.captureOriginalState(),frozen);
 p.togglePause();p.step(.25);assert.notDeepEqual(p.captureOriginalState(),frozen);
 p.reset();assert.equal(p.snapshot(),null);p.start(row.id);assert.ok(p.snapshot()!.values.every(v=>v.value===0));
 assert.equal(JSON.stringify(row.nodes),saved);
});

test('SetFloat preserves native zero snappiness, immediate endpoint and duration overshoot behavior',()=>{
 for(const [name,snappiness] of [['prepared-set-float-transform-0-1',0],['prepared-set-float-transform-30-1',30],['prepared-set-float-transform-3-2',3]] as const){
  const row=fixture().cases.find(c=>c.level===name)!,p=new TransformObjectPreview({transform:()=>{}});p.configure(row.nodes);p.start(row.id);
  let overshot=false;for(let i=0;i<24;i++){p.step(.25);assert.equal(p.snapshot()!.error,null);overshot ||=p.snapshot()!.values.some(v=>v.value>1);}
  const s=p.snapshot()!,controller=s.events.find(e=>e.kind==='SetFloat')!;
  if(snappiness===0){assert.ok(controller.running);assert.ok(s.values.every(v=>v.value===0));}
  else {assert.equal(controller.running,false);assert.ok(s.values.some(v=>v.value===1));}
  if(snappiness===3)assert.ok(overshot);
 }
});

test('Missing SetFloat scalars and unsupported target classes block before scene writes',()=>{
 const row=fixture().cases.find(c=>c.kind==='SetFloat'&&c.sourceSha256!==null)!;let writes=0;
 const p=new TransformObjectPreview({transform:()=>writes++,enabled:()=>writes++});
 const missing=structuredClone(row.nodes);missing.find(n=>n.id===row.id)!.fields=missing.find(n=>n.id===row.id)!.fields.filter(f=>f.name!=='snappiness');
 p.configure(missing);assert.throws(()=>p.start(row.id),/snappiness 默认字段/);assert.equal(writes,0);
 const invalid=structuredClone(row.nodes);invalid.find(n=>n.className==='Float')!.className='FloatDistanceFade';
 p.configure(invalid);assert.throws(()=>p.start(row.id),/Float 接口尚未接入/);assert.equal(writes,0);
});
