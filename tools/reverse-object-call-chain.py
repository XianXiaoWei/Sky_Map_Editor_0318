#!/usr/bin/env python3
"""SHA-gated Objects execution roots, real call sites and class dependencies.

Bounded disassembly establishes direct edges. Indirect calls and unexpanded
frontiers stay explicit; serialized reference leaves are not native leaves.
"""
import bisect
import json
import pathlib
import re
import struct
import sys
from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_OP_REG, X86_REG_RIP
from native import Native

root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
roots = {
    'Game.resourceBootstrap': 0x100376360, 'Game.queueBootstrapScript': 0x100375e40,
    'Game.Initialize': 0x100376f80, 'Game.levelUnloadBranch': 0x1003781b0,
    'Game.levelLoadBranch': 0x1003784a0, 'Game.updateBranch': 0x100378b60,
    'ModuleBarn.build': 0x1007b0620, 'ModuleBarn.dispatch': 0x1007b1b40,
    'LevelObjects.readSource': 0x10040d9e0, 'LevelObjects.TGCL': 0x10040bc00,
    'LevelObjects.readFields': 0x10040b390, 'LevelObjects.readString': 0x10040b1d0,
    'LevelObjects.registration': 0x10040eb90,
    'ObjectFactory.Initialize': 0x1004d0680, 'ObjectFactory.CreateObject': 0x1004d0b60,
    'ObjectFactory.ReleaseObject': 0x1004d0e00, 'ObjectFactory.GetObjectInitPriority': 0x1004d0fd0,
    'ObjectFactory.methodLookup': 0x1004d2330, 'ObjectFactory.registration': 0x1004d1b40,
    'Meta.byId': 0x1007abd30, 'Meta.byName': 0x1007abc80, 'Meta.restoreVptr': 0x1007abd80,
    'Float.placement': 0x100716930, 'Float.heapConstruction': 0x1007168d0,
    'Float.release': 0x100716910, 'ValueBarn.Initialize': 0x100715760,
    'ValueBarn.CreateValue': 0x100716250, 'ValueBarn.ReleaseValue': 0x100716360, 'ValueBarn.OnLevelUnload': 0x100715cd0,
    'ResourceManager.queueScript': 0x1007c38b0, 'ResourceManager.queueUnloadScript': 0x1007c2bd0,
    'ResourceManager.processUnload': 0x1007c3010, 'ResourceManager.LoadNext': 0x1007c3d20,
    'ResourceManager.registerResource': 0x1007c3e30, 'ResourceManager.unregisterResource': 0x1007c41e0,
    'ResourceManager.AddToLoadList': 0x1007c2230, 'ResourceManager.AddToUnloadList': 0x1007c2250,
    'Resource.IncLoadCount': 0x1007c1b40, 'Resource.DecLoadCount': 0x1007c1b50, 'Resource.GetLoadCount': 0x1007c1b60,
    'ResourceManager.registration': 0x1007c5e60,
    'LevelData.load': 0x1003f4840, 'LevelData.findBakedGuid': 0x1003f68d0,
    'EventBarn.Update': 0x10032ea90, 'EventBarn.OnLevelLoad': 0x10032e540,
    'EventBarn.ReleaseAll': 0x10032e920, 'Event.Start': 0x10032ef60,
    'Event.constructor': 0x10032eea0, 'FloatMult.placement': 0x100719090,
    'Event.registration': 0x100332290, 'FloatMult.execute': 0x1007191a0,
    'EventBarn.Initialize': 0x10032e4a0, 'EventBarn.createEventTemplate': 0x100039f40,
    'EventBarn.releaseNode': 0x10032f350, 'EventBarn.createTrigger': 0x10032ecf0,
    'NativeString.growAndReplace': 0x1000198c0,
    'FloatAdd.placement': 0x100719390, 'FloatAdd.Update': 0x1007194a0,
    'SetFloat.placement': 0x1007175d0, 'SetFloat.OnLevelLoad': 0x1007176e0,
    'SetFloat.OnEnable': 0x1007176f0, 'SetFloat.OnResume': 0x100717710, 'SetFloat.Update': 0x100717730,
    'EventBarn.typeMapInsertion': 0x1003320e0, 'NativeTree.insertBalance': 0x1001a7bb0,
    'EventBarn.clearTypeMap': 0x10032fa30, 'Event.GetMaxTypeIdx': 0x10032f1d0,
    'EventBarn.Dispatch': 0x10032f5b0, 'EventBarn.sortUnique': 0x100330980,
    'EventBarn.sortSequence': 0x1003315d0, 'Event.Enable': 0x10032e2f0, 'Event.SetEnabled': 0x10032e2c0,
    'ObjectFactory.SetEnabled': 0x1004d1f60, 'ObjectFactory.GetEnabled': 0x1004d2050,
    'Event.GetEnabled': 0x10032e2e0,
    'Event.setWrapper': 0x10032fd60, 'Event.getWrapper': 0x10032fe80,
    'Clump.placement': 0x10022c2d0, 'Clump.SetEnabled': 0x10022b7f0,
    'Clump.AllocateClumpData': 0x10022b840, 'Clump.destroyData': 0x10022bd60,
    'Clump.setWrapper': 0x10022c720, 'Clump.allocateWrapper': 0x10022c840,
    'ClumpBarn.Initialize': 0x10022bdc0, 'ClumpBarn.CreateClump': 0x10022bf80,
    'ClumpBarn.CreateCountedClump': 0x10022c000, 'ClumpBarn.ReleaseClump': 0x10022c0c0,
    'ClumpBarn.OnLevelUnload': 0x10022bee0, 'Enable.placement': 0x100316c40,
    'Enable.Update': 0x1003162f0, 'IfEnabled.placement': 0x100718210, 'IfEnabled.Update': 0x100718320,
    'Event.Resume': 0x10032f0f0,
    'LevelModelBarn.restoreVtables': 0x100407b20,
    'AvatarSetPos.placement': 0x100149b30, 'AvatarSetPos.Update': 0x100149c40,
    'AvatarBarn.FindLocalAvatar': 0x1000ff210, 'AvatarBarn.GetLocalAvatar': 0x1000fc260,
    'Avatar.SetPosition': 0x100100fb0, 'Avatar.directionToEuler': 0x100146d00,
    'AvatarPhysical.SetPosition': 0x100146de0, 'AvatarPhysical.SetPositionImmediate': 0x1001480d0,
    'Avatar.eulerToForward': 0x100147510, 'AvatarBarn.IsLocalReady': 0x1000fe060,
    'Avatar.MarkerForward': 0x10043d900, 'CollisionHit.materialChannel': 0x10022ddd0,
    'CameraSystem.Initialize': 0x1001de020, 'CameraSystem.Update': 0x1001def10,
    'WhiskerCamera.Initialize': 0x10073aa90, 'WhiskerCamera.Reset': 0x10073ab80,
    'SetCameraShake.OnStart': 0x1003a0ec0, 'SetCameraShake.Update': 0x1003a0ee0,
    'SetCameraKeyFrameShake.OnStart': 0x100591d90, 'SetCameraKeyFrameShake.Update': 0x100591da0,
    'CameraSystem.AcquireCameraHandle': 0x1001e2ac0,
    'WhiskerCamera.ShakeBasisHelper': 0x10073afd0,
    'Delay.placement': 0x1002c62f0, 'Delay.OnEnable': 0x1002c6410,
    'Delay.OnResume': 0x1002c6420, 'Delay.Update': 0x1002c6430,
    'Delay.registration': 0x1002c6b70,
    'FloatSplit.placement': 0x100717a10, 'FloatSplit.Update': 0x100717b20,
    'OnFloat.placement': 0x100719e20, 'OnFloat.destructor': 0x100719f20,
    'OnFloat.Update': 0x100719fc0, 'OnFloat.Evaluate': 0x10071a140,
    'OnFloat.toObject': 0x100719e80, 'OnFloat.fromObject': 0x100719ea0,
    'Marker.placement': 0x10043e1b0, 'Marker.SetEnabled': 0x10043cff0,
    'Marker.GetEnabled': 0x10043e2c0, 'Marker.setWrapper': 0x10043e700, 'Marker.getWrapper': 0x10043e820,
    'MarkerBarn.placement': 0x10043eaa0, 'MarkerBarn.Initialize': 0x10043d020,
    'MarkerBarn.CreateMarker': 0x10043d6a0, 'MarkerBarn.ReleaseMarker': 0x10043d7a0,
    'MarkerBarn.OnLevelUnload': 0x10043d030, 'MarkerBarn.Terminate': 0x10043d1d0,
    'ResumeEnable.placement': 0x10058abf0, 'ResumeEnable.Update': 0x10058a9e0,
    'Clump.OnResumeEnabled': 0x10022bba0, 'Clump.resumeWrapper': 0x10022cba0,
    'Enable.OnResumeEnabled': 0x100316400, 'Enable.resumeWrapper': 0x100316df0,
    'ObjectFactory.TryResume': 0x1004d2440,
    'Marker.SetTransform': 0x10043ccd0, 'Marker.GetTransform': 0x10043e2d0,
    'Marker.LocalObb': 0x10043e470, 'Marker.WorldObb': 0x10043e4b0,
    'Marker.setTransformWrapper': 0x10043e520, 'Marker.getMatrixWrapper': 0x10043e640,
    'Obb.Transform': 0x100076df0,
    'ObjectFactory.SetTransform': 0x1004d1d50, 'ObjectFactory.GetTransform': 0x1004d1e40,
    'ObjectFactory.GetObb': 0x1004d2140, 'ObjectFactory.Extents': 0x1004d2260,
    'TransformObject.placement': 0x1006d94c0, 'TransformObject.OnLevelLoad': 0x1006d5d80,
    'TransformObject.OnStart': 0x1006d6090, 'TransformObject.OnEnable': 0x1006d6370,
    'TransformObject.OnStop': 0x1006d62e0, 'TransformObject.Update': 0x1006d6380,
    'TransformObject.GetResumeEnabled': 0x1006d9150, 'TransformObject.OnResumeEnabled': 0x1006d9160,
    'TransformObject.destructor': 0x1006d9240,
    'LevelMesh.constructor': 0x1004003b0, 'LevelMesh.placement': 0x100403670,
    'LevelMesh.SetTransform': 0x1003ffe10, 'LevelMesh.GetTransform': 0x100402ab0,
    'LevelMesh.SetEnabled': 0x1003ffe50, 'LevelMesh.GetEnabled': 0x100402a80,
    'LevelMesh.GetObb': 0x100402b10, 'LevelMesh.WorldObb': 0x100402b60, 'LevelMesh.BstGuid': 0x100402bc0,
    'LevelMesh.setMatrixWrapper': 0x1004037c0, 'LevelMesh.getMatrixWrapper': 0x1004038e0,
    'LevelMesh.setBoolWrapper': 0x1004039a0, 'LevelMesh.getBoolWrapper': 0x100403ac0,
    'ResourceManager.nameRange': 0x1007c5970, 'ResourceManager.registeredLookup': 0x1007c4360,
    'ResourceRef.constructor': 0x1007c2530, 'Resource.Observe': 0x1007c2310,
    'ResourceRef.destructor': 0x1007c2570, 'ResourceRef.cleanup': 0x1007c2600,
    'MeshInstance.Initialize': 0x10045f880, 'MeshInstance.ResourceConsumer': 0x10045fa00,
    'LevelMesh.Load': 0x100400ed0, 'LevelMesh.Create': 0x100401040,
    'Vertex.dataConstructor': 0x1007f5010, 'Vertex.renderDataConstructor': 0x1007f5b20,
    'Vertex.renderDataForward': 0x1007f5d80, 'Vertex.autoLister': 0x1007f6ca0, 'MeshInstance.UnbakedConsumer': 0x10045f770,
    'Model.MeshLodCount': 0x1004653c0,
    'ModelBarn.CreateBaked': 0x10046ca30, 'ModelBarn.CreateUnbaked': 0x10046c700,
    'Model.SetTransform': 0x100463750, 'Model.SetEnabled': 0x1004636d0,
}
code_ends = {0x10040b390: 0x10040bbe4, 0x100330980: 0x100331018, 0x1003315d0: 0x100331cc0, 0x1007b3dc0: 0x1007b43f4}
functions, pending = {}, [(address, 0) for address in roots.values()]
while pending:
    address, depth = pending.pop(0)
    if address in functions or address not in n.starts:
        continue
    start, end = n.bounds(address)
    try:
        instructions = n.instructions(address, code_end=code_ends.get(address))
    except ValueError as error:
        functions[address] = {'address': hex(address), 'end': hex(end), 'depth': depth, 'decoded': False, 'reason': str(error), 'calls': []}
        continue
    calls, strings = [], []
    for ins in instructions:
        if ins.mnemonic in ('call', 'jmp'):
            op = ins.operands[0]
            if op.type == X86_OP_IMM and (ins.mnemonic == 'call' or op.imm in n.starts and not start <= op.imm < end):
                calls.append({'site': hex(ins.address), 'kind': 'direct' if ins.mnemonic == 'call' else 'tail', 'target': hex(op.imm), 'symbol': n.by_address.get(op.imm)})
                if depth < 1 and op.imm in n.starts:
                    pending.append((op.imm, depth + 1))
            elif op.type in (X86_OP_MEM, X86_OP_REG):
                calls.append({'site': hex(ins.address), 'kind': 'indirect', 'operand': ins.op_str, 'target': None, 'resolved': False})
        for op in ins.operands:
            if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                at = ins.address + ins.size + op.mem.disp
                text = n.string(at)
                if text and len(text) <= 160:
                    strings.append({'site': hex(ins.address), 'address': hex(at), 'text': text})
    functions[address] = {'address': hex(address), 'end': hex(end), 'depth': depth, 'decoded': True, 'calls': calls, 'strings': strings}
    if address in roots.values():
        (root / 'evidence' / ('objects-chain-' + hex(address)[2:] + '.asm')).write_text(n.annotated(address, code_end=code_ends.get(address)))

