import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
import {ObjectsDocument,type ObjectNode} from '../src/core/objects';
import {objectPlaybackCandidates,objectPlaybackClasses,type ObjectPlaybackCandidate} from '../src/core/object-playback-plan';
import {prepareSetFloatMap} from './set-float-map-preview-map';
export interface ObjectLogicPreviewCase {level:string;id:number;kind:string;nodes:ObjectNode[];deltas:number[];sourceSha256:string|null;}
export function objectLogicPreviewCases(data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus'):{cases:ObjectLogicPreviewCase[];availability:unknown}{
 const cases:ObjectLogicPreviewCase[]=[],availability={levels:0,classes:{} as Record<string,{total:number;available:number;blocked:Record<string,number>}>};
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;
  const bytes=fs.readFileSync(file),document=new ObjectsDocument(bytes),candidates=objectPlaybackCandidates(document.nodes);availability.levels++;
  const subset=(c:ObjectPlaybackCandidate)=>{
   const ids=new Set<number>();const visit=(id:number)=>{if(id===0xffffffff||ids.has(id))return;ids.add(id);const n=document.nodes[id];if(!n)throw new Error('Missing serialized node');
    const fields=objectPlaybackClasses.includes(n.className as any)?n.fields.filter(f=>f.kind==='reference'):n.className==='Clump'?n.fields.flatMap(f=>f.children??[]):[];
    for(const f of fields)if(f.kind==='reference')visit(Number(f.value));
   };visit(c.id);return document.nodes.filter(n=>ids.has(n.id));
  };
  for(const c of candidates){
   const stats=availability.classes[c.kind]??={total:0,available:0,blocked:{}};stats.total++;
   if(!c.available){stats.blocked[c.reason]=(stats.blocked[c.reason]??0)+1;continue;}stats.available++;
   if(c.kind==='TransformObject'||c.events.length>48||c.affectedObjects.length>48)continue;
   // All accepted bounded real roots, with first-frame dispatch and enough
   // frames to exercise ordinary/frame delay and multiple event handoffs.
   cases.push({level,id:c.id,kind:c.kind,nodes:subset(c),deltas:[0,...Array(24).fill(.25)],sourceSha256:crypto.createHash('sha256').update(bytes).digest('hex')});
  }
 }
 return {cases,availability};
}

/** Prepared mixed chains derived from real saved fields. These are synthetic
 * input graphs and never counted as additional original-map roots. */
export function objectLogicPreviewSyntheticCases(real:ObjectLogicPreviewCase[],data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus'):ObjectLogicPreviewCase[]{
 const candle=real.find(r=>r.level==='CandleSpace'&&r.id===31)!,delay=real.find(r=>r.kind==='Delay')!,condition=real.find(r=>r.kind==='IfEnabled')!;
 const dawn=new ObjectsDocument(fs.readFileSync(path.join(data,'Levels','Dawn','Objects.level.bin'))),base=objectPlaybackCandidates(dawn.nodes,['TransformObject']).find(c=>c.id===156)!;
 const ids=new Set<number>([156,...base.events,...base.endpoints]);
 for(const p of base.plans){const node=dawn.nodes[p.id];for(const f of node.fields)if(f.kind==='reference'&&Number(f.value)!==0xffffffff)ids.add(Number(f.value));}
 const transform=dawn.nodes.filter(n=>ids.has(n.id)),rows:ObjectLogicPreviewCase[]=[];
 const word=(n:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(n>>>0);return b.toString('hex');};
 const set=(node:ObjectNode,name:string,value:number,size=1)=>{const f=node.fields.find(f=>f.name===name)!;f.value=value;f.raw=size===4?word(value):value.toString(16).padStart(2,'0');};
 const float=(node:ObjectNode,name:string,value:number)=>{const b=Buffer.alloc(4);b.writeFloatLE(value);const f=node.fields.find(f=>f.name===name)!;f.value={uint:b.readUInt32LE(),int:b.readInt32LE(),float:value};f.raw=b.toString('hex');};
 for(const frames of [0,1])for(const stagger of [0,1])for(const kill of [0,1]){
  const nodes=structuredClone(candle.nodes);
  for(const n of nodes){n.id+=10000;for(const f of n.fields.flatMap(f=>[f,...f.children??[]]))if(f.kind==='reference'&&Number(f.value)!==0xffffffff){f.value=Number(f.value)+10000;f.raw=word(Number(f.value));}}
  nodes.push(...structuredClone(transform));
  const template=nodes.find(n=>n.className==='Clump')!;
  const group=(id:number,members:number[])=>{const n=structuredClone(template);n.id=id;const f=n.fields.find(f=>f.name==='data')!,child=f.children![0];f.value=members.length;f.children=members.map((id,i)=>({...structuredClone(child),id:child.id+'/'+i,value:id,raw:word(id)}));nodes.push(n);return id;};
  const d=structuredClone(delay.nodes.find(n=>n.id===delay.id)!);d.id=40001;set(d,'events',group(40011,[40012,40002]),4);set(d,'staggered',stagger);set(d,'useFrames',frames);set(d,'waitForBeat',0);float(d,'delay',frames?2:.5);nodes.push(d);
  group(40012,[10031,156,0xffffffff]);
  const e=nodes.find(n=>n.id===10031)!;set(e,'objects',group(40015,[156,10005]),4);set(e,'enable',0);set(e,'killEvents',kill);
  const c=structuredClone(condition.nodes.find(n=>n.id===condition.id)!);c.id=40002;set(c,'areTheseObjectsEnabled',group(40013,[10005,40014]),4);group(40014,[10005]);set(c,'events',group(40016,[156]),4);set(c,'triggerOnDisabled',0);set(c,'checkOnce',1);nodes.push(c);
  rows.push({level:`prepared-mixed-${frames}-${stagger}-${kill}`,id:40001,kind:'Delay',nodes,deltas:[0,...Array(24).fill(.25)],sourceSha256:null});
 }
 return rows;
}

