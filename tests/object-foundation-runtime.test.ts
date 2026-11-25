import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import zlib from 'node:zlib';
import { evaluateFoundation, type FoundationResult } from '../tools/object-foundation-evaluate';
import type { FoundationCase } from '../tools/object-foundation-cases';
const fixture: { cases: { input: FoundationCase; native: FoundationResult }[] } = JSON.parse(zlib.gunzipSync(fs.readFileSync('tests/fixtures/object-foundation-native.json.gz')).toString());
for (const [kind, name] of ['metadata ID limit and missing slots', 'case-sensitive type names across all declared classes', 'vptr repair cache, fallback, validation and virtual-call order', 'Float placement retains all other bytes and original corpus values', 'Float heap size and retained allocation bytes', 'Float null-safe release', 'Float construction and dependent multiplication with aliases', 'ObjectFactory creation, base factory, signatures, casts and failures', 'ObjectFactory release, null object, fallback and diagnostic re-query', 'ObjectFactory signed priority and failed Module conversion', 'ValueBarn all 80 free slots and preserved Module/Heap bytes', 'ValueBarn create, exhaustion and cast failure after pop', 'ValueBarn null/backlink release and slot-before-free order', 'ValueBarn unload clears slots before Heap reset', 'ValueBarn create to FloatMult, release, unload and recreate', 'ObjectFactory to ValueBarn, FloatMult, priority, release and reload', 'original EventBarn and ValueBarn creation to TGCL fields, deferred pointers, numeric events, release and failure snapshots', 'Event constructor preserves fields not written by the original', 'FloatMult placement includes Event construction and retains pointer fields', 'FloatAdd placement retains pointer and scalar fields', 'SetFloat placement defers progress initialization to load and activation'].entries()) {
  test(`Original Objects foundation: ${name}`, () => {
    const cases = fixture.cases.filter(c => c.input.kind === kind); assert.ok(cases.length);
    for (const c of cases) assert.deepEqual(evaluateFoundation(c.input,c.native.math), c.native, c.input.name);
  });
}

test('FloatMult automatic frames preserve alias feedback across stop and resume', () => {
  const row = fixture.cases.find(c => c.input.name === 'trigger-auto-multiply-alias-0-1-0-0');
  assert.ok(row?.native.frames);
  const states = row.native.frames.map(frame => Buffer.from(frame.objectHex, 'hex'));
  const a = Number(states[0].readBigUInt64LE(0xb8) - 0x240000000n);
  assert.deepEqual(states.map(state => state.readFloatLE(a + 0x10)), [1.25, -2.5, -2.5, -2.5, 5, -10]);
  assert.deepEqual(states.map(state => state[0xa3]), [0, 1, 0, 0, 1, 1]);
  assert.equal(row.native.loadHeapBaseline, 37);
  assert.deepEqual(evaluateFoundation(row.input), row.native);
});

test('FloatAdd without autoStart executes once per enable request and defaults output to target', () => {
  const row = fixture.cases.find(c => c.input.name === 'FloatAdd-auto-disabled-then-enable');
  assert.ok(row?.native.frames);
  const states = row.native.frames.map(frame => Buffer.from(frame.objectHex, 'hex'));
  const target = Number(states[0].readBigUInt64LE(0xb8) - 0x240000000n);
  assert.deepEqual(states.map(state => state.readFloatLE(target + 0x10)), [1.25, 1.25, 2, 2, 2.75]);
  assert.deepEqual(states.map(state => state[0xa3]), [0, 0, 0, 0, 0]);
});

test('FloatAdd observes aliased amount feedback and applies maximum before minimum', () => {
  const alias = fixture.cases.find(c => c.input.name === 'FloatAdd-auto-alias-1-1-1-0');
  assert.ok(alias?.native.frames);
  const states = alias.native.frames.map(frame => Buffer.from(frame.objectHex, 'hex'));
  const target = Number(states[0].readBigUInt64LE(0xb8) - 0x240000000n);
  assert.deepEqual(states.map(state => state.readFloatLE(target + 0x10)), [-2, -4, -8, -16, -32, -32, -64]);
  const clamp = fixture.cases.find(c => c.input.name === 'FloatAdd-auto-clamp-1-1-1');
  assert.ok(clamp?.native.frames);
  const clamped = clamp.native.frames.map(frame => Buffer.from(frame.objectHex, 'hex'));
  const clampedTarget = Number(clamped[0].readBigUInt64LE(0xb8) - 0x240000000n);
  assert.deepEqual(clamped.map(state => state.readFloatLE(clampedTarget + 0x10)), [1.25, 5, 5, 5, 5]);
});

test('SetFloat load clears progress and each enable captures the current target', () => {
  const row = fixture.cases.find(c => c.input.name === 'SetFloat-auto-load-enable-reset-recapture');
  assert.ok(row?.native.frames);
  const states = row.native.frames.map(frame => Buffer.from(frame.objectHex, 'hex'));
  assert.deepEqual(states.map(state => state.readFloatLE(0xd0)), [0, 0, 7, 7, 7, 7, 3, 3, 3]);
  assert.equal(states[0].readFloatLE(0xcc), 0);
  assert.equal(states[1].readFloatLE(0xcc), 0);
  assert.equal(states[4].readFloatLE(0xcc), states[3].readFloatLE(0xcc));
  assert.deepEqual(evaluateFoundation(row.input, row.native.math), row.native);
});

test('All real FloatAdd and SetFloat configurations run through registered trigger slots', () => {
  const actual = fixture.cases.filter(row => row.input.tgcl?.source && row.input.tgcl.eventClass);
  assert.equal(actual.filter(row => row.input.tgcl!.eventClass === 'FloatAdd').length, 31);
  assert.equal(actual.filter(row => row.input.tgcl!.eventClass === 'SetFloat').length, 4);
  for (const row of actual) {
    assert.equal(row.native.line, 0, row.input.name);
    assert.equal(row.native.frames?.length, 9, row.input.name);
    const state = Buffer.from(row.native.frames![0].objectHex, 'hex');
    assert.equal(state.readUInt32LE(0xa8), 1, row.input.name);
    assert.equal(state[0xa0], 1, row.input.name);
    assert.deepEqual(evaluateFoundation(row.input, row.native.math), row.native, row.input.name);
  }
});

test('FloatMult with autoStart false waits for an enable request', () => {
  const row = fixture.cases.find(c => c.input.name === 'trigger-auto-start-disabled-enable-stop-resume');
  assert.ok(row?.native.frames);
  const states = row.native.frames.map(frame => Buffer.from(frame.objectHex, 'hex'));
  const output = Number(states[0].readBigUInt64LE(0xc8) - 0x240000000n);
  assert.equal(states[0][0xa0], 1);
  assert.deepEqual(states.map(state => state.readFloatLE(output + 0x10)), [0.5, 0.5, -2.5, -2.5, -2.5, -2.5, -2.5, -2.5]);
  assert.deepEqual(states.map(state => state[0xa3]), [0, 0, 1, 1, 0, 0, 1, 1]);
  assert.deepEqual(evaluateFoundation(row.input), row.native);
});
