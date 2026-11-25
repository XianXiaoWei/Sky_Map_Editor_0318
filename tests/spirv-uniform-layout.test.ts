import test from 'node:test';
import assert from 'node:assert/strict';
import {packSpirvUniforms,type SpirvType} from '../src/core/spirv';
test('Cached uniform layouts preserve row-major padding, nested arrays and independent result buffers',()=>{
 const scalar:SpirvType={kind:'float',bytes:4},vector:SpirvType={kind:'vector',bytes:8,count:2,element:scalar};
 const block:SpirvType={kind:'struct',bytes:80,members:[{name:'matrix',offset:0,type:{kind:'matrix',bytes:32,count:3,stride:16,rowMajor:true,element:vector}},{name:'nested',offset:32,type:{kind:'struct',bytes:48,members:[{name:'points',offset:0,type:{kind:'array',bytes:32,count:2,stride:16,element:vector}},{name:'enabled',offset:32,type:{kind:'bool',bytes:4}}]}}]};
 const values={matrix:Float32Array.from([1,2,3,4,5,6]),nested:{points:[Float32Array.from([7,8]),[9,10]],enabled:true}};
 const first=packSpirvUniforms(block,values),second=packSpirvUniforms(block,values);
 assert.deepEqual(Array.from(new Float32Array(first.buffer).slice(0,16)),[1,3,5,0,2,4,6,0,7,8,0,0,9,10,0,0]);assert.equal(new DataView(first.buffer).getUint32(64,true),1);
 first.fill(255);assert.notDeepEqual(first,second);
 assert.throws(()=>packSpirvUniforms(block,{...values,nested:{...values.nested,points:[[7,8],[9]]}}),/分量数量/);
 assert.throws(()=>packSpirvUniforms(block,{...values,nested:{...values.nested,enabled:undefined}}),/SkyGlobals.nested.enabled/);
 assert.throws(()=>packSpirvUniforms(block,{...values,matrix:[1,2,NaN,4,5,6]}),/数值无效/);
});
