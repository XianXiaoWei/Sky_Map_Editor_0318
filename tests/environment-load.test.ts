import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import fixture from './fixtures/env-load-native.json';
import fields from '../docs/environment-runtime.json';
import load from '../docs/environment-load.json';
import { ObjectsDocument } from '../src/core/objects';
import { createQueuedEnvironmentRuntime, describeLevelEnvironment, ENV_GLOBAL_GROUP_ORDER } from '../src/core/environment-level';
import { EnvironmentRuntime, initializeEnvFade, type EnvRuntimeNode } from '../src/core/environment-runtime';
import { type EnvValue, type EnvFieldType } from '../src/core/environment';

interface LoadCase {
  level: string;
  outputs: Record<string, string>[];
  queueOffsets: number[];
  loadResetHex: string;
  nodes: { id: number; enabled: boolean; layer: number; timing: { fadeIn: number; fadeOut: number; duration: number };
    hull: { position: number[]; quaternion: number[]; scale: number[]; falloff: number };
    values: Record<string, Record<string, string>>; nativeFields: Record<string, string>[]; nativeInitialStates: string[] }[];
  frames: { delta: number; timeScale: number; debugEnabled: boolean; debugScale: number; enabledMask: number; point: number[];
    outputs: Record<string, string>[]; states: { enabled: boolean; nativeHex: string[] }[] }[];
}
// JSON inference adds undefined properties to heterogeneous group objects.
const native = fixture as unknown as { globalOrder: number[]; cases: LoadCase[] };

function decode(bytes: string, tag: number): EnvValue {
  const b = Buffer.from(bytes, 'hex');
  return tag === 11 ? b.readUInt8() : tag === 5 ? b.readUInt32LE() : b.length === 16 ? Array.from({ length: 4 }, (_, i) => b.readFloatLE(i*4)) : b.readFloatLE();
}
function encode(value: EnvValue, tag: number, size: number) {
  const b = Buffer.alloc(size);
  if (Array.isArray(value)) value.forEach((n, i) => b.writeFloatLE(n, i*4));
  else if (tag === 11) b.writeUInt8(value); else if (tag === 5) b.writeUInt32LE(value); else b.writeFloatLE(value);
  return b.toString('hex');
}
function values(g: number, encoded: Record<string, string>) {
  return Object.fromEntries(fields.groups[g].fields.map(field => [field.name, decode(encoded[field.name], field.tag)]));
}
function initialOutputs(c: typeof native.cases[number]) {
  return Object.fromEntries(fields.groups.map((g, i) => [g.className, values(i, c.outputs[i])]));
}
function verifyFrames(engine: EnvironmentRuntime, c: typeof native.cases[number]) {
  for (const [frameIndex, frame] of c.frames.entries()) {
    if (frame.enabledMask !== 0xffffffff) c.nodes.forEach((node, i) => engine.setEnabled(node.id, !!((frame.enabledMask >>> i) & 1)));
    const actual = engine.update(frame, frame.point);
    for (const v of actual.variables) {
      const g = fields.groups.findIndex(group => group.className === v.name);
      for (const field of fields.groups[g].fields) assert.equal(encode(v.values[field.name], field.tag, field.bytes), frame.outputs[g][field.name], `${c.level} frame=${frameIndex} ${v.name}.${field.name}`);
    }
    for (const [i, node] of actual.nodes.entries()) {
      assert.equal(node.enabled, frame.states[i].enabled, `${c.level} frame=${frameIndex} #${node.id} enabled`);
      node.states.forEach((state, v) => {
        const g = fields.groups.findIndex(group => group.className === engine.variables[v].name), b = Buffer.alloc(16);
        b.writeFloatLE(state.remaining); b.writeFloatLE(state.alpha, 4); b.writeUInt8(Number(state.wasEnabled), 8);
        assert.equal(b.toString('hex'), frame.states[i].nativeHex[g], `${c.level} frame=${frameIndex} #${node.id} group=${g}`);
      });
    }
  }
}

