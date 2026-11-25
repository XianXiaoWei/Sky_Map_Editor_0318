import test from 'node:test';
import assert from 'node:assert/strict';
import native from './fixtures/env-lerp-native.json';
import spatial from './fixtures/env-spatial-native.json';
import fades from './fixtures/env-fade-native.json';
import conversions from './fixtures/env-vars-native.json';
import runtime from './fixtures/env-runtime-native.json';
import clumps from './fixtures/env-clump-native.json';
import fs from 'node:fs';
import path from 'node:path';
import { EnvironmentRuntime, initializeEnvFade } from '../src/core/environment-runtime';
import { convertEnvironmentStorage, describeEnvironment, type EnvironmentClass } from '../src/core/environment-storage';
import type { ObjectNode } from '../src/core/objects';
import { ObjectsDocument } from '../src/core/objects';
import { describeEnvironmentRegion } from '../src/core/environment-regions';
import { blendEnvLayers, envClumpWeight, EnvFieldType, envHullWeight, lerpEnvField, stepEnvFade } from '../src/core/environment';

function unpack(tag: number, hex: string) {
  const b = Buffer.from(hex, 'hex');
  if (tag === 0) return b.readInt8(); if (tag === 1 || tag === 11) return b.readUInt8();
  if (tag === 2) return b.readInt16LE(); if (tag === 3) return b.readUInt16LE();
  if (tag === 4) return b.readInt32LE(); if (tag === 5) return b.readUInt32LE();
  if (tag === 6) return b.readFloatLE(); if (tag === 7) return b.readDoubleLE();
  return Array.from({ length: 4 }, (_, i) => b.readFloatLE(i * 4));
}
function pack(tag: number, value: number | number[]) {
  const b = Buffer.alloc(16);
  if (Array.isArray(value)) value.forEach((n, i) => b.writeFloatLE(n, i * 4));
  else if (tag === 0) b.writeInt8(value); else if (tag === 1 || tag === 11) b.writeUInt8(value);
  else if (tag === 2) b.writeInt16LE(value); else if (tag === 3) b.writeUInt16LE(value);
  else if (tag === 4) b.writeInt32LE(value); else if (tag === 5) b.writeUInt32LE(value);
  else if (tag === 6) b.writeFloatLE(value); else if (tag === 7) b.writeDoubleLE(value);
  return b.toString('hex');
}
test('All 12 interpolation branches reproduce the original x64 machine code byte for byte', () => {
  assert.equal(native.cases.length, 396);
  for (const c of native.cases) {
    const weight = Buffer.from(c.weightHex, 'hex').readFloatLE();
    const actual = lerpEnvField(c.tag, unpack(c.tag, c.aHex), unpack(c.tag, c.bHex), weight);
    assert.equal(pack(c.tag, actual), c.outHex, `native tag=${c.tag}, weight=${weight}, a=${c.aHex}, b=${c.bHex}`);
  }
});
test('Environment layers preserve native threshold, type rules and sequential override', () => {
  const fields = [{ name: 'density', type: EnvFieldType.Float32 }, { name: 'enabled', type: EnvFieldType.Bool }, { name: 'color', type: EnvFieldType.Color }];
  const defaults = { density: 10, enabled: 0, color: [1, 1, 1, 1] };
  const result = blendEnvLayers(fields, defaults, [
    [{ weight: .25, values: { density: 0, enabled: 1, color: [0, 0, 0, 1] } }, { weight: .25, values: { density: 4, enabled: 0, color: [0, 0, 0, 1] } }],
    [{ weight: 2, values: { density: 8, enabled: 1, color: [2, -1, 3, 1] } }],
    [{ weight: .00001, values: { density: 99, enabled: 0, color: [99, 99, 99, 1] } }], [],
  ]);
  assert.deepEqual(result.sums, [.5, 2, 0, 0]); assert.equal(result.values.density, 8);
  assert.equal(result.values.enabled, 1); assert.deepEqual(result.values.color, [2, -1, 3, 1]);
  assert.throws(() => blendEnvLayers(fields, {}, [[], [], [], []]), /默认/);
  assert.throws(() => blendEnvLayers(fields, defaults, [[], []]), /四层/);
});

