import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {buildTerrainBinGeometry,type TerrainBinSource} from '../src/core/terrain-bin-geometry';
import {nativeMaterialDefs,terrainPartitionSurfaceCounts} from '../src/core/mesh-surfaces';

interface Snapshot {name:string;level:string;vertexCount:number;positionsHex:string;materialIdsHex:string;weightsHex:string;indices:number[];bins:{count:number;raw:number}[];gridOrigin:number[];cellSize:number;transform:number[];fill:number;storage:Record<string,string>;surfaceBinCounts:number[];surfaceCounts:number[];indexStreams:{selector:number;indices:number[]}[];}
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/terrain-bin-geometry-native.json.gz',import.meta.url))).toString()) as {cases:Snapshot[]};
const floats=(hex:string)=>{const b=Buffer.from(hex,'hex'),a=new Float32Array(b.length/4);new Uint8Array(a.buffer).set(b);return a;};
const source=(c:Snapshot):TerrainBinSource=>({vertexCount:c.vertexCount,positions:floats(c.positionsHex),materialIds:Buffer.from(c.materialIdsHex,'hex'),weights:Buffer.from(c.weightsHex,'hex'),indices:Uint32Array.from(c.indices),bins:c.bins,gridOrigin:c.gridOrigin,cellSize:c.cellSize,transform:c.transform});
const bytes=(a:Float32Array|Uint32Array|Uint16Array|Uint8Array)=>Buffer.from(a.buffer,a.byteOffset,a.byteLength);
test('Terrain bins match complete original creation outputs for real patch data, RTE transforms, untouched packet slots and native bounds',()=>{
  for(const c of fixture.cases) {
    const initial=new Uint8Array(c.bins.length*128).fill(c.fill),result=buildTerrainBinGeometry(source(c),nativeMaterialDefs(c.level),initial);
    for(const [field,array] of [['spheres',result.spheres],['minima',result.minima],['maxima',result.maxima],['packets',result.packets],['lods',result.lods]] as const) {
      const expected=Buffer.from(c.storage[field],'hex').subarray(0,array.byteLength);
      if(array instanceof Float32Array) {
        for(let i=0;i<array.length;i++)assert.ok(Object.is(array[i],expected.readFloatLE(i*4)),`${c.name}/${field}/${i}`);
      }else assert.ok(bytes(array).equals(expected),`${c.name}/${field}`);
    }
    assert.deepEqual(Array.from(result.surfaceBinCounts),c.surfaceBinCounts,`${c.name}/surface populations`);
    assert.deepEqual(Array.from(result.surfaceCounts),c.surfaceCounts,`${c.name}/global surface counts`);
    assert.deepEqual(result.indexStreams.map(s=>({selector:s.selector,indices:Array.from(s.indices)})),c.indexStreams,`${c.name}/stable streams`);
    assert.deepEqual(initial,new Uint8Array(initial.length).fill(c.fill),`${c.name}/initial heap snapshot preserved`);
  }
});
test('Terrain creation keeps unbinned geometry and rejects unsupported native packet overflow and scaled transforms',()=>{
  const c=fixture.cases.find(c=>c.name==='synthetic-1-0')!,s=source(c),defs=nativeMaterialDefs(c.level);
  const distant=buildTerrainBinGeometry({...s,bins:[]},defs,new Uint8Array());
  assert.equal(distant.spheres.length,0);assert.equal(distant.packets.length,0);assert.ok(distant.surfaceCounts.some(n=>n>0));
  assert.throws(()=>buildTerrainBinGeometry({...s,transform:Array.from(s.transform).map((v,i)=>i===0?2:v)},defs,new Uint8Array(128)),/unit-scale/);
  const crowded=source(c);crowded.vertexCount=17;crowded.positions=new Float32Array(51);crowded.materialIds=new Uint8Array(68);crowded.weights=new Uint8Array(68);
  for(let i=0;i<17;i++){crowded.materialIds[i*4]=defs[i].materialId;crowded.weights[i*4]=255;}
  crowded.indices=Uint32Array.from(Array.from({length:17},(_,i)=>[i,i,i]).flat());crowded.bins=[{count:51,raw:0}];
  assert.throws(()=>buildTerrainBinGeometry(crowded,defs,new Uint8Array(128)),/16 surface slots/);
});
test('Terrain partition classification keeps source triangle order and the exact global per-surface totals',()=>{
  const c=fixture.cases.find(c=>c.name==='synthetic-8-0')!,s=source(c),partitions=terrainPartitionSurfaceCounts(s,nativeMaterialDefs(c.level),s.bins.map(b=>b.count));
  const total=new Uint32Array(59);partitions.forEach(p=>p.forEach((count,i)=>total[i]+=count));
  assert.deepEqual(Array.from(total),c.surfaceCounts);
  assert.throws(()=>terrainPartitionSurfaceCounts(s,nativeMaterialDefs(c.level),[s.indices.length-3]),/partition/);
});
