import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import { ObjectsDocument, type ObjectNode } from '../src/core/objects';
import { describeMaterial, materialBindings } from '../src/core/materials';
import { nestedFields, objectScalar, objectText, serializedLevelMaterialIndex } from '../src/core/model-material-index';
import { readResourceMesh } from '../src/core/resources';
import { AssetCatalog } from '../src/main/assets';
const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const roots = ['LevelMesh', 'Beamo', 'BeamoDecal', 'LevelMaterial'];
const associated = [...roots, 'LevelShaderParam', 'LevelMeshShaderParam', 'SetMeshShaderParam', 'PlayAnimation', 'Timeline', 'TimelineNode', 'TransformObject', 'Parent', 'MoveObjectAlongRail', 'RotateObject'];
const classes = new Map<string, { className: string; instances: unknown[] }>(associated.map(className => [className, { className, instances: [] }]));
const meshes = new Map<string, unknown>(), shaders = new Map<string, unknown>(), textures = new Map<string, unknown>(), unresolved: unknown[] = [], files: unknown[] = [];
let materialRequests = 0, materialMatches = 0, absentSecondary = 0, modelInstances = 0;
const bakeReport = JSON.parse(fs.readFileSync('docs/meshes-object-links.json', 'utf8'));
function mesh(name: string) {
  if (!name || meshes.has(name)) return;
  const file = path.join(data, 'Meshes', 'Bin', name + '.mesh');
  try { const bytes = fs.readFileSync(file), parsed = readResourceMesh(bytes); meshes.set(name, { name, sha256: crypto.createHash('sha256').update(bytes).digest('hex'), animated: parsed.animated, lods: parsed.levels.map((l, index) => ({ index, vertices: l.positions.length / 3, triangles: l.indices.length / 3, bakeVertices: l.bakeVertexCount })), completeAnimationRuntime: false }); }
  catch (error) { meshes.set(name, { name, error: (error as Error).message }); }
}
for (const level of fs.readdirSync(path.join(data, 'Levels')).sort()) {
  const file = path.join(data, 'Levels', level, 'Objects.level.bin'); if (!fs.existsSync(file)) continue;
  const bytes = fs.readFileSync(file), doc = new ObjectsDocument(bytes), index = serializedLevelMaterialIndex(doc.nodes, level), catalog = new AssetCatalog(data, level);
  files.push({ level, sha256: crypto.createHash('sha256').update(bytes).digest('hex'), materialSlots: index.materials.length });
  const incoming = new Map<number, { sourceId: number; className: string; field: string }[]>();
  for (const source of doc.nodes) for (const f of nestedFields(source.fields).filter(f => f.kind === 'reference' && f.value !== 0xffffffff)) {
    const id = Number(f.value); assert.ok(doc.nodes[id]); const refs = incoming.get(id) ?? []; refs.push({ sourceId: source.id, className: source.className, field: f.id }); incoming.set(id, refs);
  }
  function materialResources(node: ObjectNode, material: ReturnType<typeof describeMaterial>) {
    let program, error: string | null = null;
    try { program = catalog.program(material.shaderName); } catch (e) { error = (e as Error).message; }
    const key = `${level}/${material.shaderName}`;
    if (!shaders.has(key)) shaders.set(key, { level, name: material.shaderName, definition: catalog.shaders.get(material.shaderName) ?? null, error, variables: program?.variables ?? [], originalGpuUploadVerified: false });
    const bindings = program ? materialBindings(material, program) : [];
    for (const p of material.parameters.filter(p => p.texture)) {
      const key = `${level}/${p.texture}`;
      if (!textures.has(key)) textures.set(key, { level, ...catalog.image(p.texture) });
    }
    return { shaderName: material.shaderName, parameters: material.parameters, shaderError: error, bindings, unresolvedUniforms: bindings.filter(b => b.source === 'unresolved' || b.problem).map(b => ({ name: b.variable.name, problem: b.problem ?? 'unresolved' })) };
  }
  for (const node of doc.nodes.filter(n => associated.includes(n.className))) {
    const guid = objectScalar(node, 'bstGuid'), resourceName = objectText(node, node.className === 'LevelMesh' ? 'resourceName' : 'meshName');
    const links = index.modelLinks(node); if (['LevelMesh', 'Beamo', 'BeamoDecal'].includes(node.className)) { modelInstances++; mesh(resourceName); }
    for (const link of links) {
      if (!link.requested) { absentSecondary++; continue; } materialRequests++;
      if (link.materialNodeId !== null) materialMatches++; else unresolved.push({ level, className: node.className, nodeId: node.id, ...link, behavior: '保留缺失；原消费函数的错误/卸载注册路径需继续恢复，禁止替换任意材质' });
    }
    let material = null;
    if (node.className === 'LevelMaterial') { const m = index.materials.find(m => m.nodeId === node.id)!; material = { slot: m.slot, custom: m.saved.custom, error: m.error, ...(m.effective ? materialResources(node, m.effective) : {}) }; }
    else if (node.className === 'LevelMesh') { const saved = describeMaterial(node); if (saved.custom) material = materialResources(node, saved); }
    const outgoing = nestedFields(node.fields).filter(f => f.kind === 'reference' && f.value !== 0xffffffff).map(f => ({ field: f.id, targetId: f.value, className: doc.nodes[Number(f.value)].className }));
    const instance = { level, nodeId: node.id, name: node.name, guid, resourceName: resourceName || null, materialLinks: links, material,
      nestedParameters: nestedFields(node.fields).filter(f => f.kind === 'struct' && /Level(?:Mesh)?ShaderParam|TimelineNode/.test(f.name)).map(f => ({ fieldId: f.id, className: f.name.replace(/^\[\d+\]\s*/, ''), values: f.children?.map(c => ({ name: c.name, value: c.value })) })),
      incoming: incoming.get(node.id) ?? [], outgoing,
      bakeRecords: bakeReport.levels.find((l: { level: string }) => l.level === level)?.records.filter((r: { guid: number }) => r.guid === guid) ?? [],
      completeOriginalRuntime: false };
    classes.get(node.className)!.instances.push(instance);
  }
}
const oracle = JSON.parse(fs.readFileSync('docs/level-material-oracle.json', 'utf8')); assert.ok(oracle.passed);
const shared = [
  { className: 'LevelModelBarn', status: '明确构造后的槽分配/GUID查找/参数刷新/逐模型虚表恢复子链原函数核验', implementation: 'src/core/level-material-runtime.ts', remaining: '实际加载注册、完整模型创建、卸载/释放' },
  { className: 'MaterialDefBarn', status: '6套180份原定义、ID查找、参数生成及断言已核验', implementation: 'src/core/level-material-runtime.ts', remaining: '原场景初始化调用、GPU上传及全局生命周期' },
  { className: 'LevelShaderParam', status: '16项内嵌构造及默认赋值子链原函数核验', implementation: 'src/core/level-material-runtime.ts', remaining: '独立加载、完整上传/纹理、销毁' },
  {className:'RenderList',status:'8个完整注册/注销/提交/图元计数/格式上下文内核及Model、VertexRender初始化/释放组合原核验',implementation:'src/core/render-list-runtime.ts',remaining:'Scene/Barn真实分配、清帧所有者、原排序/绘制、完整GPU格式刷新与Windows真机'},
  ...['LevelMeshShaderParam', 'Mesh', 'Shader', 'ShaderUniform', 'BeamoBarn', 'LevelDataRef', 'Motion', 'Texture', 'Image', 'Object', 'Clump', 'Visibility'].map(className => ({ className, status: '已有格式/局部证据；完整相关行为待恢复', remaining: '按模型、材质与原调度调用链继续闭合' })),
];
const report = { passed: true, updatedAtUTC: new Date().toISOString(), executableSha256: oracle.executableSha256,
  scope: '功能类→全部实例→材质GUID/资源名/shader/纹理/嵌套参数/正反向TGCL引用。GUID表为序列化顺序投影，查找原函数对照通过；未证明原loader过滤/注册后的表。不能以shader源码存在或静态mesh解析代表原绘制、动画或完整模型运行。',
  summary: { maps: files.length, modelInstances, materials: classes.get('LevelMaterial')!.instances.length, materialRequests, materialMatches, unresolvedMaterialRequests: materialRequests - materialMatches, secondaryGuidZeroSkipped: absentSecondary, uniqueMeshes: meshes.size, shaderVariantsByLevel: shaders.size, texturesByLevel: textures.size, completeOriginalRuntimeClasses: 0 },
  shared, classes: [...classes.values()], meshes: [...meshes.values()], shaders: [...shaders.values()], textures: [...textures.values()], unresolved, files };
