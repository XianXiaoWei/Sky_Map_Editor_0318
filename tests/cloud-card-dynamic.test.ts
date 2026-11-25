import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/cloud-card-dynamic-native.json';
import {cloudCardDynamicVertices} from '../src/core/cloud-card-dynamic';
import type {ResourceMeshLOD} from '../src/core/resources';
const source=(c:typeof fixture.cases[number])=>({world:c.world,opacity:c.opacity,mesh:{positions:Float32Array.from(c.positions),packedNormals:Int8Array.from(c.normals),packedUvs:Uint8Array.from(c.uvs),normals:new Float32Array(9),uvs:new Float32Array(24),colors:new Float32Array(12),indices:Uint32Array.from([0,1,2]),bakeVertexCount:0} as ResourceMeshLOD});
const range={sourceIndex:0,group:0,vertexOffset:0,indexOffset:0,vertexCount:3,indexCount:3};

test('CloudCard original arithmetic and 28-byte stream match captured native boundary fixtures',()=>{
 for(const c of fixture.cases){
  const actual=cloudCardDynamicVertices([source(c)],[range],[0],c.eye,Uint8Array.from(c.fallback),{acos:()=>c.trig[0],sincos:()=>[c.trig[1],c.trig[2]],pow:()=>c.trig[3]});
  assert.equal(Buffer.from(actual.vertices).toString('hex'),c.verticesHex,c.name);
  assert.equal(Buffer.from(actual.positions.buffer).toString('hex'),c.positionsHex,c.name);
  // UV bytes include arbitrary half payloads; preserving bytes is essential.
  for(let v=0;v<3;v++)assert.deepEqual([...actual.vertices.subarray(v*28+12,v*28+16)],c.uvs.slice(v*16,v*16+4));
 }
});

test('CloudCard production JS transcendental path stays within measured libm position boundary',()=>{
 for(const c of fixture.cases){
  const actual=cloudCardDynamicVertices([source(c)],[range],[0],c.eye,Uint8Array.from(c.fallback)),expected=Buffer.from(c.positionsHex,'hex');
  for(let i=0;i<actual.positions.length;i++)assert.ok(Math.abs(actual.positions[i]-expected.readFloatLE(i*4))<=1/65536,c.name);
 }
});

test('CloudCard validates source/range/capacity before allocation and preserves invisible holes and bake bytes',()=>{
 const c=fixture.cases[1],s=source(c),fallback=Uint8Array.from(c.fallback);
 const render=(r:any=range,sources:any=[s],order=[0])=>cloudCardDynamicVertices(sources,[r],order,c.eye,fallback);
 for(const r of [{...range,vertexOffset:-1},{...range,vertexOffset:.5},{...range,vertexOffset:20000000},{...range,sourceIndex:1},{...range,vertexCount:2}])assert.throws(()=>render(r));
 assert.throws(()=>render(range,[{...s,opacity:NaN}]));
 assert.throws(()=>render(range,[{...s,mesh:{...s.mesh,packedUvs:undefined}}]));
 assert.throws(()=>cloudCardDynamicVertices([s,s],[range,{...range,sourceIndex:1}],[0],c.eye,fallback));
 const invisible=render(range,[s],[]);assert.equal(invisible.vertices.length,84);assert.ok(invisible.vertices.every(v=>v===0));
 assert.equal(cloudCardDynamicVertices([],[],[],c.eye,fallback).vertices.length,0);
 const lighting=Uint8Array.from({length:36},(_,i)=>i+40),baked=render(range,[{...s,lighting}]);
 for(let v=0;v<3;v++)assert.deepEqual([...baked.vertices.subarray(v*28+20,v*28+28)],[...lighting.subarray(v*12,v*12+8)]);
});

import {cloudCardLevelDynamic,cloudCardLevelLayout} from '../src/core/cloud-card-level';
import type {ObjectNode} from '../src/core/objects';
test('CloudCard level wiring reads actual alphaMult, keeps source ranges and orders only visible index slices',()=>{
 const c=fixture.cases[1],s=source(c),mesh={...s.mesh,bounds:[-1,0,-1,1,0,1]},resource=()=>({name:'card',levels:[mesh]} as any);
 const node=(id:number,alpha:number):ObjectNode=>({id,className:'CloudCard',fields:[{name:'meshName',value:'card'},{name:'transform',value:s.world},{name:'alphaMult',value:{float:alpha}}]} as ObjectNode);
 const nodes=[node(1,.02),node(2,.5)],layout=cloudCardLevelLayout(nodes,resource);assert.equal(layout.cards[0].alphaMult,.02);
 const dynamic=cloudCardLevelDynamic(nodes,resource,c.eye,[1],false,Uint8Array.from(c.fallback));assert.equal(dynamic.stride,28);assert.equal(dynamic.attributes.a_uv.format,'half2');assert.equal(dynamic.draws.length,1);
 const r=layout.ranges.find(r=>r.sourceIndex===1)!;assert.deepEqual(dynamic.indices,layout.indices.slice(r.indexOffset,r.indexOffset+r.indexCount));
 const missing={...nodes[0],fields:nodes[0].fields.filter(f=>f.name!=='alphaMult')};assert.throws(()=>cloudCardLevelLayout([missing],resource));
});
