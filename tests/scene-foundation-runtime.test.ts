import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateSceneFoundation,prepareSceneFoundation} from '../tools/scene-foundation-cases';
import {OriginalSceneTransformEndpoint,OriginalParentEndpoint} from '../src/core/scene-foundation-runtime';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
const fixture=()=>JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/scene-foundation-native.json.gz')).toString());

test('Scene foundation constructors/transform/bounds/enabled/HotDate preserve all native byte snapshots and alias/service order',()=>{
 for(const c of fixture().cases)assert.equal(sha(evaluateSceneFoundation(c.input)),c.nativeSha256,c.input.label);
});
test('Scene logic endpoints write the same live foundation storage and retain native transform/bound results',()=>{
 const cases=fixture().cases;
 for(const kind of ['TerrainBlob','CameraKeyFrame'] as const){
  const c=cases.find((c:any)=>c.input.kind===kind&&c.input.operation==='setTransform'&&c.input.label.startsWith('prepared/')&&c.input.sourceOffset===0x600),p=prepareSceneFoundation(c.input);
  const endpoint=new OriginalSceneTransformEndpoint(12,p.base+0x100n,kind,p.m);endpoint.setTransform(p.m.bytes(p.base+BigInt(p.source),64));
  assert.equal(sha(Buffer.concat([Buffer.alloc(32),p.b])),c.nativeSha256,kind+' same live address');assert.deepEqual(Buffer.from(endpoint.getTransform()),p.b.subarray(0x110,0x150));
 }
 const c=cases.find((c:any)=>c.input.kind==='Parent'&&c.input.operation==='setEnabled'&&c.input.enabled===255),p=prepareSceneFoundation(c.input),endpoint=new OriginalParentEndpoint(13,p.base+0x100n,p.m);
 endpoint.setEnabled(255);assert.equal(endpoint.getEnabled(),255);assert.equal(sha(Buffer.concat([Buffer.alloc(32),p.b])),c.nativeSha256);
});
