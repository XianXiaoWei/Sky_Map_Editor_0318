import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {ObjectsDocument, type Field} from '../src/core/objects';
import {generateObjectsClassProgress} from './objects-class-progress';

// Read-only corpus inventory. A serialized reference is not an executed event.
const data = process.env.SKY_DATA ?? '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const properties = JSON.parse(fs.readFileSync('docs/native-properties.json', 'utf8'));
const digest = (b: Buffer) => crypto.createHash('sha256').update(b).digest('hex');
const important = new Set(['Object', 'Marker', 'Clump', 'Rail', 'CameraGuide', 'Timeline',
  'LevelMesh', 'LevelMaterial', 'Beamo', 'BeamoDecal', 'CloudCard', 'TerrainBlobGroup',
  'OnRegion', 'IfInRegion', 'NotOnRegion', 'AvatarSetPos', 'OnBubbleButton', 'OnButtonClick',
  'DisplayText', 'ShowHUDTimed', 'OutfitSelect', 'PlayAvatarAnimSeq', 'OnTapPlayAnim',
  'AvatarGrindToPos', 'MeditationArea', 'Wind', 'SetWind', 'OnLevelStart', 'LevelLink',
  'Checkpoint', 'CheckpointRestore', 'ChangeLevelWithFade', 'OnGameReady', 'OnAccountReady']);
const counts: Record<string, number> = {}, levels: any[] = [];
const walk = (fields: Field[], cb: (f: Field) => void) => {
  for (const f of fields) { cb(f); if (f.children) walk(f.children, cb); }
};
const value = (f: Field) => f.kind === 'bits32'
  ? (f.value as any)[f.encoding === 'float' ? 'float' : f.encoding === 'int' ? 'int' : 'uint'] : f.value;
