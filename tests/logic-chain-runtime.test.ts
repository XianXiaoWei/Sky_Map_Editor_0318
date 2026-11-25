import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import zlib from 'node:zlib';
import {evaluateLogic,type LogicResult} from '../tools/logic-chain-evaluate';
import type {LogicCase} from '../tools/logic-chain-cases';
import {findNativeObjectMethod} from '../src/core/object-enabled-runtime';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/logic-chain-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:LogicCase;native:LogicResult}[]};
const row=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return r;};
const floatFrames=(name:string)=>row(name).native.frames.map(f=>Buffer.from(f.objectsHex,'hex').readFloatLE(16));
test('Multi-object creation/loading/reflection/logic/numeric/lifecycle replay matches original executable',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 for(const r of fixture.cases)assert.deepEqual(evaluateLogic(r.input),r.native,r.input.name);
});
test('Enable and IfEnabled change FloatAdd through shared Clumps and original scheduler',()=>{
 assert.deepEqual(floatFrames('ordering-false-0-1-false'),[0,1,2,3,4,5]);
 assert.deepEqual(floatFrames('ordering-false-0-1-true'),[0,1,2,3,4,5]);
 assert.deepEqual(floatFrames('nested-enable-ifenabled-add'),[0,1,2,3,4,5]);
 assert.deepEqual(floatFrames('enable-after-target-visited'),[0,0,1,2,3,4]);
});
test('killEvents cancels numeric execution and removes future persistent capture',()=>{
 assert.deepEqual(floatFrames('ordering-false-1-1-false'),[0,0,0,0,0,0]);
 assert.deepEqual(floatFrames('stop-after-target-update'),[0,1,1,1,1,1]);
});
test('Original assertions and unavailable real dependencies are distinct',()=>{
 assert.equal(row('clump-heap-assert-before-samecount').native.line,34);
 assert.equal(row('clump-pool-exhaustion').native.line,153);
 assert.equal(row('enable-null-member-assert').native.line,71);
 assert.equal(row('empty-array-loader-assert').native.line,1035);
 assert.equal(row('reflection-receiver-failure').native.line,1091);
 const boundaries=fixture.cases.filter(r=>r.native.line===0xfffffffe);assert.ok(boundaries.length>0);
 assert.ok(boundaries.every(r=>r.input.source&&r.native.severity===0&&r.native.services.at(-1)?.[0]===42));
});
test('Object GetEnabled normalizes nonzero Event bytes and defaults true for null/Clump',()=>{
 assert.ok(row('get-enabled-normalizes-raw-byte').native.services.some(e=>e[0]===32&&e[2]===2));
 assert.equal(row('get-enabled-normalizes-raw-byte').native.services.find(e=>e[0]===40)?.[2],1);
 assert.deepEqual(row('clump-null-get-default').native.services.filter(e=>e[0]===40).map(e=>e[2]),[1,1]);
});
test('Method lookup re-reads the parent getter and uses explicit cache service',()=>{
 const pointers=new Map<bigint,bigint>([[0x1050n,0x2000n],[0x2050n,0x3000n],[0x1030n,0x40n]]),calls:bigint[]=[];
 const memory={read64:(p:bigint)=>pointers.get(p)??0n,read32:()=>0,write64:()=>{},string:()=>new Uint8Array()};
 const method=findNativeObjectMethod(memory,0x1000n,new TextEncoder().encode('SetEnabled'),true,{callParentGetter:g=>{calls.push(g);pointers.set(0x1030n,0x41n);return 0x2000n;},cachedLookup:table=>table===0x3000n?0x5000n:0n});
 assert.equal(method,0x5000n);assert.deepEqual(calls,[0x40n,0x41n]);
});

