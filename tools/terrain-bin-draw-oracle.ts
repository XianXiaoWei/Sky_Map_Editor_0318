import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {gzipSync} from 'node:zlib';
import {prepareTerrainBinDraw,TERRAIN_BIN_DRAW_BYTES,TERRAIN_BIN_PACKET_BYTES,TERRAIN_BIN_SURFACES} from '../src/core/terrain-bin-runtime';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied executable');
interface Case {name:string;bins:number;enabled:boolean;model:Buffer;blocks:Buffer;packets:Buffer;lods:Buffer;pending:Buffer;calls:number[];save:boolean;}
const cases:Case[]=[];
let seed=0x318a7b50;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;};
const noise=(length:number)=>Buffer.from(Array.from({length},()=>random()>>>24));
function make(name:string,bins:number,enabled:boolean,calls:number[],mode:string,save:boolean):Case {
  const model=noise(0x600),blocks=noise(bins*TERRAIN_BIN_DRAW_BYTES+64),packets=noise(bins*TERRAIN_BIN_PACKET_BYTES+64),lods=noise(bins*2+64),pending=noise(bins*2+64);
  for(let selector=0;selector<TERRAIN_BIN_SURFACES;selector++)model.writeBigUInt64LE(mode==='wrap'?0xffffffffffffffffn-BigInt(selector):BigInt(random())<<32n|BigInt(random()),0x3b8+selector*8);
  model.writeBigUInt64LE(mode==='wrap'?0xffffffffffffffffn:0x3185d8abcdeffedcn,0x5d8);
  for(let bin=0;bin<bins;bin++)for(let entry=0;entry<16;entry++) {
    const at=bin*128+entry*8;
    let selector=random()%59,count=random()&0xffff,offset=random();
    if(mode==='unique')selector=(bin*16+entry)%59;
    if(mode==='last-zero'){selector=58;count=entry===15?0:0xffff;offset=entry===15?0xffffffff:entry;}
    if(mode==='edges'){selector=entry%2===0?0:58;count=[0,1,0x8000,0xffff][entry%4];offset=[0,1,0x80000000,0xffffffff][entry%4];}
    if(mode==='all-zero'){count=0;selector=0;offset=0;}
    if(mode==='null-invalid')selector=0xffff;
    packets.writeUInt32LE(offset,at);packets.writeUInt16LE(count,at+4);packets.writeUInt16LE(selector,at+6);
  }
  return {name,bins,enabled,model,blocks,packets,lods,pending,calls,save};
}
for(const bins of [1,2,3,8,31,32,33])for(const enabled of [true,false])for(let run=0;run<12;run++) {
  const modes=['random','unique','last-zero','edges','all-zero','wrap'],mode=modes[run%6],middle=Math.floor(bins/2);
  cases.push(make(`${mode}-${bins}-${enabled?'draw':'null'}-${run}`,bins,enabled,[0,middle,bins-1,middle,0,bins-1],mode,bins<=3&&run<6||[31,32,33].includes(bins)&&run===0));
}
cases.push(make('null-skips-invalid-packet',3,false,[2,0,1,1],'null-invalid',true));
cases.push(make('all-bins-forward-and-reverse',8,true,[...Array.from({length:8},(_,i)=>i),...Array.from({length:8},(_,i)=>7-i)],'unique',true));
const chunks:Buffer[]=[];
const uints=(values:number[])=>{const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v,i*4));chunks.push(b);};
uints([cases.length]);for(const c of cases){uints([c.bins,Number(c.enabled),c.calls.length]);chunks.push(c.model,c.blocks,c.packets,c.lods,c.pending);uints(c.calls);}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-terrain-bin-draw-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-terrain-bin-draw-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:64*1024*1024});
  if(run.status!==0)throw new Error(`Original terrain bin draw failed (${run.status}): ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Terrain bin draw output groups');let at=4,failed=0,compared=0,steps=0;
const saved:unknown[]=[],failures:unknown[]=[];
function compare(name:string,field:string,expected:Buffer,actual:Uint8Array) {
  const offsets:number[]=[];
  for(let i=0;i<expected.length;i++){compared++;if(expected[i]!==actual[i]){failed++;if(offsets.length<16)offsets.push(i);}}
  if(offsets.length&&failures.length<20)failures.push({name,field,offsets,expected:offsets.map(i=>expected[i]),actual:offsets.map(i=>actual[i])});
}
function take(bytes:number){if(at+bytes>raw.length)throw new Error('Truncated native output');const b=raw.subarray(at,at+bytes);at+=bytes;return b;}
for(const c of cases) {
  // Independent storage includes nonzero underlying offsets, as real Buffer
  // inputs may use pooled allocations. Null must not inspect packet selectors.
  const blocks=Buffer.from(c.blocks),packets=Buffer.from(c.packets),lodBytes=Buffer.from(c.lods),pendingBytes=Buffer.from(c.pending);
  const state={drawBlocks:c.enabled?blocks:null,packets,indexBases:Array.from({length:59},(_,i)=>c.model.readBigUInt64LE(0x3b8+i*8)),vertexPointer:c.model.readBigUInt64LE(0x5d8),lods:new Uint16Array(lodBytes.buffer,lodBytes.byteOffset,lodBytes.byteLength/2),pendingLods:new Uint16Array(pendingBytes.buffer,pendingBytes.byteOffset,pendingBytes.byteLength/2)};
  const expectedSteps:unknown[]=[];
  for(const bin of c.calls) {
    const expectedBlocks=take(c.blocks.length),expectedLods=take(c.lods.length),expectedPending=take(c.pending.length);
    prepareTerrainBinDraw(state,bin);steps++;
    compare(c.name,`bin-${bin}-blocks`,expectedBlocks,blocks);compare(c.name,`bin-${bin}-lods`,expectedLods,lodBytes);compare(c.name,`bin-${bin}-pending`,expectedPending,pendingBytes);
    if(c.save)expectedSteps.push({bin,blocksHex:expectedBlocks.toString('hex'),lodsHex:expectedLods.toString('hex'),pendingHex:expectedPending.toString('hex')});
  }
  compare(c.name,'packets',take(c.packets.length),c.packets);compare(c.name,'model',take(c.model.length),c.model);
  compare(c.name,'js-packets',c.packets,packets);
  if(c.save)saved.push({name:c.name,bins:c.bins,enabled:c.enabled,modelHex:c.model.toString('hex'),blocksHex:c.blocks.toString('hex'),packetsHex:c.packets.toString('hex'),lodsHex:c.lods.toString('hex'),pendingHex:c.pending.toString('hex'),steps:expectedSteps});
}
if(at!==raw.length)throw new Error('Unread terrain bin draw output');
const scope='Complete unmodified TerrainBarn bin draw preparation 0x1006a7b50 executes under QEMU x86_64 -cpu max without patches, imports or callbacks. Explicit model, 0x3e0 draw blocks, 128-byte packets, 59 index pointer tokens, vertex pointer token and LOD/pending arrays. Every block byte, all other bins, 64-byte trailing guards, input packets/model (normalized only for harness pointers) and repeated calls are compared. Tests include selectors 0/58, ordered duplicate overwrite including zero counts, unsigned uint32 offsets and uint64 address wrap, and null draw storage bypassing invalid selectors. The native body trusts packet producers; JS rejects unsupported selectors/storage before mutation. No original packet/index-base/bounds producer, resource allocation, actual LOD transitions, jobs, rendering, original hardware/game or viewport integration claimed. No packets fabricated from map surfaces.';
const report={passed:!failed,executableSha256:hash,scope,cases:cases.length,steps,compared,failed,failures,corpusMaps:0,originalPacketProducerRestored:false,lodTransitionsAndJobsRestored:false,viewportIntegrated:false};
fs.writeFileSync('docs/terrain-bin-draw-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/terrain-bin-draw-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n'));
else fs.writeFileSync(`docs/terrain-bin-draw-failure-${Date.now()}.json`,JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
