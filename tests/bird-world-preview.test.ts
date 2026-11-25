import test from 'node:test';import assert from 'node:assert/strict';import fs from 'node:fs';
import {ObjectsDocument} from '../src/core/objects';import {BirdWorldPreview} from '../src/core/bird-world-preview';
import {originalCreatureArithmetic} from '../src/core/creature-arithmetic-capability';
import capability from '../docs/creature-arithmetic-capability.json';
import {natureArithmetic} from '../src/core/nature-event-runtime';
test('Creature arithmetic capability preserves all captured signed quiet-NaN results and rejects unobserved payloads',()=>{
 const a=natureArithmetic(originalCreatureArithmetic),ops=['add','sub','mul','div'] as const;
 for(const [op,x,y,result] of capability.rows)assert.equal(a[ops[op]](x,y),result);
 assert.throws(()=>a.add(0x7fc01234,0xffc00000),/outside the captured/);
});
test('DuskGraveyard ray keeps finite movement when SIMD padding produces opposite NaN signs',()=>{
 const nodes=new ObjectsDocument(fs.readFileSync('/root/sky-research/original-runtime-corpus/Levels/DuskGraveyard/Objects.level.bin')).nodes;
 for(const delta of [.016,.266]){
  const owner=new BirdWorldPreview(nodes,[1096],{raycast:()=>({hit:false,active:false,position:new Uint8Array(16),normal:new Uint8Array(16)})});
  const before=owner.snapshot(1096)!;
  for(let i=0;i<40;i++){owner.step(delta);const state=owner.snapshot(1096)!;assert.equal(state.error,undefined);assert.ok([...state.position,...state.velocity,...state.transform].every(Number.isFinite));}
  assert.notDeepEqual(owner.snapshot(1096)!.position,before.position);owner.reset();assert.deepEqual(owner.snapshot(1096)!.position,before.position);owner.dispose();
 }
});
test('Saved Dawn birds use native targets, separate flight state and restorable motion',()=>{
 const nodes=new ObjectsDocument(fs.readFileSync('/root/sky-research/original-runtime-corpus/Levels/Dawn/Objects.level.bin')).nodes,ids=nodes.filter(n=>n.className==='BirdV2').slice(0,8).map(n=>n.id);let queries=0;
 const owner=new BirdWorldPreview(nodes,ids,{raycast:()=>{queries++;return {hit:false,active:false,position:new Uint8Array(16),normal:new Uint8Array(16)};}}),initial=ids.map(id=>owner.snapshot(id)!);
 for(let i=0;i<80;i++)owner.step(.016);
 const moving=ids.map(id=>owner.snapshot(id)!);assert.ok(moving.every(s=>!s.error&&s.position.every(Number.isFinite)&&s.transform.every(Number.isFinite)));assert.ok(moving.some((s,i)=>JSON.stringify(s.position)!==JSON.stringify(initial[i].position)));assert.ok(queries>0);assert.ok(moving.some(s=>s.target!==undefined));assert.notDeepEqual(moving[0].velocity,moving[1].velocity);
 for(const s of moving){assert.ok(s.weights.every(v=>v>=0&&v<=1));assert.ok(Math.abs(s.weights[0]+s.weights[1]-1)<1e-6);}
 owner.reset();for(let i=0;i<ids.length;i++)assert.deepEqual(owner.snapshot(ids[i])?.position,initial[i].position);owner.step(.016);assert.ok(ids.every(id=>!owner.snapshot(id)?.error));owner.dispose();
});
