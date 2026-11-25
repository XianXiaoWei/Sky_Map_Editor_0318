import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/visibility-native.json';
import {visibilityFloatBits as bits, visibilityFloatFromBits as fromBits, visibilityAdd, visibilitySub, visibilityMul, visibilityDiv, visibilitySqrt, qemuVisibilityMax} from '../src/core/visibility-float';
import {transformVisibilityVertices,qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {visibilityMipLayout,reduceVisibilityDepthMips} from '../src/core/visibility-depth';

test('Visibility RTZ/FTZ/DAZ arithmetic matches native SSE, retaining tiny opposite-sign sticky operands',()=>{
  for(const c of fixture.math) {
    const [a,b]=c.inputBits.map(fromBits);
    const result=[visibilityAdd(a,b),visibilitySub(a,b),visibilityMul(a,b),visibilityDiv(a,b),visibilitySqrt(a),qemuVisibilityMax(a,b),qemuVisibilityReciprocal.rcp(a)];
    c.outputBits.forEach((expected,i)=>assert.ok(bits(result[i])===expected || Number.isNaN(result[i])&&Number.isNaN(fromBits(expected)),`input ${c.inputBits} operation ${i}`));
  }
  assert.equal(bits(visibilitySub(1,2**-126)),0x3f7fffff);
  assert.equal(bits(visibilityAdd(-1,2**-126)),0xbf7fffff);
});

test('Visibility original xyz transformation matches SIMD/scalar tails and keeps API W untouched',()=>{
  for(const c of fixture.transforms) {
    const output=new Float32Array(c.count*4);new Uint8Array(output.buffer).set(Buffer.from(c.initialHex,'hex'));
    transformVisibilityVertices(Buffer.from(c.verticesHex,'hex'),c.count,c.matrix,output,qemuVisibilityReciprocal);
    for(let i=0;i<c.count;i++) {
      for(let j=0;j<3;j++){const expected=c.expectedXyzBits[i*3+j],value=output[i*4+j];assert.ok(bits(value)===expected||Number.isNaN(value)&&Number.isNaN(fromBits(expected)),`${c.name} ${i}/${j}`);}
      assert.equal(bits(output[i*4+3]),c.unchangedW[i],`${c.name} W ${i}`);
    }
  }
});

test('Visibility mip reduction matches every native word including padding, neighboring layers and guards',()=>{
  for(const c of fixture.mips) {
    const input=Buffer.from(c.initialHex,'hex'),output=new Float32Array(input.length/4);new Uint8Array(output.buffer).set(input);
    reduceVisibilityDepthMips(output,c.widths,c.heights,qemuVisibilityMax);
    assert.equal(Buffer.from(output.buffer).toString('hex'),c.expectedHex,c.name);
  }
});

test('Visibility Resize layout matches original integer padding and independently halved float dimensions',()=>{
  for(const c of fixture.layouts) {
    const actual=visibilityMipLayout(c.viewport[0],c.viewport[1]);
    assert.equal(actual.length,c.count);
    assert.deepEqual([actual.map(m=>m.width),actual.map(m=>m.height),actual.map(m=>bits(m.logicalWidth)),actual.map(m=>bits(m.logicalHeight))],c.arrays);
    let offset=0;for(const m of actual){assert.equal(m.offset,offset);offset+=m.width*m.height;}
  }
});

test('Visibility snapshot APIs reject incomplete ranges before writing',()=>{
  assert.throws(()=>transformVisibilityVertices(new Uint8Array(64),4,[],new Float32Array(16),qemuVisibilityReciprocal));
  assert.throws(()=>transformVisibilityVertices(new Uint8Array(63),4,new Float32Array(16),new Float32Array(16),qemuVisibilityReciprocal));
  assert.throws(()=>reduceVisibilityDepthMips(new Float32Array(4),[2],[2],qemuVisibilityMax));
  assert.throws(()=>reduceVisibilityDepthMips(new Float32Array(100),[6,2],[6,4],qemuVisibilityMax));
  assert.throws(()=>visibilityMipLayout(-1,800));
});
