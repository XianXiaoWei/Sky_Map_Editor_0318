import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {gzipSync,gunzipSync} from 'node:zlib';
import {releaseTerrainBinDraw,updateTerrainBinVisibility,dispatchTerrainBinLodJob,TERRAIN_BIN_DRAW_BYTES,type TerrainBinDrawState,type TerrainBinReleaseServices} from '../src/core/terrain-bin-runtime';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied executable');
const drawBase=0x103000000n;
interface Step {operation:number;bin:number;injectBin:number;injectLod:number;desired:Buffer;}
interface Case {name:string;bins:number;enabled:boolean;model:Buffer;blocks:Buffer;packets:Buffer;lods:Buffer;pending:Buffer;vrefs:Buffer;irefs:Buffer;vslots:number;islots:number;vcount:number;icount:number;steps:Step[];save:boolean;}
let seed=0x318a8100;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;};
const noise=(length:number)=>Buffer.from(Array.from({length},()=>random()>>>24));
const lodWords=(bins:number,value:(bin:number)=>number)=>{const b=noise(bins*2+64);for(let i=0;i<bins;i++)b.writeUInt16LE(value(i)&0xffff,i*2);return b;};
const step=(bins:number,value:(bin:number)=>number,operation=0,bin=0,injectBin=0xffffffff,injectLod=0):Step=>({operation,bin,injectBin,injectLod,desired:lodWords(bins,value)});
function make(name:string,bins:number,enabled:boolean,mode:number,save:boolean):Case {
  const model=noise(0x600),blocks=noise(bins*TERRAIN_BIN_DRAW_BYTES+64),packets=noise(bins*128+64),lods=lodWords(bins,i=>enabled?[0,1,2,3,0xffff,0x8000,0xfffe][(i+mode)%7]:[3,0xffff,0x8000][(i+mode)%3]),pending=noise(bins*2+64);
  for(let selector=0;selector<59;selector++)model.writeBigUInt64LE(mode===3?0xffffffffffffffffn-BigInt(selector):BigInt(random())<<32n|BigInt(random()),0x3b8+selector*8);
  model.writeBigUInt64LE(0x3185d8abcdeffedcn,0x5d8);
  for(let i=0;i<bins*16;i++){packets.writeUInt32LE(random(),i*8);packets.writeUInt16LE(random()&0xffff,i*8+4);packets.writeUInt16LE(mode===2?58:random()%59,i*8+6);}
  const vslots=bins*3+8,islots=bins*3+7,vrefs=noise(vslots*16+64),irefs=noise(islots*16+64);
  for(const [refs,slots,lane] of [[vrefs,vslots,0x20n],[irefs,islots,0x30n]] as const)for(let i=0;i<slots;i++){
    const key=mode===4||bins===0||i%4===3?0x318fffffffff0000n+BigInt(i):drawBase+BigInt((i%bins)*TERRAIN_BIN_DRAW_BYTES)+lane;
    refs.writeBigUInt64LE(key,i*16);
  }
  const vcount=mode===5?0:mode===6?1:vslots,icount=mode===5?0:mode===6?1:islots;
  const mixed=(i:number)=>i%3===0?0xffff:i%4;
  const steps=[step(bins,mixed),step(bins,mixed),step(bins,i=>i%4),step(bins,()=>0xffff),step(bins,()=>0xffff),step(bins,i=>3-i%4)];
  if(bins)steps.unshift(step(bins,()=>0,1,Math.floor(bins/2)));
  return {name,bins,enabled,model,blocks,packets,lods,pending,vrefs,irefs,vslots,islots,vcount,icount,steps,save};
}
const cases:Case[]=[];
for(const bins of [0,1,2,3,8,31,32,33])for(const enabled of [true,false])for(let mode=0;mode<7;mode++)cases.push(make(`snapshot-${bins}-${enabled?'draw':'null'}-${mode}`,bins,enabled,mode,bins<=3||bins>=31&&enabled&&mode===0));
for(const initial of [0,1,2,3,0xffff,0xfffe,0x8000])for(const replacement of [0,2,3,0xffff])for(const operation of [0,1]) {
  const c=make(`lock-reread-${initial}-${replacement}-${operation}`,2,true,0,true);c.lods.writeUInt16LE(initial,0);
  c.steps=[step(2,()=>0xffff,operation,0,0,replacement),step(2,()=>0xffff),step(2,()=>0)];cases.push(c);
}
const jobLods=[0,1,2,3,4,0x7fff,0x8000,0x8001,0xfffe,0xffff];
for(const current of jobLods)for(const target of jobLods) {
  const c=make(`job-dispatch-${current}-${target}`,2,true,0,true);c.lods.writeUInt16LE(current,0);
  c.steps=[step(2,()=>0,2,0,0xffffffff,target)];cases.push(c);
}
const packetCorpus=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/terrain-bin-packets-corpus-native.json.gz')).toString()) as {executableSha256:string;cases:{name:string;level:string;originalBinCount:number;selectedBins:number[];packetsHex:string}[]};
if(packetCorpus.executableSha256!==hash)throw new Error('Native packet corpus SHA');
let corpusBins=0,selectedBins=0;const corpusMaps=new Set<string>();
for(const p of packetCorpus.cases) {
  corpusBins+=p.originalBinCount;selectedBins+=p.selectedBins.length;corpusMaps.add(p.level);
  const c=make(p.name,p.selectedBins.length,true,0,p.selectedBins.length<=32&&cases.filter(c=>c.save&&c.name.startsWith('map-')).length<2);
  Buffer.from(p.packetsHex,'hex').copy(c.packets);cases.push(c);
}
const chunks:Buffer[]=[];const uints=(values:number[])=>{const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));chunks.push(b);};
uints([cases.length]);for(const c of cases){uints([c.bins,Number(c.enabled),c.vslots,c.vcount,c.islots,c.icount]);chunks.push(c.model,c.blocks,c.packets,c.lods,c.pending,c.vrefs,c.irefs);uints([c.steps.length]);for(const s of c.steps){uints([s.operation,s.bin,s.injectBin,s.injectLod]);chunks.push(s.desired);}}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-terrain-bin-lifecycle-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-terrain-bin-lifecycle-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:256*1024*1024});
  if(run.status!==0){const failure={executableSha256:hash,status:run.status,error:run.error?.message,stderr:run.stderr.toString()};fs.writeFileSync(`docs/terrain-bin-lifecycle-runner-failure-${Date.now()}.json`,JSON.stringify(failure,null,2)+'\n');throw new Error(JSON.stringify(failure));}
  raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Terrain lifecycle output groups');let at=4,compared=0,failed=0,steps=0,exclusiveSections=0,jobDispatches=0;
