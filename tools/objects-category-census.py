#!/usr/bin/env python3
"""Summarize the reviewed object inventory without counting models as classes."""
import collections
import datetime
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def read(name):
    return json.loads((ROOT / name).read_text())


inventory = read('docs/Objects.level.bin类进度.json')
behavior = read('docs/Objects.level.bin逻辑实现列表.json')
rtti = {row['name']: row for row in read('docs/classes.json')}
status = {row['name']: row['status'] for row in behavior['classes']}
assert len(status) == len(inventory['classes']) == 283
assert set(status) == {row['name'] for row in inventory['classes']}

groups = []
for group in inventory['groups']:
    rows = [row for row in inventory['classes'] if row['functionGroupId'] == group['id']]
    classes = []
    for row in rows:
        for source in row['implementation']:
            assert (ROOT / source).is_file(), (row['name'], source)
        classes.append({
            'name': row['name'], 'role': row['functionRole'],
            'instances': row['instances'], 'status': status[row['name']],
            'coreSubchainVerified': row['coreSubchainVerified'],
            'runtimeComplete': row['completeClassRuntimeVerified'],
            'implementation': row['implementation'],
        })
    groups.append({
        'id': group['id'], 'name': group['name'], 'classCount': len(classes),
        'objectCount': sum(row['instances'] for row in classes),
        'statusCounts': dict(collections.Counter(row['status'] for row in classes)),
        'classes': classes,
    })
assert sum(g['classCount'] for g in groups) == 283
assert sum(g['objectCount'] for g in groups) == 49824

# Reviewed biological families; shell items, social commands and quest prefabs
# belong to other groups. This is an explicit list, not keyword classification.
creature_group = next(g for g in groups if g['id'] == 'creatures')
creature_extra = '''BirdFlocks BirdV2Ai BirdV2AiSwap BirdV2Barn
BuddyBarn BuddyChangeAuthorityRpc CrabAi CrabBarn CrabChangeAuthorityRpc
CrabEatMoteRpc CrabImpulseRpc CreateCritterV2 CritterMsg_Go
CritterMsg_HearPlayerShout CritterMsg_Stop CritterV2 CritterV2Barn
CritterV2Event CritterV2Message Critter_OnRegion Critter_OnTouch Critter_SendMsg
DarkCreatureBarn FishV2 FishV2Params SetDarkCreaturesMusicFloat SimpleBird
SimpleBirdBrain SimpleBirdBrainParams SimpleCritterBarn SimpleCritterBrain
SmallDarkCreature SmallDarkCreatureZone WhaleFairy WhaleFairyBarn'''.split()
creature_names = sorted([c['name'] for c in creature_group['classes']] + creature_extra)
assert len(set(creature_names)) == len(creature_names) == 52
assert set(creature_names) <= set(rtti)
declared_creature_names = sorted(set(creature_names) & set(status))
undeclared_creature_names = sorted(set(creature_names) - set(status))
assert len(declared_creature_names) == 18 and len(undeclared_creature_names) == 34
construction = set(read('docs/creature-construction.json')['classes'])
acceleration_report = read('docs/bird-acceleration-oracle.json')
assert acceleration_report['passed'] is True
assert acceleration_report['executableSha256'] == '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20'
continuation_reports = {name: read(name) for name in [
    'docs/bird-motion-oracle.json', 'docs/bird-motion-flight-oracle.json',
    'docs/bird-steering-motion-oracle.json', 'docs/creature-lifecycle-oracle.json',
    'docs/bird-force-oracle.json', 'docs/creature-force-oracle.json',
    'docs/bird-rail-oracle.json', 'docs/bird-rail-chain-oracle.json',
    'docs/bird-follow-oracle.json', 'docs/bird-follow-chain-oracle.json']}
for report in continuation_reports.values():
    assert report['passed'] is True
    assert report['comparedCases'] == report['cases']
    assert report['executableSha256'] == acceleration_report['executableSha256']
shared_animation_reports = {name: read(name) for name in [
    'docs/resource-animation-update-oracle.json',
    'docs/fish-group-animation-update-oracle.json']}
for report in shared_animation_reports.values():
    assert report['passed'] and not report['failures']
    assert report['executableSha256'] == acceleration_report['executableSha256']
    assert report['completeCreatureClasses'] == 0
