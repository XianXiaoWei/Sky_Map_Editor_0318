import test from 'node:test';
import assert from 'node:assert/strict';
import {candleRenderScratch} from '../src/main/candle-render-scratch';

test('empty CandleBarn balances all three zero-byte native allocations',()=>{
 const arena=candleRenderScratch(0x1000n,16384);
 const pointers=arena.allocate(0,8),statuses=arena.allocate(0,4),spheres=arena.allocate(0,16);
 arena.free(spheres);arena.free(statuses);arena.free(pointers);
 assert.equal(arena.pending,0);
 assert.throws(()=>arena.free(pointers),/not owned/);
});

test('zero-byte requests can share an address with a live positive allocation',()=>{
 const arena=candleRenderScratch(0x1000n,32);
 const empty=arena.allocate(0,8),data=arena.allocate(8,8);
 arena.free(empty);assert.equal(arena.pending,1);
 arena.free(data);assert.equal(arena.pending,0);
});

test('scratch retains aligned positive ranges, exhaustion and ownership checks',()=>{
 const arena=candleRenderScratch(0x1000n,32);
 const first=arena.allocate(3,4),second=arena.allocate(8,16);
 assert.equal(first,0x1000n);assert.equal(second,0x1010n);
 assert.throws(()=>arena.allocate(9,8),/exhausted/);
 assert.throws(()=>arena.free(0x1004n),/not owned/);
 arena.free(second);arena.free(first);assert.equal(arena.pending,0);
 arena.reset();assert.equal(arena.allocate(32,16),0x1000n);
});
