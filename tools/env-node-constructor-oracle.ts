import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { gzipSync } from 'node:zlib';
import { ObjectsDocument } from '../src/core/objects';
import { readEnvironmentStorage } from '../src/core/environment-storage';
import { constructOriginalEnvNode, ENV_NODE_GROUPS } from '../src/core/env-node-runtime';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const executableSha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable required');
const cases:{label:string;initial:string;raw:string;mask:string;ids:number[]}[]=[];
const ids=(i:number)=>[0x12345+i,0x10000+i,...ENV_NODE_GROUPS.map((_,j)=>(0x80000000+j+i)>>>0)];
for(let i=0;i<12;i++)cases.push({label:'prepared/'+i,initial:Buffer.from(Array.from({length:0x410},(_,j)=>(i*17+j*113)&255)).toString('base64'),raw:Buffer.alloc(0x410).toString('base64'),mask:Buffer.alloc(0x410).toString('base64'),ids:ids(i)});
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;
 const nodes=new ObjectsDocument(fs.readFileSync(file)).nodes;
 for(const node of nodes.filter(n=>n.className==='EnvNode')){const bytes=readEnvironmentStorage(node),raw=Buffer.alloc(0x410),mask=Buffer.alloc(0x410);raw.set(bytes.storage);mask.set(bytes.known);cases.push({label:`${level}/#${node.id}`,initial:Buffer.alloc(0x410,0xa5).toString('base64'),raw:raw.toString('base64'),mask:mask.toString('base64'),ids:ids(cases.length)});}
}
const head=Buffer.alloc(4);head.writeUInt32LE(cases.length);
const bytes=Buffer.concat([head,...cases.flatMap(c=>{const id=Buffer.alloc(40);c.ids.forEach((v,i)=>id.writeUInt32LE(v>>>0,i*4));return[id,Buffer.from(c.initial,'base64'),Buffer.from(c.raw,'base64'),Buffer.from(c.mask,'base64')];})]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-envnode-'));let native:Buffer;
try{const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','tools/native-ambience-sun-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable,'--envnode'],{input:bytes,maxBuffer:10e6,timeout:60000});if(run.status!==0)throw new Error(`EnvNode native failure ${run.status} ${run.stderr}`);native=run.stdout;}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(native.readUInt32LE(16)!==cases.length||native.length!==20+cases.length*(0x820+4))throw new Error('Bad native output');
const failures:unknown[]=[],fixtures:unknown[]=[];let offset=20;
for(const c of cases){const ctor=native.subarray(offset,offset+0x410),loaded=native.subarray(offset+0x410,offset+0x820),calls=native.readUInt32LE(offset+0x820);offset+=0x824;const storage=Uint8Array.from(Buffer.from(c.initial,'base64'));let n=0;
 constructOriginalEnvNode(storage,{ensureBaseMetaType:()=>{n++;},envNodeClassId:()=>c.ids[0],genericValueClassId:()=>c.ids[1],groupClassId:name=>c.ids[2+ENV_NODE_GROUPS.findIndex(([g])=>g===name)],zeroColor:()=>new Uint8Array(Float32Array.from([0,0,0,1]).buffer),vptr:ctor.readBigUInt64LE(0)});
 if(!Buffer.from(storage).equals(ctor)||n!==calls)failures.push({label:c.label,phase:'constructor',calls:[n,calls]});
 const raw=Buffer.from(c.raw,'base64'),mask=Buffer.from(c.mask,'base64');for(let i=0;i<0x410;i++)if(mask[i])storage[i]=raw[i];if(!Buffer.from(storage).equals(loaded))failures.push({label:c.label,phase:'prepared saved/default field overlay'});
 fixtures.push({...c,vptr:ctor.readBigUInt64LE(0).toString(),nativeCtor:ctor.toString('base64'),nativeLoaded:loaded.toString('base64'),baseMetaCalls:calls});
}
const scope='Entire original EnvNode constructor 0x10031c830, original initialized Color globals and original eight typed meta getters. Base-meta initialization, registry IDs/vptr and saved/default field masks are explicit prepared services; comparison of all 1040 storage bytes preserves unwritten enabled/transform/private fields. Applying the prepared TGCL mask does not execute the full original parser/cache/registration. Original queue/registration has separate old evidence. No complete EnvNode, arbitrary metadata, startup/lifecycle/derived-class/game parity claim.';
const report={passed:failures.length===0,executableSha256,scope,cases:cases.length,corpusEnvNodes:cases.length-12,comparedBytes:cases.length*0x820,failures};fs.writeFileSync('docs/env-node-constructor-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/env-node-constructor-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256,cases:fixtures})));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
