import fs from 'node:fs';import path from 'node:path';import crypto from 'node:crypto';
import {ObjectsDocument,type Field} from '../src/core/objects';
import properties from '../docs/native-properties.json';
import progress from '../docs/Objects.level.bin类进度.json';
const data=process.env.SKY_DATA??'/root/sky-research/original-runtime-corpus';
const classes=progress.classes.filter(c=>['environment','weather','effects'].includes(c.functionGroupId)||['DropOcclusion','SpawnMotes'].includes(c.name));
const includes=new Set(classes.map(c=>c.name));const files:{file:string;sha256:string;nodes:number}[]=[],objects:Record<string,unknown>[]=[];
function refs(fields:Field[]):number[]{return fields.flatMap(f=>[...(f.kind==='reference'&&f.value!==0xffffffff?[Number(f.value)]:[]),...refs(f.children??[])]);}
const mapped:Record<string,{implemented:string[];pending:string[]}>={
 EnvNode:{implemented:['原字段转换、缺省标签、范围权重、四层混合、独立淡入淡出与到期关闭','原 EnvNode 创建队列与 OnLevelLoad 注册'],pending:['完整 TGCL factory/default cache','原 Environment 模块构造与销毁、真实相机模式']},
 SetEnvDefault:{implemented:['完整正常 Update：资源归属、摄像机字节判断、八组默认注册、Event.Start','原 EventBarn 自动启动和触发已接共享环境 owner，factory header 为编辑器准备服务'],pending:['完整原 factory/default cache','所有原事件图、实际摄像机/资源系统、完整卸载']},
 SetEnvHull:{implemented:['完整正常 Update：八组动态范围注册、实时字段读取、返回指针和 Event.Start','重复事件注册追加独立淡入淡出；共享 Marker 控制字节和实时范围变换'],pending:['完整原全局链表与默认缓存','原 metadata 类型注册和完整卸载']},
 CloudCard:{implemented:['原 LOD0 烘焙消费、动态顶点、绘制索引、朝向及排序子链','原材质已进入主 Vulkan 视口'],pending:['完整类构造/装载/释放','原 Visibility 与全部动态联动']},
 Wind:{implemented:['原空间风、额外 Marker 范围、Rail 查询、合力/阵风子链','120 个真实 Wind、26 个 Rail 引用进入共享状态，风场接地形/模型贴图和云运动'],pending:['完整类/模型/Barn 装载和 Rail 生命周期','原边界/交互力/Avatar 物理输入和原数学库']},
 SetWind:{implemented:['原完整正常 Update、区域/目标/直接向量与共享 Wind override','原 EventBarn/逻辑图单次和持续控制、暂停/恢复'],pending:['真实 EnvironmentForces 边界/交互/Avatar 全链','完整原模块/事件/卸载']},
 SetRainParams:{implemented:['原 OnEnabled、三过渡斜率、相位及强度参数更新','13 个真实事件与 Rain 大小写匹配启用谓词；调试时间缩放接入'],pending:['原雨粒子创建/掉落/碰撞/声音和绘制','完整 Rain 模块生命周期与原数学库']},
 SetOceanRender:{implemented:['原完整 Update 写入 Ocean 绘制开关与 Event.Start','共享 owner 和逻辑事件图桥接'],pending:['原 Ocean/Water 资源、场景绘制和完整生命周期']},
 SetEmitterFlowRail:{implemented:['原 OnEnabled/Update 的实时 Rail 和 Clump 重读、Emitter cast 与断言顺序','两条真实配置接原 EventBarn、持续写入和暂停/恢复'],pending:['Emitter 原完整粒子/流体更新与轨道消费者','完整模型/资源/事件生命周期']},
 PointLight:{implemented:['原 256 槽 Barn Initialize/Create/Release/ReleaseAll/Gather，521 个真实实例按地图共用原槽','原方向衰减函数、普通 Ambience 点光颜色/强度换算进入主视口'],pending:['局部光源原投影/排序/阴影和 GPU 消费者','原场景照明历史、完整 factory 和生命周期']},
 DropOcclusion:{implemented:['原正常 Load/Unload/OnEnabled/Update、逐目标淡入淡出、实时 Float/变换/开关','64 个真实配置原机对照；63 个进入共享 EventBarn，1 个因 SpawnMotes 空间依赖明确阻断','原 ObjectBarn 类型/负强度路由和 CloudBarn 512 槽登记；逻辑图暂停保留 alpha、重置及切图卸载'],pending:['SpawnMotes 原 Event 启用/Emitter 创建与 Mote 生命周期','原 cloud drop 世界采样/GPU/其它遮挡绘制','原完整 factory、异常日志展开与原数学库']},
 SpawnMotes:{implemented:['原 160-byte 正常父构造 0x100480880 与实际分配大小已对照','全部 76 个真实保存变换进入共享地址；原 SetTransform/GetTransform 四列原样读写'],pending:['原 Event 启用反射/调度、Emitter 创建和 Mote 更新生命周期','原随机与 sincos 服务、完整默认缓存/资源/卸载']},
 FogVolumeSphere:{implemented:['FogVolume.Initialize 原全局参数：visibility .7、resolution 128、启用位及队列复位已核验'],pending:['全部球体创建/资源/网格生成/绘制','点光源绑定、透明深度、反向/叠加/忽略云分支','主 Vulkan FogUpsample 和卸载']}
};
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
 const file=`Levels/${level}/Objects.level.bin`,bytes=fs.readFileSync(path.join(data,file)),doc=new ObjectsDocument(bytes),byId=new Map(doc.nodes.map(n=>[n.id,n]));files.push({file,sha256:crypto.createHash('sha256').update(bytes).digest('hex'),nodes:doc.nodes.length});
 for(const node of doc.nodes.filter(n=>includes.has(n.className)))objects.push({level,nodeId:node.id,className:node.className,fields:node.fields.map(f=>f.name),dependencies:refs(node.fields).map(id=>({id,className:byId.get(id)?.className??null})),runtimeComplete:false});
}
const common='原正常父构造/实际存储大小、保存标量/向量/字符串及已恢复引用共用运行地址；metadata、分配、字段缓存为明确准备服务';
const rows=classes.map(c=>{const state=mapped[c.name]??{implemented:[],pending:['完整原默认缓存、资源/Barn 装载','原完整更新、渲染/物理/事件依赖','共享场景接入、注销与卸载']};return {name:c.name,role:c.functionRole,instances:objects.filter(n=>n.className===c.name).length,registeredFields:Object.keys((properties as Record<string,unknown>)[c.name]??{}),implemented:[common,...state.implemented],pending:state.pending,runtimeComplete:false};});
const report={scope:'全部 environment/weather/effects 功能组和依赖遮挡对象；原游戏职责逐类处理。登记字段/读取成功不等于运行完成。',summary:{levels:files.length,classes:rows.length,objects:objects.length,fullyRestoredClasses:0,fullyRestoredObjects:0},sharedPipelines:[{name:'Ambience 天空/太阳与普通/廉价雾',implemented:['原派生太阳','原廉价雾采样与全部 63 滤波层','上一帧太阳/天空采样球体与本帧渲染球体分离'],pending:['原 256 射线平均天空颜色','真实场景 probe/SH 与历史更新','完整后处理曝光/bloom/ghost、点光和前景体积雾']},{name:'环境及逻辑事件调度',implemented:['原 EventBarn Update/OnLevelLoad','七类环境/天气/遮挡事件触发桥接 Enable/Delay/条件/数值/Transform 图，Float 位模式同步'],pending:['所有未恢复派生事件','原 factory/资源引用/相机/模块装载全链']}],classes:rows,files,objects};
fs.writeFileSync('docs/environment-objects-audit.json',JSON.stringify(report,null,2)+'\n');
const lines=['# 环境对象处理清单','',`33 图中共 ${rows.length} 类、${objects.length} 个相关对象。按原职责处理包括云、风、天空/雾参数、光源、水和天气、粒子/燃烧/烟花/植被，以及它们的控制事件。完整原类和实例验收仍为 0。`,'','| 类 | 实例 | 负责处理 | 当前状态 |','| --- | ---: | --- | --- |',...rows.map(r=>`| ${r.name} | ${r.instances} | ${r.role} | ${r.implemented.length?'已有核验子链，整类尚未闭合':'原运行逻辑待恢复'} |`),'','共享管线还要完成 scene probe、环境八组的全部渲染消费者、前景体积雾、点光、水面和雨幕、bloom/ghost、原曝光历史。基础依赖包含 Marker/Clump/Rail/Parent/LevelMesh、原资源引用、GameTime 和 EventBarn。','',...rows.flatMap(r=>['## '+r.name,'',...r.implemented.map(s=>'- 已实现：'+s),...r.pending.map(s=>'- 待实现：'+s),'']),'逐实例引用、原字段和 source SHA 在 environment-objects-audit.json。本次提供独立进度试用包；上述待实现项仍未计入完整原类/实例验收。',''];
fs.writeFileSync('docs/环境对象处理清单.md',lines.join('\n'));console.log(JSON.stringify(report.summary));
