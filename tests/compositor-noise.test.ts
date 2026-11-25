import test from 'node:test';import assert from 'node:assert/strict';
import fixture from './fixtures/compositor-noise-native.json';
import {compositorRandomOffset,centeredTemporalCorners} from '../src/core/compositor-noise';
test('Compositor random conversion and centered CameraSystem taps match original instruction bytes',()=>{
 for(const c of fixture.cases){const u=centeredTemporalCorners(c.size[0],c.size[1]),bytes=Buffer.alloc(44);[...compositorRandomOffset(c.values),...u.u_aaCornerUvs0,...u.u_aaCornerUvs1].forEach((v,i)=>bytes.writeFloatLE(v,i*4));assert.equal(bytes.toString('hex'),c.nativeHex);}
 assert.throws(()=>compositorRandomOffset([0,-1,3]));assert.throws(()=>compositorRandomOffset([0,2**31,3]));assert.throws(()=>centeredTemporalCorners(0,100));
});
