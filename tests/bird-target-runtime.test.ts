import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateBirdUpdate} from '../tools/bird-update-cases';
test('BirdV2 target selection inside the whole original update matches native state, timer and ordered dispatch',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-target-native.json.gz')).toString());assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.ok(fixture.cases.length>=60);
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateBirdUpdate(row.input)).digest('hex'),row.nativeSha256,JSON.stringify(row.input));
});
