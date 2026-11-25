import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';
import {evaluateResourceLookup,type ResourceLookupResult} from '../tools/resource-lookup-evaluate';import {makeResourceLookupCase,type ResourceLookupCase} from '../tools/resource-lookup-cases';import {NativeResourceLookupDependencyBoundary} from '../src/core/resource-manager-runtime';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/resource-lookup-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:ResourceLookupCase;native:ResourceLookupResult}[]};
const row=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return r;};const run=(name:string)=>evaluateResourceLookup(row(name).input);
test('Complete registered resource lookup matches 29 groups / 7885 queries and all 1185 source names',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.length,29);assert.equal(fixture.cases.reduce((n,r)=>n+r.native.results.length,0),7885);assert.equal(fixture.cases.reduce((n,r)=>n+(r.input.sources?.length??0),0),1185);
 for(const r of fixture.cases){const actual=evaluateResourceLookup(r.input);assert.deepEqual({...actual,memory:crypto.createHash('sha256').update(Buffer.from(actual.memory,'hex')).digest('hex')},r.native,r.input.name);}
});
test('Equal-name resources select first exact type in iterator order, without case folding or subtype assumptions',()=>{
 const r=row('range-1-0'),actual=run('range-1-0'),find=(name:string,typeId:number)=>actual.results[r.input.queries.findIndex(q=>q.name===name&&q.typeId===typeId)];assert.equal(find('same',1)[2],r.input.resourceOffsets[0]);assert.equal(find('same',2)[2],r.input.resourceOffsets[1]);assert.equal(find('same',3)[2],0xffffffff);assert.equal(find('Same',1)[2],0xffffffff);
 const c=row('range-3-0'),v=run('range-3-0');for(const q of ['A','a','é','中文'])assert.notEqual(v.results[c.input.queries.findIndex(n=>n.name===q&&n.typeId===c.input.rows.find(r=>r.name===q)!.classId)][2],0xffffffff);
});
test('A matching null resource ends the range before later fallback resources; nonmatching null metadata can fall back',()=>{
 const r=row('range-2-1'),actual=run('range-2-1'),index=r.input.queries.findIndex(q=>q.name==='same'&&q.typeId===4);assert.equal(actual.results[index][2],0xffffffff);assert.ok(actual.services.some(s=>s[0]===3));
 const normal=row('range-2-0'),v=run('range-2-0'),i=normal.input.queries.findIndex(q=>q.name==='same'&&q.typeId===4);assert.equal(v.results[i][2],normal.input.resourceOffsets[1]);
});
test('Metadata callback mutation is followed by reloading the selected resource pointer',()=>{
 const r=row('resource-value-reloaded-after-metadata'),actual=run(r.input.name);assert.equal(actual.results[0][2],r.input.resourceOffsets[1]);assert.equal(actual.results[1][2],r.input.resourceOffsets[1]);assert.notEqual(r.input.memory,actual.memory);
});
test('Original class-ID assertions and missing metadata boundaries remain separate from a successful absent-name query',()=>{
 for(const id of [1280,0xffffffff]){const v=run(`class-assert-${id}`);assert.deepEqual(v.results[0].slice(3),[135,4]);assert.deepEqual(v.results[1].slice(3),[0,0]);}
 assert.equal(run('missing-metadata-unqueried').results[0][2],0xffffffff);assert.throws(()=>evaluateResourceLookup(makeResourceLookupCase('missing-metadata',[{name:'invalid',classId:1279}],[{name:'invalid',typeId:1}])),NativeResourceLookupDependencyBoundary);
});
