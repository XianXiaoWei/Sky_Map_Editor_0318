import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateBirdUpdate} from '../tools/bird-update-cases';import {birdRailChainCases} from '../tools/bird-rail-chain-cases';
test('Original bird/manta rail selection and following, target forces and shared Flocking inside flight/motion/Update match native arenas, consecutive frames and ordered services',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-rail-chain-native.json.gz')).toString());assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.length,birdRailChainCases().length);assert.equal(fixture.nativeArithmetic.length,16);
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateBirdUpdate(row.input,row.nativeMath,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
});
