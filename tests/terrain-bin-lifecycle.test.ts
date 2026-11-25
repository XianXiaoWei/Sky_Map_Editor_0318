import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {releaseTerrainBinDraw,updateTerrainBinVisibility,removeTerrainDrawReferences,dispatchTerrainBinLodJob,type TerrainBinDrawState,type TerrainBinReleaseServices} from '../src/core/terrain-bin-runtime';
interface Output {operation:number;bin:number;injectBin:number;injectLod:number;desiredHex:string;locks:number;unlocks:number;vcount:number;icount:number;jobDirection:number;blocksHex:string;lodsHex:string;pendingHex:string;vrefsHex:string;irefsHex:string;}
interface Snapshot {name:string;bins:number;enabled:boolean;drawBase:string;modelHex:string;blocksHex:string;packetsHex:string;lodsHex:string;pendingHex:string;vrefsHex:string;irefsHex:string;vcount:number;icount:number;steps:Output[];}
const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/terrain-bin-lifecycle-native.json.gz',import.meta.url))).toString()) as {cases:Snapshot[]};
function load(c:Snapshot) {
  const model=Buffer.from(c.modelHex,'hex'),blocks=Buffer.from(c.blocksHex,'hex'),packets=Buffer.from(c.packetsHex,'hex'),lods=Buffer.from(c.lodsHex,'hex'),pending=Buffer.from(c.pendingHex,'hex'),vrefs=Buffer.from(c.vrefsHex,'hex'),irefs=Buffer.from(c.irefsHex,'hex');
  const state:TerrainBinDrawState={drawBlocks:c.enabled?blocks:null,packets,indexBases:Array.from({length:59},(_,i)=>model.readBigUInt64LE(0x3b8+i*8)),vertexPointer:model.readBigUInt64LE(0x5d8),lods:new Uint16Array(lods.buffer,lods.byteOffset,c.bins),pendingLods:new Uint16Array(pending.buffer,pending.byteOffset,c.bins)};
  let locks=0,unlocks=0,injectBin=0xffffffff,injectLod=0;
  const services:TerrainBinReleaseServices={drawBase:BigInt(c.drawBase),vertexReferences:{entries:vrefs,count:c.vcount},indexReferences:{entries:irefs,count:c.icount},withExclusiveDrawAccess(action){locks++;if(injectBin<c.bins){state.lods[injectBin]=injectLod;injectBin=0xffffffff;}try{action();}finally{unlocks++;}}};
  return {state,services,blocks,lods,pending,vrefs,irefs,packets,
    run(s:Output){locks=unlocks=0;injectBin=s.injectBin;injectLod=s.injectLod;const desired=Buffer.from(s.desiredHex,'hex');let jobDirection=0;if(s.operation===0)updateTerrainBinVisibility(state,new Uint16Array(desired.buffer,desired.byteOffset,c.bins),services);else if(s.operation===1)releaseTerrainBinDraw(state,s.bin,services);else dispatchTerrainBinLodJob(state,s.bin,s.injectLod,{refine(){jobDirection=1;},coarsen(){jobDirection=2;}});return {locks,unlocks,desired,jobDirection};}};
}
test('Terrain bin visibility/release matches original continuous snapshots, reference tails, lock re-reads and other-bin guards',()=>{
  for(const c of fixture.cases) {
    const r=load(c);
    for(const [index,s] of c.steps.entries()) {
      const result=r.run(s),label=`${c.name}/${index}`;
      assert.equal(result.locks,s.locks,label+' locks');assert.equal(result.unlocks,s.unlocks,label+' unlocks');
      assert.equal(result.jobDirection,s.jobDirection,label+' job direction');
      assert.equal(r.services.vertexReferences.count,s.vcount,label+' vertex registrations');assert.equal(r.services.indexReferences.count,s.icount,label+' index registrations');
      for(const [field,actual] of [['blocks',r.blocks],['lods',r.lods],['pending',r.pending],['vrefs',r.vrefs],['irefs',r.irefs]] as const)assert.equal(actual.toString('hex'),s[(field+'Hex') as keyof Output],label+' '+field);
      assert.equal(result.desired.toString('hex'),s.desiredHex,label+' unchanged targets');assert.equal(r.packets.toString('hex'),c.packetsHex,label+' unchanged packets');
    }
  }
});
test('Terrain LOD jobs use the current signed word at dispatch, including equality and FFFF',()=>{
  const c=fixture.cases.find(c=>c.name==='snapshot-1-draw-0')!,r=load(c);let direction='';
  const services={refine(){direction='refine';},coarsen(){direction='coarsen';}};
  r.state.lods[0]=3;dispatchTerrainBinLodJob(r.state,0,2,services);assert.equal(direction,'refine');
  r.state.lods[0]=2;dispatchTerrainBinLodJob(r.state,0,2,services);assert.equal(direction,'coarsen');
  r.state.lods[0]=0xffff;dispatchTerrainBinLodJob(r.state,0,0,services);assert.equal(direction,'coarsen');
  r.state.lods[0]=3;dispatchTerrainBinLodJob(r.state,0,0xffff,services);assert.equal(direction,'refine');
  assert.throws(()=>dispatchTerrainBinLodJob(r.state,0,65536,services),/target/);
});
test('Newly visible fine targets start at coarse LOD; hidden repeats preserve pending state and skip locks',()=>{
  const c=fixture.cases.find(c=>c.name==='snapshot-1-draw-0')!,r=load(c);
  r.state.lods[0]=0xffff;r.state.pendingLods[0]=0x1234;
  updateTerrainBinVisibility(r.state,new Uint16Array([0]),r.services);
  assert.equal(r.state.lods[0],3);assert.equal(r.state.pendingLods[0],0xfffe);
  const after=Buffer.from(r.blocks);r.state.pendingLods[0]=0xabcd;
  updateTerrainBinVisibility(r.state,new Uint16Array([1]),r.services);
  assert.equal(r.state.lods[0],3);assert.equal(r.state.pendingLods[0],0xabcd);assert.deepEqual(r.blocks,after);
  updateTerrainBinVisibility(r.state,new Uint16Array([0xffff]),r.services);assert.deepEqual(r.blocks,after);
  r.state.pendingLods[0]=0x5678;
  const skip:TerrainBinReleaseServices={...r.services,withExclusiveDrawAccess(){assert.fail('Already hidden bin must not lock');}};
  updateTerrainBinVisibility(r.state,new Uint16Array([0xffff]),skip);assert.equal(r.state.pendingLods[0],0x5678);
});
test('Terrain heap unregisters every matching owner slot, preserves record data and ignores pointer values in the second word',()=>{
  const bytes=Buffer.alloc(5*16+16,0x55),keys=[0x1020n,0x9999n,0x1020n,0x1030n,0x1020n];
  keys.forEach((key,i)=>{bytes.writeBigUInt64LE(key,i*16);bytes.writeBigUInt64LE(0x1020n,i*16+8);});
  const original=Buffer.from(bytes),list={entries:bytes,count:5};removeTerrainDrawReferences(list,0x1020n);
  assert.equal(list.count,2);assert.deepEqual(bytes.subarray(0,16),original.subarray(16,32));assert.deepEqual(bytes.subarray(16,32),original.subarray(48,64));assert.deepEqual(bytes.subarray(32),original.subarray(32));
  const before=Buffer.from(bytes);removeTerrainDrawReferences(list,0x5555n);assert.equal(list.count,2);assert.deepEqual(bytes,before);
});
test('Unsupported dynamic storage/reference dimensions reject without unregistering, while coarse null storage remains supported',()=>{
  const c=fixture.cases.find(c=>c.name==='snapshot-1-draw-0')!,r=load(c),original=Buffer.from(r.blocks);
  r.state.lods[0]=1;r.services.indexReferences.count=100000;
  assert.throws(()=>releaseTerrainBinDraw(r.state,0,r.services),/reference storage/);assert.deepEqual(r.blocks,original);assert.equal(r.state.lods[0],1);assert.equal(r.services.vertexReferences.count,c.vcount);
  assert.throws(()=>releaseTerrainBinDraw(r.state,-1,r.services),/LOD storage/);
  assert.throws(()=>updateTerrainBinVisibility(r.state,new Uint16Array(),r.services),/storage/);
  r.state.drawBlocks=null;assert.throws(()=>releaseTerrainBinDraw(r.state,0,r.services),/dynamic draw/);assert.equal(r.state.lods[0],1);
  r.state.lods[0]=3;releaseTerrainBinDraw(r.state,0,r.services);assert.equal(r.state.lods[0],0xffff);assert.equal(r.state.pendingLods[0],0xfffe);
});