/** Additional prepared numeric graphs; saved node fields are cloned and
 * remapped, with explicit aliases/limits/links. These are not real map roots. */
export function objectLogicNumericSyntheticCases(real:ObjectLogicPreviewCase[]):ObjectLogicPreviewCase[]{
 const addSource=real.find(c=>c.kind==='FloatAdd')!,multSource=real.find(c=>c.kind==='FloatMult')!;
 const word=(v:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(v>>>0);return b.toString('hex');};
 const set=(n:ObjectNode,name:string,value:number)=>{const f=n.fields.find(f=>f.name===name)!;f.value=value;f.raw=f.kind==='reference'?word(value):value.toString(16).padStart(2,'0');};
 const scalar=(n:ObjectNode,name:string,value:number)=>{const f=n.fields.find(f=>f.name===name)!,b=Buffer.alloc(4);b.writeFloatLE(value);f.raw=b.toString('hex');f.value={uint:b.readUInt32LE(),int:b.readInt32LE(),float:value};};
 const clone=(c:ObjectLogicPreviewCase,offset:number)=>{const nodes=structuredClone(c.nodes);for(const n of nodes){n.id+=offset;for(const f of n.fields.flatMap(f=>[f,...f.children??[]]))if(f.kind==='reference'&&Number(f.value)!==0xffffffff){f.value=Number(f.value)+offset;f.raw=word(Number(f.value));}}return nodes;};
 const rows:ObjectLogicPreviewCase[]=[];
 for(const clamp of [false,true]){
  const nodes=clone(addSource,50000),id=addSource.id+50000,add=nodes.find(n=>n.id===id)!,target=Number(add.fields.find(f=>f.name==='target')!.value),cell=nodes.find(n=>n.id===target)!;
  scalar(cell,'value',clamp?-2:1);set(add,'output',target);set(add,'amountFloat',clamp?0xffffffff:target);scalar(add,'amount',10);scalar(add,'minClampedValue',5);scalar(add,'maxClampedValue',0);set(add,'useMinClampedValue',Number(clamp));set(add,'useMaxClampedValue',Number(clamp));set(add,'updateEveryFrame',Number(!clamp));
  rows.push({level:clamp?'prepared-numeric-clamp-order':'prepared-numeric-alias-feedback',id,kind:'FloatAdd',nodes,deltas:[0,...Array(24).fill(.25)],sourceSha256:null});
 }
 for(const staggered of [0,1]){
  const nodes=structuredClone(objectLogicPreviewSyntheticCases(real)[0].nodes),adds=clone(addSource,50000),mults=clone(multSource,60000);nodes.push(...adds,...mults);
  const add=adds.find(n=>n.id===addSource.id+50000)!,mult=mults.find(n=>n.id===multSource.id+60000)!,input=Number(add.fields.find(f=>f.name==='target')!.value),output=Number(mult.fields.find(f=>f.name==='output')!.value),b=Number(mult.fields.find(f=>f.name==='b')!.value);
  scalar(nodes.find(n=>n.id===input)!,'value',0);scalar(nodes.find(n=>n.id===b)!,'value',2);scalar(nodes.find(n=>n.id===output)!,'value',0);set(add,'output',input);set(add,'amountFloat',0xffffffff);scalar(add,'amount',.125);scalar(add,'maxClampedValue',.5);set(add,'useMinClampedValue',0);set(add,'useMaxClampedValue',1);set(add,'updateEveryFrame',1);set(mult,'a',input);
  const transform=nodes.find(n=>n.id===156)!;set(transform,'progress01',output);set(transform,'continuous',0);set(transform,'completeAtEnd',0);
  const delay=nodes.find(n=>n.id===40001)!;set(delay,'staggered',staggered);scalar(delay,'delay',.5);
  const group=nodes.find(n=>n.id===40011)!.fields.find(f=>f.name==='data')!,child=group.children![0];group.value=3;group.children=[156,add.id,mult.id].map((id,i)=>({...structuredClone(child),id:child.id+'/'+i,value:id,raw:word(id)}));
  rows.push({level:`prepared-numeric-delay-transform-${staggered}`,id:40001,kind:'Delay',nodes,deltas:[0,...Array(24).fill(.25)],sourceSha256:null});
 }
 {
  const nodes=structuredClone(objectLogicPreviewSyntheticCases(real)[0].nodes),adds=clone(addSource,50000);nodes.push(...adds);const add=adds.find(n=>n.id===addSource.id+50000)!,input=Number(add.fields.find(f=>f.name==='target')!.value),group=(id:number,members:number[])=>{const f=nodes.find(n=>n.id===id)!.fields.find(f=>f.name==='data')!,child=f.children![0];f.value=members.length;f.children=members.map((id,i)=>({...structuredClone(child),id:child.id+'/'+i,value:id,raw:word(id)}));};
  scalar(nodes.find(n=>n.id===input)!,'value',1);set(add,'amountFloat',0xffffffff);set(add,'output',input);scalar(add,'amount',.5);set(add,'updateEveryFrame',0);
  const delay=nodes.find(n=>n.id===40001)!;scalar(delay,'delay',0);group(40011,[10031,40002]);group(40015,[input]);group(40013,[input]);group(40016,[add.id]);
  rows.push({level:'prepared-numeric-float-enabled-default',id:40001,kind:'Delay',nodes,deltas:[0,...Array(24).fill(.25)],sourceSha256:null});
 }
 return rows;
}

