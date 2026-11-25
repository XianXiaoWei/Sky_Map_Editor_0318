import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/atmosphere-native.json';
import initial from './fixtures/ambience-initial-native.json';
import evidence from '../docs/ambience-initial-fields.json';
import { sampleSkyTints, sampleCheapFogTints, sampleAtmosphereRay, createAtmosphereRaySampler, type SkyTints, type AtmosphereRayInput } from '../src/core/atmosphere';
import { initialAmbienceFields } from '../src/core/ambience-initial';

test('Atmosphere colors and planet rays preserve original native float bits, including fog underflow NaNs',()=>{
  for(const c of fixture.cases) {
    const input=c.input as unknown as {colors:SkyTints;coordinate:number;sharpness:number;height:number} & AtmosphereRayInput;
    const output=c.kind==='sky'?sampleSkyTints(input.colors,input.coordinate,input.sharpness)
      :c.kind==='cheapFog'?sampleCheapFogTints(input.colors,input.coordinate,input.sharpness,input.height)
      :sampleAtmosphereRay({...input,tintLookup:new Float32Array(input.tintLookup)});
    assert.equal(Buffer.from(new Float32Array(output).buffer).toString('hex'),c.nativeHex,`${c.kind}: ${JSON.stringify(c.input)}`);
    if(c.kind!=='sky'&&c.kind!=='cheapFog'){
      const batch=createAtmosphereRaySampler({...input,tintLookup:new Float32Array(input.tintLookup)});
      for(let repeat=0;repeat<2;repeat++)assert.equal(Buffer.from(new Float32Array(batch(input.direction)).buffer).toString('hex'),c.nativeHex,'Prepared ray matches original native bytes');
    }
  }
});
test('Six initial Ambience field groups match original stores for both quality branches and explicit sun globals',()=>{
  for(const c of initial.cases) {
    const actual=initialAmbienceFields(c.color,c.quality),native=Buffer.from(c.nativeHex,'hex');
    for(const group of evidence.groups)for(const field of group.fields) {
      const start=group.offset+field.nativeOffset;
      assert.deepEqual(Buffer.from(actual.storage.subarray(start,start+field.bytes)),native.subarray(start,start+field.bytes),`${group.className}.${field.name}`);
    }
  }
});
