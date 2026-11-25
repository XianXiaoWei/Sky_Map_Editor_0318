import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {evaluateAvatarCase,type AvatarOracleCase,type AvatarOracleExpected} from '../tools/avatar-set-pos-evaluate';
type Row=AvatarOracleCase&{expected:AvatarOracleExpected};
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/avatar-physical-native.json.gz',import.meta.url))).toString()) as {cases:Row[]};
for(const [name,filter] of [
 ['Objects AvatarSetPos -> physical states -> complete Whisker reset',(c:Row)=>c.h[0]<2],
 ['both original physical setters, aliases and signed zero',(c:Row)=>c.h[0]===2||c.h[0]===3],
 ['original Euler -> forward, packed libm captures and SIMD scratch bytes',(c:Row)=>c.h[0]===4]
] as const)test(name,()=>{for(const row of fixture.cases.filter(filter))assert.deepEqual(evaluateAvatarCase(row,row.expected),row.expected,row.name);});
