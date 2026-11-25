import type {ObjectNode} from './objects';
import {describeEnvironment,convertEnvironmentStorage,readEnvironmentStorage} from './environment-storage';
import {EnvironmentRuntime,type EnvRuntimeNode} from './environment-runtime';
import {ENV_DEFAULT_EVENT_OFFSETS,ENV_HULL_EVENT_OFFSETS,updateOriginalSetEnvDefault,updateOriginalSetEnvHull,type EnvironmentEventServices} from './environment-event-runtime';
import {requestOriginalEventEnabled,startOriginalEvent,setOriginalEventEnabled,resumeOriginalEvent} from './event-start-runtime';
import {loadOriginalEventBarn,updateOriginalEventBarn,type OriginalEventBarn,type OriginalEventBarnServices} from './event-barn-runtime';
import groups from '../../docs/environment-runtime.json';
import type {EnvValue} from './environment';
import {numericFloatValue,numericFloatBits} from './object-numeric-runtime';
import {PreparedEnvironmentObjectState,type EnvironmentObjectEntry} from './environment-object-state';
import {enableOriginalSetRainParams,updateOriginalSetOceanRender,updateOriginalSetWind,updateOriginalRainParameters} from './weather-event-runtime';
import {getNativeMarkerLocalObb} from './marker-transform-runtime';
import {gameScaledDelta} from './material-dynamics';
import {stepEnvironmentGust,type GustState} from './environment-gust';
import {enableOriginalEmitterFlowRail,updateOriginalEmitterFlowRail} from './environment-leaf-runtime';
import {restoredEnvironmentEventClasses,restoredNatureEventClasses,isSharedRuntimeEvent,isContinuousEnvironmentEvent} from './environment-event-types';
import {enableOriginalBirdV2ParamSwap,enableOriginalBirdV2AiSwap,updateOriginalBirdV2AiSwap,enableOriginalSetBirdGuidesEnabled,enableOriginalSetDarkCreaturesNetworked} from './nature-event-runtime';
import {enableOriginalDetachFromBirdGuides,enableOriginalReleaseBirds,type BirdGuideDetachServices,type BirdReleaseServices} from './bird-guide-runtime';
import {enableOriginalSetFlame,updateOriginalSetFlame,updateOriginalOnFlame,updateOriginalSetFlameOccIntensity} from './flame-event-runtime';
import {enableOriginalOnBlaze,updateOriginalOnBlaze} from './blaze-runtime';
import {setNativeClumpEnabled} from './clump-runtime';
import {getOriginalFlameEnabled,extinguishOriginalFlame,type FlameSoundServices} from './flame-runtime';
import {loadOriginalDropOcclusion,unloadOriginalDropOcclusion,enableOriginalDropOcclusion,updateOriginalDropOcclusion,type DropOcclusionRecord} from './drop-occlusion-runtime';
import {CLOUD_DROP_BYTES,routeOriginalCloudDrop} from './cloud-drop-runtime';
import {isSceneEventClass} from './scene-event-construction';
import {enableOriginalOnRegion,updateOriginalOnRegion,originalRegionPointInObb,type OnRegionServices} from './on-region-runtime';
import {updateOriginalPlayAnimation,type PlayAnimationServices} from './play-animation-runtime';
import {dispatchOriginalDelayVirtual} from './delay-event-runtime';
import {dispatchOriginalLogicEventVirtual} from './logic-event-runtime';
import {NativeObjectFoundationFailure} from './object-foundation-runtime';
import {getOriginalLevelMeshLocalObb} from './level-mesh-runtime';
export {restoredEnvironmentEventClasses} from './environment-event-types';

export interface SharedSceneEventServices {
 avatarBarn:bigint;
 avatarBarnReady:OnRegionServices['avatarBarnReady'];
 activeAvatarCount:OnRegionServices['activeAvatarCount'];
 avatarAt:OnRegionServices['avatarAt'];
 avatarEnabled:OnRegionServices['avatarEnabled'];
 cameraPosition:OnRegionServices['cameraPosition'];
 initialPositionWBits:OnRegionServices['initialPositionWBits'];
 animation:Omit<PlayAnimationServices,'castLevelMesh'|'start'>;
 onBeat?:()=>boolean;
}

/** Original EventBarn and restored event bodies share the native storage
 * of the restored environment parent constructors. Trigger IDs, resource membership,
 * metadata and camera mode are editor services. Weather rendering is separate. */
