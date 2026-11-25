import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {evaluateWhiskerShakeCase,type WhiskerShakeOracleCase,type WhiskerShakeOracleFrame} from '../tools/avatar-camera-shake-evaluate';
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/avatar-camera-shake-native.json.gz',import.meta.url))).toString()) as {cases:(WhiskerShakeOracleCase&{expected:WhiskerShakeOracleFrame[]})[]};
test('Whole native Whisker positional shake, basis, phase hash, decay and ray/sound requests',()=>{for(const row of fixture.cases)assert.deepEqual(evaluateWhiskerShakeCase(row,row.expected),row.expected,row.name);});
