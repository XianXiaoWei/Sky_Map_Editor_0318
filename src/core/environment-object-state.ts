import type {ObjectNode,Field} from './objects';
import type {ModelBakeMemory} from './model-baked-runtime';
import construction from '../../docs/environment-construction.json';
import defaults from '../../docs/environment-objects-defaults.json';
import properties from '../../docs/native-properties.json';
import {constructOriginalEnvironmentObject,type EnvironmentConstructionClass} from './environment-construction-runtime';
import {prepareEnvironmentConstructionContext} from './environment-construction-context';
import {constructNativeMarker} from './marker-runtime';
import {constructNativeClump} from './clump-runtime';
import {constructNativeFloat} from './object-foundation-runtime';
import {assignNativeCString,growNativeStringAndReplace,type NativeStringMemory} from './native-string-runtime';
import {constructOriginalVertexData,constructOriginalRenderData} from './vertex-data-runtime';
import {getNativeMarkerTransform,setNativeMarkerTransform,nativeIdentityMatrix} from './marker-transform-runtime';
import {constructOriginalRail,allocateOriginalRailPoints} from './rail-storage-runtime';
import {initializeOriginalPointLightBarn,createOriginalPointLight,releaseAllOriginalPointLights,gatherOriginalPointLights,POINT_LIGHT_BARN_BYTES} from './environment-leaf-runtime';
import {constructOriginalLevelMesh,getOriginalLevelMeshTransform,getOriginalLevelMeshEnabled,setOriginalLevelMeshEnabled,setOriginalLevelMeshTransform} from './level-mesh-runtime';
import {getOriginalSpawnMotesTransform,setOriginalSpawnMotesTransform} from './spawn-motes-runtime';
import {OBJECT_EFFECT_POOLS,createOriginalObjectEffect,setOriginalCandleTransform,setOriginalCandleEnabled,getOriginalCandleEnabled} from './object-effects-runtime';
import creatureConstruction from '../../docs/creature-construction.json';
import creatureDefaults from '../../docs/creature-objects-defaults.json';
import {constructOriginalCreatureObject,type CreatureConstructionClass} from './creature-construction-runtime';
import {CREATURE_POOLS,CREATURE_ENABLED,createOriginalCreature,setOriginalCreatureEnabled,getOriginalCreatureEnabled,type CreaturePoolClass,type CreatureEnabledClass} from './creature-runtime';
import itemConstruction from '../../docs/object-item-construction.json';
import itemDefaults from '../../docs/object-item-defaults.json';
import {constructOriginalObjectItem,type ObjectItemConstructionClass} from './object-item-construction-runtime';
import {BLAZE_POOL,initializeOriginalBlazeBarn,createOriginalBlaze,unloadOriginalBlazeBarn,setOriginalBlazeEnabled,getOriginalBlazeEnabled,setOriginalBlazeTransform,getOriginalBlazeTransform} from './blaze-runtime';
import {setOriginalFlameEnabled,getOriginalFlameEnabled,setOriginalFlameTransform} from './flame-runtime';
import {isSceneEventClass,sceneEventStorageBytes,constructPreparedSceneEvent} from './scene-event-construction';
import sceneDefaults from '../../docs/scene-event-defaults.json';
import moveRailDefaults from '../../docs/move-object-along-rail-defaults.json';

const registered=properties as Record<string,Record<string,{nativeOffset:number;typeGetter:string}>>;
export const environmentObjectClasses=Object.keys(construction.classes) as EnvironmentConstructionClass[];
const environmentClasses=new Set<string>(environmentObjectClasses);
export const creatureObjectClasses=Object.keys(creatureConstruction.classes) as CreatureConstructionClass[];
const creatureClasses=new Set<string>(creatureObjectClasses);
const creatureEventClasses=new Set(['BirdV2AiSwap','BirdV2ParamSwap','ReleaseBirds','DetachFromBirdGuides','SetBirdGuidesEnabled','AwakenDarkCreatures','SetDarkCreaturesNetworked','Critter_Shout','CreateCritterV2','CritterV2Event','Critter_OnRegion','Critter_OnTouch','Critter_SendMsg','SetDarkCreaturesMusicFloat']);
export const objectItemClasses=Object.keys(itemConstruction.classes) as ObjectItemConstructionClass[];
const itemClasses=new Set<string>(objectItemClasses),itemEventClasses=new Set<string>(objectItemClasses.filter(n=>n!=='Flame'&&n!=='CandleObject'));
const eventClasses=new Set<string>(environmentObjectClasses.filter(name=>construction.classes[name].objectArgument==='rdi'||
 ['CloudBob','DropOcclusion','FireWorkShow','OnBlaze','OnBoomDestroy','SetEmitterFlowRail','SetOceanRender','SetRainParams','SetWind','SpawnMotes','StarFallShower'].includes(name)).filter(name=>name!=='EnvNode'));
