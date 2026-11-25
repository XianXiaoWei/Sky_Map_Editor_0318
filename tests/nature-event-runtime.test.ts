import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateNatureEvent,type NatureEventCase} from '../tools/nature-event-cases';
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/nature-events-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:NatureEventCase;nativeSha256:string}[]};
for(let mode=0;mode<13;mode++)test(`Nature event body ${mode}: original machine-code arena, callback ordering and assertions`,()=>{
 const rows=fixture.cases.filter(c=>c.input.mode===mode);assert.ok(rows.length);
 for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateNatureEvent(row.input)).digest('hex'),row.nativeSha256,JSON.stringify(row.input));
});
