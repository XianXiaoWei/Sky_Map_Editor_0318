import test from 'node:test';import assert from 'node:assert/strict';
import fixture from './fixtures/cloud-particle-selection-native.json';
import {selectCloudParticleSources} from '../src/core/cloud-particle-selection';

test('Original cloud source range compaction and nearest-three heap preserve native complete candidate bytes',()=>{
 for(const c of fixture.cases) {
  const result=selectCloudParticleSources(c.position,c.sources),bytes=Buffer.alloc(result.candidates.length*24);
  result.candidates.forEach((r,j)=>{bytes.writeUInt32LE(r.sourceIndex,j*24);[...r.offset,r.distanceSquared].forEach((v,k)=>bytes.writeFloatLE(v,j*24+4+k*4));});
  assert.equal(result.selected.length,c.selectedCount,c.name);assert.equal(bytes.toString('hex'),c.nativeHex,c.name);
 }
});

test('Cloud selection retains range boundaries, native equal-key order and rejects invalid source capacity',()=>{
 const source=(x:number)=>({previous:[x,0,0,1],range8c:1,range90:1}),sources=[source(1.5),source(1.5000001192092896),source(1.4999998807907104)];
 const snapshot=structuredClone(sources),result=selectCloudParticleSources([0,0,0],sources);
 assert.deepEqual(result.selected.map(s=>s.sourceIndex),[2,0]);assert.deepEqual(sources,snapshot);
 assert.deepEqual(selectCloudParticleSources([0,0,0],Array.from({length:4},()=>source(1))).selected.map(s=>s.sourceIndex),[2,0,1]);
 assert.deepEqual(selectCloudParticleSources([0,0,0],[]),{candidates:[],selected:[]});
 assert.throws(()=>selectCloudParticleSources([0,0,0],Array.from({length:49},()=>source(1))));
 assert.throws(()=>selectCloudParticleSources([Infinity,0,0],[source(1)]));
 assert.throws(()=>selectCloudParticleSources([0,0,0],[{...source(1),range90:NaN}]));
});
