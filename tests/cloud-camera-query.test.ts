import test from 'node:test';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
import fixtures from './fixtures/cloud-camera-query-native.json';
import { AssetCatalog } from '../src/main/assets';
import { queryCloudCamera, cloudCameraNoiseTweaks } from '../src/core/cloud-avatar-query';
import type { CloudDistanceField } from '../src/core/cloud-volume';

test('Camera cloud query and noise-tweak lanes match original machine code on real noise bytes', () => {
 const noise=new AssetCatalog(process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data').cloudNoise();
 assert.equal(crypto.createHash('sha256').update(noise.data).digest('hex'),fixtures.noiseSha256);
 for(const c of fixtures.cases){
  let used=0,sineUsed=0;const positions=Buffer.alloc(112);
  const result=queryCloudCamera({distanceResolution:c.resolution} as CloudDistanceField,c.position,c.state,c.scroll,noise,()=>c.sines[sineUsed++],p=>{
   [...p,1].forEach((v,k)=>positions.writeFloatLE(v,used*16+k*4));return c.samples[used++];
  });
  const bytes=Buffer.alloc(16),tweaks=Buffer.alloc(16);
  [result.distance,...result.normal].forEach((v,i)=>bytes.writeFloatLE(v,i*4));
  cloudCameraNoiseTweaks(result.distance,c.state.radius).forEach((v,i)=>tweaks.writeFloatLE(v,i*4));
  assert.equal(bytes.toString('hex'),c.nativeHex,c.name);
  assert.equal(tweaks.toString('hex'),c.noiseTweaksHex,c.name);
  assert.equal(positions.toString('hex'),c.positionsHex,c.name);
  assert.equal(used,c.sampleCount,c.name);assert.equal(+result.available,c.available,c.name);
 }
});
