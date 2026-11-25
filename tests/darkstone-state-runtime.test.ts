import {test} from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {createHash} from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {evaluateDarkstoneState,darkstoneStateCases,type DarkstoneStateCase} from '../tools/darkstone-state-cases';
import evidence from '../docs/darkstone-state-native.json';
import {PlantIgnitionPreview,PLANT_PREVIEW_STEP} from '../src/core/viewport-ignition';
test('Darkstone state and SoulTrap completion match independent original memory and ordered calls',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/darkstone-state-native.json.gz')).toString()) as {executableSha256:string;cases:{input:DarkstoneStateCase;nativeSha256:string;mathTrace:string[]}[]};
 assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.cases.length,darkstoneStateCases().length);
 for(const row of fixture.cases)assert.equal(createHash('sha256').update(evaluateDarkstoneState(row.input,row.mathTrace.map(t=>Buffer.from(t,'base64')))).digest('hex'),row.nativeSha256,row.input.label);
});
test('plant preview keeps independent health/display state, native shape floor and paused state',()=>{
 const preview=new PlantIgnitionPreview();preview.ignite(23);preview.ignite(42);
 preview.advance(PLANT_PREVIEW_STEP);assert.equal(preview.state(23).burnt,false);assert.ok(preview.state(23).progress>0);
 assert.deepEqual(preview.shape(23),[1,1,1]);preview.advance(.5);
 assert.ok(preview.shape(23)!.every(v=>v<1&&v>.5));
 const frozen={state:preview.state(23),shape:preview.shape(23),diffuse:preview.diffuse(23)};preview.advance(0);
 assert.deepEqual({state:preview.state(23),shape:preview.shape(23),diffuse:preview.diffuse(23)},frozen);
 preview.advance(10);assert.equal(preview.state(23).burnt,true);assert.ok(preview.shape(23)!.every(v=>v>=.5));
 const reset=new PlantIgnitionPreview();assert.equal(reset.state(23).lit,false);assert.equal(reset.shape(23),undefined);
});
