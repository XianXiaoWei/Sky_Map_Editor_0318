import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {fishUpdateCases,evaluateFishUpdate,type FishUpdateCase,type FishNativeMath} from '../tools/fish-update-cases';
import evidence from '../docs/fish-update-native.json';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/fish-update-native.json.gz')).toString()) as {
 executableSha256:string;nativeArithmetic:number[][];cases:{input:FishUpdateCase;nativeMath:FishNativeMath[];nativeSha256:string}[];
};
for(const [mode,name] of [[0,'whole FishV2 Update'],[1,'whole Creature TurnDirection'],[2,'whole Creature Bank'],[3,'whole Creature motion transform'],[4,'whole FishV2 Update using production movement composition']] as const){
 test('Original '+name+' matches native memory, thresholds, callbacks and consecutive frames',()=>{
  assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.nativeArithmetic.length,16);
  const rows=fixture.cases.filter(row=>row.input.mode===mode),cases=fishUpdateCases().filter(c=>c.mode===mode);assert.equal(rows.length,cases.length);assert.ok(rows.length);
  if(mode===0){assert.ok(rows.some(row=>row.input.collisionCount===3));assert.ok(rows.some(row=>row.input.transformFaultOffset===60));assert.ok(rows.some(row=>row.input.mutation===8));}
  if(mode===0||mode===2||mode===4)assert.ok(rows.some(row=>(row.input.steps??1)>1));
  for(let i=0;i<rows.length;i++){
   const row=rows[i];assert.deepEqual(row.input,cases[i]);assert.equal(crypto.createHash('sha256').update(evaluateFishUpdate(row.input,row.nativeMath,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
  }
 });
}