continuation_spec = read('tools/objects-class-progress-spec.json')['classes']
continuation_bodies = {}
for function, detail in continuation_reports['docs/creature-lifecycle-oracle.json']['functions'].items():
    owner = function.split('.')[0]
    if owner in creature_names:
        continuation_bodies.setdefault(owner, []).append({'name': function, **detail})
bird_chain = continuation_reports['docs/bird-steering-motion-oracle.json']
continuation_bodies['BirdV2'] = [
    {'name': 'BirdV2.Update', 'start': bird_chain['start'], 'end': bird_chain['end']},
    {'name': 'BirdV2.FlightIntegration', **bird_chain['flightIntegration']},
    {'name': 'BirdV2.Motion', **bird_chain['motion']}]
continuation_bodies['BirdV2Ai'] = [{'name': 'BirdV2Ai.Acceleration', **bird_chain['acceleration']}]
for function, detail in continuation_reports['docs/bird-force-oracle.json']['forces'].items():
    if function.startswith('BirdV2Ai.'):
        continuation_bodies['BirdV2Ai'].append({'name': function, **detail})
for function, detail in continuation_reports['docs/bird-rail-oracle.json']['functions'].items():
    if function.startswith('BirdV2Ai.'):
        continuation_bodies['BirdV2Ai'].append({'name': function, **detail})
for function, detail in continuation_reports['docs/bird-follow-oracle.json']['functions'].items():
    if function.startswith('BirdV2Ai.'):
        continuation_bodies['BirdV2Ai'].append({'name': function, **detail})
native_creatures = [{
    'name': name, 'rttiAddress': rtti[name]['rttiAddress'],
    'declaredInScannedMaps': name in status,
    'mapStatus': status.get(name),
    'hasRecoveredConstruction': name in construction,
    'constructionEvidence': ['src/core/creature-construction-runtime.ts', 'docs/creature-construction-oracle.json'] if name in construction else [],
    'restoredAccelerationDispatcher': name == 'BirdV2Ai',
    'accelerationEvidence': ['src/core/bird-acceleration-runtime.ts', 'docs/bird-acceleration-native.json', 'docs/bird-acceleration-oracle.json'] if name == 'BirdV2Ai' else [],
    'restoredContinuationBodies': continuation_bodies.get(name, []),
    'continuationImplementation': continuation_spec.get(name, {}).get('implementation', []) if name in continuation_bodies else [],
    'continuationEvidence': (['docs/bird-steering-motion-oracle.json', 'docs/bird-force-oracle.json', 'docs/creature-force-oracle.json', 'docs/bird-rail-oracle.json', 'docs/bird-rail-chain-oracle.json', 'docs/bird-follow-oracle.json', 'docs/bird-follow-chain-oracle.json'] if name in ['BirdV2', 'BirdV2Ai'] else ['docs/creature-lifecycle-oracle.json']) if name in continuation_bodies else [],
    'runtimeComplete': False,
    'remaining': '完整自主更新、模型/动画资源 owner、碰撞/联网与生命周期仍需逐项接通。',
} for name in creature_names]

nature = read('docs/objects-nature-audit.json')
model_counts = collections.Counter(
    (row['className'], row['model']['resourceName']) for row in nature['creatureModels'])
bindings = []
for (name, resource), count in sorted(model_counts.items()):
    example = next(row for row in nature['creatureModels']
                   if row['className'] == name and row['model']['resourceName'] == resource)
    bindings.append({
        'className': name, 'resourceName': resource, 'instances': count,
        'resourceExists': example['model']['resourceExists'],
        'example': {'level': example['level'], 'creatureNodeId': example['creatureNodeId'],
                    'parameterNodeId': example['parameterNodeId'],
                    'levelMeshNodeId': example['model']['nodeId']},
    })
assert sum(row['instances'] for row in bindings if row['className'] == 'BirdV2') == 184