for (const level of fs.readdirSync(path.join(data, 'Levels')).sort()) {
  const file = path.join(data, 'Levels', level, 'Objects.level.bin');
  if (!fs.existsSync(file)) continue;
  const bytes = fs.readFileSync(file), doc = new ObjectsDocument(bytes);
  assert.equal(doc.end, bytes.length);
  assert.ok(bytes.equals(doc.serialize()));
  const incoming = new Map<number, any[]>(), broken: any[] = [], stats: Record<string, number> = {};
  for (const node of doc.nodes) {
    if (/^Avatar|^SetAvatar|^OnAvatar|^SetInputState$|^SetFlightParams$|^SetGlide$|^SetBlockUpdraftWind$/.test(node.className)) important.add(node.className);
    counts[node.className] = (counts[node.className] ?? 0) + 1;
    stats[node.className] = (stats[node.className] ?? 0) + 1;
    walk(node.fields, f => {
      if (f.kind !== 'reference' || f.value === 0xffffffff) return;
      const target = Number(f.value);
      const row = {nodeId: node.id, className: node.className, name: node.name, field: f.id};
      if (!doc.nodes[target]) broken.push({...row, target});
      else incoming.set(target, [...(incoming.get(target) ?? []), row]);
    });
  }
  const describe = (node: typeof doc.nodes[number]) => {
    const references: any[] = [];
    walk(node.fields, f => {
      if (f.kind !== 'reference' || f.value === 0xffffffff) return;
      const target = doc.nodes[Number(f.value)];
      references.push({field: f.id, target: f.value, className: target?.className, name: target?.name});
    });
    return {id: node.id, className: node.className, name: node.name,
      fields: Object.fromEntries(node.fields.filter(f => !f.children).map(f => [f.name,
        {kind: f.kind, encoding: f.encoding ?? null, value: value(f), raw: f.raw}])),
      references, incomingReferences: incoming.get(node.id) ?? []};
  };
  const starts = doc.nodes.filter(n => n.className === 'AvatarSetPos').map(n => {
    const flag = n.fields.find(f => f.name === 'setLevelStartPosition');
    // Reverse-reference discovery only; no assumption that every container
    // activates its members. Keep an explicit path and bound cycle traversal.
    const ancestorReferenceRoots: any[] = [], seen = new Set([n.id]);
    const queue = [{id: n.id, path: [] as any[]}];
    for (let at = 0; at < queue.length; at++) {
      const item = queue[at]; if (item.path.length >= 8) continue;
      for (const edge of incoming.get(item.id) ?? []) {
        if (seen.has(edge.nodeId)) continue;
        seen.add(edge.nodeId); const refPath = [edge, ...item.path];
        if (['OnLevelStart', 'OnGameReady', 'OnAccountReady', 'LevelLink', 'Checkpoint', 'CheckpointRestore', 'ChangeLevelWithFade', 'OnRegion', 'Timeline'].includes(edge.className))
          ancestorReferenceRoots.push({root: edge, referencePath: refPath, nativeExecutionResolved: false});
        queue.push({id: edge.nodeId, path: refPath});
      }
    }
    return {...describe(n), explicitlySetsLevelStart: flag ? Boolean(value(flag)) : null,
      startupSelectionResolved: false, ancestorReferenceRoots};
  });
  const camera = doc.nodes.filter(n => n.className === 'OnRegion').map(n => {
    const flag = n.fields.find(f => f.name === 'useCameraPos');
    return {id: n.id, name: n.name, serializedUseCameraPos: flag ? Boolean(value(flag)) : null};
  });
  levels.push({level, bytes: bytes.length, sha256: digest(bytes), nodes: doc.nodes.length,
    fullParseAndUnchangedRoundTrip: true, classCounts: stats, brokenReferences: broken,
    spawnCandidates: starts, cameraRegions: camera,
    interactionNodes: doc.nodes.filter(n => important.has(n.className) &&
      !['Object', 'Marker', 'Clump', 'Rail', 'CameraGuide', 'LevelMesh', 'LevelMaterial', 'Beamo', 'BeamoDecal', 'CloudCard', 'TerrainBlobGroup', 'Timeline'].includes(n.className)).map(describe)});
}
const outfitFile = path.join(data, 'Resources', 'OutfitDefs.json'), outfitBytes = fs.readFileSync(outfitFile);
const outfits: any[] = JSON.parse(outfitBytes.toString());
assert.ok(Array.isArray(outfits));
const slots: Record<string, number> = {}, outfitFields = new Set<string>(), animations = new Set<string>();
for (const o of outfits) {
  slots[o.type] = (slots[o.type] ?? 0) + 1;
  Object.keys(o).forEach(k => outfitFields.add(k));
  for (const k of ['idleAnim', 'fastPlayAnimSeq', 'takeOutAnimSeq', 'putBackAnimSeq']) if (o[k]) animations.add(o[k]);
}
const files: string[] = [];
const scan = (dir: string) => { for (const e of fs.readdirSync(dir, {withFileTypes: true})) {
  const p = path.join(dir, e.name); if (e.isDirectory()) scan(p); else files.push(p);
}};
scan(data);
const packs = files.filter(p => p.endsWith('.animpack')).sort().map(p => {
  const b = fs.readFileSync(p);
  return {path: path.relative(data, p), bytes: b.length, sha256: digest(b), headerHex: b.subarray(0, 32).toString('hex'),
    playerNamedCandidate: path.basename(p).startsWith('CharKidAnim'), formatRestored: false};
});
const scopes = [
  ['base', '基础对象、Marker／Clump／Rail', ['全地图格式与引用清点', '原字段注册证据', '构造默认值', '继承与虚表', '原加载顺序', '启用与 Clump 传播', 'Rail 求值', '事件分发', '销毁与切图', '原机运行验收'], 2],
  ['baked-models', '模型与烘焙／裙边／遮挡联合恢复', ['全量烘焙数据关联', '原字段与调用入口清点', '完整资源与 LOD 绑定', '解决 61 条未匹配', 'LevelMaterial 原绑定', '模型更新与 Motion', 'SkirtBarn 生成来源', 'Visibility 遮挡查询', '原烘焙生成', '原机运行验收'], 1],
  ['regions', '摄像机及玩家区域触发', ['全地图区域节点与字段清点', 'useCameraPos 原字段证据', '区域空间测试', 'enter／exit 与 fireOnce', 'everyFrame／minimum 规则', 'local／remote 选择', 'Clump 事件链', '相机作为触发主体', '切图与状态复位', '原机运行验收'], 2],
  ['ui', '按钮与文字 HUD', ['实际 UI 节点与引用清点', '原字段注册证据', '距离及按钮对象选择', '按键点击与事件链', 'DisplayText 字体与定位', '文字淡入淡出', 'ShowHUDTimed 纹理与图层', '世界空间到屏幕投影', '摄像机和 Avatar 共用交互', '原机运行验收'], 2],
  ['spawn', '原玩家默认入口', ['AvatarSetPos 候选全量清点', '原字段注册证据', '原构造默认值', 'LevelLink／场景入口选择', '启动事件顺序', '相对 Marker 变换', '随机落地与碰撞', 'momentum／handhold／onGround', '模式进入与切图复位', '原机出生验收'], 2],
  ['movement', 'Avatar 移动与默认状态／效果', ['玩家相关资源和节点清点', 'Avatar／Barn 构造与注册', '输入与镜头', '骨架及角色模型', '地面移动与碰撞', '跳跃／滑行／飞行', '能量与受力状态', '云风场交互及效果', '地图事件衔接', '原机试玩验收'], 1],
  ['outfits', 'OutfitDefs 与衣柜', ['115 条定义及七槽清点', '五个 isDefault 定义记录', '原载入及账户状态', 'mesh／mask／shader 绑定', '纹理及 HSV 配色', '配件 scale／offset', 'OutfitSelect 与商店事件', '衣柜换装', '道具 abilities 和动作', '原机外观验收'], 2],
  ['actions', '动画与动作', ['48 动画包及引用清点', '动作节点原字段证据', 'animpack 格式', '骨架和轨道绑定', '动作序列与状态转换', '混合及 additive', '道具拿出／演奏／放回', '动作 UI 与事件', '移动及动画同步', '原机动作验收'], 2],
  ['mode', '编辑器 Avatar 试玩模式', ['需求及联合实施顺序', '原入口证据闭合', '模式切换与生命周期', '原角色绘制', '玩家输入及相机', '区域及按钮文字', '衣柜与动作', '原默认状态及效果', '编辑数据与试玩状态隔离', '完整地图试玩验收'], 1],
] as const;
const railReport = fs.existsSync('docs/rail-oracle.json') ? JSON.parse(fs.readFileSync('docs/rail-oracle.json', 'utf8')) : null;
const railCacheReport = fs.existsSync('docs/rail-cache-oracle.json') ? JSON.parse(fs.readFileSync('docs/rail-cache-oracle.json', 'utf8')) : null;
const railArcReport = fs.existsSync('docs/rail-arc-oracle.json') ? JSON.parse(fs.readFileSync('docs/rail-arc-oracle.json', 'utf8')) : null;
const bakedLookupReport = fs.existsSync('docs/baked-lookup-oracle.json') ? JSON.parse(fs.readFileSync('docs/baked-lookup-oracle.json', 'utf8')) : null;
const visibilitySubmitReport = fs.existsSync('docs/visibility-submit-oracle.json') ? JSON.parse(fs.readFileSync('docs/visibility-submit-oracle.json', 'utf8')) : null;
const visibilitySphereReport = fs.existsSync('docs/visibility-spheres-oracle.json') ? JSON.parse(fs.readFileSync('docs/visibility-spheres-oracle.json', 'utf8')) : null;
const visibilityAabbReport = fs.existsSync('docs/visibility-aabbs-oracle.json') ? JSON.parse(fs.readFileSync('docs/visibility-aabbs-oracle.json', 'utf8')) : null;
const railVerified = railReport?.passed === true && railCacheReport?.passed === true && railReport?.corpus?.testedRails === 402;
const checklist = scopes.map(([id, title, names, done]) => {
  const items = names.map((title, i) => ({title: id === 'base' && i === 6 ? 'Rail 缓存与正常输入求值（原机 oracle）' : title,
    verified: i < done || id === 'base' && i === 6 && railVerified}));
  const verified = items.filter(i => i.verified).length;
  return {id, title, verified, total: items.length, checklistPercent: verified / items.length * 100, fullReverseEngineeringPercent: null, items};
});
const summary = {levels: levels.length, totalNodes: levels.reduce((v, l) => v + l.nodes, 0),
  classCounts: counts, avatarSetPos: levels.reduce((v, l) => v + l.spawnCandidates.length, 0),
  explicitlySetsLevelStart: levels.flatMap(l => l.spawnCandidates).filter(n => n.explicitlySetsLevelStart === true).length,
  missingStartFlag: levels.flatMap(l => l.spawnCandidates).filter(n => n.explicitlySetsLevelStart === null).length,
  explicitCameraRegions: levels.flatMap(l => l.cameraRegions).filter(n => n.serializedUseCameraPos === true).length,
  brokenReferences: levels.reduce((v, l) => v + l.brokenReferences.length, 0),
  outfitDefinitions: outfits.length, outfitSlots: slots, animationPacks: packs.length,
  playerNamedAnimationPacks: packs.filter(p => p.playerNamedCandidate).length};
