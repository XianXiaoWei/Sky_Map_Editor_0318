import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/visibility-submit-native.json';
import {submitVisibilityGeometry,type VisibilityScratchStage} from '../src/core/visibility-submit';
import {qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {qemuVisibilityMin} from '../src/core/visibility-raster';
import {visibilityFloatFromBits as fromBits} from '../src/core/visibility-float';

test('Visibility complete numeric submit chain matches original consecutive calls, allocations and depth',()=>{
  for(const c of fixture.cases) {
    const input=Buffer.from(c.initialDepthHex,'hex'),depth=new Float32Array(input.length/4);new Uint8Array(depth.buffer).set(input);
    const allocations:{memory:Uint8Array;stage:VisibilityScratchStage;bytes:number}[]=[],freed:VisibilityScratchStage[]=[];
    submitVisibilityGeometry(depth,c.width,c.height,Buffer.from(c.verticesHex,'hex'),c.verticesHex.length/32,Uint16Array.from(c.indices),c.indices.length,c.matrix,
      {allocate(bytes,alignment,stage){const memory=new Uint8Array(bytes).fill(0xef);allocations.push({memory,stage,bytes});return memory;},free(memory,stage){freed.push(stage);}},qemuVisibilityReciprocal,qemuVisibilityMin);
    assert.deepEqual(freed,['clippedIndices','clippedVertices','selected','transformed'],c.name);
    assert.equal(allocations[1].bytes,Math.floor(c.indices.length/48)*4,c.name);
    const checks=[{actual:Buffer.from(depth.buffer),expected:Buffer.from(c.expectedDepthHex,'hex'),stage:'depth',float:true},...c.allocations.map((a,i)=>{
      assert.equal(a.bytes,allocations[i].bytes,c.name);assert.equal(a.freed,1,c.name);
      return {actual:Buffer.from(allocations[i].memory),expected:Buffer.from(a.hex,'hex'),stage:allocations[i].stage,float:i===0||i===2};
    })];
    for(const check of checks) {
      assert.equal(check.actual.length,check.expected.length,c.name);
      for(let i=0;i<check.expected.length;i+=check.float?4:2) {
        if(check.stage==='transformed'&&i%16===12)continue;
        const expected=check.float?check.expected.readUInt32LE(i):check.expected.readUInt16LE(i),actual=check.float?check.actual.readUInt32LE(i):check.actual.readUInt16LE(i);
        assert.ok(expected===actual||check.float&&Number.isNaN(fromBits(expected))&&Number.isNaN(fromBits(actual)),`${c.name} ${check.stage}/${i}`);
      }
    }
  }
});
