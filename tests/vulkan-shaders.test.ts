import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import { compileVulkanShaders } from '../src/main/vulkan-shaders';
import { reflectSpirv, packSpirvUniforms, mergeSpirvDescriptors } from '../src/core/spirv';
import { bindVulkanMaterial } from '../src/main/vulkan-material';
import { vulkanMaterialSceneBytes, vulkanMaterialBatchBytes } from '../src/core/vulkan-protocol';
import { vulkanProgramSources, vulkanProgramColorFormats } from '../src/main/vulkan-program';
import { AssetCatalog } from '../src/main/assets';

const vertex = `#version 300 es
uniform mat3 u_basis;
uniform float u_gain[2];
uniform vec3 u_points[2];
uniform bool u_enabled;
uniform int u_index;
in vec3 a_position;
void main() { gl_Position = vec4(u_basis * a_position + u_points[u_index] * u_gain[0], u_enabled ? 1.0 : 2.0); }
`;
const fragment = `#version 300 es
precision highp float;
uniform sampler2D u_texture;
layout(location=0) out vec4 result;
void main() { result = texture(u_texture, vec2(0.5)); }
`;
test('Vulkan reserves the vertex-only UBO binding across stages, validates binaries and preserves cache integrity', async () => {
  const directory = await fs.mkdtemp(path.join(os.tmpdir(), 'sky-shader-test-'));
  try {
    const sources = [{ stage: 'vert' as const, text: vertex }, { stage: 'frag' as const, text: fragment }];
    const compiled = await compileVulkanShaders(sources, directory);
    assert.equal(compiled.success, true, compiled.log);
    assert.deepEqual(compiled.descriptors.map(d => [d.binding, d.kind]), [[0, 'uniform-buffer'], [1, 'combined-image-sampler']]);
    assert.equal(compiled.descriptors[1].type.dimension, '2D');
    assert.equal(compiled.artifacts[0].reflection.inputs[0].name, 'a_position');
    const block = compiled.descriptors[0].type;
    assert.deepEqual(block.members!.map(m => [m.name, m.offset, m.type.bytes]), [['u_basis', 0, 48], ['u_gain', 48, 32], ['u_points', 80, 32], ['u_enabled', 112, 4], ['u_index', 116, 4]]);
    const values = { u_basis: [1, 2, 3, 4, 5, 6, 7, 8, 9], u_gain: [.25, .5], u_points: [[11, 12, 13], [21, 22, 23]], u_enabled: true, u_index: 1 };
    const bytes = packSpirvUniforms(block, values), floats = new Float32Array(bytes.buffer), ints = new Uint32Array(bytes.buffer);
    assert.deepEqual(Array.from(floats.subarray(0, 28)), [1,2,3,0,4,5,6,0,7,8,9,0,.25,0,0,0,.5,0,0,0,11,12,13,0,21,22,23,0]);
    assert.equal(ints[28], 1); assert.equal(ints[29], 1); assert.equal(bytes.length, 128);
    assert.throws(() => packSpirvUniforms(block, { ...values, u_gain: undefined }), /缺少/);
    assert.throws(() => packSpirvUniforms(block, { ...values, u_index: .5 }), /数值/);
    assert.throws(() => packSpirvUniforms(block, { ...values, u_enabled: 'true' }), /数值/);
    const hit = await compileVulkanShaders(sources, directory); assert.equal(hit.cached, true); assert.equal(hit.key, compiled.key);
    await fs.writeFile(hit.artifacts[0].path, Buffer.alloc(20));
    const repaired = await compileVulkanShaders(sources, directory); assert.equal(repaired.success, true, repaired.log); assert.equal(repaired.cached, false);
    const input = { shader: 'fixture', stride: 12, vertices: new Uint8Array(new Float32Array([-.5,-.5,0,.5,-.5,0,0,.5,0]).buffer), indices: new Uint32Array([0,1,2]), state: 6, attributes: { a_position: { format: 'vec3' as const, offset: 0 } }, uniforms: values, textures: { u_texture: { format: 'rgba8' as const, dimensions: [1,1,1] as [number, number, number], linear: false, repeat: false, data: new Uint8Array([1,2,3,4]) } } };
    const scene = await bindVulkanMaterial(repaired, input), wire = vulkanMaterialSceneBytes(scene);
    assert.equal(wire.readUInt32LE(24), 6); assert.equal(scene.resources[1].data[2], 3); assert.equal(scene.attributes[0].format, 106);
    await assert.rejects(bindVulkanMaterial(repaired, { ...input, textures: {} }), /纹理/);
    await assert.rejects(bindVulkanMaterial(repaired, { ...input, attributes: { a_position: { format: 'vec2', offset: 0 } } }), /类型/);
    assert.throws(() => vulkanMaterialSceneBytes({ ...scene, indices: new Uint32Array([0,1,3]) }), /越界/);
    const batch = vulkanMaterialBatchBytes([scene, { ...scene, state: 8 }]);
    assert.equal(batch.readUInt32LE(0), 2);
    assert.equal(batch.readUInt32LE(4), wire.length);
    assert.throws(() => vulkanMaterialBatchBytes([]), /长度/);
    assert.throws(() => vulkanMaterialBatchBytes([scene, { ...scene, colorFormats: ['rgba16f'] }]), /附件不一致/);
    const d = compiled.descriptors[0];
    assert.throws(() => mergeSpirvDescriptors([{ stage: 'vert', entryPoint: 'main', inputs: [], outputs: [], descriptors: [d] }, { stage: 'frag', entryPoint: 'main', inputs: [], outputs: [], descriptors: [{ ...d, name: 'conflict' }] }]), /冲突/);
  } finally { await fs.rm(directory, { recursive: true, force: true }); }
});