items_construction = read('docs/object-item-construction.json')['classes']
outside = {
    'creatureConstruction': sorted(construction - set(status)),
    'itemConstruction': sorted(set(items_construction) - set(status)),
}
visual_control_reports = {f: read(f) for f in ['docs/dark-creature-spotlight-oracle.json', 'docs/move-object-along-rail-control-oracle.json', 'docs/vector-safe-slerp-oracle.json']}
assert all(r['passed'] and r['executableSha256'] == '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20' for r in visual_control_reports.values())
report = {
    'updatedAtUTC': datetime.datetime.now(datetime.timezone.utc).isoformat(),
    'scope': '33 张地图的 283 个声明类按现有逐类职责分组；实体、参数、事件分别计类。'
             '原 RTTI 生物补充范围使用显式审核名单，包含 AI、管理器和网络消息，'
             '不把模型数量或资源准备状态计为完成类。',
    'sources': ['docs/classes.json', 'docs/Objects.level.bin类进度.json',
                'docs/Objects.level.bin逻辑实现列表.json', 'tools/objects-function-spec.json',
                'docs/creature-construction.json', 'docs/object-item-construction.json',
                'docs/objects-nature-audit.json', *continuation_reports, *shared_animation_reports, *visual_control_reports],
    'summary': {'rttiTypes': len(rtti), **behavior['summary'],
                'nativeCreatureFamilyTypes': len(native_creatures), 'mapDeclaredCreatureFamilyTypes': len(declared_creature_names), 'undeclaredCreatureFamilyTypes': len(undeclared_creature_names), 'recoveredCreatureParentConstructors': len(construction)},
    'groups': groups,
    'overlappingPlantSubsets': [
        {'name': '燃烧对象与事件（用于进一步核对黑暗植物）', 'classes': ['Blaze', 'OnBlaze'],
         'note': '已计入 effects；黑暗植物还有 LevelMesh 资源与共享事件控制，不据模型名称推断独立 Plant 类。'},
        {'name': '花草区域', 'classes': ['FlowerPatch'], 'note': '已计入 effects；原 owner FlowerBarn 不在当前地图声明中。'},
    ],
    'nativeCreatureFamilies': native_creatures,
    'continuationVerification': {
        'cases': sum(r['cases'] for r in continuation_reports.values()),
        'comparedBytes': sum(r['comparedBytes'] for r in continuation_reports.values()),
        'serviceCalls': sum(r['serviceCalls'] for r in continuation_reports.values()),
        'completeCreatures': 0,
        'scope': '各恢复调用体与组合链均为部分运行实现；不同报告的场景与子函数可重叠。'},
    'sharedAnimationDependencyVerification': {
        'reports': list(shared_animation_reports),
        'cases': sum(r['comparedCases'] for r in shared_animation_reports.values()),
        'frames': sum(r['comparedFrames'] for r in shared_animation_reports.values()),
        'comparedBytes': sum(r['comparedBytes'] for r in shared_animation_reports.values()),
        'serviceCalls': sum(r['serviceCalls'] for r in shared_animation_reports.values()),
        'actualFishConfigurations': 5, 'completeCreatureClasses': 0,
        'scope': '共用 Animation.Update、动态骨骼权重与 Transform 世界缓存已逐帧对照；五处实际鱼群请求另核验动作结束和恢复游动。未完成各类 Model/世界/场景 owner，不能把共用依赖计作完整生物类。'},
    'constructionTypesAbsentFromMapDeclarations': outside,
    'eyeProjectionAndRailControlVerification': {
        'reports': list(visual_control_reports),
        'cases': sum(r['comparedCases'] for r in visual_control_reports.values()),
        'comparedBytes': sum(r['comparedBytes'] for r in visual_control_reports.values()),
        'serviceAndMathCalls': sum(r.get('serviceCalls', r.get('mathCalls', 0)) for r in visual_control_reports.values()),
        'wholeEyeAndProjectionPhaseVerified': True, 'wholeMoveObjectAlongRailUpdateVerified': False,
        'completeCreatureClasses': 0,
        'scope': '冥龙眼部／探照计算链、鱼群轨道Update控制前段和完整SafeSlerp已原对照；后续交互／声音、对象移动循环、真实资源／世界／渲染owner及完整视口／生命周期仍待接。'},
    'modelBindings': bindings,
}
(ROOT / 'docs/生物物品环境类扫描.json').write_text(
    json.dumps(report, ensure_ascii=False, indent=2) + '\n')

lines = ['# 生物、物品与环境类扫描', '', report['scope'], '',
         '当前原类目录识别到 1,063 个 RTTI 类型；33 张地图有 283 个声明类、280 个顶层实例类，49,824 个对象。',
         '', '以下分组互不重复；“部分实现”包含恢复的构造、字段装载或局部函数，整类完整行为验收仍为 0。', '',
         '| 类别 | 类数 | 对象数 | 部分实现 | 实现中 | 待实现 | 仅声明 |',
         '|---|---:|---:|---:|---:|---:|---:|']
