import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { gunzipSync } from 'node:zlib';
import { evaluateAmbienceSunCase } from '../tools/ambience-sun-cases';
import { deriveOriginalAmbienceSun, originalAmbiencePlanetSphere } from '../src/core/ambience-sun-runtime';

test('Original derived sun and all traced libm input bits match every prepared/corpus native fixture',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/ambience-sun-native.json.gz')).toString());
 for(const c of fixture.cases)assert.deepEqual(evaluateAmbienceSunCase(c.case,c.trace).bytes,Buffer.from(c.native,'base64'),c.case.label);
});
test('cheapFog retains input solar color while regular atmosphere applies tint, transmission and intensity',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/ambience-sun-native.json.gz')).toString()),input=fixture.cases[0].case.input;
 const cheap=deriveOriginalAmbienceSun({...input,cheapFog:1,intensity:.25});assert.deepEqual(cheap.sunColor,input.color);assert.equal(cheap.transmission,null);
 const atmosphere=deriveOriginalAmbienceSun({...input,cheapFog:0,intensity:.25});assert.notDeepEqual(atmosphere.sunColor,input.color);assert.ok(atmosphere.sunColor[0]<input.color[0]);
 assert.equal(atmosphere.sunColor[3],input.color[3]);assert.deepEqual(atmosphere.atmosphereSunColor,input.color);
});
test('Camera planet sphere uses the original clamped height interpolation and radius',()=>{
 assert.deepEqual(originalAmbiencePlanetSphere([12,-1,30]),[12,-640000,30,640000]);
 assert.deepEqual(originalAmbiencePlanetSphere([12,1000,30]),[6,-640000,15,640000]);
 assert.deepEqual(originalAmbiencePlanetSphere([12,3000,30]),[0,-640000,0,640000]);
});