# The metadata header stores its base-type getter at global+8 (header+0x30).
# Read only proven scalar stores from actual registration instructions.
getters, globals_to_class = {}, {}
for symbol, address in n.symbols.items():
    match = re.fullmatch(r'__Z18GetMetaClassByTypeIP(\d+)(\w+)ERK9MetaClassv', symbol)
    if not match or int(match[1]) != len(match[2]):
        continue
    getters[address] = match[2]
    for ins in n.instructions(address):
        if ins.mnemonic == 'mov' and len(ins.operands) == 2 and ins.operands[1].type == X86_OP_MEM and ins.operands[1].mem.base == X86_REG_RIP:
            globals_to_class[ins.address + ins.size + ins.operands[1].mem.disp] = match[2]
registration_starts = set()
for prefix in [b'\x48\x89\x05', b'\x48\x89\x0d', b'\x48\x89\x1d', b'\x4c\x89\x05']:
    at = 0
    while True:
        at = n.data.find(prefix, at + 1)
        if at < 0 or at >= 0xaa1d96:
            break
        target = 0x100000000 + at + 7 + struct.unpack_from('<i', n.data, at + 3)[0]
        if target in globals_to_class:
            registration_starts.add(n.bounds(0x100000000 + at)[0])
bases, unresolved_bases = {}, {}
for start in sorted(registration_starts):
    try:
        instructions = n.instructions(start)
    except ValueError:
        continue
    registers = {}
    def register(ins, operand):
        return ins.reg_name(operand.reg)
    for ins in instructions:
        ops = ins.operands
        if ins.mnemonic == 'lea' and len(ops) == 2 and ops[0].type == X86_OP_REG and ops[1].type == X86_OP_MEM and ops[1].mem.base == X86_REG_RIP:
            registers[register(ins, ops[0])] = ins.address + ins.size + ops[1].mem.disp
        elif ins.mnemonic == 'mov' and len(ops) == 2:
            value = None
            if ops[1].type == X86_OP_REG:
                value = registers.get(register(ins, ops[1]))
            elif ops[1].type == X86_OP_IMM:
                value = ops[1].imm
            elif ops[1].type == X86_OP_MEM and ops[1].mem.base == X86_REG_RIP and ops[1].size == 8:
                try:
                    value = struct.unpack('<Q', n.read(ins.address + ins.size + ops[1].mem.disp, 8))[0]
                except (StopIteration, struct.error):
                    pass
            if ops[0].type == X86_OP_REG:
                registers[register(ins, ops[0])] = value
            elif ops[0].type == X86_OP_MEM and ops[0].mem.base == X86_REG_RIP:
                target = ins.address + ins.size + ops[0].mem.disp
                owner = globals_to_class.get(target - 8)
                if owner:
                    record = {'getter': hex(value) if value else None, 'store': hex(ins.address), 'registration': hex(start)}
                    if value in getters:
                        bases[owner] = {'className': getters[value], **record}
                    elif value:
                        unresolved_bases[owner] = record
        elif ins.mnemonic == 'call':
            for key in ['rax', 'rcx', 'rdx', 'rsi', 'rdi', 'r8', 'r9', 'r10', 'r11']:
                registers.pop(key, None)
        else:
            _, written = ins.regs_access()
            for reg in written:
                registers.pop(ins.reg_name(reg), None)

