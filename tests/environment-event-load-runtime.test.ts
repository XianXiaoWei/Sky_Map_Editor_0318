import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateEventLoad} from '../tools/environment-event-load-cases';
test('Environment events and LevelMesh loading preserve independent original machine-code snapshots and service order',()=>{
  const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/environment-event-load-native.json.gz')).toString());
  for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateEventLoad(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
