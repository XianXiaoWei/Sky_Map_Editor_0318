import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import crypto from 'node:crypto';import {gunzipSync} from 'node:zlib';
import {evaluateDarkstone} from '../tools/darkstone-cases';
test('SoulTrap whole Load, Darkstone/SoulTrap allocation and child IDs match original memory, calls and assertion writes',()=>{
 const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/darkstone-native.json.gz')).toString());
 assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.equal(fixture.cases.filter((row:any)=>row.input.levelName).length,49);
 for(const row of fixture.cases)assert.equal(crypto.createHash('sha256').update(evaluateDarkstone(row.input)).digest('hex'),row.nativeSha256,JSON.stringify(row.input));
});
test('Plant hierarchy has distinct contiguous records, shared collectible, root-only amount and native depth fade',()=>{
 const out=evaluateDarkstone({mode:3,seed:7,count:0,members:3,hierarchy:true,rootKillable:1,level:2,guid:0x12345678,collectible:true});
 assert.equal(out.readBigUInt64LE(16+0x1040),0x440003220n);assert.equal(out.readUInt32LE(16+0x1d220),3);
 for(let i=0;i<3;i++){const at=16+0x3220+i*0x1a0;assert.equal(out.readUInt32LE(at+32),i);assert.equal(out.readBigUInt64LE(at+0x170),0x440052000n);assert.equal(out.readUInt32LE(at+0x18c),0x12345678);assert.equal(out.readUInt32LE(at+0x188),i?0:6);assert.equal(out.readFloatLE(at+0x108),Math.fround(1-Math.fround(i/3)));}
});
test('SoulTrap allocations commit before metadata/contiguity failures and stop before final state reset',()=>{
 const failed=evaluateDarkstone({mode:3,seed:1,count:0,members:2,castFailure:true});assert.equal(failed.readUInt32LE(),71);assert.equal(failed.readUInt32LE(16+0x1d220),1);
 const gap=evaluateDarkstone({mode:3,seed:1,count:0,members:3,nonContiguous:true});assert.equal(gap.readUInt32LE(),314);assert.equal(gap.readUInt32LE(4),4);assert.equal(gap.readUInt32LE(16+0x1d220),3);
});