export class PreparedEnvironmentEventOwner {
 readonly objects:PreparedEnvironmentObjectState;
 readonly barn:OriginalEventBarn;
 readonly registrations:{nodeId:number;group:string;kind:'default'|'hull'}[]=[];
 readonly registrationHandles:{pointer:bigint;nodeId:number;group:string}[]=[];
 private entries:Map<number,EnvironmentObjectEntry & {starts:number}>;
 private dispatch:OriginalEventBarnServices<undefined>;
 private predicate=0;
 private nextRegistration=0;
 private rain:bigint;
 private ocean:bigint;
 private forces:bigint;
 private clock:bigint;
 private gust:GustState={ambient:0,phase0:0,phase1:0,smoothedWind:[0,0,0]};
 private time=0;
 private frameDelta=gameScaledDelta(0,1);
 private debugScaleBits=numericFloatBits(1);
 private disposed=false;
 private pausedEvents=new Set<number>();
 private blocked:{id:number;kind:string;reason:string;starts:number;running:boolean;pending:boolean;available:boolean}[]=[];
 private occlusionRecords:(DropOcclusionRecord & {eventId:number})[]=[];
 private cloudDrops=new Uint8Array(CLOUD_DROP_BYTES);
 private occlusionWarnings:{eventId:number;radius:number;maxSize:number}[]=[];
 private avatarPosition=[0,0,0,1];
 private flameSound:FlameSoundServices|undefined;
 private blazeStatusReady:((id:number)=>boolean)|undefined;
 private birdGuideServices:(Omit<BirdGuideDetachServices,'start'> & {avatarOwner:bigint})|undefined;
 private birdReleaseServices:(Omit<BirdReleaseServices,'start'|'castCreature'|'setObjectEnabled'> & {avatarOwner:bigint;statisticsOwner:bigint})|undefined;
 private birdEventReason:(node:ObjectNode)=>string=()=>'';
 private game:bigint;
 private refreshNatureEvents:()=>void=()=>{};
 private sceneServices:SharedSceneEventServices|undefined;
 private sceneEventReason:(node:ObjectNode)=>string=()=>'';
 constructor(private runtime:EnvironmentRuntime,nodes:ObjectNode[],level=''){
  this.objects=new PreparedEnvironmentObjectState(nodes);
  const state=this.objects,m=state.runtimeMemory;
  const natureReason=(node:ObjectNode)=>{
   const entry=state.require(node.id),ref=(name:string)=>state.entries.get(Number(node.fields.find(f=>f.name===name)?.value??0xffffffff));
   if(node.className==='Critter_Shout')return 'Critter_Shout 原 CritterV2 发声、视觉和音频 owner 未接入';
   if(node.className==='AwakenDarkCreatures')return 'AwakenDarkCreatures 原玩家状态和联网权限服务未接入';
   if(node.className==='DetachFromBirdGuides'){
    const bird=ref('bird');if(bird?.node.className!=='BirdV2')return 'DetachFromBirdGuides 原 bird 引用未接入';
    if(m.bytes(bird.pointer+0x440n,1)[0]&&!this.birdGuideServices)return 'DetachFromBirdGuides 活跃引导需要真实 AvatarBarn 和玩家启用服务';
    return '';
   }
   if(node.className==='OnBlaze'){
    const target=ref('blaze');if(target?.node.className!=='Blaze')return 'OnBlaze 原 blaze 引用未接入';
    if(!this.blazeStatusReady?.(target.node.id))return 'OnBlaze 依赖 Blaze 装载后的原状态，资源 owner 尚未接入';
    if(m.bytes(target.pointer+0x98n,1)[0]&&!m.read64(target.pointer+0x110n))return 'OnBlaze 祖先蜡烛分支需要真实 Flame 资源';
    if(!canEnable(m.read64(entry.pointer+64n)))return 'OnBlaze 原 Meta.SetEnabled 下游生命周期尚未接入';
    return '';
   }
   if(node.className==='OnFlame'){
    if(!this.flameSound)return 'OnFlame 原目标 Meta.SetEnabled / Event 链和 Flame/Candle 装载状态未接入';
    const clump=ref('flames');if(clump?.node.className!=='Clump'||clump.pending.length)return 'OnFlame 原 flames Clump 或成员未接入';
    const targets=clump.node.fields.find(f=>f.name==='data')?.children?.map(f=>state.entries.get(Number(f.value)))??[];
    if(targets.some(t=>{if(!t)return true;if(t.node.className==='CandleObject')return !m.read64(t.pointer+0x90n);return t.node.className!=='Flame'||!m.bytes(t.pointer+0x13en,1)[0];}))return 'OnFlame Flame/Candle 资源尚未装载';
    if(!canEnable(m.read64(entry.pointer+64n)))return 'OnFlame 原 Meta.SetEnabled 目标生命周期尚未接入';
    return '';
   }
   if(node.className==='BirdV2ParamSwap'||node.className==='BirdV2AiSwap'){
    const target=ref('target'),params=ref('newParams');
    if(target?.node.className!=='BirdV2')return '原 BirdV2 target 未接入';
    if(params&&params.node.className!==(node.className==='BirdV2ParamSwap'?'BirdV2Params':'BirdV2AiParams'))return '原 BirdV2 参数类型不匹配';
    if(node.fields.some(f=>f.name==='newParams'&&f.value!==0xffffffff)&&!params)return '原 BirdV2 newParams 未接入';
    return '';
   }
   if(['SetBirdGuidesEnabled','ReleaseBirds','SetDarkCreaturesNetworked','SetFlame'].includes(node.className)){
    const name=['SetBirdGuidesEnabled','ReleaseBirds'].includes(node.className)?'birds':node.className==='SetFlame'?'flames':'creatures',clump=ref(name);
    if(clump?.node.className!=='Clump'||clump.pending.length)return `原 ${name} Clump 或成员未接入`;
    const targets=clump.node.fields.find(f=>f.name==='data')?.children?.map(f=>state.entries.get(Number(f.value)))??[];
    const expected=name==='birds'?'BirdV2':name==='flames'?'Flame':'DarkCreature';
    if(targets.some(t=>name==='flames'?t?.node.className!=='Flame'&&(t?.node.className!=='CandleObject'||!m.read64(t.pointer+0x90n)):t?.node.className!==expected))return name==='flames'?'SetFlame 依赖真实 Candle 渲染记录和 owner Flame；CandleBarn 装载未接入':`原 ${expected} Clump 类型转换未接入`;
    if(node.className==='ReleaseBirds'){
     if(targets.some(t=>!m.read64(t!.pointer+0x3a0n)))return 'ReleaseBirds 依赖各鸟自己的真实 Model 和动画 owner；尚未装载';
     if(targets.length&&!this.birdReleaseServices)return 'ReleaseBirds 原 AvatarBarn、动画淡出和统计服务未接入';
    }else if(name==='birds'&&targets.some(t=>!m.read64(t!.pointer+120n)))return '原 BirdV2 boidParams 未接入';
    if(name==='flames'){
     if(!this.flameSound){
      if(!m.bytes(entry.pointer+56n,1)[0]&&targets.length)return 'SetFlame 熄灭分支依赖原 Flame 音效服务；尚未接入';
      if([60n,72n].some(at=>{const n=numericFloatValue(m.read32(entry.pointer+at));return !Number.isFinite(n)||n<0;}))return 'SetFlame 原 duration/delay 需要非负有限输入后才能独立于熄灭音效运行';
     }else if([60n,72n].some(at=>!Number.isFinite(numericFloatValue(m.read32(entry.pointer+at)))))return 'SetFlame 原非有限时间算术服务尚未接入';
    }
   }
   return '';
  };
  this.birdEventReason=node=>['ReleaseBirds','DetachFromBirdGuides'].includes(node.className)?natureReason(node):'';
  const sceneReason=(node:ObjectNode,seen=new Set<number>()):string=>{
   if(seen.has(node.id))return '';seen.add(node.id);
   const e=state.require(node.id),ref=(name:string)=>state.entries.get(Number(node.fields.find(f=>f.name===name)?.value??0xffffffff));
   if(node.className==='MoveObjectAlongRail')return 'MoveObjectAlongRail 原逐帧移动、转向和轨道/Model owner 尚未接入';
   if(e.pending.some(p=>p.startsWith('引用')||p.startsWith('Clump 含')||p.startsWith('缺省')))return `${node.className} 原字段或引用未接入`;
   const members=(group:EnvironmentObjectEntry|undefined)=>group?.node.className==='Clump'&&!group.pending.length?(group.node.fields.find(f=>f.name==='data')?.children??[]).map(f=>state.entries.get(Number(f.value))):null;
   if(node.className==='PlayAnimation'){
    if(!this.sceneServices)return 'PlayAnimation 原动画序列和 Model owner 尚未接入';
    const targets=members(ref('target'));if(!targets||targets.some(t=>t?.node.className!=='LevelMesh'))return 'PlayAnimation 原 target Clump 或 LevelMesh 类型未接入';
    if(targets.some(t=>{const model=m.read64(t!.pointer+0x228n);return !model||!m.read64(model+104n);}))return 'PlayAnimation 目标 LevelMesh 的 Model/Animation 尚未装载';
    return '';
   }
   if(node.className==='OnRegion'){
    if(!this.sceneServices)return 'OnRegion 原 AvatarBarn 和区域事件 owner 尚未接入';
    const markers=members(ref('markers'));if(!markers||markers.some(t=>t?.node.className!=='Marker'))return 'OnRegion 原 markers Clump 未接入';
    const objects=ref('objects');if(objects){const targets=members(objects);if(!targets||targets.some(t=>!t||!['Marker','LevelMesh'].includes(t.node.className)||t.node.className==='LevelMesh'&&!m.read64(t.pointer+0x228n)))return 'OnRegion 原 objects 空间类型或 Model 未接入';}
   }
   if(node.className==='Delay'&&m.bytes(e.pointer+61n,1)[0]&&!this.sceneServices?.onBeat)return 'Delay 原节拍服务尚未接入';
   const group=ref(node.className==='Enable'?'objects':'events'),targets=members(group);
   if(!targets)return `${node.className} 原下游 Clump 未接入`;
   for(const t of targets){
    if(!t)return `${node.className} 原下游对象未接入`;
    if(t.node.className==='Clump')return `${node.className} 嵌套下游 Clump 尚未接入此事件图`;
    if(isSceneEventClass(t.node.className)){const reason=sceneReason(t.node,new Set(seen));if(reason)return reason;}
    else if((restoredNatureEventClasses as readonly string[]).includes(t.node.className)){const reason=natureReason(t.node);if(reason)return `${node.className} 下游 ${reason}`;}
    else if(!isSharedRuntimeEvent(t.node.className)&&t.node.className!=='Marker')return `${node.className} 下游 ${t.node.className} 启用生命周期尚未接入`;
   }
   return '';
  };
  const source=nodes.filter(n=>isSharedRuntimeEvent(n.className)||isSceneEventClass(n.className)).filter(node=>{
   if(isSceneEventClass(node.className)){const reason=sceneReason(node);if(reason)this.blocked.push({id:node.id,kind:node.className,reason,starts:0,running:false,pending:false,available:false});return !reason;}
   if((restoredNatureEventClasses as readonly string[]).includes(node.className)){
    const reason=natureReason(node);if(reason)this.blocked.push({id:node.id,kind:node.className,reason,starts:0,running:false,pending:false,available:false});return !reason;
   }
   if(node.className!=='DropOcclusion')return true;
   const e=state.require(node.id),clumpId=Number(node.fields.find(f=>f.name==='transforms')?.value??0xffffffff),clump=state.entries.get(clumpId);
   const unsupported=clump?.node.fields.find(f=>f.name==='data')?.children?.map(f=>state.entries.get(Number(f.value))).find(member=>member&&!['Marker','LevelMesh'].includes(member.node.className));
   const reason=!clump?'DropOcclusion transforms Clump 未接入':clump.pending.length?'DropOcclusion Clump 含未恢复的空间对象':unsupported?`DropOcclusion 空间对象 ${unsupported.node.className} 的原启用/更新生命周期未接入`:e.pending.some(s=>s.startsWith('引用'))?'DropOcclusion 原引用未接入':'';
   if(reason)this.blocked.push({id:node.id,kind:node.className,reason,starts:0,running:false,pending:false,available:false});return !reason;
  });
  this.sceneEventReason=node=>isSceneEventClass(node.className)?sceneReason(node):'';
  if(source.length>1280)throw new Error('环境事件超出原 EventBarn 容量');
  const game=state.allocate(0x4000),barnPointer=state.allocate(0x105100),resourceHandle=state.allocate(24),resource=state.allocate(0x400),table=state.allocate(Math.max(8,source.length*8)),avatar=state.allocate(32),physics=state.allocate(32);
  this.game=game;
  this.rain=state.allocate(96);this.ocean=state.allocate(0x13a0);this.forces=state.allocate(96);this.clock=state.allocate(48);const flameOwner=state.allocate(32);
  this.barn={bytes:m.bytes(barnPointer,0x105100),nodes:Array.from({length:1280},()=>({event:null,next:null})),freeHead:null};
  m.write64(game+0x3e0n,this.rain);m.write64(game+0x3d8n,this.ocean);m.write64(game+0x2c8n,this.forces);m.write64(avatar+24n,physics);
  m.write64(game+0x160n,this.clock);m.write32(this.clock+32n,numericFloatBits(1));m.write64(game+0x418n,flameOwner);
  m.write64(resourceHandle+16n,resource);m.write64(resource+0x3a8n,table);m.write32(resource+0x3b8n,source.length);
  // Exact Rain.Load strstr(levelName,"Rain") predicate, with zero allocation
  // and the parameter reset. Full Rain.Load/drop resources remain separate.
  m.write8(this.rain+56n,Number(level.includes('Rain')));
  this.entries=new Map(source.map((node,i)=>{
   const entry=state.require(node.id),event=entry.bytes,v=new DataView(event.buffer,event.byteOffset,event.byteLength);
   event[12]=Number(node.fields.find(f=>f.name==='autoStart')?.value??0);event[32]=0;v.setBigUint64(24,barnPointer,true);v.setUint32(40,1,true);v.setUint16(44,node.id,true);
   m.write64(table+BigInt(i)*8n,entry.pointer+8n);this.barn.nodes[i].event=event;
   return [node.id,{...entry,starts:0}];
  }));
  const byBytes=new Map([...this.entries.values()].map(e=>[e.bytes,e]));
  const byPointer=new Map([...state.entries.values()].map(e=>[e.pointer.toString(),e]));
  const byObject=new Map([...state.entries.values()].map(e=>[state.objectPointer(e.node.id).toString(),e]));
  const unexpected=()=>{throw new Error('环境事件尚未接入该原生命周期服务');};
  const start=(pointer:bigint)=>{const entry=byPointer.get(pointer.toString());if(!entry)unexpected();startOriginalEvent(entry!.bytes,this.barn.bytes,unexpected);};
  const canEnable=(pointer:bigint,seen=new Set<bigint>()):boolean=>{
   if(!pointer)return true;const e=byObject.get(pointer.toString());if(!e||seen.has(pointer))return false;
   if(e.node.className==='Clump'){if(e.pending.length)return false;seen.add(pointer);const n=m.read32(e.pointer+16n),table=m.read64(e.pointer+8n);for(let i=0;i<n;i++)if(!canEnable(m.read64(table+BigInt(i)*8n),new Set(seen)))return false;return true;}
   return this.entries.has(e.node.id)||e.node.className==='CandleObject'&&!!m.read64(e.pointer+0x90n)||e.node.className==='Blaze'&&!!this.blazeStatusReady?.(e.node.id)||['Marker','Flame','BirdV2','BirdFlock','Crab'].includes(e.node.className);
  };
  const setObjectEnabled=(pointer:bigint,value:number)=>{
   if(!pointer)return;const e=byObject.get(pointer.toString());if(!e||!canEnable(pointer))throw new Error('原 Meta.SetEnabled 目标生命周期尚未接入');
   if(e.node.className==='Clump')setNativeClumpEnabled(state.memory,e.pointer,!!value,(p,on)=>setObjectEnabled(p,Number(on)));
   else if(!this.setControllerEnabled(e.node.id,!!value))unexpected();
  };
  const creatureServices={castCreature:(pointer:bigint,kind:'BirdV2'|'DarkCreature')=>{const e=byObject.get(pointer.toString());return e?.node.className===kind?e.pointer:0n;},setObjectEnabled,start};
  const flameServices={castObject:(p:bigint)=>byObject.has(p.toString())?p:0n,castFlame:(p:bigint)=>{const e=byObject.get(p.toString());return e?.node.className==='Flame'?e.pointer:0n;},castCandle:(p:bigint)=>{const e=byObject.get(p.toString());return e?.node.className==='CandleObject'&&m.read64(e.pointer+0x90n)?e.pointer:0n;},getFlameEnabled:(p:bigint)=>getOriginalFlameEnabled(m,p),setObjectEnabled,start,extinguish:(p:bigint,sound:number)=>extinguishOriginalFlame(m,p,sound,this.flameSound)};
  const windServices={avatar:()=>{m.bytes(physics+16n,16).set(new Uint8Array(Float32Array.from(this.avatarPosition).buffer));return avatar;},
   castRegion:(pointer:bigint)=>{const entry=byPointer.get((pointer-8n).toString());return entry?.node.className==='Marker'?entry.pointer:0n;},
   getRegionTransform:(pointer:bigint)=>state.transform(byPointer.get(pointer.toString())!.node.id),getRegionObb:()=>getNativeMarkerLocalObb(),start};
  const emitterServices={castEmitter:(pointer:bigint)=>{const e=byPointer.get(pointer.toString());return e?.node.className==='Emitter'?pointer:0n;},start};
  const resolveClump=(pointer:bigint)=>{
   const e=byPointer.get(pointer.toString());if(e?.node.className!=='Clump')throw new Error('原场景事件 Clump 未接通');
   return {count:()=>m.read32(pointer+16n),member:(i:number)=>{if(i>=m.read32(pointer+16n))throw new NativeObjectFoundationFailure('./Clump.h',54,3,'idx < size');return m.read64(m.read64(pointer+8n)+BigInt(i*8));}};
  };
  const regionServices:OnRegionServices={
   avatarBarnReady:p=>this.sceneServices!.avatarBarnReady(p),activeAvatarCount:(p,local)=>this.sceneServices!.activeAvatarCount(p,local),
   avatarAt:(p,i)=>this.sceneServices!.avatarAt(p,i),avatarEnabled:p=>this.sceneServices!.avatarEnabled(p),cameraPosition:p=>this.sceneServices!.cameraPosition(p),initialPositionWBits:()=>this.sceneServices!.initialPositionWBits(),
   metadata:kind=>BigInt(['Object','Marker','LevelMesh'].indexOf(kind)+1),
   cast:(kind,object)=>{const e=byObject.get(object.toString());return {object,cast:e?kind===1n?object:kind===2n&&e.node.className==='Marker'||kind===3n&&e.node.className==='LevelMesh'?e.pointer:0n:0n};},
   transform:p=>state.transform(byPointer.get(p.toString())!.node.id),localObb:p=>byPointer.get(p.toString())?.node.className==='Marker'?getNativeMarkerLocalObb():getOriginalLevelMeshLocalObb(state.memory,p),
   pointInObb:(point,box,tolerance)=>Number(originalRegionPointInObb(point,box,tolerance)),setClumpEnabled:setObjectEnabled,start,
  };
  const spatial=new Map([...state.entries.values()].filter(e=>['Marker','LevelMesh'].includes(e.node.className)).map(e=>[(e.pointer+8n).toString(),e]));
  const dropServices=(id:number)=>({castObject:(pointer:bigint)=>spatial.has(pointer.toString())?pointer:0n,
   getTransform:(pointer:bigint)=>state.transform(spatial.get(pointer.toString())!.node.id),getEnabled:(pointer:bigint)=>state.enabled(spatial.get(pointer.toString())!.node.id),delta:()=>this.frameDelta,
   math:(op:'logf'|'expf',input:number)=>numericFloatBits(Math.fround(op==='logf'?Math.log(numericFloatValue(input)):Math.exp(numericFloatValue(input)))),
   oversized:(radius:number,maxSize:number)=>{this.occlusionWarnings.push({eventId:id,radius,maxSize});},emit:(record:DropOcclusionRecord)=>{this.occlusionRecords.push({...record,eventId:id});}});
  this.dispatch={barnFor:()=>this.barn.bytes,logNullBarn:unexpected,scratchHeap:()=>null,allocateScratch:()=>[],free:()=>{},eventHeap:unexpected,loadHeapUsed:()=>0,
   virtual:(slot,event)=>{
    const entry=byBytes.get(event)!;
    if(isSceneEventClass(entry.node.className)){
     const kind=entry.node.className;
     if(slot===0x30)entry.starts++;
     if(kind==='OnRegion'){if(slot===0x30)enableOriginalOnRegion(m,entry.pointer);else if(slot===0x48&&!this.pausedEvents.has(entry.node.id))updateOriginalOnRegion(m,entry.pointer,game,regionServices);}
     else if(kind==='PlayAnimation'){if(slot===0x48){if(!this.sceneServices)unexpected();updateOriginalPlayAnimation(m,entry.pointer,{...this.sceneServices!.animation,castLevelMesh:p=>{const e=byObject.get(p.toString());return e?.node.className==='LevelMesh'?e.pointer:0n;},start});}}
     else if(kind==='Delay')dispatchOriginalDelayVirtual(slot,event,{frame:()=>this.frameDelta,onBeat:()=>this.sceneServices?.onBeat?.()??unexpected(),resolveClump,castObject:p=>typeof p==='bigint'&&byObject.has(p.toString())?p:0n,setEnabled:(p,on)=>setObjectEnabled(p,Number(on)),startEvent:()=>start(entry.pointer)});
     else dispatchOriginalLogicEventVirtual('Enable',slot,event,{resolveClump,castObject:p=>typeof p==='bigint'&&byObject.has(p.toString())?p:0n,castEvent:p=>{const e=byObject.get(p.toString());return e&&this.entries.has(e.node.id)?e.bytes:null;},setEnabled:(p,on)=>setObjectEnabled(p,Number(on)),getEnabled:p=>{const e=byObject.get(p.toString())!;return this.entries.has(e.node.id)?!!e.bytes[35]:state.enabled(e.node.id);},resumeEvent:target=>resumeOriginalEvent(target,()=>startOriginalEvent(target,this.barn.bytes,unexpected)),startEvent:()=>start(entry.pointer)});
     return;
    }
    if((restoredNatureEventClasses as readonly string[]).includes(entry.node.className)){
     const name=entry.node.className;
     if(slot===0x30){
      if(name==='BirdV2ParamSwap'){
       const params=m.read64(entry.pointer+56n),bird=m.read64(entry.pointer+64n),onAttach=params?m.read64(params+72n):0n;
       if(params&&m.bytes(bird+0x440n,1)[0]&&!canEnable(onAttach))throw new Error('BirdV2ParamSwap 活跃引导依赖的 onAttach 生命周期尚未接入');
       enableOriginalBirdV2ParamSwap(m,entry.pointer,creatureServices);
      }else if(name==='BirdV2AiSwap')enableOriginalBirdV2AiSwap(m,entry.pointer);
      else if(name==='SetBirdGuidesEnabled')enableOriginalSetBirdGuidesEnabled(m,entry.pointer,creatureServices);
      else if(name==='DetachFromBirdGuides'){
       const reason=this.birdEventReason(entry.node);if(reason)throw new Error(reason);
       enableOriginalDetachFromBirdGuides(m,entry.pointer,game,{avatarEnabled:this.birdGuideServices?.avatarEnabled??unexpected,start});
      }else if(name==='ReleaseBirds'){
       const reason=this.birdEventReason(entry.node);if(reason)throw new Error(reason);
       const release=this.birdReleaseServices;
       enableOriginalReleaseBirds(m,entry.pointer,game,{...creatureServices,fadeSequence:release?.fadeSequence??unexpected,requireAvatar:release?.requireAvatar??unexpected,birdPosition:release?.birdPosition??unexpected,getStatistic:release?.getStatistic??unexpected,setStatistic:release?.setStatistic??unexpected,arithmetic:release?.arithmetic});
      }
      else if(name==='SetDarkCreaturesNetworked')enableOriginalSetDarkCreaturesNetworked(m,entry.pointer,creatureServices);
      else if(name==='SetFlame')enableOriginalSetFlame(m,entry.pointer);
      else if(name==='OnBlaze')enableOriginalOnBlaze(m,entry.pointer);
      entry.starts++;
     }else if(slot===0x48&&!this.pausedEvents.has(entry.node.id)){
      if(name==='BirdV2AiSwap')updateOriginalBirdV2AiSwap(m,entry.pointer,game,this.debugScaleBits,creatureServices);
      else if(name==='SetFlame')updateOriginalSetFlame(m,entry.pointer,game,this.debugScaleBits,flameServices);
      else if(name==='OnFlame')updateOriginalOnFlame(m,entry.pointer,flameServices);
      else if(name==='OnBlaze')updateOriginalOnBlaze(m,entry.pointer,{setObjectEnabled,start});
      else if(name==='SetFlameOccIntensity')updateOriginalSetFlameOccIntensity(m,entry.pointer,game,start);
     }
     return;
    }
    if(entry.node.className==='DropOcclusion'){
     if(slot===0x10)loadOriginalDropOcclusion(m,entry.pointer,0n,(_heap,size)=>state.allocate(size));
     else if(slot===0x18)unloadOriginalDropOcclusion(m,entry.pointer,0n,()=>{});
     else if(slot===0x30){entry.starts++;enableOriginalDropOcclusion(m,entry.pointer,dropServices(entry.node.id));}
     else if(slot===0x48&&!this.pausedEvents.has(entry.node.id))updateOriginalDropOcclusion(m,entry.pointer,dropServices(entry.node.id));
     return;
    }
    if(slot===0x30){entry.starts++;if(entry.node.className==='SetRainParams')enableOriginalSetRainParams(m,entry.pointer,game,start);else if(entry.node.className==='SetEmitterFlowRail')enableOriginalEmitterFlowRail(m,entry.pointer,emitterServices);return;}
    if([0x10,0x38,0x40].includes(slot))return;
    if(slot!==0x48)unexpected();
    if(this.pausedEvents.has(entry.node.id))return;
    if(entry.node.className==='SetWind'){updateOriginalSetWind(m,entry.pointer,game,windServices);return;}
    if(entry.node.className==='SetRainParams')return;
    if(entry.node.className==='SetOceanRender'){updateOriginalSetOceanRender(m,entry.pointer,game,start);return;}
    if(entry.node.className==='SetEmitterFlowRail'){updateOriginalEmitterFlowRail(m,entry.pointer,emitterServices);return;}
    const info=describeEnvironment(entry.node,nodes),kind=entry.node.className as 'SetEnvDefault'|'SetEnvHull';
    let hullValues:Record<string,Record<string,EnvValue>>={};
    const readGroup=(value:bigint,offsets:readonly number[])=>{
     const index=offsets.indexOf(Number(value-entry.pointer)),spec=groups.groups.find(g=>g.nodeRegistrationIndex===index)!;
     const raw=m.bytes(value,Math.max(...spec.fields.map(field=>field.nativeOffset+field.bytes))),v=new DataView(raw.buffer,raw.byteOffset,raw.byteLength);
     return {name:spec.className,values:Object.fromEntries(spec.fields.map(field=>[field.name,field.tag===11?v.getUint8(field.nativeOffset):field.bytes===16?Array.from({length:4},(_,i)=>v.getFloat32(field.nativeOffset+i*4,true)):v.getFloat32(field.nativeOffset,true)])) as Record<string,EnvValue>};
    };
    const s:EnvironmentEventServices={createRef:()=>({handle:0n}),levelObjectsType:()=>resource,lookup:()=>resource,observe:(_r,ref)=>{ref.handle=resourceHandle;},destroyRef:()=>{},cameraPredicate:()=>this.predicate,
     convert:kind=>{const prepared=new Uint8Array(readEnvironmentStorage(entry.node).storage.length);prepared.set(entry.bytes.subarray(0,prepared.length));entry.bytes.set(convertEnvironmentStorage(kind,prepared).subarray(0,entry.bytes.length));},
     registerDefault:(_e,value)=>{const group=readGroup(value,ENV_DEFAULT_EVENT_OFFSETS);this.runtime.registerDefault(group.name,group.values);this.registrations.push({nodeId:entry.node.id,group:group.name,kind:'default'});},
     registerClump:(_e,value,clump,falloffBits,layer,fadeInBits,fadeOutBits,durationBits)=>{
      const group=readGroup(value,ENV_HULL_EVENT_OFFSETS);hullValues[group.name]=group.values;this.registrations.push({nodeId:entry.node.id,group:group.name,kind:'hull'});
      if(Number(value-entry.pointer)===ENV_HULL_EVENT_OFFSETS.at(-1)){
       if(!info.region?.complete||!info.registration)throw new Error('环境事件的范围依赖未恢复');
       const count=m.read32(clump+16n),table=m.read64(clump+8n);
       const markers=Array.from({length:count},(_,i)=>{
        const pointer=m.read64(table+BigInt(i)*8n)-8n,marker=byPointer.get(pointer.toString());if(marker?.node.className!=='Marker')throw new Error('环境 Clump owner 未接通');
        const raw=m.bytes(pointer,80),v=new DataView(raw.buffer,raw.byteOffset,raw.byteLength),vector=(at:number)=>Array.from({length:4},(_,i)=>v.getFloat32(at+i*4,true));
        return {id:marker.node.id,position:vector(16),quaternion:vector(32),scale:vector(48),enabled:!!raw[64]};
       });
       const node:EnvRuntimeNode={id:entry.node.id,layer,values:hullValues,timing:{fadeIn:numericFloatValue(fadeInBits),fadeOut:numericFloatValue(fadeOutBits),duration:numericFloatValue(durationBits)},markers,falloff:numericFloatValue(falloffBits)};this.runtime.registerNode(node);
      }
      const pointer=0x4e0000000n+BigInt(this.nextRegistration++)*16n;this.registrationHandles.push({pointer,nodeId:entry.node.id,group:group.name});return pointer;
     },start};
    if(kind==='SetEnvDefault')updateOriginalSetEnvDefault(m,entry.pointer,game,s);else updateOriginalSetEnvHull(m,entry.pointer,game,s);
   }};
  loadOriginalEventBarn(this.barn,undefined,this.dispatch);
  // Resource owners attach after the scene's EventBarn is created. Register
  // only newly ready events, retaining every existing node/timer/trigger state.
  this.refreshNatureEvents=()=>{
   let changed=true;while(changed){changed=false;
    for(const blocked of this.blocked.slice()){
     if(!isSceneEventClass(blocked.kind)&&!(restoredNatureEventClasses as readonly string[]).includes(blocked.kind))continue;
     const entry=state.require(blocked.id),reason=isSceneEventClass(blocked.kind)?sceneReason(entry.node):natureReason(entry.node);if(reason){blocked.reason=reason;continue;}
     const slot=this.barn.nodes.find(n=>!n.event);if(!slot)throw new Error('环境事件超出原 EventBarn 容量');
     const event=entry.bytes,v=new DataView(event.buffer,event.byteOffset,event.byteLength);event[12]=Number(entry.node.fields.find(f=>f.name==='autoStart')?.value??0);v.setBigUint64(24,barnPointer,true);v.setUint32(40,1,true);v.setUint16(44,entry.node.id,true);
     const active={...entry,starts:0};this.entries.set(entry.node.id,active);byBytes.set(event,active);slot.event=event;event[32]=1;this.dispatch.virtual(0x10,event,undefined);
     if(event[12])requestOriginalEventEnabled(event,this.barn.bytes,unexpected);
     this.blocked=this.blocked.filter(b=>b.id!==entry.node.id);changed=true;
    }
   }
  };
  for(const entry of this.entries.values())if((restoredNatureEventClasses as readonly string[]).includes(entry.node.className))entry.pending.splice(0,entry.pending.length,...entry.pending.filter(p=>!p.startsWith('原生物事件 Update')&&!p.startsWith('原火焰事件完整更新')),
   entry.node.className==='BirdV2ParamSwap'?'原 OnEnabled 和共享参数切换已接入；活跃引导 onAttach 按实际目标生命周期检查，AI/动画/绘制尚未接入':'原事件调用体和 EventBarn 已接入；下游生物 AI、Flame 装载/更新、音效和绘制尚未接入');
 }
 attachSceneEventServices(services:SharedSceneEventServices){
  if(this.disposed)throw new Error('环境运行状态已卸载');if(this.sceneServices)throw new Error('场景事件服务已经接入');
  if(this.birdGuideServices&&services.avatarBarn!==this.birdGuideServices.avatarOwner||this.birdReleaseServices&&services.avatarBarn!==this.birdReleaseServices.avatarOwner)throw new Error('场景事件和生物必须共享同一个 AvatarBarn');
  this.objects.runtimeMemory.bytes(services.avatarBarn,1);this.sceneServices=services;this.objects.runtimeMemory.write64(this.game+0x280n,services.avatarBarn);this.refreshNatureEvents();
 }
 attachBlazeStatusServices(isLoaded:(id:number)=>boolean){if(this.disposed)throw new Error('环境运行状态已卸载');if(this.blazeStatusReady)throw new Error('Blaze status services already attached');this.blazeStatusReady=isLoaded;this.refreshNatureEvents();}
 attachBirdGuideServices(services:NonNullable<typeof this.birdGuideServices>){
  if(this.disposed)throw new Error('环境运行状态已卸载');if(this.birdGuideServices)throw new Error('Bird guide services already attached');
  if(this.birdReleaseServices&&this.birdReleaseServices.avatarOwner!==services.avatarOwner)throw new Error('鸟引导与释放必须使用同一个 AvatarBarn');
  if(this.sceneServices&&this.sceneServices.avatarBarn!==services.avatarOwner)throw new Error('场景事件和生物必须共享同一个 AvatarBarn');
  this.objects.runtimeMemory.bytes(services.avatarOwner+0x20n,16*0x2230);this.birdGuideServices=services;this.objects.runtimeMemory.write64(this.game+0x280n,services.avatarOwner);this.refreshNatureEvents();
 }
 attachBirdReleaseServices(services:NonNullable<typeof this.birdReleaseServices>){
  if(this.disposed)throw new Error('环境运行状态已卸载');if(this.birdReleaseServices)throw new Error('Bird release services already attached');
  if(this.birdGuideServices&&this.birdGuideServices.avatarOwner!==services.avatarOwner)throw new Error('鸟引导与释放必须使用同一个 AvatarBarn');
  if(this.sceneServices&&this.sceneServices.avatarBarn!==services.avatarOwner)throw new Error('场景事件和生物必须共享同一个 AvatarBarn');
  this.objects.runtimeMemory.bytes(services.avatarOwner,1);this.objects.runtimeMemory.bytes(services.statisticsOwner,1);this.birdReleaseServices=services;this.objects.runtimeMemory.write64(this.game+0x280n,services.avatarOwner);this.objects.runtimeMemory.write64(this.game+0x240n,services.statisticsOwner);this.refreshNatureEvents();
 }
 attachFlameServices(sound:FlameSoundServices){if(this.disposed)throw new Error('环境运行状态已卸载');if(this.flameSound)throw new Error('Flame sound services already attached');this.flameSound=sound;this.refreshNatureEvents();}
 detachFlameServices(sound:FlameSoundServices){if(this.disposed)throw new Error('环境运行状态已卸载');if(this.flameSound!==sound)throw new Error('Flame sound services owner differs');this.flameSound=undefined;this.refreshNatureEvents();}
 setControllerEnabled(id:number,enabled:boolean){const event=this.entries.get(id);if(event){setOriginalEventEnabled(event.bytes,enabled,this.barn.bytes,()=>{});return true;}return this.objects.setEnabled(id,enabled);}
 setControllerTransform(id:number,matrix:Uint8Array){return this.objects.setTransform(id,matrix);}
 setAvatarPosition(position:number[]){if(position.length!==3||!position.every(Number.isFinite))throw new Error('环境采样位置无效');this.avatarPosition=[...position,1];}
 private syncControllers(){for(const node of this.runtime.nodes){if(!node.markers&&this.objects.entries.has(node.id))this.objects.setEnabled(node.id,!!node.enabled);for(const marker of node.markers??[])this.objects.setEnabled(marker.id,marker.enabled);}}
 tick(){if(this.disposed)throw new Error('环境运行状态已卸载');this.occlusionRecords=this.occlusionRecords.filter(r=>this.pausedEvents.has(r.eventId)&&this.entries.get(r.eventId)?.bytes[35]);this.syncControllers();updateOriginalEventBarn(this.barn,undefined,this.dispatch);this.cloudDrops.fill(0,0x6010,0x6014);for(const r of this.occlusionRecords)routeOriginalCloudDrop(this.cloudDrops,r.type,r.tint,r.position,r.radius,r.intensity,r.sharpness);}
 setEventPaused(id:number,paused:boolean){const e=this.entries.get(id);if(!e||!isContinuousEnvironmentEvent(e.node))return false;if(paused)this.pausedEvents.add(id);else this.pausedEvents.delete(id);return true;}
 advance(delta:number,timeScale=1,debugScale=1){
  const m=this.objects.runtimeMemory,scaled=gameScaledDelta(delta,timeScale,debugScale);this.frameDelta=scaled;this.debugScaleBits=numericFloatBits(debugScale);m.write32(this.clock+20n,numericFloatBits(delta));m.write32(this.clock+32n,numericFloatBits(timeScale));this.time=Math.fround(this.time+scaled);this.tick();
  const raw=m.bytes(this.forces+16n,16),v=new DataView(raw.buffer,raw.byteOffset,16);
  const overrideWind=m.bytes(this.forces+80n,1)[0]?Array.from({length:3},(_,i)=>v.getFloat32(i*4,true)):undefined;
  this.gust=stepEnvironmentGust(this.gust,{time:this.time,scaledDelta:scaled,ambientTarget:0,boundaryForce:[0,0,0],overrideWind});
  raw.fill(0);m.write8(this.forces+80n,0);
  updateOriginalRainParameters(m,this.rain,this.clock,0n,numericFloatBits(debugScale),{existingEmitter:()=>1n,avatar:()=>0n,sinf:bits=>numericFloatBits(Math.sin(numericFloatValue(bits)))});
 }
 globalWind(){return this.gust.smoothedWind.slice();}
 dispose(releaseOwners?:()=>void){if(this.disposed)return;for(const event of this.entries.values())setOriginalEventEnabled(event.bytes,false,this.barn.bytes,()=>{});this.tick();for(const event of this.entries.values())if(event.node.className==='DropOcclusion'&&event.bytes[32])this.dispatch.virtual(0x18,event.bytes,undefined);releaseOwners?.();this.objects.dispose();this.occlusionRecords=[];this.cloudDrops.fill(0,0x6010,0x6014);this.disposed=true;}
 trigger(id:number,predicate=0){const e=this.entries.get(id);if(!e)throw new Error(this.blocked.find(e=>e.id===id)?.reason??'此环境事件的原更新尚未接入');const reason=this.birdEventReason(e.node)||this.sceneEventReason(e.node);if(reason)throw new Error(reason);if(!Number.isInteger(predicate)||predicate<0||predicate>255)throw new Error('原摄像机判断必须是一个字节');this.predicate=predicate;requestOriginalEventEnabled(e.bytes,this.barn.bytes,()=>{});this.tick();}
 weatherInfo(){const m=this.objects.memory,read=(offset:number)=>numericFloatValue(m.read32(this.rain+BigInt(offset)));return {time:this.time,rain:{enabled:!!m.read8(this.rain+56n),intensity:read(12),fallRate:read(20),baseIntensity:read(60),phase:read(64),amount:read(68),frequency:read(72),transition:read(88),slopes:[read(76),read(80),read(84)],scope:'Original parameter update with prepared emitter/Avatar and JS sinf; rain geometry/collision/audio remain pending'},oceanRender:!!m.read8(this.ocean+0x1390n),globalWind:this.globalWind()};}
 occlusionInfo(){return {cloudDrops:new DataView(this.cloudDrops.buffer).getUint32(0x6010,true),records:this.occlusionRecords.map(r=>({...r,position:Array.from(new Float32Array(r.position.buffer,r.position.byteOffset,4)),tint:Array.from(new Float32Array(r.tint.buffer,r.tint.byteOffset,4))})),warnings:this.occlusionWarnings.slice(),states:[...this.entries.values()].filter(e=>e.node.className==='DropOcclusion').map(e=>{const m=this.objects.memory,p=m.read64(e.pointer+120n),count=m.read32(m.read64(e.pointer+56n)+16n);return {id:e.node.id,loaded:!!p,alpha:p?Array.from({length:count},(_,i)=>numericFloatValue(m.read32(p+BigInt(i*4)))):[]};}),scope:'Original DropOcclusion Load/Unload/OnEnabled/Update; shared native spatial and Float bytes. JS logf/expf, prepared allocation and oversize log adapter; downstream drop rasterization remains pending'};}
 natureInfo(){
  const m=this.objects.runtimeMemory,ids=new Map([...this.objects.entries.values()].map(e=>[e.pointer,e.node.id]));
  return {birds:[...this.objects.entries.values()].filter(e=>e.node.className==='BirdV2').map(e=>({id:e.node.id,boidParams:ids.get(m.read64(e.pointer+120n))??null,aiParams:ids.get(m.read64(e.pointer+128n))??null,guideActive:!!m.bytes(e.pointer+0x440n,1)[0]})),
   birdParameters:[...this.objects.entries.values()].filter(e=>e.node.className==='BirdV2Params').map(e=>({id:e.node.id,guidesEnabled:!!m.bytes(e.pointer+42n,1)[0]})),
   darkCreatures:[...this.objects.entries.values()].filter(e=>e.node.className==='DarkCreature').map(e=>({id:e.node.id,networked:!!m.bytes(e.pointer+0x2dcn,1)[0],awakenRequested:!!m.bytes(e.pointer+0x2c3n,1)[0]})),
   flames:[...this.objects.entries.values()].filter(e=>e.node.className==='Flame').map(e=>({id:e.node.id,loaded:!!m.bytes(e.pointer+0x13en,1)[0],light:numericFloatValue(m.read32(e.pointer+0x114n)),lightRadius:numericFloatValue(m.read32(e.pointer+0x118n)),enabled:!!m.bytes(e.pointer+180n,1)[0],lit:!!m.bytes(e.pointer+182n,1)[0],intensity:numericFloatValue(m.read32(e.pointer+0x110n)),consuming:!!m.bytes(e.pointer+0x138n,1)[0]})),
   blazes:[...this.objects.entries.values()].filter(e=>e.node.className==='Blaze').map(e=>({id:e.node.id,allocated:!!m.bytes(e.pointer+0xa1n,1)[0],statusReady:!!this.blazeStatusReady?.(e.node.id),active:!!m.bytes(e.pointer+0x56n,1)[0],enabled:!!m.bytes(e.pointer+0x54n,1)[0],ancestorCandle:!!m.bytes(e.pointer+0x98n,1)[0]})),
   timers:[...this.entries.values()].filter(e=>['SetFlame','BirdV2AiSwap'].includes(e.node.className)).map(e=>({id:e.node.id,elapsed:numericFloatValue(m.read32(e.pointer+76n))})),
   scope:'Shared native creature parameters/private flags and live Flame event state. Resource owners may initialize Flame/Candle records and restore the verified motion/light prefix; unloaded private bytes remain prepared zeros. Full creature AI/animation and Flame interaction/billboard rendering remain pending'};
 }
 info(){return [...[...this.entries].map(([id,e])=>{const reason=this.birdEventReason(e.node)||this.sceneEventReason(e.node);return {id,kind:e.node.className,starts:e.starts,running:!!e.bytes[35],pending:!!e.bytes[33],paused:this.pausedEvents.has(id),available:!reason,reason};}),...this.blocked].sort((a,b)=>a.id-b.id);}
}