test('EnvNode spatial falloff matches original x64 code including rotated bounds, tolerance and fade', () => {
  for (const c of spatial.cases) {
    const bytes = Buffer.from(c.inputHex, 'hex'), p = Array.from({ length: 18 }, (_, i) => bytes.readFloatLE(i * 4));
    const weight = envHullWeight(p.slice(12, 16), { position: p.slice(0, 4), quaternion: p.slice(4, 8), scale: p.slice(8, 12), falloff: p[16] }, p[17]);
    const actual = Buffer.alloc(4); actual.writeFloatLE(weight);
    assert.equal(actual.toString('hex'), c.outHex, `native spatial ${c.inputHex}`);
  }
});

test('EnvNode activation timer, auto-disable and fade match original x64 state changes', () => {
  for (const c of fades.cases) {
    const bytes = Buffer.from(c.inputHex, 'hex'), p = Array.from({ length: 8 }, (_, i) => bytes.readFloatLE(i * 4));
    const result = stepEnvFade({ remaining: p[4], alpha: p[5], enabled: !!p[6], wasEnabled: !!p[7] }, { fadeIn: p[1], fadeOut: p[2], duration: p[3] }, p[0]);
    const actual = Buffer.alloc(16); [result.remaining, result.alpha, Number(result.enabled), Number(result.wasEnabled)].forEach((n, i) => actual.writeFloatLE(n, i * 4));
    assert.equal(actual.toString('hex'), c.outHex, `native fade ${c.inputHex}`);
  }
});

test('EnvNode, SetEnvDefault and SetEnvHull conversion preserves bytes and native derived fog fields', () => {
  for (const c of conversions.cases) {
    const actual = convertEnvironmentStorage(c.className as EnvironmentClass, Buffer.from(c.inputHex, 'hex'));
    assert.equal(Buffer.from(actual).toString('hex'), c.outHex, `native ${c.className}`);
  }
});

test('Original registration and complete frame update/mix agree across 12 tags and shared-node state changes', () => {
  assert.equal(runtime.cases.length, 96);
  for (const [caseIndex, c] of runtime.cases.entries()) {
    const variables = c.outputsHex.map((output, v) => ({ name: `v${v}`, fields: [{ name: 'field', type: c.tag }], output: { field: unpack(c.tag, output) }, defaults: c.defaultsHex ? { field: unpack(c.tag, c.defaultsHex[v]) } : undefined }));
    const nodes = c.nodes.map((node, id) => ({ id, enabled: node.enabled, layer: node.layer,
      hull: { position: node.position, quaternion: node.quaternion, scale: node.scale, falloff: node.falloff },
      timing: { fadeIn: node.fadeIn, fadeOut: node.fadeOut, duration: node.duration },
      values: Object.fromEntries(node.valuesHex.map((hex, v) => [`v${v}`, { field: unpack(c.tag, hex) }])) }));
    const engine = new EnvironmentRuntime(variables, nodes);
    for (const node of c.nodes) for (const expected of node.initialNativeHex) {
      const state = initializeEnvFade(node.enabled, node.duration), b = Buffer.alloc(32);
      [node.falloff, node.fadeIn, node.fadeOut, node.duration, state.remaining, state.alpha].forEach((n, i) => b.writeFloatLE(n, i*4));
      b.writeUInt8(Number(state.wasEnabled), 24);
      assert.equal(b.toString('hex'), expected, `registration scenario=${caseIndex}`);
    }
    for (const [frameIndex, frame] of c.frames.entries()) {
      if (frame.enabledMask !== 0xffffffff) nodes.forEach(node => engine.setEnabled(node.id, !!((frame.enabledMask >>> node.id) & 1)));
      const actual = engine.update(frame, frame.point);
      actual.variables.forEach((v, i) => assert.equal(pack(c.tag, v.values.field), frame.outputsHex[i], `scenario=${caseIndex}, frame=${frameIndex}, variable=${i}`));
      actual.nodes.forEach((node, j) => {
        assert.equal(node.enabled, frame.states[j].enabled, `enabled scenario=${caseIndex}, frame=${frameIndex}, node=${j}`);
        node.states.forEach((state, v) => {
          const b = Buffer.alloc(16); b.writeFloatLE(state.remaining); b.writeFloatLE(state.alpha, 4); b.writeUInt8(Number(state.wasEnabled), 8);
          assert.equal(b.toString('hex'), frame.states[j].nativeHex[v], `state scenario=${caseIndex}, frame=${frameIndex}, node=${j}, variable=${v}`);
        });
      });
    }
  }
});

