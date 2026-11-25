import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';
import {evaluateResourceRef,type ResourceRefResult} from '../tools/resource-ref-evaluate';import type {ResourceRefCase} from '../tools/resource-ref-cases';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/resource-ref-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:ResourceRefCase;native:ResourceRefResult}[]};
const row=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return r;};const run=(name:string)=>evaluateResourceRef(row(name).input);const last=(name:string)=>Buffer.from(run(name).snapshots.at(-1)!,'hex');
test('ResourceRef constructor/Observe/destructor/cleanup match all 109 native sequences and 2075 full state snapshots',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.length,109);assert.equal(fixture.cases.reduce((n,r)=>n+r.native.snapshots.length,0),2075);
 for(const r of fixture.cases){const actual=evaluateResourceRef(r.input);assert.deepEqual({...actual,snapshots:actual.snapshots.map(hex=>crypto.createHash('sha256').update(Buffer.from(hex,'hex')).digest('hex'))},r.native,r.input.name);}
});
test('Constructor clears 25 bytes and retains allocation padding; normal cleanup retains the observed byte',()=>{
 const constructed=last('constructor-padding');assert.deepEqual(constructed.subarray(0x800,0x819),Buffer.alloc(25));assert.deepEqual(constructed.subarray(0x819,0x820),Buffer.alloc(7,0xa5));const removed=last('reobserve-1-0-0');assert.deepEqual(removed.subarray(0x800,0x818),Buffer.alloc(24));assert.equal(removed[0x818],1);assert.equal(last('detached-retained-observed-byte')[0x818],1);
});
test('Re-observing the same resource removes and reinserts with original callbacks, and insertion callback precedes observed=1',()=>{
 const r=run('reobserve-1-0-0');assert.deepEqual(r.services.map(s=>s[0]),[0x38,0x40,0x38,0x40,0x38,0x30]);assert.equal(r.services[0][6],0);assert.equal(r.services[1][6],1);assert.equal(run('detached-retained-observed-byte').services[0][6],0xfe);
});
test('Head/middle/tail destruction repairs both neighbors and embedded resource head/tail, including null resource pointers',()=>{
 for(const r of fixture.cases.filter(r=>r.input.name.startsWith('remove-')||r.input.name.startsWith('cleanup-'))){const b=Buffer.from(evaluateResourceRef(r.input).snapshots.at(-1)!,'hex');for(let i=0;i<4;i++)assert.deepEqual(b.subarray(0x240+i*256,0x250+i*256),Buffer.alloc(16),r.input.name);for(let i=0;i<8;i++){assert.deepEqual(b.subarray(0x800+i*32,0x818+i*32),Buffer.alloc(24));assert.equal(b[0x818+i*32],1);}}
 assert.equal(run('remove-0-1-1').services.filter(s=>s[0]===0x30).length,0);
});
test('Callback-side removal and nested observation are honored when original caller reloads list state',()=>{
 assert.equal(last('callback-48-5-0')[0x818],0xfe);const removedDuringAdded=run('callback-56-1-0');assert.ok(removedDuringAdded.services.some(s=>s[0]===0x38));const nested=run('callback-56-4-0');assert.ok(nested.services.some(s=>s[0]===0x38&&s[1]===0x500));for(const name of ['callback-48-1-0','callback-64-1-0']){const b=last(name);assert.equal(b.readBigUInt64LE(0x800),0n);assert.equal(b[0x818],1);}
});