/** Prepared SetFloat controllers share actual Float storage with a saved
 * TransformObject. These changed links/scalars are synthetic map inputs. */
export function objectLogicSetFloatSyntheticCases(real:ObjectLogicPreviewCase[]):ObjectLogicPreviewCase[]{
 const source=real.find(c=>c.kind==='SetFloat')!,base=objectLogicNumericSyntheticCases(real).find(c=>c.level==='prepared-numeric-delay-transform-0')!;
 const word=(v:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(v>>>0);return b.toString('hex');};
 const set=(n:ObjectNode,name:string,value:number)=>{const f=n.fields.find(f=>f.name===name)!;f.value=value;f.raw=f.kind==='reference'?word(value):value.toString(16).padStart(2,'0');};
 const scalar=(n:ObjectNode,name:string,value:number)=>{const f=n.fields.find(f=>f.name===name)!,b=Buffer.alloc(4);b.writeFloatLE(value);f.raw=b.toString('hex');f.value={uint:b.readUInt32LE(),int:b.readInt32LE(),float:value};};
 return [[2,1],[0,1],[30,1],[3,2]].map(([snappiness,duration])=>{
  const nodes=structuredClone(base.nodes),controller=structuredClone(source.nodes.find(n=>n.id===source.id)!);controller.id=70043;nodes.push(controller);
  const transform=nodes.find(n=>n.id===156)!,input=Number(nodes.find(n=>n.className==='FloatAdd')!.fields.find(f=>f.name==='target')!.value);
  set(controller,'target',input);scalar(controller,'targetValue',1);scalar(controller,'time',duration);scalar(controller,'snappiness',snappiness);
  scalar(nodes.find(n=>n.id===input)!,'value',0);set(transform,'progress01',input);
  const group=nodes.find(n=>n.id===40011)!.fields.find(f=>f.name==='data')!,child=group.children![0];group.value=2;group.children=[156,controller.id].map((id,i)=>({...structuredClone(child),id:child.id+'/'+i,value:id,raw:word(id)}));
  return {level:`prepared-set-float-transform-${snappiness}-${duration}`,id:40001,kind:'Delay',nodes,deltas:[0,...Array(24).fill(.25)],sourceSha256:null};
 });
}

/** A fixed controller freezes an absolute transform but an original
 * continuous transform keeps applying its increment. Verify both modes. */
export function objectLogicSinglePulseSyntheticCases(real:ObjectLogicPreviewCase[]):ObjectLogicPreviewCase[]{
 const base=objectLogicNumericSyntheticCases(real).find(c=>c.level==='prepared-numeric-delay-transform-0')!;
 return [0,1].map(continuous=>{
  const nodes=structuredClone(base.nodes),add=nodes.find(n=>n.className==='FloatAdd')!,pulse=add.fields.find(f=>f.name==='updateEveryFrame')!;pulse.value=0;pulse.raw='00';
  const flag=nodes.find(n=>n.id===156)!.fields.find(f=>f.name==='continuous')!;flag.value=continuous;flag.raw=continuous?'01':'00';
  return {...base,level:`prepared-single-pulse-transform-${continuous}`,nodes};
 });
}

export function objectLogicSetFloatMapCase(data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus'):ObjectLogicPreviewCase{
 const p=prepareSetFloatMap(fs.readFileSync(path.join(data,'Levels','DayHubCave','Objects.level.bin'))),ids=new Set([444,...p.candidate.events,...p.candidate.endpoints,...p.candidate.valueObjects,...p.candidate.clumps.map(c=>c.id)]);
 for(const plan of p.candidate.plans)for(const f of p.nodes[plan.id].fields)if(f.kind==='reference'&&Number(f.value)!==0xffffffff)ids.add(Number(f.value));
 return {level:'prepared-set-float-DayHubCave-platform',id:444,kind:'Enable',nodes:p.nodes.filter(n=>ids.has(n.id)),deltas:[0,...Array(120).fill(.1)],sourceSha256:null};
}
