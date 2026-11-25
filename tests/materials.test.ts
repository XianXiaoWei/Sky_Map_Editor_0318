import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import { AssetCatalog } from '../src/main/assets';
import { ObjectsDocument } from '../src/core/objects';
import { readResourceDeclarations, shaderVariantHash, describeMaterial, materialBindings, portableShader, type ShaderProgram } from '../src/core/materials';
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';

test('Lua reader ignores executable expressions, comments, nested tables and declaration-like string contents', () => {
  const text = `-- resource "Shader" "Fake" { vs = "Evil.vert" }
local text = [=[resource "Shader" "LongStringFake" {vs="x"}]=]
--[=[ resource "Shader" "CommentFake" {vs="y"} ]=]
resource "Shader" "Real" {
  defines = "BAKED SDF", vs = "Mesh.vert", fs = 'Mesh.frag',
  nested = { defines = "Wrong", closing = "}" }, source = runDangerousCode(),
  gamma = false, instances = 32 }
`;
  const declarations = readResourceDeclarations(text); assert.equal(declarations.length, 1);
  assert.deepEqual(declarations[0].fields, { defines: 'BAKED SDF', vs: 'Mesh.vert', fs: 'Mesh.frag', gamma: false, instances: 32 });
  assert.throws(() => readResourceDeclarations('resource "Shader" "Bad" { vs="unfinished'), /截断/);
});
test('Original define hash selects known archive filenames and preserves whitespace/order', () => {
  assert.equal(shaderVariantHash(''), 0); assert.equal(shaderVariantHash('BAKED'), 27454);
  assert.equal(shaderVariantHash('BAKED SDF'), 49525); assert.equal(shaderVariantHash('SELF_LIT COLOR_UNIFORM'), 22254);
  assert.notEqual(shaderVariantHash('SDF BAKED'), 49525); assert.notEqual(shaderVariantHash('BAKED  SDF'), 49525);
  const catalog = new AssetCatalog(data); assert.equal(catalog.shaders.size, 176);
  for (const d of catalog.shaders.values()) {
    if (d.backend === 'metal') { assert.throws(() => catalog.program(d.name), /Metal/); continue; }
    const p = catalog.program(d.name); assert.match(p.vertexSource, /^#version 300 es/); assert.match(p.fragmentSource, /^#version 300 es/);
  }
  assert.equal(catalog.program('MeshShSdf').definition.vertex, 'Mesh49525.vert');
  assert.equal(catalog.program('MeshShSdf').definition.fragment, 'Mesh49525.frag');
  assert.equal(catalog.image('DeliberatelyAbsentTexture').exists, false);
});
test('Real LevelMesh custom parameters are independent from terrain material IDs', () => {
  const doc = new ObjectsDocument(fs.readFileSync(path.join(data, 'Levels/Dawn/Objects.level.bin'))), node = doc.nodes.find(n => n.className === 'LevelMesh')!, material = describeMaterial(node);
  assert.equal(material.shaderName, 'MeshShSdf'); assert.equal(material.custom, true);
  const original = node.fields.find(f => f.name === 'shaderParams')!.children!;
  assert.equal(material.parameters.length, original.length);
  const texture = material.parameters.find(p => p.name === 'u_diffuse1Tex')!;
  assert.ok(texture.texture); assert.ok(new AssetCatalog(data).image(texture.texture).exists);
  const bindings = materialBindings(material, new AssetCatalog(data).program(material.shaderName));
  assert.equal(bindings.find(b => b.variable.name === 'u_diffuse1Tex')?.parameter?.texture, texture.texture);
  assert.equal(bindings.find(b => b.variable.name === 'u_normTexScale')?.parameter?.vector[0], 1);
  assert.equal(bindings.find(b => b.variable.name === 'u_probeCube')?.source, 'global');
  assert.equal(bindings.find(b => b.variable.name === 'u_sunDir')?.nativeGlobal?.source?.nativeOffset, 0x290);
  assert.equal(bindings.find(b => b.variable.name === 'u_model')?.source, 'camera');
  const field = original.flatMap(f => f.children ?? []).find(f => f.name === 'texValue' && f.value === texture.texture)!;
  doc.edit(field.id, 'DifferentTexture'); const changed = describeMaterial(new ObjectsDocument(doc.serialize()).nodes[node.id]);
  assert.equal(changed.parameters.find(p => p.name === texture.name)?.texture, 'DifferentTexture');
});
test('Uniform diagnostics retain missing pipeline data and reject duplicate/incompatible parameters', () => {
  const definition = new AssetCatalog(data).program('MeshShSdf').definition;
  const program: ShaderProgram = { definition, vertexSource: '', fragmentSource: '', variables: [
    { name: 'u_texture', type: 'sampler2D', count: 1, stage: 'fragment', storage: 'uniform' },
    { name: 'u_array', type: 'vec4', count: 2, stage: 'vertex', storage: 'uniform' },
    { name: 'u_environment', type: 'samplerCube', count: 1, stage: 'fragment', storage: 'uniform' },
  ] };
  const parameter = { name: 'u_texture', texture: '', vector: [1, 2, 3, 4], nativeType: 2, fieldId: 'n0/p0' };
  const material = { nodeId: 0, name: 'Test', materialId: 1, custom: true, shaderName: 'MeshShSdf', parameters: [parameter, { ...parameter, name: 'u_array' }] };
  assert.match(materialBindings(material, program)[0].problem!, /为空/);
  assert.match(materialBindings(material, program)[1].problem!, /数组/);
  assert.equal(materialBindings(material, program)[2].source, 'unresolved');
  material.parameters.push({ ...parameter }); assert.match(materialBindings(material, program)[0].problem!, /重复/);
  const source = '#version 300 es\n#extension GL_OES_standard_derivatives : enable\nvoid main(){}\n';
  assert.equal(portableShader(source), '#version 300 es\nvoid main(){}\n');
});
