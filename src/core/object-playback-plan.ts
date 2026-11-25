import type {Field,ObjectNode} from './objects';
import {describeEnvironment} from './environment-storage';
import {restoredEnvironmentEventClasses,isRestoredEnvironmentEvent} from './environment-event-types';
export const objectPlaybackClasses=['TransformObject','Enable','IfEnabled','Delay','FloatAdd','FloatMult','SetFloat','OnFloat','FloatSplit',...restoredEnvironmentEventClasses] as const;
export type ObjectPlaybackKind=typeof objectPlaybackClasses[number];
export const transformPreviewFields={time:104,staggeredDelay:108,dragSoundScale:112,reverse:116,transformPos:117,transformRot:118,transformScale:119,continuous:120,smooth:121,stepped:122,completeAtEnd:123,gotoCurrentTargetTransform:124,twoPhase:125,playDragSound:152} as const;
export const logicPreviewFields={SetEnvDefault:{},SetEnvHull:{},SetWind:{},SetRainParams:{},SetOceanRender:{},SetEmitterFlowRail:{},DropOcclusion:{},Enable:{enable:64,killEvents:65},IfEnabled:{triggerOnDisabled:64,checkOnce:80},Delay:{delay:56,staggered:60,waitForBeat:61,useFrames:62},FloatAdd:{amount:80,minClampedValue:84,maxClampedValue:88,useMinClampedValue:92,useMaxClampedValue:93,updateEveryFrame:94},FloatMult:{},SetFloat:{targetValue:56,time:60,snappiness:72},FloatSplit:{},OnFloat:{endOnTrigger:64,checkOnce:65,debug:88,conditionOneValue:120,conditionOneOperator:136,notConditionOneOnFloat:152,conditionTwoValue:156,conditionTwoOperator:168,notConditionTwoOnFloat:184,booleanOperator:188}} as const;
export const playbackRaw=(field:Field)=>Uint8Array.from(field.raw.match(/../g)?.map(v=>parseInt(v,16))??[]);
export const playbackField=(node:ObjectNode,name:string)=>node.fields.find(f=>f.name===name);
const reference=(node:ObjectNode,name:string)=>{const f=playbackField(node,name);if(f?.kind!=='reference')throw new Error(`${name} 引用未解析`);return Number(f.value);};
export interface ObjectPlaybackEventPlan {id:number;kind:ObjectPlaybackKind;objects:number[];targets:number[]|null;target:number|null;control:number|null;finish:number[];floats:Record<string,number|null>;conditions?:Record<string,number|null>;branches?:Record<string,number|null>;outputClump?:number;debugName?:string;}
export interface ObjectPlaybackCandidate extends ObjectPlaybackEventPlan {
 name:string;available:boolean;reason:string;events:number[];affectedObjects:number[];
 transformedObjects:number[];enabledObjects:number[];
 plans:ObjectPlaybackEventPlan[];clumps:{id:number;members:number[]}[];endpoints:number[];valueObjects:number[];
}
/** A finite prepared dependency graph. Events may cycle between frames; direct
 * Clump recursion is synchronous and must be complete before any scene writes. */
