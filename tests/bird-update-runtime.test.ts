import {test} from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {createHash} from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {birdUpdateCases,evaluateBirdUpdate,type BirdUpdateCase} from '../tools/bird-update-cases';
import evidence from '../docs/bird-update-native.json';
test('whole BirdV2 Update preserves native target, time, culling, ordered dispatch and transform assertions',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-update-native.json.gz')).toString()) as {executableSha256:string;cases:{input:BirdUpdateCase;nativeSha256:string}[]};
 assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.cases.length,birdUpdateCases().length);
 for(const row of fixture.cases)assert.equal(createHash('sha256').update(evaluateBirdUpdate(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
