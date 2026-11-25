import fs from 'node:fs';import os from 'node:os';import path from 'node:path';import crypto from 'node:crypto';import {spawnSync} from 'node:child_process';import {gzipSync} from 'node:zlib';
import {solveOriginalFloppySpine,type FloppySpineState} from '../src/core/floppy-spine';
const exe=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const hash=(b:Uint8Array)=>crypto.createHash('sha256').update(b).digest('hex');
if(hash(fs.readFileSync(exe))!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Original executable SHA differs');
const floats=(v:ArrayLike<number>)=>Buffer.from(Float32Array.from(v).buffer),integer=(v:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(v);return b;};
const cases=Array.from({length:24},(_,index)=>{
 const count=2+index%9,steps=48,lengths=Float32Array.from({length:count},(_,i)=>i?Math.fround(.3+i*.09):0),positions=new Float32Array(count*4);let z=0;
 for(let i=0;i<count;i++){z+=lengths[i];positions.set([0,0,z?-z:0,1],i*4);}
 const history=new Float32Array(512),directionHistory=new Float32Array(512);
 for(let i=0;i<128;i++){history.set([Math.sin(i*.02)*.1,0,i?-i*.12:0,1],i*4);directionHistory.set([0,1,0,0],i*4);}
 const anchors=Array.from({length:steps},(_,i)=>index<3?[i*.09,0,0,1]:[Math.sin(i*.08)*2,Math.sin(i*.17)*.2,Math.cos(i*.08)*2-2,1]);
 if(index===23)anchors[24]=[100,30,-40,1];
 return {positions:Array.from(positions),lengths:Array.from(lengths),history:Array.from(history),directionHistory:Array.from(directionHistory),anchors};
});
const input=Buffer.concat([integer(cases.length),...cases.flatMap(c=>[integer(c.lengths.length),integer(c.anchors.length),...c.lengths.flatMap((length,i)=>[floats(c.positions.slice(i*4,i*4+4)),floats([length])]),floats(c.history),floats(c.directionHistory),...c.anchors.map(floats)])]);
const tmp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-floppy-spine-'));let output:Buffer;
try{
 const runner=path.join(tmp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-mno-red-zone','-Wall','tools/native-floppy-spine-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,exe],{input,timeout:60000,maxBuffer:10e6});if(run.status!==0)throw new Error(`${run.status}: ${run.signal}: ${run.stderr}`);output=run.stdout;
}finally{fs.rmSync(tmp,{recursive:true,force:true});}
let at=4,comparedBytes=0;const failures:any[]=[],rows:any[]=[];
if(output.readUInt32LE()!==cases.length)throw new Error('Native case count differs');
for(const [index,c] of cases.entries()){
 const s:FloppySpineState={positions:Float32Array.from(c.positions),lengths:Float32Array.from(c.lengths),history:Float32Array.from(c.history),directionHistory:Float32Array.from(c.directionHistory)},nativeFrames:string[]=[];
 for(const [step,anchor] of c.anchors.entries()){
  const size=c.lengths.length*12+4096,native=output.subarray(at,at+size);at+=size;
  s.positions.set(anchor);solveOriginalFloppySpine(s,[0,1,0,0]);
  const xyz=Float32Array.from({length:c.lengths.length*3},(_,k)=>s.positions[Math.floor(k/3)*4+k%3]);
  const actual=Buffer.concat([floats(xyz),floats(s.history),floats(s.directionHistory)]);comparedBytes+=size;
  // Retained history W lanes are explicitly owner data. Only XYZ points
  // enter the native distance solver; no SIMD spare-lane parity claim.
  if(!actual.equals(native)&&failures.length<10){const differences=[];for(let i=0;i<size&&differences.length<8;i++)if(actual[i]!==native[i])differences.push({at:i,actual:actual[i],native:native[i]});failures.push({case:index,step,differences});}
  nativeFrames.push(native.toString('base64'));
 }
 rows.push({input:c,nativeFrames});
}
const report={passed:failures.length===0,cases:cases.length,frames:cases.reduce((n,c)=>n+c.anchors.length,0),comparedBytes,failures,scope:'Unmodified original FloppySpine.Update with an already initialized chain. Original path history insertion, spatial sampling, 0.7/0.3 smoothing, ten distance-relaxation passes and final projection execute on QEMU x64. XYZ bone positions and retained history streams compared each frame. Skeleton discovery, initialization, Transform aiming, head look, AI trajectory and rendering are separate editor owner services.'};
fs.writeFileSync('docs/floppy-spine-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/floppy-spine-native.json.gz',gzipSync(JSON.stringify(rows),{level:9}));
console.log(JSON.stringify(report));if(!report.passed)process.exitCode=1;
