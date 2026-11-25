import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';import crypto from 'node:crypto';
import {evaluateLevelMesh,type LevelMeshResult} from '../tools/level-mesh-evaluate';import type {LevelMeshCase} from '../tools/level-mesh-cases';
import {NativeLevelMeshDependencyBoundary,getOriginalLevelMeshLocalObb} from '../src/core/level-mesh-runtime';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/level-mesh-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:LevelMeshCase;native:LevelMeshResult}[]};
const row=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return r;};const run=(name:string)=>evaluateLevelMesh(row(name).input);const hash=(hex:string)=>crypto.createHash('sha256').update(Buffer.from(hex,'hex')).digest('hex');
test('LevelMesh constructor/state/reflection and all 4133 saved matrices/GUIDs match original bytes',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(new Set(fixture.cases.filter(r=>r.input.source).map(r=>`${r.input.source!.level}:${r.input.source!.node}`)).size,4133);
 for(const r of fixture.cases){const actual=evaluateLevelMesh(r.input);assert.deepEqual({...actual,memory:hash(actual.memory)},r.native,r.input.name);}
});
test('LevelMesh constructor retains the saved transform/GUID/enable/Model pointer and links all 16 parameter bodies',()=>{
 const r=Buffer.from(run('constructor-165').memory,'hex');for(const at of [16,80,208,0x228])assert.equal(r[at],0xa5);assert.equal(r.readBigUInt64LE(),0x100c16970n);assert.equal(r.readUInt32LE(8),16);assert.equal(r.readFloatLE(0xfc),Math.fround(-9.81));assert.equal(r[0xa55],0);
 for(let i=0;i<16;i++){assert.equal(r.readBigUInt64LE(0x1a0+i*8),0x240000230n+BigInt(i*0x80));assert.equal(r.readUInt32LE(0x230+i*0x80),17);}
});
test('Mesh GetTransform selects the Model ordinary/deferred matrix, with saved matrix fallback for null Model',()=>{
 for(const [name,x] of [['model-null-1',3],['model-0-1',20],['model-1-1',30],['model-255-1',30]] as const)assert.equal(Buffer.from(run(name).memory,'hex').readFloatLE(0x1930),x);
 const normal=Buffer.from(run('model-0-2').memory,'hex'),deferred=Buffer.from(run('model-1-2').memory,'hex');assert.equal(normal.readFloatLE(0x1190),7);assert.equal(normal[0x1225],1);assert.equal(deferred.readFloatLE(0x1270),7);assert.equal(deferred.readFloatLE(0x1190),20);assert.equal(deferred[0x1280],1);
});
test('Disable propagates to Model enabled/visible/reset fields and sets a sticky mesh latch',()=>{
 const disabled=Buffer.from(run('model-0-6').memory,'hex');assert.equal(disabled[208],0);assert.equal(disabled[0x1228],0);assert.equal(disabled[0x1227],0);assert.equal(disabled[0x13c0],0);assert.equal(disabled[0xa55],1);
 const reflected=run('model-0-3'),b=Buffer.from(reflected.memory,'hex');assert.equal(b[208],1);assert.equal(b[0x1228],1);assert.equal(b[0x1227],0);assert.equal(b[0xa55],1);assert.deepEqual(reflected.services.filter(s=>s[0]===9).map(s=>s[2]),[0,0]);
 assert.deepEqual(run('model-null-3').services.filter(s=>s[0]===9).map(s=>s[2]),[0,1]);assert.equal(run('enabled-null-255').result,255);
});
test('Model local OBB and world transform remain distinct and a missing Model stays an explicit boundary',()=>{
 const local=Buffer.from(run('model-0-9').memory,'hex'),world=Buffer.from(run('model-0-4').memory,'hex');assert.equal(local.readFloatLE(0x1970),0);assert.equal(world.readFloatLE(0x19b0),20);assert.equal(run('model-null-9').line,0xfffffffd);
 const b=Buffer.alloc(0xa60),m={bytes:(_p:bigint,n:number)=>b.subarray(0,n),read8:()=>0,write8:()=>{},read64:()=>0n};assert.throws(()=>getOriginalLevelMeshLocalObb(m,0n),NativeLevelMeshDependencyBoundary);
});
test('Raw LevelMesh transform forwarding preserves every NaN/Infinity/signed-zero bit without Marker validation',()=>{
 for(const r of fixture.cases.filter(r=>r.input.name.startsWith('raw-special-'))){const before=Buffer.from(r.input.memory,'hex'),after=Buffer.from(evaluateLevelMesh(r.input).memory,'hex');assert.deepEqual(after.subarray(16,80),before.subarray(0x1800,0x1840));assert.deepEqual(after.subarray(0x1160,0x11a0),before.subarray(0x1800,0x1840));}
});
test('Matrix reflection enforces original argument counts before conversion or mutation',()=>{
 for(const r of fixture.cases.filter(r=>r.input.name.startsWith('wrapper-'))){const valid=r.input.op===5?r.input.argCount===1:r.input.argCount===0;assert.equal(r.native.line,valid?0:573);if(!valid)assert.equal(hash(r.input.memory),r.native.memory);}
});
