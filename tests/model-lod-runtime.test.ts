import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';import assert from 'node:assert/strict';import test from 'node:test';
import {evaluateModelBake} from '../tools/model-baked-evaluate';import type {ModelBakeCase} from '../tools/model-baked-cases';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/model-lod-native.json.gz')).toString()) as {executableSha256:string;cases:{input:ModelBakeCase;native:any}[]};
const run=(name:string)=>evaluateModelBake(fixture.cases.find(r=>r.input.name===name)!.input,true,true);
test('Original Model LOD query matches all registered Mesh counts and reference snapshots',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.length,1168);assert.equal(fixture.cases.filter(r=>r.input.source).length,1152);
 for(const r of fixture.cases){const actual=evaluateModelBake(r.input,true,true);assert.deepEqual({...actual,memory:crypto.createHash('sha256').update(Buffer.from(actual.memory,'hex')).digest('hex')},r.native,r.input.name);}
});
test('Missing Mesh query asserts without requesting or normal destructor cleanup',()=>{const v=run('resources-0');assert.equal(v.line,222);assert.equal(v.severity,4);assert.ok(!v.services.some(s=>s[0]===6||s[0]===10));assert.equal(run('resources-7').line,109);});
test('LOD count is returned before releasing its observed resource and preserves unsigned bits',()=>{for(const count of [0,7,0x80000000,0xffffffff]){const v=run(`lod-count-${count}`),b=Buffer.from(v.memory,'hex');assert.equal(v.line,0);assert.equal(b.readUInt32LE(0x1900),count);assert.equal(b.readBigUInt64LE(0x440),0n);assert.equal(b.readBigUInt64LE(0x448),0n);assert.equal(b[0x1c18],1);assert.equal(v.services.at(-3)![0],10);}});
