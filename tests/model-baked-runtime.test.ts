import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';
import {evaluateModelBake,type ModelBakeResult} from '../tools/model-baked-evaluate';import type {ModelBakeCase} from '../tools/model-baked-cases';
import {NativeModelBakeArithmeticBoundary,initializeOriginalMeshInstance,type ModelBakeMemory} from '../src/core/model-baked-runtime';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/model-baked-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:ModelBakeCase;native:ModelBakeResult}[]};
const row=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return r;};const run=(name:string)=>evaluateModelBake(row(name).input);const memory=(name:string)=>Buffer.from(run(name).memory,'hex');
test('Complete MeshInstance consumer and all 1152 resources / 1231 LODs / 10653 bake snapshots match original state and service order',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.filter(r=>r.input.source?.kind==='mesh').length,1231);assert.equal(new Set(fixture.cases.filter(r=>r.input.source?.kind==='mesh').map(r=>r.input.source!.file)).size,1152);assert.equal(fixture.cases.filter(r=>r.input.source?.kind==='bake').length,10653);
 for(const r of fixture.cases){const actual=evaluateModelBake(r.input);assert.deepEqual({...actual,memory:crypto.createHash('sha256').update(Buffer.from(actual.memory,'hex')).digest('hex')},r.native,r.input.name);}
});
test('Sphere and both distinct OBBs use original float order and preserve untouched bytes',()=>{
 const b=memory('index-0-0');assert.deepEqual([32,36,40,44].map(at=>b.readFloatLE(at)),[3,3,3,0]);assert.equal(b.readFloatLE(24),Math.fround(Math.sqrt(Math.fround(10*10+14*14+18*18))*.5));
 assert.deepEqual([48,68,88].map(at=>b.readFloatLE(at)),[5,7,9]);assert.deepEqual([96,100,104,108].map(at=>b.readFloatLE(at)),[3,3,3,1]);assert.deepEqual([112,132,152].map(at=>b.readFloatLE(at)),[2,5,7]);assert.deepEqual([160,164,168,172].map(at=>b.readFloatLE(at)),[1,2,2,1]);assert.equal(b[20],1);for(const at of [21,22,23,28,29,30,31,176])assert.equal(b[at],0xa5);
 assert.equal(memory('bake-pointer-0').readBigUInt64LE(8),0n);assert.equal(memory('bake-pointer-7472').readBigUInt64LE(8),0x2a0001d30n);
});
test('LOD assertions retain writes made before the original assertion and do not destroy pending references',()=>{
 for(const op of [0,1])for(const index of [-0x80000000,-1,2,0x7fffffff]){const r=run(`index-${op}-${index}`),b=Buffer.from(r.memory,'hex');assert.equal(r.line,60);assert.equal(r.severity,3);assert.equal(b.readBigUInt64LE(),0x2a00004a8n);assert.equal(b.readInt32LE(16),index);assert.equal(b[20],op===0?0xa5:0);assert.equal(r.services.filter(s=>s[0]===10).length,0);}
});
test('Missing mesh resources assert after request/observation; missing baked resources diagnose and produce an unbaked instance',()=>{
 for(const flags of [0,2,7,11])assert.equal(run(`resources-${flags}`).line,109);
 const r=run('resources-1'),b=Buffer.from(r.memory,'hex');assert.equal(r.line,0);assert.equal(b.readBigUInt64LE(8),0n);assert.match(r.diagnostics,/GUID: -2147483647/);assert.deepEqual(r.services.slice(-2),[[10,1,0],[10,0,0]]);assert.ok(r.services.some(s=>s[0]===6));
 assert.equal(run('resources-19').line,0);assert.equal(run('resources-35').line,0);
});
test('First duplicate GUID and LOD0 vertex gate remain authoritative even when a later record or selected LOD matches',()=>{
 const mismatch=run('duplicate-guid-first-mismatch');assert.equal(Buffer.from(mismatch.memory,'hex').readBigUInt64LE(8),0n);assert.ok(mismatch.diagnostics);assert.equal(memory('compatible-nonzero-lod').readBigUInt64LE(8),0x2a0001d00n);assert.equal(memory('compatible-nonzero-lod').readInt32LE(16),1);
 for(const count of [0,1,127,129,0xffffffff])assert.ok(run(`vertex-count-${count}`).diagnostics);assert.equal(run('vertex-count-128').diagnostics,'');for(const n of [-1,-0x80000000])assert.ok(run(`load-index-${n}`).diagnostics);
});
test('Aliased output/LOD and special float payloads retain original stores; distinct dual NaNs require verified operand results',()=>{
 for(const r of fixture.cases.filter(r=>r.input.name.startsWith('alias-')||r.input.name.startsWith('special-')||r.input.name.startsWith('dual-nan-'))){const actual=evaluateModelBake(r.input);assert.equal(crypto.createHash('sha256').update(Buffer.from(actual.memory,'hex')).digest('hex'),r.native.memory,r.input.name);}
 const c=row('dual-nan-2143289345-2143289346').input,b=Buffer.from(c.memory,'hex'),O=0x2a0000000n;
 const bytes=(p:bigint,n:number)=>b.subarray(Number(p-O),Number(p-O)+n);const m:ModelBakeMemory={bytes,read32:p=>bytes(p,4).readUInt32LE(),read64:p=>bytes(p,8).readBigUInt64LE(),write32:(p,n)=>bytes(p,4).writeUInt32LE(n>>>0),write64:(p,n)=>bytes(p,8).writeBigUInt64LE(n),write8:(p,n)=>{bytes(p,1)[0]=n;},string:()=>''};
 assert.throws(()=>initializeOriginalMeshInstance(m,O,O+0x4a8n,0n,0),NativeModelBakeArithmeticBoundary);
 assert.throws(()=>evaluateModelBake({...c,arithmetic:[]}),/Missing independently probed dual-NaN operands/);
});
