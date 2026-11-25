import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {gzipSync,gunzipSync} from 'node:zlib';
import {prepareRenderPipeline,evaluateRenderPipeline,type RenderPipelineCase} from './render-pipeline-cases';
import type {BeamoRenderCase} from './beamo-render-cases';

const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const sha=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
const executableSha256=sha(fs.readFileSync(executable));
if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable required');
const input:BeamoRenderCase={label:'prepared',materials:[{shader:'Mesh',parameters:[{name:'u_color',type:0,vectorBits:[0x7fc12345,0x80000000,0x3f800000,0x40000000]},{name:'u_texture',type:1,texture:'White'}]}],slots:[0,1,2,0xffffffff,0xffffffff,3],resources:[{kind:0,name:'Mesh',group:'Opaque'},{kind:0,name:'MeshAlpha',group:'Blended'},{kind:1,name:'White'}]};
const cases:RenderPipelineCase[]=[];
const add=(label:string,changes:Partial<RenderPipelineCase>={})=>cases.push({label:'prepared/'+label,input,uniformNames:['u_color'],textureNames:['u_texture'],uboSizes:[16],...changes});
for(const uniformNames of [[],['a'],['a','a'],['a','b','c'],['b','a'],['a','c','b'],['é','z'],['z','é']])
 for(const textureNames of [[],['a'],['a','a'],['a','b'],['b','a']])add(`sorted/${cases.length}`,{uniformNames,textureNames});
for(const count of [0,1,2,3,4,5,6])for(const size of [0,16,64])add(`ubo/${count}/${size}`,{uboSizes:Array(count).fill(size)});
for(const idCount of [0,1,2,3])for(const readIndex of [0,1,2,3])for(const mapped of [false,true])add(`ids/${idCount}/${readIndex}/${mapped}`,{idCount,readIndex,mapped});
for(const bufferSizes of [[0,0,0,0,0,0,0],[48,64,32,16,8,4,0],[0,48,0,32,0,16,0],[48,0,0,0,0,0,48]])
 for(const postBindCount of [0,1,6,7])add(`slots/${cases.length}`,{bufferSizes,postBindCount});
