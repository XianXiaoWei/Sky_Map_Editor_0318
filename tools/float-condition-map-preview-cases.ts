import fs from 'node:fs';
import path from 'node:path';
import {ObjectsDocument,type ObjectNode} from '../src/core/objects';
import {objectPlaybackCandidates} from '../src/core/object-playback-plan';
import {prepareFloatConditionMap} from './float-condition-map-preview-map';
import type {ObjectLogicPreviewCase} from './object-logic-preview-cases';

const word=(n:number)=>{const b=Buffer.alloc(4);b.writeUInt32LE(n>>>0);return b.toString('hex');};
export function conditionSet(n:ObjectNode,name:string,value:number){const f=n.fields.find(f=>f.name===name)!;f.value=f.kind==='bits32'?{uint:value>>>0,int:value|0,float:0}:value;f.raw=f.kind==='reference'||f.kind==='bits32'?word(value):value.toString(16).padStart(2,'0');}
export function conditionScalar(n:ObjectNode,name:string,value:number){const b=Buffer.alloc(4);b.writeFloatLE(value);const f=n.fields.find(f=>f.name===name)!;f.value={uint:b.readUInt32LE(),int:b.readInt32LE(),float:b.readFloatLE()};f.raw=b.toString('hex');}
function subset(nodes:ObjectNode[],root:number){const c=objectPlaybackCandidates(nodes).find(c=>c.id===root)!;if(!c.available)throw new Error(c.reason);const ids=new Set([root,...c.events,...c.endpoints,...c.valueObjects,...c.clumps.map(g=>g.id)]);for(const p of c.plans)for(const f of nodes.find(n=>n.id===p.id)!.fields)if(f.kind==='reference'&&Number(f.value)!==0xffffffff)ids.add(Number(f.value));return nodes.filter(n=>ids.has(n.id));}
export function objectLogicFloatConditionSyntheticCases(data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus'):ObjectLogicPreviewCase[]{
 const source=fs.readFileSync(path.join(data,'Levels','DayHubCave','Objects.level.bin')),doc=new ObjectsDocument(source),prepared=prepareFloatConditionMap(source),rows:ObjectLogicPreviewCase[]=[];
 rows.push({level:'prepared-condition-DayHubCave-platform',id:444,kind:'Enable',nodes:subset(prepared.nodes,444),deltas:[0,...Array(120).fill(.1)],sourceSha256:null});
 const add=(name:string,nodes:ObjectNode[],id:number)=>rows.push({level:`prepared-condition-${name}`,id,kind:nodes.find(n=>n.id===id)!.className,nodes:subset(nodes,id),deltas:[0,...Array(8).fill(.25)],sourceSha256:null});
 for(const [name,value,operator] of [['greater',.6,0],['equal-inclusive',.5,1],['less',.4,2],['less-inclusive',.5,3],['epsilon-inside',.500099,4],['epsilon-outside',.500101,4],['unknown-operator',.6,0xffffffff]] as const){
  const nodes=structuredClone(prepared.nodes),n=nodes[229];conditionScalar(nodes[874],'value',value);conditionScalar(n,'conditionOneValue',.5);conditionSet(n,'conditionOneOperator',operator);conditionSet(n,'checkOnce',1);conditionSet(n,'endOnTrigger',1);add(name,nodes,229);
 }
 for(const name of ['float-rhs','null-check-once','null-end-on-trigger','short-name','nested-invert-zero','nested-invert-one','nested-invert-two','nested-second-or','nested-second-and','unknown-boolean','shared-nested','both-nested-null-value','event-handoff-cycle']){
  const nodes=structuredClone(prepared.nodes),n=nodes[229];conditionScalar(nodes[874],'value',.5);conditionScalar(n,'conditionOneValue',.5);conditionSet(n,'conditionOneOperator',1);conditionSet(n,'trueEvents',nullId);conditionSet(n,'falseEvents',nullId);conditionSet(n,'endOnTrigger',1);conditionSet(n,'checkOnce',1);
  if(name==='float-rhs'){conditionSet(n,'conditionOneFloat',312);conditionScalar(nodes[312],'value',.6);conditionSet(n,'falseEvents',65);}
  if(name==='null-end-on-trigger')conditionSet(n,'checkOnce',0);
  if(name==='short-name'){const f=n.fields.find(f=>f.name==='debugName')!;f.value='条件地图';f.raw=Buffer.from('条件地图\0').toString('hex');}
  if(name.startsWith('nested-')||name==='shared-nested'||name==='both-nested-null-value'){
   const other=nodes[287];conditionSet(other,'value',874);conditionScalar(other,'conditionOneValue',.4);conditionSet(other,'conditionOneOperator',0);conditionSet(other,'trueEvents',nullId);conditionSet(other,'falseEvents',nullId);
   conditionSet(n,'conditionOneOnFloat',287);conditionSet(n,'notConditionOneOnFloat',name==='nested-invert-one'?1:name==='nested-invert-two'?2:0);
   if(name==='nested-second-or'||name==='nested-second-and'){conditionSet(n,'conditionOneOnFloat',nullId);conditionScalar(n,'conditionOneValue',.6);conditionSet(n,'conditionTwoOnFloat',287);conditionSet(n,'booleanOperator',name.endsWith('or')?2:1);}
   if(name==='shared-nested'||name==='both-nested-null-value'){conditionSet(n,'conditionTwoOnFloat',287);conditionSet(n,'booleanOperator',1);if(name==='both-nested-null-value')conditionSet(n,'value',nullId);}
   conditionSet(n,'trueEvents',65);
  }
  if(name==='unknown-boolean')conditionSet(n,'booleanOperator',0xffffffff);
  if(name==='event-handoff-cycle')conditionSet(n,'trueEvents',229);
  add(name,nodes,229);
 }
 for(const name of ['partition','input-output-alias','duplicate-output-alias','empty-no-input','clamp-negative','clamp-high']){
  const nodes=structuredClone(doc.nodes),split=nodes[720],g=nodes[1088].fields.find(f=>f.name==='data')!;
  const child=g.children![0],output=Number(child.value),third=nodes.find(n=>n.className==='Float'&&![312,874,output].includes(n.id))!.id;
  g.value=3;g.children=[output,874,third].map((id,i)=>({...structuredClone(child),id:child.id+'/'+i,value:id,raw:word(id)}));
  conditionScalar(nodes[312],'value',name==='clamp-negative'?-1:name==='clamp-high'?2:.6);
  if(name==='empty-no-input'){g.value=0;g.children=[];conditionSet(split,'input',nullId);}
  if(name==='input-output-alias'){g.children![0].value=312;g.children![0].raw=word(312);}
  if(name==='duplicate-output-alias'){g.children![1].value=g.children![0].value;g.children![1].raw=g.children![0].raw;}
  add(`split-${name}`,nodes,720);
 }
 return rows;
}
const nullId=0xffffffff;
