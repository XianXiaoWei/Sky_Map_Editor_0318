import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import zlib from 'node:zlib';
import {TransformObjectPreview} from '../src/core/transform-object-preview';
import {conditionSet,conditionScalar} from '../tools/float-condition-map-preview-cases';
import type {ObjectLogicPreviewCase} from '../tools/object-logic-preview-cases';

interface Row extends ObjectLogicPreviewCase {initialStorageSha256:string;initialBarnSha256:string;frames:{storageSha256:string;barnSha256:string;heapCursor:number;math:number[][]}[];}
const fixture=()=>JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/float-condition-map-preview-native.json.gz')).toString()) as {executableSha256:string;cases:Row[]};
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
const prepared=(name:string)=>fixture().cases.find(c=>c.level==='prepared-condition-'+name)!;
function preview(row:Row){const p=new TransformObjectPreview({transform:()=>{}});p.configure(row.nodes);p.start(row.id);assert.equal(p.snapshot()!.error,null);return p;}

test('Unified playback matches native storage, Barn, cursor and all float32 math services for all accepted real/prepared graphs',()=>{
 const data=fixture();assert.equal(data.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.equal(data.cases.filter(c=>c.sourceSha256!==null).length,349);assert.equal(data.cases.filter(c=>c.sourceSha256===null).length,47);
 assert.equal(data.cases.filter(c=>c.kind==='OnFloat'&&c.sourceSha256!==null).length,3);assert.equal(data.cases.filter(c=>c.kind==='FloatSplit'&&c.sourceSha256!==null).length,2);
 for(const row of data.cases){
  let pairs:number[][]=[],at=0;
  const replay=(op:'cos'|'acos'|'sin'|'logf'|'expf',x:number)=>{const pair=pairs[at++],b=Buffer.alloc(4);b.writeFloatLE(x);assert.ok(pair);assert.equal(pair[0],{cos:20,acos:21,sin:22,logf:30,expf:31}[op]);assert.equal(pair[1],b.readUInt32LE());b.writeUInt32LE(pair[2]);return b.readFloatLE();};
  const p=new TransformObjectPreview({transform:()=>{},math:replay,numericMath:replay});p.configure(row.nodes);p.start(row.id,false);
  let s=p.captureOriginalState();assert.equal(hash(s.storage),row.initialStorageSha256);assert.equal(hash(s.barn),row.initialBarnSha256);
  row.frames.forEach((frame,i)=>{pairs=frame.math;at=0;p.step(row.deltas[i]);assert.equal(p.snapshot()!.error,null);assert.equal(at,pairs.length);s=p.captureOriginalState();assert.equal(s.heapCursor,frame.heapCursor);assert.equal(hash(s.storage),frame.storageSha256,`${row.level} #${row.id} frame ${i}`);assert.equal(hash(s.barn),frame.barnSha256);});
 }
});

test('Shared Float reaches threshold, hands off once through Delay, then moves the saved platform; Pause/Reset retain original nodes',()=>{
 const row=prepared('DayHubCave-platform'),saved=JSON.stringify(row.nodes),p=preview(row),initial=p.snapshot()!;
 assert.equal(initial.events.find(e=>e.id===270)!.starts,0);
 let waited=false,moved=false;for(let i=0;i<100;i++){
  p.step(.1);const s=p.snapshot()!,condition=s.events.find(e=>e.id===229)!,delay=s.events.find(e=>e.id===65)!,transform=s.events.find(e=>e.id===270)!;
  assert.equal(s.error,null);
  if(condition.running){assert.equal(transform.starts,0);assert.deepEqual(s.objects,initial.objects);}
  if(delay.running&&transform.starts===0){waited=true;assert.ok(s.values.find(v=>v.id===874)!.value>=Math.fround(.35));assert.deepEqual(s.objects,initial.objects);}
  if(transform.starts>0){assert.ok(delay.elapsed>=.5);assert.equal(condition.running,false);assert.equal(condition.starts,1);moved ||=JSON.stringify(s.objects)!==JSON.stringify(initial.objects);}
 }
 assert.ok(waited);assert.ok(moved);p.togglePause();const frozen=p.captureOriginalState();p.step(5);assert.deepEqual(p.captureOriginalState(),frozen);p.togglePause();p.step(.1);assert.notDeepEqual(p.captureOriginalState(),frozen);
 p.reset();assert.equal(p.snapshot(),null);p.start(row.id);assert.deepEqual(p.snapshot()!.values,initial.values);assert.deepEqual(p.snapshot()!.objects,initial.objects);assert.equal(JSON.stringify(row.nodes),saved);
});

test('OnFloat uses strict float32 epsilon, unsigned enums and independent checkOnce/endOnTrigger completion',()=>{
 for(const [name,trigger] of [['greater',true],['equal-inclusive',true],['less',true],['less-inclusive',true],['epsilon-inside',true],['epsilon-outside',false],['unknown-operator',false],['float-rhs',true]] as const){
  const s=preview(prepared(name)).snapshot()!;assert.equal(s.events.some(e=>e.id===65&&e.pending),trigger,name);assert.equal(s.events.find(e=>e.id===229)!.running,false);
 }
 assert.equal(preview(prepared('null-check-once')).snapshot()!.running,false);
 assert.equal(preview(prepared('null-end-on-trigger')).snapshot()!.running,true);
 const name=prepared('short-name'),p=preview(name),state=p.captureOriginalState();assert.equal(state.storage[96],24);assert.equal(Buffer.from(state.storage.subarray(97,109)).toString(),'条件地图');
});

test('Nested OnFloat uses body pointers, raw inversion bytes, AND/OR and shared evaluation without a synthetic Event dispatch',()=>{
 for(const [name,trigger] of [['nested-invert-zero',true],['nested-invert-one',false],['nested-invert-two',true],['nested-second-or',true],['nested-second-and',false],['shared-nested',true],['both-nested-null-value',true],['unknown-boolean',false]] as const){
  const s=preview(prepared(name)).snapshot()!;assert.equal(s.events.some(e=>e.id===65&&e.pending),trigger,name);const nested=s.events.find(e=>e.id===287);if(nested)assert.equal(nested.starts,0);
 }
 assert.equal(preview(prepared('event-handoff-cycle')).snapshot()!.error,null);
});

test('FloatSplit captures input before ordered writes, preserves aliases, clamps partitions and finishes empty outputs without input',()=>{
 const s=preview(prepared('split-partition')).snapshot()!,row=prepared('split-partition'),split=row.nodes.find(n=>n.id===720)!,group=Number(split.fields.find(f=>f.name==='outputs')!.value),ids=row.nodes.find(n=>n.id===group)!.fields.find(f=>f.name==='data')!.children!.map(f=>Number(f.value));
 const values=ids.map(id=>s.values.find(v=>v.id===id)!.value);assert.equal(values[0],1);assert.ok(Math.abs(values[1]-.8)<.000001);assert.equal(values[2],0);assert.equal(s.running,true);
 const alias=preview(prepared('split-input-output-alias')).snapshot()!;assert.equal(alias.values.find(v=>v.id===312)!.value,1);assert.equal(alias.values.find(v=>v.id===ids[1])!.bits,s.values.find(v=>v.id===ids[1])!.bits);
 const duplicate=preview(prepared('split-duplicate-output-alias')).snapshot()!;assert.ok(Math.abs(duplicate.values.find(v=>v.id===ids[0])!.value-.8)<.000001);
 for(const [name,value] of [['clamp-negative',0],['clamp-high',1]] as const){const state=preview(prepared('split-'+name)).snapshot()!;for(const id of ids)assert.equal(state.values.find(v=>v.id===id)!.value,value);}
 const empty=preview(prepared('split-empty-no-input')).snapshot()!;assert.equal(empty.running,false);assert.equal(empty.values.length,0);
});

test('Both nested edges are preflighted before writes; cycles, long/debug names and unsupported branches/output members remain explicit boundaries',()=>{
 const row=prepared('DayHubCave-platform');let writes=0;const p=new TransformObjectPreview({transform:()=>writes++,enabled:()=>writes++});
 const check=(mutate:(nodes:Row['nodes'])=>void,pattern:RegExp)=>{const nodes=structuredClone(row.nodes);mutate(nodes);p.configure(nodes);assert.throws(()=>p.start(row.id),pattern);assert.equal(writes,0);};
 check(nodes=>conditionSet(nodes.find(n=>n.id===229)!,'conditionTwoOnFloat',229),/同步条件求值循环/);
 check(nodes=>{const n=nodes.find(n=>n.id===229)!;n.fields.find(f=>f.name==='debugName')!.value='x'.repeat(23);},/长字符串池/);
 check(nodes=>conditionSet(nodes.find(n=>n.id===229)!,'debug',1),/调试输出/);
 check(nodes=>{const n=nodes.find(n=>n.id===65)!;n.className='PlaySound';},/PlaySound 尚未接入/);
 check(nodes=>{const n=nodes.find(n=>n.id===229)!;n.fields=n.fields.filter(f=>f.name!=='conditionTwoOperator');},/conditionTwoOperator 默认字段/);
 const split=structuredClone(prepared('split-partition'));split.nodes.find(n=>n.className==='Float'&&n.id!==312)!.className='FloatDistanceFade';p.configure(split.nodes);assert.throws(()=>p.start(split.id),/Float 接口尚未接入/);assert.equal(writes,0);
 const nullSplit=structuredClone(prepared('split-partition'));conditionSet(nullSplit.nodes.find(n=>n.id===720)!,'outputs',0xffffffff);p.configure(nullSplit.nodes);assert.throws(()=>p.start(720),/outputs Clump 为空/);assert.equal(writes,0);
 // Enum 0xffffffff is valid raw data; nonfinite scalar bytes are not.
 const bad=structuredClone(row.nodes);conditionScalar(bad.find(n=>n.id===229)!,'conditionTwoValue',NaN);p.configure(bad);assert.throws(()=>p.start(row.id),/不是有限数值/);assert.equal(writes,0);
});