class_report = json.loads((root / 'docs/Objects.level.bin类进度.json').read_text())
class_names = {c['name'] for c in class_report['classes']}
classes = []
for c in class_report['classes']:
    schema = []
    for field in c['nativeRegisteredFields']:
        match = re.search(r'GetMetaTypeByTypeIP(\d+)(\w+)ERK8MetaTypev', field['typeGetter'])
        if match and int(match[1]) == len(match[2]):
            schema.append({'className': match[2], 'field': field['name'], 'source': 'native registered pointer type', 'registration': field['registrationFunction']})
    nested = [{'className': field['nestedClass'], 'field': field['name'], 'source': 'serialized nested type'} for field in c['serializedFields'] if field['nestedClass']]
    known = schema + nested
    if c['name'] in bases:
        known.append({'className': bases[c['name']]['className'], 'source': 'native base getter store', **bases[c['name']]})
    classes.append({'className': c['name'], 'instances': c['instances'], 'nestedInstances': c['nestedInstances'], 'knownTypeDependencies': known,
                    'serializedRuntimeLinks': c['serializedDependencies'], 'hasNoSerializedReferenceTargets': not c['serializedDependencies'],
                    'nativeDependenciesComplete': False, 'completeOriginalRuntime': False,
                    'unresolvedBase': unresolved_bases.get(c['name']), 'implementation': c['implementation'], 'coreSubchainVerified': c['coreSubchainVerified']})
