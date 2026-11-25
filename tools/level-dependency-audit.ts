import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import { ObjectsDocument, type ObjectNode } from '../src/core/objects';
import { MeshesDocument } from '../src/core/meshes';
import { readResourceManifest, type ResourceManifestEntry } from '../src/core/resource-manifest';
import { describeLevelResourcePlan } from '../src/core/level-resource-plan';
import { nestedFields, objectScalar, objectText } from '../src/core/model-material-index';
import { ResourceScriptRuntime } from '../src/core/resource-script-runtime';

const data = process.env.SKY_DATA ?? '/root/sky-research/original-runtime-corpus';
const hash = (bytes: Uint8Array) => crypto.createHash('sha256').update(bytes).digest('hex');
const foundation = JSON.parse(fs.readFileSync('docs/object-foundation-oracle.json', 'utf8'));
const manifests = JSON.parse(fs.readFileSync('docs/resource-manifest-oracle.json', 'utf8'));
assert.ok(foundation.passed && manifests.passed); assert.equal(foundation.executableSha256, manifests.executableSha256);
const modelInventory = JSON.parse(fs.readFileSync('docs/model-material-dependencies.json', 'utf8'));
const meshInventory = new Map<string, any>(modelInventory.meshes.map((mesh: any) => [mesh.name, mesh]));
const sourceManifests = new Map<string, ResourceManifestEntry[]>();
for (const origin of ['Resources/ImageDefs.lua', 'Resources/SoundDefs.lua', 'Resources/Boot.lua', 'Resources/Persistent.lua'])
  sourceManifests.set(origin, readResourceManifest(fs.readFileSync(path.join(data, origin), 'utf8')));

