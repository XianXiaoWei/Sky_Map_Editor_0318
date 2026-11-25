import fs from 'node:fs';import path from 'node:path';import os from 'node:os';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {readResourceMesh} from '../src/core/resources';
import {loadEditorLevelDataModelBakes} from '../src/core/level-data-bake-adapter';import {findLoadedBake} from '../src/core/baked-lookup';import {objectScalar,objectText} from '../src/core/model-material-index';
import {beamoBakeInput} from '../src/core/beamo-bake-adapter';import {numericFloatBits as bits} from '../src/core/object-numeric-runtime';import {beamoBakeMemory,evaluateBeamoBake,type BeamoBakeCase} from './beamo-bake-cases';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),executableSha256=sha(fs.readFileSync(executable));if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable required');
const cases:BeamoBakeCase[]=[];
for(const normal of [false,true])for(const count of [0,1,2,3,4])for(const enabled of [[0,0],[1,0],[0,1],[1,1],[NaN,NaN]])for(const distance of [0,-1,12,NaN])for(const mode of ['ok','miss','count','first-null','second-null','first-count','second-count']){
 const mesh=Array.from({length:count},(_,i)=>({distanceBits:bits(10+i*20),vertices:11+i})),bake=mesh.map((m,i)=>({vertices:m.vertices+Number(mode===`${i===0?'first':'second'}-count`),extraPresent:mode!==`${i===0?'first':'second'}-null`}));
 if(mode==='count'){if(count===4)bake.pop();else bake.push({vertices:32,extraPresent:true});}
 cases.push({label:`prepared/${normal}/${count}/${enabled}/${distance}/${mode}`,normal,found:mode!=='miss',recordPresent:mode!=='miss',mesh,bake,distanceBits:[bits(distance),bits(distance),bits(-1)],enableBits:enabled.map(bits)});
}
const preparedCases=cases.length,sourceHashes:Record<string,string>={},corpus={Beamo:0,BeamoDecal:0};
if(!process.env.SKY_BEAMO_SYNTHETIC){
 const cache=new Map<string,ReturnType<typeof readResourceMesh>|null>(),resolve=(name:string)=>{if(!cache.has(name)){const file=path.join(data,'Meshes/Bin',name+'.mesh');cache.set(name,fs.existsSync(file)?readResourceMesh(fs.readFileSync(file)):null);}return cache.get(name)!;};
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const dir=path.join(data,'Levels',level);if(!fs.existsSync(path.join(dir,'Objects.level.bin')))continue;
  const raw=fs.readFileSync(path.join(dir,'Objects.level.bin')),baked=fs.readFileSync(path.join(dir,'BstBaked.meshes')),nodes=new ObjectsDocument(raw).nodes,doc=new MeshesDocument(baked),source=loadEditorLevelDataModelBakes(doc,resolve);
  sourceHashes[level+'/Objects']=sha(raw);sourceHashes[level+'/BstBaked']=sha(baked);
  for(const node of nodes.filter(n=>n.className==='Beamo'||n.className==='BeamoDecal')){
   const mesh=resolve(objectText(node,'meshName'))??resolve('UnitCube');if(!mesh)throw new Error('Original UnitCube fallback unavailable');
   const record=findLoadedBake(source,objectScalar(node,'bstGuid'));
   cases.push({label:`${level}/#${node.id}/${node.className}`,...beamoBakeInput(node,mesh,record)});corpus[node.className as keyof typeof corpus]++;
  }
 }
}
const uint=(n:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(n>>>0);return b;},input=Buffer.concat([uint(cases.length),...cases.flatMap(c=>[uint(+c.found),beamoBakeMemory(c)])]),temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-beamo-bake-'));let native:Buffer;
try{const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-beamo-bake-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:100e6,timeout:120000});if(run.status!==0)throw new Error(`Native Beamo failed: ${run.status} ${run.stderr}`);native=run.stdout;}finally{fs.rmSync(temp,{recursive:true,force:true});}
if(native.length!==4+cases.length*4100||native.readUInt32LE(0)!==cases.length)throw new Error('Invalid native output');
const failures:unknown[]=[],fixture:unknown[]=[];let comparedBytes=0;
for(const [i,c] of cases.entries()){
 const expected=evaluateBeamoBake(c),actual=Buffer.from(native.subarray(4+i*4100,4+(i+1)*4100));
 // SETE/MOV DIL leaves upper EDI caller-clobbered; only its predicate byte
 // is consumed. Exclude these three private stack bytes from the comparison.
 actual.fill(0,4+0xc69,4+0xc6c);comparedBytes+=actual.length-3;
 if(!expected.equals(actual)){const offsets=[];for(let j=0;j<actual.length;j++)if(expected[j]!==actual[j])offsets.push(j);failures.push({label:c.label,offsets:offsets.slice(0,25),accepted:[expected.readUInt32LE(0),actual.readUInt32LE(0)]});}
 fixture.push({input:c,native:actual.toString('base64')});
}
const scope='Original resolved-resource BeamoBarn.Load CFG 0x100195427..0x100195678, shared Beamo/BeamoDecal branches proven by its preceding original input selection. Original instructions unchanged; prepared runtime/table/reference/lookup flag and <5 Mesh LOD prerequisite. Compare object/runtime/table storage, predicate byte, selected LOD count, default distance bits and accepted pointer; exclude only 3 caller-clobbered upper-EDI bytes in a private stack slot. All saved objects are prepared inputs, not proof of full class construction/startup. Missing Mesh uses address-backed UnitCube synchronous adapter. Full loader, stream/Vertex allocation, subsequent three/four LOD upload, collision/skirt, visibility/lifecycle and game parity remain open.';
const report={passed:!failures.length,executableSha256,scope,cases:cases.length,preparedCases,corpus,comparedBytes,sourceHashes,failures};fs.writeFileSync('docs/beamo-bake-oracle.json',JSON.stringify(report,null,2)+'\n');if(report.passed)fs.writeFileSync('tests/fixtures/beamo-bake-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256,cases:fixture})));
console.log(JSON.stringify({...report,sourceHashes:undefined,failures:failures.slice(0,12),failureCount:failures.length}));if(!report.passed)process.exitCode=1;
