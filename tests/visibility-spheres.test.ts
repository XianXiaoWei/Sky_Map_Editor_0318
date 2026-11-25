import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {queryVisibilitySpheres,type VisibilitySphereState} from '../src/core/visibility-spheres';
import {queryVisibilityAabbs} from '../src/core/visibility-aabbs';
import {qemuVisibilityMin} from '../src/core/visibility-raster';
import {cloudCardOcclusionPlan} from '../src/core/cloud-card-visibility';
import type {CloudCardSphere} from '../src/core/cloud-card-layout';
import {qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {qemuVisibilityMax} from '../src/core/visibility-float';

interface Snapshot {
  name:string;view:number[];projection:number[];hasCamera:boolean;disabled:boolean;frustumOnly:boolean;
  distanceLimit:number;mips:VisibilitySphereState['mips'];depthHex:string;spheresHex:string;
  initial:number[];initialize:boolean;expected:number[];maximaHex?:string;
}
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/visibility-spheres-native.json.gz',import.meta.url))).toString()) as {cases:Snapshot[]};
function floats(hex:string):Float32Array {
  const bytes=Buffer.from(hex,'hex'),v=new Float32Array(bytes.length/4);new Uint8Array(v.buffer).set(bytes);return v;
}
test('Visibility spheres match original SIMD, mip depth, exceptional operands and recursive tail snapshots',()=>{
  for(const c of fixture.cases) {
    const spheres=floats(c.spheresHex),output=Uint32Array.from(c.initial);
    const state:VisibilitySphereState={camera:c.hasCamera?{view:c.view,projection:c.projection}:null,disabled:c.disabled,frustumOnly:c.frustumOnly,distanceLimit:c.distanceLimit,mips:c.mips,depth:floats(c.depthHex)};
    queryVisibilitySpheres(state,spheres,spheres.length/4,output,c.initialize,qemuVisibilityReciprocal,qemuVisibilityMax);
    assert.deepEqual(Array.from(output),c.expected,c.name);
  }
});
test('Visibility count-zero and null-status early returns do not read camera/source state',()=>{
  const state={get camera(){throw new Error('Unexpected camera read');}} as unknown as VisibilitySphereState;
  const output=new Uint32Array([0x318faced]);
  queryVisibilitySpheres(state,new Float32Array(),0,output,true,qemuVisibilityReciprocal,qemuVisibilityMax);
  queryVisibilitySpheres(state,new Float32Array(),1,null,true,qemuVisibilityReciprocal,qemuVisibilityMax);
  assert.equal(output[0],0x318faced);
});
test('Visibility AABBs match original per-product bounds, tiled depths and tail snapshots',()=>{
  const aabbs=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/visibility-aabbs-native.json.gz',import.meta.url))).toString()) as {cases:Snapshot[]};
  for(const c of aabbs.cases) {
    const minima=floats(c.spheresHex),maxima=floats(c.maximaHex!),output=Uint32Array.from(c.initial);
    const state:VisibilitySphereState={camera:c.hasCamera?{view:c.view,projection:c.projection}:null,disabled:c.disabled,frustumOnly:c.frustumOnly,distanceLimit:c.distanceLimit,mips:c.mips,depth:floats(c.depthHex)};
    queryVisibilityAabbs(state,minima,maxima,minima.length/4,output,qemuVisibilityReciprocal,qemuVisibilityMin,qemuVisibilityMax);
    assert.deepEqual(Array.from(output),c.expected,c.name);
  }
});
test('CloudCard occlusion uses original sphere statuses and compacts candidates in batch order',()=>{
  for(const c of fixture.cases.filter(c=>c.name.startsWith('random-8-'))) {
    const values=floats(c.spheresHex),spheres=Array.from({length:8},(_,i)=>Array.from(values.subarray(i*4,i*4+4)) as CloudCardSphere);
    const state:VisibilitySphereState={camera:c.hasCamera?{view:c.view,projection:c.projection}:null,disabled:c.disabled,frustumOnly:c.frustumOnly,distanceLimit:c.distanceLimit,mips:c.mips,depth:floats(c.depthHex)};
    // The original CloudCard fixture covers zero planes: all source cards
    // reach Visibility. Initial candidate statuses in CloudCardBarn are all FF.
    if(!c.initialize&&(state.disabled||!state.camera||!state.mips.length))continue;
    const plan=cloudCardOcclusionPlan(spheres,[0,1,2,3,4,5,6,7],new Array(16).fill(0),state,true,qemuVisibilityReciprocal,qemuVisibilityMax);
    assert.deepEqual(plan.candidateStatuses,c.expected.slice(0,8),c.name);
    assert.deepEqual(plan.visibleOrder.slice().sort((a,b)=>a-b),c.expected.slice(0,8).flatMap((v,i)=>v?[i]:[]),c.name);
    plan.visibleOrder.forEach((source,i)=>{assert.equal(plan.visibleStatuses[i],c.expected[source],c.name);assert.deepEqual(plan.visibleSpheres[i],spheres[source],c.name);});
    // Reorder sources, then insert a card rejected by the frustum. Visibility
    // must still receive the exact original native eight-sphere batch order.
    const sources=spheres.slice().reverse();sources.push([1e9,0,0,0]);
    const matrix=[0.00001,0,0,0,0,0.00001,0,0,0,0,0.00001,0,0,0,0,1];
    const reordered=cloudCardOcclusionPlan(sources,[8,7,6,5,4,3,2,1,0],matrix,state,true,qemuVisibilityReciprocal,qemuVisibilityMax);
    assert.deepEqual(reordered.candidateOrder,[7,6,5,4,3,2,1,0],c.name);
    assert.deepEqual(reordered.candidateStatuses,c.expected.slice(0,8),c.name);
    assert.deepEqual(reordered.visibleOrder.map(source=>7-source).sort((a,b)=>a-b),c.expected.slice(0,8).flatMap((v,i)=>v?[i]:[]),c.name);
  }
});
