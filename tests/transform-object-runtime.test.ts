import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';
import {evaluateTransformObject,type TransformResult} from '../tools/transform-object-evaluate';
import {transformCaseMemory,floatBits,type TransformCase} from '../tools/transform-object-cases';
import {constructOriginalTransformObject} from '../src/core/transform-object-runtime';
interface Expected {line:number;severity:number;services:number[][];snapshots:string[];final:string;}
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/transform-object-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:TransformCase;native:Expected}[]};
const row=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return r;};
const run=(name:string)=>{const r=row(name);return evaluateTransformObject(r.input,r.native.services);};
const hash=(b:Buffer)=>crypto.createHash('sha256').update(b).digest('hex');
const compact=(r:TransformResult):Expected=>({...r,snapshots:r.snapshots.map(hash),final:hash(r.final)});
test('TransformObject finite updates and explicit dependency prefixes match original full-memory snapshots',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.equal(fixture.cases.filter(r=>r.input.source).length,317);
 assert.equal(fixture.cases.filter(r=>r.input.source&&r.native.line===0).length,91);
 for(const r of fixture.cases)assert.deepEqual(compact(evaluateTransformObject(r.input,r.native.services)),r.native,r.input.name);
});
test('TransformObject placement preserves undefined storage and writes only the original constructor fields',()=>{
 const input=row('placement-true').input,b=transformCaseMemory(input),before=Buffer.from(b);
 constructOriginalTransformObject(b,14,{eventClassId:7,eventVptr:0x100c14ea0n});
 assert.equal(b.readBigUInt64LE(),0x100c253f0n);assert.equal(b.readUInt32LE(8),14);assert.equal(b.readBigUInt64LE(56),0n);assert.equal(b.readBigUInt64LE(72),0n);assert.equal(b.readBigUInt64LE(168),0n);
 for(const at of [16,32,64,80,88,96,104,108,117,120,122,152,156,160,164,176,184,200,208,211])assert.equal(b[at],before[at],`retained +${at}`);
});
test('Original Event dispatch loads and captures initial/target matrices, then skips its first update',()=>{
 const r=run('flags-0-0-0-7'),first=r.snapshots[2];assert.equal(first[32],1);assert.equal(first[35],1);assert.equal(first[209],1);assert.equal(first.readFloatLE(164),0);assert.equal(first.readFloatLE(156),0);
 assert.equal(first.readBigUInt64LE(168),0x240004000n);assert.equal(first.readBigUInt64LE(176),0x240004040n);
 assert.deepEqual([first.readFloatLE(0x1060),first.readFloatLE(0x1064),first.readFloatLE(0x1068)],[0,2,3]);
 const next=r.snapshots[3];assert.equal(next.readFloatLE(156),.25);assert.deepEqual([next.readFloatLE(0x1060),next.readFloatLE(0x1064),next.readFloatLE(0x1068)],[2.5,6.5,1.5]);
});
test('Completion requests finish events before self-stop and keeps the original sequence/state bytes',()=>{
 const done=run('flags-0-0-0-7').snapshots[6];assert.equal(done.readFloatLE(156),0);assert.equal(done[35],0);assert.equal(done[210],1);assert.equal(done.readFloatLE(160),1);
 assert.equal(done.readUInt16LE(0x10a0+33),1);assert.equal(done.readUInt32LE(0x10a0+16),1);assert.equal(done.readUInt32LE(16),2);assert.equal(done.readUInt32LE(65536),3);
});
test('Smooth reverse reaches exact zero instead of introducing an epsilon-sized residual',()=>{
 const done=run('flags-0-1-1-7').snapshots[6];assert.equal(done.readUInt32LE(0x1060),0);assert.equal(done.readFloatLE(0x1064),2);assert.equal(done.readFloatLE(0x1068),3);
});
test('Continuous scale uses the original per-update difference without the position time factor',()=>{
 const next=run('flags-1-0-0-5').snapshots[3];assert.deepEqual([next.readFloatLE(0x1080),next.readFloatLE(0x1084),next.readFloatLE(0x1088)],[2,3,4]);assert.equal(next.readFloatLE(0x1060),2.5);
 assert.equal(run('flags-1-0-0-5').final[35],1);
});
test('Captured-target mode retains OnStart target while live-target mode observes later edits',()=>{
 const captured=run('captured-target').snapshots[6],live=run('live-target').snapshots[6];assert.ok(live.readFloatLE(0x1060)>captured.readFloatLE(0x1060));assert.equal(captured.readFloatLE(0x4040+56),-3);
});
test('Resume and twoPhase autoStart reproduce original pending requests and saved time bits',()=>{
 const r=run('resume-completes-normal');assert.ok(r.services.some(s=>s[0]===9&&s[2]===1));assert.equal(r.snapshots[5].readUInt32LE(156),floatBits(2));
 assert.equal(run('resume-two-phase-1').snapshots[4][125],0);assert.equal(run('resume-two-phase-0').snapshots[4][125],1);
});
test('GameTime clamps and prepared Timeline node lookup follow original timing and assertions',()=>{
 assert.equal(run('time-0-1-undefined').snapshots[3].readUInt32LE(156),floatBits(.0001));assert.equal(run('time-2-1-undefined').snapshots[3].readUInt32LE(156),floatBits(.266));
 assert.equal(run('timeline-true').snapshots[3].readFloatLE(156),.5);assert.equal(run('timeline-false').line,153);
 for(const [name,line] of [['missing-target',49],['target-count-mismatch',50],['negative-stagger',74],['null-object-member',71]] as const)assert.equal(run(name).line,line);
});
test('Unknown target classes and unavailable audio/stepped/real Timeline remain explicit boundaries',()=>{
 for(const name of ['unsupported-sound-prefix','stepped-prefix']){const r=run(name);assert.equal(r.line,0xfffffffd);assert.equal(r.snapshots.length,3);}
 const unknown=fixture.cases.find(r=>r.input.source&&r.native.line===0xfffffffe);assert.ok(unknown);assert.ok(unknown.native.services.some(s=>s[0]===60));assert.ok(unknown.input.nodes.some(n=>!['Marker','Enable'].includes(n.kind)));
 assert.equal(fixture.cases.filter(r=>r.input.source&&r.native.line===0xfffffffe).length,198);
});
test('Long-string destruction invokes the explicit pool service and does not free load-owned matrices',()=>{
 const r=run('destructor-long');assert.deepEqual(r.services,[[23,0,0],[8,0,0xe000]]);assert.equal(r.final.readBigUInt64LE(),0x100c253f0n);assert.equal(run('destructor-short').services.length,0);
});