module_sequences = [
    {'caller': '0x1003784a0', 'branch': 'level load', 'calls': [{'site': '0x1003789ae', 'name': 'OnLevelLoadEarly'}, {'site': '0x1003789c9', 'name': 'OnLevelLoad'}, {'site': '0x1003789e4', 'name': 'OnLevelLoadLate'}]},
    {'caller': '0x1003781b0', 'branch': 'level unload', 'calls': [{'site': '0x100378257', 'name': 'OnLevelUnload'}, {'site': '0x100378275', 'name': 'OnLevelUnloadLate'}, {'site': '0x10037830f', 'name': 'RenderFlush'}, {'site': '0x100378379', 'name': 'PostRender'}]},
]
for sequence in module_sequences:
    decoded = {int(call['site'], 16): call for call in functions[int(sequence['caller'], 16)]['calls']}
    for call in sequence['calls']:
        assert decoded[int(call['site'], 16)]['target'] == '0x1007b1b40'
scope = 'Objects.level.bin 第一；BstBaked.meshes 与 Avatar 第二。以原加载/创建/字段装载/类型转换/注册/更新/销毁调用依赖推进；引用到未实现的玩法、交互、UI、贴图、音频、shader 和跨模式功能一起恢复。当前图只建立明确入口及直接依赖，间接调用和未展开函数体保留；无 TGCL 引用不等于无原运行依赖。'
calls = [call for f in functions.values() for call in f['calls']]
frontier = sorted({call['target'] for call in calls if call['target'] and int(call['target'], 16) in n.starts and int(call['target'], 16) not in functions})
report = {'executableSha256': n.digest, 'scope': scope, 'completeCallGraph': False, 'completeOriginalGameRuntime': False,
          'roots': {name: hex(address) for name, address in roots.items()}, 'moduleSequences': module_sequences,
          'nativeBases': bases, 'classes': classes, 'functions': list(functions.values()), 'unexpandedDirectFrontier': frontier,
          'summary': {'roots': len(roots), 'boundedFunctions': len(functions), 'directEdges': sum(c['kind'] != 'indirect' for c in calls),
                      'unresolvedIndirectSites': sum(c['kind'] == 'indirect' for c in calls), 'unexpandedDirectBodies': len(frontier),
                      'declaredClasses': len(classes), 'nativeBasesRecovered': sum(c['className'] in bases for c in classes),
                      'serializedReferenceLeafCandidates': sum(c['hasNoSerializedReferenceTargets'] for c in classes)}}
