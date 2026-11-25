import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {ObjectsDocument} from '../src/core/objects';
import {convertEnvironmentStorage,type EnvironmentClass} from '../src/core/environment-storage';
import {generateObjectsInstanceProgress} from './objects-instance-progress';

export function generateObjectsClassProgress() {
const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
const executableSha256='3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20';
type Evidence={note:string;partial?:string[];implementation?:string[];evidence?:string[];coreReports?:string[];coreFixture?:string;};
const spec=JSON.parse(fs.readFileSync('tools/objects-class-progress-spec.json','utf8')) as {checkpoints:{id:string;name:string}[];classes:Record<string,Evidence>};
assert.equal(spec.checkpoints.length,10);assert.equal(new Set(spec.checkpoints.map(c=>c.id)).size,10);
const properties=JSON.parse(fs.readFileSync('docs/native-properties.json','utf8')) as Record<string,Record<string,{registrationFunction:string;nativeOffset:number;typeGetter:string}>>;
const catalog=JSON.parse(fs.readFileSync('docs/classes.json','utf8')) as {name:string;category:string;rttiAddress:string}[];
const metadata=new Map(catalog.map(c=>[c.name,c]));
const executionPolicy=JSON.parse(fs.readFileSync('tools/objects-execution-policy.json','utf8')) as {scope:string};
const functionality=JSON.parse(fs.readFileSync('tools/objects-function-spec.json','utf8')) as {scope:string;groups:{id:string;name:string;scope:string}[];classes:Record<string,{group:string;role:string}>};
const functionalGroups=new Map(functionality.groups.map(g=>[g.id,g]));
interface Stats {name:string;nodes:number;nested:number;references:number;dependencies:Map<string,number>;levels:Map<string,{nodes:number;nested:number;declared:boolean}>;fields:Map<string,{name:string;type:number;size:number;nestedClass:string|null}>;}
const stats=new Map<string,Stats>(),files:{level:string;bytes:number;sha256:string;nodes:number;fullParseAndUnchangedRoundTrip:boolean}[]=[];
const get=(name:string)=>{let s=stats.get(name);if(!s){s={name,nodes:0,nested:0,references:0,dependencies:new Map(),levels:new Map(),fields:new Map()};stats.set(name,s);}return s;};
let references=0;
for(const level of fs.readdirSync(path.join(data,'Levels')).sort()) {
  const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;
  const bytes=fs.readFileSync(file),doc=new ObjectsDocument(bytes);
  assert.equal(doc.end,bytes.length);assert.ok(bytes.equals(doc.serialize()),level+' unchanged round trip');
  for(const c of doc.classes) {
    const s=get(c.name);s.levels.set(level,{nodes:0,nested:0,declared:true});
    for(const p of c.properties){const field={name:p.name,type:p.type,size:p.size,nestedClass:p.classIndex!==0xffffffff&&p.type===3?doc.classes[p.classIndex]?.name??null:null};s.fields.set(JSON.stringify(field),field);}
  }
  for(const node of doc.nodes){const s=get(node.className);s.nodes++;s.levels.get(level)!.nodes++;}
  for(const f of doc.fields.values()) {
    const root=/^n(\d+)\//.exec(f.id),owner=root?doc.nodes[Number(root[1])]:null;
    if(f.kind==='reference'&&f.value!==0xffffffff) {
      const target=doc.nodes[Number(f.value)];assert.ok(target,`${level} invalid reference ${f.id}`);references++;
      if(owner){const s=get(owner.className);s.references++;s.dependencies.set(target.className,(s.dependencies.get(target.className)??0)+1);}
    }
    if(f.kind==='struct') {
      const name=/^\[\d+\] (.+)$/.exec(f.name)?.[1];assert.ok(name&&stats.has(name),level+' nested type');
      const s=get(name!);s.nested++;s.levels.get(level)!.nested++;
    }
  }
  files.push({level,bytes:bytes.length,sha256:crypto.createHash('sha256').update(bytes).digest('hex'),nodes:doc.nodes.length,fullParseAndUnchangedRoundTrip:true});
}
const legacy=JSON.parse(fs.readFileSync('docs/Objects与Avatar进度.json','utf8'));
assert.equal(files.length,legacy.summary.levels);assert.equal(files.reduce((v,f)=>v+f.nodes,0),legacy.summary.totalNodes);
for(const [name,count] of Object.entries(legacy.summary.classCounts))assert.equal(stats.get(name)?.nodes,count,name+' inventory consistency');

const classes=Array.from(stats.values()).sort((a,b)=>a.name.localeCompare(b.name,'en')).map(s=>{
  const functional=functionality.classes[s.name];assert.ok(functional,'Missing functional classification: '+s.name);const group=functionalGroups.get(functional.group);assert.ok(group,'Unknown functional group: '+s.name);
  const evidence=spec.classes[s.name],native=properties[s.name]??{},nativeFields=Object.entries(native).map(([name,p])=>({name,...p}));
  for(const f of [...(evidence?.implementation??[]),...(evidence?.evidence??[]),...(evidence?.coreReports??[]),...(evidence?.coreFixture?[evidence.coreFixture]:[])])assert.ok(fs.existsSync(f),'Missing class evidence: '+f);
  const coreReports=(evidence?.coreReports??[]).map(file=>({file,report:JSON.parse(fs.readFileSync(file,'utf8'))}));
  let coreVerified=coreReports.length>0&&coreReports.every(r=>r.report.executableSha256===executableSha256&&r.report.passed===true),coreFailure:string|null=null;
  if(evidence?.coreFixture) {
    const fixture=JSON.parse(fs.readFileSync(evidence.coreFixture,'utf8'));assert.equal(fixture.executableSha256,executableSha256);
    const cases=fixture.cases.filter((c:{className:string})=>c.className===s.name);
    try {
      assert.ok(cases.length>0,'Missing native class conversion cases');
      for(const c of cases)assert.equal(Buffer.from(convertEnvironmentStorage(s.name as EnvironmentClass,Buffer.from(c.inputHex,'hex'))).toString('hex'),c.outHex);
      coreVerified=true;
    }catch(error){coreFailure=String(error);coreVerified=false;}
  }
  const artifacts=[...new Set([...(evidence?.evidence??[]),...(evidence?.coreReports??[]),...(evidence?.coreFixture?[evidence.coreFixture]:[])])];
  const checkpoints=spec.checkpoints.map(c=>{
    let status:'verified'|'partial'|'pending'='pending',note='',sources:string[]=[];
    if(c.id==='inventory'||c.id==='roundTrip'){status='verified';note='所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。';sources=['docs/Objects.level.bin类进度.json'];}
    if(c.id==='properties'){
      if(nativeFields.length){status='verified';note=`已提取 ${nativeFields.length} 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。`;sources=['docs/native-properties.json'];}
      else if(metadata.has(s.name)){status='partial';note='已有 RTTI 类型地址；此类字段注册证据尚未完整提取。';sources=['docs/classes.json'];}
    }
    if(evidence?.partial?.includes(c.id)){status='partial';note=evidence.note;sources=artifacts;}
    if(c.id==='core'&&coreVerified){status='verified';note=evidence!.note;sources=artifacts;}
    if(c.id==='core'&&coreFailure){status='partial';note='原输出对照失败：'+coreFailure;sources=artifacts;}
    return {...c,status,note,evidence:sources};
  });
  const verified=checkpoints.filter(c=>c.status==='verified').length,partial=checkpoints.filter(c=>c.status==='partial').length;
  const status=(id:string)=>checkpoints.find(c=>c.id===id)!.status;
  const functionalTasks=[
    {name:'原输入与构造',status:status('defaults'),description:`${s.name} 的原默认值、继承初始化及 ${s.fields.size} 个序列化字段变体；原注册字段 ${nativeFields.length} 项。`},
    {name:functional.role,status:status('behavior')==='verified'?'verified':coreVerified||status('behavior')==='partial'?'partial':'pending',description:evidence?.note??'此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。'},
    {name:'依赖调用与事件',status:status('behavior'),description:Array.from(s.dependencies,([name,count])=>`${name}（${count} 条引用）`).join('、')||'当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。'},
    {name:'实际场景与功能接入',status:status('integration'),description:'按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。'},
    {name:'注销、恢复与真机行为',status:status('lifecycle')==='verified'&&status('hardware')==='verified'?'verified':'pending',description:'逐类闭合原销毁/切图状态及原游戏真机行为。'},
  ];
  return {name:s.name,category:group!.name,functionGroupId:group!.id,functionRole:functional.role,functionalTasks,
    serializedDependencies:Array.from(s.dependencies,([className,references])=>({className,references})).sort((a,b)=>b.references-a.references||a.className.localeCompare(b.className)),
    rttiWorkingGroup:metadata.get(s.name)?.category??null,role:s.nodes?'对象实例类型':s.nested?'嵌套数据':'仅类声明',instances:s.nodes,nestedInstances:s.nested,referenceFields:s.references,
    declaredLevels:s.levels.size,levels:Array.from(s.levels,([level,v])=>({level,...v})),serializedFields:Array.from(s.fields.values()).sort((a,b)=>a.name.localeCompare(b.name)),
    rttiAddress:metadata.get(s.name)?.rttiAddress??null,nativeRegisteredFields:nativeFields,completedCheckpoints:verified,partialCheckpoints:partial,totalCheckpoints:checkpoints.length,
    checkpointProgressPercent:verified*10,overallNativeLogicPercent:null,completeClassRuntimeVerified:false,coreSubchainVerified:coreVerified,
    implementation:evidence?.implementation??[],evidence:artifacts,checkpoints,
    note:evidence?.note??'已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。',
    remaining:checkpoints.filter(c=>c.status!=='verified').map(c=>c.name)};
});
assert.equal(Object.keys(functionality.classes).length,classes.length,'Functional catalog exactly covers all declared types');
const groups=functionality.groups.map(g=>{const members=classes.filter(c=>c.functionGroupId===g.id);return {...g,classCount:members.length,objectCount:members.reduce((n,c)=>n+c.instances,0),meanClassCheckpointPercent:Number((members.reduce((n,c)=>n+c.checkpointProgressPercent,0)/members.length).toFixed(2))};});
const completed=classes.reduce((v,c)=>v+c.completedCheckpoints,0),total=classes.length*10;
const summary={levels:files.length,totalNodes:files.reduce((v,f)=>v+f.nodes,0),nodeClasses:classes.filter(c=>c.instances>0).length,declaredClasses:classes.length,
  nestedOnlyClasses:classes.filter(c=>!c.instances&&c.nestedInstances).length,declarationOnlyClasses:classes.filter(c=>!c.instances&&!c.nestedInstances).length,
  references,brokenReferences:0,coreSubchainVerifiedClasses:classes.filter(c=>c.coreSubchainVerified).length,completeRuntimeClasses:0,
  completedCheckpoints:completed,totalCheckpoints:total,meanClassCheckpointPercent:Number((completed/total*100).toFixed(2)),
  histogram:Object.fromEntries([...new Set(classes.map(c=>c.checkpointProgressPercent))].sort((a,b)=>a-b).map(p=>[String(p),classes.filter(c=>c.checkpointProgressPercent===p).length]))};
const report={updatedAtUTC:new Date().toISOString(),executableSha256,
  scope:'覆盖实际 33 份 Objects.level.bin 的全部类声明、顶层节点和嵌套结构。每类相同 10 项，只有 verified 项计分，partial 不计分；核心子链项仅表示所列原输出范围，并不表示完整类运行。格式/字段项占初始进度，完整运行验收由第 7～10 项约束。结构型/仅声明类型的原运行身份仍待确认。功能分组逐类明确维护，依据类声明/字段职责及既有原函数证据，不使用原 RTTI 名称正则分类，不当作完整行为或继承证明。与 Objects/Avatar 按领域的旧清单分母不同，不能直接比较。完整原逻辑百分比保持 null。',
  summary,groups,executionPolicy:executionPolicy.scope,classificationBasis:functionality.scope,checkpoints:spec.checkpoints,classes,files,
  target:{bstBakedSegments:['Mesh.bin','Terrain.bin','Cloud.bin','Skirt.bin','Occluder.bin'],eachSegmentCheckpointPercent:90,hardwareCheckpointReserved:true,equalPriority:true,
    fullOriginalGameLogicPercent:100,objects:'逐类及逐对象维护实际验证进度；最终必须 100% 还原原游戏逻辑，完整默认值/加载/启用/事件/依赖/更新/销毁与真机行为验收；共享基础对象/资源/生成/Visibility 依赖与五段一起推进。'}};
fs.writeFileSync('docs/Objects.level.bin类进度.json',JSON.stringify(report,null,2)+'\n');
const escape=(v:string)=>v.replace(/[|\n\r]/g,' / '),link=(file:string)=>`[${path.basename(file)}](${path.relative('docs',file)})`;
const rows=groups.map(g=>`## ${g.name}\n\n${g.scope}。\n\n| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |\n| --- | --- | ---: | --- | ---: | --- |\n${classes.filter(c=>c.functionGroupId===g.id).map(c=>`| [${c.name}](Objects类清单/${c.name}.md) | ${escape(c.functionRole)} | ${c.instances} | ${c.checkpointProgressPercent}%（${c.completedCheckpoints}/10） | ${c.partialCheckpoints} | ${escape(c.note)} |`).join('\n')}`).join('\n\n');
const details=classes.map(c=>`<details>\n<summary>${c.name} · ${c.checkpointProgressPercent}%（${c.completedCheckpoints}/10）</summary>\n\n${c.functionRole}。\n\n${c.note}\n\n功能实施项（不另改检查项分母）：\n\n${c.functionalTasks.map(p=>`- [${p.status==='verified'?'x':' '}] ${p.name}${p.status==='partial'?'（部分完成）':''}：${p.description}`).join('\n')}\n\n${c.checkpoints.map(p=>`- [${p.status==='verified'?'x':' '}] ${p.name}${p.status==='partial'?'（部分完成，未计分）':''}${p.note?'：'+p.note:''}`).join('\n')}\n\n地图：${c.levels.map(l=>`${l.level}（节点 ${l.nodes} / 嵌套 ${l.nested}）`).join('、')}。\n\n原注册字段：${c.nativeRegisteredFields.length}；文件声明字段变体：${c.serializedFields.length}。${c.rttiAddress?' RTTI：`'+c.rttiAddress+'`。':''}\n\n${c.implementation.length?'实现：'+c.implementation.map(link).join('、')+'。\n\n':''}${c.evidence.length?'证据：'+c.evidence.map(link).join('、')+'。\n\n':''}</details>`).join('\n\n');
const md=`# Objects.level.bin 逐类进度清单\n\n覆盖 ${summary.levels} 张地图、${summary.totalNodes.toLocaleString('en-US')} 个对象、${summary.nodeClasses} 种顶层对象类，以及嵌套/仅声明类型，总计 ${summary.declaredClasses} 个实际声明类型。全部完整解析、引用有效、无修改回写逐字节一致。\n\n主结构为功能分组 → 单独类 → 该类全部实例；地图仅作原始来源信息。每类都有单独功能描述和实施项，音频与混音独立分组。每类使用下面相同 10 项检查。进度只计已验证项；部分完成单列。字段解析、原函数子链和完整运行分开验收。**清单比例不是完整类行为或游戏还原比例**；目前完整类运行验收为 0 类。按类平均检查项进度为 ${summary.meanClassCheckpointPercent}%，不按对象数量加权。\n\n${executionPolicy.scope}\n\n全部类与对象：[实现总清单](Objects.level.bin全部实现清单.md) · [全部对象详情](Objects.level.bin对象实现清单.html)。\n\n交互清单：[搜索、筛选和展开每类详情](Objects.level.bin类进度.html)；机器可读清单：[Objects.level.bin类进度.json](Objects.level.bin类进度.json)。按领域的旧清单见 [Objects与Avatar清单](Objects与Avatar清单.md)，其分母不同。\n\n${spec.checkpoints.map((c,i)=>`${i+1}. ${c.name}`).join('\n')}\n\n核心子链项只对明确的原输出范围计分；完整类行为仍由第 7 项验收。原字段项表示该类注册证据已提取，继承/默认值另验。地图节点、嵌套实例、只有声明的类型分别计数；未把其余 RTTI 类型充作当前文件实例。\n\n${rows}\n\n## 每类执行清单\n\n${details}\n\n重建命令：\n\n\`\`\`bash\nnpx tsx tools/objects-avatar-inventory.ts\n\`\`\`\n\n现有 inventory 命令自动刷新逐类和逐对象清单；单独运行 tools/objects-class-progress.ts 也会刷新两套清单。生成器重新读取真实文件、校验全部引用/回写并核对既有节点清点；现代原机报告必须显式 passed=true，三种环境存储核心直接重放原输出 fixture 比较。每类部分状态与实现/证据由 tools/objects-class-progress-spec.json 维护。\n`;
fs.writeFileSync('docs/Objects.level.bin类进度清单.md',md);
fs.writeFileSync('docs/Objects.level.bin功能分类清单.md',md.replace('# Objects.level.bin 逐类进度清单','# Objects.level.bin 按单独类功能分类的实现清单'));
const template=fs.readFileSync('tools/objects-class-progress-template.html','utf8');assert.equal(template.split('__OBJECTS_CLASS_PROGRESS__').length,2);
fs.writeFileSync('docs/Objects.level.bin类进度.html',template.replace('__OBJECTS_CLASS_PROGRESS__',JSON.stringify(report).replace(/</g,'\\u003c')));
generateObjectsInstanceProgress();
console.log(JSON.stringify(summary));
return summary;
}
if(process.argv[1]&&path.basename(process.argv[1])==='objects-class-progress.ts')generateObjectsClassProgress();
