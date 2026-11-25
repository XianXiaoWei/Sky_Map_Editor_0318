import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/visibility-raster-native.json';
import {rasterVisibilityTriangles,qemuVisibilityMin} from '../src/core/visibility-raster';
import {qemuVisibilityReciprocal} from '../src/core/visibility-transform';

function floats(hex:string) {const input=Buffer.from(hex,'hex'),output=new Float32Array(input.length/4);new Uint8Array(output.buffer).set(input);return output;}
function uints(hex:string) {const input=Buffer.from(hex,'hex'),output=new Uint32Array(input.length/4);new Uint8Array(output.buffer).set(input);return output;}
function indices(hex:string) {const input=Buffer.from(hex,'hex'),output=new Uint16Array(input.length/2);new Uint8Array(output.buffer).set(input);return output;}

test('Visibility original four-triangle batches, diversion and every tiled depth/guard word match native',()=>{
  for(const c of fixture.cases) {
    const depth=floats(c.depthHex),selected=uints(c.selectedHex),list=c.enabled?{triangles:selected,count:c.selectedCount}:null,source=indices(c.indicesHex);
    rasterVisibilityTriangles(depth,c.width,c.height,floats(c.verticesHex),source,source.length,list,qemuVisibilityReciprocal,qemuVisibilityMin);
    assert.equal(list?.count??c.selectedCount,c.expectedCount,c.name);
    assert.equal(Buffer.from(selected.buffer).toString('hex'),c.expectedSelectedHex,c.name);
    assert.equal(Buffer.from(depth.buffer).toString('hex'),c.expectedDepthHex,c.name);
  }
});

test('Visibility requires enough neighboring memory for an odd logical raster before any writes',()=>{
  const depth=new Float32Array(31*3+32).fill(1),before=depth.slice();
  assert.throws(()=>rasterVisibilityTriangles(depth,31,3,new Float32Array(16),new Uint16Array(12),12,null,qemuVisibilityReciprocal,qemuVisibilityMin));
  assert.deepEqual(depth,before);
  assert.throws(()=>rasterVisibilityTriangles(new Float32Array(100),4,4,new Float32Array(4),new Uint16Array(12).fill(1),12,null,qemuVisibilityReciprocal,qemuVisibilityMin));
});
