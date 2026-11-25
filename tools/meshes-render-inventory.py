#!/usr/bin/env python3
"""Create an address-complete native index and evidence-backed render checklist.
Runtime render reachability remains explicit: indirect calls and unexpanded
dependency bodies are not silently counted as implemented or irrelevant.
"""
import bisect
import collections
import hashlib
import json
import pathlib
import re
import sys
from native import Native
from capstone.x86 import X86_OP_IMM
from capstone.x86 import X86_OP_MEM, X86_REG_RIP

root = pathlib.Path(__file__).resolve().parent.parent
n = Native(sys.argv[1])
spec = json.loads((root/'tools/meshes-render-inventory-spec.json').read_text())
for stage in spec['stages']:
    for filename in stage['implementation']+stage['evidence']:
        if not (root/filename).is_file():raise ValueError('Missing inventory evidence/implementation: '+filename)
start_set=set(n.starts)
names = collections.defaultdict(list)
for name,address in n.symbols.items(): names[address].append(name)
index = [{'address':hex(a),'end':hex(n.starts[i+1]) if i+1<len(n.starts) else None,
          **({'symbols':sorted(names[a])} if names[a] else {})} for i,a in enumerate(n.starts)]
(root/'docs/native-function-index.json').write_text(json.dumps({'executableSha256':n.digest,
    'scope':'Every LC_FUNCTION_STARTS entry, including unclassified functions. Address indexing is complete; semantic ownership and indirect reachability are not.',
    'count':len(index),'functions':index},separators=(',',':'))+'\n')
roots = collections.defaultdict(list)
def add(address,reason):
    a=int(address,16) if isinstance(address,str) else address
    start,_=n.bounds(a); roots[start].append(reason)
for stage in spec['stages']:
    for address in stage['addresses']: add(address,{'kind':'stage','id':stage['id'],'site':address})
for report_name in spec['reports']:
    report=json.loads((root/'docs'/report_name).read_text())
    assert report['executableSha256']==n.digest
    for label,address in report.get('functions',{}).items():
        if isinstance(address,str): add(address,{'kind':'evidence-report','report':report_name,'label':label})
        elif isinstance(address,dict) and 'start' in address:add(address['start'],{'kind':'evidence-report','report':report_name,'label':label})
# Wrapper owner/signature association is a discovery root, not proof that the
# wrapped method or the full class lifecycle is implemented.
for symbol,address in n.symbols.items():
    for owner in spec['owners']:
        encoded=str(len(owner))+owner
        if any(prefix+encoded in symbol for prefix in ['ApplyWrapperI','InitFunctionSignatureIM','GetMetaClassByTypeIP','GetMetaTypeByTypeIP']):
            if address in start_set:add(address,{'kind':'owner-symbol','owner':owner,'symbol':symbol})
evidence_by_start=collections.defaultdict(list)
for path in sorted((root/'evidence').glob('*.asm')):
    if not path.name.startswith(('material-','terrain-','skirt-','cloud-','visibility-','compositor-','outline-','scene-','render-list-','vertex-','metal-','dynamics-','wind-','environment-','rail-','float-','numeric-','event-','set-float-','if-enabled','play-sound-','sound-')):continue
    match=re.match(r'0x([0-9a-f]+):',path.read_text())
    if match:
        a=int(match[1],16);start,_=n.bounds(a)
        evidence_by_start[start].append(str(path.relative_to(root)))
        add(a,{'kind':'disassembly','file':str(path.relative_to(root))})
rows=[];dependencies=collections.defaultdict(list);open_indirect=[];incomplete=[]
for start in sorted(roots):
    end=n.bounds(start)[1]
    try: instructions=n.instructions(start)
    except ValueError as e:
        # Preserve incomplete disassembly rather than dropping a native entry.
        instructions=list(n.cs.disasm(n.read(start,end-start),start));incomplete.append({'address':hex(start),'reason':str(e),'decodedTo':hex(instructions[-1].address+instructions[-1].size) if instructions else hex(start)})
    calls=[];pointers=[];indirect=[]
    for ins in instructions:
        if ins.mnemonic in ['call','jmp']:
            if ins.operands and ins.operands[0].type==X86_OP_IMM:
                target=ins.operands[0].imm
                if start<=target<end:continue
                imported=n.by_address.get(target,'')
                if target in start_set:
                    call={'site':hex(ins.address),'target':hex(target),'kind':'call' if ins.mnemonic=='call' else 'tail-jump'}
                    calls.append(call);dependencies[target].append({'caller':hex(start),**call})
                else:calls.append({'site':hex(ins.address),'target':hex(target),'kind':'import-or-unclassified','symbol':imported})
            else:
                item={'function':hex(start),'site':hex(ins.address),'instruction':ins.mnemonic+' '+ins.op_str,'resolution':'待解析'}
                indirect.append(item);open_indirect.append(item)
        elif ins.mnemonic.startswith('mov'):
            for op in ins.operands:
                if op.type==X86_OP_IMM and op.imm in start_set:
                    pointers.append({'site':hex(ins.address),'target':hex(op.imm),'kind':'code-pointer-immediate','resolution':'引用已记录，用途待确认'})
        elif ins.mnemonic=='lea':
            for op in ins.operands:
                if op.type==X86_OP_MEM and op.mem.base==X86_REG_RIP:
                    target=ins.address+ins.size+op.mem.disp
                    if target in start_set:pointers.append({'site':hex(ins.address),'target':hex(target),'kind':'code-pointer-rip-address','resolution':'引用已记录，用途待确认'})
    stages=[stage for stage in spec['stages'] if any(n.bounds(int(a,16))[0]==start for a in stage['addresses'])]
    row={'address':hex(start),'end':hex(end),'bytes':end-start,'codeSha256':hashlib.sha256(n.read(start,end-start)).hexdigest(),
         'symbols':sorted(names[start]),'discoveredBy':roots[start],'evidence':evidence_by_start[start],
         'status':'部分实现/验证' if any(s['implementation'] for s in stages) else '已定位，待恢复',
         'stageIds':[s['id'] for s in stages],
         'implementedScopes':[{'stage':s['id'],'implementation':s['implementation'],'evidence':s['evidence'],'gap':s['gap']} for s in stages],
         'directCalls':calls,'codePointerReferences':pointers,'unresolvedIndirectCalls':indirect,
         'fullNativeFunctionImplemented':False}
    rows.append(row)
