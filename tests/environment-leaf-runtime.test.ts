import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateLeaf} from '../tools/environment-leaf-cases';
test('PointLight pool, emitter rail events and Rail storage preserve independent original machine state and callback reloads',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/environment-leaf-native.json.gz')).toString());
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateLeaf(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
