import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';
import {evaluateModelBake,type ModelBakeResult} from '../tools/model-baked-evaluate';import type {ModelBakeCase} from '../tools/model-baked-cases';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/model-baked-registry-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:ModelBakeCase;native:ModelBakeResult}[]};
const run=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return evaluateModelBake(r.input,true,true);};
test('Original registered name/type lookup and ResourceRef list lifecycle join all 12069 Model cases',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.length,12069);assert.equal(fixture.cases.filter(r=>r.input.source?.kind==='bake').length,10653);
 for(const r of fixture.cases){const actual=evaluateModelBake(r.input,true,true);assert.deepEqual({...actual,memory:crypto.createHash('sha256').update(Buffer.from(actual.memory,'hex')).digest('hex')},r.native,r.input.name);}
});
test('Lookup actually invokes class selection and the original consumer preserves requests/assertions on missing names',()=>{
 const v=run('index-1-0');assert.equal(v.line,0);assert.deepEqual(v.services.filter(s=>s[0]===14).map(s=>s[1]),[0x240,0x260]);assert.equal(Buffer.from(v.memory,'hex').readBigUInt64LE(8),0x2a0001d00n);assert.equal(run('resources-0').line,109);const missingLevel=run('resources-1');assert.equal(missingLevel.line,0);assert.ok(missingLevel.services.some(s=>s[0]===6));assert.ok(missingLevel.diagnostics);
});
