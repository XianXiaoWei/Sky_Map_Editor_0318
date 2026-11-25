import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateFlowerSeedCase} from '../tools/flower-seeds-cases';
test('Flower seed regions, weighted distribution, density order and initial reserves match native setup',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/flower-seeds-native.json.gz')).toString());assert.equal(fixture.passed,true);assert.equal(fixture.entry,'0x10034fb10');assert.equal(fixture.cases.length,64);
 for(const [i,row] of fixture.cases.entries())assert.equal(crypto.createHash('sha256').update(evaluateFlowerSeedCase(Buffer.from(row.configHex,'hex'))).digest('hex'),row.nativeSha256,`Flower seed setup case ${i}`);
});
