import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateFlowerUpdateCase} from '../tools/flower-update-cases';
test('Whole FlowerBarn Update matches original LOD/growth, alpha fades, pool release and mapped output',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/flower-update-native.json.gz')).toString());assert.equal(fixture.passed,true);assert.equal(fixture.entry,'0x10034e530');assert.equal(fixture.cases.length,32);
 for(const [i,row] of fixture.cases.entries())assert.equal(crypto.createHash('sha256').update(evaluateFlowerUpdateCase(Buffer.from(row.configHex,'hex'))).digest('hex'),row.nativeSha256,`Flower Update case ${i}`);
});
