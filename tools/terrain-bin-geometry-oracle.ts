import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {gzipSync} from 'node:zlib';
import {MeshesDocument} from '../src/core/meshes';
import {nativeMaterialDefs} from '../src/core/mesh-surfaces';
import {buildTerrainBinGeometry,type TerrainBinSource} from '../src/core/terrain-bin-geometry';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied executable');
interface Case {name:string;level:string;source:TerrainBinSource;vertices:Buffer;bounds:Float32Array;grid:Buffer;fill:number;save:boolean;}
const cases:Case[]=[],identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1],yaw=[0,0,-1,0,0,1,0,0,1,0,0,0,12.5,-3,24,1];
const bytes=(a:Float32Array|Uint32Array|Uint16Array|Uint8Array)=>Buffer.from(a.buffer,a.byteOffset,a.byteLength);
function geometry(name:string,level:string,vertices:Buffer,indices:Uint32Array,bins:TerrainBinSource['bins'],grid:Buffer,bounds:Float32Array,transform:number[],fill:number,save:boolean):Case {
  const vertexCount=vertices.length/36,positions=new Float32Array(vertexCount*3),materialIds=new Uint8Array(vertexCount*4),weights=new Uint8Array(vertexCount*4);
  for(let i=0;i<vertexCount;i++){for(let lane=0;lane<3;lane++)positions[i*3+lane]=vertices.readFloatLE(i*36+lane*4);materialIds.set(vertices.subarray(i*36+16,i*36+20),i*4);weights.set(vertices.subarray(i*36+20,i*36+24),i*4);}
  return {name,level,vertices,grid,bounds,fill,save,source:{vertexCount,indices,positions,materialIds,weights,bins,gridOrigin:[0,4,8].map(at=>grid.readFloatLE(at)),cellSize:grid.readFloatLE(0x20),transform}};
}
let seed=0x318a9000;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;};
for(const binCount of [0,1,2,3,8,16])for(const fill of [0,0x55]) {
  const vertices=Buffer.alloc(36*24),indices=Uint32Array.from({length:binCount*9},()=>random()%24),bins=Array.from({length:binCount},(_,i)=>({count:9,raw:((i&255)|((i*7&255)<<8)|((i*13&255)<<16)|(0xab<<24))>>>0}));
  const grid=Buffer.alloc(48);[-3.25,5,12.5].forEach((v,lane)=>grid.writeFloatLE(v,lane*4));grid.writeFloatLE(7.25,0x20);
  const defs=nativeMaterialDefs('Dawn');
  for(let i=0;i<24;i++){for(let lane=0;lane<3;lane++)vertices.writeFloatLE((random()%10000)/128-30,i*36+lane*4);vertices[i*36+16]=defs[i%4].materialId;vertices[i*36+20]=255;}
  cases.push(geometry(`synthetic-${binCount}-${fill}`,'Dawn',vertices,indices,bins,grid,Float32Array.from([-50,-50,-50,0,50,50,50,0]),fill?yaw:identity,fill,true));
}
// Native ignores unordered XYZ during bounds gathering and still consumes
// all referenced material slots. Empty bins retain FLT_MAX/-FLT_MAX extrema.
for(const special of ['nan','zero','empty','uint16-count']) {
  const vertices=Buffer.alloc(36*3),grid=Buffer.alloc(48);grid.writeFloatLE(2,0x20);
  for(let i=0;i<3;i++){vertices.writeFloatLE(special==='nan'?NaN:i===0?-0:0,i*36);vertices.writeFloatLE(i,i*36+4);vertices.writeFloatLE(i-1,i*36+8);vertices[i*36+16]=nativeMaterialDefs('Dawn')[0].materialId;vertices[i*36+20]=255;}
  const count=special==='empty'?0:special==='uint16-count'?65538:3,indices=Uint32Array.from({length:count},(_,i)=>i%3),bins=[{count,raw:0}];
  cases.push(geometry(special,'Dawn',vertices,indices,bins,grid,Float32Array.from([-1,-1,-1,0,2,2,2,0]),identity,0x55,special!=='uint16-count'));
}
const data=path.resolve(executable,'../../Data/Levels');let corpusMaps=0,corpusRecords=0,corpusBins=0,savedMaps=0;
for(const level of fs.readdirSync(data).sort()) {
  const file=path.join(data,level,'BstBaked.meshes');if(!fs.existsSync(file))continue;
  const doc=new MeshesDocument(fs.readFileSync(file)),geometries=doc.geometries.filter(g=>g.kind==='terrain');if(!geometries.length)continue;corpusMaps++;
  for(const g of geometries) {
    const metadata=g.metadata!,patches=metadata.patches as {count:number;raw:number}[],gridBounds=metadata.gridBounds as number[],dimensions=metadata.dimensions as number[],grid=Buffer.alloc(48);
    gridBounds.slice(0,3).forEach((v,lane)=>grid.writeFloatLE(v,lane*4));gridBounds.slice(3,6).forEach((v,lane)=>grid.writeFloatLE(v,16+lane*4));grid.writeFloatLE(Number(metadata.cellSize),32);dimensions.forEach((v,lane)=>grid.writeUInt32LE(v,36+lane*4));
    const bounds=Float32Array.from([...g.bounds!.slice(0,3),0,...g.bounds!.slice(3,6),0]),vertices=doc.lod.subarray(g.vertexOffset,g.vertexOffset+g.vertexCount*36);
    const save=g.vertexCount<=2048&&patches.length<=64&&savedMaps<2;if(save)savedMaps++;
    cases.push({...geometry(`map-${level}-${g.id}`,level,vertices,g.indices,patches,grid,bounds,identity,0,save),source:doc.terrainBinSource(g,identity)});
    // Original creation enforces unit axis lengths but permits rotation. Its
    // world extrema are transformed separately and can become inverted.
    cases.push({...geometry(`map-${level}-${g.id}-yaw`,level,vertices,g.indices,patches,grid,bounds,yaw,0x55,false),source:doc.terrainBinSource(g,yaw)});
    corpusRecords++;corpusBins+=patches.length;
  }
}
const chunks:Buffer[]=[];const uints=(a:number[])=>{const b=Buffer.alloc(a.length*4);a.forEach((v,i)=>b.writeUInt32LE(v,i*4));chunks.push(b);};
uints([cases.length]);for(const c of cases){uints([c.source.vertexCount,c.source.indices.length,c.source.bins.length,c.fill]);const name=Buffer.alloc(128);name.write(c.level);chunks.push(name,bytes(c.bounds),c.grid,bytes(Float32Array.from(c.source.transform)),c.vertices,bytes(Uint16Array.from(c.source.indices)));uints(c.source.bins.flatMap(bin=>[bin.count,bin.raw]));}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-terrain-bin-geometry-'));let raw:Buffer;
const input=Buffer.concat(chunks),inputSha256=crypto.createHash('sha256').update(input).update(fs.readFileSync('tools/native-terrain-bin-geometry-oracle.c')).update(hash).digest('hex');
const cache='/root/sky-research/terrain-bin-geometry-native-output';
try {
 if(fs.existsSync(cache+'.json')&&JSON.parse(fs.readFileSync(cache+'.json','utf8')).inputSha256===inputSha256&&fs.existsSync(cache+'.bin'))raw=fs.readFileSync(cache+'.bin');
 else {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-terrain-bin-geometry-oracle.c','-lm','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,timeout:180000,maxBuffer:256*1024*1024});
  if(run.status!==0){fs.writeFileSync(`docs/terrain-bin-geometry-runner-failure-${Date.now()}.json`,JSON.stringify({executableSha256:hash,status:run.status,signal:run.signal,error:run.error?.message,stderr:run.stderr.toString()},null,2)+'\n');throw new Error(`Original terrain creation failed (${run.status}): ${run.stderr}`);}raw=run.stdout;
  fs.mkdirSync(path.dirname(cache),{recursive:true});fs.writeFileSync(cache+'.bin',raw);fs.writeFileSync(cache+'.json',JSON.stringify({inputSha256,executableSha256:hash})+'\n');
 }
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Terrain creation output groups');let at=4,failed=0,compared=0;const failures:unknown[]=[],saved:unknown[]=[],packetCorpus:unknown[]=[];
const read32=()=>{const value=raw.readUInt32LE(at);at+=4;return value;},take=(length:number)=>{if(at+length>raw.length)throw new Error('Truncated native output');const value=raw.subarray(at,at+length);at+=length;return value;};
function compare(name:string,field:string,expected:Buffer,actual:Buffer,numeric=false){
  const offsets:number[]=[];if(expected.length!==actual.length)throw new Error(`Storage size ${name}/${field}`);
  for(let i=0;i<expected.length;i+=numeric?4:1){compared++;const equal=numeric&&i<actual.length-64?Object.is(expected.readFloatLE(i),actual.readFloatLE(i)):expected.subarray(i,i+(numeric?4:1)).equals(actual.subarray(i,i+(numeric?4:1)));if(!equal){failed++;if(offsets.length<12)offsets.push(i);}}
  if(offsets.length&&failures.length<20)failures.push({name,field,offsets,expected:offsets.map(i=>numeric?String(expected.readFloatLE(i)):expected[i]),actual:offsets.map(i=>numeric?String(actual.readFloatLE(i)):actual[i])});
}
for(const c of cases) {
  const before=read32(),after=read32();compared++;if((before&0xffc0)!==(after&0xffc0)){failed++;failures.push({name:c.name,before,after});}
  const initialPackets=new Uint8Array(c.source.bins.length*128).fill(c.fill),result=buildTerrainBinGeometry(c.source,nativeMaterialDefs(c.level),initialPackets);
  const nativeBinCounts=take(59*4),nativeSurfaceCounts=take(59*4);
  compare(c.name,'surfaceBinCounts',nativeBinCounts,bytes(result.surfaceBinCounts));compare(c.name,'surfaceCounts',nativeSurfaceCounts,bytes(result.surfaceCounts));
  const storage:Record<string,string>={};
  for(const [field,array,numeric] of [['spheres',result.spheres,true],['lods',result.lods,false],['pending',new Uint8Array(c.source.bins.length*2).fill(c.fill),false],['minima',result.minima,true],['maxima',result.maxima,true],['packets',result.packets,false]] as const) {
    const length=read32(),expected=take(length+64),actual=Buffer.concat([bytes(array),Buffer.alloc(64,c.fill)]);compare(c.name,field,expected,actual,numeric);storage[field]=expected.toString('hex');
  }
  const nativeIndexStreams:{selector:number;indices:number[]}[]=[];
  for(let selector=0;selector<59;selector++){const length=read32(),expected=take(length+64),indices=result.indexStreams.find(s=>s.selector===selector)?.indices??new Uint32Array(),actual=Buffer.concat([bytes(Uint16Array.from(indices)),Buffer.alloc(64,c.fill)]);compare(c.name,`index-stream-${selector}`,expected,actual);if(c.save&&length)nativeIndexStreams.push({selector,indices:Array.from({length:length/2},(_,i)=>expected.readUInt16LE(i*2))});}
  const allocations=read32(),releases=read32(),events=Array.from({length:allocations},()=>[read32(),read32(),read32()]);
  // Allocation sizes inside scatter remain original execution evidence; its
  // helpers have multiple fast paths, so do not infer an allocation policy.
  const expectedReleases=(c.source.bins.length+1)*3+1;compared++;if(releases!==expectedReleases){failed++;failures.push({name:c.name,releases,expectedReleases,events});}
  if(c.save)saved.push({name:c.name,level:c.level,vertexCount:c.source.vertexCount,positionsHex:bytes(c.source.positions).toString('hex'),materialIdsHex:bytes(c.source.materialIds).toString('hex'),weightsHex:bytes(c.source.weights).toString('hex'),indices:Array.from(c.source.indices),bins:c.source.bins,gridOrigin:Array.from(c.source.gridOrigin),cellSize:c.source.cellSize,transform:Array.from(c.source.transform),fill:c.fill,storage,surfaceBinCounts:Array.from({length:59},(_,i)=>nativeBinCounts.readUInt32LE(i*4)),surfaceCounts:Array.from({length:59},(_,i)=>nativeSurfaceCounts.readUInt32LE(i*4)),indexStreams:nativeIndexStreams});
  if(c.name.startsWith('map-')&&c.fill===0) {
    const count=c.source.bins.length,selected=Array.from(new Set([0,Math.max(0,Math.floor(count/2)-16),Math.max(0,count-32)].flatMap(start=>Array.from({length:Math.min(32,count-start)},(_,i)=>start+i)))).sort((a,b)=>a-b);
    const nativePackets=Buffer.from(storage.packets,'hex');
    packetCorpus.push({name:c.name,level:c.level,originalBinCount:count,selectedBins:selected,packetsHex:Buffer.concat(selected.map(bin=>nativePackets.subarray(bin*128,bin*128+128))).toString('hex')});
  }
}
if(at!==raw.length)throw new Error('Unread terrain creation output');
const scope='Complete original TerrainBarn creation normal body 0x1006a9000 and original GetScale 0x100789e80, bounds-to-OBB 0x10078c950, matrix multiply 0x100076df0 and global/per-bin scatter 0x1006a7280 execute continuously under ambient RTE. CPU heap/scratch getter/allocate/release and imported memory/string/powf use explicit host services. Explicit terrain+0xc1=1 suppresses CollisionGeoBarn registration; loaded terrain fields/material definition pointers, free-list model and Barn capacity are harness snapshots. JS parity covers produced bin sphere xyz/radius, all four minima/maxima lanes (arithmetic NaN payload excluded), LOD FFFF, untouched pending bytes, every packet byte including untouched empty slots, 59 surface populations/counts and complete index streams plus 64-byte guards. All 77 serialized terrain records and original patch partitions/grid metadata in 31 maps use identity and explicit unit-scale yaw transforms; these are not original object transforms or proof of actual loader state. Packet overflow above 16 nonempty surfaces is rejected; uint16 count truncation, ignored NaN positions, signed zeros and empty bins covered. Allocation policy, other model fields, collision, LOD jobs/transitions, actual loaded object/resource registration, RTZ creation, viewport/GPU/hardware/game remain unverified.';
const report={passed:!failed,executableSha256:hash,scope,cases:cases.length,compared,failed,failures,corpusMaps,corpusRecords,corpusBins,binGeometryAndPacketsVerified:true,actualLoaderRestored:false,collisionRegistrationRestored:false,lodTransitionsAndJobsRestored:false,viewportIntegrated:false};
fs.writeFileSync('docs/terrain-bin-geometry-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed) {
  fs.writeFileSync('tests/fixtures/terrain-bin-geometry-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n'));
  fs.writeFileSync('tests/fixtures/terrain-bin-packets-corpus-native.json.gz',gzipSync(JSON.stringify({executableSha256:hash,scope:'Native creation packets with explicit zero-initialized heap; up to 32 bins at each start/middle/end from all 77 records. Original offsets retained; sampled bins are reindexed only for isolated lifecycle snapshots, not actual loaded state.',cases:packetCorpus})+'\n'));
}
else fs.writeFileSync(`docs/terrain-bin-geometry-failure-${Date.now()}.json`,JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
