import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {evaluateEventBarn,type EventBarnCase} from '../tools/event-barn-evaluate';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/event-barn-native.json.gz')).toString()) as {executableSha256:string;cases:(EventBarnCase&{expectedHex:string})[]};
const check=(filter:(c:EventBarnCase)=>boolean)=>{assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');const cases=fixture.cases.filter(filter);assert.ok(cases.length);for(const c of cases)assert.deepEqual(evaluateEventBarn(c),Buffer.from(c.expectedHex,'hex'),c.name);};
test('Original EventBarn sort permutations match native pointer identities, equal keys, thresholds and invalid IDs',()=>check(c=>c.name.startsWith('sort')));
test('Original enable/Start and single-event dispatch preserve callback reloads, finish/restart and null-Barn logs',()=>check(c=>/^(dispatch|request)/.test(c.name)));
test('Full 1280-slot Barn load/update/render/release and lookup preserve capture and free-list identities',()=>check(c=>/^(pool|replace|capture|nested|uid)/.test(c.name)));
test('FloatAdd executes inside original Barn dispatch and completes in the same frame, including real serialized configurations',()=>check(c=>c.name.startsWith('derived-FloatAdd')));
test('PlaySound2D executes inside original Barn dispatch, checking parameters, stale handles, completion and resume stop',()=>check(c=>c.name.startsWith('derived-PlaySound2D')));
