import fs from 'node:fs';import {spawnSync} from 'node:child_process';import {createHash} from 'node:crypto';import * as THREE from 'three';
import os from 'node:os';import path from 'node:path';import {gzipSync} from 'node:zlib';
import {buildOriginalOceanGeometry,type OceanGeometryInput} from '../src/core/ocean-geometry-runtime';import {originalAmbiencePlanetSphere} from '../src/core/ambience-sun-runtime';
const executable='/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',expected='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
if(createHash('sha256').update(fs.readFileSync(executable)).digest('hex')!==expected)throw new Error('Original executable SHA differs');
const temporary=fs.mkdtempSync(path.join(os.tmpdir(),'sky-ocean-oracle-')),runner=path.join(temporary,'oracle');
const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-static','-mavx','tools/native-ocean-geometry-oracle.c','-lm','-o',runner],{encoding:'utf8'});if(build.status!==0)throw new Error(build.stderr);
const math={rsqrt:(n:number)=>Math.fround(1/Math.sqrt(n)),asin:Math.asin,sincos:(n:number)=>({sin:Math.fround(Math.sin(n)),cos:Math.fround(Math.cos(n))}),pow:(n:number,e:number)=>Math.fround(Math.pow(n,e))};
const cases:OceanGeometryInput[]=[];
for(const eye of [[0,2,0],[530,208,-45],[0,100,0],[0,1000,0]])for(const pitch of [-85,-45,-5,30,85]){
 const camera=new THREE.PerspectiveCamera(55,1.5,.1,64000);camera.position.fromArray(eye);camera.lookAt(camera.position.clone().add(new THREE.Vector3(0,Math.sin(pitch*Math.PI/180),-Math.cos(pitch*Math.PI/180))));camera.updateMatrixWorld();
 const m=camera.matrixWorld.elements,u=m.slice(0,3).map(n=>2*n/camera.projectionMatrix.elements[0]),v=m.slice(4,7).map(n=>2*n/camera.projectionMatrix.elements[5]);
 cases.push({eye,sphere:originalAmbiencePlanetSphere(eye),axis:m.slice(0,3),planeU:u,planeV:v,planeOrigin:m.slice(8,11).map((n,i)=>-n-u[i]*.5-v[i]*.5),tanHalfFov:1/camera.projectionMatrix.elements[5]});
}
const bytes=Buffer.concat(cases.map(c=>{const values=[...c.eye,1,...c.sphere,...c.axis,0,...c.planeU,0,...c.planeV,0,...c.planeOrigin,0,c.tanHalfFov,0,0,0,0],b=Buffer.alloc(29*4);values.forEach((n,i)=>b.writeFloatLE(n,i*4));return b;}));
const run=spawnSync('qemu-x86_64',['-cpu','max',runner,executable],{input:bytes,maxBuffer:32*1024*1024});if(run.status!==0)throw new Error('Native oracle failed: '+run.status+' '+run.stderr);
const captured=new Map<string,number[]>(),missing=new Map<string,{kind:number;a:number;b:number}>(),key=(kind:number,a:number,b:number)=>{const bytes=Buffer.alloc(12);bytes.writeUInt32LE(kind);bytes.writeFloatLE(a,4);bytes.writeFloatLE(b,8);return bytes.toString('hex');};
function call(kind:number,a:number,b=0){const k=key(kind,a,b),known=captured.get(k);if(known)return known;missing.set(k,{kind,a,b});return kind===1?[Math.fround(math.asin(a)),0]:kind===2?[math.sincos(a).sin,math.sincos(a).cos]:kind===3?[math.pow(a,b),0]:[math.rsqrt(a),0];}
const replay={rsqrt:(n:number)=>call(4,n)[0],asin:(n:number)=>call(1,n)[0],sincos:(n:number)=>{const q=call(2,n);return {sin:q[0],cos:q[1]};},pow:(n:number,e:number)=>call(3,n,e)[0]};
for(let pass=0;pass<8;pass++){
 missing.clear();cases.forEach(c=>buildOriginalOceanGeometry(c,replay));if(!missing.size)break;
 const requests=[...missing],input=Buffer.concat(requests.map(([k])=>Buffer.from(k,'hex'))),r=spawnSync('qemu-x86_64',['-cpu','max',runner,executable,'--math'],{input,maxBuffer:32*1024*1024});if(r.status!==0)throw new Error('Native math failed');requests.forEach(([k],i)=>captured.set(k,[r.stdout.readFloatLE(i*8),r.stdout.readFloatLE(i*8+4)]));
}
const prefix=spawnSync('qemu-x86_64',['-cpu','max',runner,executable,'--prefix'],{input:bytes,maxBuffer:32*1024*1024});if(prefix.status!==0)throw new Error('Native projection failed');
const stride=4+96*96*16,rows=cases.map((c,index)=>{const native=run.stdout.subarray(index*stride,(index+1)*stride),result=buildOriginalOceanGeometry(c,replay),view=new DataView(result.vertices.buffer);let maximumError=0,colorDifferences=0,nonfiniteDifferences=0,byteDifferences=0;
 for(let i=0;i<result.vertices.length;i++)if(native[i+4]!==result.vertices[i])byteDifferences++;
 for(let i=0;i<result.rows*96;i++){for(let lane=0;lane<3;lane++){const a=native.readFloatLE(4+i*16+lane*4),b=view.getFloat32(i*16+lane*4,true);if(!Number.isFinite(a)||!Number.isFinite(b)){if(Number.isFinite(a)!==Number.isFinite(b))nonfiniteDifferences++;continue;}maximumError=Math.max(maximumError,Math.abs(a-b));}for(let lane=12;lane<16;lane++)if(native[4+i*16+lane]!==result.vertices[i*16+lane])colorDifferences++;}
 return {eye:c.eye,planeOrigin:c.planeOrigin,rows:result.rows,indexCount:result.indexCount,nativeIndexCount:native.readUInt32LE(),maximumError,colorDifferences,nonfiniteDifferences,byteDifferences,...byteDifferences?{projection:result.projection,nativeProjection:Array.from({length:20},(_,i)=>prefix.stdout.readFloatLE(index*80+i*4))}: {}};});
const report={passed:rows.every(r=>r.indexCount===r.nativeIndexCount&&!r.byteDifferences),executableSha256:expected,scope:'Whole original Ocean dynamic grid function with real camera projection inputs and separately captured QEMU RSQRTSS/Linux float libm services. Full vertex bytes and index counts compared exactly. Production browser math and complete Ocean lifecycle/game pixels are separate.',mathPairs:captured.size,cases:rows};fs.writeFileSync('docs/ocean-geometry-oracle.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
if(report.passed)fs.writeFileSync('tests/fixtures/ocean-geometry-native.json.gz',gzipSync(JSON.stringify({executableSha256:expected,cases:cases.map((input,i)=>({input,indexCount:run.stdout.readUInt32LE(i*stride),vertices:run.stdout.subarray(i*stride+4,(i+1)*stride).toString('base64')})),math:[...captured]})));
fs.rmSync(temporary,{recursive:true,force:true});
