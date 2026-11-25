import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';
import { evaluateMarkerTransform, type MarkerTransformResult } from '../tools/marker-transform-evaluate';
import { markerBytes, matrixBytes, type MarkerTransformCase } from '../tools/marker-transform-cases';
import { getNativeMarkerTransform, getNativeMarkerTransformFromComponents, setNativeMarkerTransform, getNativeMarkerLocalObb, getNativeMarkerWorldObb, nativeIdentityMatrix, NativeMarkerArithmeticBoundary } from '../src/core/marker-transform-runtime';
import { NativeObjectFoundationFailure } from '../src/core/object-foundation-runtime';
import { railMarkerTransform } from '../src/core/rail';
const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync(new URL('./fixtures/marker-transform-native.json.gz',import.meta.url))).toString()) as {executableSha256:string;cases:{input:MarkerTransformCase;native:MarkerTransformResult}[]};
const row=(name:string)=>{const r=fixture.cases.find(r=>r.input.name===name);assert.ok(r,name);return r;};
const values=(hex:string)=>{const b=Buffer.from(hex,'hex');return Array.from({length:b.length/4},(_,i)=>b.readFloatLE(i*4));};
test('Marker byte transforms, factory reflection, OBB and lifecycle match the original executable corpus',()=>{
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 assert.equal(fixture.cases.filter(r=>r.input.source&&r.input.op===0).length,6538);
 assert.equal(fixture.cases.filter(r=>r.input.source&&r.input.op===1).length,6538);
 for(const r of fixture.cases)assert.deepEqual(evaluateMarkerTransform(r.input),r.native,r.input.name);
});
test('All four quaternion decomposition branches produce the original rotations',()=>{
 for(const [i,axis] of [[0,[0,0,0,1]],[1,[1,0,0,0]],[2,[0,1,0,0]],[3,[0,0,1,0]]] as const){
  const q=Buffer.from(row(`set-quat-${i}-scale-0`).native.marker,'hex').subarray(32,48);assert.deepEqual(values(q.toString('hex')).map(n=>n===0?0:n),axis);
 }
});
test('SetTransform stores nonnegative axis lengths and preserves translation W, scale padding and enabled',()=>{
 const r=row('factory-lifecycle-1'),before=Buffer.from(r.input.marker,'hex'),after=Buffer.from(r.native.marker,'hex');
 assert.equal(after.readFloatLE(28),11);assert.equal(after.readFloatLE(60),before.readFloatLE(60));assert.equal(after[64],1);
 assert.ok([48,52,56].every(i=>after.readFloatLE(i)>=0));
 assert.deepEqual(r.native.life,[1,0,2,0]);assert.equal(Buffer.from(r.native.reused,'hex').readUInt32LE(68),1);
 assert.deepEqual(r.native.services.filter(v=>v[0]===10).map(v=>v[2]),[0,1]);
});
test('Registered GetObb returns a local half box; world OBB and extents include Marker scale',()=>{
 const r=row('get-quat-0-scale-0');assert.equal(r.native.local,Buffer.from(getNativeMarkerLocalObb()).toString('hex'));
 assert.deepEqual(values(r.native.extents).slice(0,3),[1,1.5,2]);
 const w=values(r.native.world);assert.deepEqual([w[0],w[5],w[10],...w.slice(12)],[1,1.5,2,3,-4,5,1]);
 assert.equal(r.native.extents.slice(24),'a5a5a5a5');
});
test('Matrix padding NaNs assert before any Marker write, including signaling payloads',()=>{
 for(const r of fixture.cases.filter(r=>r.input.name.startsWith('nan-lane-'))){assert.equal(r.native.line,78);assert.equal(r.native.severity,3);assert.equal(r.native.marker,r.input.marker);}
 const b=markerBytes(),before=Buffer.from(b),m=Buffer.from(nativeIdentityMatrix());m.writeUInt32LE(0x7fa00001,60);
 assert.throws(()=>setNativeMarkerTransform(b,m),e=>e instanceof NativeObjectFoundationFailure&&e.line===78);assert.deepEqual(b,before);
});
test('Factory null, missing, case-sensitive and fallback paths retain identity defaults',()=>{
 for(const flags of [2,4,8,16]){const r=row(`factory-flags-${flags}`);assert.equal(r.native.marker,r.input.marker);assert.equal(r.native.transform,Buffer.from(nativeIdentityMatrix()).toString('hex'));assert.equal(r.native.local,r.native.transform);assert.deepEqual(values(r.native.extents).slice(0,3),[1,1,1]);}
 assert.equal(row('factory-flags-1').native.line,1091);
 assert.ok(row('factory-flags-32').native.services.filter(s=>s[0]===4).length>=2);
 for(const r of fixture.cases.filter(r=>r.input.name.includes('wrapper-count'))){assert.equal(r.native.line,573);assert.equal(r.native.marker,r.input.marker);}
});
test('Raw Buffer aliasing captures position before output and re-reads axes after input translation writes',()=>{
 for(const alias of [0,16]){const r=row(`get-alias-${alias}`);assert.deepEqual(values(r.native.transform).slice(12),[3,-4,5,1]);assert.equal(evaluateMarkerTransform(row(`set-alias-${alias}`).input).marker,row(`set-alias-${alias}`).native.marker);}
 assert.equal(row('get-wrapper-adjustment').native.line,0);assert.equal(row('set-wrapper-adjustment').native.line,0);
});
test('Finite-arithmetic boundaries stay explicit while Infinity translation itself is accepted',()=>{
 const b=markerBytes(),m=matrixBytes([1,0,0,0,0,1,0,0,0,0,1,0,Infinity,0,0,1]);setNativeMarkerTransform(b,m);assert.equal(new DataView(b.buffer,b.byteOffset,b.byteLength).getFloat32(16,true),Infinity);
 const overflow=matrixBytes([1e30,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]);assert.throws(()=>setNativeMarkerTransform(markerBytes(),overflow),NativeMarkerArithmeticBoundary);
 assert.throws(()=>getNativeMarkerWorldObb(b),NativeMarkerArithmeticBoundary);
});
test('Rail and Avatar Marker component adapter uses the verified byte kernel on every saved Marker',()=>{
 for(const r of fixture.cases.filter(r=>r.input.source&&r.input.op===0)){
  const b=Buffer.from(r.input.marker,'hex'),ns=[16,32,48].map(at=>Array.from({length:4},(_,i)=>b.readFloatLE(at+i*4))),marker={position:ns[0],quaternion:ns[1],scale:ns[2]};
  const converted=matrixBytes(railMarkerTransform(marker));assert.equal(converted.toString('hex'),r.native.transform,r.input.name);
  assert.deepEqual(getNativeMarkerTransformFromComponents(marker),railMarkerTransform(marker));
 }
});
