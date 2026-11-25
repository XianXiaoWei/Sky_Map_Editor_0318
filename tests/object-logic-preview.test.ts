import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import zlib from 'node:zlib';
import {TransformObjectPreview} from '../src/core/transform-object-preview';import {objectPlaybackCandidates} from '../src/core/object-playback-plan';import type {ObjectNode} from '../src/core/objects';
interface Row {level:string;id:number;kind:string;nodes:ObjectNode[];deltas:number[];sourceSha256:string|null;initialStorageSha256:string;initialBarnSha256:string;frames:{storageSha256:string;barnSha256:string;heapCursor:number;math:number[][]}[];}
const fixture=()=>JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/object-logic-preview-native.json.gz')).toString()) as {executableSha256:string;cases:Row[]};
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
test('Real and prepared mixed object groups match original first dispatch, every byte and every allocator cursor',()=>{
 const data=fixture();assert.equal(data.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.ok(data.cases.filter(c=>c.sourceSha256!==null).length>=293);assert.equal(data.cases.filter(c=>c.level.startsWith('prepared-mixed-')).length,8);
 for(const row of data.cases){
  let pairs:number[][]=[],at=0;const preview=new TransformObjectPreview({transform:()=>{},math:(op,x)=>{const p=pairs[at++],b=Buffer.alloc(4);b.writeFloatLE(x);assert.ok(p);assert.equal(p[0],{cos:20,acos:21,sin:22}[op]);assert.equal(p[1],b.readUInt32LE());b.writeUInt32LE(p[2]);return b.readFloatLE();}});
  preview.configure(row.nodes);preview.start(row.id,false);let state=preview.captureOriginalState();assert.equal(hash(state.storage),row.initialStorageSha256);assert.equal(hash(state.barn),row.initialBarnSha256);
  row.frames.forEach((frame,i)=>{pairs=frame.math;at=0;preview.step(row.deltas[i]);assert.equal(preview.snapshot()!.error,null);assert.equal(at,pairs.length);state=preview.captureOriginalState();assert.equal(state.heapCursor,frame.heapCursor);assert.equal(hash(state.storage),frame.storageSha256,`${row.level} #${row.id} frame ${i}`);assert.equal(hash(state.barn),frame.barnSha256);});
 }
});
test('Delay holds its outputs, pauses all effects, and reset restores visibility and matrices without editing saved nodes',()=>{
 const row=fixture().cases.find(c=>c.level==='prepared-mixed-0-1-1')!,before=JSON.stringify(row.nodes),matrices=new Map<number,string>(),flags=new Map<number,boolean>(),preview=new TransformObjectPreview({transform:(id,m)=>matrices.set(id,hash(m)),enabled:(id,on)=>flags.set(id,on)});
 preview.configure(row.nodes);preview.start(row.id);const originalMatrices=new Map(matrices),originalFlags=new Map(flags);assert.equal(flags.get(10005),true);
 preview.step(.25);assert.equal(flags.get(10005),true);preview.step(.25);assert.ok(preview.snapshot()!.events.find(e=>e.id===10031)!.pending);preview.step(.25);assert.equal(flags.get(10005),false);
 preview.togglePause();const paused=preview.snapshot(),state=preview.captureOriginalState();preview.step(2);preview.update(1000,false);preview.update(3000,false);assert.deepEqual(preview.snapshot(),paused);assert.deepEqual(preview.captureOriginalState(),state);
 preview.reset();assert.deepEqual(flags,originalFlags);assert.deepEqual(matrices,originalMatrices);assert.equal(preview.snapshot(),null);preview.start(row.id);preview.configure([]);assert.deepEqual(flags,originalFlags);assert.deepEqual(matrices,originalMatrices);assert.equal(JSON.stringify(row.nodes),before);
});
test('IfEnabled keeps the original missing Clump getter default even when every member is disabled',()=>{
 const row=fixture().cases.find(c=>c.sourceSha256===null)!,nodes=structuredClone(row.nodes),mesh=nodes.find(n=>n.id===10005)!;mesh.fields.find(f=>f.name==='enabled')!.value=0;mesh.fields.find(f=>f.name==='enabled')!.raw='00';
 const preview=new TransformObjectPreview({transform:()=>{}});preview.configure(nodes);assert.equal(preview.list().find(c=>c.id===40002)!.available,true);preview.start(40002);preview.step(.25);
 const state=preview.snapshot()!;assert.equal(state.error,null);assert.ok(state.events.find(e=>e.id===156)!.starts>0);assert.equal(state.events.find(e=>e.id===40002)!.running,false);
});
test('Missing beat service and synchronous group recursion block before any scene changes',()=>{
 const row=fixture().cases.find(c=>c.sourceSha256===null)!,nodes=structuredClone(row.nodes),root=nodes.find(n=>n.id===40001)!;let writes=0;
 const preview=new TransformObjectPreview({transform:()=>writes++,enabled:()=>writes++});root.fields.find(f=>f.name==='waitForBeat')!.value=1;root.fields.find(f=>f.name==='waitForBeat')!.raw='01';preview.configure(nodes);assert.throws(()=>preview.start(root.id),/beat/);assert.equal(writes,0);
 root.fields.find(f=>f.name==='waitForBeat')!.value=0;root.fields.find(f=>f.name==='waitForBeat')!.raw='00';const group=nodes.find(n=>n.id===40012)!.fields.find(f=>f.name==='data')!;group.children=group.children!.slice(0,1);group.value=1;group.children[0].value=40012;group.children[0].raw='4c9c0000';
 assert.match(objectPlaybackCandidates(nodes).find(c=>c.id===40001)!.reason,/同步启用循环/);preview.configure(nodes);assert.throws(()=>preview.start(root.id),/同步启用循环/);assert.equal(writes,0);
});
