import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateParentBarn,prepareParentBarn} from '../tools/parent-barn-cases';import {createOriginalParent,releaseOriginalParent,resetOriginalParentBarn,findOriginalParentsByTarget} from '../src/core/parent-barn-runtime';import {OriginalParentEndpoint} from '../src/core/scene-foundation-runtime';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
test('ParentBarn native pool lifecycle snapshots preserve full slot bytes and live callback read order',()=>{
 const f=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/parent-barn-native.json.gz')).toString());assert.equal(f.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');let real=0;
 for(const c of f.cases){assert.equal(sha(evaluateParentBarn(c.input)),c.nativeSha256,c.input.label);if(!c.input.label.startsWith('prepared/'))real++;}assert.equal(real,540);
});
test('Parent pool create and release operate on the existing live enabled endpoint and preserve untouched target/name descriptors',()=>{
 const {m,base}=prepareParentBarn({label:'integration',mode:0,active:[],longNames:[],enabledBits:2,targets:Array(128).fill(0x6500)}),s={ensureObjectMeta:()=>{},parentClassId:()=>73,beginReset:()=>{},stringAllocator:()=>base+0x7000n,freeString:()=>{},removeNode:()=>{}};
 resetOriginalParentBarn(m,base,s);const address=createOriginalParent(m,base,s),endpoint=new OriginalParentEndpoint(17,address,m);assert.equal(address,base+16n);assert.equal(m.read32(address),73);assert.equal(endpoint.getEnabled(),2);
 endpoint.setEnabled(255);assert.equal(m.bytes(address+24n,1)[0],255);const target=m.read64(address+8n);releaseOriginalParent(m,base,address,s);assert.equal(endpoint.getEnabled(),0);assert.equal(m.read64(address+8n),target);assert.equal(m.bytes(address+0x89n,1)[0],0);assert.equal(m.read64(base+0x4810n),address);
 // Inactive records still participate in the original target lookup.
 assert.equal(findOriginalParentsByTarget(m,base,target,base+0x6800n),128);assert.equal(m.read64(base+0x6800n),address);const recreated=createOriginalParent(m,base,s);assert.equal(recreated,address);assert.equal(endpoint.getEnabled(),0);assert.equal(m.bytes(address+0x89n,1)[0],1);
});
