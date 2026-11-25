import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import path from 'node:path';
import {ObjectsDocument,type ObjectNode} from '../src/core/objects';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import {restoredNatureEventClasses} from '../src/core/environment-event-types';
const root='/root/sky-research/original-runtime-corpus/Levels';
const load=(level:string)=>{const source=fs.readFileSync(path.join(root,level,'Objects.level.bin'));return {source,doc:new ObjectsDocument(source)};};
const ref=(doc:ObjectsDocument,node:ObjectNode,name:string)=>doc.nodes[Number(node.fields.find(f=>f.name===name)!.value)];
test('DuskGraveyard startup blocks the delay to an unavailable dark-creature event and keeps environment frames running',()=>{
 const {doc,source}=load('DuskGraveyard'),owner=createViewportEnvironment(doc.nodes,undefined,{level:'DuskGraveyard'});
 const delay=doc.nodes.find(n=>n.className==='Delay'&&Number(n.fields.find(f=>f.name==='autoStart')?.value)===1&&ref(doc,n,'events').fields.find(f=>f.name==='data')!.children!.some(f=>doc.nodes[Number(f.value)].className==='AwakenDarkCreatures'))!;
 assert.ok(delay);const status=owner.info().events.find(e=>e.id===delay.id)!;assert.equal(status.available,false);assert.equal(status.running,false);assert.match(status.reason,/AwakenDarkCreatures/);assert.throws(()=>owner.trigger(delay.id),/AwakenDarkCreatures/);
 for(let frame=0;frame<30;frame++)owner.advance({delta:.1,timeScale:1});
 assert.ok(owner.info().weather.time>2);assert.deepEqual(Buffer.from(doc.serialize()),source);owner.dispose();
});
test('All saved nature events have explicit dependency availability; supported events share the original Barn and leave the corpus intact',()=>{
 const counts:Record<string,number>={},blocked:Record<string,number>={};
 for(const level of fs.readdirSync(root).sort()){
  const {doc,source}=load(level),owner=createViewportEnvironment(doc.nodes,undefined,{level});
  for(const node of doc.nodes.filter(n=>(restoredNatureEventClasses as readonly string[]).includes(n.className))){
   const status=owner.info().events.find(e=>e.id===node.id)!;assert.ok(status,`${level}/${node.id}`);
   if(!status.available){blocked[node.className]=(blocked[node.className]??0)+1;const before=owner.info().nature;assert.throws(()=>owner.trigger(node.id),new RegExp(status.reason.replace(/[.*+?^${}()|[\]\\]/g,'\\$&')));assert.deepEqual(owner.info().nature,before);continue;}
   counts[node.className]=(counts[node.className]??0)+1;owner.trigger(node.id);assert.equal(owner.info().events.find(e=>e.id===node.id)!.starts,1);
   if(node.className==='BirdV2ParamSwap'){const target=ref(doc,node,'target'),params=ref(doc,node,'newParams');assert.equal(owner.info().nature.birds.find(b=>b.id===target.id)!.boidParams,params.id);}
   if(node.className==='SetBirdGuidesEnabled'){
    const birds=ref(doc,node,'birds').fields.find(f=>f.name==='data')!.children!;
    for(const bird of birds){const p=owner.info().nature.birds.find(b=>b.id===Number(bird.value))!.boidParams;assert.equal(owner.info().nature.birdParameters.find(b=>b.id===p)!.guidesEnabled,true);}
   }
   if(node.className==='SetDarkCreaturesNetworked')for(const target of ref(doc,node,'creatures').fields.find(f=>f.name==='data')!.children!)assert.equal(owner.info().nature.darkCreatures.find(c=>c.id===Number(target.value))!.networked,true);
   for(let frame=0;owner.info().events.find(e=>e.id===node.id)!.running&&frame<2000;frame++)owner.advance({delta:.1,timeScale:1});
   assert.equal(owner.info().events.find(e=>e.id===node.id)!.running,false,`${level}/${node.id}`);
   if(node.className==='SetFlame')for(const target of ref(doc,node,'flames').fields.find(f=>f.name==='data')!.children!){const flame=owner.info().nature.flames.find(f=>f.id===Number(target.value))!;assert.equal(flame.lit,true);assert.equal(flame.intensity,1);}
  }
  assert.deepEqual(Buffer.from(doc.serialize()),source);owner.dispose();assert.ok(owner.info().events.every(e=>!e.running&&!e.pending));
 }
 assert.deepEqual(counts,{SetFlame:23,SetDarkCreaturesNetworked:3,BirdV2ParamSwap:15,DetachFromBirdGuides:4,SetBirdGuidesEnabled:4});
 assert.deepEqual(blocked,{OnFlame:154,SetFlame:20,AwakenDarkCreatures:9,OnBlaze:5,ReleaseBirds:3,Critter_Shout:15});
});
test('SetFlame reads the current Game clock before Barn Update and re-enabling resets the elapsed timer',()=>{
 const {doc,source}=load('Rain'),owner=createViewportEnvironment(doc.nodes),node=doc.nodes.find(n=>n.className==='SetFlame'&&Number(n.fields.find(f=>f.name==='lit')?.value)===1&&Number((n.fields.find(f=>f.name==='duration')?.value as {float:number})?.float)>0&&owner.info().events.find(e=>e.id===n.id)?.available)!;
 const timer=()=>owner.info().nature.timers.find(t=>t.id===node.id)!.elapsed;
 owner.trigger(node.id);assert.equal(timer(),Math.fround(.0001));
 owner.advance({delta:.02,timeScale:.5,debugEnabled:true,debugScale:2});assert.equal(timer(),Math.fround(Math.fround(.0001)+Math.fround(.02)));
 owner.setControllerEnabled(node.id,false);owner.advance({delta:.1,timeScale:1});owner.trigger(node.id);assert.equal(timer(),Math.fround(.1));
 assert.deepEqual(Buffer.from(doc.serialize()),source);owner.dispose();
});
test('Reset reconstructs shared BirdV2 parameter references; runtime changes never leak into saved fields',()=>{
 const {doc,source}=load('Prairie_Village'),node=doc.nodes.find(n=>n.className==='BirdV2ParamSwap')!,target=ref(doc,node,'target');let owner=createViewportEnvironment(doc.nodes);
 const initial=owner.info().nature.birds.find(b=>b.id===target.id)!.boidParams;owner.trigger(node.id);assert.equal(owner.info().nature.birds.find(b=>b.id===target.id)!.boidParams,ref(doc,node,'newParams').id);owner.dispose();
 owner=createViewportEnvironment(doc.nodes);assert.equal(owner.info().nature.birds.find(b=>b.id===target.id)!.boidParams,initial);assert.deepEqual(Buffer.from(doc.serialize()),source);owner.dispose();
});
test('Guide detachment shares the map EventBarn, blocks active guides until Avatar storage is attached, and retains previous event starts',()=>{
 const {doc,source}=load('Prairie_Village'),owner=createViewportEnvironment(doc.nodes),node=doc.nodes.find(n=>n.className==='DetachFromBirdGuides')!,bird=ref(doc,node,'bird');
 owner.trigger(node.id);assert.equal(owner.info().events.find(e=>e.id===node.id)!.starts,1);
 let reference=0n,checkReference=()=>{};owner.attachBirdGuideServices(objects=>{
  const m=objects.runtimeMemory,p=objects.require(bird.id).pointer;m.write8(p+0x440n,1);
  // A prepared original-layout player record tests the attachment boundary;
  // this does not stand in for the game's full Avatar owner.
  assert.equal(owner.info().events.find(e=>e.id===node.id)!.available,false);
  assert.throws(()=>owner.trigger(node.id),/真实 AvatarBarn/);assert.equal(owner.info().events.find(e=>e.id===node.id)!.starts,1);
  const avatarOwner=objects.allocate(0x20+16*0x2230),avatar=avatarOwner+0x20n,guide=objects.allocate(0x100);reference=objects.allocate(64);
  m.write8(avatar+0x21b2n,1);m.write64(avatar+0x88n,reference);m.write64(reference+16n,guide);m.write32(reference+24n,9);m.write32(reference+44n,0xffffffff);m.write32(guide+0xc4n,9);m.write64(p+0x420n,guide);
  checkReference=()=>{assert.equal(m.read64(reference+16n),0n);assert.equal(m.read32(reference+44n),0);assert.equal(m.read32(reference+40n),0);assert.equal(m.read64(reference+32n),0x40f00000n);};
  return {avatarOwner,avatarEnabled:()=>1};
 });
 owner.trigger(node.id);assert.equal(owner.info().events.find(e=>e.id===node.id)!.starts,2);assert.equal(owner.info().events.find(e=>e.id===node.id)!.running,false);
 checkReference();
 assert.deepEqual(Buffer.from(doc.serialize()),source);owner.dispose();
});
