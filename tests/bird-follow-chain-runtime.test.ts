import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {evaluateBirdUpdate} from '../tools/bird-update-cases';
import {birdFollowChainCases} from '../tools/bird-follow-chain-cases';
test('Original object follow, Seek/Brake/Orbit and target/guide/flock/rail forces inside bird flight/motion/Update preserve native arenas and consecutive frames',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-follow-chain-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.equal(fixture.cases.length,birdFollowChainCases().length);assert.equal(fixture.nativeArithmetic.length,16);
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateBirdUpdate(row.input,row.nativeMath,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
});
