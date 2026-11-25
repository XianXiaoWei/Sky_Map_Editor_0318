import test from 'node:test';
import assert from 'node:assert/strict';
import { createHash } from 'node:crypto';
import fixture from './fixtures/probe-native.json';
import { reduceProbe, packProbeHalf } from '../src/core/probe';
import { vulkanProbeBindings } from '../src/main/vulkan-probe';
import { vulkanTextureDataBytes } from '../src/core/vulkan-protocol';

function nativeCase() {
  const bytes=Buffer.from(fixture.state.historyBase64,'base64'), history=new Float32Array(bytes.length/4);
  history.forEach((_,i)=>history[i]=bytes.readFloatLE(i*4));
  return reduceProbe({history,sh:new Float32Array(fixture.state.sh)},
    {coordinates:new Float32Array(fixture.samples.coordinates),directions:new Float32Array(fixture.samples.directions),colors:new Float32Array(fixture.samples.colors)},fixture.hardware);
}
test('Probe history, spherical harmonics, seam filtering and half bytes match the native captured result',()=>{
  const actual=nativeCase(),sha=(data:Uint8Array)=>createHash('sha256').update(data).digest('hex');
  assert.equal(Buffer.from(actual.sh.buffer).toString('hex'),fixture.shHex);
  assert.equal(sha(new Uint8Array(actual.cube.buffer)),fixture.cubeSha256);
  assert.equal(sha(new Uint8Array(actual.half.buffer)),fixture.halfSha256);
});
test('Probe half conversion retains original F16C rounding versus software/tail truncation',()=>{
  const values=new Float32Array([1+3/2048,-0,65520,2**-25,1+3/2048]);
  assert.deepEqual(Array.from(packProbeHalf(values,true)),[0x3c02,0x8000,0x7c00,0,0x3c01]);
  assert.deepEqual(Array.from(packProbeHalf(values,false)),[0x3c01,0x8000,0x7bff,0,0x3c01]);
});
test('Probe material binding preserves quantized RGBA16F bytes, all six mips and registered uniform names',()=>{
  const reduced=nativeCase(), bindings=vulkanProbeBindings({...reduced,center:[1,2,3],sampler:{linear:true,repeat:false}});
  assert.equal(bindings.textures.u_probeCube.data.byteLength,vulkanTextureDataBytes([32,32,6],3,7,6));
  assert.deepEqual(bindings.textures.u_probeCube.data,new Uint8Array(reduced.half.buffer));
  assert.equal(bindings.textures.u_probeCube.format,'rgba16f');
  assert.deepEqual(bindings.uniforms.u_probeShRGB2,Array.from(reduced.sh.subarray(24)));
  assert.equal(bindings.uniforms.u_averageProbeColor.length,3);
});
