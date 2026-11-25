import test from 'node:test';
import assert from 'node:assert/strict';
import fixture from './fixtures/cloud-card-facing-native.json';
import { cloudCardInverse } from '../src/core/cloud-card-inverse';
import { cloudCardFacingPlan } from '../src/core/cloud-card-facing';

const hex=(v:number[])=>{const b=Buffer.alloc(v.length*4);v.forEach((n,i)=>b.writeFloatLE(n,i*4));return b.toString('hex');};
const decode=(value:string)=>{const b=Buffer.from(value,'hex');return Array.from({length:b.length/4},(_,i)=>b.readFloatLE(i*4));};
function compare(actual:string,expected:string,name:string) {
  assert.equal(actual.length,expected.length,name);
  for(let i=0;i<expected.length;i+=8)assert.equal(actual.slice(i,i+8),expected.slice(i,i+8),`${name} component ${i/8}`);
}

test('CloudCard full inverse and four-lane local camera direction match original instructions bit for bit', () => {
  for (const c of fixture.cases) {
    // JSON numeric arrays lose negative-zero signs; native binary inputs are
    // authoritative for bit-exact matrix and scratch direction comparisons.
    const flat=decode(c.worldsHex),worlds=c.worlds.map((_,i)=>flat.slice(i*16,i*16+16));
    const inverses=worlds.map(cloudCardInverse);
    compare(hex(inverses.flat()),c.inversesHex,c.name);
    const facing=cloudCardFacingPlan(inverses,c.visibleOrder,decode(c.eyeHex));
    assert.deepEqual(facing.map(v=>v.sourceIndex),c.visibleOrder,c.name);
    compare(hex(facing.flatMap(v=>v.direction)),c.directionsHex,c.name);
  }
});

test('CloudCard rendering rejects unusable inverse matrices, duplicate visible cards and non-finite eyes', () => {
  const identity=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
  assert.throws(()=>cloudCardInverse(new Array(16).fill(0)));
  assert.throws(()=>cloudCardInverse(new Array(16).fill(Infinity)));
  assert.throws(()=>cloudCardInverse([]));
  assert.throws(()=>cloudCardFacingPlan([identity],[0,0],[0,1,0]));
  assert.throws(()=>cloudCardFacingPlan([identity],[1],[0,1,0]));
  assert.throws(()=>cloudCardFacingPlan([identity],[0],[NaN,1,0]));
  assert.deepEqual(cloudCardFacingPlan([],[],[0,0,0]),[]);
});
