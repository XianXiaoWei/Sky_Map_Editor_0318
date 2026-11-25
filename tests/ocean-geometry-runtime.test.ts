import {test} from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {gunzipSync} from 'node:zlib';
import {buildOriginalOceanGeometry,type OceanGeometryInput} from '../src/core/ocean-geometry-runtime';
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/ocean-geometry-native.json.gz',import.meta.url))).toString()) as {cases:{input:OceanGeometryInput;indexCount:number;vertices:string}[];math:[string,number[]][]};
test('Original Ocean grid matches full native vertex buffers and visible index counts',()=>{
 const values=new Map(fixture.math),call=(kind:number,a:number,b=0)=>{const key=Buffer.alloc(12);key.writeUInt32LE(kind);key.writeFloatLE(a,4);key.writeFloatLE(b,8);const result=values.get(key.toString('hex'));assert.ok(result,'Arithmetic input must have been independently observed');return result;};
 for(const c of fixture.cases){const result=buildOriginalOceanGeometry(c.input,{rsqrt:n=>call(4,n)[0],asin:n=>call(1,n)[0],sincos:n=>{const q=call(2,n);return {sin:q[0],cos:q[1]};},pow:(n,e)=>call(3,n,e)[0]});assert.equal(result.indexCount,c.indexCount);assert.deepEqual(Buffer.from(result.vertices),Buffer.from(c.vertices,'base64'));assert.equal(result.indices.length,c.indexCount);assert.ok(result.indices.every(i=>i<96*96));}
});
