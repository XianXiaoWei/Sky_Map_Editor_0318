import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateFlowerVertexCase} from '../tools/flower-vertices-cases';
test('Whole FlowerBarn vertex generation matches original native batches, eligibility and packed vertices',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/flower-vertices-native.json.gz')).toString());
 assert.equal(fixture.passed,true);assert.equal(fixture.entry,'0x100350c40');assert.equal(fixture.cases.length,60);
 for(const [i,row] of fixture.cases.entries())assert.equal(crypto.createHash('sha256').update(evaluateFlowerVertexCase(Buffer.from(row.configHex,'hex'))).digest('hex'),row.nativeSha256,`Flower generation case ${i}`);
});
