import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {darkDetectCases,evaluateDarkDetect,type DarkDetectCase,type DarkDetectMath} from '../tools/dark-creature-detect-cases';
import evidence from '../docs/dark-creature-detect-native.json';

const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/dark-creature-detect-native.json.gz')).toString()) as {
 executableSha256:string;nativeArithmetic:number[][];cases:{input:DarkDetectCase;nativeMath:DarkDetectMath[];nativeSha256:string}[];
};
for(const [mode,name] of [[0,'DarkCreature target detection'],[1,'DarkCreature detection with alert transition']] as const){
 test('Original '+name+' preserves native candidate order, raycasts, IDs and math calls',()=>{
  assert.equal(fixture.executableSha256,evidence.executableSha256);
  assert.equal(fixture.nativeArithmetic.length,16);
  const rows=fixture.cases.filter(row=>row.input.mode===mode);
  assert.equal(rows.length,darkDetectCases().filter(c=>c.mode===mode).length);
  assert.ok(rows.some(row=>row.input.steps===3),'retain consecutive frame transitions');
  if(mode===0)assert.ok(rows.some(row=>row.input.birds===70),'retain the original 64-slot bound');
  for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateDarkDetect(row.input,row.nativeMath,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
 });
}
