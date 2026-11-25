import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {terrainObbInFrustum,terrainOcclusionCandidates,terrainBinLods,queryTerrainBinLods,terrainFrustumRte,terrainFrustumRtz,type TerrainVisibilityObject} from '../src/core/terrain-visibility';
import type {CloudCardPlane} from '../src/core/cloud-card-visibility';
import type {VisibilitySphereState} from '../src/core/visibility-spheres';
import {qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {qemuVisibilityMax} from '../src/core/visibility-float';
import {qemuVisibilityMin} from '../src/core/visibility-raster';

const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/terrain-frustum-native.json.gz',import.meta.url))).toString()) as {cases:{name:string;planes:CloudCardPlane[];matrix:number[];csr:number;expected:number}[]};
test('Terrain oriented-box frustum matches original ambient rounding, degenerate axes and tangent snapshots',()=>{
  for(const c of fixture.cases)assert.equal(Number(terrainObbInFrustum(c.planes,c.matrix,c.csr===0x1f80?terrainFrustumRte:terrainFrustumRtz)),c.expected,c.name);
});
test('Terrain candidate batch filters enabled OBBs before original initialized sphere query and unstable compaction',()=>{
  const snapshots=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/visibility-spheres-native.json.gz',import.meta.url))).toString()) as {cases:{name:string;spheresHex:string;depthHex:string;view:number[];projection:number[];hasCamera:boolean;disabled:boolean;frustumOnly:boolean;distanceLimit:number;mips:VisibilitySphereState['mips'];expected:number[];initialize:boolean}[]};
  const c=snapshots.cases.find(c=>c.name==='random-8-0')!;
  assert.equal(c.initialize,true);
  const floats=(hex:string)=>{const bytes=Buffer.from(hex,'hex'),result=new Float32Array(bytes.length/4);new Uint8Array(result.buffer).set(bytes);return result;};
  const spheres=floats(c.spheresHex),halfAxes=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
  const objects:TerrainVisibilityObject[]=Array.from({length:8},(_,i)=>({enabled:true,halfAxes,sphere:Array.from(spheres.subarray(i*4,i*4+4))}));
  // Original 0x10015e420 rejects contact at center=2, half-size=1.
  // A disabled object's invalid snapshots must never be inspected.
  objects.splice(3,0,{enabled:false,halfAxes:[],sphere:[]});
  objects.push({enabled:true,halfAxes:[...halfAxes.slice(0,12),2,0,0,1],sphere:[]});
  const planes:CloudCardPlane[]=[[1,0,0,1],[-1,0,0,1],[0,0,1,1],[0,1,0,1],[0,-1,0,1],[0,0,-1,1]];
  const state:VisibilitySphereState={camera:c.hasCamera?{view:c.view,projection:c.projection}:null,disabled:c.disabled,frustumOnly:c.frustumOnly,distanceLimit:c.distanceLimit,mips:c.mips,depth:floats(c.depthHex)};
  const result=terrainOcclusionCandidates(objects,planes,state,terrainFrustumRte,qemuVisibilityReciprocal,qemuVisibilityMax);
  assert.deepEqual(result.candidateOrder,[0,1,2,4,5,6,7,8]);
  assert.deepEqual(result.candidateStatuses,c.expected.slice(0,8));
  assert.deepEqual(result.visibleOrder,[0,1,2,4,5,8,7]);
  assert.deepEqual(result.visibleStatuses,new Array(7).fill(0xffffffff));
});
test('Terrain per-bin LOD matches original SIMD/tail statuses, squared thresholds and signed minimum snapshots',()=>{
  const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/terrain-lod-native.json.gz',import.meta.url))).toString()) as {cases:{name:string;distance:boolean;csr:number;minimumHex:string;thresholdsHex:string;eyeHex:string;spheresHex:string;statuses:number[];expected:number[]}[]};
  const floats=(hex:string)=>{const bytes=Buffer.from(hex,'hex'),result=new Float32Array(bytes.length/4);new Uint8Array(result.buffer).set(bytes);return result;};
  for(const c of fixture.cases) {
    const lods=terrainBinLods(Uint32Array.from(c.statuses),floats(c.spheresHex),floats(c.eyeHex),floats(c.thresholdsHex),floats(c.minimumHex)[0],c.distance,c.csr===0x1f80?terrainFrustumRte:terrainFrustumRtz);
    const output=new Uint16Array(lods.length+8).fill(0xabcd);output.set(lods);
    assert.deepEqual(Array.from(output),c.expected,c.name);
  }
});
test('Terrain bin queries keep original AABB batch order and propagate zero status into hidden LOD',()=>{
  const snapshots=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/visibility-aabbs-native.json.gz',import.meta.url))).toString()) as {cases:{name:string;spheresHex:string;maximaHex:string;depthHex:string;view:number[];projection:number[];hasCamera:boolean;disabled:boolean;frustumOnly:boolean;distanceLimit:number;mips:VisibilitySphereState['mips'];expected:number[]}[]};
  const floats=(hex:string)=>{const bytes=Buffer.from(hex,'hex'),result=new Float32Array(bytes.length/4);new Uint8Array(result.buffer).set(bytes);return result;};
  for(const c of snapshots.cases.filter(c=>c.name.startsWith('random-8-'))) {
    const state:VisibilitySphereState={camera:c.hasCamera?{view:c.view,projection:c.projection}:null,disabled:c.disabled,frustumOnly:c.frustumOnly,distanceLimit:c.distanceLimit,mips:c.mips,depth:floats(c.depthHex)};
    const result=queryTerrainBinLods(state,floats(c.spheresHex),floats(c.maximaHex),new Float32Array(),[],[],NaN,false,terrainFrustumRte,qemuVisibilityReciprocal,qemuVisibilityMin,qemuVisibilityMax);
    assert.deepEqual(Array.from(result.statuses),c.expected.slice(0,8),c.name);
    assert.deepEqual(Array.from(result.lods),c.expected.slice(0,8).map(status=>status===0?0xffff:3),c.name);
  }
});
