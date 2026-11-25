import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {hardwareCloudSampling} from '../src/main/vulkan-cloud-sampling';

test('Hardware cloud filtering changes only the verified software sampler body and retains sparse-grid addressing',()=>{
 const source=fs.readFileSync('evidence/cloud-air-vulkan/CloudFluffy0.frag','utf8'),native=hardwareCloudSampling(source);
 const start=source.indexOf('vec4 air_sample3d('),end=source.indexOf('\n}',start)+2;
 assert.equal(native.slice(0,start),source.slice(0,start));assert.ok(native.endsWith(source.slice(end)));
 const body=native.slice(start,native.indexOf('\n}',start)+2);
 assert.equal((body.match(/texelFetch\(/g)??[]).length,1);assert.equal((body.match(/textureLod\(/g)??[]).length,1);
 assert.ok(body.includes('air_texel_coord(ivec3(floor(p)),size,repeat)'));assert.ok(body.includes('uv+vec3(offset)/vec3(size)'));
 assert.equal(hardwareCloudSampling('void main(){}'),'void main(){}');
 assert.throws(()=>hardwareCloudSampling('vec4 air_sample3d(){return vec4(0);}'),/版本不符/);
});
