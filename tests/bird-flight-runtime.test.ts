import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {evaluateBirdUpdate} from '../tools/bird-update-cases';

test('Whole BirdV2 update with original flight integration matches native memory, collisions, pitch, arrival and consecutive frames',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-flight-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.ok(fixture.cases.length>=160);
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateBirdUpdate(row.input,row.nativeMath)).digest('hex'),row.nativeSha256,row.input.label);
});
