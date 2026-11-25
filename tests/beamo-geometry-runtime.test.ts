import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {prepareBeamoGeometryInput,evaluatePreparedBeamoGeometry} from '../src/core/beamo-geometry-adapter';
import {evaluateBeamoBarnUpload} from '../tools/beamo-upload-barn-cases';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');

test('Beamo native geometry snapshots cover boundary inputs and every real resource/bake/material/moss combination',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-upload-native.json.gz')).toString()),fallback=Buffer.from(fixture.fallback,'base64'),seen=new Set<string>();let checked=0;
 for(const c of fixture.cases){
  const input=c.input,key=[input.resourceKey,input.bake,input.secondary,input.autoMoss,!!input.culled].join('/');
  if(!input.label.startsWith('prepared/')&&seen.has(key))continue;seen.add(key);
  const pairs=Buffer.from(c.rsqrtPairs,'base64');let next=0;
  const result=evaluatePreparedBeamoGeometry(prepareBeamoGeometryInput(input,fixture.resources[input.resourceKey]),fallback,bits=>{
   assert.ok(next*8<pairs.length,input.label+' missing native capability');assert.equal(bits,pairs.readUInt32LE(next*8),input.label+' normal sum bits');return pairs.readUInt32LE(next++*8+4);
  });
  assert.equal(next*8,pairs.length,input.label+' unused native capability');assert.equal(sha(result.snapshot),c.nativeSha256,input.label);checked++;
 }
 assert.ok(checked>=560,'All original geometry resources must be exercised');
});

test('Barn all-LOD upload scheduler retains native ranges, unsigned totals, sphere payloads and callback mutation order',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-upload-barn-native.json.gz')).toString());
 for(const c of fixture.cases)assert.equal(sha(evaluateBeamoBarnUpload(c.input)),c.nativeSha256,c.input.label);
});
