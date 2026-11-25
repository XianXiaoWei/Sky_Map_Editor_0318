import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import crypto from 'node:crypto';
import {gunzipSync} from 'node:zlib';
import {crabCodecCases,evaluateCrabCodec,prepareCrabCodec,type CrabCodecCase} from '../tools/crab-codec-cases';
import {serializeOriginalBinaryPlayerId} from '../src/core/binary-stream-runtime';
import evidence from '../docs/crab-codec-native.json';
const fixture=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/crab-codec-native.json.gz')).toString()) as {executableSha256:string;nativeArithmetic:number[][];cases:{input:CrabCodecCase;nativeSha256:string}[];};
for(const [mode,name] of [[0,'whole Crab state field codec'],[1,'Crab encoded packet round trip'],[2,'CrabBarn send through actual codec'],[3,'CrabBarn send/receive through actual codec'],[4,'BinaryStream bit writer'],[5,'BinaryStream bit reader'],[6,'BinaryStream pivot quantization'],[7,'BinaryStream bounded integers'],[8,'PlayerId context and actual player Barn mappings']] as const){
 test('Original '+name+' matches native buffers, cursors, fields and failures',()=>{
  assert.equal(fixture.executableSha256,evidence.executableSha256);assert.equal(fixture.nativeArithmetic.length,16);
  const rows=fixture.cases.filter(row=>row.input.mode===mode);assert.ok(rows.length>0);
  assert.equal(rows.length,crabCodecCases().filter(c=>c.mode===mode).length);
  for(const row of rows)assert.equal(crypto.createHash('sha256').update(evaluateCrabCodec(row.input,fixture.nativeArithmetic)).digest('hex'),row.nativeSha256,row.input.label);
 });
}
test('Failed context-2 PlayerId decoding requires explicit private scratch and retains the caller value',()=>{
 const c:CrabCodecCase={mode:8,label:'failed read scratch',write:0,context:2,capacity:0};
 const first=prepareCrabCodec(c);assert.throws(()=>serializeOriginalBinaryPlayerId(first.m,0x440003000n,0x44002e100n),/private scratch byte/);
 const second=prepareCrabCodec(c);serializeOriginalBinaryPlayerId(second.m,0x440003000n,0x44002e100n,2);
 assert.equal(second.b[0x3008],0);assert.equal(second.b.readUInt32LE(0x2e100),11);
});
