import fs from 'node:fs';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {ObjectsDocument} from '../src/core/objects';import {prepareSceneFoundation,evaluateSceneFoundation,SCENE_FOUNDATION_OPERATIONS,type SceneFoundationCase} from './scene-foundation-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
const executableSha256=sha(fs.readFileSync(executable));if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable required');
const kinds=['Parent','CameraKeyFrame','TerrainBlob'] as const,cases:SceneFoundationCase[]=[],f=(values:number[])=>Buffer.from(Float32Array.from(values).buffer).toString('base64'),identity=f([1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]),obb=f([.5,0,0,0,0,.5,0,0,0,0,.5,0,0,0,0,1]);
for(const kind of kinds)for(const operation of ['placement','allocate'] as const)for(const seed of [0,1,127,255])for(const classId of [0,1,0x80000000,0xffffffff])for(const mutate of [false,true])cases.push({label:`prepared/${kind}/${operation}/${seed}/${classId}/${mutate}`,kind,operation,seed,classId,classIdAfterEnsure:mutate?63:undefined});
for(const kind of ['CameraKeyFrame','TerrainBlob'] as const)for(const offset of [0x100,0x110,0x120,0x130,0x140,0x600])for(const matrix of [identity,f([-2,0,0,0,0,3,0,0,0,0,0,0,12,-10,4,1]),f([1,2,3,0,4,5,6,0,7,8,10,0,-20,30,10,1])]){
 cases.push({label:`prepared/${kind}/set-alias/${offset}/${matrix}`,kind,operation:'setTransform',seed:37,classId:1,matrix,obb,sourceOffset:offset});
 cases.push({label:`prepared/${kind}/get-alias/${offset}`,kind,operation:'getTransform',seed:37,classId:1,outputOffset:offset});
 if(kind==='TerrainBlob')cases.push({label:`prepared/${kind}/obb-alias/${offset}`,kind,operation:'getObb',seed:37,classId:1,obb,outputOffset:offset});
}
for(const enabled of [0,1,2,127,255])for(const operation of ['setEnabled','getEnabled'] as const)cases.push({label:`prepared/Parent/${operation}/${enabled}`,kind:'Parent',operation,seed:enabled,classId:1,enabled});
for(const seed of [0,1,127,255])cases.push({label:`prepared/camera/hotDate/${seed}`,kind:'CameraKeyFrame',operation:'hotDate',seed,classId:1});
for(const component of [0,-0,1,-1,1e-30,1e30,Infinity,-Infinity,NaN])for(let row=0;row<4;row++){
 const a=[1,0,0,0,0,1,0,0,0,0,1,0,2,3,4,1];a[row]=component;cases.push({label:`prepared/aabb/${component}/${Object.is(component,-0)}/${row}`,kind:'TerrainBlob',operation:'aabb',seed:9,classId:1,matrix:f(a)});
}
const preparedCases=cases.length,corpus={TerrainBlob:0,CameraKeyFrame:0,Parent:0},sourceHashes:Record<string,string>={};
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;const bytes=fs.readFileSync(file),nodes=new ObjectsDocument(bytes).nodes;sourceHashes[level]=sha(bytes);
 for(const node of nodes.filter(n=>kinds.includes(n.className as typeof kinds[number]))){const kind=node.className as typeof kinds[number];corpus[kind]++;
  if(kind==='Parent'){const field=node.fields.find(f=>f.name==='enabled');cases.push(field?{label:`${level}/#${node.id}/Parent/enabled`,kind,operation:'setEnabled',classId:1,seed:node.id,enabled:Number(field.value)}:{label:`${level}/#${node.id}/Parent/prepared-placement-no-saved-enabled`,kind,operation:'placement',classId:1,seed:node.id});continue;}
  const field=node.fields.find(f=>f.name==='transform');if(!field||field.length!==64)throw new Error('Missing original transform');const matrix=Buffer.from(field.raw,'hex').toString('base64');
  cases.push({label:`${level}/#${node.id}/${kind}/set`,kind,operation:'setTransform',seed:node.id,classId:1,matrix,obb});
  cases.push({label:`${level}/#${node.id}/${kind}/get`,kind,operation:'getTransform',seed:node.id,classId:1,matrix,sourceOffset:0x110});
 }
}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-scene-foundation-'));
try{
 const input=path.join(temp,'input.bin'),output=path.join(temp,'output.bin'),fd=fs.openSync(input,'w'),head=Buffer.alloc(4);head.writeUInt32LE(cases.length);fs.writeSync(fd,head);
 for(const c of cases){const p=prepareSceneFoundation(c),h=Buffer.alloc(24);[kinds.indexOf(c.kind),SCENE_FOUNDATION_OPERATIONS.indexOf(c.operation),p.source,p.out,c.classIdAfterEnsure??0xffffffff,c.enabled??0].forEach((n,i)=>h.writeUInt32LE(n>>>0,i*4));fs.writeSync(fd,h);fs.writeSync(fd,p.b);}fs.closeSync(fd);
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-msse4.1','-Wall','-Wextra','tools/native-scene-foundation-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const infd=fs.openSync(input,'r'),outfd=fs.openSync(output,'w'),run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{stdio:[infd,outfd,'pipe'],timeout:120000});fs.closeSync(infd);fs.closeSync(outfd);if(run.status!==0)throw new Error(`Native scene foundation failed: ${run.status} ${run.stderr}`);
 const actual=fs.readFileSync(output);if(actual.length!==4+cases.length*4128||actual.readUInt32LE(0)!==cases.length)throw new Error('Invalid native output');const failures:unknown[]=[],fixture:unknown[]=[];
 for(const [i,c] of cases.entries()){const b=actual.subarray(4+i*4128,4+(i+1)*4128),expected=evaluateSceneFoundation(c);if(!b.equals(expected)){const offsets=[];for(let j=0;j<b.length;j++)if(b[j]!==expected[j])offsets.push(j);failures.push({label:c.label,offsets:offsets.slice(0,20)});}fixture.push({input:c,nativeSha256:sha(b)});}
 const scope='Whole normal allocating/placement constructors of Parent/CameraKeyFrame/TerrainBlob, Parent enabled leaves, CameraKeyFrame HotDate/transform leaves, TerrainBlob transform/local OBB and original Obb matrix product/world AABB leaf. Allocation and Object metadata bootstrap are explicit services, with live class ID reads and ordered allocation/ensure capture. Compare all 4096 prepared bytes and normalized return/service metadata; matrix aliases and AABB signed-zero/NaN/Infinity branches included. Real saved matrices are prepared direct calls with explicit local OBB; shape-derived OBB construction, TGCL default/cache/Barn/map lifecycle, terrain generation/rebaking, Parent following/joints, CameraSystem dispatch and whole-class acceptance remain open.';
 const report={passed:!failures.length,executableSha256,scope,cases:cases.length,preparedCases,corpus,comparedBytes:cases.length*4128,sourceHashes,failures};fs.writeFileSync('docs/scene-foundation-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/scene-foundation-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256,cases:fixture})));
 console.log(JSON.stringify({...report,sourceHashes:undefined,failures:failures.slice(0,15),failureCount:failures.length}));if(failures.length)process.exitCode=1;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