test('Delay compares frame count before increment and dispatches staggered members at separate thresholds',()=>{
 assert.deepEqual(floatFrames('delay-frame-two'),[0,0,0,1,1,1]);
 assert.deepEqual(floatFrames('delay-1-1-2'),[0,0,0,1,1,2,2,2,2,2,2,2,2]);
 const counters=row('delay-1-1-2').native.frames.slice(1,6).map(f=>{
  const b=Buffer.from(f.objectsHex,'hex');return [b.readFloatLE(256+72),b.readUInt32LE(256+76)];
 });
 assert.deepEqual(counters,[[1,0],[2,0],[1,1],[2,1],[1,2]]);
});
test('Delay waits for a beat after its threshold and stops polling once finished',()=>{
 assert.deepEqual(floatFrames('delay-beat-gate'),[0,0,0,1,1]);
 assert.deepEqual(row('delay-beat-gate').native.services.filter(s=>s[0]===43).map(s=>s[2]),[0,0,1]);
 assert.equal(row('delay-frame-two').native.services.filter(s=>s[0]===43).length,0);
});
test('Delay enable and resume reset elapsed and member index while preserving prior outputs',()=>{
 assert.deepEqual(floatFrames('delay-disable-reenable-reset'),[0,0,0,0,0,0,1,1,2]);
 assert.deepEqual(floatFrames('delay-resume-resets-both-counters'),[0,0,0,1,1,1,2]);
 assert.deepEqual(floatFrames('delay-enable-nested-chain'),[0,0,1,1,1,1]);
});
test('Delay reads live GameTime and retains the original minimum time increment at zero scale',()=>{
 assert.deepEqual(floatFrames('delay-time-live-scale'),[0,0,0,1]);
 const elapsed=row('delay-time-live-scale').native.frames.slice(1).map(f=>Buffer.from(f.objectsHex,'hex').readFloatLE(256+72));
 assert.equal(elapsed[1],Math.fround(elapsed[0]+Math.fround(0.0001)));
 for(const override of [false,true])assert.deepEqual(floatFrames(`delay-time-0-${override}`),Array(9).fill(0));
});
test('Delay preserves null-member and staggered bounds assertions; empty bulk output finishes',()=>{
 assert.equal(row('delay-null-member-assert').native.line,71);
 assert.equal(row('delay-staggered-index-assert').native.line,54);
 assert.equal(row('delay-empty-staggered-assert').native.line,54);
 assert.equal(row('delay-zero-count-bulk-finishes').native.line,0);
});
test('Real Delay saved beat flags survive field loading, and the prepared absent default is false',()=>{
 const real=fixture.cases.filter(r=>r.input.source&&r.input.name.includes('-Delay-'));
 assert.equal(real.length,283);
 for(const r of real){
  const root=r.input.source!.nodes.indexOf(r.input.source!.root);
  const field=r.input.nodes[root].fields.find(f=>f.name==='waitForBeat');assert.ok(field);
  const table=Buffer.from(r.native.tableHex,'hex'),p=table.readBigUInt64LE(root*8)-0x240000000n-8n;
  assert.equal(Buffer.from(r.native.frames[0].objectsHex,'hex')[Number(p)+61],Buffer.from(field.raw,'hex')[0],r.input.name);
 }
 const bytes=Buffer.from(row('delay-placement-preserves-unsaved-bytes').native.frames[0].objectsHex,'hex');
 assert.equal(bytes[61],0);
 assert.equal(bytes[60],0xcd);assert.equal(bytes[62],0xcd);
 assert.equal(bytes.readUInt32LE(56),0);assert.equal(bytes.readBigUInt64LE(64),0n);
 assert.equal(bytes.readUInt32LE(72),0xcdcdcdcd);assert.equal(bytes.readUInt32LE(76),0xcdcdcdcd);
});

