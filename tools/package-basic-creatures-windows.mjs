import asar from '@electron/asar';
import fs from 'node:fs/promises';
import path from 'node:path';
import os from 'node:os';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
import {execFileSync} from 'node:child_process';
const sha=b=>crypto.createHash('sha256').update(b).digest('hex'),root=process.cwd();
const verified=JSON.parse(await fs.readFile('docs/basic-creature-verification.json','utf8'));assert.equal(verified.passed,true);
assert.equal(verified.viewportShaderCoveragePassed,true,'Run full-map SDK-free shader verification before packaging');assert.equal(verified.viewportShaderMaps,33);
for(const [file,digest] of Object.entries({...verified.buildPayloadSha256,...verified.evidenceSha256}))assert.equal(sha(await fs.readFile(file)),digest,'Verified input changed: '+file);
const version=JSON.parse(await fs.readFile('node_modules/electron/package.json','utf8')).version,artifact=`electron-v${version}-win32-x64.zip`,official=JSON.parse(await fs.readFile('node_modules/electron/checksums.json','utf8'))[artifact];assert.ok(official);
const stamp=new Date().toISOString().replace(/[-:]/g,'').replace('T','-').slice(0,15),buildRoot=path.resolve('release/basic-creatures-'+stamp),target=path.join(buildRoot,'SkyMapEditor-Windows-x64'),output=path.resolve('release/SkyMapEditor-Windows-x64-basic-creatures-'+stamp+'.zip');
await fs.mkdir(target,{recursive:true});const staging=await fs.mkdtemp(path.join(os.tmpdir(),'sky-basic-package-'));const runtimeArchive=path.resolve('release',artifact);let runtimeSource;
try{
 let available=false;try{available=sha(await fs.readFile(runtimeArchive))===official;}catch{}
 if(available){execFileSync('python3',['-c','import sys,zipfile;zipfile.ZipFile(sys.argv[1]).extractall(sys.argv[2])',runtimeArchive,target]);await fs.rename(path.join(target,'electron.exe'),path.join(target,'SkyMapEditor.exe'));runtimeSource={kind:'official-archive',sha256:official};}
 else{
  const previous=JSON.parse(await fs.readFile('docs/preview-package.json','utf8')),check=JSON.parse(await fs.readFile('docs/preview-package-verification.json','utf8'));assert.equal(check.passed,true);assert.equal(check.officialRuntimePayloadVerified,true);assert.equal(check.archiveSha256,previous.archiveSha256);assert.equal(previous.electronVersion,version);assert.equal(previous.electronArchiveSha256,official);assert.equal(sha(await fs.readFile(previous.archive)),previous.archiveSha256);
  execFileSync('python3',['-c',String.raw`import sys,zipfile,pathlib
with zipfile.ZipFile(sys.argv[1]) as z:
 for name in z.namelist():
  parts=pathlib.PurePosixPath(name).parts
  if name.endswith('/'): continue
  if (len(parts)==2 and parts[1] not in ('使用说明.md','开发说明.md','白屏恢复启动.cmd','预览构建信息.json')) or (len(parts)>2 and parts[1]=='locales'):
   target=pathlib.Path(sys.argv[2],*parts[1:]);target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(z.read(name))
`,previous.archive,target]);assert.ok((await fs.stat(path.join(target,'SkyMapEditor.exe'))).size>0);runtimeSource={kind:'previous-independently-verified-official-runtime',archive:previous.archive,sha256:previous.archiveSha256,officialArchiveSha256:official};
 }
 await fs.cp('dist',path.join(staging,'dist'),{recursive:true,filter:file=>{const rel=path.relative(path.resolve('dist'),path.resolve(file));return rel!=='native'&&!rel.startsWith('native'+path.sep);}});
 await fs.writeFile(path.join(staging,'package.json'),JSON.stringify({name:'sky-map-editor',productName:'Sky 地图编辑器',version:verified.version+'-preview.'+stamp.replace('-','.'),main:'dist/main.cjs'}));await fs.mkdir(path.join(staging,'docs'));await fs.copyFile('docs/beamo-rsqrt-capability.bin',path.join(staging,'docs/beamo-rsqrt-capability.bin'));
 const arithmetic=JSON.parse(await fs.readFile('docs/beamo-rsqrt-capability.json','utf8'));assert.equal(sha(await fs.readFile('docs/beamo-rsqrt-capability.bin')),arithmetic.binarySha256);
 await fs.mkdir(path.join(target,'resources/native'),{recursive:true});await asar.createPackage(staging,path.join(target,'resources/app.asar'));await fs.copyFile('dist/native/sky-vulkan.exe',path.join(target,'resources/native/sky-vulkan.exe'));await fs.copyFile(path.join(target,'vulkan-1.dll'),path.join(target,'resources/native/vulkan-1.dll'));await fs.cp('dist/vulkan-shaders',path.join(target,'resources/vulkan-shaders'),{recursive:true});
 await fs.mkdir(path.join(target,'docs'));for(const file of ['docs/basic-creature-verification.json',...Object.keys(verified.evidenceSha256),'docs/beamo-rsqrt-capability.json']){await fs.mkdir(path.dirname(path.join(target,file)),{recursive:true});await fs.copyFile(file,path.join(target,file));}
 await fs.copyFile('README.md',path.join(target,'开发说明.md'));
 for(const file of ['GitHub声明.md','LICENSE.md'])await fs.copyFile(file,path.join(target,file));
 await fs.writeFile(path.join(target,'使用说明.md'),`# Sky 地图编辑器：基础修复与生物预览版

完整解压后双击 SkyMapEditor.exe，选择原游戏 Data 目录。运行包不包含 Data，无需 Vulkan SDK。

本版修复模型变换期间的运行所有者竞态，补齐预编译 shader，接入原距离 LOD。远处使用已有低层网格，近处恢复高层；高精度编辑和拾取几何保留。

生物按原资源尺寸、骨骼、材质和 GLSL 显示。冥龙／遥鲲使用原 FloppySpine，鸟／遥鲲接入原飞行、转向和避障核心。鸟群个体独立移动与扑翼，数量按地图配置生成。新增蝴蝶原 SpawnMotes 生成和原 Mote 着色器，蝴蝶平原 117 只自动蝴蝶独立飞行。螃蟹使用原自主 AI，贴地检测限制台阶高度并阻挡墙面；冥龙按原顺序做警戒、运动和巡视计算，使用原巡视锥模型，光圈按碰撞表面投影。顶部“暂停生物”冻结移动和动作，“还原生物”恢复位置与姿态，再次播放重新开始。

靠近蜡烛时显示一个原图集点火按钮，点击或按 X 点火。点燃后按钮隐藏，蜡烛自身 Flame 渲染保留，不再叠加额外火焰标志。

WASD 移动，Q/E 升降，右键拖动看向，Shift 加速，滚轮缩放，Home 全景，F 聚焦。右下角提供 FPS 和流畅／均衡／清晰三档分辨率选择。完整效果和原模型材质保留。

白屏时关闭程序，双击“白屏恢复启动.cmd”。诊断文件位于 %APPDATA%\\sky-map-editor\\render-diagnostics.log。

验证覆盖 33 张地图的着色器与生物资源，以及 ${verified.viewportMaps.join('、')} 的实际生物视口；${verified.tests} 项全项目基线及 ${verified.focusedTests} 项补充针对性回归执行通过。Windows x64 构建与包完整性核验通过，Windows 真机尚未测试。

本次增加生物碰撞的场景空间索引、静止动画结果复用和顶点上传去重。原版 OBB／碰撞、地面光圈显示含编辑器适配；蝴蝶携带、任务和轨道尾事件尚未完整接入。原 Data 缺贴图，Windows 真机尚未测试。实测数据见 docs/creature-contact-performance.json 和 docs/performance-creature-latest.json；局部 CPU 加速不能替代整图帧率，未宣称达到 120 FPS 或整图 10～20 倍。详见 docs/生物巡视与蝴蝶修复.md。

本项目采用禁止商用版权许可，详见 LICENSE.md 和 GitHub声明.md。问题、建议与授权咨询请使用者自行发送邮件至 3661380498@qq.com。
`);
 const recovery='@echo off\r\nsetlocal\r\nset "SKY_WINDOWS_CANVAS=1"\r\nset "SKY_WINDOWS_NATIVE=0"\r\ncd /d "%~dp0"\r\nstart "" "%~dp0SkyMapEditor.exe" --sky-canvas --disable-gpu\r\n';await fs.writeFile(path.join(target,'白屏恢复启动.cmd'),recovery);
 const runtimePayloadSha256={};for(const entry of await fs.readdir(target,{withFileTypes:true}))if(entry.isFile()&&!entry.name.endsWith('.md')&&!entry.name.endsWith('.cmd'))runtimePayloadSha256[entry.name]=sha(await fs.readFile(path.join(target,entry.name)));for(const name of await fs.readdir(path.join(target,'locales')))runtimePayloadSha256['locales/'+name]=sha(await fs.readFile(path.join(target,'locales',name)));
 const payloadSha256={};for(const [file,digest] of Object.entries(verified.buildPayloadSha256)){const relative=file.startsWith('dist/native/')||file.startsWith('dist/vulkan-shaders/')?'resources/'+file.slice(5):file;payloadSha256[relative]=digest;if(relative.startsWith('dist/'))assert.equal(sha(asar.extractFile(path.join(target,'resources/app.asar'),relative)),digest);}
 payloadSha256['resources/app.asar']=sha(await fs.readFile(path.join(target,'resources/app.asar')));payloadSha256['resources/native/vulkan-1.dll']=sha(await fs.readFile(path.join(target,'resources/native/vulkan-1.dll')));payloadSha256['白屏恢复启动.cmd']=sha(Buffer.from(recovery));
 for(const file of ['GitHub声明.md','LICENSE.md','使用说明.md'])payloadSha256[file]=sha(await fs.readFile(path.join(target,file)));
 const manifest={kind:'basic-creature-preview',version:verified.version+'-preview.'+stamp.replace('-','.'),platform:'win32',architecture:'x64',electronVersion:version,electronArchiveSha256:official,runtimeSource,runtimePayloadSha256,payloadSha256,asarRuntimePayloadSha256:{'docs/beamo-rsqrt-capability.bin':arithmetic.binarySha256},evidenceSha256:{...verified.evidenceSha256,'docs/basic-creature-verification.json':sha(await fs.readFile('docs/basic-creature-verification.json'))},scope:verified.scope,summary:verified.summary,tests:verified.tests,gameDataBundled:false,windowsRuntimeVerified:false};await fs.writeFile(path.join(target,'预览构建信息.json'),JSON.stringify(manifest,null,2)+'\n');
 execFileSync('python3',['-c','import pathlib,zipfile,sys;p=pathlib.Path(sys.argv[1]);z=zipfile.ZipFile(sys.argv[2],"x",zipfile.ZIP_DEFLATED,compresslevel=6);[z.write(f,f.relative_to(p.parent)) for f in p.rglob("*") if f.is_file()];z.close();assert zipfile.ZipFile(sys.argv[2]).testzip() is None',target,output]);const archiveSha256=sha(await fs.readFile(output));await fs.writeFile(output+'.sha256',archiveSha256+'  '+path.basename(output)+'\n');const report={...manifest,archive:output,archiveBytes:(await fs.stat(output)).size,archiveSha256,extractedDirectory:target,zipIntegrityVerified:true};await fs.writeFile('docs/basic-creature-package.json',JSON.stringify(report,null,2)+'\n');console.log(JSON.stringify({archive:output,bytes:report.archiveBytes,sha256:archiveSha256,runtimeSource:runtimeSource.kind}));
}finally{await fs.rm(staging,{recursive:true,force:true});}