for(const slot of [0,1,2,3,4,5])for(const nonempty of [false,true]){const strides=Array(6).fill(48),bufferSizes=Array(7).fill(0);strides[slot]=0;bufferSizes[slot]=nonempty?48:0;add(`stride/${slot}/${nonempty}`,{strides,bufferSizes,postBindCount:6});}
for(const flags of [1,2,4,8,16,32,64,128,4|8,16|32|64])for(const count of [0,1,2])add(`live/${flags}/${count}`,{flags,uboCountAfter:count,uniformCountAfter:count,uboSizes:[16,32,64],bufferSizes:[48,64,0,0,0,0,0],mapped:true});
for(const reset of [0,1,2,3,8,9,11])add(`reset/${reset}`,{reset,mapped:true,uboSizes:[16,64]});
for(const writeIndex of [0,1,2])for(const flags of [0,4,128])add(`all-fourteen/${writeIndex}/${flags}`,{writeIndex,flags,mapped:true,idCount:3,bufferSizes:Array(7).fill(48),extraBufferSizes:Array(8).fill(64)});
for(const bits of [0x80000000,0x7f800000,0xff800000,0x7fc12345,0x7fa12345,0x00000001,0x00800000,0x3f800000])add(`reset-matrix/${bits.toString(16)}`,{defaultMatrixBits:Array(16).fill(bits)});
for(const mode of [1,2])for(const initialized of [0,1,2])for(const dataComplete of [0,1])add(`entry/${mode}/${initialized}/${dataComplete}`,{input:{...input,mode,initialized,dataComplete},reset:initialized===1?0:3});
add('empty-materials',{input:{...input,materials:[],slots:[]},reset:2});
add('missing-shader',{input:{...input,resources:[]}});
const preparedCases=cases.length;
const corpus={maps:0,objects:0,materials:0,renderGroups:0};
let sourceHashes:Record<string,string>={};
if(!process.env.SKY_RENDER_PIPELINE_SYNTHETIC){
 const old=JSON.parse(gunzipSync(fs.readFileSync('tests/fixtures/beamo-render-native.json.gz')).toString()) as {executableSha256:string;cases:{input:BeamoRenderCase}[]};
 const oldReport=JSON.parse(fs.readFileSync('docs/beamo-render-oracle.json','utf8'));
 if(old.executableSha256!==executableSha256||!oldReport.passed)throw new Error('Verified original Beamo input required');
 sourceHashes=oldReport.sourceHashes;
 for(const c of old.cases){if(c.input.label.startsWith('prepared/'))continue;
  const names=(type:number)=>[...new Set(c.input.materials.flatMap(m=>m.parameters.filter(p=>p.type===type).map(p=>p.name)))].sort((a,b)=>Buffer.compare(Buffer.from(a),Buffer.from(b)));
  const renderGroups=Math.max(-1,...c.input.slots.filter(n=>n!==0xffffffff))+1;
  cases.push({label:c.input.label,input:c.input,uniformNames:names(0),textureNames:names(1),uboSizes:[64],mapped:true});
  corpus.maps++;corpus.materials+=c.input.materials.length;corpus.renderGroups+=renderGroups;
 }
 corpus.objects=oldReport.corpus.objects;
}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-render-pipeline-'));
try{
 const inputPath=path.join(temp,'in'),output=path.join(temp,'out'),fd=fs.openSync(inputPath,'w'),h=Buffer.alloc(4);h.writeUInt32LE(cases.length);fs.writeSync(fd,h);
 for(const c of cases)fs.writeSync(fd,prepareRenderPipeline(c).b);fs.closeSync(fd);
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','tools/native-render-pipeline-oracle.c','-o',runner]);
 if(build.status!==0||build.stderr.length)throw new Error(build.stderr.toString());
 const infd=fs.openSync(inputPath,'r'),outfd=fs.openSync(output,'w');
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{stdio:[infd,outfd,'pipe'],timeout:120000});fs.closeSync(infd);fs.closeSync(outfd);
 if(run.status!==0)throw new Error('Native pipeline failed '+run.status+' '+run.stderr);
 const fdout=fs.openSync(output,'r');fs.readSync(fdout,h,0,4,0);if(h.readUInt32LE(0)!==cases.length)throw new Error('Invalid case count');
 let cursor=4,comparedBytes=0,serviceCalls=0;const failures:unknown[]=[],fixture:unknown[]=[],results:unknown[]=[];
 for(const c of cases){const header=Buffer.alloc(20);if(fs.readSync(fdout,header,0,20,cursor)!==20)throw new Error('Truncated header');
  const count=header.readUInt32LE(8),actual=Buffer.alloc(20+count*256+0x300000);if(fs.readSync(fdout,actual,0,actual.length,cursor)!==actual.length)throw new Error('Truncated native');
  cursor+=actual.length;comparedBytes+=actual.length;serviceCalls+=count;const expected=evaluateRenderPipeline(c);
  if(!actual.equals(expected)){const offsets=[];for(let i=0;i<Math.max(actual.length,expected.length);i++)if(actual[i]!==expected[i]){offsets.push({offset:i,native:actual[i],expected:expected[i]});if(offsets.length===15)break;}failures.push({label:c.label,nativeBytes:actual.length,expectedBytes:expected.length,offsets});}
  fixture.push({input:c,nativeSha256:sha(actual)});results.push({label:c.label,line:actual.readUInt32LE(0),severity:actual.readUInt32LE(4),calls:count});
 }
 fs.closeSync(fdout);if(cursor!==fs.statSync(output).size)throw new Error('Trailing native');
 const scope='Unchanged original normal RenderPipeline initialize/bind/free, GpuBuffer getReadId/reset, VertexData reset and Renderable reset, composed with original Beamo material loop, VertexRender initializers and ResourceRef bodies. Compare full 3MiB memory plus ordered service calls/assertion line and severity. Graphics reflection, GPU creation/binding/destruction, heap allocation/free, default matrix and RenderList unregister are explicit prepared services. Synthetic reflection names/counts, ID/layout gates, 14 buffers, live callback mutations and repeated-free assertion are exercised. The 33 original material/grouping cases retain original serialized input; sorted reflection tables and UBO sizes are prepared, not recovered real shader reflection. Service hook targets occupy an unused Beamo upload helper region; that helper is not executed in this oracle. Full class/game/native GPU/reflection/ResourceManager IO acceptance remains false.';
 const report={passed:!failures.length,executableSha256,scope,cases:cases.length,preparedCases,corpus,comparedBytes,serviceCalls,sourceHashes,results,failures};
 fs.writeFileSync('docs/render-pipeline-oracle.json',JSON.stringify(report,null,2)+'\n');
 if(report.passed&&!process.env.SKY_RENDER_PIPELINE_SYNTHETIC)fs.writeFileSync('tests/fixtures/render-pipeline-native.json.gz',gzipSync(JSON.stringify({executableSha256,scope,cases:fixture})));
 console.log(JSON.stringify({...report,sourceHashes:undefined,results:undefined,failures:failures.slice(0,6),failureCount:failures.length}));if(failures.length)process.exitCode=1;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
