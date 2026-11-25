import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { cloudCardGroupOrder, cloudCardDistanceOrder } from '../src/core/cloud-card-sort';

const executable=process.argv[2] ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const digest=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(digest!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('需要原 Sky executable');
const reportPath='docs/cloud-card-sort-oracle.json';fs.writeFileSync(reportPath,JSON.stringify({passed:false,complete:false})+'\n');
type Case={mode:number;name:string;keys:number[]};
const cases:Case[]=[];
for(const mode of [0,1]) {
  for(let n=0;n<=7;n++)for(let code=0;code<3**n;code++){
    let value=code;const keys=Array.from({length:n},()=>{const v=value%3;value=Math.floor(value/3);return v;});
    cases.push({mode,name:`ternary-${n}-${code}`,keys});
  }
  let seed=31814+mode;
  const random=()=>((seed=(Math.imul(seed,1664525)+1013904223)>>>0)/2**32);
  for(let n=8;n<=512;n++)for(let kind=0;kind<8;kind++) {
    const keys=Array.from({length:n},(_,i)=>kind===0?0:kind===1?i:kind===2?n-i:kind===3?i%2:kind===4?Math.min(i,n-i):
      kind===5?Math.floor(random()*4):kind===6?Math.floor(random()*n):mode?Math.fround(random()*10000):Math.floor(random()*2**32));
    cases.push({mode,name:`pattern-${n}-${kind}`,keys});
  }
}
cases.push({mode:0,name:'unsigned-boundaries',keys:[0xffffffff,0,0x80000000,1,0x7fffffff,0xffffffff,0,0x80000000]});
cases.push({mode:1,name:'float32-equal-signed-zero-subnormal',keys:[0,-0,2**-149,1,1+2**-24,1+2**-23,65504,65504+2**-10]});
const input=Buffer.alloc(4+cases.reduce((n,c)=>n+8+c.keys.length*4,0));let at=0;
const u32=(v:number)=>{input.writeUInt32LE(v,at);at+=4;};u32(cases.length);
for(const c of cases){u32(c.mode);u32(c.keys.length);for(const key of c.keys){if(c.mode){input.writeFloatLE(key,at);at+=4;}else u32(key);}}
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-card-sort-'));let raw:Buffer;
try {
  const runner=path.join(temp,'oracle');
  const build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-cloud-card-sort-oracle.c','-o',runner]);
  if(build.status!==0)throw new Error(build.stderr.toString());
  const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:128*1024*1024,timeout:60000});
  if(run.status!==0)throw new Error(`原排序失败 (${run.status}): ${run.stderr}`);raw=run.stdout;
} finally {fs.rmSync(temp,{recursive:true,force:true});}
at=0;const read32=()=>{const value=raw.readUInt32LE(at);at+=4;return value;};if(read32()!==cases.length)throw new Error('case 数量错误');
const failures=[],fixtures=[],stats=[0,1].map(mode=>({mode,cases:0,records:0,failedRecords:0,stableSortDifferentCases:0}));
for(const c of cases) {
  if(read32()!==c.keys.length)throw new Error('排序记录数量错误');
  const actual=c.mode?cloudCardDistanceOrder(c.keys):cloudCardGroupOrder(c.keys),order:number[]=[];
  const stat=stats[c.mode];stat.cases++;stat.records+=c.keys.length;
  const stable=Array.from({length:c.keys.length},(_,i)=>i).sort((a,b)=>c.mode?Math.fround(c.keys[a])-Math.fround(c.keys[b]):c.keys[a]-c.keys[b]);
  for(let i=0;i<c.keys.length;i++) {
    const id=read32(),key=read32(),marker=read32();order.push(id);
    const encoded=Buffer.alloc(4);if(c.mode)encoded.writeFloatLE(c.keys[id]);else encoded.writeUInt32LE(c.keys[id]);
    if(actual[i]!==id || key!==encoded.readUInt32LE() || marker!==((Math.imul(id,1664525)+1013904223)>>>0)) {
      stat.failedRecords++;if(failures.length<10)failures.push({name:c.name,mode:c.mode,position:i,expected:id,actual:actual[i]});
    }
  }
  if(stable.some((v,i)=>v!==order[i]))stat.stableSortDifferentCases++;
  if(['unsigned-boundaries','float32-equal-signed-zero-subnormal','pattern-7-5','pattern-8-5','pattern-30-5','pattern-31-5','pattern-78-5','pattern-256-5','pattern-512-5'].includes(c.name) || c.name==='ternary-5-17')fixtures.push({...c,keys:c.keys.map(v=>c.mode?Math.fround(v):v),order});
}
if(at!==raw.length)throw new Error('原排序输出有未读取数据');
const report={passed:stats.every(s=>s.failedRecords===0),complete:true,executableSha256:digest,
  scope:'Untouched original group/distance sort and helpers execute under QEMU. Explicit initialized 128-byte/12-byte records and stack guard. All ternary keys through length seven and eight ordered/equal/alternating/reverse/random patterns at every supported length 8..512; exact source permutation, key bits and companion field association. No object registration schedule, visibility, Metal or game image acceptance.',
  functions:{groupSort:'0x100222830',groupSort3:'0x100223420',groupIncompleteInsertion:'0x100223d00',distanceSort:'0x100224290'},
  groupDirection:'uint32 ascending',distanceDirection:'float32 ascending',groupInsertionLimit:6,distanceInsertionLimit:30,maxCards:512,
  nativeOracleSourceSha256:crypto.createHash('sha256').update(fs.readFileSync('tools/native-cloud-card-sort-oracle.c')).digest('hex'),stats,firstFailures:failures};
fs.writeFileSync(reportPath,JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/cloud-card-sort-native.json',JSON.stringify({executableSha256:digest,cases:fixtures})+'\n');
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