test('Original module sort/dispatch and full EnvNode load chain match 33 maps, 40 fields and 396 frames', () => {
  assert.equal(native.cases.length, 33);
  assert.equal(native.cases.reduce((n, c) => n + c.nodes.length, 0), 134);
  assert.deepEqual(ENV_GLOBAL_GROUP_ORDER, native.globalOrder.map(g => fields.groups[g].className));
  assert.deepEqual(native.globalOrder, [0, 1, 2, 3, 4, 5, 7, 6]);
  for (const c of native.cases) {
    const reset = Buffer.from(c.loadResetHex, 'hex');
    assert.ok(reset.subarray(0, 64).every(byte => byte === 0), `${c.level} cleared default pointers`);
    for (let g=0; g<8; g++) for (let layer=0; layer<4; layer++) assert.equal(reset.readUInt32LE(64+g*16+layer*4), c.nodes.filter(node => node.layer === layer).length, `${c.level} load count g=${g} layer=${layer}`);
    assert.equal(reset.readUInt32LE(192), c.nodes.length); assert.equal(reset.readUInt32LE(196), 0);
    assert.deepEqual(c.queueOffsets, c.nodes.map((_, i) => load.queue.environmentOffset + i*load.queue.stride));
    const outputs = initialOutputs(c), variables = native.globalOrder.map(g => ({ name: fields.groups[g].className,
      fields: fields.groups[g].fields.map(field => ({ name: field.name, type: field.tag as EnvFieldType })), output: outputs[fields.groups[g].className] }));
    const nodes: EnvRuntimeNode[] = c.nodes.map(node => ({ id: node.id, layer: node.layer, enabled: node.enabled, hull: node.hull, timing: node.timing,
      values: Object.fromEntries(fields.groups.map((g, i) => [g.className, values(i, node.values[g.className])])) }));
    for (const node of c.nodes) {
      for (const [g, spec] of fields.groups.entries()) assert.deepEqual(node.nativeFields[g], node.values[spec.className], `${c.level} #${node.id} native conversion ${spec.className}`);
      const state = initializeEnvFade(node.enabled, node.timing.duration), b = Buffer.alloc(32);
      [node.hull.falloff, node.timing.fadeIn, node.timing.fadeOut, node.timing.duration, state.remaining, state.alpha].forEach((n, i) => b.writeFloatLE(n, i*4)); b.writeUInt8(Number(state.wasEnabled), 24);
      for (const expected of node.nativeInitialStates) assert.equal(b.toString('hex'), expected, `${c.level} #${node.id} load state`);
    }
    verifyFrames(new EnvironmentRuntime(variables, nodes), c);
  }
});

const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
test('Real TGCL adapter preserves file queue order and requires explicit initialized outputs', { skip: !fs.existsSync(data) }, () => {
  for (const c of native.cases) {
    const doc = new ObjectsDocument(fs.readFileSync(path.join(data, 'Levels', c.level, 'Objects.level.bin'))), plan = describeLevelEnvironment(doc.nodes);
    assert.equal(plan.complete, true, `${c.level}: ${plan.issues}`);
    assert.deepEqual(plan.queue.map(entry => entry.nodeId), c.nodes.map(node => node.id));
    assert.deepEqual(plan.queue.map(entry => entry.nativeOffset), c.queueOffsets);
    for (const [i, entry] of plan.queue.entries()) for (const group of entry.groups) {
      assert.deepEqual(Object.fromEntries(group.fields.map(field => [field.name, field.rawHex])), c.nodes[i].values[group.className]);
    }
    assert.throws(() => createQueuedEnvironmentRuntime(doc.nodes, {}), /全局环境输出/);
    if (c.level === 'Dawn') verifyFrames(createQueuedEnvironmentRuntime(doc.nodes, initialOutputs(c)), c);
  }
});

test('EnvNode queue diagnostics reject incomplete regions and original pool overflow', () => {
  const blank = { id: 0, name: 'blank', classIndex: 0, className: 'EnvNode', offset: 0, length: 0, fields: [] };
  const incomplete = describeLevelEnvironment([blank]); assert.equal(incomplete.complete, false);
  assert.throws(() => createQueuedEnvironmentRuntime([blank], {}), /不完整/);
  const overflow = Array.from({ length: 17 }, (_, id) => ({ ...blank, id }));
  assert.ok(describeLevelEnvironment(overflow).issues.some(issue => issue.includes('16')));
});
