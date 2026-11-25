import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {fishAICases,evaluateFishAI,type FishAICase,type FishAINativeMath} from '../tools/fish-ai-cases';
import evidence from '../docs/fish-ai-native.json';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/fish-ai-native.json.gz')).toString()) as {
 executableSha256:string;nativeArithmetic:number[][];cases:{input:FishAICase;math:FishAINativeMath[];nativeSha256:string}[];
};
for(const [mode,name] of [[0,'whole FishV2 AI'],[1,'whole Pursuit'],[2,'whole accumulating Avoidance'],[3,'Fish neighbor predicate'],[4,'Fish flock predicate'],[5,'production Update with actual AI and movement helpers'],[6,'production AI with actual steering helpers'],[7,'production Update with actual AI, movement and steering helpers']] as const){
 test('Original '+name+' matches original memory and callback order',()=>{
  assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.nativeArithmetic.length,16);
  const rows=fixture.cases.filter(row=>row.input.mode===mode),cases=fishAICases().filter(c=>c.mode===mode);assert.equal(rows.length,cases.length);assert.ok(rows.length);
  if(mode===0){assert.ok(rows.some(row=>row.input.label.startsWith('live callback')));assert.ok(rows.some(row=>row.input.label.startsWith('flee Marker private')));assert.ok(rows.some(row=>row.input.label.startsWith('explicit AI sincos')));}
  if(mode===0||mode===5)assert.ok(rows.some(row=>(row.input.steps??1)>1));
  for(let i=0;i<rows.length;i++){
   const row=rows[i];assert.deepEqual(row.input,cases[i]);assert.equal(crypto.createHash('sha256').update(evaluateFishAI(row.input,row.math,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
  }
 });
}
