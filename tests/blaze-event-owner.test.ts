import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';import {ObjectsDocument} from '../src/core/objects';import {createViewportEnvironment} from '../src/main/viewport-environment';import type {PreparedEnvironmentObjectState} from '../src/core/environment-object-state';import {resetOriginalBlaze} from '../src/core/blaze-runtime';

test('OnBlaze requires ready status and downstream owners; late registration retains EventBarn state and native edge latch',()=>{
 const input=fs.readFileSync('/root/sky-research/original-runtime-corpus/Levels/Rain/Objects.level.bin'),doc=new ObjectsDocument(input),owner=createViewportEnvironment(doc.nodes,undefined,{level:'Rain'}),target=doc.nodes.find(n=>n.className==='Marker'&&owner.info().objects.some(e=>e.id===n.id))!;let state!:PreparedEnvironmentObjectState;
 assert.equal(owner.info().events.find(e=>e.id===763)!.available,false);assert.match(owner.info().events.find(e=>e.id===763)!.reason,/资源 owner/);
 // Explicit prepared status + Marker target isolate the real OnBlaze body.
 // Rain's original AncientSpirit chain remains unsupported, not remapped in saved data.
 const old=owner.info().events.filter(e=>e.available).map(e=>({id:e.id,starts:e.starts,running:e.running,pending:e.pending}));owner.attachBlazeStatusServices(objects=>{state=objects;const m=state.runtimeMemory,on=state.require(763),blaze=m.read64(on.pointer+56n);resetOriginalBlaze(m,blaze,0);m.write8(blaze+0x98n,0);m.write64(on.pointer+64n,state.objectPointer(target.id));state.setEnabled(target.id,false);return id=>id===1626;});const m=state.runtimeMemory,on=state.require(763),blaze=m.read64(on.pointer+56n);assert.equal(owner.info().events.find(e=>e.id===763)!.available,true);
 assert.deepEqual(owner.info().events.filter(e=>old.some(p=>p.id===e.id)).map(e=>({id:e.id,starts:e.starts,running:e.running,pending:e.pending})),old);
 // Keep the event continuous to exercise activation/deactivation edge latch.
 m.write8(on.pointer+72n,0);owner.trigger(763);assert.equal(state.enabled(target.id),false);m.write8(blaze+86n,1);owner.advance({delta:0,timeScale:1});assert.equal(state.enabled(target.id),true);assert.equal(m.bytes(on.pointer+74n,1)[0],1);
 state.setEnabled(target.id,false);owner.advance({delta:0,timeScale:1});assert.equal(state.enabled(target.id),false);m.write8(blaze+86n,0);owner.advance({delta:0,timeScale:1});assert.equal(m.bytes(on.pointer+74n,1)[0],0);m.write8(blaze+86n,1);owner.advance({delta:0,timeScale:1});assert.equal(state.enabled(target.id),true);
 assert.deepEqual(Buffer.from(doc.serialize()),input);owner.dispose();assert.ok(owner.info().events.every(e=>!e.running&&!e.pending));
});

test('Real Rain/Night OnBlaze chains remain blocked until original resources and all downstream lifecycles exist',()=>{
 for(const level of ['Rain','Night']){const doc=new ObjectsDocument(fs.readFileSync(`/root/sky-research/original-runtime-corpus/Levels/${level}/Objects.level.bin`)),owner=createViewportEnvironment(doc.nodes,undefined,{level});owner.attachBlazeStatusServices(()=>()=>true);const events=owner.info().events.filter(e=>e.kind==='OnBlaze');assert.equal(events.length,level==='Rain'?1:4);assert.ok(events.every(e=>!e.available));assert.ok(events.every(e=>/真实 Flame|下游生命周期/.test(e.reason)));owner.dispose();}
});