test('TGCL default tags fill absent fields, preserve saved bytes and keep three-component Color alpha zero', () => {
  const node: ObjectNode = { id: 0, name: 'test', classIndex: 0, className: 'EnvNode', offset: 0, length: 0, fields: [] };
  const defaults = describeEnvironment(node);
  assert.equal(defaults.derived[1].value, Math.fround(1 / Math.fround(3000 - 30)));
  assert.deepEqual(defaults.groups.find(group => group.className === 'AmbienceSun')!.fields.find(field => field.name === 'sunColor')!.value, [1, 1, 1, 0]);
  assert.equal(defaults.registration!.state.alpha, 1);
  assert.ok(defaults.groups.every(group => group.complete));
  const raw = Buffer.alloc(4); raw.writeFloatLE(9000);
  node.fields.push({ id: 'n0/p0', name: 'cheapFogFar', kind: 'bits32', offset: 0, length: 4, value: null, raw: raw.toString('hex') });
  const saved = describeEnvironment(node);
  assert.ok(!saved.defaultsApplied.some(field => field.name === 'cheapFogFar'));
  assert.equal(saved.derived[1].value, Math.fround(1 / Math.fround(9000 - 30)));
  assert.equal(node.fields[0].raw, raw.toString('hex'));
  // SetEnvDefault intentionally has a different bloom default than EnvNode.
  assert.equal(describeEnvironment({ ...node, className: 'SetEnvDefault', fields: [] }).groups.find(group => group.className === 'AmbienceBloom')!.fields.find(field => field.name === 'intensity')!.value, Math.fround(.03));
});

test('Clump Marker union matches original checked-cast x64 spatial branch byte for byte', () => {
  for (const [i, c] of clumps.spatial.entries()) {
    const actual = Buffer.alloc(4); actual.writeFloatLE(envClumpWeight(c.point, c.markers, c.falloff, c.alpha));
    assert.equal(actual.toString('hex'), c.outHex, `Clump spatial case=${i}`);
  }
});

test('Clump fade and expiry follow first Marker, including disabled secondary markers', () => {
  for (const [i, c] of clumps.fades.entries()) {
    const result = stepEnvFade({ ...c.state, enabled: c.markers[0].enabled }, c.timing, c.delta);
    const actual = Buffer.alloc(16);
    [result.remaining, result.alpha, Number(result.enabled), Number(result.wasEnabled)].forEach((n, j) => actual.writeFloatLE(n, j*4));
    assert.equal(actual.toString('hex'), c.outHex, `Clump fade case=${i}`);
  }
});

