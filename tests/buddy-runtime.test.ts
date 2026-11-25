import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateBuddy} from '../tools/buddy-cases';import {ObjectsDocument} from '../src/core/objects';import {PreparedEnvironmentObjectState} from '../src/core/environment-object-state';
test('Buddy own Load, shared action lookup and motion cache match original caller bytes and service order',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/buddy-native.json.gz')).toString());assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.ok(fixture.cases.length>=60);
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateBuddy(row.input,row.nativeMath)).digest('hex'),row.nativeSha256,JSON.stringify(row.input));
});
test('DayHubCave Buddy retains its actual parameter reference, saved enabled state and Object +8 identity',()=>{
 const source=fs.readFileSync('/root/sky-research/original-runtime-corpus/Levels/DayHubCave/Objects.level.bin'),doc=new ObjectsDocument(source),state=new PreparedEnvironmentObjectState(doc.nodes);
 try{
  const buddy=doc.nodes.find(n=>n.className==='Buddy')!,param=doc.nodes.find(n=>n.className==='BuddyParams')!,b=state.require(buddy.id),p=state.require(param.id);
  assert.equal(state.runtimeMemory.read64(b.pointer+128n),p.pointer);assert.equal(state.objectPointer(buddy.id),b.pointer+8n);
  assert.equal(state.enabled(buddy.id),false);assert.equal(state.setEnabled(buddy.id,true),true);assert.equal(state.enabled(buddy.id),true);assert.equal(state.setEnabled(buddy.id,false),true);
  assert.deepEqual(b.fieldsLoaded.sort(),buddy.fields.map(f=>f.name).sort());assert.deepEqual(p.fieldsLoaded.sort(),param.fields.map(f=>f.name).sort());
  assert.ok(b.pending.some(s=>s.includes('AI')));assert.deepEqual(doc.serialize(),source);
 }finally{state.dispose();}
});
