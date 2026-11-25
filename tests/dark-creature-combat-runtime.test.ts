import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {darkCombatCases,evaluateDarkCombat,type DarkCombatCase,type DarkCombatMath} from '../tools/dark-creature-combat-cases';
import evidence from '../docs/dark-creature-combat-native.json';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/dark-creature-combat-native.json.gz')).toString()) as {
 executableSha256:string;nativeArithmetic:number[][];cases:{input:DarkCombatCase;nativeMath:DarkCombatMath[];nativeSha256:string}[];
};
for(const [mode,name] of [[0,'whole DarkCreature Chase'],[1,'whole DarkCreature Attack using actual Hit'],[2,'whole DarkCreature Hit using fixed AvatarBarn and active fields'],[3,'partial outer motion Update using observed real combat consumers'],[4,'partial outer motion Update using unmodified production combat composition']] as const){
 test('Original '+name+' matches native memory, audio, callbacks and state transitions',()=>{
  assert.equal(fixture.executableSha256,evidence.executableSha256);
  assert.equal(fixture.nativeArithmetic.length,16);
  const rows=fixture.cases.filter(row=>row.input.mode===mode);
  assert.equal(rows.length,darkCombatCases().filter(c=>c.mode===mode).length);
  assert.ok(rows.length>40);
  assert.ok(rows.some(row=>(row.input.steps??1)>1),'retain consecutive frame transitions');
  if(mode===2){assert.ok(rows.some(row=>row.input.birdCount===70),'retain 64-slot bird cap');assert.ok(rows.some(row=>row.input.activeMask===32768),'retain last fixed avatar slot');}
  for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateDarkCombat(row.input,row.nativeMath,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
 });
}
