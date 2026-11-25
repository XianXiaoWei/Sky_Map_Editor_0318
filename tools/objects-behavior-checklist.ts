import fs from 'node:fs';
import assert from 'node:assert/strict';

const inventory=JSON.parse(fs.readFileSync('docs/Objects.level.bin类进度.json','utf8'));
const shared=new Set(Object.keys(JSON.parse(fs.readFileSync('docs/environment-construction.json','utf8')).classes));
const working=new Set(['Emitter','MoteParams','Mote','SpawnMotes']);
const requirements=[
  {id:'inputs',name:'保存字段与缺省值',requirement:'真实地图字段、缺字段、引用为空及非法输入的行为与游戏一致。'},
  {id:'states',name:'状态与更新',requirement:'启用、禁用、重复触发、计时、数量及边界条件与游戏一致。'},
  {id:'dependencies',name:'依赖与输出',requirement:'依赖对象接收正确输入；粒子、绘制、碰撞、音效或账户输出按该类实际职责核验。'},
  {id:'sequence',name:'事件顺序',requirement:'开始、更新、暂停、继续、完成及依赖回调顺序连续验证。'},
  {id:'lifecycle',name:'停止与切图',requirement:'停止、重新触发、切图及卸载清理不残留运行对象或复用失效引用。'},
  {id:'integration',name:'真实场景验收',requirement:'真实配置与边界测试、主程序实际接入、与原游戏可观察行为核对。'},
];
const classes=inventory.classes.map((c:any)=>{
 const hasCode=c.implementation.some((file:string)=>file.startsWith('src/'))||shared.has(c.name);
 const status=!c.instances&&!c.nestedInstances?'仅声明待核实':working.has(c.name)?'实现中':hasCode?'部分实现':'待实现';
 return {name:c.name,category:c.category,role:c.functionRole,instances:c.instances,nestedInstances:c.nestedInstances,status,
  dependencies:c.serializedDependencies,implementation:c.implementation,evidence:c.evidence,
  currentScope:c.note,behaviorAccepted:false,
  checks:requirements.map(r=>({...r,status:'待验收'})),
  next:working.has(c.name)?'先核验发射调度、随机输出、Emitter 句柄与清理，再接 Mote 更新及共享事件。':c.functionGroupId==='collectibles'?'核对点燃/熄灭、收集/重复领取、计数与依赖回调；账户持久状态另行验收。':c.functionGroupId==='water'?'核对水面状态与区域、开关事件、碰撞/角色交互和渲染消费者。':'按真实职责和依赖逐项闭合行为、输出及生命周期。'};
});
assert.equal(classes.length,283);assert.equal(new Set(classes.map((c:any)=>c.name)).size,283);
assert.equal(classes.reduce((n:number,c:any)=>n+c.instances,0),49824);
const report={updatedAtUTC:new Date().toISOString(),criterion:'以游戏可观察逻辑、状态、依赖输出和事件顺序为标准；不要求代码、对象内存、分配器或虚表 1:1。字段装载、单个内核和编辑器预览不等于整类行为完成。',
 summary:{declaredClasses:classes.length,classesWithObjects:classes.filter((c:any)=>c.instances>0).length,objects:49824,behaviorAccepted:0,statusCounts:Object.fromEntries([...new Set(classes.map((c:any)=>c.status))].map(s=>[s,classes.filter((c:any)=>c.status===s).length]))},
 priorities:['Windows 原材质 Vulkan 直接呈现与原 Scene/Model/Visibility/RenderList 方法，优先解决卡顿与换图；完成本批后继续 Objects.level.bin。','沿模型资源/LOD/Visibility/RenderList 与环境共享依赖继续，再闭合 Emitter → MoteParams/Mote → SpawnMotes。','蜡烛、收集、机关、植物和水：按实际类型职责及依赖接入。','持续闭合模型、资源、物理、环境与角色的共享依赖。'],requirements,classes};
fs.writeFileSync('docs/Objects.level.bin逻辑实现列表.json',JSON.stringify(report,null,2)+'\n');
const lines=['# Objects.level.bin 逻辑实现列表','',report.criterion,'',`33 张地图，283 个声明类，280 个有顶层对象，共 49,824 个对象。完整行为验收：0。以下“部分实现”保留既有成果，不表示全部未开始。`,'','用户要求涵盖水、蜡烛及其他地图物品；所有类型均在下表，保存引用只覆盖部分依赖，运行时资源和全局服务需逐类核对。','',...report.priorities.map((p,i)=>`${i+1}. ${p}`),'','行为验收检查：'+requirements.map(r=>r.name).join('、')+'。','', '| 类 | 职责 | 实例 | 状态 | 保存引用依赖 |','|---|---|---:|---|---|',
 ...classes.map((c:any)=>`| [${c.name}](Objects类清单/${c.name}.md) | ${c.role.replaceAll('|','/')} | ${c.instances}${c.nestedInstances?`（嵌套 ${c.nestedInstances}）`:''} | ${c.status} | ${c.dependencies.map((d:any)=>`${d.className} ×${d.references}`).join('、')||'待核对运行时依赖'} |`),
 '', '逐类现有证据、缺口和六项行为验收状态见同名 JSON。Emitter/SpawnMotes 新发射代码尚未完成独立核验及场景接入；不计为已实现行为。',''];
fs.writeFileSync('docs/Objects.level.bin逻辑实现列表.md',lines.join('\n'));
console.log(JSON.stringify(report.summary));
