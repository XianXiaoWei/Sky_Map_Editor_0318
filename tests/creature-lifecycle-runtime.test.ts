import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {CREATURE_LIFECYCLE_MODES,creatureLifecycleCases,evaluateCreatureLifecycle,type CreatureLifecycleCase} from '../tools/creature-lifecycle-cases';
import evidence from '../docs/creature-lifecycle-native.json';
for(const mode of CREATURE_LIFECYCLE_MODES)test(mode+' whole ordinary caller preserves native bytes, callback ordering and failure boundaries',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/creature-lifecycle-native.json.gz')).toString()) as {executableSha256:string;cases:{input:CreatureLifecycleCase;nativeSha256:string}[]};assert.equal(fixture.executableSha256,evidence.executableSha256);
 const rows=fixture.cases.filter(row=>row.input.mode===mode);assert.equal(rows.length,creatureLifecycleCases().filter(c=>c.mode===mode).length);
 for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateCreatureLifecycle(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
