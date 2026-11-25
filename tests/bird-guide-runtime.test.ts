import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {birdGuideCases,evaluateBirdGuide} from '../tools/bird-guide-cases';
test('Bird release and guide detachment retain original ordered calls, all player slots, stale generations, distance thresholds and failure writes',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-guide-native.json.gz')).toString()),cases=birdGuideCases();assert.equal(cases.length,fixture.cases.length);
 cases.forEach((c,i)=>{assert.deepEqual(c,fixture.cases[i].input);assert.equal(crypto.createHash('sha256').update(evaluateBirdGuide(c)).digest('hex'),fixture.cases[i].nativeSha256,c.id);});
});
