import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {gzipSync} from 'node:zlib';
import {spawnSync} from 'node:child_process';
import {queryVisibilitySpheres,type VisibilitySphereState} from '../src/core/visibility-spheres';
import {queryVisibilityAabbs} from '../src/core/visibility-aabbs';
import {qemuVisibilityMin} from '../src/core/visibility-raster';
import {MeshesDocument} from '../src/core/meshes';
import {visibilityMipLayout} from '../src/core/visibility-depth';
import {qemuVisibilityReciprocal} from '../src/core/visibility-transform';
import {qemuVisibilityMax,visibilityFloatFromBits as fromBits} from '../src/core/visibility-float';
import {ObjectsDocument} from '../src/core/objects';
import {readResourceMesh} from '../src/core/resources';
import {cloudCardLevelLayout} from '../src/core/cloud-card-level';

const aabb=process.argv.includes('--aabb'),label=aabb?'aabbs':'spheres';
const executable=process.argv.slice(2).find(v=>v!=='--aabb')??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(hash!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires supplied executable');
const identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
const projection=[1.73,0,0,0,0,2.3,0,0,0,0,-1.002,-1,0,0,-0.2002,0];
let seed=0x31851ace;const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/2**32;};
type Case={name:string;state:VisibilitySphereState;view:number[];projection:number[];spheres:Float32Array;maxima:Float32Array;initial:Uint32Array;initialize:boolean;save:boolean;};
const cases:Case[]=[];
function addCase(name:string,values:number[][],dimensions:number[],mode:number,view=identity,proj=projection,save=true) {
  const mips=visibilityMipLayout(dimensions[0],dimensions[1]);
  const words=mips.reduce((sum,m)=>sum+m.width*m.height,0)+32,depth=new Float32Array(words);
  for(let i=0;i<words;i++)depth[i]=mode%8===0?1:mode%8===1?0:mode%8===2?0.9:mode%8===3?((i*7)%31)/32:mode%8===4?random():mode%8===5?fromBits([0,0x80000000,1,0x80000001,0x00800000,0x80800000][i%6]):mode%8===6?fromBits([0x7fc00001,0x7f800000,0xff800000,0x3f000000][i%4]):0.999;
  const state:VisibilitySphereState={camera:mode===8?null:{view,projection:proj},disabled:mode===9,frustumOnly:mode===10,distanceLimit:mode===11?2:mode===12?0:10000,mips:mode===13?[]:mips,depth};
  const spheres=Float32Array.from((aabb?values.map(v=>[v[0]-v[3],v[1]-v[3],v[2]-v[3],v[3]]):values).flat());
  const maxima=Float32Array.from(values.flatMap(v=>[v[0]+v[3],v[1]+v[3],v[2]+v[3],v[3]])),initial=Uint32Array.from({length:values.length+8},(_,i)=>[0,123,0xffffffff,0x318faced][i%4]);
  cases.push({name,state,view,projection:proj,spheres,maxima,initial,initialize:mode%2===0,save});
}
const dimensions=[[64,48],[68,52],[128,96],[256,192],[1280,720],[1920,1080],[12,12],[4,4]];
for(const n of [0,1,2,3,4,5,6,7,8,15,16,17,31,32,33,63,64,65,127,128,129,511,512])for(let mode=0;mode<14;mode++) {
  const spheres=Array.from({length:n},()=>{const z=-0.125-random()*128;return [(random()-0.5)*-z,(random()-0.5)*-z,z,random()*-z*0.2];});
  addCase(`random-${n}-${mode}`,spheres,dimensions[(n+mode)%dimensions.length],mode,identity,projection,n<=8||n===512);
}
// Deliberately mix lanes around the mip exponent threshold. VPADDQ's carry
// crosses lane pairs, so an otherwise discarded adjacent sphere still matters.
for(const radius of [0,2**-20,0.01,0.125,0.5,1,2,4,16])for(const dim of dimensions.slice(0,6))for(let mode=0;mode<8;mode++) {
  const spheres:number[][]=[];
  for(const z of [-0.01,-0.1,-1,-10,-100])for(const axis of [0,1,2])for(const sign of [-1,1])for(const delta of [-(2**-20),0,2**-20]) {
    const s=[0,0,z,radius];s[axis]+=sign*(axis===2?radius:((-z+radius)/projection[axis===0?0:5]+delta));spheres.push(s);
  }
  addCase(`boundary-${radius}-${dim.join('x')}-${mode}`,spheres,dim,mode,identity,projection,dim[0]===64&&mode<4);
}
for(let run=0;run<512;run++) {
  const spheres=Array.from({length:run%19+1},()=>[(random()-0.5)*512,(random()-0.5)*512,(random()-0.5)*512,random()*128]);
  const view=Array.from({length:16},()=>Math.fround((random()-0.5)*4));
  const proj=Array.from({length:16},()=>Math.fround((random()-0.5)*4));
  addCase(`matrix-${run}`,spheres,dimensions[run%6],run%14,view,proj,run<32);
}
const data=path.resolve(executable,'../../Data'),cache=new Map<string,ReturnType<typeof readResourceMesh>>();
let corpusMaps=0,corpusSpheres=0;
let corpusGeometryBounds=0;
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;
  const doc=new ObjectsDocument(fs.readFileSync(file)),layout=cloudCardLevelLayout(doc.nodes,name=>{
    if(!cache.has(name))cache.set(name,readResourceMesh(fs.readFileSync(path.join(data,'Meshes/Bin',name+'.mesh'))));return cache.get(name)!;
  });
  const spheres=layout.cards.map(c=>c.sphere);corpusMaps++;corpusSpheres+=spheres.length;
  const center=spheres.length?spheres.reduce((sum,s)=>sum.map((v,i)=>v+s[i]),[0,0,0]).map(v=>v/spheres.length):[0,0,0];
  for(let mode=0;mode<4;mode++)addCase(`map-${level}-${mode}`,spheres,[256,192],mode,[...identity.slice(0,12),-center[0],-center[1],-center[2]-128,1],projection,false);
  if(aabb) {
    const meshFile=path.join(data,'Levels',level,'BstBaked.meshes');if(!fs.existsSync(meshFile))continue;
    const baked=new MeshesDocument(fs.readFileSync(meshFile)),bounds:number[][]=[];
    for(const g of baked.geometries) {
      if(!g.vertexCount)continue;
      const min=[Infinity,Infinity,Infinity],max=[-Infinity,-Infinity,-Infinity];
      for(let vertex=0;vertex<g.vertexCount;vertex++)for(let axis=0;axis<3;axis++) {
        const v=baked.lod.readFloatLE(g.vertexOffset+vertex*g.stride+axis*4);min[axis]=Math.min(min[axis],v);max[axis]=Math.max(max[axis],v);
      }
      bounds.push([...min,0,...max,0]);
    }
    corpusGeometryBounds+=bounds.length;
    for(let mode=0;mode<4;mode++) {
      addCase(`geometry-${level}-${mode}`,bounds.map(()=>[0,0,0,0]),[256,192],mode,[...identity.slice(0,12),-center[0],-center[1],-center[2]-128,1],projection,false);
      cases[cases.length-1].spheres=Float32Array.from(bounds.flatMap(b=>b.slice(0,4)));
      cases[cases.length-1].maxima=Float32Array.from(bounds.flatMap(b=>b.slice(4)));
    }
  }
}
const chunks:Buffer[]=[];
const uints=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n>>>0,i*4));chunks.push(b);};
const floats=(v:ArrayLike<number>)=>{const b=Buffer.alloc(v.length*4);Array.from(v).forEach((n,i)=>b.writeFloatLE(n,i*4));chunks.push(b);};
uints([cases.length]);
for(const c of cases) {
  const s=c.state;uints([aabb?8:7,c.spheres.length/4,Number(!!s.camera),Number(s.disabled),Number(s.frustumOnly),Number(c.initialize),s.mips.length,s.depth.length]);
  floats([s.distanceLimit]);floats(c.view);floats(c.projection);
  uints(s.mips.map(m=>m.width));uints(s.mips.map(m=>m.height));floats(s.mips.map(m=>m.logicalWidth));floats(s.mips.map(m=>m.logicalHeight));
  floats(s.depth);floats(c.spheres);if(aabb)floats(c.maxima);uints(Array.from(c.initial));
}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-visibility-spheres-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mavx','-Wall','-Wextra','-Werror','tools/native-visibility-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input:Buffer.concat(chunks),timeout:60000,maxBuffer:64*1024*1024});
  if(run.status!==0)throw new Error(`Original sphere query failed (${run.status}): ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(raw.readUInt32LE(0)!==cases.length)throw new Error('Invalid sphere group count');let at=4,compared=0,failed=0;
const failures:unknown[]=[],saved:unknown[]=[],failedInputs:unknown[]=[],rows:unknown[]=[];
for(const c of cases) {
  const before=raw.readUInt32LE(at),after=raw.readUInt32LE(at+4);at+=8;
  const expected=Array.from({length:c.initial.length},()=>{const v=raw.readUInt32LE(at);at+=4;return v;}),actual=c.initial.slice();
  if(aabb)queryVisibilityAabbs(c.state,c.spheres,c.maxima,c.spheres.length/4,actual,qemuVisibilityReciprocal,qemuVisibilityMin,qemuVisibilityMax);
  else queryVisibilitySpheres(c.state,c.spheres,c.spheres.length/4,actual,c.initialize,qemuVisibilityReciprocal,qemuVisibilityMax);
  let missed=0;
  // Exception flags can be sticky on disabled/count-zero exits. Compare the
  // restored control bits; the numeric query restores those on normal exits.
  compared++;if((before&0xffc0)!==(after&0xffc0))missed++;
  expected.forEach((v,i)=>{compared++;if(v!==actual[i]){missed++;if(failures.length<20)failures.push({name:c.name,index:i,expected:v,actual:actual[i],sphere:Array.from(c.spheres.subarray(i*4,i*4+4))});}});
  failed+=missed;rows.push({name:c.name,spheres:c.spheres.length/4,failed:missed,passed:missed===0});
  const snapshot={name:c.name,view:c.view,projection:c.projection,hasCamera:!!c.state.camera,disabled:c.state.disabled,frustumOnly:c.state.frustumOnly,distanceLimit:c.state.distanceLimit,mips:c.state.mips,depthHex:Buffer.from(c.state.depth.buffer).toString('hex'),spheresHex:Buffer.from(c.spheres.buffer).toString('hex'),...(aabb?{maximaHex:Buffer.from(c.maxima.buffer).toString('hex')}:{}),initial:Array.from(c.initial),initialize:c.initialize,expected};
  if(c.save)saved.push(snapshot);if(missed&&failedInputs.length<8)failedInputs.push(snapshot);
}
if(at!==raw.length)throw new Error('Unread sphere output');
const scope=`Original unmodified numeric Visibility ${aabb?'AABB query 0x100721ce0':'sphere query 0x100720dd0'} executes including four-lane SIMD, paired VPADDQ mip selection, exact inclusive tiled depth scans, early disabled/no-camera/no-mip initialization, recursive last-volume tail padding and MXCSR control restoration. Only imported memcpy/memset are host callbacks and stack cookie is supplied; diagnostic drawing disabled. Original stored camera matrices, depth and statuses are explicit snapshots, with synthetic projections for all 33 maps and their real CloudCard world ${aabb?'sphere-derived boxes plus all geometry vertex bounds':'spheres'}. Original camera preparation, resource/lifecycle, scratch allocator, Intel/Mac reciprocal/MAX behavior, actual game/GPU culling and diagnostic drawing remain unverified.`;
const report={passed:failed===0,executableSha256:hash,function:aabb?'0x100721ce0':'0x100720dd0',scope,cases:cases.length,corpusMaps,corpusSpheres,...(aabb?{corpusGeometryBounds}:{}),compared,failed,failures,rows};
fs.writeFileSync(`docs/visibility-${label}-oracle.json`,JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync(`tests/fixtures/visibility-${label}-native.json.gz`,gzipSync(JSON.stringify({scope,executableSha256:hash,cases:saved})+'\n'));
else fs.writeFileSync(`docs/visibility-${label}-failure-${Date.now()}.json`,JSON.stringify({...report,failedInputs},null,2)+'\n');
console.log(JSON.stringify({...report,rows:undefined}));if(!report.passed)process.exitCode=1;
