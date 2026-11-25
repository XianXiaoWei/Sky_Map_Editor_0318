import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {gzipSync} from 'node:zlib';
import {ObjectsDocument} from '../src/core/objects';

export function generateObjectsInstanceProgress(){
 const data=process.env.SKY_DATA??'/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data';
 const classReport=JSON.parse(fs.readFileSync('docs/Objects.level.bin类进度.json','utf8'));
 const classes=new Map<string,any>(classReport.classes.map((c:any)=>[c.name,c]));
 const checkpoints=[
  ['inventory','实际对象身份、原始字节范围与引用清点'],['roundTrip','该对象原始字节完整解析及无修改回写'],
  ['defaults','该实例完整原构造、缺字段默认值与继承初始化'],['load','该实例原资源加载、注册与启用传播'],
  ['startup','该实例原启动状态、入口和调用顺序'],['events','该实例全部事件、依赖调用与反馈结果'],
  ['update','该实例原更新、状态转换及边界行为'],['integration','该实例实际场景、绘制、物理或游戏 UI 接入'],
  ['lifecycle','该实例注销、销毁、切图及状态恢复'],['hardware','该实例 Windows 真机与原游戏行为验收'],
 ].map(([id,name])=>({id,name}));
 const digest=(b:Buffer)=>crypto.createHash('sha256').update(b).digest('hex');
 const objects:any[]=[],files:any[]=[];let references=0,nestedInstances=0;
 fs.mkdirSync('docs/Objects对象清单',{recursive:true});
 fs.mkdirSync('docs/Objects类清单',{recursive:true});
 for(const level of fs.readdirSync(path.join(data,'Levels')).sort()){
  const file=path.join(data,'Levels',level,'Objects.level.bin');if(!fs.existsSync(file))continue;
  const source=fs.readFileSync(file),doc=new ObjectsDocument(source),fileSha256=digest(source),serialized=doc.serialize();
  assert.equal(doc.end,source.length);assert.ok(source.equals(serialized));
  const incoming=new Uint32Array(doc.nodes.length),outgoing=Array.from({length:doc.nodes.length},()=>[] as any[]);
  for(const f of doc.fields.values()){
   const root=/^n(\d+)\//.exec(f.id);if(!root)continue;const owner=Number(root[1]);
   if(f.kind==='struct')nestedInstances++;
   if(f.kind!=='reference'||f.value===0xffffffff)continue;
   const target=Number(f.value);assert.ok(doc.nodes[target],`${level}/${f.id} reference`);incoming[target]++;references++;
   outgoing[owner].push({fieldId:f.id,fieldName:f.name,target:`${level}:n${target}`,targetNodeId:target,offset:f.offset});
  }
  const nodes=doc.nodes.map(n=>{
   assert.ok(classes.has(n.className),n.className);assert.ok(source.subarray(n.offset,n.offset+n.length).equals(serialized.subarray(n.offset,n.offset+n.length)));
   const serializedState=Object.fromEntries(n.fields.filter(f=>/^(enabled|render|bstGuid|resourceName|meshName|material|name|useCameraPos|setLevelStartPosition)$/.test(f.name)).map(f=>[f.name,{kind:f.kind,encoding:f.encoding??null,value:f.value,raw:f.raw}]));
   return {key:`${level}:n${n.id}`,level,nodeId:n.id,name:n.name,className:n.className,classIndex:n.classIndex,
    sourceOffset:n.offset,sourceLength:n.length,sourceSha256:digest(source.subarray(n.offset,n.offset+n.length)),declaredFieldCount:n.fields.length,
    serializedState,references:outgoing[n.id],incomingReferenceCount:incoming[n.id],verifiedCheckpoints:['inventory','roundTrip'],
    completedCheckpoints:2,totalCheckpoints:10,checkpointProgressPercent:20,completeInstanceRuntimeVerified:false,overallNativeLogicPercent:null};
  });
  objects.push(...nodes);
  const json=`Objects对象清单/${level}.json`,md=`Objects对象清单/${level}.md`;
  const report={level,path:`Levels/${level}/Objects.level.bin`,fileSha256,bytes:source.length,nodes:nodes.length,checkpoints,
   scope:'此文件逐一列出全部顶层对象。实例进度只计实例自身的格式和引用验证；共享类实现另列，未当作该实例已运行。引用仅证明序列化依赖，不证明原事件或启用顺序。',
   classes:doc.classes,objects:nodes};
  fs.writeFileSync(path.join('docs',json),JSON.stringify(report,null,2)+'\n');
  fs.writeFileSync(path.join('docs',md),`# ${level} 源数据核验\n\n此页只保留原始来源核验，实施清单已按单独类的功能集中归类。${nodes.length} 个对象；源 SHA256：\`${fileSha256}\`。\n\n[按功能和单独类的完整清单](../Objects.level.bin全部实现清单.md) · [原始来源 JSON](${level}.json)\n`);
  files.push({level,path:report.path,sha256:fileSha256,bytes:source.length,nodes:nodes.length,fullParseAndUnchangedRoundTrip:true,json,markdown:md});
 }
 assert.equal(objects.length,classReport.summary.totalNodes);assert.equal(references,classReport.summary.references);assert.equal(nestedInstances,classReport.classes.reduce((n:number,c:any)=>n+c.nestedInstances,0));
 assert.equal(new Set(objects.map(n=>n.key)).size,objects.length);
 const groupedObjects=new Map<string,any[]>();for(const o of objects){if(!groupedObjects.has(o.className))groupedObjects.set(o.className,[]);groupedObjects.get(o.className)!.push(o);}
 const escape=(text:string)=>text.replace(/[|\r\n]/g,' / ').replace(/[<>]/g,c=>c==='<'?'&lt;':'&gt;');
 const classEntries=classReport.classes.map((c:any)=>{
  const members=groupedObjects.get(c.name)??[],json=`Objects类清单/${c.name}.json`,markdown=`Objects类清单/${c.name}.md`;
  assert.equal(members.length,c.instances,c.name+' complete instance listing');
  fs.writeFileSync(path.join('docs',json),JSON.stringify({className:c.name,functionGroup:c.category,functionRole:c.functionRole,functionalTasks:c.functionalTasks,classProgress:c,instanceCheckpoints:checkpoints,instances:members,sourceFiles:files.filter(f=>c.levels.some((l:any)=>l.level===f.level))},null,2)+'\n');
  fs.writeFileSync(path.join('docs',markdown),`# ${c.name} 单独类功能实现清单\n\n功能分类：${c.category}。\n\n此类职责：**${c.functionRole}**。\n\n类清单进度 ${c.checkpointProgressPercent}%（${c.completedCheckpoints}/10），${members.length} 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。\n\n## 此类功能实施项\n\n${c.functionalTasks.map((p:any)=>`- [${p.status==='verified'?'x':' '}] ${p.name}${p.status==='partial'?'（部分完成）':''}：${p.description}`).join('\n')}\n\n## 原类完整验收\n\n${c.checkpoints.map((p:any)=>`- [${p.status==='verified'?'x':' '}] ${p.name}${p.status==='partial'?'（部分完成，未计分）':''}${p.note?'：'+p.note:''}`).join('\n')}\n\n${c.note}\n\n[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=${encodeURIComponent(c.name)}) · [原字段、进度与全部实例 JSON](${c.name}.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)\n\n## 该类全部实例\n\n每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。\n\n${members.length?`| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |\n| --- | --- | --- | ---: | --- |\n${members.map((o:any)=>`| [n${o.nodeId}](../Objects.level.bin对象实现清单.html#${encodeURIComponent(o.key)}) | ${escape(o.name)||'（空名）'} | ${o.checkpointProgressPercent}%（${o.completedCheckpoints}/10），运行待验 | ${o.references.length} / ${o.incomingReferenceCount} | ${o.level} · ${o.sourceOffset} + ${o.sourceLength} bytes |`).join('\n')}`:'本批文件只有类声明，没有顶层实例；不添加虚构对象。'}\n`);
  return {name:c.name,category:c.category,functionGroupId:c.functionGroupId,functionRole:c.functionRole,functionalTasks:c.functionalTasks,serializedDependencies:c.serializedDependencies,
   note:c.note,instances:c.instances,checkpointProgressPercent:c.checkpointProgressPercent,coreSubchainVerified:c.coreSubchainVerified,completeClassRuntimeVerified:c.completeClassRuntimeVerified,checkpoints:c.checkpoints,implementation:c.implementation,evidence:c.evidence,json,markdown,objectKeys:members.map((o:any)=>o.key)};
 });
 assert.equal(classEntries.reduce((n:number,c:any)=>n+c.objectKeys.length,0),objects.length);
 const summary={levels:files.length,declaredClasses:classes.size,nodeClasses:classReport.summary.nodeClasses,totalObjects:objects.length,
  listedObjects:objects.length,references,brokenReferences:0,nestedInstances,individuallyRuntimeVerifiedObjects:0,
  completedInstanceCheckpoints:objects.length*2,totalInstanceCheckpoints:objects.length*10,instanceFormatChecklistPercent:20,fullNativeLogicPercent:null};
 const report={updatedAtUTC:new Date().toISOString(),executableSha256:classReport.executableSha256,
  target:{fullOriginalGameLogicPercent:100,bstBakedPreHardwareStagePercent:90,hardwareValidationRequired:true,
   acceptance:'全部原构造/默认值、继承/虚表、加载注册、启用传播、启动顺序、事件/依赖、更新状态、实际场景/UI/物理/渲染、销毁切图与真机原游戏行为闭合。预览、近似实现、格式解析和局部函数对照不等于完整类或实例验收。'},
  scope:'覆盖全部实际 Objects.level.bin 顶层对象；每实例有唯一地图+节点键、名称/类、源字节范围/SHA、出引用和入引用数。共享类清单按类引用，实例自身单独验收。没有把原类子链报告批量当作实例运行已完成。嵌套数据计数和声明在逐地图 JSON 中，不伪装成额外顶层对象。',
  summary,classification:{primary:['功能分类','单独类','全部实例'],mapRole:'仅作来源信息与引用键'},groups:classReport.groups,checkpoints,files,classes:classEntries,objects};
 fs.writeFileSync('docs/Objects.level.bin对象实现清单.json',JSON.stringify(report,null,2)+'\n');
 const template=fs.readFileSync('tools/objects-instance-progress-template.html','utf8');assert.equal(template.split('__OBJECTS_INSTANCE_PROGRESS_GZIP__').length,2);
 fs.writeFileSync('docs/Objects.level.bin对象实现清单.html',template.replace('__OBJECTS_INSTANCE_PROGRESS_GZIP__',gzipSync(JSON.stringify(report)).toString('base64')));
 fs.writeFileSync('docs/Objects.level.bin全部实现清单.md',`# Objects.level.bin 全部类与对象实现清单\n\n${classReport.executionPolicy} 完整原逻辑目前未达到，不能用检查项比例替代。\n\n覆盖 ${summary.levels} 张地图、${summary.declaredClasses} 个实际声明类型（${summary.nodeClasses} 种有顶层实例）、${summary.totalObjects.toLocaleString('en-US')} 个顶层对象，${references.toLocaleString('en-US')} 条非空引用。主结构为功能分类 → 单独类 → 该类全部实例；每个类有自己的职责与功能实施项，每个对象有原始身份、依赖和独立验收清单。地图仅作来源信息。完整类运行已验收 0 类，实例独立完整运行已验收 0 个。\n\n- [全部类逐项清单](Objects.level.bin类进度清单.md) · [类交互页面](Objects.level.bin类进度.html)\n- [全部对象交互清单](Objects.level.bin对象实现清单.html)：默认按功能和单独类查看，进入该类即可集中查看全部实例、自身实施项与依赖\n- [完整对象 JSON](Objects.level.bin对象实现清单.json) · [逐类 JSON](Objects.level.bin类进度.json)\n\n每个对象的独立验收项：\n\n${checkpoints.map((p,i)=>`${i+1}. ${p.name}`).join('\n')}\n\n当前实例自身全部为 2/10（只完成原字节格式与引用验证）；类平均清单为 ${classReport.summary.meanClassCheckpointPercent}%（分母不同）。原核心子链报告只计明确范围；原函数依赖、未知行为和失败项继续保留，完整逻辑进度保持 null。\n\n${classReport.groups.map((g:any)=>`## ${g.name}\n\n${g.scope}。\n\n| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |\n| --- | --- | --- | ---: | --- |\n${classEntries.filter((c:any)=>c.functionGroupId===g.id).map((c:any)=>`| ${c.name} | ${escape(c.functionRole)} | ${c.checkpointProgressPercent}% | ${c.instances} | [实施与所有实例](${c.markdown}) |`).join('\n')}`).join('\n\n')}\n\n刷新全部清单：\n\n\`\`\`bash\nnpx tsx tools/objects-avatar-inventory.ts\n\`\`\`\n\n也可运行 \`npx tsx tools/objects-class-progress.ts\` 同步刷新逐类/逐对象清单。生成器重新核验全部源文件和引用，并核对所有节点数、唯一键、嵌套数量及类归属。类与对象状态分别维护，原字段值只表示文件配置，实际默认值/启动结果待原逻辑验证。\n`);
 console.log(JSON.stringify(summary));return summary;
}
if(process.argv[1]&&path.basename(process.argv[1])==='objects-instance-progress.ts')generateObjectsInstanceProgress();