test('Clump registration and full multi-variable update/mix match the original native pipeline', () => {
  for (const [scenario, c] of clumps.runtime.entries()) {
    const variables = c.outputsHex.map((hex, v) => ({ name: `v${v}`, fields: [{ name: 'field', type: c.tag }], output: { field: unpack(c.tag, hex) }, defaults: { field: unpack(c.tag, c.defaultsHex[v]) } }));
    const engine = new EnvironmentRuntime(variables, [{ id: 0, markers: c.markers, falloff: c.timing.falloff, layer: c.layer, timing: c.timing,
      values: Object.fromEntries(c.valuesHex.map((hex, v) => [`v${v}`, { field: unpack(c.tag, hex) }])) }]);
    const state = initializeEnvFade(c.markers[0].enabled, c.timing.duration), initial = Buffer.alloc(32);
    [c.timing.falloff, c.timing.fadeIn, c.timing.fadeOut, c.timing.duration, state.remaining, state.alpha].forEach((n, i) => initial.writeFloatLE(n, i*4));
    initial.writeUInt8(Number(state.wasEnabled), 24);
    for (const expected of c.initialNativeHex) assert.equal(initial.toString('hex'), expected, `Clump registration scenario=${scenario}`);
    for (const [frameIndex, frame] of c.frames.entries()) {
      if (frame.enabledMask !== 0xffffffff) engine.setEnabled(0, !!(frame.enabledMask & 1));
      const actual = engine.update(frame, frame.point);
      actual.variables.forEach((v, i) => assert.equal(pack(c.tag, v.values.field), frame.outputsHex[i], `Clump scenario=${scenario}, frame=${frameIndex}, variable=${i}`));
      assert.equal(actual.nodes[0].enabled, frame.enabled, `Clump enabled scenario=${scenario}, frame=${frameIndex}`);
      actual.nodes[0].states.forEach((s, v) => {
        const b = Buffer.alloc(16); b.writeFloatLE(s.remaining); b.writeFloatLE(s.alpha, 4); b.writeUInt8(Number(s.wasEnabled), 8);
        assert.equal(b.toString('hex'), frame.statesHex[v], `Clump state scenario=${scenario}, frame=${frameIndex}, variable=${v}`);
      });
    }
  }
});

test('Clump entries sharing the first Marker share expiry and reject empty registration', () => {
  const variables = [{ name: 'fog', fields: [{ name: 'density', type: EnvFieldType.Float32 }], output: { density: 0 }, defaults: { density: 0 } }];
  const marker = { id: 7, enabled: true, position: [0,0,0,0], quaternion: [0,0,0,1], scale: [2,2,2,0] };
  const node = { markers: [marker], falloff: 1, layer: 0, timing: { fadeIn: .2, fadeOut: .3, duration: .01 }, values: { fog: { density: 10 } } };
  const engine = new EnvironmentRuntime(variables, [{ ...node, id: 0 }, { ...node, id: 1, markers: [structuredClone(marker)] }]);
  engine.update({ delta: .02, timeScale: 1 }, [0,0,0,1]);
  assert.ok(engine.nodes.every(n => !n.markers![0].enabled));
  engine.setEnabled(1, true); assert.equal(engine.nodes[0].markers![0].enabled, true);
  assert.throws(() => new EnvironmentRuntime(variables, [{ ...node, id: 0, markers: [] }]), /至少/);
});

test('Real Storm hull references resolve to original Marker transforms and first-marker state without writes', () => {
  const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
  const source = fs.readFileSync(path.join(data, 'Levels', 'Storm', 'Objects.level.bin')), doc = new ObjectsDocument(source);
  const hulls = doc.nodes.filter(node => node.className === 'SetEnvHull'); assert.equal(hulls.length, 3);
  const descriptions = hulls.map(node => describeEnvironmentRegion(node, doc.nodes)!);
  assert.deepEqual(descriptions.map(d => d.controllerNodeId), [206,997,680]);
  assert.deepEqual(descriptions.map(d => d.registration!.state.enabled), [true,false,true]);
  assert.ok(descriptions.every(d => d.complete && d.markers.length === 1));
  assert.deepEqual(descriptions[0].markers[0].position, [-8.468304634094238,311.0396423339844,-135.48675537109375,0]);
  const broken = structuredClone(doc.nodes), clump = broken.find(node => node.id === descriptions[0].hullNodeId)!;
  clump.fields[0].children![0].value = 0xffffffff;
  const invalid = describeEnvironmentRegion(hulls[0], broken)!; assert.equal(invalid.complete, false); assert.equal(invalid.registration, null);
  assert.ok(invalid.issues.some(issue => issue.includes('Marker')));
  assert.deepEqual(doc.serialize(), source);
});
