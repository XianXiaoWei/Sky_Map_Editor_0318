import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';
import {ObjectsDocument} from '../src/core/objects';
import {createViewportEnvironment} from '../src/main/viewport-environment';
import {loadOriginalCandleLevel,type CandleLevelLoadServices} from '../src/core/candle-runtime';
import {loadOriginalFlame,igniteOriginalFlame,unloadOriginalFlame,type FlameSoundServices} from '../src/core/flame-runtime';
import {unloadOriginalCandleLevel} from '../src/core/candle-unload-runtime';
import {nativeIdentityMatrix} from '../src/core/marker-transform-runtime';
import {itemFloatBytes} from '../src/core/item-effect-arithmetic';
import type {PreparedEnvironmentObjectState} from '../src/core/environment-object-state';

// Prepared mesh/ground/audio services are explicit. The shared Candle records
// below are created by the same native-verified load bodies as the viewport.
function attach(env:ReturnType<typeof createViewportEnvironment>,sound:FlameSoundServices){
 let state!:PreparedEnvironmentObjectState;
 env.attachCandleOwner(objects=>{
  state=objects;const m=objects.runtimeMemory,barn=objects.effectBarns.get('CandleObject')!,pool=objects.allocate(256*0x570),bits=objects.allocate(32),identity=objects.allocate(64),game=objects.allocate(0x500),flames:bigint[]=[];
  m.bytes(identity,64).set(nativeIdentityMatrix());m.write32(barn+0xf980n,256);m.write32(barn+0xf984n,32);m.write64(barn+0xf990n,bits);m.write64(barn+0xf998n,pool);
  for(let i=0;i<6;i++){const p=barn+0xf6e0n+BigInt(i)*0x70n;m.bytes(p,64).set(nativeIdentityMatrix());m.bytes(p+0x40n,16).set(itemFloatBytes([0,1,0,.1]));m.bytes(p+0x68n,8).set(itemFloatBytes([1,.1]));}
  const loadServices={rand:()=>123456789,playLoop:()=>[0n,0n] as const,sound};
  const services:CandleLevelLoadServices={globalBarn:()=>barn,defaultRenderMatrix:()=>identity,specialTune:()=>false,flameScale:()=>Math.fround(2.2),
   createFlame:()=>{const p=objects.allocate(0x1b0);objects.constructFlame(p);flames.push(p);return p;},loadFlame:(p,r,a)=>loadOriginalFlame(m,p,r,a,loadServices),setupVertex:p=>{m.write8(p+0x538n,1);m.write8(p+0x52an,0);},shaderParameter:()=>0,raycast:()=>undefined,acos:Math.acos,tan:Math.tan,effectMetadata:()=>0n,createEffect:()=>objects.allocate(0x80),activateEffect:()=>{},sound};
  loadOriginalCandleLevel(m,barn,game,services);
  for(const e of objects.entries.values())if(e.node.className==='Flame'){loadOriginalFlame(m,e.pointer,0n,0n,loadServices);flames.push(e.pointer);}
  return {sound,advance:()=>{},dispose(){unloadOriginalCandleLevel(m,barn,()=>{});flames.forEach(p=>unloadOriginalFlame(m,p));for(const e of objects.entries.values())if(e.node.className==='CandleObject')m.write64(e.pointer+0x90n,0n);}};
 });return state;
}
test('Late Candle/Flame resources unlock original events without resetting existing timers; OnFlame consumes real Candle records and dispatches its chain',()=>{
 const source=fs.readFileSync('/root/sky-research/original-runtime-corpus/Levels/Rain/Objects.level.bin'),doc=new ObjectsDocument(source),env=createViewportEnvironment(doc.nodes),status=(id:number)=>env.info().events.find(e=>e.id===id)!;
 const existing=doc.nodes.find(n=>n.className==='SetFlame'&&status(n.id).available)!;env.trigger(existing.id);const prior=env.info().nature.timers.find(t=>t.id===existing.id)!.elapsed;
 assert.equal(status(898).available,false);assert.equal(status(1159).available,false);
 const audio:string[]=[],state=attach(env,{play:(_owner,name)=>{audio.push(name);}}),m=state.runtimeMemory;
 assert.equal(status(898).available,true);assert.equal(status(1159).available,true);assert.equal(env.info().nature.timers.find(t=>t.id===existing.id)!.elapsed,prior);
 for(const e of env.info().events)if(e.kind==='OnFlame'&&e.available)env.setEventPaused(e.id,true);
 const on=state.require(898),clump=m.read64(on.pointer+56n),table=m.read64(clump+8n),records:bigint[]=[];
 for(let i=0;i<m.read32(clump+16n);i++){const p=m.read64(table+BigInt(i)*8n),record=m.read64(p+0x90n);assert.ok(record);records.push(record);igniteOriginalFlame(m,m.read64(m.read64(record+64n)+16n));}
 m.write32(on.pointer+76n,0x40000000);env.setEventPaused(898,false);env.trigger(898);
 for(const record of records){assert.equal(m.bytes(record+96n,1)[0],1);assert.equal(m.read32(record+84n),0x40000000);assert.equal(m.read32(record+88n),0);const flame=m.read64(m.read64(record+64n)+16n);assert.equal(m.read32(flame+0x10cn),0x3f000000);assert.equal(m.bytes(flame+0x138n,1)[0],1);}
 const targets=doc.nodes[Number(doc.nodes[898].fields.find(f=>f.name==='events')!.value)].fields.find(f=>f.name==='data')!.children!;
 assert.ok(targets.some(t=>status(Number(t.value)).pending||status(Number(t.value)).running));
 assert.deepEqual(Buffer.from(doc.serialize()),source);env.dispose();assert.ok(env.info().events.every(e=>!e.running&&!e.pending));assert.ok([...state.entries.values()].filter(e=>e.node.className==='CandleObject').every(e=>m.read64(e.pointer+0x90n)===0n));
});
