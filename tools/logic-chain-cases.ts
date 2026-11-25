import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { ObjectsDocument } from '../src/core/objects';
import properties from '../docs/native-properties.json';
export const R=0x230000000n,O=0x240000000n,E=0x260000000n,C=0x270000000n,M=0x290000000n;
export const kinds=['Object','Float','Clump','Enable','IfEnabled','FloatAdd','FloatMult','Event','Unavailable','Delay','FloatSplit','OnFloat','Marker','ResumeEnable'] as const;
export const logicMetaOffset=(id:number)=>id>=9?0x6500+(id-9)*256:0x5000+id*256;
export type LogicKind=typeof kinds[number];
export interface LogicField {name:string;type:number;offset:number;size:number;raw:string;}
export interface LogicNode {kind:string;fields:LogicField[];}
export interface LogicCase {name:string;nodes:LogicNode[];actions:number[][];truncate?:number;failure?:number;time?:{delta:number;scale:number;speed:number;override:boolean;beat:boolean};source?:{level:string;root:number;nodes:number[];sha256:string};}
const pod=(name:string,offset:number,value:number,size=1):LogicField=>{const b=Buffer.alloc(size);if(size===4)b.writeFloatLE(value);else b.writeUInt8(value);return {name,type:0,offset,size,raw:b.toString('hex')};};
const ref=(name:string,offset:number,id:number):LogicField=>{const b=Buffer.alloc(4);b.writeUInt32LE(id>>>0);return {name,type:2,offset,size:0,raw:b.toString('hex')};};
const clump=(ids:number[]):LogicNode=>{const b=Buffer.alloc(4+ids.length*4);b.writeUInt32LE(ids.length);ids.forEach((id,i)=>b.writeUInt32LE(id>>>0,4+i*4));return {kind:'Clump',fields:[{name:'data',type:3,offset:8,size:0,raw:b.toString('hex')}]};};
const word=(name:string,offset:number,value:number):LogicField=>{const b=Buffer.alloc(4);b.writeUInt32LE(value>>>0);return {name,type:0,offset,size:4,raw:b.toString('hex')};};
const text=(name:string,offset:number,value:string):LogicField=>({name,type:1,offset,size:0,raw:Buffer.from(value+'\0').toString('hex')});
const split=(input:number,outputs:number,auto=1):LogicNode=>({kind:'FloatSplit',fields:[pod('autoStart',12,auto),ref('input',56,input),ref('outputs',64,outputs)]});
const onfloat=(value:number,yes:number,no:number,op1=1,op2=2,boolean=0,end=1,once=0,debug=0,name=''):LogicNode=>({kind:'OnFloat',fields:[pod('autoStart',12,1),ref('value',56,value),pod('endOnTrigger',64,end),pod('checkOnce',65,once),ref('trueEvents',72,yes),ref('falseEvents',80,no),pod('debug',88,debug),text('debugName',96,name),pod('conditionOneValue',120,1,4),ref('conditionOneFloat',128,-1),word('conditionOneOperator',136,op1),ref('conditionOneOnFloat',144,-1),pod('notConditionOneOnFloat',152,0),pod('conditionTwoValue',156,1,4),ref('conditionTwoFloat',160,-1),word('conditionTwoOperator',168,op2),ref('conditionTwoOnFloat',176,-1),pod('notConditionTwoOnFloat',184,0),word('booleanOperator',188,boolean)]});
const marker=(enabled=1):LogicNode=>({kind:'Marker',fields:[pod('enabled',64,enabled)]});
const resume=(objects:number,auto=1):LogicNode=>({kind:'ResumeEnable',fields:[pod('autoStart',12,auto),ref('objects',56,objects)]});
const float=(n:number):LogicNode=>({kind:'Float',fields:[pod('value',16,n,4)]});
const add=(target:number,auto=0,every=1):LogicNode=>({kind:'FloatAdd',fields:[pod('autoStart',12,auto),ref('target',56,target),ref('amountFloat',64,-1),ref('output',72,-1),pod('amount',80,1,4),pod('minClampedValue',84,-10,4),pod('maxClampedValue',88,10,4),pod('useMinClampedValue',92,0),pod('useMaxClampedValue',93,0),pod('updateEveryFrame',94,every)]});
const subtract=(target:number):LogicNode=>({...add(target,0,0),fields:add(target,0,0).fields.map(f=>f.name==='amount'?pod(f.name,f.offset,-1,4):f)});
const enable=(objects:number,auto=1,on=1,kill=0):LogicNode=>({kind:'Enable',fields:[pod('autoStart',12,auto),ref('objects',56,objects),pod('enable',64,on),pod('killEvents',65,kill)]});
const delay=(events:number,duration=2,frames=1,staggered=0,beat=0,auto=1):LogicNode=>({kind:'Delay',fields:[pod('autoStart',12,auto),pod('delay',56,duration,4),pod('staggered',60,staggered),pod('waitForBeat',61,beat),pod('useFrames',62,frames),ref('events',64,events)]});
const condition=(objects:number,events:number,invert=0,once=0):LogicNode=>({kind:'IfEnabled',fields:[pod('autoStart',12,1),ref('events',72,events),pod('triggerOnDisabled',64,invert),ref('areTheseObjectsEnabled',56,objects),pod('checkOnce',80,once)]});
export function logicCases():{cases:LogicCase[];audit:unknown} {
 const cases:LogicCase[]=[];const put=(name:string,nodes:LogicNode[],actions:number[][]=Array.from({length:5},()=>[0,0,0,0]),extra:Partial<LogicCase>={})=>cases.push({name,nodes,actions,...extra});
 for(const reversed of [false,true])for(const kill of [0,1])for(const on of [0,1])for(const nested of [false,true]) {
  // Keep reference relationships under both creation/slot orders.
  const nodes=[float(0),clump([nested?4:3]),enable(1,1,on,kill),add(0,0),...(nested?[clump([3])]:[])];
  if(reversed){[nodes[2],nodes[3]]=[nodes[3],nodes[2]];nodes[1]=clump([nested?4:2]);if(nested)nodes[4]=clump([2]);}
  put(`ordering-${reversed}-${kill}-${on}-${nested}`,nodes);
 }
 for(const invert of [0,1])for(const once of [0,1])for(const observed of [0,1,2]) {
  put(`condition-${invert}-${once}-${observed}`,[float(0),clump([observed===2?-1:observed===1?3:0]),condition(1,4,invert,once),add(0,0),clump([3])]);
 }
 put('enable-after-target-visited',[float(0),clump([2]),add(0),enable(1)],[[9,2,16,0],[9,3,16,1],...Array.from({length:5},()=>[0,0,0,0])]);
 put('stop-after-target-update',[float(0),clump([2]),add(0,1),enable(1,1,0,1)]);
 put('get-enabled-normalizes-raw-byte',[float(0),add(0)],[[9,1,35,2],[2,1,0,0]]);
 put('clump-direct-array-destructor',[clump([1]),float(0)],[[11,0,0,0],[11,0,0,0]]);
 put('clump-placement-retains-occupancy',[{kind:'Clump',fields:[]}],[[10,0,0,0]]);
 put('nested-enable-ifenabled-add',[float(0),enable(5),condition(4,6),add(0),clump([0]),clump([2]),clump([3])]);
 put('duplicate-event-stop',[float(0),clump([3,3]),enable(1,1,1,1),add(0)]);
 put('enable-null-member-assert',[clump([-1]),enable(0)]);
 put('empty-array-loader-assert',[clump([])]);
 put('clump-null-get-default',[clump([1]),float(0)],[[2,0,0,0],[2,0xffffffff,0,0],[1,0,1,0]]);
 put('clump-resize-release-recreate',[clump([1]),float(0)],[[3,0,1,0],[3,0,3,0],[3,0,0,0],[4,0,0,0],[4,0,0,0],[5,0,2,0],[5,0,0,0],[0,0,0,0]]);
 put('clump-heap-assert-before-samecount',[clump([1]),float(0)],[[6,0,0,0],[3,0,1,0]]);
 put('clump-pool-exhaustion',[],[[8,1281,0,0]]);
 put('reflection-receiver-failure',[float(0),add(0)],[[1,1,1,0]],{failure:1});
 put('reflection-asclass-fallback',[float(0),add(0)],[[1,1,1,0],[2,1,0,0]],{failure:2});
 put('clump-data-reload-during-set',[clump([1,2]),add(3),add(3),float(0)],[[1,0,1,0],[0,0,0,0]],{failure:3});
 put('enable-clump-reload-during-set',[clump([2,3]),enable(0),add(4),add(4),float(0)],[[0,0,0,0]],{failure:3});
 put('field-bounds-preserves-unpublished-node',[float(2),clump([0]),enable(1)],[],{truncate:1});
 for(const frames of [0,1])for(const staggered of [0,1])for(const duration of [-1,0,1,2,2.5]) {
  put(`delay-${frames}-${staggered}-${duration}`,[float(0),delay(2,duration,frames,staggered),clump([3,4]),add(0,0,0),add(0,0,0)],Array.from({length:12},()=>[0,0,0,0]),{time:{delta:0.5,scale:1,speed:1,override:false,beat:true}});
 }
 put('delay-frame-two',[float(0),delay(2),clump([3]),add(0,0,0)]);
 put('delay-beat-gate',[float(0),delay(2,0,1,0,1),clump([3]),add(0,0,0)],[[13,0,0,0],[0,0,0,0],[0,0,0,0],[13,0,1,0],[0,0,0,0],[0,0,0,0]]);
 put('delay-disable-reenable-reset',[float(0),delay(2,2,1,1),clump([3,3]),add(0,0,0)],[[0,0,0,0],[0,0,0,0],[1,1,0,0],[0,0,0,0],[1,1,1,0],...Array.from({length:5},()=>[0,0,0,0])]);
 put('delay-resume-resets-both-counters',[float(0),delay(2,2,1,1),clump([3,3]),add(0,0,0)],[[0,0,0,0],[0,0,0,0],[0,0,0,0],[1,1,1,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]);
 put('delay-staggered-index-assert',[float(0),delay(2,1,1,1),clump([3]),add(0,0,0)],[[0,0,0,0],[9,1,76,2],[0,0,0,0]]);
 put('delay-empty-staggered-assert',[delay(1,0,1,1),clump([0])],[[3,1,0,0],[0,0,0,0]]);
 put('delay-zero-count-bulk-finishes',[delay(1,0),clump([0])],[[3,1,0,0],[0,0,0,0]]);
 put('delay-time-live-scale',[float(0),delay(2,0.04,0),clump([3]),add(0,0,0)],[[0,0,0,0],[12,0,32,0],[0,0,0,0],[12,0,32,0x3f800000],[0,0,0,0]]);
 put('delay-null-member-assert',[delay(1,0),clump([-1])]);
 put('delay-placement-preserves-unsaved-bytes',[{kind:'Delay',fields:[]}],[]);
 put('delay-enable-nested-chain',[float(0),enable(2),clump([3]),delay(4,1,1,0,0,0),clump([5]),add(0,0,0)]);
 for(const delta of [-1,0,0.016,1])for(const override of [false,true]) {
  put(`delay-time-${delta}-${override}`,[float(0),delay(2,0.03,0),clump([3]),add(0,0,0)],Array.from({length:8},()=>[0,0,0,0]),{time:{delta,scale:2,speed:0.5,override,beat:true}});
 }
 for(const n of [1,2,3,8])for(const input of [-1,-0,0,0.25,0.5,1,2]) {
  put(`split-${n}-${Object.is(input,-0)?'minus-zero':input}`,[float(input),split(0,2),clump(Array.from({length:n},(_,i)=>3+i)),...Array.from({length:n},()=>float(0))]);
 }
 put('split-input-output-alias',[float(0.5),split(0,2),clump([0,3]),float(0)]);
 put('split-empty-output-null-input',[split(-1,1),clump([0])],[[3,1,0,0],[0,0,0,0]]);
 put('split-null-output-cast-assert',[float(0.5),split(0,2),clump([-1])]);
 put('split-wrong-output-class-assert',[float(0.5),split(0,2),clump([1])]);
 put('split-count-reload-after-cast',[clump([1,2]),float(0),float(0),float(0.5),split(3,0)],[[0,0,0,0]],{failure:4});
 for(const op of [0,1,2,3,4,9])for(const input of [0.9998,0.99995,1,1.00005,1.0002])for(const boolean of [0,1,2,9]) {
  put(`onfloat-${op}-${input}-${boolean}`,[float(input),float(0),onfloat(0,3,4,op,2,boolean),clump([5]),clump([6]),add(1,0,0),subtract(1)],Array.from({length:2},()=>[0,0,0,0]));
 }
 put('onfloat-false-output-null-stays-active',[float(0),onfloat(0,-1,-1)],[[0,0,0,0],[2,1,0,0],[0,0,0,0]]);
 put('onfloat-checkonce-null-output-finishes',[float(0),onfloat(0,-1,-1,1,2,0,1,1)],[[0,0,0,0],[2,1,0,0],[0,0,0,0]]);
 put('onfloat-live-threshold',[float(1),float(2),float(0),{...onfloat(0,4,5,1,2,0,0),fields:onfloat(0,4,5,1,2,0,0).fields.map(f=>f.name==='conditionOneFloat'?ref(f.name,f.offset,1):f)},clump([6]),clump([7]),add(2,0,0),subtract(2)],[[14,1,16,0x3f000000],[0,0,0,0],[14,0,16,0],[0,0,0,0]]);
 for(const invert of [0,1,2])for(const boolean of [0,1,2]) {
  const nodes=[float(1),float(0),onfloat(0,4,5,1,2,boolean),onfloat(0,-1,-1),clump([6]),clump([7]),add(1,0,0),subtract(1)];
  const root=nodes[2];root.fields=root.fields.map(f=>f.name==='conditionOneOnFloat'?ref(f.name,f.offset,3):f.name==='notConditionOneOnFloat'?pod(f.name,f.offset,invert):f);
  put(`onfloat-nested-${invert}-${boolean}`,nodes,[[0,0,0,0],[0,0,0,0]]);
 }
 for(const name of ['', 'x'.repeat(14),'x'.repeat(22),'x'.repeat(23),'x'.repeat(96)]) {
  put(`onfloat-debug-string-${name.length}`,[float(1),onfloat(0,-1,-1,1,2,0,1,1,1,name)]);
 }
 put('onfloat-long-to-short-copy',[float(1),onfloat(0,-1,-1,1,2,0,1,1,0,'x'.repeat(24))],[[9,1,104,8],[0,0,0,0]]);
 put('onfloat-copy-length-error',[float(1),onfloat(0,-1,-1,1,2,0,1,1,0,'x'.repeat(24))],[[9,1,104,4097],[0,0,0,0]]);
 const doubleNested=[float(1),float(0),onfloat(0,4,5),onfloat(0,-1,-1,1,2,0,1,0,1,'child'),clump([6]),clump([7]),add(1,0,0),subtract(1)];
 doubleNested[2].fields=doubleNested[2].fields.map(f=>['conditionOneOnFloat','conditionTwoOnFloat'].includes(f.name)?ref(f.name,f.offset,3):f);
 doubleNested[3].fields=doubleNested[3].fields.map(f=>f.name==='autoStart'?pod(f.name,f.offset,0):f);
 put('onfloat-both-nested-no-short-circuit',doubleNested,[[0,0,0,0],[0,0,0,0]]);
 put('onfloat-placement-unwritten-fields',[{kind:'OnFloat',fields:[]}],[]);
 put('split-placement-unwritten-fields',[{kind:'FloatSplit',fields:[]}],[]);
 put('split-onfloat-delay-output-chain',[float(0.75),float(0),float(0),split(0,4),clump([1,2]),onfloat(1,6,-1),clump([7]),delay(8,1,1,0,0,0),clump([9]),add(2,0,0)]);
 for(const initial of [0,1,2,255])for(const on of [0,1]) {
  put(`marker-enable-${initial}-${on}`,[marker(initial),clump([0]),enable(1,1,on)],[[2,0,0,0],[0,0,0,0],[2,0,0,0],[0,0,0,0]]);
 }
 put('marker-default-enabled',[{kind:'Marker',fields:[]}],[[2,0,0,0]]);
 put('marker-slot-release-reuse',[marker(1),marker(0)],[[15,0xffffffff,0,0],[15,0,0,0],[15,0,0,0],[16,0,0,0],[2,1,0,0],[0,0,0,0]]);
 put('marker-pool-id-wrap',[marker(1)],[[18,0,0,0xffffffff],[16,0,0,0],[16,0,0,0],[0,0,0,0]]);
 put('marker-pool-capacity-assert',[marker(1)],[[18,0,1,1],[16,0,0,0]]);
 put('marker-pool-real-capacity-assert',[marker(1)],[[24,1024,0,0]]);
 put('marker-pool-full-bitmap-word',[marker(1)],[...Array.from({length:32},()=>[16,0,0,0]),[0,0,0,0]]);
 put('marker-release-negative-assert',[marker(1)],[[19,0,0,0]]);
 put('marker-release-outside-assert',[marker(1)],[[19,0,1,0]]);
 put('marker-terminate-retains-id',[marker(1),marker(0)],[[20,0,0,0],[16,0,0,0],[0,0,0,0]]);
 put('marker-placement-retains-fields',[marker(1)],[[9,0,16,0x12345678],[9,0,64,0x11223302],[21,0,0,0],[2,0,0,0],[0,0,0,0]]);
 for(const initial of [0,1])put(`marker-ifenabled-output-${initial}`,[marker(initial),float(0),clump([0]),condition(2,4),clump([5]),add(1,0,0)],[[0,0,0,0],[1,0,1-initial,0],[0,0,0,0],[0,0,0,0]]);
 put('onfloat-enable-marker-ifenabled-add',[float(1),marker(0),clump([1]),onfloat(0,2,-1),float(0),clump([1]),condition(5,7),clump([8]),add(4,0,0)]);
 put('resume-null-member-assert',[clump([-1]),resume(0)]);
 put('resume-marker-and-float-fallback',[marker(0),float(0),clump([0,1]),resume(2)],[[0,0,0,0],[2,0,0,0]]);
 put('resume-nested-clump-enable-method',[marker(0),float(0),clump([0,1]),clump([2]),resume(3)]);
 put('resume-enable-checkpoint-method',[float(0),clump([3]),enable(1,0,0,1),add(0,0,0),clump([2]),resume(4)]);
 put('resume-delay-starts-from-zero',[float(0),add(0,0,0),clump([1]),delay(2,2,1,0,0,0),clump([3]),resume(4)]);
 put('resume-placement-with-null-group',[{kind:'ResumeEnable',fields:[]}],[]);
 put('resume-required-missing-method',[marker(1)],[[22,0,1,0]]);
 put('resume-receiver-cast-assert',[enable(-1,0)],[[22,0,0,0]],{failure:1});
 const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
 const counts:Record<string,number>={},unresolved:Record<string,number>={},eligible:Record<string,number>={};let cyclic=0,oversized=0;const prefixes:Record<string,number>={};
 const native=properties as Record<string,Record<string,{nativeOffset:number}>>;
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const filename=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(filename))continue;
  const bytes=fs.readFileSync(filename),doc=new ObjectsDocument(bytes),sha256=crypto.createHash('sha256').update(bytes).digest('hex');
  for(const root of doc.nodes.filter(n=>n.className==='Enable'||n.className==='IfEnabled'||n.className==='Delay'||n.className==='FloatSplit'||n.className==='OnFloat'||n.className==='ResumeEnable')){
   counts[root.className]=(counts[root.className]??0)+1;const ids=new Set<number>(),missing=new Set<string>();
   const visit=(id:number)=>{if(ids.has(id))return;ids.add(id);const node=doc.nodes[id];if(!node){missing.add('invalid-reference');return;}if(!kinds.includes(node.className as LogicKind)||node.className==='Object'||node.className==='Event'){missing.add(node.className);return;}
    for(const f of node.fields) {if(f.kind==='reference'&&f.value!==0xffffffff)visit(Number(f.value));if(f.kind==='array')for(const child of f.children??[])if(child.kind==='reference'&&child.value!==0xffffffff)visit(Number(child.value));}
   };visit(root.id);
   if(missing.size){for(const name of missing)unresolved[name]=(unresolved[name]??0)+1;}
   const quotaKey=level+'-'+root.className;if(missing.size&&root.className==='Enable'&&(prefixes[quotaKey]??0)>=3)continue;
   const order=[...ids].sort((a,b)=>a-b);if(order.length>48){oversized++;continue;}
   const visiting=new Set<number>(),done=new Set<number>();let hasCycle=false;
   const cycle=(id:number)=>{if(visiting.has(id)){hasCycle=true;return;}if(done.has(id))return;visiting.add(id);const n=doc.nodes[id];if(n.className==='Clump')for(const f of n.fields)for(const x of f.children??[])if(x.value!==0xffffffff&&doc.nodes[Number(x.value)]?.className==='Clump')cycle(Number(x.value));if(n.className==='OnFloat')for(const f of n.fields)if(['conditionOneOnFloat','conditionTwoOnFloat'].includes(f.name)&&f.value!==0xffffffff&&doc.nodes[Number(f.value)]?.className==='OnFloat')cycle(Number(f.value));visiting.delete(id);done.add(id);};for(const id of order)cycle(id);if(hasCycle){cyclic++;continue;}
   const nodes=order.map(id=>{const node=doc.nodes[id],decl=doc.classes[node.classIndex];if(!kinds.includes(node.className as LogicKind))return {kind:node.className,fields:[]};return {kind:node.className as LogicKind,fields:decl.properties.map((p,i)=>{
    const f=node.fields[i],offset=native[node.className]?.[p.name]?.nativeOffset??(p.name==='autoStart'?12:-1);if(offset<0||![0,1,2,3].includes(p.type))throw new Error(`Unprepared real field ${node.className}.${p.name}`);
    const b=Buffer.from(f.raw,'hex');if(p.type===2)b.writeUInt32LE(f.value===0xffffffff?0xffffffff:order.indexOf(Number(f.value))>>>0);else if(p.type===3){if(p.classIndex!==0xffffffff)throw new Error('Nested struct outside Clump scope');for(let j=4;j<b.length;j+=4){const old=b.readUInt32LE(j);b.writeUInt32LE(old===0xffffffff?old:order.indexOf(old)>>>0,j);}}
    return {name:p.name,type:p.type,offset,size:p.size,raw:b.toString('hex')};})};});
   if(!missing.size)eligible[root.className]=(eligible[root.className]??0)+1;prefixes[quotaKey]=(prefixes[quotaKey]??0)+1;
   put(`corpus-${level}-${root.className}-${root.id}`,nodes,[[1,order.indexOf(root.id),1,0],...Array.from({length:6},()=>[0,0,0,0])],{source:{level,root:root.id,nodes:order,sha256}});
  }
 }
 return {cases,audit:{roots:counts,eligible,prefixes,unresolved,cyclic,oversized}};
}
export function logicMemory(c:LogicCase):Buffer {
 const b=Buffer.alloc(0x40000),p=(at:number,value:bigint)=>b.writeBigUInt64LE(value,at),rp=(at:number,off:number)=>p(at,R+BigInt(off));
 rp(0x98+8*8,0x6000);b.writeUInt32LE(8,0x6038);
 kinds.forEach((_,id)=>{if(id===8)return;const meta=logicMetaOffset(id);rp(0x98+id*8,meta);b.writeUInt32LE(id,meta+0x38);b.writeBigUInt64LE(id>=3?1n:0n,meta+0x40);b.writeUInt32LE(id===7?0:1,meta+0x3c);rp(meta+0x50,0x7000+id*256);if((id>=3&&id<=6)||(id>=9&&id<=11)||id===13)p(meta+0x30,0x102310000n);});
 const method=(at:number,body:bigint,wrapper:bigint,getter:bigint)=>{p(at+0x38,body);p(at+0x40,0n);p(at+0x48,wrapper);p(at+0x58,getter);};
 method(0x6100,0x10032e2c0n,0x10032fd60n,0x102310100n);method(0x6200,0x10032e2e0n,0x10032fe80n,0x102310100n);method(0x6300,0x10022b7f0n,0x10022c720n,0x102310200n);method(0x6400,0x10022b840n,0x10022c840n,0x102310200n);
 method(0x6a00,0x10043cff0n,0x10043e700n,0x102310600n);method(0x6b00,0x11n,0x10043e820n,0x102310600n);
 method(0x6c00,0x100316400n,0x100316df0n,0x102310700n);method(0x6d00,0x10022bba0n,0x10022cba0n,0x102310200n);
 b.write('GetEnabled\0SetEnabled\0OnResumeEnabled\0',0x8800);
 const entry=(at:number,name:number,method:number)=>{rp(at+0x20,name);rp(at+0x28,method);};
 entry(0x8000,0x8800,0x6200);entry(0x8040,0x880b,0x6100);rp(0x8008,0x8040);rp(0x7708,0x8000);
 entry(0x8080,0x880b,0x6300);rp(0x7208,0x8080);
 // Nonmatching and null entries test lower_bound + inheritance, rather than
 // bypassing method lookup for the derived classes.
 entry(0x8100,0x8800,0x6200);p(0x8128,0n);rp(0x7308,0x8100);
 entry(0x8200,0x8800,0x6b00);entry(0x8240,0x880b,0x6a00);rp(0x8208,0x8240);rp(0x7c08,0x8200);
 entry(0x8280,0x8816,0x6c00);rp(0x8108,0x8280);
 entry(0x82c0,0x8816,0x6d00);rp(0x8080,0x82c0);
 rp(0xd420,0xe000);rp(0xd428,0xe400);rp(0xd438,0x10000);rp(0xd440,0x14000);rp(0xd450,0xf000);rp(0xd470,0x30000);rp(0xd480,0x18000);b.writeUInt32LE(1024,0xd488);
 const time=c.time??{delta:1/30,scale:1,speed:1,override:false,beat:true};
 rp(0x9000+0x160,0x9800);rp(0x9000+0x5c8,0x9900);rp(0x9910,0x9980);rp(0x9980,0x9b00);p(0x9b00+0x138,0x102310500n);
 b.writeFloatLE(time.delta,0x9814);b.writeFloatLE(time.scale,0x9820);b.writeFloatLE(time.speed,0x9840);b[0x9844]=Number(time.override);b[0x99c0]=Number(time.beat);
 let fi=0,dataAt=0x30000,defaultAt=0;

 c.nodes.forEach((node,i)=>{const kind=(kinds.indexOf(node.kind as LogicKind)<0?8:kinds.indexOf(node.kind as LogicKind)),decl=0xe000+i*12;b.writeUInt32LE(kind,decl);b.writeUInt32LE(fi,decl+4);b.writeUInt32LE(node.fields.length,decl+8);b.writeUInt32LE(kind,0xb000+i*16);rp(0xb008+i*16,decl);
  if(node.kind==='Delay'&&!node.fields.some(f=>f.name==='waitForBeat')) {
   b.writeUInt32LE(defaultAt,0xe400+i*8);b.writeUInt32LE(1,0xe404+i*8);
   const at=0xf000+defaultAt++*28;b.writeUInt32LE(0,at);b.writeUInt32LE(1,at+4);b.writeUInt32LE(61,at+8);
  }
  if(node.kind==='Marker'&&!node.fields.some(f=>f.name==='enabled')) {
   b.writeUInt32LE(defaultAt,0xe400+i*8);b.writeUInt32LE(1,0xe404+i*8);
   const at=0xf000+defaultAt++*28;b.writeUInt32LE(0,at);b.writeUInt32LE(1,at+4);b.writeUInt32LE(64,at+8);b[at+12]=1;
  }
  node.fields.forEach(f=>{const at=0x10000+fi*16,aux=0x14000+fi*32,field=0x20000+fi*80;
   b.writeUInt32LE(f.type,at);b.writeUInt32LE(1,at+4);b.writeUInt32LE(f.size,at+8);b.writeUInt32LE(0xffffffff,at+12);p(aux,BigInt(f.offset));p(aux+8,BigInt(node.kind==='OnFloat'&&(f.name==='conditionOneOnFloat'||f.name==='conditionTwoOnFloat')?8:0));
   if(f.type===3){rp(aux+16,field);rp(aux+24,0x6400);p(field+0x20,BigInt(f.offset));p(field+0x38,16n);p(field+0x48,0n);}
   const raw=Buffer.from(f.raw,'hex');raw.copy(b,dataAt);dataAt+=raw.length;fi++;
  });
 });
 if(fi>512||dataAt>0x3c000||c.nodes.length>48)throw new Error('Logic fixture capacity');
 b.writeUInt32LE(c.nodes.length,0xbff0);b.writeUInt32LE(c.actions.length,0xbff4);b.writeUInt32LE(c.failure??0,0xbff8);b.writeUInt32LE(dataAt-0x30000-(c.truncate??0),0xd478);
 c.actions.forEach((action,i)=>action.forEach((n,j)=>b.writeUInt32LE(n>>>0,0x3c000+i*16+j*4)));
 // A node's declaration is its original field order; source node IDs remap
 // only reference indices. Class registration/default preparation is explicit.
 return b;
}
