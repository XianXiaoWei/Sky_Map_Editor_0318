import test from 'node:test';
import assert from 'node:assert/strict';
import native from './fixtures/cloud-graph-native.json';
import { cloudRenderGraph } from '../src/core/cloud-render-graph';
import { sampledVulkanTarget } from '../src/main/vulkan-target';
import { cloudListRenderState } from '../src/core/cloud-render-state';

test('Cloud target dimensions, half storage and sampler states match the original allocation loop', () => {
  for (const capture of native.dimensions) {
    const graph = cloudRenderGraph(capture.viewport[0], capture.viewport[1]);
    for (const target of Object.values(graph.targets)) {
      const allocations = capture.allocations.filter(a => a.name === target.name);
      assert.equal(allocations.length, 1); // These cloud targets are not double buffered.
      assert.deepEqual(target.dimensions, [allocations[0].width, allocations[0].height, 1]);
      const resource = native.resources.find(r => r.name === target.name)!;
      assert.equal(target.format, resource.format);
      const sampler = native.samplers.find(s => s.index === resource.sampler)!;
      assert.equal(target.linear, sampler.linear);
      assert.deepEqual(sampler.metalWrap, [0, 0, 0]);
      assert.equal(target.repeat, false);
    }
  }
});

test('Sampled half targets reconstruct every finite half encoding without another rounding step', () => {
  const encodings: number[] = [], values: number[] = [];
  for (let code = 0; code < 65536; code++) {
    const exponent = code >>> 10 & 31, mantissa = code & 1023;
    if (exponent === 31) continue;
    const magnitude = exponent ? (1 + mantissa / 1024) * 2 ** (exponent - 15) : mantissa * 2 ** -24;
    encodings.push(code); values.push((code & 0x8000 ? -1 : 1) * magnitude, 0, 0, 1);
  }
  const target = { name: 'finite half fixture', dimensions: [256, 248, 1] as [number, number, number], format: 'r16f' as const, linear: false, repeat: false };
  const texture = sampledVulkanTarget(target, new Float32Array(values));
  const raw = new DataView(texture.data.buffer);
  assert.equal(raw.byteLength, encodings.length * 2);
  for (let i = 0; i < encodings.length; i++) assert.equal(raw.getUint16(i * 2, true), encodings[i]);
  assert.throws(() => sampledVulkanTarget(target, new Float32Array(4)), /尺寸/);
  assert.throws(() => sampledVulkanTarget({ ...target, dimensions: [1, 1, 1] }, new Float32Array([.3333, 0, 0, 1])), /量化/);
});

test('Original Cloud pass binds the preceding coarse level and queues Cloud after fine fullscreen', () => {
  const graph = cloudRenderGraph(127, 73);
  const passes = native.passes.filter(p => p.name.startsWith('Cloud'));
  assert.equal(passes.length, graph.passes.length);
  graph.passes.forEach((pass, i) => {
    const captured = passes[i];
    assert.equal(captured.draws[0].shader, pass.shader);
    assert.deepEqual(pass.outputs.map(t => t.name), captured.colors.map(c => native.resources[c.resource].name));
    assert.deepEqual(Object.entries(pass.inputs).map(([name, t]) => [name, t.name]),
      captured.draws[0].bindings!.map(b => [b.name, native.resources[b.resource].name]));
    assert.deepEqual(pass.followingLists, captured.draws.slice(1).map(d => d.name));
  });
  assert.equal(graph.opaqueCloud.shader, 'CloudCore');
  assert.equal(graph.opaqueCloud.target.name, 'rtCloudA');
  assert.throws(() => cloudRenderGraph(0, 73));
  assert.throws(() => cloudRenderGraph(127.5, 73));
});

test('Depth chain outputs and quad bindings match all three original Compositor descriptors', () => {
  const graph = cloudRenderGraph(127, 73), captures = native.passes.filter(p => p.name === 'Depth Downsample');
  assert.equal(captures.length, graph.depthPasses.length);
  graph.depthPasses.forEach((pass, i) => {
    const captured = captures[i];
    assert.equal(pass.shader, captured.draws[0].shader);
    assert.equal(pass.output.name, native.resources[captured.colors[0].resource].name);
    assert.deepEqual(Object.entries(pass.inputs).map(([name, target]) => [name, target!.name]),
      captured.draws[0].bindings!.map(b => [b.name, native.resources[b.resource].name]));
  });
  assert.equal(graph.depthPasses[2].globals.u_depthHalfTex!.name, 'rtDepthHalf');
});

test('Cloud list preserves original disabled depth/cull and separate RGB/alpha additive factors', () => {
  const state = cloudListRenderState(), captured = native.passes.find(p => p.name === 'Cloud')!.draws.find(d => d.kind === 'list')!;
  assert.equal(state.listIndex, 20); assert.equal(state.depth.index, captured.depthState);
  assert.equal(state.depth.test, false); assert.equal(state.depth.write, false);
  assert.equal(state.cullEnum, 0); assert.deepEqual(state.bias, [0, 0, 0]);
  assert.deepEqual(state.colors, captured.colors);
  assert.ok(state.colors.slice(0, 2).every(c => c.blend && c.rgbWrite && c.alphaWrite));
  assert.deepEqual(state.colors[0].factors, [6, 1, 1, 1]);
  assert.ok(state.colors.slice(2).every(c => !c.blend));
});
