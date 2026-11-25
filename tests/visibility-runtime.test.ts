import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {VisibilityRuntime,type VisibilityAllocation,type VisibilityHeap,type VisibilityGeometry} from '../src/core/visibility-runtime';
import {queryVisibilitySpheres} from '../src/core/visibility-spheres';
import {queryVisibilityAabbs} from '../src/core/visibility-aabbs';
import {qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {qemuVisibilityMin} from '../src/core/visibility-raster';
import {qemuVisibilityMax,visibilityDiv} from '../src/core/visibility-float';

interface Expected {changed:number;stateHex:string;cameraHex:string;depthHex:string;events:number[][];spheres:number[];aabbs:number[];}
interface Snapshot {
  name:string;initialHex:string;verticesHex:string;indices:number[];recordCount:number;
  spheresHex:string;minimaHex:string;maximaHex:string;
  steps:{operation:number;flags:number;csr:number;deviceHex:string;cameraHex:string;expected:Expected}[];
}
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/visibility-lifecycle-native.json.gz',import.meta.url))).toString()) as {cases:Snapshot[]};
function floats(hex:string) {const bytes=Buffer.from(hex,'hex'),result=new Float32Array(bytes.length/4);new Uint8Array(result.buffer).set(bytes);return result;}
function context(initial:Uint8Array) {
  const allocations:{id:number;memory:Uint8Array;bytes:number}[]=[],events:number[][]=[];
  const allocate=(bytes:number,alignment:number,kind:number)=>{
    const allocation={id:allocations.length+1,memory:new Uint8Array(bytes+128).fill(0xef),bytes};
    allocations.push(allocation);events.push([1,kind,bytes,alignment,allocation.id]);return allocation;
  };
  const free=(allocation:VisibilityAllocation,kind:number)=>{const a=allocations.find(a=>a.id===allocation.id)!;events.push([2,kind,a.bytes,0,a.id]);};
  const heap:VisibilityHeap={allocate(bytes,alignment){return allocate(bytes,alignment,1);},free(a){free(a,1);}};
  const scratch={allocate(bytes:number,alignment:number){return allocate(bytes,alignment,2).memory.subarray(0,bytes);},free(memory:Uint8Array){free(allocations.find(a=>a.memory.buffer===memory.buffer)!,2);}};
  return {runtime:new VisibilityRuntime(heap,scratch,qemuVisibilityReciprocal,qemuVisibilityMin,qemuVisibilityMax,initial),allocations,events};
}
test('Visibility lifecycle matches original stateful camera, depth, allocation and resource-reference snapshots',()=>{
  for(const c of fixture.cases) {
    const {runtime,allocations,events}=context(Buffer.from(c.initialHex,'hex'));
    const geometry:VisibilityGeometry={vertices:Buffer.from(c.verticesHex,'hex'),vertexCount:c.verticesHex.length/32,indices:Uint16Array.from(c.indices),indexCount:c.indices.length};
    const empty:VisibilityGeometry={vertices:new Uint8Array(),vertexCount:0,indices:new Uint16Array(),indexCount:0};
    const spheres=floats(c.spheresHex),minima=floats(c.minimaHex),maxima=floats(c.maximaHex);
    for(const [index,s] of c.steps.entries()) {
      const label=`${c.name} step ${index}`,camera=Buffer.from(s.cameraHex,'hex');let changed=true;
      let sphereStatuses:Uint32Array|undefined,aabbStatuses:Uint32Array|undefined;
      if(s.operation===0)runtime.initialize(camera);
      else if(s.operation===1)changed=runtime.resize(Buffer.from(s.deviceHex,'hex'),camera,s.csr===0xffc0?visibilityDiv:(a,b)=>Math.fround(a/b));
      else if(s.operation===2)changed=runtime.update(camera,{acquire(){events.push([3,3,0,0,0]);return {records:c.recordCount?[geometry,...(c.recordCount===2?[empty]:[])]:[],release(){events.push([4,3,0,0,0]);}};}},{disabled:!!(s.flags&1),frustumOnly:!!(s.flags&2),copyCamera:!!(s.flags&4)});
      else if(s.operation===3) {
        const state=runtime.queryState(!!(s.flags&1),!!(s.flags&2));
        sphereStatuses=new Uint32Array(spheres.length/4+8).fill(0x318faced);aabbStatuses=new Uint32Array(minima.length/4+8).fill(0x318faced);
        queryVisibilitySpheres(state,spheres,spheres.length/4,sphereStatuses,!!(s.flags&8),qemuVisibilityReciprocal,qemuVisibilityMax);
        queryVisibilityAabbs(state,minima,maxima,minima.length/4,aabbStatuses,qemuVisibilityReciprocal,qemuVisibilityMin,qemuVisibilityMax);
      }else runtime.terminate();
      assert.equal(Number(changed),s.expected.changed,label+' changed');
      assert.equal(Buffer.from(runtime.raw).toString('hex'),s.expected.stateHex,label+' raw state');
      const data=new DataView(runtime.raw.buffer),cameraId=Number(data.getBigUint64(0x10,true)>>32n),depthId=Number(data.getBigUint64(0x20,true)>>32n);
      const actualCamera=allocations.find(a=>a.id===cameraId)?.memory.subarray(0,0x300),actualDepth=allocations.find(a=>a.id===depthId)?.memory;
      assert.equal(Buffer.from(actualCamera??[]).toString('hex'),s.expected.cameraHex,label+' camera/padding');
      assert.equal(Buffer.from(actualDepth??[]).toString('hex'),s.expected.depthHex,label+' depth/guards');
      assert.deepEqual(events,s.expected.events,label+' allocation/reference events');
      assert.deepEqual(sphereStatuses?Array.from(sphereStatuses):[],s.expected.spheres,label+' sphere statuses/guards');
      assert.deepEqual(aabbStatuses?Array.from(aabbStatuses):[],s.expected.aabbs,label+' AABB statuses/guards');
    }
  }
});
test('Visibility disabled update returns before reading camera or acquiring resources',()=>{
  const {runtime}=context(new Uint8Array(0x240));
  const resources={acquire(){throw new Error('Unexpected resource acquisition');}};
  assert.equal(runtime.update(new Uint8Array(),resources,{disabled:true,copyCamera:true,frustumOnly:false}),false);
  assert.equal(runtime.update(new Uint8Array(),resources,{disabled:false,copyCamera:false,frustumOnly:true}),false);
});
test('Visibility owns initial snapshots supplied as pooled Buffer subarrays',()=>{
  const source=Buffer.alloc(0x260,0xa5),initial=source.subarray(0x10,0x250);initial.fill(0);initial.writeFloatLE(123,0x18);
  const before=Buffer.from(source),{runtime}=context(initial);
  runtime.initialize(new Uint8Array(0x300));
  assert.deepEqual(source,before);
  assert.equal(runtime.queryState().distanceLimit,123);
  assert.equal(runtime.raw.byteOffset,0);
});
test('Visibility rejects degenerate viewport snapshots before mutating native state',()=>{
  const {runtime}=context(new Uint8Array(0x240)),device=new Uint8Array(0x300),view=new DataView(device.buffer);
  for(const [width,height] of [[4,4],[8,4],[0,48],[NaN,48],[16388,48]]) {
    view.setFloat32(0x284,width,true);view.setFloat32(0x288,height,true);
    assert.throws(()=>runtime.resize(device,new Uint8Array(0x300),visibilityDiv),/supported viewport snapshot range/);
    assert.deepEqual(runtime.raw,new Uint8Array(0x240));
  }
});
