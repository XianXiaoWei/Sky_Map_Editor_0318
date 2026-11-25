import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';import crypto from 'node:crypto';
import {evaluateEffectCase,prepareEffectCase} from '../tools/object-effects-cases';
import {setOriginalCandleTransform} from '../src/core/object-effects-runtime';
test('Original effect pools and Candle transforms/enabled match native whole-memory, returns, assertions and release order',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/object-effects-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.equal(fixture.cases.filter((r:any)=>r.input.transformHex).length,1077);
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateEffectCase(row.input)).digest('hex'),row.nativeSha256,JSON.stringify(row.input));
});
test('Candle byte-matrix endpoint retains native column alias order for all saved matrices and overlapping inputs',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/object-effects-native.json.gz')).toString());
 for(const row of fixture.cases.filter((r:any)=>r.input.mode===3)){
  const {b,m}=prepareEffectCase(row.input),offset=row.input.offset??0x1800;
  setOriginalCandleTransform(m,0x440001000n,b.subarray(offset,offset+64));
  assert.equal(crypto.createHash('sha256').update(Buffer.concat([Buffer.alloc(20),b])).digest('hex'),row.nativeSha256,row.input.label);
 }
});
