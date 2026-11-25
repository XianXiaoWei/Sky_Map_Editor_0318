import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {birdFollowCases,evaluateBirdFollow} from '../tools/bird-follow-cases';
import evidence from '../docs/bird-follow-native.json';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-follow-native.json.gz')).toString());
for(const [mode,name] of [[0,'object-follow state machine'],[1,'orbit direction and fallback axes'],[2,'braking speed and SIMD lanes'],[3,'direct Seek overload scaling']] as const){
 test('Original '+name+' preserves native arenas, callback order, thresholds and assertions',()=>{
  assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.nativeArithmetic.length,16);
  const rows=fixture.cases.filter((r:{input:{mode:number}})=>r.input.mode===mode);
  assert.equal(rows.length,birdFollowCases().filter(c=>c.mode===mode).length);assert.ok(rows.length>0);
  for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateBirdFollow(row.input,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
 });
}
