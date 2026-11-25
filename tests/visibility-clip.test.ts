import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/visibility-clip-native.json';
import {clipVisibilityTriangles} from '../src/core/visibility-clip';
import {visibilityFloatFromBits as fromBits} from '../src/core/visibility-float';

test('Visibility homogeneous clipping, overflow rejection and triangle padding match original numeric function',()=>{
  for(const c of fixture.cases) {
    const initial=Buffer.from(c.initialHex,'hex'),vertices=new Float32Array(initial.length/4);new Uint8Array(vertices.buffer).set(initial);
    const indices=Uint16Array.from(c.initialIndices);
    const result=clipVisibilityTriangles(Buffer.from(c.verticesHex,'hex'),Uint16Array.from(c.indices),Uint32Array.from(c.selected),c.selected.length,c.matrix,vertices,indices);
    assert.equal(result.vertexCount,c.vertexCount,c.name);assert.equal(result.indexCount,c.indexCount,c.name);
    const native=Buffer.from(c.outputHex,'hex'),bits=new Uint32Array(vertices.buffer);
    for(let i=0;i<bits.length;i++){const expected=native.readUInt32LE(i*4);assert.ok(bits[i]===expected||Number.isNaN(vertices[i])&&Number.isNaN(fromBits(expected)),`${c.name} slot ${i}`);}
    assert.deepEqual(Array.from(indices),c.outputIndices,c.name);
  }
});

test('Visibility clipped quad emits two triangles and a zero vertex to fill the four-triangle raster batch',()=>{
  const c=fixture.cases.find(c=>c.name==='sign-pattern-8-0-0')!;
  assert.ok(c);assert.equal(c.indexCount,12);
  const initial=Buffer.from(c.initialHex,'hex'),vertices=new Float32Array(initial.length/4);new Uint8Array(vertices.buffer).set(initial);
  const indices=Uint16Array.from(c.initialIndices);
  const result=clipVisibilityTriangles(Buffer.from(c.verticesHex,'hex'),Uint16Array.from(c.indices),Uint32Array.from(c.selected),c.selected.length,c.matrix,vertices,indices);
  assert.equal(result.vertexCount,5);assert.deepEqual(Array.from(indices.subarray(0,12)),[0,1,2,2,3,0,4,4,4,4,4,4]);
  assert.deepEqual(Array.from(vertices.subarray(16,20)),[0,0,0,0]);
});
