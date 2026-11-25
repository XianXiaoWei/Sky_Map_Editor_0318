import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import {gunzipSync} from 'node:zlib';
import {prepareTerrainBinDraw,type TerrainBinDrawState} from '../src/core/terrain-bin-runtime';

const fixture=JSON.parse(gunzipSync(fs.readFileSync(new URL('./fixtures/terrain-bin-draw-native.json.gz',import.meta.url))).toString()) as {cases:{name:string;enabled:boolean;modelHex:string;blocksHex:string;packetsHex:string;lodsHex:string;pendingHex:string;steps:{bin:number;blocksHex:string;lodsHex:string;pendingHex:string}[]}[]};
test('Terrain bin draw preparation matches complete original output, repeated bins, null storage, pointer wrap and guards',()=>{
  for(const c of fixture.cases) {
    const model=Buffer.from(c.modelHex,'hex'),blocks=Buffer.from(c.blocksHex,'hex'),packets=Buffer.from(c.packetsHex,'hex'),lodBytes=Buffer.from(c.lodsHex,'hex'),pendingBytes=Buffer.from(c.pendingHex,'hex');
    const state:TerrainBinDrawState={drawBlocks:c.enabled?blocks:null,packets,indexBases:Array.from({length:59},(_,i)=>model.readBigUInt64LE(0x3b8+i*8)),vertexPointer:model.readBigUInt64LE(0x5d8),lods:new Uint16Array(lodBytes.buffer,lodBytes.byteOffset,lodBytes.byteLength/2),pendingLods:new Uint16Array(pendingBytes.buffer,pendingBytes.byteOffset,pendingBytes.byteLength/2)};
    for(const step of c.steps) {
      prepareTerrainBinDraw(state,step.bin);
      assert.equal(blocks.toString('hex'),step.blocksHex,`${c.name} bin ${step.bin} blocks`);
      assert.equal(lodBytes.toString('hex'),step.lodsHex,`${c.name} bin ${step.bin} lods`);
      assert.equal(pendingBytes.toString('hex'),step.pendingHex,`${c.name} bin ${step.bin} pending`);
      assert.equal(packets.toString('hex'),c.packetsHex,`${c.name} unchanged packets`);
    }
  }
});
test('Unsupported terrain packet selectors/storage are rejected before mutating loaded snapshots',()=>{
  const c=fixture.cases.find(c=>c.enabled)!,model=Buffer.from(c.modelHex,'hex'),blocks=Buffer.from(c.blocksHex,'hex'),packets=Buffer.from(c.packetsHex,'hex'),lods=new Uint16Array([0xffff]),pendingLods=new Uint16Array([0xabcd]);
  const state:TerrainBinDrawState={drawBlocks:blocks,packets,indexBases:Array.from({length:59},(_,i)=>model.readBigUInt64LE(0x3b8+i*8)),vertexPointer:model.readBigUInt64LE(0x5d8),lods,pendingLods};
  packets.writeUInt16LE(59,15*8+6);
  assert.throws(()=>prepareTerrainBinDraw(state,0),/selector/);
  assert.equal(blocks.toString('hex'),c.blocksHex);assert.deepEqual(Array.from(lods),[0xffff]);assert.deepEqual(Array.from(pendingLods),[0xabcd]);
  assert.throws(()=>prepareTerrainBinDraw(state,1),/storage/);
  assert.throws(()=>prepareTerrainBinDraw(state,-1),/storage/);
  assert.throws(()=>prepareTerrainBinDraw({...state,drawBlocks:new Uint8Array(1)},0),/storage/);
});