deps=[{'address':hex(a),'end':hex(n.bounds(a)[1]),'symbols':sorted(names[a]),'callers':callers,'bodyExpanded':a in roots,
       'status':'见根函数记录' if a in roots else '依赖已定位，函数体待展开'} for a,callers in sorted(dependencies.items())]
stats={'nativeFunctionsIndexed':len(index),'renderRoots':len(rows),'directDependencyFunctions':len(deps),
       'unexpandedDependencyBodies':sum(not d['bodyExpanded'] for d in deps),'unresolvedIndirectSites':len(open_indirect),
       'incompleteDisassemblies':len(incomplete),'renderStages':len(spec['stages']),
       'stagesWithImplementation':sum(bool(s['implementation']) for s in spec['stages'])}
report={'executableSha256':n.digest,'scope':spec['scope'],'inventoryEstablished':True,'nativeAddressIndexComplete':True,
        'renderReachabilityComplete':False,'completionPercentage':None,'stats':stats,
        'limits':['Owner symbols and known evidence define discovery roots; complete render-class ownership remains under review.',
                  'Every root direct external call/tail jump is listed. Dependency bodies are marked when not expanded.',
                  'Unresolved virtual/function-pointer calls and code-pointer references remain explicit; no assumed targets.',
                  'Implementation is recorded by scope/subrange; a passing slice never marks a whole native function complete.'],
        'stages':spec['stages'],'deferred':spec['deferred'],'functions':rows,'dependencies':deps,
        'unresolvedIndirectCalls':open_indirect,'incompleteDisassemblies':incomplete}
previous_path=root/'docs/meshes-render-functions.json'
if previous_path.exists():
    previous=json.loads(previous_path.read_text())
    if 'latestViewportUpdate' in previous:report['latestViewportUpdate']=previous['latestViewportUpdate']
previous_path.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
lines=['# BstBaked.meshes 渲染清单','',spec['scope'],'',
       f"已建立 {len(index):,} 个原程序函数的地址索引，渲染发现根函数 {len(rows)} 个、直接依赖 {len(deps)} 个。",
       f"未展开依赖函数体 {stats['unexpandedDependencyBodies']} 个，未解析间接调用位置 {len(open_indirect)} 个，反汇编缺口 {len(incomplete)} 个。",'',
       '这些是可追踪的当前发现数量，不是全部剩余实现数量；完整渲染可达性和函数归属尚未闭合，不计算完成百分比。', '',
       '每个函数的边界、机器码哈希、符号、调用位置、代码指针引用、实现范围和证据见 [meshes-render-functions.json](meshes-render-functions.json)。全部原函数地址见 [native-function-index.json](native-function-index.json)。','',
       '## 当前渲染阶段','', '| 编号 | 工作 | 当前状态 | 原地址/子段 | 缺口 |','| --- | --- | --- | --- | --- |']
for s in spec['stages']:
    addresses='、'.join('`'+a+'`' for a in s['addresses']) or '入口待定位'
    lines.append(f"| {s['id']} | {s['name']} | {s['status']} | {addresses} | {s['gap']} |")
lines.extend(['','## 函数逐项追踪','', '| 函数起始地址 | 阶段 | 证据 | 外部直调 | 未解间接调用 | 当前状态 |','| --- | --- | --- | --- | --- | --- |'])
for row in rows:
    lines.append(f"| `{row['address']}` | {', '.join(row['stageIds']) or '共享/模块依赖'} | {', '.join(row['evidence']) or '符号/机器码地址'} | {len(row['directCalls'])} | {len(row['unresolvedIndirectCalls'])} | {row['status']} |")
lines.extend(['','## 渲染版打包验收','',
              '- 从真实地图数据自动构建地形、裙边和云的材质/资源/绘制列表，完成主视口合成。',
              '- 核对 Visibility、动态顶点、LOD 与资源句柄，并通过原机器码及真实地图输入验证。',
              '- 保留并解决云混合、quarter 光栅边界及 half 溢出三份未通过报告，确认原 Metal 行为。',
              '- 完成 Windows GPU 和原游戏画面对照；编辑重建不再阻塞当前渲染阶段。','',
              '## 联合恢复与其他待办','']+[f'- {name}' for name in spec['deferred']]+['',
              '重建：`python3 tools/meshes-render-inventory.py /path/to/Sky`。原 executable 的 SHA-256 必须匹配，生成器不修改 reference 或发布包。',''])
(root/'docs/BstBaked.meshes渲染清单.md').write_text('\n'.join(lines))
print(json.dumps(stats,ensure_ascii=False))
