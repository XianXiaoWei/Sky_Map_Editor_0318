import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';
import {evaluateModelBake,type ModelBakeResult} from '../tools/model-baked-evaluate';import type {ModelBakeCase} from '../tools/model-baked-cases';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/model-baked-ref-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:ModelBakeCase;native:ModelBakeResult}[]};
const run=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return evaluateModelBake(r.input,true);};
test('Original ResourceRef normal lifecycle joins the complete Model consumer for all 12069 cases and all serialized bake GUIDs',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.length,12069);assert.equal(fixture.cases.filter(r=>r.input.source?.kind==='bake').length,10653);
 for(const r of fixture.cases){const actual=evaluateModelBake(r.input,true);assert.deepEqual({...actual,memory:crypto.createHash('sha256').update(Buffer.from(actual.memory,'hex')).digest('hex')},r.native,r.input.name);}
});
test('Successful binding actually unlinks both embedded resource handles while retaining both observed bytes',()=>{
 const r=run('index-1-0'),b=Buffer.from(r.memory,'hex');assert.equal(r.line,0);assert.deepEqual(b.subarray(0x440,0x450),Buffer.alloc(16));assert.deepEqual(b.subarray(0x840,0x850),Buffer.alloc(16));for(const at of [0x1c00,0x1c20]){assert.deepEqual(b.subarray(at,at+24),Buffer.alloc(24));assert.equal(b[at+24],1);assert.deepEqual(b.subarray(at+25,at+32),Buffer.alloc(7,0xa5));}assert.deepEqual(r.services.filter(s=>s[0]===12).map(s=>s[2]>>>16),[0x38,0x38,0x30,0x30]);
});
test('Original assertion preserves live links; an observation callback can invalidate a ref before the consumer reads it',()=>{
 const failed=run('index-1--1'),b=Buffer.from(failed.memory,'hex');assert.equal(failed.line,60);assert.equal(b.readBigUInt64LE(0x440),0x2a0001c00n);assert.equal(b.readBigUInt64LE(0x840),0x2a0001c20n);assert.equal(failed.services.filter(s=>s[0]===10).length,0);
 const invalidated=run('resources-7'),a=Buffer.from(invalidated.memory,'hex');assert.equal(invalidated.line,109);assert.equal(a.readBigUInt64LE(0x440),0n);assert.equal(a.readBigUInt64LE(0x1c00),0n);assert.equal(a[0x1c18],1);const missingResource=run('resources-11'),c=Buffer.from(missingResource.memory,'hex');assert.equal(missingResource.line,109);assert.equal(c.readBigUInt64LE(0x440),0x2a0001c00n);assert.equal(c.readBigUInt64LE(0x450),0n);
});
