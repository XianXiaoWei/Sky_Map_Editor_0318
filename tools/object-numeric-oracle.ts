import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawnSync} from 'node:child_process';
import {gzipSync} from 'node:zlib';
import {ObjectsDocument,type ObjectNode} from '../src/core/objects';
import {executeFloatMult,executeFloatSplit,numericFloatBits,type FloatCell} from '../src/core/object-numeric-runtime';
import {startOriginalEvent} from '../src/core/event-start-runtime';
const executable=process.argv[2]??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky';
const executableSha256=crypto.createHash('sha256').update(fs.readFileSync(executable)).digest('hex');
if(executableSha256!=='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20')throw new Error('Requires original executable');
const gate=spawnSync('python3',['tools/reverse-object-runtime.py',executable,'--check-only']);if(gate.status!==0)throw new Error(gate.stderr.toString());
interface Case {name:string;kind:number;bits:number[];a:number;b:number;out:number;members:number[];barn:boolean;started:number;counter:number;sequence:number;repeats:number;mutationAt:number;newCount:number;invalid:boolean;save:boolean;}
const cases:Case[]=[];
let seed=0x31871a7e;
const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed;};
function add(name:string,kind:number,bits:number[],changes:Partial<Case>={}){cases.push({name,kind,bits,a:0,b:1,out:2,members:[],barn:true,started:0,counter:0xfffffffe,sequence:0x12345678,repeats:1,mutationAt:0xffffffff,newCount:0,invalid:false,save:true,...changes});}
const boundaries=[0,0x80000000,1,0x80000001,0x7fffff,0x800000,0x3eaaaaab,0x3f000000,0x3f800000,0xbf800000,0x7f7fffff,0xff7fffff,0x7f800000,0xff800000,0x7fc12345,0xffc23456,0x7f812345,0xff823456];
for(const a of boundaries)for(const b of boundaries)for(const out of [0,1,2])add(`mult-${a.toString(16)}-${b.toString(16)}-${out}`,0,[a,b,0xdeadbeef],{out});
for(let i=0;i<2048;i++)add(`random-mult-${i}`,0,[random(),random(),random()],{out:i%3,save:i<32});
for(const n of [0,1,2,3,7,16,257])for(const input of boundaries)for(const aliases of [false,true]){
 const bits=[input,...Array.from({length:n},random)],members=Array.from({length:n},(_,i)=>aliases?(i%3?i+1:0):i+1);
 add(`split-${n}-${input.toString(16)}-${+aliases}`,1,bits,{members,barn:input!==0});
}
for(const n of [65537,100000,100001,100003,262144])for(const input of [numericFloatBits(0.5),0x7f812345])add(`split-small-width-${n}-${input}`,1,[input,0xdeadbeef],{members:Array.from({length:n},()=>1),save:true});
add('split-repeated-output',1,[numericFloatBits(0.625),0xdeadbeef],{members:[1,1,1,1]});
add('split-shrink-after-cast',1,[numericFloatBits(0.625),0,0,0],{members:[1,2,3],mutationAt:0,newCount:1});
add('split-grow-after-cast',1,[numericFloatBits(0.625),0,0,0],{members:[1,2,3],mutationAt:0,newCount:100});
add('split-failed-member-cast',1,[0,0],{members:[1],invalid:true});
for(const barn of [false,true])for(const started of [0,1,255])for(const counter of [0,1,0xfffffffe,0xffffffff])for(const repeats of [1,3])add(`start-${+barn}-${started}-${counter}-${repeats}`,2,[],{barn,started,counter,repeats});
let maps=0;const actualNodes:{level:string;node:number;className:string;references:number[];inputBits:number[]}[]=[];
const levels=process.env.SKY_DATA?path.join(process.env.SKY_DATA,'Levels'):path.resolve(executable,'../../Data/Levels');
for(const level of fs.readdirSync(levels).sort()){
 const file=path.join(levels,level,'Objects.level.bin');if(!fs.existsSync(file))continue;maps++;
 const doc=new ObjectsDocument(fs.readFileSync(file));
 for(const node of doc.nodes.filter(n=>['FloatMult','FloatSplit'].includes(n.className))){
  const ref=(owner:ObjectNode,name:string)=>{const f=owner.fields.find(f=>f.name===name);if(!f||f.kind!=='reference'||f.value===0xffffffff)throw new Error(`${level}:${owner.id} missing ${name}`);return Number(f.value);};
  const targets=node.className==='FloatMult'?[ref(node,'a'),ref(node,'b'),ref(node,'output')]:[ref(node,'input'),...(doc.nodes[ref(node,'outputs')].fields.find(f=>f.name==='data')?.children??[]).map(f=>Number(f.value))];
  const ids=[...new Set(targets)],bits=ids.map(id=>{const n=doc.nodes[id],f=n.fields.find(f=>f.name==='value');if(n.className!=='Float'||!f||f.length!==4)throw new Error('Actual Float reference requires explicit value');return Buffer.from(f.raw,'hex').readUInt32LE();});
  actualNodes.push({level,node:node.id,className:node.className,references:targets,inputBits:bits});
  add(`actual-${level}-n${node.id}`,node.className==='FloatMult'?0:1,bits,{a:ids.indexOf(targets[0]),b:ids.indexOf(targets[1]),out:ids.indexOf(targets[2]),members:node.className==='FloatSplit'?targets.slice(1).map(id=>ids.indexOf(id)):[]});
 }
}
const u32=(values:number[])=>{const b=Buffer.alloc(values.length*4);values.forEach((v,i)=>b.writeUInt32LE(v>>>0,i*4));return b;};
const prepared=cases.map(c=>{
 const event=Buffer.alloc(80,0xa5),barn=Buffer.alloc(32,0x5a);event.writeUInt32LE(c.sequence,0x10);event[0x22]=c.started;event[0x21]=0x77;barn.writeUInt32LE(c.counter,0x10);
 const cells=c.bits.map(bits=>{const b=Buffer.alloc(32,0x96);b.writeUInt32LE(bits,0x10);return b;});
 return {c,event,barn,cells};
});
const input=Buffer.concat([u32([cases.length]),...prepared.flatMap(({c,event,barn,cells})=>[u32([c.kind,cells.length,c.a,c.b,c.out,c.members.length,+c.barn,c.mutationAt,c.newCount,c.repeats|(+c.invalid<<16)]),event,barn,...cells,u32(c.members)])]);
const temp=fs.mkdtempSync(path.join(os.tmpdir(),'sky-numeric-oracle-'));let raw:Buffer;
try{
 const runner=path.join(temp,'oracle'),build=spawnSync('x86_64-linux-gnu-gcc',['-O2','-Wall','-Wextra','-Werror','tools/native-object-numeric-oracle.c','-o',runner]);if(build.status!==0)throw new Error(build.stderr.toString());
 const run=spawnSync('qemu-x86_64',['-L','/usr/x86_64-linux-gnu','-cpu','max',runner,executable],{input,maxBuffer:128*1024*1024,timeout:180000});
 if(run.status!==0)throw new Error(`Original numeric runner ${run.status}/${run.signal}: ${run.stderr}`);raw=run.stdout;
}finally{fs.rmSync(temp,{recursive:true,force:true});}
let at=0,failed=0,comparedBytes=0,dualNaNServiceCalls=0;const failures:unknown[]=[],saved:unknown[]=[];
const take=(n:number)=>{if(at+n>raw.length)throw new Error('Truncated native output');const b=raw.subarray(at,at+n);at+=n;return b;};
if(take(4).readUInt32LE()!==cases.length)throw new Error('Case count mismatch');
for(const {c,event,barn,cells} of prepared){
 const expectedEvents=take(24),expectedEvent=take(80),expectedBarn=take(32),expectedCells=take(cells.length*32);
 let casts=0,asserts=0,line=0,logs=0,chars=0,count=c.members.length;
 const floats:FloatCell[]=cells.map(storage=>({storage}));
 const start=()=>startOriginalEvent(event,c.barn?barn:null,()=>{logs++;chars+=86;});
 try{
  for(let r=0;r<c.repeats;r++){
   if(c.kind===0)executeFloatMult(floats[c.a],floats[c.b],floats[c.out],()=>{dualNaNServiceCalls++;return expectedCells.readUInt32LE(c.out*32+0x10);});
   else if(c.kind===1)executeFloatSplit(floats[c.a],{outputs:()=>({count:()=>count,member:i=>floats[c.members[i]]}),castFloat:member=>{casts++;if(c.mutationAt===casts-1)count=c.newCount;return c.invalid?null:member as FloatCell;},startEvent:start});
   else start();
  }
 }catch(error){const msg=String(error);if(msg.includes('idx < size')){asserts++;line=54;}else if(msg.includes(': ret')){asserts++;line=71;}else throw error;}
 if(c.kind<2)event.fill(0,0x38,c.kind===0?0x50:0x48);
 const actual=Buffer.concat([u32([casts,0,asserts,line,logs,chars]),event,barn,...cells]);
 const expected=Buffer.concat([expectedEvents,expectedEvent,expectedBarn,expectedCells]);
 for(let i=0;i<actual.length;i++){comparedBytes++;if(actual[i]!==expected[i]){failed++;if(failures.length<20)failures.push({name:c.name,offset:i,native:expected[i],actual:actual[i]});}}
 if(c.save)saved.push({...c,eventHex:expectedEvent.toString('hex'),barnHex:expectedBarn.toString('hex'),cellsHex:expectedCells.toString('hex'),eventsHex:expectedEvents.toString('hex')});
}
if(at!==raw.length)throw new Error('Trailing native output');
const scope='Unmodified whole FloatMult 0x1007191a0, FloatSplit 0x100717b20, original Object metadata getter 0x1007abc10 and Event::Start 0x10032ef60 under ambient default RNE MXCSR. Explicit Float metadata cast, assertion and null-Barn logging/iostream services; two-NaN multiply uses a captured output dependency (hardware propagation remains unverified); Event/Clump/Barn and Float memory are harness snapshots. All nonpointer bytes and Float payload bits, callbacks/order, assertion lines, null-Barn message length, aliases, duplicate outputs, count mutation and uint32 sequence wrap compared. Actual 33-map serialized values/references are input snapshots, not proof of original constructors/defaults, EventBarn queue, scheduling, complete class/game runtime or hardware behavior. Other MXCSR modes excluded.';
const report={passed:failed===0,complete:true,executableSha256,cases:cases.length,multCases:cases.filter(c=>c.kind===0).length,splitCases:cases.filter(c=>c.kind===1).length,eventStartCases:cases.filter(c=>c.kind===2).length,splitMemberCalls:cases.filter(c=>c.kind===1).reduce((n,c)=>n+c.members.length,0),comparedBytes,failedBytes:failed,dualNaNServiceCalls,dualNaNArithmeticVerified:false,scope,corpus:{maps,actualNodes},failures};
fs.writeFileSync('docs/object-numeric-oracle.json',JSON.stringify(report,null,2)+'\n');
if(report.passed)fs.writeFileSync('tests/fixtures/object-numeric-native.json.gz',gzipSync(JSON.stringify({executableSha256,scope,cases:saved})));
console.log(JSON.stringify({...report,corpus:{maps,nodes:actualNodes.length},failures:failures.slice(0,5)}));if(!report.passed)process.exitCode=1;
