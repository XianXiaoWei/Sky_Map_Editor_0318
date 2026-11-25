import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import path from 'node:path';
import {ObjectsDocument,type ObjectNode} from '../src/core/objects';
import {PreparedEnvironmentObjectState,environmentObjectClasses,isEnvironmentEventClass} from '../src/core/environment-object-state';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import {TransformObjectPreview} from '../src/core/transform-object-preview';
import {isRestoredEnvironmentEvent,isContinuousEnvironmentEvent} from '../src/core/environment-event-types';
import properties from '../docs/native-properties.json';
import {OBJECT_EFFECT_POOLS} from '../src/core/object-effects-runtime';
const root='/root/sky-research/original-runtime-corpus',registered=properties as Record<string,Record<string,{nativeOffset:number;typeGetter:string}>>;
const corpus=()=>fs.readdirSync(root+'/Levels').sort().map(level=>{const file=path.join(root,'Levels',level,'Objects.level.bin'),source=fs.readFileSync(file);return {level,source,doc:new ObjectsDocument(source)};});
const scalar=(node:ObjectNode,name:string)=>{const field=node.fields.find(f=>f.name===name)!;return Buffer.from(field.raw,'hex').readFloatLE();};
test('All saved FlowerPatch and Water objects use original factory slot order within the shared owner',()=>{
 let flowers=0,waters=0;
 for(const {doc,level} of corpus()){
  const state=new PreparedEnvironmentObjectState(doc.nodes);
  for(const name of ['FlowerPatch','Water'] as const){
   const nodes=doc.nodes.filter(n=>n.className===name),pool=OBJECT_EFFECT_POOLS[name],barn=state.effectBarns.get(name)!;
   assert.equal(state.memory.read32(barn+BigInt(pool.count)),nodes.length,level+'/'+name);
   assert.ok(nodes.length<=pool.capacity);
   nodes.forEach((node,index)=>assert.equal(state.require(node.id).pointer,barn+BigInt(pool.first+index*pool.stride),`${level}/${node.id}`));
   if(name==='FlowerPatch')flowers+=nodes.length;else waters+=nodes.length;
  }
  state.dispose();assert.deepEqual(state.effectPoolInfo(),[]);
 }
 assert.equal(flowers,582);assert.equal(waters,38);
});
test('All real candles share original factory/metadata/field storage and retain the unloaded rendering boundary',()=>{
 let total=0;
 for(const {doc,level,source} of corpus()){
  const state=new PreparedEnvironmentObjectState(doc.nodes),candles=doc.nodes.filter(n=>n.className==='CandleObject'),pool=OBJECT_EFFECT_POOLS.CandleObject,barn=state.effectBarns.get('CandleObject')!;
  assert.equal(state.memory.read32(barn+BigInt(pool.count)),candles.length,level);
  candles.forEach((node,index)=>{
   const entry=state.require(node.id),before=entry.bytes.slice();
   assert.equal(entry.pointer,barn+BigInt(pool.first+index*pool.stride));
   assert.ok(state.memory.read32(entry.pointer)>0,'Native Candle Object metadata is at +0');
   assert.equal(state.memory.read64(entry.pointer+0x90n),0n);
   assert.equal(state.setEnabled(node.id,!state.enabled(node.id)),false);
   assert.deepEqual(entry.bytes,before,'Unloaded rendering must block before changing enabled');
   const matrix=Buffer.from(node.fields.find(f=>f.name==='transform')!.raw,'hex');
   assert.deepEqual(Buffer.from(state.transform(node.id)),matrix);
   const translated=Buffer.from(matrix);translated.writeFloatLE(translated.readFloatLE(48)+2,48);
   assert.equal(state.setTransform(node.id,translated),true);
   assert.deepEqual(Buffer.from(state.transform(node.id)),translated);
   assert.equal(state.setTransform(node.id,matrix),true);
   assert.deepEqual(entry.bytes,before);
   for(const field of node.fields){const property=registered.CandleObject[field.name];if(property&&!field.children?.length)assert.deepEqual(Buffer.from(state.memory.bytes(entry.pointer+BigInt(property.nativeOffset),field.raw.length/2)),Buffer.from(field.raw,'hex'));}
   total++;
  });
  assert.deepEqual(doc.serialize(),source);state.dispose();assert.deepEqual(state.effectPoolInfo(),[]);
 }
 assert.equal(total,1077);
});
test('Missing candle public fields use native enabled, one wax and default mesh tags in the same pool slot',()=>{
 const source=corpus().flatMap(c=>c.doc.nodes).find(n=>n.className==='CandleObject')!;
 const node={...source,fields:source.fields.filter(f=>!['enabled','numWaxToGive','meshType'].includes(f.name))},state=new PreparedEnvironmentObjectState([node]),entry=state.require(node.id);
 assert.equal(state.enabled(node.id),true);
 assert.equal(state.memory.read8(state.field(node.id,'numWaxToGive')),1);
 assert.equal(state.memory.read32(state.field(node.id,'meshType')),0);
 assert.ok(['enabled','numWaxToGive','meshType'].every(name=>entry.defaultsApplied.includes(name)));
 state.dispose();
});
test('Every environment class loads saved bytes into one shared native address, including forward references and PointLight factory slots',()=>{
 let count=0,lights=0;const classes=new Set<string>();
 for(const {doc,source,level} of corpus()){
  const state=new PreparedEnvironmentObjectState(doc.nodes),m=state.memory,points=state.pointLights(),pointEntries=[...state.entries.values()].filter(e=>e.node.className==='PointLight');
  assert.deepEqual(points,pointEntries.map(e=>e.pointer),level);assert.ok(points.every(p=>m.read8(p+80n)===1));lights+=points.length;
  for(const e of state.entries.values()){
   if(environmentObjectClasses.includes(e.node.className as any)){count++;classes.add(e.node.className);}
   for(const field of e.node.fields){
    const property=registered[e.node.className]?.[field.name];if(!property||!e.fieldsLoaded.includes(field.name))continue;
    const p=e.pointer+BigInt(property.nativeOffset);
    if(field.kind==='reference'){
     const target=state.entries.get(Number(field.value)),adjustment=target&&(isEnvironmentEventClass(target.node.className)||['Marker','FogVolumeSphere'].includes(target.node.className))&&property.typeGetter.includes('IP6ObjectE')?8n:0n;
     assert.equal(m.read64(p),target?target.pointer+adjustment:0n,`${level}/${e.node.id}.${field.name}`);
    }else if(field.kind!=='array'&&field.kind!=='string'&&!field.children?.length)assert.deepEqual(Buffer.from(m.bytes(p,field.raw.length/2)),Buffer.from(field.raw,'hex'),`${level}/${e.node.id}.${field.name}`);
   }
  }
  assert.deepEqual(Buffer.from(doc.serialize()),source);state.dispose();assert.deepEqual(state.pointLights(),[]);state.dispose();
 }
 assert.equal(count,2482);assert.equal(lights,521);assert.equal(classes.size,25);
});
test('Actual map rain events finish once, bound transitions, wrap phase and honor only enabled debug scaling',()=>{
 let count=0;
 for(const {level,doc,source} of corpus())for(const event of doc.nodes.filter(n=>n.className==='SetRainParams')){
  const owner=createViewportEnvironment(doc.nodes,undefined,{level}),initial=owner.info().events.find(e=>e.id===event.id)!.starts;
  owner.trigger(event.id);assert.equal(owner.info().events.find(e=>e.id===event.id)!.running,false);assert.equal(owner.info().events.find(e=>e.id===event.id)!.starts,initial+1);
  const enabled=level.includes('Rain'),transition=scalar(event,'transitionDuration'),steps=Math.ceil(transition/.1)+1;
  for(let i=0;i<steps;i++)owner.advance({delta:.1,timeScale:1});
  const rain=owner.info().weather.rain;assert.equal(rain.enabled,enabled);assert.ok(rain.phase>=0&&rain.phase<1);
  if(enabled){assert.equal(rain.transition,0);assert.ok(Math.abs(rain.baseIntensity-scalar(event,'intensity'))<1e-4);assert.ok(Math.abs(rain.fallRate-scalar(event,'fallRate'))<1e-4);assert.ok(rain.intensity>=0&&rain.intensity<=rain.baseIntensity+1e-4);}
  assert.deepEqual(Buffer.from(doc.serialize()),source);owner.dispose();count++;
 }
 assert.equal(count,13);
 const a=createViewportEnvironment([],undefined,{level:'Rain'}),b=createViewportEnvironment([],undefined,{level:'Rain'}),c=createViewportEnvironment([],undefined,{level:'Rain'});
 a.advance({delta:.1,timeScale:2,debugEnabled:true,debugScale:.25});b.advance({delta:.05,timeScale:1});c.advance({delta:.1,timeScale:2,debugEnabled:false,debugScale:.25});
 assert.equal(a.info().weather.time,b.info().weather.time);assert.equal(c.info().weather.time,Math.fround(.2));assert.throws(()=>a.advance({delta:.1,timeScale:1,debugEnabled:true}),/调试/);
});
test('All 76 SpawnMotes keep original saved transforms in their actual 160-byte bodies while unresolved particle lifecycle stays blocked',()=>{
 let count=0,blocked=0;
 for(const {level,doc,source} of corpus()){
  const state=new PreparedEnvironmentObjectState(doc.nodes);
  for(const node of doc.nodes.filter(n=>n.className==='SpawnMotes')){
   const entry=state.require(node.id),matrix=Buffer.from(node.fields.find(f=>f.name==='transform')!.raw,'hex');
   assert.equal(entry.bytes.length,160);assert.deepEqual(Buffer.from(state.transform(node.id)),matrix);assert.ok(entry.pending.some(s=>s.includes('Emitter/Mote')));
   const before=new Uint8Array(entry.bytes),replacement=Uint8Array.from({length:64},(_,i)=>(i*37+node.id)&255);
   assert.equal(state.setTransform(node.id,replacement),true);assert.deepEqual(state.transform(node.id),replacement);assert.deepEqual(entry.bytes.subarray(0,64),before.subarray(0,64));assert.deepEqual(entry.bytes.subarray(128),before.subarray(128));
   assert.equal(state.setEnabled(node.id,true),false);assert.throws(()=>state.enabled(node.id),/启用生命周期/);count++;
  }
  state.dispose();
  const owner=createViewportEnvironment(doc.nodes,undefined,{level});
  for(const event of owner.info().events.filter(e=>!e.available&&isRestoredEnvironmentEvent(e.kind))){assert.equal(event.kind,'DropOcclusion');assert.match(event.reason,/SpawnMotes.*启用\/更新生命周期/);assert.throws(()=>owner.trigger(event.id),/SpawnMotes/);blocked++;}
  owner.dispose();assert.deepEqual(Buffer.from(doc.serialize()),source);
 }
 assert.equal(count,76);assert.equal(blocked,1);
});
test('All map winds and their Rails sample finite values and obey runtime switches without rewriting original fields',()=>{
 let count=0,railWinds=0;
 for(const {level,doc,source} of corpus()){
  const owner=createViewportEnvironment(doc.nodes,undefined,{level}),winds=doc.nodes.filter(n=>n.className==='Wind');owner.advance({delta:.05,timeScale:1});
  for(const wind of winds){const at=(wind.fields.find(f=>f.name==='transform')!.value as number[]).slice(12,15),vector=owner.wind(at);assert.equal(vector.length,3);assert.ok(vector.every(Number.isFinite),`${level}/#${wind.id}`);count++;
   if(Number(wind.fields.find(f=>f.name==='rail')?.value??0xffffffff)!==0xffffffff)railWinds++;
  }
  const times=owner.info().wind.timers.map(t=>t.timer);owner([10,20,30]);owner([30,20,10]);assert.deepEqual(owner.info().wind.timers.map(t=>t.timer),times);
  winds.forEach(w=>owner.setControllerEnabled(w.id,false));assert.ok(owner.info().wind.timers.every(t=>!t.enabled));
  assert.deepEqual(Buffer.from(doc.serialize()),source);owner.dispose();
 }
 assert.equal(count,120);assert.equal(railWinds,26);
});
test('Seven environment events bridge real logic groups; continuous events pause, resume and reset their shared owner',()=>{
 const called:number[]=[],enabled:{id:number;on:boolean}[]=[];let resets=0,events=0,continuous=0;
 for(const {doc} of corpus()){
  const playback=new TransformObjectPreview({transform:()=>{},environmentEvent:id=>called.push(id),environmentEventEnabled:(id,on)=>enabled.push({id,on}),resetEnvironment:()=>resets++});playback.configure(doc.nodes);
  for(const candidate of playback.list().filter(c=>isRestoredEnvironmentEvent(c.kind))){if(!candidate.available){assert.equal(candidate.kind,'DropOcclusion');assert.match(candidate.reason,/SpawnMotes/);continue;}playback.start(candidate.id);const snapshot=playback.snapshot()!;assert.equal(snapshot.error,null);assert.equal(called.at(-1),candidate.id);events++;
   const node=doc.nodes[candidate.id],isContinuous=isContinuousEnvironmentEvent(node);
   assert.equal(snapshot.running,isContinuous);if(isContinuous){playback.step(.1);assert.equal(called.filter(id=>id===candidate.id).length>=1,true);playback.togglePause();assert.deepEqual(enabled.at(-1),{id:candidate.id,on:false});playback.togglePause();assert.deepEqual(enabled.at(-1),{id:candidate.id,on:true});continuous++;}
   const before=resets;playback.reset();assert.equal(resets,before+1);
  }
 }
 assert.equal(events,130);assert.ok(continuous>=65);
});
test('Real DropOcclusion roots retain live alpha, spatial/Float references and pause state, then unload their private alpha arrays',()=>{
 let count=0,blocked=0,floatLinks=0;
 for(const {level,doc,source} of corpus()){
  const owner=createViewportEnvironment(doc.nodes,undefined,{level});
  for(const event of doc.nodes.filter(n=>n.className==='DropOcclusion')){
   const status=owner.info().events.find(e=>e.id===event.id)!;
   if(!status.available){assert.match(status.reason,/空间对象/);assert.throws(()=>owner.trigger(event.id),/空间对象/);blocked++;continue;}
   const members=doc.nodes[Number(event.fields.find(f=>f.name==='transforms')!.value)].fields.find(f=>f.name==='data')!.children!.map(f=>Number(f.value)),target=members[0];
   members.forEach(id=>owner.setControllerEnabled(id,true));owner.trigger(event.id);
   const state=()=>owner.info().occlusion.states.find(s=>s.id===event.id)!;
   assert.equal(state().loaded,true);owner.advance({delta:.1,timeScale:1});
   assert.ok(state().alpha.every(Number.isFinite),`${level}/#${event.id}`);
   owner.setEventPaused(event.id,true);const paused=owner.info().occlusion,starts=owner.info().events.find(e=>e.id===event.id)!.starts;
   owner.advance({delta:.1,timeScale:1});assert.deepEqual(state().alpha,paused.states.find(s=>s.id===event.id)!.alpha);assert.deepEqual(owner.info().occlusion.records.filter(r=>r.eventId===event.id),paused.records.filter(r=>r.eventId===event.id));
   owner.setEventPaused(event.id,false);assert.equal(owner.info().events.find(e=>e.id===event.id)!.starts,starts);owner.advance({delta:.1,timeScale:1});
   const matrix=[2,0,0,0,0,2,0,0,0,0,2,0,1000+event.id,2000,3000,1];owner.setControllerTransform(target,new Uint8Array(Float32Array.from(matrix).buffer));owner.advance({delta:.1,timeScale:1});
   const record=owner.info().occlusion.records.find(r=>r.eventId===event.id&&r.position[0]===Math.fround(matrix[12]));
   if(state().alpha[0]>0){assert.ok(record);assert.equal(record.radius,2);assert.deepEqual(record.position.slice(0,3),matrix.slice(12,15));}
   const floatId=Number(event.fields.find(f=>f.name==='intensityFloat')!.value);
   if(floatId!==0xffffffff){owner.setFloatValues([{id:floatId,bits:0x3f000000}]);owner.advance({delta:.1,timeScale:1});const r=owner.info().occlusion.records.find(r=>r.eventId===event.id&&r.position[0]===Math.fround(matrix[12]));if(r)assert.equal(r.intensity,Math.fround(.5*state().alpha[0]));floatLinks++;}
   members.forEach(id=>owner.setControllerEnabled(id,false));const prior=state().alpha.slice();owner.advance({delta:.1,timeScale:1});assert.ok(state().alpha.every((a,i)=>a<=prior[i]));
   owner.setControllerEnabled(event.id,false);owner.advance({delta:.1,timeScale:1});assert.equal(owner.info().occlusion.records.some(r=>r.eventId===event.id),false);count++;
  }
  owner.dispose();assert.ok(owner.info().occlusion.states.every(s=>!s.loaded&&s.alpha.length===0));assert.deepEqual(owner.info().occlusion.records,[]);owner.dispose();assert.throws(()=>owner.advance({delta:.1,timeScale:1}),/卸载/);assert.deepEqual(Buffer.from(doc.serialize()),source);
 }
 assert.equal(count,63);assert.equal(blocked,1);assert.equal(floatLinks,3);
});
test('An empty map provides the original initial point-light color/intensity with the uniform field names used by environment blending',()=>{
 const owner=createViewportEnvironment([]),sample=owner([0,0,0]),values=sample.values.AmbiencePointLight;
 assert.deepEqual(sample.pointLight,(values.color as number[]).slice(0,3).map(c=>Math.fround(Math.fround(c*Number(values.intensity))/1000)));assert.ok(sample.pointLight.every(Number.isFinite));owner.dispose();
});