export const isEnvironmentEventClass=(name:string)=>eventClasses.has(name);
// CandleObject's non-polymorphic Object header is at +0 (constructor
// 0x1001ec650); Flame and the item Event classes have their Object at +8.
const objectAdjustment=(name:string)=>isSceneEventClass(name)||isEnvironmentEventClass(name)||creatureEventClasses.has(name)||itemClasses.has(name)&&name!=='CandleObject'||['Marker','FogVolumeSphere','LevelMesh','BirdV2','Crab','BirdFlock','Buddy','FishV2','WhaleFairy'].includes(name)?8n:0n;
export interface EnvironmentObjectEntry {
 node:ObjectNode;pointer:bigint;bytes:Uint8Array;known:Uint8Array;
 fieldsLoaded:string[];defaultsApplied:string[];pending:string[];
}
/** Shared editor address space for all environment parent bodies and their
 * native Marker/Clump/Float dependencies. Allocation, metadata and field-cache
 * preparation are explicit adapters. Unknown defaults and unsupported nested
 * arrays remain pending; this does not claim a native TGCL factory or renderer. */
export class PreparedEnvironmentObjectState {
 readonly entries=new Map<number,EnvironmentObjectEntry>();
 readonly memory:NativeStringMemory & {bytes(p:bigint,n:number):Uint8Array};
 readonly runtimeMemory:ModelBakeMemory;
 readonly pointLightBarn:bigint;
 readonly blazeBarn:bigint|undefined;
 readonly effectBarns=new Map<'FlowerPatch'|'Water'|'CandleObject',bigint>();
 readonly creatureBarns=new Map<'BirdFlocks'|'DarkCreatureBarn',bigint>();
 private disposed=false;
 private ranges:{pointer:bigint;bytes:Uint8Array;known:Uint8Array;view:DataView}[]=[];
 private cursor=0x510000000n;
 private constructFlameAt!:(pointer:bigint)=>void;
 constructor(nodes:ObjectNode[]){
  let lastRange:typeof this.ranges[number]|undefined;
  const locate=(p:bigint,n:number)=>{
   if(lastRange&&p>=lastRange.pointer&&p+BigInt(n)<=lastRange.pointer+BigInt(lastRange.bytes.length))return {r:lastRange,at:Number(p-lastRange.pointer)};
   let lo=0,hi=this.ranges.length;
   while(lo<hi){const mid=(lo+hi)>>>1;if(this.ranges[mid].pointer<=p)lo=mid+1;else hi=mid;}
   const r=this.ranges[lo-1],at=r?Number(p-r.pointer):-1;
   if(!r||at<0||at+n>r.bytes.length)throw new Error(`环境对象地址未接通：0x${p.toString(16)} + ${n}`);
   lastRange=r;
   return {r,at};
  };
  const bytes=(p:bigint,n:number)=>{const {r,at}=locate(p,n);return r.bytes.subarray(at,at+n);};
  const write=(p:bigint,data:Uint8Array)=>{const {r,at}=locate(p,data.length);r.bytes.set(data,at);r.known.fill(1,at,at+data.length);};
  this.memory={bytes,read8:p=>{const {r,at}=locate(p,1);return r.bytes[at];},read32:p=>{const {r,at}=locate(p,4);return r.view.getUint32(at,true);},read64:p=>{const {r,at}=locate(p,8);return r.view.getBigUint64(at,true);},
   write8:(p,n)=>{const {r,at}=locate(p,1);r.bytes[at]=n&255;r.known[at]=1;},write32:(p,n)=>{const {r,at}=locate(p,4);r.view.setUint32(at,n,true);r.known.fill(1,at,at+4);},
   write64:(p,n)=>{const {r,at}=locate(p,8);r.view.setBigUint64(at,n,true);r.known.fill(1,at,at+8);},
   copy:(out,input,n)=>write(out,new Uint8Array(bytes(input,n))),move:(out,input,n)=>write(out,new Uint8Array(bytes(input,n))),
   string:p=>{const {r,at}=locate(p,1),end=r.bytes.indexOf(0,at);if(end<0)throw new Error('环境对象字符串未终止');return new Uint8Array(r.bytes.subarray(at,end));}};
  this.runtimeMemory={...this.memory,string:p=>new TextDecoder().decode(this.memory.string(p))};
  const m=this.memory,variables=this.allocate(80),identity=this.allocate(64);m.bytes(identity,64).set(nativeIdentityMatrix());
  const context=prepareEnvironmentConstructionContext(this.runtimeMemory,0x520000000n,(memory,address,out)=>{
   if(address===0x1007f5010n)constructOriginalVertexData(memory,out,{variables:()=>variables,lock:()=>{},unlock:()=>{}});
   else if(address===0x1007f5d80n)constructOriginalRenderData(memory,out,()=>identity);
   else throw new Error('未知环境子构造');
  });
  const creatureContext=prepareEnvironmentConstructionContext(this.runtimeMemory,0x550000000n,undefined,creatureConstruction);
  const itemContext=prepareEnvironmentConstructionContext(this.runtimeMemory,0x560000000n,undefined,itemConstruction);
  this.constructFlameAt=pointer=>{constructOriginalObjectItem(itemContext.memory,pointer,'Flame',itemContext.services);};
  this.pointLightBarn=this.allocate(POINT_LIGHT_BARN_BYTES);
  initializeOriginalPointLightBarn(m,this.pointLightBarn,()=>{});
  const pointPool=this.ranges.at(-1)!;
  // These flat Objects classes use Barn factory slots in the original game.
  // Reserve only the verified pool/count regions, not fake GPU owner storage.
  for(const name of ['FlowerPatch','Water','CandleObject'] as const){const p=OBJECT_EFFECT_POOLS[name],barn=this.allocate(Math.max(p.count+4,p.first+p.stride*p.capacity,name==='CandleObject'?0x66b60:0));m.write32(barn+BigInt(p.count),0);this.effectBarns.set(name,barn);}
  for(const owner of ['BirdFlocks','DarkCreatureBarn'] as const){const pools=Object.entries(CREATURE_POOLS).filter(([,p])=>p.owner===owner);if(!pools.some(([name])=>nodes.some(n=>n.className===name)))continue;const barn=this.allocate(Math.max(...pools.map(([,p])=>Math.max(p.count+4,p.first+p.stride*p.capacity))));for(const [,p] of pools)m.write32(barn+BigInt(p.count),0);this.creatureBarns.set(owner,barn);}
  if(nodes.some(n=>n.className==='Blaze')){this.blazeBarn=this.allocate(BLAZE_POOL.bytes);initializeOriginalBlazeBarn(this.runtimeMemory,this.blazeBarn,()=>{});}
  const needed=new Set(nodes.filter(n=>isSceneEventClass(n.className)||environmentClasses.has(n.className)||creatureClasses.has(n.className)||itemClasses.has(n.className)||n.className==='CandleObject').map(n=>n.id)),byId=new Map(nodes.map(n=>[n.id,n]));
  const visit=(fields:Field[])=>{for(const field of fields){if(field.kind==='reference'&&field.value!==0xffffffff){const target=byId.get(Number(field.value));if(target&&(isSceneEventClass(target.className)||['Marker','Clump','Float','Rail','LevelMesh'].includes(target.className))&&!needed.has(target.id)){needed.add(target.id);visit(target.fields);}}visit(field.children??[]);}};
  for(const id of [...needed])visit(byId.get(id)!.fields);
  // Publish allocations before resolving any references, including forward and
  // repeated Clump members. One source object owns exactly one native address.
  for(const node of nodes.filter(n=>needed.has(n.id))){
   const size=isSceneEventClass(node.className)?sceneEventStorageBytes[node.className]:environmentClasses.has(node.className)?construction.classes[node.className as EnvironmentConstructionClass].storageBytes:creatureClasses.has(node.className)?creatureConstruction.classes[node.className as CreatureConstructionClass].storageBytes:itemClasses.has(node.className)?itemConstruction.classes[node.className as ObjectItemConstructionClass].storageBytes:node.className==='CandleObject'?OBJECT_EFFECT_POOLS.CandleObject.stride:node.className==='Marker'?80:node.className==='Clump'?32:node.className==='Rail'?256:node.className==='LevelMesh'?0xa60:24;
   const pooled=node.className==='PointLight',effect=node.className==='FlowerPatch'||node.className==='Water'||node.className==='CandleObject'?node.className:undefined;
   const creaturePool=Object.hasOwn(CREATURE_POOLS,node.className)?node.className as CreaturePoolClass:undefined;
   const pointer=node.className==='Blaze'?createOriginalBlaze(this.runtimeMemory,this.blazeBarn!,()=>{context.services.metadata(0x1007abc10n);return context.memory.read32(context.memory.read64(0x101ddae00n)+56n);},()=>0):pooled?createOriginalPointLight(m,this.pointLightBarn,()=>{context.services.metadata(0x1007abc10n);return context.memory.read32(context.memory.read64(0x10201a728n)+56n);}):effect?createOriginalObjectEffect(this.runtimeMemory,this.effectBarns.get(effect)!,effect):creaturePool?createOriginalCreature(this.runtimeMemory,this.creatureBarns.get(CREATURE_POOLS[creaturePool].owner)!,creaturePool):this.allocate(size);
   const range=pooled?pointPool:locate(pointer,size).r,offset=Number(pointer-range.pointer);
   this.entries.set(node.id,{node,pointer,bytes:range.bytes.subarray(offset,offset+size),known:range.known.subarray(offset,offset+size),fieldsLoaded:[],defaultsApplied:[],pending:[]});
  }
  for(const entry of this.entries.values()){
   const {node,pointer,bytes}=entry;
   if(node.className==='PointLight'||node.className==='Blaze'){} // Verified factory stores already ran on this exact slot.
   else if(isSceneEventClass(node.className))constructPreparedSceneEvent(bytes,node.className);
   else if(environmentClasses.has(node.className))constructOriginalEnvironmentObject(context.memory,pointer,node.className as EnvironmentConstructionClass,context.services);
   else if(creatureClasses.has(node.className))constructOriginalCreatureObject(creatureContext.memory,pointer,node.className as CreatureConstructionClass,creatureContext.services);
   else if(itemClasses.has(node.className))constructOriginalObjectItem(itemContext.memory,pointer,node.className as ObjectItemConstructionClass,itemContext.services);
   else if(node.className==='Marker')constructNativeMarker(bytes,1);
   else if(node.className==='Clump')constructNativeClump(m,pointer,1);
   else if(node.className==='Rail')constructOriginalRail(bytes,1,new Uint8Array(16));
   else if(node.className==='LevelMesh'){constructOriginalLevelMesh(bytes,pointer,1,2);m.write64(pointer+0x228n,0n);entry.pending.push('LevelMesh 原 Model 装载/GPU/碰撞所有权未接入此环境地址空间');}
   else constructNativeFloat(bytes,1);
   if(node.className==='Blaze')entry.pending.push('原 BlazeBarn 池分配、启用/变换已接入；单体资源装载、Update、模型/Flame、音效和绘制尚未接入');
   if(node.className==='SpawnMotes')entry.pending.push('SpawnMotes 原 Event 启用反射、Emitter/Mote 创建和更新生命周期未接入');
   if(node.className==='FlowerPatch')entry.pending.push('FlowerBarn 原碰撞地表采样、密度分布/顶点生成、Visibility 和原 Flower 绘制尚未接入');
   if(node.className==='Water')entry.pending.push('Ocean 原水面 RenderData、模拟纹理和原 Ocean shader 绘制尚未接入');
   if(node.className==='CandleObject'){
    // The pool's +0x90 rendering pointer survives factory stores. It is not
    // saved TGCL data: retain a declared unloaded state instead of letting an
    // enabled edit write to an invented rendering record.
    m.write64(pointer+0x90n,0n);
    entry.pending.push('CandleBarn 原资源装载、真实 Candle 渲染记录、点燃/蜡量更新和绘制尚未接入');
   }
   if(creatureClasses.has(node.className))entry.pending.push(creatureEventClasses.has(node.className)?'原生物事件 Update、目标/游戏服务和 EventBarn 分派尚未接入':'原生物装载、运行变换、动画/蒙皮、AI、碰撞、音效/粒子和绘制尚未接入');
   if(itemClasses.has(node.className)&&node.className!=='CandleObject')entry.pending.push(node.className==='Flame'?'FlameBarn 原池/资源装载、点燃/熄灭/消耗更新、音效/粒子和绘制尚未接入':'原火焰事件完整更新、目标和 EventBarn 分派尚未接入');
   // Calls that write SIMD ranges bypass scalar write functions. They remain
   // allocation bytes until a public saved/default field explicitly covers them.
   const tags=((node.className==='MoveObjectAlongRail'?moveRailDefaults:isSceneEventClass(node.className)?sceneDefaults:itemClasses.has(node.className)?itemDefaults:creatureClasses.has(node.className)?creatureDefaults:defaults).classes as Record<string,Record<string,{encodedHex:string|null;text:string}>>)[node.className]??{};
   for(const [name,tag] of Object.entries(tags)){
    if(node.fields.some(f=>f.name===name))continue;
    if(tag.encodedHex){this.writeField(entry,name,Uint8Array.from(tag.encodedHex.match(/../g)!,h=>parseInt(h,16)));entry.defaultsApplied.push(name);}
    else if(registered[node.className]?.[name]?.typeGetter.includes('basic_string')){this.writeString(entry,name,tag.text);entry.defaultsApplied.push(name);}
    else entry.pending.push(`缺省字段 ${name} 的原转换尚未恢复`);
   }
   if(node.className==='Marker'&&!node.fields.some(f=>f.name==='enabled')){this.writeField(entry,'enabled',Uint8Array.of(1));entry.defaultsApplied.push('enabled');}
   for(const field of node.fields){
    if(!registered[node.className]?.[field.name])continue;
    if(field.kind==='reference'||field.kind==='array')continue;
    if(field.kind==='string'){this.writeString(entry,field.name,String(field.value));entry.fieldsLoaded.push(field.name);}
    else if(field.children?.length)entry.pending.push(`复合字段 ${field.name} 的原分配尚未恢复`);
    else{this.writeField(entry,field.name,Uint8Array.from(field.raw.match(/../g)??[],h=>parseInt(h,16)));entry.fieldsLoaded.push(field.name);}
   }
  }
  for(const entry of this.entries.values())for(const field of entry.node.fields){
   const property=registered[entry.node.className]?.[field.name];if(!property)continue;
   if(field.kind==='reference'){
    const target=this.entries.get(Number(field.value));
    if(field.value!==0xffffffff&&!target){entry.pending.push(`引用 ${field.name} → #${field.value} 的运行类未接入`);continue;}
    const pointer=target?target.pointer+(property.typeGetter.includes('IP6ObjectE')?objectAdjustment(target.node.className):0n):0n;
    m.write64(entry.pointer+BigInt(property.nativeOffset),pointer);entry.fieldsLoaded.push(field.name);
   }else if(field.kind==='array'){
    const rail=entry.node.className==='Rail'&&field.name==='dataPoints';
    if(!rail&&(entry.node.className!=='Clump'||field.name!=='data')){entry.pending.push(`数组 ${field.name} 的原容器分配尚未恢复`);continue;}
    const refs=field.children??[],members=refs.map(ref=>this.entries.get(Number(ref.value)));
    if(refs.some((ref,i)=>ref.kind!=='reference'||ref.value!==0xffffffff&&!members[i])){entry.pending.push('Clump 含未接入的运行对象');continue;}
    const table=rail?allocateOriginalRailPoints(m,entry.pointer,refs.length,{release:()=>{},allocate:(_heap,n)=>this.allocate(n)}):this.allocate(Math.max(8,refs.length*8));members.forEach((member,i)=>m.write64(table+BigInt(i)*8n,member?member.pointer+objectAdjustment(member.node.className):0n));
    if(!rail){m.write64(entry.pointer+8n,table);m.write32(entry.pointer+16n,refs.length);}entry.fieldsLoaded.push(field.name);
   }
  }
 }
 allocate(size:number){const pointer=this.cursor;this.cursor+=BigInt(Math.ceil(Math.max(1,size)/16)*16);const bytes=new Uint8Array(size);this.ranges.push({pointer,bytes,known:new Uint8Array(size),view:new DataView(bytes.buffer)});return pointer;}
 private writeField(entry:EnvironmentObjectEntry,name:string,data:Uint8Array){
  const offset=registered[entry.node.className]?.[name]?.nativeOffset;
  if(offset===undefined||!data.length||offset+data.length>entry.bytes.length)throw new Error(`环境原字段越界：${entry.node.className}.${name}`);
  entry.bytes.set(data,offset);entry.known.fill(1,offset,offset+data.length);
 }
 private writeString(entry:EnvironmentObjectEntry,name:string,text:string){
  const encoded=new TextEncoder().encode(text+'\0'),source=this.allocate(encoded.length);this.memory.bytes(source,encoded.length).set(encoded);
  const destination=entry.pointer+BigInt(registered[entry.node.className][name].nativeOffset);
  assignNativeCString(this.memory,destination,source,{growAndReplace:(...args)=>growNativeStringAndReplace(this.memory,...args,{getPool:()=>0n,allocate:(_pool,n)=>this.allocate(Number(n)),release:()=>{}})});
 }
 require(id:number){const e=this.entries.get(id);if(!e)throw new Error(`环境运行对象 #${id} 未接入`);return e;}
 constructFlame(pointer:bigint){if(this.disposed)throw new Error('环境运行状态已卸载');this.constructFlameAt(pointer);}
 objectPointer(id:number){const e=this.require(id);return e.pointer+objectAdjustment(e.node.className);}
 field(id:number,name:string){const e=this.require(id),p=registered[e.node.className]?.[name];if(!p)throw new Error(`原环境字段不存在：${e.node.className}.${name}`);return e.pointer+BigInt(p.nativeOffset);}
 setEnabled(id:number,on:boolean){const e=this.entries.get(id),offset=e&&registered[e.node.className]?.enabled?.nativeOffset;if(!e||offset===undefined||isSceneEventClass(e.node.className)||isEnvironmentEventClass(e.node.className)||creatureEventClasses.has(e.node.className)||itemEventClasses.has(e.node.className))return false;if(e.node.className==='CandleObject'){if(!this.memory.read64(e.pointer+0x90n))return false;setOriginalCandleEnabled(this.runtimeMemory,e.pointer,Number(on));}else if(e.node.className==='Blaze')setOriginalBlazeEnabled(this.runtimeMemory,e.pointer,Number(on));else if(e.node.className==='LevelMesh')setOriginalLevelMeshEnabled(this.memory,e.pointer,Number(on));else if(e.node.className==='Flame')setOriginalFlameEnabled(this.runtimeMemory,e.pointer,Number(on));else if(Object.hasOwn(CREATURE_ENABLED,e.node.className))setOriginalCreatureEnabled(this.runtimeMemory,e.pointer,e.node.className as CreatureEnabledClass,Number(on));else this.memory.write8(e.pointer+BigInt(offset),Number(on));return true;}
 enabled(id:number){const e=this.require(id);if(e.node.className==='SpawnMotes'||creatureEventClasses.has(e.node.className)||itemEventClasses.has(e.node.className))throw new Error('原 Event 启用生命周期未接入');if(e.node.className==='CandleObject')return !!getOriginalCandleEnabled(this.runtimeMemory,e.pointer);if(e.node.className==='Blaze')return !!getOriginalBlazeEnabled(this.runtimeMemory,e.pointer);if(e.node.className==='LevelMesh')return !!getOriginalLevelMeshEnabled(this.memory,e.pointer);if(e.node.className==='Flame')return !!getOriginalFlameEnabled(this.runtimeMemory,e.pointer);if(Object.hasOwn(CREATURE_ENABLED,e.node.className))return !!getOriginalCreatureEnabled(this.runtimeMemory,e.pointer,e.node.className as CreatureEnabledClass);const offset=registered[e.node.className]?.enabled?.nativeOffset;return offset===undefined?true:!!this.memory.read8(e.pointer+BigInt(offset));}
 setTransform(id:number,matrix:Uint8Array){
  const e=this.entries.get(id);if(!e)return false;if(matrix.length!==64)throw new Error('环境变换必须为 64 字节');
  if(e.node.className==='Marker'||e.node.className==='EnvNode'){setNativeMarkerTransform(e.bytes,matrix);return true;}
  if(e.node.className==='LevelMesh'){setOriginalLevelMeshTransform(this.memory,e.pointer,matrix);return true;}
  if(e.node.className==='SpawnMotes'){setOriginalSpawnMotesTransform(e.bytes,matrix);e.known.fill(1,64,128);return true;}
  if(e.node.className==='CandleObject'){setOriginalCandleTransform(this.runtimeMemory,e.pointer,matrix);e.known.fill(1,16,80);return true;}
  if(e.node.className==='Blaze'){setOriginalBlazeTransform(this.runtimeMemory,e.pointer,matrix);e.known.fill(1,16,80);return true;}
  if(e.node.className==='Flame'){setOriginalFlameTransform(this.runtimeMemory,e.pointer,matrix);e.known.fill(1,16,80);return true;}
  const offset=registered[e.node.className]?.transform?.nativeOffset;if(offset===undefined)return false;e.bytes.set(matrix,offset);e.known.fill(1,offset,offset+64);return true;
 }
 transform(id:number){const e=this.require(id);if(e.node.className==='Marker'||e.node.className==='EnvNode')return getNativeMarkerTransform(e.bytes);if(e.node.className==='Blaze')return getOriginalBlazeTransform(this.runtimeMemory,e.pointer);if(e.node.className==='LevelMesh')return getOriginalLevelMeshTransform(this.memory,e.pointer);if(e.node.className==='SpawnMotes')return getOriginalSpawnMotesTransform(e.bytes);return new Uint8Array(this.memory.bytes(this.field(id,'transform'),64));}
 pointLights(){const out=new Uint8Array(256*8),v=new DataView(out.buffer),m=this.runtimeMemory,sink=0x540000000n,copy={...m,write64:(p:bigint,n:bigint)=>{if(p>=sink&&p<sink+2048n)v.setBigUint64(Number(p-sink),n,true);else m.write64(p,n);}},count=gatherOriginalPointLights(copy,this.pointLightBarn,sink,256);return Array.from({length:count},(_,i)=>v.getBigUint64(i*8,true));}
 dispose(){if(this.disposed)return;releaseAllOriginalPointLights(this.memory,this.pointLightBarn);if(this.blazeBarn)unloadOriginalBlazeBarn(this.runtimeMemory,this.blazeBarn,{soundIdentity:()=>{throw new Error('Blaze 音效 owner 未接入');},stopSound:()=>{throw new Error('Blaze 音效 owner 未接入');}});this.effectBarns.clear();this.creatureBarns.clear();this.disposed=true;}
 info(){return [...this.entries.values()].map(e=>({id:e.node.id,className:e.node.className,pointer:e.pointer.toString(),storageBytes:e.bytes.length,fieldsLoaded:e.fieldsLoaded.slice(),defaultsApplied:e.defaultsApplied.slice(),pending:e.pending.slice(),runtimeComplete:false}));}
 effectPoolInfo(){return [...this.effectBarns].map(([className,barn])=>{const p=OBJECT_EFFECT_POOLS[className];return {className,owner:className==='FlowerPatch'?'FlowerBarn':className==='CandleObject'?'CandleBarn':'Ocean',pointer:barn.toString(),count:this.memory.read32(barn+BigInt(p.count)),capacity:p.capacity,stride:p.stride,scope:'Native allocation and shared field storage; complete owner construction/update/draw/unload pending'};});}
 creaturePoolInfo(){return Object.entries(CREATURE_POOLS).flatMap(([className,p])=>{const barn=this.creatureBarns.get(p.owner);return barn?[{className,owner:p.owner,pointer:barn.toString(),count:this.memory.read32(barn+BigInt(p.count)),capacity:p.capacity,stride:p.stride,scope:'Original factory/placement and saved/default fields; complete owner load/update/draw/unload pending'}]:[];});}
}
