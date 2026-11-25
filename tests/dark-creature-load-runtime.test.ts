import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {createHash} from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {evaluateDarkCreatureLoad,type DarkCreatureLoadCase} from '../tools/dark-creature-load-cases';

test('DarkCreature.Load: original model/texture/bone/wind/marker calls, whole memory and late assertions',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/dark-creature-load-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:DarkCreatureLoadCase;nativeSha256:string}[]};
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.equal(fixture.cases.length,86);
 for(const row of fixture.cases)assert.equal(createHash('sha256').update(evaluateDarkCreatureLoad(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
