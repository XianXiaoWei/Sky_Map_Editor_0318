import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {crabNetworkCases,evaluateCrabNetwork,prepareCrabNetwork,type CrabNetworkCase} from '../tools/crab-network-cases';
import {receiveOriginalCrabBarn} from '../src/core/crab-network-runtime';
import evidence from '../docs/crab-network-native.json';

const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/crab-network-native.json.gz')).toString()) as {
 executableSha256:string;nativeArithmetic:number[][];cases:{input:CrabNetworkCase;nativeSha256:string}[];
};
for(const [mode,name] of [[0,'Crab snapshot'],[1,'CrabBarn receive'],[2,'CrabBarn send'],[3,'CrabBarn Update with receive'],[4,'CrabBarn Update with send']] as const){
 test('Original '+name+' preserves native state bytes, ownership, callbacks and timers',()=>{
  assert.equal(fixture.executableSha256,evidence.executableSha256);
  assert.equal(fixture.nativeArithmetic.length,16);
  const rows=fixture.cases.filter(row=>row.input.mode===mode);
  assert.equal(rows.length,crabNetworkCases().filter(c=>c.mode===mode).length);
  assert.ok(rows.some(row=>row.input.scratchFill===255),'retain nonzero caller scratch');
  for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateCrabNetwork(row.input,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
 });
}

test('Crab receive requires a decoded count instead of treating missing decoder output as zero',()=>{
 const {b,m}=prepareCrabNetwork({mode:1,label:'missing decoder output'});
 let calls=0;
 assert.throws(()=>receiveOriginalCrabBarn(m,0x440001000n,0x440003000n,0x440004000n,b.subarray(0x2d000,0x2d078),{
  count:(_stream,cell,minimum,maximum)=>{calls++;assert.equal(cell.value,undefined);assert.equal(minimum,0);assert.equal(maximum,3);},
  serialize:()=>assert.fail('Missing count must fail before state decoding'),
  snapshot:()=>assert.fail('Receive must not snapshot'),
 }),/must supply the decoded count/);
 assert.equal(calls,1);
});