const avatarSetPosReport=JSON.parse(fs.readFileSync('docs/avatar-set-pos-oracle.json','utf8')),avatarCameraReport=JSON.parse(fs.readFileSync('docs/avatar-camera-oracle.json','utf8')),avatarModeReport=JSON.parse(fs.readFileSync('docs/avatar-mode-smoke.json','utf8'));
const avatarLocomotionReport=JSON.parse(fs.readFileSync('docs/avatar-locomotion-oracle.json','utf8')),beamoRenderReport=JSON.parse(fs.readFileSync('docs/beamo-render-oracle.json','utf8'));
const renderPipelineReport=JSON.parse(fs.readFileSync('docs/render-pipeline-oracle.json','utf8'));
const renderListReport=fs.existsSync('docs/render-list-oracle.json')?JSON.parse(fs.readFileSync('docs/render-list-oracle.json','utf8')):null;
const beamoDrawReport=fs.existsSync('docs/beamo-draw-verification.json')?JSON.parse(fs.readFileSync('docs/beamo-draw-verification.json','utf8')):null;
const avatarPhysicalReport=JSON.parse(fs.readFileSync('docs/avatar-physical-oracle.json','utf8'));
const cameraEventsReport=JSON.parse(fs.readFileSync('docs/camera-events-oracle.json','utf8')),cameraEventsUi=JSON.parse(fs.readFileSync('docs/camera-events-smoke.json','utf8'));
const cameraShakeReport=JSON.parse(fs.readFileSync('docs/avatar-camera-shake-oracle.json','utf8')),cameraShakeUi=JSON.parse(fs.readFileSync('docs/avatar-camera-shake-smoke.json','utf8'));
const report = {scope: 'Read-only original supplied data inventory. References and flags do not prove execution order, spawn selection, account loadout, enabled defaults or class lifecycle. Missing flags remain null. Checklist percentage counts listed checkpoints only; complete reverse-engineering percentage is unknown.',
  executableSha256: '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20',
  implementationOrder: ['Objects.level.bin 模型调用与 BstBaked.meshes 共享渲染链优先', 'Avatar 同批重点推进；所有基础类、环境类与逻辑类继续闭合依赖', '最终完成原游戏逻辑与完整 Avatar 游玩验收'],
  fullOriginalGameLogicTargetPercent:100,
  perObjectProgress:{report:'docs/Objects.level.bin对象实现清单.json',markdown:'docs/Objects.level.bin全部实现清单.md',html:'docs/Objects.level.bin对象实现清单.html',completeInstanceRuntimeVerified:false},
  currentBstPriority:'BstBaked.meshes 五段同等优先推进至各 9/10（90%），第 10 项保留 Windows 真机及原游戏验收；共享对象/资源/生成/Visibility 依赖一起恢复。',
  perClassProgress:{report:'docs/Objects.level.bin类进度.json',markdown:'docs/Objects.level.bin类进度清单.md',html:'docs/Objects.level.bin类进度.html',uiCheck:'docs/objects-class-progress-ui-check.json',summary:null as unknown,fullRuntimePercent:null},
  summary, checklist, nativeProperties: Object.fromEntries([...important].filter(n => properties[n]).map(n => [n, properties[n]])),
  outfits: {path: 'Resources/OutfitDefs.json', sha256: digest(outfitBytes), slots,
    fields: [...outfitFields].sort(), defaultDefinitions: outfits.filter(o => o.isDefault),
    animationReferences: [...animations].sort(), startupLoadoutResolved: false, accountUnlocksResolved: false},
  rail: {cacheReport: 'docs/rail-cache-oracle.json', evaluationReport: 'docs/rail-oracle.json', normalInitializedInputsVerified: railVerified,
    arcReport: 'docs/rail-arc-oracle.json', arcSnapshotsVerified: railArcReport?.passed === true,
    arcCorpusRails: railArcReport?.corpusRails ?? 0, arcExcludedQueries: railArcReport?.excludedQueries ?? [],
    completeLifecycleRestored: false, degenerateQueriesResolved: false, macOSLibmVerified: false},
  bakedLookup: {report: 'docs/baked-lookup-oracle.json', nativeBindings: 'docs/baked-bindings-native.json', snapshotLookupAndAcceptanceVerified: bakedLookupReport?.passed === true,
    corpusMaps: bakedLookupReport?.corpusMaps ?? 0, queries: bakedLookupReport?.queries ?? 0,
    actualLoadedStateRestored: false, objectGuidDispatchRestored: false, completeModelLifecycleRestored: false},
  visibility: {report:'docs/visibility-submit-oracle.json', numericSubmitChainVerified:visibilitySubmitReport?.passed===true,
    corpusMaps:visibilitySubmitReport?.corpusMaps??0,corpusVertices:visibilitySubmitReport?.corpusVertices??0,corpusIndices:visibilitySubmitReport?.corpusIndices??0,
    sphereQueryReport:'docs/visibility-spheres-oracle.json',sphereNumericQueriesVerified:visibilitySphereReport?.passed===true,
    sphereQueryCases:visibilitySphereReport?.cases??0,sphereQueryComparisons:visibilitySphereReport?.compared??0,
    aabbQueryReport:'docs/visibility-aabbs-oracle.json',aabbNumericQueriesVerified:visibilityAabbReport?.passed===true,
    aabbQueryCases:visibilityAabbReport?.cases??0,aabbQueryComparisons:visibilityAabbReport?.compared??0,
    corpusGeometryBounds:visibilityAabbReport?.corpusGeometryBounds??0,
    realSphereAabbQueriesRestored:false,objectDropOcclusionDependenciesRestored:false,viewportIntegrated:false,hardwareVerified:false},
  experienceRequirements: {
    scope:'Avatar 验收为完整原游戏游玩体验；本节是需求清单，字段和资源清点不表示运行已完成。',
    editorModes:['meshes','objects'], triggerPosition:'actual camera world position', editorCameraStyle:'third person camera', zoom:'move camera forward/backward; retain projection/focal length',
    modeTransition:'enter Avatar at original map default spawn; restore last editor camera position/orientation/target when returning',
    avatarMode:'original playable player, camera, UI and runtime effects',
    hiddenEditorControlsInAvatar:['selection/gizmos','geometry brushes','object/mesh inspector/tree','editor helpers/grid','editor camera controller'],
    gameUi:['candle button','settings button','wing icon','wing energy','wing icon opens action bar','wardrobe button opens wardrobe panel'],
    sharedTriggers:['region enter/exit','world icons','DisplayText','TGUI buttons/text','environment changes'],
    completePlayableExperienceVerified:false,avatarModeImplemented:false,originalDefaultSpawnResolved:false,gameUiImplemented:false,sharedTguiEventsRestored:false,
    returnEditorCameraVerified:avatarModeReport.passed===true,editorAvatarPreviewImplemented:avatarModeReport.passed===true
  },
  avatarSetPosRuntime:{report:'docs/avatar-set-pos-oracle.json',verified:avatarSetPosReport.passed===true,cases:avatarSetPosReport.cases,comparedBytes:avatarSetPosReport.comparedBytes,scope:avatarSetPosReport.scope,joinedPhysicalCameraReport:'docs/avatar-physical-oracle.json',joinedPhysicalCameraVerified:avatarPhysicalReport.passed===true,joinedCases:avatarPhysicalReport.cases,joinedComparedBytes:avatarPhysicalReport.comparedBytes,completeClassRuntimeVerified:false},
  avatarLocomotionRuntime:{report:'docs/avatar-locomotion-oracle.json',verified:avatarLocomotionReport.passed===true,cases:avatarLocomotionReport.cases,comparedBytes:avatarLocomotionReport.comparedBytes,scope:avatarLocomotionReport.scope,slidePreviewVerified:avatarModeReport.passed===true&&!!avatarModeReport.avatarSlide,collisionServiceRestored:false,animationPlaybackRestored:false,completeClassRuntimeVerified:false},
  beamoRenderRuntime:{report:'docs/beamo-render-oracle.json',verified:beamoRenderReport.passed===true,cases:beamoRenderReport.cases,corpus:beamoRenderReport.corpus,comparedBytes:beamoRenderReport.comparedBytes,completeGpuDrawingRestored:false,completeClassRuntimeVerified:false},
  renderPipelineRuntime:{report:'docs/render-pipeline-oracle.json',verified:renderPipelineReport.passed===true,cases:renderPipelineReport.cases,preparedCases:renderPipelineReport.preparedCases,corpus:renderPipelineReport.corpus,comparedBytes:renderPipelineReport.comparedBytes,sharedCpuLifecycleRestored:true,actualShaderReflectionRestored:false,gpuResourceServicesRestored:false,completeClassRuntimeVerified:false},
  renderListRuntime:{report:'docs/render-list-oracle.json',verified:renderListReport?.passed===true,cases:renderListReport?.cases??0,preparedCases:renderListReport?.preparedCases??0,comparedBytes:renderListReport?.comparedBytes??0,sharedCpuRegistrationQueueContextRestored:renderListReport?.passed===true,viewportIntegrated:false,completeSceneRestored:false,completeClassRuntimeVerified:false},
  beamoDrawPreview:{report:'docs/beamo-draw-verification.json',staticLod0DrawingVerified:beamoDrawReport?.passed===true,skyHub2:beamoDrawReport?.skyHub2??null,completeGpuDrawingRestored:false,completeClassRuntimeVerified:false,scope:'Recovered packed LOD0 upload and original material shaders in the editor. Full Model/Barn ownership, automatic LOD/Visibility, external weight volumes, skinning and original scene lifecycle remain pending.'},
  avatarCameraRuntime:{report:'docs/avatar-camera-oracle.json',nativeEntries:'docs/avatar-camera-native.json',entryPoseVerified:avatarCameraReport.passed===true,cases:avatarCameraReport.cases,comparedComponents:avatarCameraReport.comparedComponents,resetStateReport:'docs/avatar-physical-oracle.json',completeResetStateVerified:avatarPhysicalReport.passed===true,directionArithmeticVerified:avatarPhysicalReport.passed===true,readinessGateVerified:avatarPhysicalReport.passed===true,joinedCases:avatarPhysicalReport.cases,joinedComparedBytes:avatarPhysicalReport.comparedBytes,independentPreviewCamerasVerified:avatarModeReport.passed===true,fullNativeCameraVerified:false},
  avatarPreview:{report:'docs/avatar-mode-smoke.json',implemented:avatarModeReport.passed===true,parts:avatarModeReport.parts,scope:avatarModeReport.scope,completePlayableExperienceVerified:false},
  cameraEventRuntime:{report:'docs/camera-events-oracle.json',verified:cameraEventsReport.passed===true,cases:cameraEventsReport.cases,frames:cameraEventsReport.frames,comparedBytes:cameraEventsReport.comparedBytes,corpusConfigurations:cameraEventsReport.corpusConfigurations,scope:cameraEventsReport.scope,previewReport:'docs/camera-events-smoke.json',explicitAvatarEventPreviewVerified:cameraEventsUi.passed===true,automaticSceneDispatchVerified:false,continuousShakeRenderingVerified:false,completeClassRuntimeVerified:false},
  avatarPositionalShake:{report:'docs/avatar-camera-shake-oracle.json',verified:cameraShakeReport.passed===true,cases:cameraShakeReport.cases,frames:cameraShakeReport.frames,comparedBytes:cameraShakeReport.comparedBytes,scope:cameraShakeReport.scope,previewReport:'docs/avatar-camera-shake-smoke.json',positionShakePreviewVerified:cameraShakeUi.passed===true,originalAvoidanceVerified:false,keyFrameShakeDrawingVerified:false,fullNativeCameraVerified:false},
  animationPacks: packs, uiAssets: files.filter(p => /UIOutfitAtlas|UIGestureAtlas|[Ee]mote/.test(path.basename(p))).map(p => path.relative(data, p)).sort(), levels};
fs.writeFileSync('docs/Objects与Avatar进度.json', JSON.stringify(report, null, 2) + '\n');
console.log(JSON.stringify(summary));
report.perClassProgress.summary=generateObjectsClassProgress();
fs.writeFileSync('docs/Objects与Avatar进度.json',JSON.stringify(report,null,2)+'\n');