export function objectPlaybackCandidates(nodes:ObjectNode[],kinds:readonly ObjectPlaybackKind[]=objectPlaybackClasses):ObjectPlaybackCandidate[]{
 const lookup=new Map(nodes.map(n=>[n.id,n]));
 const fields=(node:ObjectNode,offsets:Record<string,number>)=>{
  for(const [name,offset] of Object.entries(offsets)){
   const enumWord=node.className==='OnFloat'&&name.endsWith('Operator');
   const f=playbackField(node,name),size=enumWord||node.className==='OnFloat'&&name.endsWith('Value')||node.className==='SetFloat'||node.className==='TransformObject'&&offset<116||node.className==='Delay'&&name==='delay'||node.className==='FloatAdd'&&offset<92?4:1;
   if(!f||playbackRaw(f).length!==size)throw new Error(`${name} 默认字段尚未恢复`);
   if(size===4&&!enumWord&&!Number.isFinite(new DataView(playbackRaw(f).buffer).getFloat32(0,true)))throw new Error(`${name} 不是有限数值`);
  }
 };
 const members=(id:number,allowNull=false):number[]=>{
  const node=lookup.get(id),data=node&&playbackField(node,'data');
  if(node?.className!=='Clump'||data?.kind!=='array'||data.children?.length!==Number(data.value))throw new Error('Clump 未解析');
  return data.children.map(f=>{const id=Number(f.value);if(f.kind!=='reference'||(id===0xffffffff?!allowNull:!lookup.has(id)))throw new Error('Clump 含无效引用');return id;});
 };
 const group=(node:ObjectNode,name:string,required=false,allowNull=false)=>{const id=reference(node,name);if(id===0xffffffff){if(required)throw new Error(`${name} Clump 为空`);return null;}return members(id,allowNull);};
 const plan=(node:ObjectNode):ObjectPlaybackEventPlan=>{
  const p:ObjectPlaybackEventPlan={id:node.id,kind:node.className as ObjectPlaybackKind,objects:[],targets:null,target:null,control:null,finish:[],floats:{}};
  if(node.className==='SetEnvDefault'||node.className==='SetEnvHull'){
   const info=describeEnvironment(node,nodes);if(info.groups.some(g=>!g.complete))throw new Error('环境参数默认值未恢复');
   if(node.className==='SetEnvHull'&&!info.region?.complete)throw new Error('环境范围未恢复');
  }else if(isRestoredEnvironmentEvent(node.className)){
   if(node.className==='DropOcclusion'){
    for(const id of group(node,'transforms',true)!){const target=lookup.get(id);if(!target||!['Marker','LevelMesh'].includes(target.className))throw new Error(`DropOcclusion ${target?.className??'未知对象'} 空间接口尚未接入`);}
    const intensity=reference(node,'intensityFloat');p.floats.intensityFloat=intensity===0xffffffff?null:intensity;
   }
   // The shared environment owner resolves weather defaults and dependencies.
   // This finite logic graph forwards triggers, without constructing a Delay
   // or interpreting emitter/region references as ordinary Enable groups.
  }else if(node.className==='TransformObject'){
   fields(node,transformPreviewFields);
   if(Number(playbackField(node,'playDragSound')!.value)!==0)throw new Error('拖动音效尚未接入地图运行');
   if(Number(playbackField(node,'stepped')!.value)!==0)throw new Error('stepped 变换尚未接入');
   if(reference(node,'timeline')!==0xffffffff)throw new Error('Timeline 调度尚未接入');
   p.objects=group(node,'objects',true)!;p.targets=group(node,'targets');p.finish=group(node,'finishEvents')??[];
   const target=reference(node,'target');p.target=target===0xffffffff?null:target;
   if(p.targets&&p.targets.length!==p.objects.length)throw new Error('目标与对象数量不一致');
   if(!p.targets&&p.target===null)throw new Error('目标引用为空');
   const control=reference(node,'progress01');
   if(control!==0xffffffff){const n=lookup.get(control),value=n&&playbackField(n,'value');if(n?.className!=='Float'||!value||playbackRaw(value).length!==4)throw new Error('progress01 Float 未解析');p.control=control;}
   if(new DataView(playbackRaw(playbackField(node,'staggeredDelay')!).buffer).getFloat32(0,true)<0)throw new Error('staggeredDelay 小于零');
  }else{
   fields(node,logicPreviewFields[node.className as keyof typeof logicPreviewFields]);
   if(node.className==='OnFloat'){
    if(Number(playbackField(node,'debug')!.value)!==0)throw new Error('OnFloat 调试输出尚未接入地图运行');
    const name=playbackField(node,'debugName');if(name?.kind!=='string'||typeof name.value!=='string')throw new Error('debugName 默认字段尚未恢复');
    if(new TextEncoder().encode(name.value).length>22)throw new Error('OnFloat 长字符串池尚未接入地图运行');p.debugName=name.value;
    p.conditions={};p.branches={};
    for(const name of ['conditionOneOnFloat','conditionTwoOnFloat']){const id=reference(node,name);p.conditions[name]=id===0xffffffff?null:id;}
    for(const name of ['value','conditionOneFloat','conditionTwoFloat']){const id=reference(node,name);p.floats[name]=id===0xffffffff?null:id;}
    if(p.floats.value===null&&Object.values(p.conditions).some(id=>id===null))throw new Error('value Float 为空');
    for(const name of ['trueEvents','falseEvents']){const id=reference(node,name);p.branches[name]=id===0xffffffff?null:id;}
   }else if(node.className==='FloatSplit'){
    p.objects=group(node,'outputs',true)!;p.outputClump=reference(node,'outputs');
    const input=reference(node,'input');if(input===0xffffffff&&p.objects.length)throw new Error('input Float 为空');p.floats.input=input===0xffffffff?null:input;
   }else if(node.className==='FloatAdd'||node.className==='FloatMult'||node.className==='SetFloat'){
    const names=node.className==='SetFloat'?['target']:node.className==='FloatAdd'?['target','amountFloat','output']:['a','b','output'];
    for(const name of names){const id=reference(node,name);if(id===0xffffffff){if(node.className==='FloatMult'||name==='target')throw new Error(`${name} Float 为空`);p.floats[name]=null;}else p.floats[name]=id;}
   }else if(node.className==='Delay'){
    if(Number(playbackField(node,'waitForBeat')!.value)!==0)throw new Error('音乐 beat 尚未接入地图运行');
    p.finish=group(node,'events',true)!;
   }else{
    p.objects=group(node,node.className==='IfEnabled'?'areTheseObjectsEnabled':'objects',true,node.className==='IfEnabled')!;
    if(node.className==='IfEnabled')p.finish=group(node,'events',true,true)!;
   }
  }
  return p;
 };
 return nodes.filter(n=>kinds.includes(n.className as ObjectPlaybackKind)).map(node=>{
  let c:ObjectPlaybackCandidate={id:node.id,kind:node.className as ObjectPlaybackKind,name:String(playbackField(node,'name')?.value??node.name),available:false,reason:'',objects:[],targets:null,target:null,control:null,finish:[],floats:{},events:[],affectedObjects:[],transformedObjects:[],enabledObjects:[],plans:[],clumps:[],endpoints:[],valueObjects:[]};
  try{
   const plans=new Map<number,ObjectPlaybackEventPlan>(),clumps=new Map<number,number[]>(),endpoints=new Set<number>(),transformed=new Set<number>(),enabled=new Set<number>(),values=new Set<number>();
   const value=(id:number)=>{const n=lookup.get(id),f=n&&playbackField(n,'value');if(n?.className!=='Float'||!f||playbackRaw(f).length!==4)throw new Error(`${n?.className??'未知对象'} Float 接口尚未接入`);if(!Number.isFinite(new DataView(playbackRaw(f).buffer).getFloat32(0,true)))throw new Error('Float value 不是有限数值');values.add(id);};
   const endpoint=(id:number,flags=false)=>{
    const n=lookup.get(id);if(!n||!['Marker','LevelMesh'].includes(n.className))throw new Error(`${n?.className??'未知对象'} 变换接口尚未接入`);
    const required=n.className==='LevelMesh'?{transform:64}:{pos:16,quat:16,scale:12};
    for(const [name,size] of Object.entries(required)){
     const f=playbackField(n,name);if(!f||playbackRaw(f).length<size)throw new Error(`${n.className}.${name} 默认值尚未恢复`);
     const v=new DataView(playbackRaw(f).buffer);for(let i=0;i<size;i+=4)if(!Number.isFinite(v.getFloat32(i,true)))throw new Error('对象矩阵含非有限数值');
    }
    if(flags){const f=playbackField(n,'enabled');if(!f||playbackRaw(f).length!==1)throw new Error(`${n.className}.enabled 默认值尚未恢复`);}
    endpoints.add(id);
   };
   const visitObject=(id:number,write:boolean,stack=new Set<number>()):void=>{
    if(id===0xffffffff)return;
    const n=lookup.get(id);if(!n)throw new Error('对象引用未解析');
    if(objectPlaybackClasses.includes(n.className as ObjectPlaybackKind)){visitEvent(id);return;}
    if(n.className==='Float'){value(id);return;} // No registered enabled method: original default getter/no-op setter.
    if(n.className==='Clump'){
     if(write&&stack.has(id))throw new Error('Clump 同步启用循环尚未接入');
     const data=clumps.get(id)??members(id,true);clumps.set(id,data);
     if(write||!stack.has(id)){const next=new Set(stack);next.add(id);data.forEach(id=>visitObject(id,write,next));}
     return;
    }
    if(['Marker','LevelMesh'].includes(n.className)){endpoint(id,true);if(write)enabled.add(id);return;}
    throw new Error(`完成事件 ${n.className} 尚未接入地图运行`);
   };
   const visitEvent=(id:number):void=>{
    if(plans.has(id))return;const n=lookup.get(id)!;
    if(!objectPlaybackClasses.includes(n?.className as ObjectPlaybackKind)){visitObject(id,true);return;}
    const p=plan(n);plans.set(id,p);if(plans.size>1280)throw new Error('变换接力超过 EventBarn 容量');
    if(p.kind==='OnFloat'){
     for(const id of Object.values(p.floats))if(id!==null)value(id);
     for(const id of Object.values(p.conditions!))if(id!==null){if(lookup.get(id)?.className!=='OnFloat')throw new Error('嵌套条件必须为 OnFloat');visitEvent(id);}
     for(const id of Object.values(p.branches!))if(id!==null)visitObject(id,true);
    }else if(isRestoredEnvironmentEvent(p.kind)){for(const id of Object.values(p.floats))if(id!==null)value(id);}
    else if(p.kind==='FloatSplit'){
     if(p.floats.input!==null)value(p.floats.input);p.objects.forEach(value);clumps.set(p.outputClump!,p.objects);
    }else if(p.kind==='FloatAdd'||p.kind==='FloatMult'||p.kind==='SetFloat'){for(const id of Object.values(p.floats))if(id!==null)value(id);}
    else if(p.kind==='TransformObject'){
     for(const id of new Set([...p.objects,...p.targets??[],...p.target===null?[]:[p.target]]))endpoint(id);
     p.objects.forEach(id=>transformed.add(id));p.finish.forEach(id=>visitObject(id,true));
    }else if(p.kind==='Enable')p.objects.forEach(id=>visitObject(id,true));
    else if(p.kind==='IfEnabled'){p.objects.forEach(id=>visitObject(id,false));p.finish.forEach(id=>visitObject(id,true));}
    else p.finish.forEach(id=>visitObject(id,true));
   };
   visitEvent(node.id);
   const evaluating=new Set<number>(),evaluated=new Set<number>();
   const conditionCycle=(id:number):void=>{if(evaluating.has(id))throw new Error('OnFloat 同步条件求值循环尚未接入');if(evaluated.has(id))return;evaluating.add(id);for(const other of Object.values(plans.get(id)?.conditions??{}))if(other!==null)conditionCycle(other);evaluating.delete(id);evaluated.add(id);};
   for(const id of plans.keys())conditionCycle(id);
   c={...c,...plans.get(node.id)!};c.events=[...plans.keys()].sort((a,b)=>a-b);c.plans=c.events.map(id=>plans.get(id)!);c.clumps=[...clumps].map(([id,members])=>({id,members}));c.endpoints=[...endpoints];c.transformedObjects=[...transformed];c.enabledObjects=[...enabled];c.affectedObjects=[...new Set([...transformed,...enabled])];c.valueObjects=[...values];c.available=true;
  }catch(error){c.reason=(error as Error).message;}
  return c;
 });
}
