import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {evaluateAvatarCase,type AvatarOracleCase,type AvatarOracleExpected} from '../tools/avatar-set-pos-evaluate';
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/avatar-set-pos-native.json.gz',import.meta.url))).toString());
test('AvatarSetPos, Avatar positioning and event sequence replay complete original byte/trace captures',()=>{for(const row of fixture.cases as (AvatarOracleCase&{expected:AvatarOracleExpected})[])assert.deepEqual(evaluateAvatarCase(row,row.expected),row.expected,row.name);});
