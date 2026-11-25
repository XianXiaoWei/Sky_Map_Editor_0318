import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';
import {evaluateTransformObject} from '../tools/transform-object-evaluate';import {transformEndpointAddress,restoredLevelMesh,type TransformCase} from '../tools/transform-object-cases';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/transform-object-level-mesh-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:TransformCase;native:{line:number;severity:number;services:number[][];snapshots:string[];final:string}}[]};
const hash=(b:Buffer)=>crypto.createHash('sha256').update(b).digest('hex');
const row=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return r;};
test('TransformObject -> LevelMesh -> Model matches every original memory snapshot and saved root prefix',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 for(const r of fixture.cases){const a=evaluateTransformObject(r.input,r.native.services);assert.deepEqual({...a,snapshots:a.snapshots.map(hash),final:hash(a.final)},r.native,r.input.name);}
});
test('LevelMesh connection advances all 317 roots without replacing audio/Timeline/other target classes',()=>{
 const real=fixture.cases.filter(r=>r.input.source);assert.equal(real.length,317);assert.equal(real.filter(r=>r.native.line===0).length,250);assert.equal(real.filter(r=>r.native.line===0xfffffffe).length,12);assert.equal(real.filter(r=>r.native.line===0xfffffffd).length,55);
 assert.equal(real.filter(r=>r.native.services.some(s=>s[0]===61&&s[2]===1)).length,52);assert.equal(real.filter(r=>r.native.services.some(s=>s[0]===61&&s[2]===3)).length,3);
 for(const r of real){const a=evaluateTransformObject(r.input,r.native.services).snapshots[0];for(let i=0;i<r.input.nodes.length;i++)if(restoredLevelMesh(r.input.nodes[i])){const at=Number(transformEndpointAddress(r.input,i)-0x240000000n);assert.equal(a.readBigUInt64LE(at+0x228),0n);}}
});
test('Ordinary/deferred Model transform states participate in continuous TransformObject updates',()=>{
 const ordinary=row('level-mesh-flags-0-1-0-0-7'),deferred=row('level-mesh-flags-1-1-0-0-7');
 for(const [r,isDeferred] of [[ordinary,false],[deferred,true]] as const){const a=evaluateTransformObject(r.input,r.native.services).snapshots[3],at=Number(transformEndpointAddress(r.input,1)-0x240000000n),model=at+0xa60;assert.deepEqual(a.subarray(at+16,at+80),a.subarray(model+(isDeferred?0x240:0x160),model+(isDeferred?0x240:0x160)+64));assert.equal(a[model+(isDeferred?0x280:0x225)],1);assert.equal(a.readFloatLE(model+(isDeferred?0x240:0x160)+48),2.5);if(isDeferred)assert.equal(a.readFloatLE(model+0x160+48),0);}
});
