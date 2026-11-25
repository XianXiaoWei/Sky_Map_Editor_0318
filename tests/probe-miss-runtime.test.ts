import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/probe-miss-native.json';
import {originalProbeMissDirection,previewProbeCubeDirection} from '../src/core/probe-miss-runtime';
import {previewProbeMissRsqrt} from '../src/core/probe-miss-capability';
import {sampleAtmosphereRay} from '../src/core/atmosphere';
import {skyProbe} from '../src/main/vulkan-baked';
import {probeUniforms} from '../src/core/probe';
const floats=(hex:string)=>{const b=Buffer.from(hex,'hex');return Array.from({length:b.length/4},(_,i)=>b.readFloatLE(i*4));};
const bits=(v:number)=>{const b=Buffer.alloc(4);b.writeFloatLE(v);return b.readUInt32LE();};
for(const [i,c] of fixture.cases.entries())test(`Original probe miss native fixture ${i}`,()=>{
 const direction=originalProbeMissDirection(floats(c.directionBits),previewProbeMissRsqrt),native=floats(c.nativeDirectionHex);
 direction.slice(0,3).forEach((v,k)=>{if(Number.isNaN(native[k]))assert.ok(Number.isNaN(v));else assert.equal(bits(v),bits(native[k]));});
 if(direction.every(Number.isFinite)){
  const actual=sampleAtmosphereRay({...fixture.input,direction,tintLookup:Float32Array.from(fixture.input.tintLookup)}),color=floats(c.nativeColorHex);
  actual.slice(0,3).forEach((v,k)=>assert.equal(bits(v),bits(color[k])));
 }
});
test('Every production cube ray has an observed original miss capability and downward rays sample the horizon',()=>{
 for(let face=0;face<6;face++)for(let y=0;y<32;y++)for(let x=0;x<32;x++){
  const input=previewProbeCubeDirection(face,x,y),output=originalProbeMissDirection(input,previewProbeMissRsqrt);
  assert.ok(output.every(Number.isFinite));assert.ok(output[1]>=0);
  if(input[1]<0)assert.equal(output[1],0);
  assert.ok(Math.abs(Math.hypot(...output.slice(0,3))-1)<2e-7);
 }
 assert.throws(()=>previewProbeMissRsqrt(0x12345678),/Unobserved/);
});
test('Production sky probe uses original miss directions, preventing underground radiance from reaching LitAlpha',()=>{
 const p=fixture.input;
 const environment={sphere:p.planetSphere,direction:p.sunDirection.slice(0,3),sunColor:p.sunColor,average:p.averageSkyboxColor,atmosphereSunColor:p.atmosphereSunColor,atmosphereSample:p.atmosphereSample,lut:Float32Array.from(p.tintLookup),values:{AmbienceSky:{atmosphereDensity:p.atmosphereDensity}}};
 const probe=skyProbe(environment as unknown as Parameters<typeof skyProbe>[0],p.eye.slice(0,3));
 assert.ok(probe.uniforms.u_averageProbeColor.every(v=>v>0&&v<20));
 // Keep the original SH flush convention. Fixing the input must not rescale
 // its native integrated-radiance uniform to a guessed average.
 const sh=Float32Array.from([1,2,3,...Array(24).fill(0)]);
 assert.deepEqual(probeUniforms(sh).u_averageProbeColor,Array.from(sh.slice(0,3),v=>Math.fround(v*Math.fround(3.544907808303833))));
});