fs.writeFileSync('docs/model-material-dependencies.json', JSON.stringify(report, null, 2) + '\n');
const md = `# 模型及材质底层统一逆向清单\n\n${report.scope}\n\n覆盖 ${files.length} 份 Objects.level.bin、${modelInstances} 个 LevelMesh/Beamo/BeamoDecal、${report.summary.materials} 个 LevelMaterial。材质查询 ${materialRequests} 项，序列化表匹配 ${materialMatches} 项，${materialRequests-materialMatches} 项缺失保留；次材质 GUID 为零跳过 ${absentSecondary} 项。完整逐类、逐实例和资源链接见 [机器清单](model-material-dependencies.json)。\n\n| 功能类 | 实例数 | 验收状态 |\n| --- | ---: | --- |\n${[...classes.values()].map(c => `| [${c.className}](Objects类清单/${c.className}.md) | ${c.instances.length} | 完整类运行未验收；按逐类清单记录明确子链 |`).join('\n')}\n\n| 引用/底层类 | 已恢复范围 | 尚缺 |\n| --- | --- | --- |\n${shared.map(c => `| ${c.className} | ${c.status} | ${c.remaining} |`).join('\n')}\n\n原模型 shader GPU上传、渲染分组、烘焙/LOD/裙边、Beamo实际绘制、动画/形变/物理、卸载、Windows/原游戏真机仍需闭合。音效依赖沿 Objects/EventBarn/PlaySound 调度继续恢复，已有范围见 [音效核验](sound-event-oracle.json)。\n`;
fs.writeFileSync('docs/模型材质底层统一清单.md', md); console.log(JSON.stringify(report.summary));
