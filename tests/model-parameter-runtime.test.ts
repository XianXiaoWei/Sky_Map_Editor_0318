import fs from 'node:fs';import zlib from 'node:zlib';import assert from 'node:assert/strict';import test from 'node:test';
import {evaluateModelParameter,modelParameterMemory,parameterNameHash,MODEL_PARAMETER_BASE as base} from '../tools/model-parameter-evaluate';
import {updateOriginalLevelMeshParameters} from '../src/core/model-parameter-runtime';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/model-parameter-native.json.gz')).toString());
test('Original LevelMesh shader setters/timers and Model ready-LOD forwarding reproduce native byte states and callbacks',()=>{assert.equal(fixture.report.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.ok(fixture.cases.length>=181);for(const row of fixture.cases)assert.deepEqual(evaluateModelParameter(row.input),row.native,row.input.name);});
test('Native lookup retains existing pass and empty texture updates bind Black then stop scheduling',()=>{
 const row=fixture.cases.find((r:any)=>r.input.name==='texture 0/true/1'),out=evaluateModelParameter(row.input),b=Buffer.from(out[0].memory,'hex');assert.equal(b.readUInt32LE(0x288),1);assert.equal(out[1].events.filter(e=>e[0]===11)[0][3],parameterNameHash(new TextEncoder().encode('Black')));assert.equal(out[2].events.length,0);assert.equal(Buffer.from(out[1].memory,'hex')[0xa32],0);
});
test('Hot reload and invalid uniform diagnostics stay explicit dependency boundaries, retaining native writes already made',()=>{
 const b=Buffer.from(fixture.cases[0].input.memory,'hex'),m=modelParameterMemory(b),services={find:()=>0xffffffff,float:()=>{},vector:()=>{},texture:()=>{}};
 b[0xa30]=1;assert.throws(()=>updateOriginalLevelMeshParameters(m,base,0,services),/hot reload/);b[0xa30]=0;b[0xa32]=1;b[0x2a8]=1;assert.throws(()=>updateOriginalLevelMeshParameters(m,base,0,services),/invalid uniform/);assert.equal(b[0xa32],0);assert.equal(b.readUInt32LE(0x28c),0xffffffff);
});
