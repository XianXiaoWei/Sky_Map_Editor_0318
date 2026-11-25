import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { ObjectsDocument } from '../src/core/objects';
import { nestedFields } from '../src/core/model-material-index';
import { describeEnvironment } from '../src/core/environment-storage';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const stats=new Map<string,{className:string;instances:number;incomingReferences:number;outgoingReferences:number;levels:Set<string>}>(),levels:unknown[]=[];
let total=0;
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;
 const bytes=fs.readFileSync(file),nodes=new ObjectsDocument(bytes).nodes;total+=nodes.length;
 const get=(name:string)=>{let s=stats.get(name);if(!s){s={className:name,instances:0,incomingReferences:0,outgoingReferences:0,levels:new Set()};stats.set(name,s);}return s;};
 for(const node of nodes){const s=get(node.className);s.instances++;s.levels.add(level);for(const ref of nestedFields(node.fields).filter(f=>f.kind==='reference'&&f.value!==0xffffffff)){const target=nodes[Number(ref.value)];if(!target)throw new Error(`${level}/#${node.id}: invalid reference`);s.outgoingReferences++;get(target.className).incomingReferences++;}}
 const envs=nodes.filter(n=>n.className==='EnvNode').map(node=>{const i=describeEnvironment(node,nodes);return{id:node.id,savedEnabled:node.fields.some(f=>f.name==='enabled'),initialEnabled:i.registration?.state.enabled,defaultEnabled:i.defaultsApplied.find(d=>d.name==='enabled')?.text??null,duration:i.registration?.duration};});
 const defaults=nodes.filter(n=>n.className==='SetEnvDefault').map(n=>({id:n.id,savedAutoStart:n.fields.find(f=>f.name==='autoStart')?.value??null}));
 levels.push({level,sha256:crypto.createHash('sha256').update(bytes).digest('hex'),envNodes:envs,defaultEvents:defaults,noEnvNode:envs.length===0});
}
const ranked=[...stats.values()].sort((a,b)=>(b.incomingReferences*2+b.instances)-(a.incomingReferences*2+a.instances)).map((s,rank)=>{
 const file=path.join('docs/Objects类清单',s.className+'.json');let coverage:any;
 if(fs.existsSync(file))coverage=JSON.parse(fs.readFileSync(file,'utf8')).classProgress;
 return{rank:rank+1,...s,levels:[...s.levels],coreSubchainVerified:coverage?.coreSubchainVerified??false,completeOriginalClass:false,functionRole:coverage?.functionRole??null,evidence:fs.existsSync(file)?file:null};
});
const first=['EnvNode','SetEnvDefault','SetEnvHull','FogVolumeSphere','Wind','Marker','Clump','Rail','Float','Enable','IfEnabled','ResumeEnable','Delay','OnFloat','FloatAdd','FloatMult','FloatSplit','SetFloat','Parent','Timeline','TimelineNode'];
const prioritized=first.flatMap(name=>{const s=ranked.find(c=>c.className===name);return s?[s]:[];});
const report={dateUTC:new Date().toISOString(),passed:true,scope:'Read every original Objects file and nested references; rank frequent/shared class dependencies. Runtime completeness remains explicitly false: counts or old partial checkpoints do not prove startup, dispatch or game parity. Non-serialized infrastructure ObjectFactory/default caches/Barn order/ResourceManager/GameTime precedes class closure.',maps:levels.length,totalObjects:total,classes:ranked.length,initialFocus:prioritized,rankedClasses:ranked,environmentMaps:levels,completeOriginalGameRuntime:false};
fs.writeFileSync('docs/foundation-priority-audit.json',JSON.stringify(report,null,2)+'\n');
console.log(JSON.stringify({passed:true,maps:levels.length,objects:total,classes:ranked.length,top:ranked.slice(0,12).map(s=>({className:s.className,instances:s.instances,incoming:s.incomingReferences})),noEnvMaps:levels.filter((l:any)=>l.noEnvNode).map((l:any)=>l.level),activeDefaultMaps:levels.filter((l:any)=>l.defaultEvents.some((d:any)=>d.savedAutoStart===1)).map((l:any)=>l.level)}));