const assetFiles = new Map<string, { path: string; exists: boolean; bytes?: number; sha256?: string }>();
function file(relative: string) {
  if (assetFiles.has(relative)) return assetFiles.get(relative)!;
  const absolute = path.join(data, relative), exists = fs.existsSync(absolute);
  const result = exists ? { path: relative, exists, bytes: fs.statSync(absolute).size, sha256: hash(fs.readFileSync(absolute)) } : { path: relative, exists };
  assetFiles.set(relative, result); return result;
}
function candidates(entry: ResourceManifestEntry): string[] {
  const source = typeof entry.parameters.source === 'string' ? entry.parameters.source : '';
  if (entry.type === 'LevelObjects') return [source + '.bin'];
  if (entry.type === 'LevelData' || entry.type === 'Script' || entry.type === 'BlobPrefab') return source ? [source] : [];
  if (entry.type === 'Mesh') return [`Meshes/Bin/${entry.name}.mesh`];
  if (entry.type === 'Image') return [...new Set([`Images/Bin/${entry.name}.png`, ...(source ? [`Images/Bin/${source}`, `Images/${source}`] : [])])];
  if (entry.type === 'Shader') return ['vs', 'fs'].flatMap(key => typeof entry.parameters[key] === 'string' ? [`Shaders/Bin/${entry.parameters[key]}`] : []);
  if (['SoundDef', 'FmodFile', 'FmodStudioFile'].includes(entry.type)) return source ? [`Audio/${source}`, `Audio/Bin/${source}`] : [];
  if (entry.type === 'Font') return source ? [`Fonts/${source}`, `Fonts/Bin/${source}`] : [];
  return [];
}
const declarations = new Map<string, { origin: string; entry: ResourceManifestEntry }>();
function recordDeclarations(origin: string, entries: ResourceManifestEntry[]) {
  for (const entry of entries) if (entry.directive !== 'resourceref') declarations.set(entry.type + '_' + entry.name, { origin, entry });
}
for (const [origin, entries] of sourceManifests) recordDeclarations(origin, entries);
const levels: any[] = [], classCounts = new Map<string, number>(), classEdges = new Map<string, number>(), unresolved: any[] = [];
let nodeCount = 0, referenceCount = 0, bakeCount = 0, guidMatches = 0, soundRequests = 0, resourceRequests = 0;
const meshFiles = new Map<string, any>();
for (const level of fs.readdirSync(path.join(data, 'Levels')).sort()) {
  const origin = `Levels/${level}/Resources.lua`; if (!fs.existsSync(path.join(data, origin))) continue;
  const entries = readResourceManifest(fs.readFileSync(path.join(data, origin), 'utf8')); sourceManifests.set(origin, entries);
  const plan = describeLevelResourcePlan(level, entries), objectsFile = file(plan.objects.compiledSource), bakedFile = file(plan.baked.source);
  assert.ok(objectsFile.exists && bakedFile.exists);
  const doc = new ObjectsDocument(fs.readFileSync(path.join(data, plan.objects.compiledSource))), baked = new MeshesDocument(fs.readFileSync(path.join(data, plan.baked.source)));
  assert.ok(doc.serialize().equals(doc.source)); assert.ok(baked.serialize().equals(baked.source));
  // Resolve references through the ORIGINAL definition table. The declaration
  // map below is only a static index of possible already-loaded resources.
  const runtime = new ResourceScriptRuntime();
  runtime.apply(sourceManifests.get('Resources/ImageDefs.lua')!); runtime.clearResources();
  const warnings: string[] = []; runtime.warning = message => warnings.push(message); runtime.apply(entries);
  const levelDeclarations = new Map(declarations); for (const entry of entries) if (entry.directive !== 'resourceref') levelDeclarations.set(entry.type + '_' + entry.name, { origin, entry });
  const requests: any[] = [], references: any[] = [], owners = new Map<number, ObjectNode[]>();
  for (const node of doc.nodes) {
    nodeCount++; classCounts.set(node.className, (classCounts.get(node.className) ?? 0) + 1);
    const guid = node.fields.find(field => field.name === 'bstGuid');
    if (guid) { const key = objectScalar(node, 'bstGuid'), same = owners.get(key) ?? []; same.push(node); owners.set(key, same); }
    for (const field of nestedFields(node.fields)) if (field.kind === 'reference' && field.value !== 0xffffffff) {
      const target = doc.nodes[Number(field.value)]; assert.ok(target, `${level}:${field.id}`); referenceCount++;
      references.push({ nodeId: node.id, field: field.id, targetId: target.id, className: target.className });
      const key = node.className + ' -> ' + target.className; classEdges.set(key, (classEdges.get(key) ?? 0) + 1);
    }
    function request(type: string, name: string, field: string, semantics: string) {
      if (!name) return;
      const definition = levelDeclarations.get(type + '_' + name);
      const asset = definition ? candidates(definition.entry).map(file) : type === 'Mesh' ? [file(`Meshes/Bin/${name}.mesh`)] : [];
      const row = { nodeId: node.id, className: node.className, field, type, name, semantics,
        declaration: definition ? { origin: definition.origin, line: definition.entry.line, directive: definition.entry.directive } : null,
        assets: asset, loadedStateVerified: false };
      requests.push(row); resourceRequests++;
      if (type === 'SoundDef') soundRequests++;
      if (!definition) unresolved.push({ level, ...row, reason: type === 'SoundDef' ? 'SoundDef 声明未命中；FMOD 事件/全局声音路径需沿 SoundManager 继续恢复，不能据此判为原文件损坏' : '静态资源名未命中；动态生成、持久资源或原失败分支待核验' });
      if (type === 'Mesh' && !meshFiles.has(name)) {
        const asset = file(`Meshes/Bin/${name}.mesh`), prior = meshInventory.get(name);
        if (prior?.sha256 && asset.exists) assert.equal(asset.sha256, prior.sha256, 'stale mesh inventory: ' + name);
        meshFiles.set(name, { ...asset, name, decoded: prior?.sha256 && prior.sha256 === asset.sha256 ? { animated: prior.animated, lods: prior.lods } : null, geometryReport: prior?.sha256 ? 'model-material-dependencies.json' : null, fullLoaderVerified: false });
      }
    }
    if (node.className === 'LevelMesh') request('Mesh', objectText(node, 'resourceName'), 'resourceName', '原模型资源名；几何来自独立 Mesh 资源');
    if (['Beamo', 'BeamoDecal', 'CloudCard'].includes(node.className)) request('Mesh', objectText(node, 'meshName'), 'meshName', '原 Mesh 资源名；烘焙另按 GUID 查找');
    if (['LevelMesh', 'LevelMaterial'].includes(node.className)) {
      request('Shader', objectText(node, 'shaderName'), 'shaderName', '序列化 shader 名；自定义/默认材质选择由原材质消费链决定');
      for (const field of nestedFields(node.fields)) if (field.name === 'tex' && typeof field.value === 'string') request('Image', field.value, field.id, '内嵌 shader 纹理参数');
    }
    const soundFields: Record<string, string[]> = { PlaySound2D: ['sound'], PlaySound3D: ['sound'], LoadSound: ['sound'], SoundEmitter: ['soundName'], ShuffleSounds2D: ['sound1', 'sound2', 'sound3', 'sound4', 'sound5'] };
    for (const field of soundFields[node.className] ?? []) request('SoundDef', objectText(node, field), field, '字符串声音请求；SoundDef 或 FMOD 事件路由尚需原消费函数判定');
  }
  const bakeLinks = baked.bakes.map((record, index) => {
    bakeCount++;
    const matches = owners.get(record.guid) ?? []; if (matches.length) guidMatches++;
    return { index, id: record.id, guid: record.guid, resourceName: record.name, lods: record.submeshes.length, uniform: record.uniform,
      owners: matches.map(node => ({ nodeId: node.id, className: node.className, resourceNameMatches: objectText(node, node.className === 'LevelMesh' ? 'resourceName' : 'meshName') === record.name })),
      firstSameGuidRecord: baked.bakes.findIndex(other => other.guid === record.guid), nativeLoadedTableVerified: false };
  });
  const resourceAssets = runtime.resources.map(cons => {
    const entry = levelDeclarations.get(cons.class + '_' + cons.name)!.entry;
    return { type: cons.class, name: cons.name, assets: candidates(entry).map(file) };
  });
  levels.push({ level, plan, files: { objects: objectsFile, baked: bakedFile, manifest: file(origin) }, nodes: doc.nodes.length,
    declaredClasses: doc.classes.length, referenceCount: references.length, classCounts: Object.fromEntries([...new Set(doc.nodes.map(node => node.className))].map(name => [name, doc.nodes.filter(node => node.className === name).length])),
    resourceConstructorCount: runtime.resources.length, resourceErrorCode: runtime.errorCode, warnings, resourceAssets,
    logicalBakedSegments: baked.logicalSegments, bakeLinks, references, requests, fullLevelRuntimeVerified: false });
}
const allDeclarations = [...sourceManifests].flatMap(([origin, entries]) => entries.map(entry => ({ origin, ...entry, assets: entry.directive === 'resourceref' ? [] : candidates(entry).map(file) })));
const report = { executableSha256: foundation.executableSha256,
  scope: '全 33 关卡静态关系：原资源 DSL 定义/引用、配对 LevelObjects/LevelData、TGCL 引用、五段 LOD0、GUID 烘焙记录、Mesh/shader/纹理/声音请求及原函数入口。资产候选路径按原语料/已有解析器列举，存在不等于原 loader 已载入；SoundDef 未命中不等于 FMOD 事件缺失。记录选择为序列化表投影，最终原加载过滤/注册表尚待恢复。',
  completeCallGraph: false, completeOriginalGameRuntime: false,
  summary: { levels: levels.length, nodes: nodeCount, tgclReferences: referenceCount, declaredManifests: sourceManifests.size, resourceDeclarations: allDeclarations.length,
    bakeRecords: bakeCount, guidMatchedBakeRecords: guidMatches, uniqueObjectMeshRequests: meshFiles.size, resourceRequests, soundRequests, unresolvedStaticRequests: unresolved.length, assetCandidates: assetFiles.size },
  nativeEntrypoints: { resourceBootstrap: '0x100376360', queueBootstrapScript: '0x100375e40', queueResourceScript: '0x1007c38b0', loadNext: '0x1007c3d20',
    addToLoadList: '0x1007c2230', addToUnloadList: '0x1007c2250', incrementLoadCount: '0x1007c1b40', decrementLoadCount: '0x1007c1b50', getLoadCount: '0x1007c1b60',
    levelObjectsReadSource: '0x10040d9e0', readTGCL: '0x10040bc00', readFields: '0x10040b390', factoryCreate: '0x1004d0b60', valueCreate: '0x100716250',
    levelDataLoad: '0x1003f4840', bakedGuidLookup: '0x1003f68d0', levelLoadBranch: '0x1003784a0', levelUnloadBranch: '0x1003781b0', moduleDispatch: '0x1007b1b40' },
  classCounts: Object.fromEntries(classCounts), classDependencyCounts: Object.fromEntries(classEdges), declarations: allDeclarations, meshFiles: [...meshFiles.values()], levels, unresolved };
assert.equal(levels.length, 33); assert.equal(nodeCount, 49824); assert.equal(referenceCount, 60016);
fs.writeFileSync('docs/level-dependency-audit.json', JSON.stringify(report, null, 2) + '\n');
console.log(JSON.stringify(report.summary));