const valueAt=(name:string,frame:number,offset:number)=>Buffer.from(row(name).native.frames[frame].objectsHex,'hex').readFloatLE(offset);
test('FloatSplit drives segmented outputs and captures aliased input before writes',()=>{
 assert.deepEqual([valueAt('split-2-0.25',1,528),valueAt('split-2-0.25',1,784)],[0.5,0]);
 assert.deepEqual([valueAt('split-input-output-alias',1,16),valueAt('split-input-output-alias',1,528)],[1,0]);
 const b=Buffer.from(row('split-2-0.25').native.frames[1].objectsHex,'hex');assert.equal(b[256+35],1);
 assert.equal(row('split-empty-output-null-input').native.line,0);
 assert.equal(row('split-null-output-cast-assert').native.line,71);
 assert.equal(row('split-wrong-output-class-assert').native.line,71);
 assert.equal(row('split-count-reload-after-cast').native.line,54);
});
test('OnFloat ordered comparison and epsilon select distinguishable true and false outputs',()=>{
 for(const [name,expected] of [
  ['onfloat-0-1-0',-1],['onfloat-1-1-0',1],['onfloat-2-1-0',-1],['onfloat-3-1-0',1],
  ['onfloat-4-1-0',1],['onfloat-4-0.99995-0',1],['onfloat-4-0.9998-0',-1],
  ['onfloat-4-1.00005-0',1],['onfloat-4-1.0002-0',-1],['onfloat-9-1-0',-1],
 ] as const)assert.equal(valueAt(name,1,272),expected,name);
});
test('OnFloat Boolean modes and nested negation retain raw-byte semantics',()=>{
 assert.equal(valueAt('onfloat-1-1-0',1,272),1);
 assert.equal(valueAt('onfloat-1-1-1',1,272),-1);
 assert.equal(valueAt('onfloat-1-1-2',1,272),1);
 assert.equal(valueAt('onfloat-1-1-9',1,272),-1);
 assert.equal(valueAt('onfloat-nested-1-0',1,272),-1);
 assert.equal(valueAt('onfloat-nested-2-0',1,272),1);
});
test('OnFloat evaluates both nested conditions even in first-condition-only mode',()=>{
 const r=row('onfloat-both-nested-no-short-circuit');
 assert.equal(valueAt(r.input.name,1,272),1);
 assert.equal(r.native.services.filter(s=>s[0]===52).length,2);
 const table=Buffer.from(r.native.tableHex,'hex'),root=Number(table.readBigUInt64LE(16)-0x240000000n-8n);
 const initial=Buffer.from(r.native.frames[0].objectsHex,'hex');
 assert.equal(initial.readBigUInt64LE(root+144),table.readBigUInt64LE(24)-8n);
 assert.equal(initial.readBigUInt64LE(root+176),table.readBigUInt64LE(24)-8n);
});
test('OnFloat checkOnce finishes with null output while endOnTrigger waits for an output',()=>{
 assert.deepEqual(row('onfloat-false-output-null-stays-active').native.services.filter(s=>s[0]===40).map(s=>s[2]),[1]);
 assert.deepEqual(row('onfloat-checkonce-null-output-finishes').native.services.filter(s=>s[0]===40).map(s=>s[2]),[0]);
 assert.deepEqual(row('onfloat-live-threshold').native.frames.map(f=>Buffer.from(f.objectsHex,'hex').readFloatLE(528)),[0,1,0]);
});
test('OnFloat long debug strings allocate copies then release copies and the stored string',()=>{
 const r=row('onfloat-debug-string-96'),sizes=r.native.services.filter(s=>s[0]===46).map(s=>s[2]);
 assert.deepEqual(sizes,[112,112]);
 assert.equal(r.native.services.filter(s=>s[0]===47).length,2);
 assert.equal(row('onfloat-long-to-short-copy').native.services.filter(s=>s[0]===46).length,1);
 assert.equal(row('onfloat-copy-length-error').native.line,0xfffffffd);
 assert.equal(row('onfloat-copy-length-error').native.services.at(-1)?.[0],55);
});
test('FloatSplit and OnFloat placements retain unsaved fields and initialize only the original string descriptor',()=>{
 const split=Buffer.from(row('split-placement-unwritten-fields').native.frames[0].objectsHex,'hex');
 assert.equal(split.readBigUInt64LE(56),0xcdcdcdcdcdcdcdcdn);
 assert.equal(split.readBigUInt64LE(64),0xcdcdcdcdcdcdcdcdn);
 const on=Buffer.from(row('onfloat-placement-unwritten-fields').native.frames[0].objectsHex,'hex');
 assert.deepEqual(on.subarray(96,120),Buffer.alloc(24));
 assert.equal(on.readBigUInt64LE(56),0xcdcdcdcdcdcdcdcdn);
 assert.equal(on.readUInt32LE(120),0xcdcdcdcd);
});
test('Real FloatSplit/OnFloat inputs and their delayed numeric output chain retain native behavior',()=>{
 assert.equal(fixture.cases.filter(r=>r.input.source&&r.input.name.includes('-FloatSplit-')).length,2);
 assert.equal(fixture.cases.filter(r=>r.input.source&&r.input.name.includes('-OnFloat-')).length,94);
 assert.deepEqual(row('split-onfloat-delay-output-chain').native.frames.map(f=>Buffer.from(f.objectsHex,'hex').readFloatLE(528)),[0,0.5,1.5,0.5,0.5,0.5]);
});