for g in groups:
    s = g['statusCounts']
    lines.append(f"| {g['name']} | {g['classCount']} | {g['objectCount']} | {s.get('部分实现', 0)} | {s.get('实现中', 0)} | {s.get('待实现', 0)} | {s.get('仅声明待核实', 0)} |")
lines += ['', '## 生物、物品和环境逐类名单', '']
for g in groups:
    if g['id'] not in ['creatures', 'collectibles', 'fragments', 'environment', 'weather', 'effects', 'terrain', 'npc']:
        continue
    lines += [f"### {g['name']}：{g['classCount']} 类", '',
              '| 类 | 职责 | 对象数 | 状态 |', '|---|---|---:|---|']
    for c in g['classes']:
        lines.append(f"| {c['name']} | {c['role']} | {c['instances']} | {c['status']} |")
    lines.append('')
lines += ['## 原程序补充生物类', '',
          '当前目录核对到 52 个生物相关类型：18 个当前地图声明类（生物分组 17 个，区域分组 Critter_OnRegion 1 个），加 34 个地图未声明的 AI、管理器、其他生物和消息类型。存在原类不代表其完整逻辑已经实现。', '',
          '当前地图声明外的 34 个类型：', '', ', '.join(undeclared_creature_names), '',
          '已恢复构造但不在当前 283 地图声明中的类：' + ', '.join(outside['creatureConstruction'] + outside['itemConstruction']) + '。', '',
          '鸟／遥鲲的加速度、原转向 Begin／End、飞行积分、位移朝向和 Model 变换已有 180 组组合核验；实际 TargetDistance／SteerTarget／SteerGuide、Seek／Wander／Flocking／Flee 加入同一原 Update 后新增 117 组零差异，独立 Wander／Flee 另有 123 组。鱼的 Load／Unload／Transform、冥龙警戒／返回与实际 Seek／切轨、螃蟹 Barn 归属／更新另有 270 组零差异；本次轨道选择／FollowRail／GetPoint 独立 198 组、实际轨道 AI→转向／飞行／位移／Update 93 组零差异；对象跟随与直接 Seek／Brake／Orbit 独立 283 组、整帧组合 67 组新增零差异；轨道几何／metadata、真实 Avatar／世界位置／OBB 投影、Critter 效果、真实资源、世界与完整 AI／联网 owner 仍待接，详见 [生物类续接](生物类续接.md)。', '',
          '## 鸟与遥鲲的实际引用', '',
          '原地图中的 BirdV2 → BirdV2Params.meshType → LevelMesh.resourceName 直接给出以下绑定。鸟为 143 个实例，遥鲲为 41 个实例；二者合计 184 个 BirdV2。', '',
          '| 对象类 | 原模型 | 实例 | 资源存在 | 示例地图／对象／参数／模型节点 |', '|---|---|---:|---|---|']
for b in bindings:
    e = b['example']
    lines.append(f"| {b['className']} | {b['resourceName']} | {b['instances']} | {'是' if b['resourceExists'] else '否'} | {e['level']} / {e['creatureNodeId']} / {e['parameterNodeId']} / {e['levelMeshNodeId']} |")
lines += ['', 'CharSkyRayYoungAnim 资源仍缺失；动态生物动画和 AI 的实际 owner／场景接入尚未完成。', '',
          '冥龙巡视光圈：眼部／警戒扫动、朝向插值、地面射线落点、玩家／鸟跟随、半径收缩、环境颜色和Marker更新已有504组原对照零差异；鱼群轨道控制与SafeSlerp另1258组通过。真实资源／渲染owner、完整视口、后续声音／交互及全部生物验收仍未完成，详见[冥龙探照光圈与鱼群轨道控制续接](冥龙探照光圈与鱼群轨道控制续接.md)。', '',
          '## 黑暗植物与花草', '',
          'FlowerPatch 是花草区域类，582 个对象；FlowerBarn 是原管理器。Blaze 和 OnBlaze 共 2 类、22 个对象，属于燃烧逻辑，已包含在效果组。黑暗植物的 LevelMesh 与共享事件还需单独闭合，不能把所有植物模型重复计为独立逻辑类。', '',
          '复核命令：`python3 tools/objects-category-census.py`。完整来源与逐类实现文件见同名 JSON。', '']
(ROOT / 'docs/生物物品环境类扫描.md').write_text('\n'.join(lines))
print(json.dumps(report['summary'], ensure_ascii=False))
