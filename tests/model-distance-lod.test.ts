import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import zlib from 'node:zlib';
import {selectOriginalModelDistanceLod,setOriginalModelLodDistance,originalModelClosestObbPoint,originalModelLodDistance} from '../src/core/model-distance-lod';
import {selectOriginalBeamoDistanceLod} from '../src/core/beamo-distance-lod';
test('Original LOD selector, threshold setter and closest OBB agree with native x64 output',()=>{
 const fixture=JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/model-distance-lod-native.json.gz')).toString());assert.equal(fixture.executableSha256,'3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20');assert.ok(fixture.cases.length>600);
 for(const {input,native} of fixture.cases){const distances=Float32Array.from(input.distances),selected=input.mode===0?selectOriginalModelDistanceLod(distances,input.distance,!!input.enabled):{index:input.mode===3?selectOriginalBeamoDistanceLod(distances.length,Array.from(distances),[0,1,2].map(i=>input.enabled>>i&1),input.distance):0,continuous:0};if(input.mode===1)setOriginalModelLodDistance(distances,input.enabled,input.distance);const nearest=originalModelClosestObbPoint(input.point,input.obb);assert.deepEqual({...selected,distances:Array.from(distances),inside:nearest.inside,point:nearest.point},native);}
});
test('Camera inside a large model retains its near LOD and narrow FOV retains detail',()=>{
 const obb=[50,0,0,0,0,20,0,0,0,0,10,0,100,0,0,1];assert.equal(originalModelLodDistance([60,0,0],obb),0);assert.equal(originalModelLodDistance([160,0,0],obb),10);assert.ok(originalModelLodDistance([160,0,0],obb,Math.PI/12)<5);
});