const markerFrame=(name:string,frame:number)=>Buffer.from(row(name).native.frames[frame].markersHex,'hex');
test('Marker saved enabled bytes survive pool creation and reflected reads normalize only the result',()=>{
 for(const initial of [0,1,2,255])for(const on of [0,1]){
  const name=`marker-enable-${initial}-${on}`;
  assert.equal(markerFrame(name,0)[0xb0+64],initial);
  assert.equal(markerFrame(name,1)[0xb0+64],on);
  assert.deepEqual(row(name).native.services.filter(s=>s[0]===40).map(s=>s[2]),[Number(!!initial),on]);
 }
 assert.equal(markerFrame('marker-default-enabled',0)[0xb0+64],1);
});
test('Marker pool release reuses the first free slot without reusing the object ID',()=>{
 const b=markerFrame('marker-slot-release-reuse',1);
 assert.equal(b.readUInt32LE(0x18),2);assert.equal(b.readUInt32LE(0x30),3);
 assert.equal(b.readUInt32LE(0xb0+68),2);assert.equal(b.readUInt32LE(0xb0+80+68),1);
 assert.equal(b[0xb0+64],0);assert.equal(b[0xb0+80+64],0);
 const wrap=markerFrame('marker-pool-id-wrap',1);
 assert.equal(wrap.readUInt32LE(0xb0+80+68),0xffffffff);assert.equal(wrap.readUInt32LE(0xb0+160+68),0);
});
test('Marker allocation crosses bitmap words and Terminate preserves the next ID before reuse',()=>{
 const b=markerFrame('marker-pool-full-bitmap-word',1);
 assert.equal(b.readUInt32LE(0x30),0xffffffff);assert.equal(b.readUInt32LE(0x34),1);
 assert.equal(b.readUInt32LE(0x18),33);assert.equal(b.readUInt32LE(0xb0+32*80+68),32);
 const terminated=markerFrame('marker-terminate-retains-id',1);
 assert.equal(terminated.readUInt32LE(0x18),1);assert.equal(terminated.readUInt32LE(0xb0+68),2);
});
test('Marker placement preserves transform and enabled padding after ordinary construction',()=>{
 const b=markerFrame('marker-placement-retains-fields',1);
 assert.equal(b.readUInt32LE(0xb0+16),0x12345678);assert.equal(b.readUInt32LE(0xb0+64),0x11223302);
 assert.equal(b.readBigUInt64LE(0xb0),0x100cc6250n);
});
test('Marker ObjectPool and checkpoint resume retain separate original assertions',()=>{
 for(const [name,line,severity] of [
  ['marker-pool-capacity-assert',71,4],['marker-pool-real-capacity-assert',71,4],['marker-release-negative-assert',65,4],['marker-release-outside-assert',57,4],
  ['resume-null-member-assert',88,3],['resume-required-missing-method',103,4],['resume-receiver-cast-assert',1091,3],
 ] as const){assert.equal(row(name).native.line,line);assert.equal(row(name).native.severity,severity);}
});
test('OnFloat enables a saved-disabled Marker before IfEnabled starts the numeric output',()=>{
 const r=row('onfloat-enable-marker-ifenabled-add');
 assert.equal(markerFrame(r.input.name,0)[0xb0+64],0);assert.equal(markerFrame(r.input.name,1)[0xb0+64],1);
 assert.deepEqual(r.native.frames.map(f=>Buffer.from(f.objectsHex,'hex').readFloatLE(528)),[0,1,1,1,1,1]);
});
test('ResumeEnable calls nested Clump and Enable checkpoint methods and falls back for Marker',()=>{
 assert.equal(markerFrame('resume-marker-and-float-fallback',1)[0xb0+64],1);
 assert.equal(markerFrame('resume-nested-clump-enable-method',1)[0xb0+64],1);
 assert.equal(row('resume-nested-clump-enable-method').native.services.filter(s=>s[0]===52).length,2);
 const checkpoint=row('resume-enable-checkpoint-method');
 assert.ok(checkpoint.native.services.some(s=>s[0]===57&&s[2]===0x9000));
 assert.equal(checkpoint.native.services.filter(s=>s[0]===52).length,2);
 // The checkpoint method requests Enable itself; its saved enable=false and
 // killEvents=true are applied later by Update, so FloatAdd remains stopped.
 assert.deepEqual(floatFrames(checkpoint.input.name),[0,0,0,0,0,0]);
 assert.deepEqual(floatFrames('resume-delay-starts-from-zero'),[0,0,0,1,1,1]);
});
test('Real Marker fields remain byte exact and all five ResumeEnable roots enter the joint oracle',()=>{
 const markers=new Set<string>();
 for(const r of fixture.cases.filter(r=>r.input.source&&r.native.frames.length)){
  const table=Buffer.from(r.native.tableHex,'hex'),bytes=Buffer.from(r.native.frames[0].markersHex,'hex');
  r.input.nodes.forEach((node,i)=>{
   if(node.kind!=='Marker')return;
   const pointer=table.readBigUInt64LE(i*8),offset=Number(pointer-0x290000000n-8n);
   for(const field of node.fields){assert.equal(field.type,0);const raw=Buffer.from(field.raw,'hex');assert.deepEqual(bytes.subarray(offset+field.offset,offset+field.offset+raw.length),raw,`${r.input.name}.${field.name}`);}
   markers.add(`${r.input.source!.level}:${r.input.source!.nodes[i]}`);
  });
 }
 assert.equal(markers.size,273);
 assert.equal(fixture.cases.filter(r=>r.input.source&&r.input.name.includes('-ResumeEnable-')).length,5);
});