test('SPIR-V malformed instruction streams are rejected before reflection', () => {
  assert.throws(() => reflectSpirv(new Uint8Array(3), 'vert'), /长度/);
  const words = new Uint32Array([0x07230203,0x10000,0,1,0,0]);
  assert.throws(() => reflectSpirv(new Uint8Array(words.buffer), 'vert'), /截断/);
});

test('GLES varying names share locations despite reordered declarations and unused vertex outputs', async () => {
  const sources=[{stage:'vert' as const,text:`#version 300 es
in vec3 a_position;
out vec4 v_unused;
out vec3 v_normal;
out vec4 v_light;
void main(){gl_Position=vec4(a_position,1);v_unused=vec4(0);v_normal=a_position;v_light=vec4(1);}`},
  {stage:'frag' as const,text:`#version 300 es
precision highp float;
in vec4 v_light;
in vec3 v_normal;
layout(location=0) out vec4 color;
void main(){color=vec4(v_normal,1)*v_light;}`}];
  const compiled=await compileVulkanShaders(sources);assert.equal(compiled.success,true,compiled.log);
  for(const compilation of [compiled,await compileVulkanShaders(sources)]) {
    const vertex=compilation.artifacts[0].reflection,fragment=compilation.artifacts[1].reflection;
    for(const input of fragment.inputs)assert.equal(vertex.outputs.find(o=>o.name===input.name)?.location,input.location);
  }
});

test('Runtime cloud and depth materials resolve embedded AIR only for the exact original shader pair', () => {
  const catalog = new AssetCatalog(process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data');
  for (const name of ['CloudCore', 'CloudFluffySuperCoarse', 'CloudFluffyCoarse', 'CloudFluffy', 'DepthDownsample', 'DepthDownsampleGather', 'DepthDownsampleQuarter', 'CloudCard', 'CloudQuadParticleFluffy']) {
    const program = catalog.program(name), sources = vulkanProgramSources(program);
    assert.ok(sources.every(s => s.format === 'vulkan450' && s.text.startsWith('#version 450\n')));
    assert.throws(() => vulkanProgramSources({ ...program, fragmentSource: program.fragmentSource + '\n' }), /版本不符/);
    assert.throws(() => vulkanProgramSources({ ...program, definition: { ...program.definition, vertex: 'Other.vert' } }), /版本不符/);
    assert.deepEqual(vulkanProgramColorFormats(name), ['CloudFluffy','CloudCard','CloudQuadParticleFluffy'].includes(name) ? ['rgba16f', 'rgba16f'] : name === 'CloudCore' || name === 'DepthDownsampleGather' ? ['rgba16f'] : name.startsWith('Depth') ? ['rg16f'] : ['r16f']);
  }
  const program = catalog.program('MeshShSdf');
  assert.equal(vulkanProgramColorFormats(program.definition.name), undefined);
  assert.deepEqual(vulkanProgramSources(program), [{ stage: 'vert', text: program.vertexSource, coordinates: 'opengl' }, { stage: 'frag', text: program.fragmentSource, coordinates: 'opengl' }]);
});

test('Recovered AIR stages link with float32 external interfaces and explicit half capability without relaxed conversion', async () => {
  const directory = await fs.mkdtemp(path.join(os.tmpdir(), 'sky-air-shader-test-'));
  try {
    for (const [name, vertName, components] of [['CloudCore0', 'CloudCore0', [4]], ['CloudFluffy0', 'CloudFluffy0', [4, 4]], ['CloudFluffy54734', 'CloudFluffy54734', [1]], ['CloudFluffy62865', 'CloudFluffy62865', [1]], ['DepthDownsample45204', 'Fullscreen45204', [2]], ['DepthDownsample3593', 'Fullscreen3593', [4]], ['DepthDownsample5322', 'Fullscreen5322', [2]], ['CloudCard0','CloudCard0',[4,4]], ['FlatCloud11244','FlatCloud11244',[4,4]]] as const) {
      const sources = await Promise.all((['vert', 'frag'] as const).map(async stage => ({ stage, format: 'vulkan450' as const, text: await fs.readFile(path.resolve(`evidence/cloud-air-vulkan/${stage === 'vert' ? vertName : name}.${stage}`), 'utf8') })));
      const compiled = await compileVulkanShaders(sources, directory);
      assert.equal(compiled.success, true, compiled.log); assert.equal(compiled.requiresFloat16, true);
      const vertex = compiled.artifacts[0].reflection, fragment = compiled.artifacts[1].reflection;
      assert.deepEqual(fragment.outputs.map(o => o.type.count ?? 1), components);
      for (const value of [...vertex.inputs, ...vertex.outputs, ...fragment.inputs, ...fragment.outputs]) {
        const scalar = value.type.element ?? value.type; assert.equal(scalar.kind, 'float'); assert.equal(scalar.bytes, 4);
      }
      if (!name.startsWith('DepthDownsample')) {
        assert.equal(compiled.descriptors[0].binding, 0); assert.equal(compiled.descriptors[0].kind, 'uniform-buffer');
      } else assert.equal(vertex.inputs.length, 0);
      assert.ok(compiled.descriptors.filter(d => d.kind === 'combined-image-sampler').every(d => d.binding > 0));
      const hit = await compileVulkanShaders(sources, directory); assert.equal(hit.cached, true); assert.equal(hit.requiresFloat16, true);
    }
    const rejected = await compileVulkanShaders([{ stage: 'vert', format: 'vulkan450', text: vertex }], directory);
    assert.equal(rejected.success, false); assert.match(rejected.log, /GLSL 450/);
  } finally { await fs.rm(directory, { recursive: true, force: true }); }
});
