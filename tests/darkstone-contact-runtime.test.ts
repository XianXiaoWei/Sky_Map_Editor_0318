import {test} from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {createHash} from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {darkstoneContactCases,evaluateDarkstoneContact,type DarkstoneContactCase} from '../tools/darkstone-contact-cases';
import evidence from '../docs/darkstone-contact-native.json';
import {PlantIgnitionPreview} from '../src/core/viewport-ignition';
test('Darkstone Avatar/Flame contact and actual original OBB geometry match independent native memory and ordered calls',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/darkstone-contact-native.json.gz')).toString()) as {executableSha256:string;cases:{input:DarkstoneContactCase;nativeSha256:string}[]};
 assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.cases.length,darkstoneContactCases().length);
 for(const row of fixture.cases)assert.equal(createHash('sha256').update(evaluateDarkstoneContact(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
test('plant preview uses model scale and native contact heat with identical fixed-clock frame partitioning',()=>{
 const geometry={position:[2,3,4],scale:[.1,.2,.3],worldObb:[1,0,0,0,0,1,0,0,0,0,1,0,2,3,4,1]},large={...geometry,scale:[10,20,30]};
 const fine=new PlantIgnitionPreview(),coarse=new PlantIgnitionPreview(),different=new PlantIgnitionPreview();fine.ignite(1,geometry);coarse.ignite(1,geometry);different.ignite(1,large);
 for(let i=0;i<30;i++)fine.advance(1/60);coarse.advance(.5);different.advance(.5);
 assert.deepEqual(fine.state(1),coarse.state(1));assert.deepEqual(fine.shape(1),coarse.shape(1));assert.deepEqual(fine.diffuse(1),coarse.diffuse(1));
 assert.ok(fine.contact(1)!.heat>different.contact(1)!.heat);assert.ok(fine.state(1).progress>different.state(1).progress);
 assert.ok(fine.shape(1)!.every(n=>n>=.5&&n<=1));
 const paused={state:fine.state(1),color:fine.diffuse(1),contact:fine.contact(1)};fine.advance(0);assert.deepEqual({state:fine.state(1),color:fine.diffuse(1),contact:fine.contact(1)},paused);
});