report['resourceDsl'] = {'start': '0x100adb9c0', 'endExclusive': '0x100ae089a', 'source': 'evidence/original-resource-dsl.lua',
                         'functions': ['resourcereg', 'resource', 'resourcedef', 'resourceref', 'SetResConsVars', 'QueueResourcesForLoad', 'QueueResourcesForUnload', 'HotLoadResources'],
                         'fullLuaVmIntegration': False}
report['subchainVerification'] = []
for filename in ['object-foundation-oracle.json', 'module-barn-oracle.json', 'resource-script-oracle.json', 'resource-load-oracle.json', 'resource-manifest-oracle.json', 'tgcl-field-oracle.json', 'native-tree-oracle.json', 'logic-chain-oracle.json', 'marker-transform-oracle.json', 'transform-object-oracle.json', 'level-mesh-oracle.json', 'transform-object-level-mesh-oracle.json', 'model-baked-oracle.json', 'resource-ref-oracle.json', 'model-baked-ref-oracle.json', 'resource-lookup-oracle.json', 'model-baked-registry-oracle.json', 'model-barn-oracle.json', 'model-lod-oracle.json', 'model-unbaked-oracle.json', 'vertex-data-oracle.json', 'transform-sequence-oracle.json', 'object-logic-preview-oracle.json', 'numeric-map-preview-oracle.json', 'set-float-map-preview-oracle.json']:
    verification = json.loads((root / 'docs' / filename).read_text())
    assert verification['passed'] and verification['executableSha256'] == n.digest
    report['subchainVerification'].append({'report': 'docs/' + filename, 'scope': verification['scope'], 'cases': verification.get('cases'), 'files': verification.get('files')})