const failures:unknown[]=[],saved:unknown[]=[];
const take=(length:number)=>{if(at+length>raw.length)throw new Error('Truncated lifecycle output');const b=raw.subarray(at,at+length);at+=length;return b;};
function compare(name:string,field:string,expected:Buffer,actual:Uint8Array){const offsets:number[]=[];for(let i=0;i<expected.length;i++){compared++;if(expected[i]!==actual[i]){failed++;if(offsets.length<12)offsets.push(i);}}if(offsets.length&&failures.length<20)failures.push({name,field,offsets,expected:offsets.map(i=>expected[i]),actual:offsets.map(i=>actual[i])});}
for(const c of cases) {
  const blocks=Buffer.from(c.blocks),packets=Buffer.from(c.packets),lods=Buffer.from(c.lods),pending=Buffer.from(c.pending),vrefs=Buffer.from(c.vrefs),irefs=Buffer.from(c.irefs);
  const state:TerrainBinDrawState={drawBlocks:c.enabled?blocks:null,packets,indexBases:Array.from({length:59},(_,i)=>c.model.readBigUInt64LE(0x3b8+i*8)),vertexPointer:c.model.readBigUInt64LE(0x5d8),lods:new Uint16Array(lods.buffer,lods.byteOffset,c.bins),pendingLods:new Uint16Array(pending.buffer,pending.byteOffset,c.bins)};
  let locks=0,unlocks=0,injectBin=0xffffffff,injectLod=0;
  const services:TerrainBinReleaseServices={drawBase,vertexReferences:{entries:vrefs,count:c.vcount},indexReferences:{entries:irefs,count:c.icount},withExclusiveDrawAccess(action){locks++;if(injectBin<c.bins){state.lods[injectBin]=injectLod;injectBin=0xffffffff;}try{action();}finally{unlocks++;}}};
  const outputs:unknown[]=[];
  for(const s of c.steps) {
    locks=unlocks=0;injectBin=s.injectBin;injectLod=s.injectLod;
    const desired=Buffer.from(s.desired);
    let jobDirection=0;
    if(s.operation===0)updateTerrainBinVisibility(state,new Uint16Array(desired.buffer,desired.byteOffset,c.bins),services);else if(s.operation===1)releaseTerrainBinDraw(state,s.bin,services);else {dispatchTerrainBinLodJob(state,s.bin,s.injectLod,{refine(){jobDirection=1;},coarsen(){jobDirection=2;}});jobDispatches++;}
    const info=take(20),actualInfo=Buffer.alloc(20);[locks,unlocks,services.vertexReferences.count,services.indexReferences.count,jobDirection].forEach((v,i)=>actualInfo.writeUInt32LE(v,i*4));compare(c.name,'locks-reference-counts-dispatch',info,actualInfo);exclusiveSections+=locks;steps++;
    const output:Record<string,unknown>={operation:s.operation,bin:s.bin,injectBin:s.injectBin,injectLod:s.injectLod,desiredHex:s.desired.toString('hex'),locks:info.readUInt32LE(0),unlocks:info.readUInt32LE(4),vcount:info.readUInt32LE(8),icount:info.readUInt32LE(12),jobDirection:info.readUInt32LE(16)};
    for(const [field,actual] of [['blocks',blocks],['lods',lods],['pending',pending],['vrefs',vrefs],['irefs',irefs],['desired',desired]] as const){const expected=take(actual.length);compare(c.name,field,expected,actual);if(c.save)output[field+'Hex']=expected.toString('hex');}
    if(c.save)outputs.push(output);
  }
  compare(c.name,'packets',take(c.packets.length),c.packets);compare(c.name,'model',take(c.model.length),c.model);compare(c.name,'js-packets',c.packets,packets);
  if(c.save)saved.push({name:c.name,bins:c.bins,enabled:c.enabled,drawBase:drawBase.toString(),modelHex:c.model.toString('hex'),blocksHex:c.blocks.toString('hex'),packetsHex:c.packets.toString('hex'),lodsHex:c.lods.toString('hex'),pendingHex:c.pending.toString('hex'),vrefsHex:c.vrefs.toString('hex'),irefsHex:c.irefs.toString('hex'),vcount:c.vcount,icount:c.icount,steps:outputs});
}
if(at!==raw.length)throw new Error('Unread terrain lifecycle output');
const scope='Unmodified original TerrainBarn release 0x1006a8100 normal path and original visibility-transition span 0x1006a331f..0x1006a343a execute with complete original prepare 0x1006a7b50 and heap reference removal 0x10077e4b0. Imported exclusive-access and bzero services are explicit serialized host callbacks; release/prepare/removal bodies are not patched. Lock callbacks optionally update the selected LOD to verify its post-lock re-read. Compare all draw bytes, all bins, reference records/counts including stale discarded tails and 64-byte guards, LOD/pending markers, lock balance, unchanged desired targets and normalized model/packets. Native creation packets from zero-initialized heap sample first/middle/last bins across all 77 records in 31 maps; original packet offsets retained, bins reindexed only in isolated snapshots. Synthetic fine-LOD draw contents and heap registrations are explicit snapshots, not restored tessellation outputs. Ownership deregistration does not prove allocation reclamation. Actual distance-sort/LOD job queue, tessellation, concurrency, loaders, Camera, viewport, hardware/game remain open.';
const report={passed:!failed,executableSha256:hash,scope:scope+' Complete TessBinJob 0x1006ad3f0 dispatch uses explicit recording callbacks at refinement/coarsening entries, verifying signed int16 comparison including equality and hidden/sentinel words. Worker bodies and automatic queue are not claimed.',functions:{release:'0x1006a8100',visibility:{start:'0x1006a331f',end:'0x1006a343a'},prepare:'0x1006a7b50',removeReferences:'0x10077e4b0',jobDispatch:'0x1006ad3f0'},cases:cases.length,steps,exclusiveSections,jobDispatches,compared,failed,failures,corpusMaps:corpusMaps.size,corpusRecords:packetCorpus.cases.length,corpusBins,selectedBins,visibilityTransitionsVerified:true,heapReferenceRemovalVerified:true,postLockLodRereadVerified:true,jobDispatchVerified:true,allocationReclamationRestored:false,lodTransitionsAndJobsRestored:false,actualLoaderRestored:false,viewportIntegrated:false};
fs.writeFileSync('docs/terrain-bin-lifecycle-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/terrain-bin-lifecycle-native.json.gz',gzipSync(JSON.stringify({executableSha256:hash,scope,cases:saved})+'\n'));else fs.writeFileSync(`docs/terrain-bin-lifecycle-failure-${Date.now()}.json`,JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
