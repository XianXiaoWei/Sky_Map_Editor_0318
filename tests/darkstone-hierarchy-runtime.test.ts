import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateDarkstoneHierarchy} from '../tools/darkstone-hierarchy-cases';
test('Original Darkstone geometry hierarchy matches QEMU memory, distance bits, call order and assertion writes',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/darkstone-hierarchy-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateDarkstoneHierarchy(row.input)).digest('hex'),row.nativeSha256,row.input.label);
});
test('Disconnected suffix is preserved and capacity failure follows the original parent write',()=>{
 const separate=evaluateDarkstoneHierarchy({label:'separate',seed:1,geometry:[{position:[0,0,0],extent:[1,1,1]},{position:[3,0,0],extent:[1,1,1]}]});
 assert.equal(separate.readUInt32LE(8+0x29000),1);
 assert.equal(separate.readUInt32LE(8+0x3324),0);
 assert.equal(separate.readUInt32LE(8+0x34a0),0xffffffff);
 const overflow=evaluateDarkstoneHierarchy({label:'capacity',seed:1,childCount:8,geometry:[{position:[0,0,0],extent:[1,1,1]},{position:[.5,0,0],extent:[1,1,1]}]});
 assert.equal(overflow.readUInt32LE(),1271);assert.equal(overflow.readUInt32LE(4),4);
 assert.equal(overflow.readUInt32LE(8+0x34a0),0);
 assert.equal(overflow.readUInt32LE(8+0x29000),1);
 assert.equal(overflow.readUInt32LE(8+0x3324),8);
});
