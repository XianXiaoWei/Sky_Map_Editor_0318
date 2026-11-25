import fs from 'node:fs';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {ObjectsDocument} from '../src/core/objects';import defaults from '../docs/beamo-defaults.json';import {evaluateBeamoRuntime,type BeamoRuntimeCase} from './beamo-runtime-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),executableSha256=sha(fs.readFileSync(executable));if(executableSha256!==defaults.executableSha256)throw new Error('Original executable required');
const cases:BeamoRuntimeCase[]=[];
for(let op=0;op<=10;op++)for(const fill of [0,0xa5,0xff])for(const count of [0,1,255,256,511,512,0xffffffff]){
 const raw=Buffer.alloc(256,fill);for(let i=0;i<64;i++)raw[192+i]=(i*113+fill)&255;
 cases.push({label:`prepared/${op}/${fill}/${count}`,op,normalCount:count,decalCount:count,raw:raw.toString('base64')});
}
for(const op of [7,8])for(const alias of [0,16,32,48]){const raw=Buffer.from(Array.from({length:256},(_,i)=>(i*113)&255));cases.push({label:`alias/${op}/${alias}`,op,normalCount:0,decalCount:0,raw:raw.toString('base64'),alias});}
const preparedCases=cases.length,corpus={Beamo:0,BeamoDecal:0},sourceHashes:Record<string,string>={};
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;const bytes=fs.readFileSync(file),nodes=new ObjectsDocument(bytes).nodes;sourceHashes[level]=sha(bytes);
 for(const node of nodes.filter(n=>n.className==='Beamo'||n.className==='BeamoDecal')){
  const transform=node.fields.find(f=>f.name==='transform');if(!transform)throw new Error('Unrestored transform input');const raw=Buffer.alloc(256,0xa5);Buffer.from(transform.raw,'hex').copy(raw,192);
  cases.push({label:`${level}/#${node.id}/${node.className}`,op:node.className==='Beamo'?7:8,normalCount:0,decalCount:0,raw:raw.toString('base64')});corpus[node.className as keyof typeof corpus]++;
 }
}
const uints=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n>>>0,i*4));return b;},input=Buffer.concat([uints([cases.length]),...cases.flatMap(c=>[uints([c.op,c.normalCount,c.decalCount,c.alias??0xffffffff]),Buffer.from(c.raw,'base64')])]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-beamo-runtime-'));let native:Buffer;
try{const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-beamo-runtime-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:20e6,timeout:120000});if(run.status!==0)throw new Error(`Native Beamo state failed: ${run.status} ${run.stderr}`);native=run.stdout;}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(native.length!==4+cases.length*312||native.readUInt32LE(0)!==cases.length)throw new Error('Invalid native output');
const failures:unknown[]=[],fixture:unknown[]=[];
for(const [i,c] of cases.entries()){const actual=native.subarray(4+i*312,4+(i+1)*312),expected=evaluateBeamoRuntime(c);if(!actual.equals(expected)){const offsets=[];for(let j=0;j<312;j++)if(actual[j]!==expected[j])offsets.push(j);failures.push({label:c.label,offsets:offsets.slice(0,30)});}fixture.push({input:c,native:actual.toString('base64')});}
const scope='Whole normal Beamo/BeamoDecal placement, Barn.Initialize/CreateBeamo/CreateBeamoDecal/Changed/SetTransform/GetTransform execute original bytes unchanged. Base/WorldObject/LevelModel registry getters/IDs are explicit services; allocation already exists. Compare returned pool address, assertion line/severity, ordered getters, 192 selected slot/neighbor bytes, output matrix, Barn flag/counters/runtime table pointer. All 7150 saved transforms are prepared calls, not full class startup/loading/game runtime. Construction exceptions/unwind, complete TGCL, Barn.Load/Unload/rendering and full lifecycle remain open.';
const report={passed:!failures.length,executableSha256,scope,cases:cases.length,preparedCases,corpus,comparedBytes:cases.length*312,sourceHashes,failures};fs.writeFileSync('docs/beamo-runtime-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/beamo-runtime-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256,cases:fixture})));
console.log(JSON.stringify({...report,sourceHashes:undefined,failures:failures.slice(0,12),failureCount:failures.length}));if(!report.passed)process.exitCode=1;
