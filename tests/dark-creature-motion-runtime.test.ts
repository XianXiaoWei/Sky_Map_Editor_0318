import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {darkMotionCases,evaluateDarkMotion,type DarkMotionCase,type DarkMotionMath} from '../tools/dark-creature-motion-cases';
import evidence from '../docs/dark-creature-motion-native.json';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/dark-creature-motion-native.json.gz')).toString()) as {
 executableSha256:string;nativeArithmetic:number[][];cases:{input:DarkMotionCase;nativeMath:DarkMotionMath[];nativeSha256:string}[];
};
for(const [mode,name] of [[0,'partial DarkCreature Update movement and owner callbacks'],[1,'whole DarkCreature appearance with real Seek and rail return'],[2,'whole raw Motion FollowRail with caller private W'],[3,'partial DarkCreature Update using production motion composition']] as const){
 test('Original '+name+' matches native memory and ordered services',()=>{
  assert.equal(fixture.executableSha256,evidence.executableSha256);
  assert.equal(fixture.nativeArithmetic.length,16);
  const rows=fixture.cases.filter(row=>row.input.mode===mode);
  assert.equal(rows.length,darkMotionCases().filter(c=>c.mode===mode).length);
  assert.ok(rows.length>20);
  assert.ok(rows.some(row=>row.input.steps===3||row.input.steps===2),'retain consecutive frames');
  assert.equal(evidence.functions['DarkCreature.Update.MotionPhase'].wholeFunction,false,'partial Update must remain explicit');
  for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateDarkMotion(row.input,row.nativeMath,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
 });
}
