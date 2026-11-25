import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {ObjectsDocument} from '../src/core/objects';import {MeshesDocument} from '../src/core/meshes';import {readResourceMesh} from '../src/core/resources';import {objectScalar,objectText,serializedLevelMaterialIndex} from '../src/core/model-material-index';
import {loadEditorLevelDataModelBakes} from '../src/core/level-data-bake-adapter';import {findLoadedBake} from '../src/core/baked-lookup';import {selectEditorBeamoBake} from '../src/core/beamo-bake-adapter';
import {prepareBeamoGeometryInput,evaluatePreparedBeamoGeometry,beamoJsRsqrt,type BeamoGeometryInput,type BeamoGeometryResource} from '../src/core/beamo-geometry-adapter';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus',executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky',sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex'),executableSha256=sha(fs.readFileSync(executable));if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable required');
const b64=(v:ArrayBufferView)=>Buffer.from(v.buffer,v.byteOffset,v.byteLength).toString('base64'),float=(v:number[])=>b64(Float32Array.from(v)),uint=(v:number[])=>b64(Uint32Array.from(v));
const identity=float([1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]);
const resources:Record<string,BeamoGeometryResource>={},cases:BeamoGeometryInput[]=[];
for(const alpha of [[0,0,0,0],[224,225,225,225],[225,225,225,225],[255,255,255,255]]){
 const positions=Buffer.alloc(64);[[0,0,0],[1,0,0],[0,0,1],[1,0,1]].forEach((p,i)=>{p.forEach((n,j)=>positions.writeFloatLE(n,i*16+j*4));positions[i*16+15]=alpha[i];});
 const key='prepared/'+alpha.join('-');resources[key]={positions:positions.toString('base64'),uvs:Buffer.from(Array.from({length:64},(_,i)=>i*13&255)).toString('base64'),indices:uint([0,2,1,1,2,3]),remap:uint([0,1,2,3]),groups:4,lod:0};
 for(const secondary of [false,true])for(const autoMoss of [0,1,255])for(const culling of [undefined,null,[0,0],[0,255],[2,0],[255,255]]){
  cases.push({label:`prepared/${key}/${secondary}/${autoMoss}/${culling}`,resourceKey:key,matrix:identity,secondary,autoMoss,bake:culling!==undefined,lighting:Buffer.from(Array.from({length:48},(_,i)=>i*47&255)).toString('base64'),culled:culling===undefined||culling===null?culling:Buffer.from(culling).toString('base64'),vertexOffset:3,indexOffsets:[5,50,100]});
 }
 for(const matrix of [float([2,0,0,0,0,3,0,0,0,0,.5,0,-12,20,3,1]),float([-1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1])])cases.push({label:`prepared/transformed/${key}/${matrix}`,resourceKey:key,matrix,secondary:true,autoMoss:1,bake:false});
 for(const obb of [float([.5,0,0,0,0,.5,0,0,0,0,.5,0,0,0,0,1]),float([0,0,0,0,0,1e-6,0,0,0,0,.5,0,0,0,0,1])])cases.push({label:`prepared/volume/${key}/${obb}`,resourceKey:key,matrix:identity,secondary:true,autoMoss:0,bake:false,volumes:[{match:false,matrix:identity,obb},{match:true,matrix:identity,obb},{match:true,matrix:float([1,0,0,0,0,1,0,0,0,0,1,0,1,0,1,1]),obb}]});
}
// Real Beamo resources use LOD0/1; exercise the same full upload at LOD2/3
// explicitly instead of inferring their correctness from caller-only mocks.
for(const input of [...cases])for(const lod of [1,2,3]){
 const key=input.resourceKey+'/LOD'+lod;
 resources[key]??={...resources[input.resourceKey],lod};
 cases.push({...input,label:input.label+'/LOD'+lod,resourceKey:key});
}
const preparedCases=cases.length,corpus={Beamo:0,BeamoDecal:0,lods:0,vertices:0,indices:0},sourceHashes:Record<string,string>={},skipped:unknown[]=[];
if(!process.env.SKY_BEAMO_GEOMETRY_SYNTHETIC){
 const cache=new Map<string,ReturnType<typeof readResourceMesh>|null>(),resolve=(name:string)=>{if(!cache.has(name)){const file=path.join(data,'Meshes/Bin',name+'.mesh');cache.set(name,fs.existsSync(file)?readResourceMesh(fs.readFileSync(file)):null);}return cache.get(name)!;};
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const folder=path.join(data,'Levels',level);if(!fs.existsSync(path.join(folder,'Objects.level.bin')))continue;const original=fs.readFileSync(path.join(folder,'Objects.level.bin')),baked=fs.readFileSync(path.join(folder,'BstBaked.meshes')),nodes=new ObjectsDocument(original).nodes,source=loadEditorLevelDataModelBakes(new MeshesDocument(baked),resolve),materials=serializedLevelMaterialIndex(nodes,level);sourceHashes[level+'/Objects']=sha(original);sourceHashes[level+'/BstBaked']=sha(baked);
  for(const node of nodes.filter(n=>['Beamo','BeamoDecal'].includes(n.className))){
   const name=objectText(node,'meshName'),mesh=resolve(name)??resolve('UnitCube');if(!mesh)throw new Error('Missing original UnitCube');
   const secondary=materials.modelLinks(node).find(l=>l.role==='secondary'&&l.requested);if(secondary&&secondary.materialNodeId===null){skipped.push({level,nodeId:node.id,reason:'Original first pass asserts on missing requested secondary material'});continue;}
   const record=findLoadedBake(source,objectScalar(node,'bstGuid')),selection=selectEditorBeamoBake(node,mesh,record);
   corpus[node.className as 'Beamo'|'BeamoDecal']++;
   for(const [lodIndex,lod] of mesh.levels.entries()){
    const key=mesh.name+'/'+lodIndex;if(!resources[key]){if(!lod.packedPositions||!lod.packedUvs||!lod.bakeRemap)throw new Error('Missing original geometry attributes');resources[key]={positions:b64(lod.packedPositions),uvs:b64(lod.packedUvs),indices:b64(lod.indices),remap:b64(lod.bakeRemap),groups:lod.bakeVertexCount,lod:lodIndex};}
    const loaded=selection.accepted?record!.lods[lodIndex]:null;
    cases.push({label:`${level}/#${node.id}/${node.className}/LOD${lodIndex}`,resourceKey:key,matrix:Buffer.from(node.fields.find(f=>f.name==='transform')!.raw,'hex').toString('base64'),secondary:!!secondary,autoMoss:node.className==='Beamo'?objectScalar(node,'autoMoss'):0,bake:selection.accepted,lighting:loaded?.lighting?b64(loaded.lighting.packed):undefined,culled:loaded?.extra===null||loaded?.extra===undefined?null:b64(loaded.extra)});
    corpus.lods++;corpus.vertices+=lod.positions.length/3;corpus.indices+=lod.indices.length;
   }
  }
 }
}
if(process.env.SKY_BEAMO_GEOMETRY_CASE_LIMIT)cases.splice(Number(process.env.SKY_BEAMO_GEOMETRY_CASE_LIMIT));
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-beamo-upload-'));let outputFile:string,fallback:Buffer;
const uints=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeUInt32LE(n>>>0,i*4));return b;};
try{
 const inputFile=path.join(temp,'input.bin');outputFile=path.join(temp,'output.bin');const fd=fs.openSync(inputFile,'w');fs.writeSync(fd,uints([cases.length]));
 for(const input of cases){const p=prepareBeamoGeometryInput(input,resources[input.resourceKey]);fs.writeSync(fd,uints([p.prefixBytes,p.vertexBytes,p.indexBytes,p.groups,Number(input.bake),p.resource.lod,input.volumes?.length??0]));fs.writeSync(fd,p.data.subarray(0,p.prefixBytes));for(const v of input.volumes??[]){fs.writeSync(fd,uints([Number(v.match)]));fs.writeSync(fd,Buffer.from(v.matrix,'base64'));fs.writeSync(fd,Buffer.from(v.obb,'base64'));}}
 fs.closeSync(fd);console.log(JSON.stringify({stage:'prepared',cases:cases.length,preparedCases,corpus,resources:Object.keys(resources).length,skipped:skipped.length}));
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-msse4.1','-Wall','-Wextra','tools/native-beamo-upload-oracle.c','-lm','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const infd=fs.openSync(inputFile,'r'),outfd=fs.openSync(outputFile,'w');const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',...(process.env.SKY_BEAMO_GEOMETRY_DEBUG?['-d','in_asm,cpu','-D','/root/sky-research/beamo-upload-debug.trace']:[]),runner,executable],{stdio:[infd,outfd,'pipe'],timeout:600000});fs.closeSync(infd);fs.closeSync(outfd);if(run.status!==0)throw new Error(`Native upload failed: ${run.status} ${run.stderr}`);
 const native=fs.openSync(outputFile,'r'),head=Buffer.alloc(16);fs.readSync(native,head,0,16,0);if(head.readUInt32LE(0)!==cases.length)throw new Error('Invalid native count');fallback=head.subarray(4,16);let cursor=16,comparedBytes=0,rsqrtPairs=0,jsRsqrtDifferingPairs=0;const failures:unknown[]=[],fixture:unknown[]=[],results:unknown[]=[];
 for(const [i,input] of cases.entries()){
  const p=prepareBeamoGeometryInput(input,resources[input.resourceKey]),h=Buffer.alloc(676);fs.readSync(native,h,0,h.length,cursor);const allocated=h.readUInt32LE(8),pairs=h.readUInt32LE(32);if(allocated>16)throw new Error('Invalid allocation count');let size=676+pairs*8+p.vertexBytes+p.indexBytes+48;for(let a=0;a<allocated;a++)size+=Number(h.readBigUInt64LE(44+a*32))+16;
  const actual=Buffer.alloc(size);if(fs.readSync(native,actual,0,size,cursor)!==size)throw new Error('Truncated native output');cursor+=size;
  const pairBytes=actual.subarray(676,676+pairs*8);let next=0;const evaluated=evaluatePreparedBeamoGeometry(p,fallback,inputBits=>{if(next>=pairs)throw new Error('Missing native RSQRT capability input');const wanted=pairBytes.readUInt32LE(next*8),output=pairBytes.readUInt32LE(next++*8+4);if(wanted!==inputBits)throw new Error(`Normal accumulation differs at ${input.label}: ${inputBits} != ${wanted}`);if(beamoJsRsqrt(inputBits)!==output)jsRsqrtDifferingPairs++;return output;});
  if(next!==pairs)throw new Error('Unused native RSQRT pair');rsqrtPairs+=pairs;comparedBytes+=size;
  if(!actual.equals(evaluated.snapshot)){const offsets=[];for(let j=0;j<size;j++)if(actual[j]!==evaluated.snapshot[j])offsets.push(j);failures.push({label:input.label,offsets:offsets.slice(0,20),nativeCounts:Array.from({length:4},(_,i)=>actual.readUInt32LE(16+i*4)),counts:evaluated.counts});}
  fixture.push({input,nativeSha256:sha(actual),rsqrtPairs:pairBytes.toString('base64')});results.push({label:input.label,line:actual.readUInt32LE(0),counts:{vertices:actual.readUInt32LE(16),primaryIndices:actual.readUInt32LE(20),secondaryIndices:actual.readUInt32LE(24),alphaIndices:actual.readUInt32LE(28)}});
  if(i&&i%1000===0)console.log(JSON.stringify({stage:'compared',cases:i,failures:failures.length}));
 }
 fs.closeSync(native);if(cursor!==fs.statSync(outputFile).size)throw new Error('Trailing native output');
 const scope='Whole normal original upload LOD 0x100197ab0, normal generator wrapper 0x10045edf0/body 0x10045ee30, secondary weights 0x1001975c0, matrix multiply 0x100076df0, distance leaf 0x10078ce10 and original fallback light conversion/encoding execute unchanged. Scratch heap getter/allocate/free, imported bzero/memset/powf/frexpf and volume virtual name/transform/OBB are explicit services. Each case compares all 48-byte output vertices, all three index windows including guards, offset storage, ten scratch allocations including guards, ordered frees, assertion metadata and result counts. RSQRTSS capability replays independently observed native input/output bits and checks every input; portable JS differences are reported separately. Corpus selects resources/bakes synchronously, uses every saved transform and LOD, and prepares no external UnitCube volumes; this is not full Barn.Load/GPU drawing/lifecycle/game parity. No stack or output bytes are excluded.';
 const report={passed:!failures.length,executableSha256,scope,cases:cases.length,preparedCases,corpus,resources:Object.keys(resources).length,skipped,comparedBytes,rsqrtPairs,jsRsqrtDifferingPairs,fallbackLightingHex:fallback.toString('hex'),sourceHashes,failures,results};fs.writeFileSync('docs/beamo-upload-oracle.json',JSON.stringify(report,null,2)+'\n');
 if(report.passed)fs.writeFileSync('tests/fixtures/beamo-upload-native.json.gz',gzipSync(JSON.stringify({scope,executableSha256,fallback:fallback.toString('base64'),resources,cases:fixture})));
 console.log(JSON.stringify({...report,sourceHashes:undefined,results:undefined,failures:failures.slice(0,15),failureCount:failures.length}));if(!report.passed)process.exitCode=1;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