(root / 'docs/object-call-chain.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
phases = [
    ('共享基础', '原 metadata 类型注册/ID和名字树、Object 转换/虚表、堆、ValueBarn、ObjectFactory、TGCL 字段/引用装载；每个服务继续闭合原函数'),
    ('基础数据类', '先 Float/Value，再按原继承与字段依赖推进独立数据；没有序列化引用的类仅为候选，仍检查原虚方法/全局/资源'),
    ('数值与事件功能', 'FloatMult/FloatAdd/FloatSplit/SetFloat、Event/EventBarn、Clump/Enable/IfEnabled/Delay/OnFloat/ResumeEnable及Marker启用；有循环依赖的功能成组恢复'),
    ('场景与交互功能', 'Marker/Rail、区域触发、任务、对象变换、Timeline、UI 与音效；调用到资源/Avatar/BstBaked 缺口同时实现'),
    ('完整验收', '原场景加载→连续事件/更新→绘制/交互→卸载/恢复；所有类、实例及 Windows/原游戏逐项验收'),
]
md = f'# Objects.level.bin 原调用主链与依赖推进\n\n{scope}\n\n'
md += '实际入口、每条调用地址、未解析间接调用、原类型依赖和全部类见 [机器清单](object-call-chain.json)。当前不宣称已恢复整体游戏运行。\n\n'
md += '关卡文件职责、原 Resources.lua 语义、33关卡资产/对象/烘焙依赖见 [整体架构说明](关卡加载与资源整体架构.md) 和 [全关卡机器清单](level-dependency-audit.json)。\n\n'
md += '| 层次 | 原依赖推进范围 |\n| --- | --- |\n' + '\n'.join(f'| {name} | {content} |' for name, content in phases) + '\n\n'
md += '```mermaid\nflowchart TD\n  Meta[类型注册和查找] --> Factory[ObjectFactory 创建和释放]\n  Modules[ModuleBarn 原调度] --> Factory\n  TGCL[TGCL 类声明和原字段默认规则] --> Factory\n  Factory --> Fields[字段装载和引用解析]\n  Fields --> Load[原注册和分阶段 OnLevelLoad]\n  Load --> Events[EventBarn 与功能类更新]\n  Events --> Dependencies[调用到的场景 UI 音频 贴图 shader 依赖]\n  Dependencies --> Unload[OnLevelUnload 与释放恢复]\n```\n\n'
md += '图表示已定位的职责关系；实际执行由原条件分支、初始化优先级和模块顺序决定，不能按图中箭头自行重排。\n\n'
md += '| 原入口 | 地址 | 当前验收 |\n| --- | --- | --- |\n' + '\n'.join(f'| {name} | `{hex(address)}` | 原反汇编；执行范围以独立 oracle 为准 |' for name, address in roots.items()) + '\n\n'
md += '原加载分支明确调用 OnLevelLoadEarly → OnLevelLoad → OnLevelLoadLate；卸载分支包括 OnLevelUnload、OnLevelUnloadLate、RenderFlush、PostRender，分支条件及实际模块执行次序需继续核验。\n\n'
md += 'Meta ID／区分大小写的名字查找、Object 虚表恢复、ObjectFactory创建/释放/初始化优先级、ValueBarn槽链/卸载及Float构造→运算连续执行见 [基础核验](object-foundation-oracle.json)。`0x1007abd80` 是恢复虚表，不是 Object::Update；Float构造仅写classId，保留Value回链、值及padding。\n\n'
md += 'ModuleBarn完整分发函数见 [分发核验](module-barn-oracle.json)。原内嵌Lua定义/引用/反射赋值/加载计数见 [资源脚本核验](resource-script-oracle.json)，全部37份资源脚本见 [原资源清单核验](resource-manifest-oracle.json)，LoadNext完整原函数见 [队列核验](resource-load-oracle.json)。这些报告只证明所列子链；实际metadata、资源加载虚方法、Lua VM接入、异步完成和模块实际行为继续保留依赖。\n\n'
md += 'TGCL完整ReadString/递归ReadFields/字符串扩容及引用修复局部区间见 [字段核验](tgcl-field-oracle.json) 与 [范围说明](TGCL字段装载与引用修复逆向.md)：417组通过，含260组真实字段数据。metadata匹配/默认缓存准备、内存池和数组构造仍为未闭合依赖。\n\n'
md += '原Event/FloatMult构造、EventBarn初始化/通用槽创建/释放与字段装载连接见 [创建与事件槽连接](对象创建字段装载与事件槽连接逆向.md)：基础2278组、40个命名完整原函数及1个区间通过，含全部14/31/4个真实FloatMult/FloatAdd/SetFloat配置子图；2435个逐帧快照，0差异。原节点顺序保留，引用映射到局部表；槽注册先于字段装载，对象表写入在字段成功之后。原触发唯一ID/类型索引、树插入平衡/非空清理及OnLevelLoad/Update已接入，详见 [FloatMult自动调度](FloatMult触发登记与自动调度逆向.md) 与 [FloatAdd/SetFloat连接](FloatAdd与SetFloat创建装载自动调度逆向.md)。SetFloat原Mac libm仍未核验。对象名索引、完整metadata/default缓存、多功能类与实际场景生命周期继续闭合；完整TGCL和互动玩法未验收。\n\n'
logic = json.loads((root / 'docs' / 'logic-chain-oracle.json').read_text())
md += f'联合对象组与数值条件调用链见 [Enable/IfEnabled/Clump](Enable与IfEnabled对象组调用链逆向.md)、[Delay](Delay创建装载与对象组调度逆向.md)、[FloatSplit/OnFloat](FloatSplit与OnFloat条件事件调用链逆向.md) 、[Marker/ResumeEnable](Marker启用与ResumeEnable恢复调用链逆向.md) 和 [联合原输出核验](logic-chain-oracle.json)：{logic["cases"]}组、{logic["frames"]}快照、{logic["comparedOutputBytes"]}字节0差异，包含{logic["actualPrefixes"]}个真实配置片段。{logic["assertions"]}组原断言、{logic.get("lengthErrors",0)}组字符串长度错误服务与{logic["dependencyBoundaries"]}次缺失类服务边界分列。原字段与引用接到FloatSplit分段输出、OnFloat比较/嵌套/真或假对象组以及Delay时序，并接MarkerBarn池/原启用字段和ResumeEnable→TryResume→Clump/Enable检查点恢复或SetEnabled回退。真实片段最多6帧、48节点，有限执行通过不等于完整依赖图验收。完整metadata/default缓存、cast/Heap/pool、调试流/异常unwind、音乐beat、实际场景及资源/UI/Avatar目标仍待闭合，完整类和实例计数保持零。\n\n'
marker = json.loads((root / 'docs' / 'marker-transform-oracle.json').read_text())
md += f'原Marker空间接口与对象矩阵反射见 [空间变换记录](Marker空间变换与对象反射逆向.md)：{marker["cases"]}组、{marker["comparedOutputBytes"]}字节0差异，全部{marker["realMarkers"]}个真实Marker的GetTransform与SetTransform，以及{marker["lifecycleCases"]}组MarkerBarn创建→启用/矩阵/OBB/extent反射→释放复用。Rail/Avatar出生定位使用同一字节内核；非有限算术/MXCSR、派生虚方法、TransformObject完整依赖和完整场景行为仍为未闭合依赖。\n\n'
transform = json.loads((root / 'docs' / 'transform-object-oracle.json').read_text())
md += f'原对象变换与完成事件见 [TransformObject子链](TransformObject变换与完成事件逆向.md)：{transform["cases"]}组、{transform["snapshots"]}完整内存快照、{transform["comparedOutputBytes"]}字节0差异，全部{transform["realRoots"]}真实根配置中{transform["realCompletedFiniteSequences"]}跑完设定有限序列。{transform["unknownClassBoundaries"]}未知类和{transform["unavailableDependencies"]}次动作前依赖阻断分列；普通/continuous变换、起始/当前目标、两层平滑、恢复和完成Event请求接上原单EventDispatch。完整TGCL/metadata/default、音效、stepped、真实Timeline、LevelMesh等目标和场景生命周期仍待闭合。\n\n'
level_mesh = json.loads((root / 'docs' / 'level-mesh-oracle.json').read_text())
connected_mesh = json.loads((root / 'docs' / 'transform-object-level-mesh-oracle.json').read_text())
md += f'本轮 [LevelMesh与Model状态连接](LevelMesh变换与Model状态连接逆向.md)：独立{level_mesh["cases"]}组、全部{level_mesh["realMeshes"]}真实LevelMesh保存矩阵/GUID核验；连接{connected_mesh["cases"]}组、{connected_mesh["snapshots"]}快照、{connected_mesh["comparedOutputBytes"]}字节0差异，真实根有限通过由91增到{connected_mesh["realCompletedFiniteSequences"]}。原Model普通/延迟变换、启用与visible状态及LevelMesh虚槽GUID已接，真实Model指针为prepared加载前null，合成Model单列；实际资源/baked绑定、动画/提交/绘制/碰撞/卸载与完整场景仍待闭合。\n\n'
md += '资源查找本轮见 [注册表与模型消费者](ResourceManager注册表查找与模型消费者逆向.md)：7,885查询/1,206,824字节以及连接12,069组/101,625,444字节0差异；原同名范围、精确类型选择、ID getter接回原引用/消费者。树注册/bootstrap、metadata转换/真实加载、完整Model创建与LevelMesh绑定仍待闭合。\n\n'
md += 'ModelBarn完整创建wrapper与LOD查询见 [槽分配与参数连接](ModelBarn槽分配参数与LOD查询逆向.md)：2410组/2685560004字节以及查询1168组/9726868字节0差异；池限制/计数提交/参数字节保留。完整constructor仍为明确捕获服务，完整Model创建和实际LevelMesh绑定仍0。\n\n'
md += '无烘焙消费者与Vertex数据构造见 [数据构造依赖](Vertex数据构造与无烘焙模型消费者逆向.md)：1436组/11958208字节和186组/419快照/3438712字节0差异；已接原资源查找/引用及内嵌AutoLister正常登记。GPU上传/队列/绘制/释放、完整Model创建和场景生命周期仍待闭合。\n\n'
preview = json.loads((root / 'docs/transform-preview-availability.json').read_text())
md += f'地图可见效果见 [Objects对象变换播放](Objects对象变换地图播放.md)：显式选择TransformObject，恢复的变换内核与单Event dispatch驱动Marker/LevelMesh编辑器矩阵，支持TransformObject完成接力与循环，可暂停/继续/停止还原。{preview["levels"]}地图{preview["total"]}配置中{preview["available"]}满足当前依赖；原Model指针为prepared null，显示已有编辑器网格。音效/Timeline及其他完成目标明确阻断。候选可用性、11个真实根矩阵回归与Electron/Vulkan播放检查不计作完整原类/实例验收。\n\n'
sequence = json.loads((root / 'docs/transform-sequence-oracle.json').read_text())
md += f'原完成事件接力见 [循环变换地图播放](Objects完成事件与循环变换地图播放.md)：EventBarn完整Update及排序连接TransformObject完成请求和Event::SetEnabled；{sequence["cases"]}真实根、{sequence["snapshots"]}帧完整准备状态、{sequence["comparedOutputBytes"]}字节0差异。初始化的编辑器快照/metadata/槽登记/Heap/GameTime仍是准备输入及服务，原资源/Model/GPU/碰撞/音效/完整场景未验收。\n\n'
object_logic = json.loads((root / 'docs/object-logic-preview-oracle.json').read_text())
logic_preview = json.loads((root / 'docs/object-logic-preview-availability.json').read_text())
logic_available = sum(c['available'] for c in logic_preview['classes'].values())
md += f'对象组/条件/延迟地图效果见 [Enable、IfEnabled与Delay播放](Objects对象组启用延迟与条件地图播放.md)：四类共{logic_available}个配置满足字段/递归依赖预检，另需实际模型已加载；原EventBarn完整Update/排序与首帧load/enable/update/finish连接嵌套Clump、Marker/LevelMesh启用与后续TransformObject。{object_logic["cases"]}组（{object_logic["realRoots"]}真实根、{object_logic["syntheticCases"]}合成混合链）、{object_logic["snapshots"]}帧、{object_logic["comparedOutputBytes"]}字节0差异；每根25帧，长Delay可能仍在等待。Clump缺GetEnabled默认true与原Delay帧时间钳制保留，暂停/停止还原及编辑/模式/切图清理已接入。准备字段/metadata/槽顺序/Heap/GameTime与Linux libm仍是明确输入/服务，Model为prepared null；完整原资源/Model/GPU/碰撞/音效/Avatar/场景与完整类/实例仍待验收。\n\n'
numeric_preview = json.loads((root / 'docs/set-float-map-preview-oracle.json').read_text())
numeric_availability = json.loads((root / 'docs/set-float-map-preview-availability.json').read_text())
numeric_available = sum(c['available'] for c in numeric_availability['classes'].values())
md += f'数值与平滑地图效果见 [FloatAdd、FloatMult与SetFloat播放](Objects数值与平滑控制地图播放.md)：七类{numeric_available}个配置满足字段/递归依赖；{numeric_preview["cases"]}组、{numeric_preview["snapshots"]}帧、{numeric_preview["comparedOutputBytes"]}字节原对照0差异，真实数值配置31/14/4全部覆盖。SetFloat与TransformObject共用Float，原time=0配置首帧结束；临时平台接线、两种单次控制变换和logf/expf服务单独核验。准备输入、JS Math预览、Model/GPU与完整场景边界保留，完整类/实例计数不变。\n\n'
condition_preview = json.loads((root / 'docs/float-condition-map-preview-oracle.json').read_text())
condition_availability = json.loads((root / 'docs/float-condition-map-preview-availability.json').read_text())
condition_available = sum(c['available'] for c in condition_availability['classes'].values())
md += f'条件与分段数值地图效果见 [OnFloat与FloatSplit播放](Objects条件与分段数值地图播放.md)：九类{condition_available}配置满足字段/依赖预检；{condition_preview["cases"]}组、{condition_preview["snapshots"]}帧、{condition_preview["comparedOutputBytes"]}比较字节0差异，含{condition_preview["realRoots"]}真实根与{condition_preview["syntheticCases"]}准备输入。3 OnFloat、全部2 FloatSplit及新增2 Delay真实根接入；双侧嵌套BODY条件/原反转字节、Object分支、短字符串、独立结束请求及Float分段别名写序保留。准备DayHubCave阈值0.35→Delay 0.5秒→原平台变换，15字段修改和同相机渲染帧截图/暂停/还原/清理单列。debug输出、长字符串池与同步条件求值循环阻断；原材质非有限RGB错误、Model/GPU、Avatar与完整场景未验收，完整类/实例仍为零。\n\n'
md += f"共 {len(classes)} 个声明类；{report['summary']['serializedReferenceLeafCandidates']} 个类没有实际非空序列化引用，仅作为基础候选。原基类 getter 已定位 {report['summary']['nativeBasesRecovered']} 类；继承、虚调用、全局和资源依赖未完成者均保留未知。\n\n"
md += '重建：`python3 tools/reverse-object-call-chain.py /path/to/Sky`；基础执行核验：`SKY_DATA=/path/to/Data npx tsx tools/object-foundation-oracle.ts`。\n'
(root / 'docs/Objects原调用主链与依赖推进.md').write_text(md)
print(json.dumps(report['summary'], ensure_ascii=False))

