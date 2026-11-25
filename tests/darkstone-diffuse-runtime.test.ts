import {test} from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';import {createHash} from 'node:crypto';
import {darkstoneDiffuseCases,evaluateDarkstoneDiffuse,type DarkstoneDiffuseCase} from '../tools/darkstone-diffuse-cases';
import evidence from '../docs/darkstone-diffuse-native.json';
import {PlantIgnitionPreview} from '../src/core/viewport-ignition';
test('original Darkstone diffuse region matches native caller memory, libm arguments and material calls',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/darkstone-diffuse-native.json.gz')).toString()) as {executableSha256:string;cases:{input:DarkstoneDiffuseCase;nativeSha256:string;mathTrace:string[]}[]};
 assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.cases.length,darkstoneDiffuseCases().length);
 for(const row of fixture.cases){const actual=evaluateDarkstoneDiffuse(row.input,row.mathTrace.map(v=>Buffer.from(v,'base64')));assert.equal(createHash('sha256').update(actual).digest('hex'),row.nativeSha256,row.input.label);}
});
test('burn preview evolves the native diffuse independently and preserves paused colors',()=>{
 const preview=new PlantIgnitionPreview();assert.equal(preview.diffuse(23),undefined);
 preview.ignite(23);const initial=preview.diffuse(23)!;preview.advance(0);assert.deepEqual(preview.diffuse(23),initial);
 preview.advance(.1);assert.notDeepEqual(preview.diffuse(23),initial);preview.ignite(42);assert.deepEqual(preview.diffuse(42),initial);
 const saved=preview.diffuse(42)!;saved.fill(99);assert.deepEqual(preview.diffuse(42),initial);
 preview.advance(3);const burnt=preview.diffuse(23)!;preview.advance(.1);assert.deepEqual(preview.diffuse(23),burnt);assert.equal(new PlantIgnitionPreview().diffuse(23),undefined);
});
