import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {evaluateBirdNextTarget} from '../tools/bird-next-target-oracle';
test('Ordinary bird target selection and steering initialization retain native writes',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/bird-next-target-native.json.gz')).toString());
 for(const c of fixture.cases)assert.equal(evaluateBirdNextTarget(Buffer.from(c.header,'hex'),Buffer.from(c.input,'hex')).toString('hex'),c.native,c.name);
});
