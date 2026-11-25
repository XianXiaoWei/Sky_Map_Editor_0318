import asar from '@electron/asar';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import crypto from 'node:crypto';
import { execFileSync } from 'node:child_process';

const pkg=JSON.parse(await fs.readFile('package.json','utf8'));
const electronPackage=JSON.parse(await fs.readFile('node_modules/electron/package.json','utf8'));
const now=new Date(),stamp=now.toISOString().replace(/[-:]/g,'').replace('T','-').slice(0,15);
const previewVersion=`${pkg.version}-preview.${stamp.replace('-','.t')}`;
const release=path.resolve('release'),folder=`preview-${stamp}`;
const buildRoot=path.join(release,folder),target=path.join(buildRoot,'SkyMapEditor-preview-win32-x64');
const output=path.join(release,`SkyMapEditor-Windows-x64-preview-${stamp}.zip`);
await fs.mkdir(release,{recursive:true});
await fs.mkdir(buildRoot,{recursive:false});
const staging=await fs.mkdtemp(path.join(os.tmpdir(),'sky-preview-package-'));
const hash=bytes=>crypto.createHash('sha256').update(bytes).digest('hex');
try {
  if(process.argv.includes('--reuse-verified-payload')){
    const previous=JSON.parse(await fs.readFile('docs/preview-package.json','utf8')),verified=JSON.parse(await fs.readFile('docs/preview-package-verification.json','utf8'));
    if(!verified.passed||verified.archiveSha256!==previous.archiveSha256)throw new Error('没有已独立核验的构建可复用');
    for(const [name,sha] of Object.entries(previous.payloadSha256)){
      const source=name.startsWith('resources/')?'dist/'+name.slice('resources/'.length):name==='白屏恢复启动.cmd'?'release/'+name:name;
      if(hash(await fs.readFile(source))!==sha)throw new Error(`已核验构建发生变化：${source}`);
    }
  }else if(process.argv.includes('--use-verified-build')){
    const verified=JSON.parse(await fs.readFile(process.env.SKY_WINDOWS_BUILD_REPORT??'docs/windows-performance-verification.json','utf8'));
    if(!verified.passed)throw new Error('当前 Windows 构建未通过检查');
    for(const [name,digest] of Object.entries(verified.buildPayloadSha256))if(hash(await fs.readFile(name))!==digest)throw new Error('已验证构建变化：'+name);
  }else{
    execFileSync(process.execPath,['tools/build.mjs'],{stdio:'inherit'});
    execFileSync('node',['node_modules/tsx/dist/cli.mjs','tools/precompile-viewport-shaders.ts'],{stdio:'inherit'});
    execFileSync('python3',['tools/build-vulkan.py','--windows'],{stdio:'inherit'});
  }
  execFileSync('node',['node_modules/tsx/dist/cli.mjs','tools/verify-model-shader-bundle.ts'],{stdio:'inherit'});
  const modelCoverage=JSON.parse(await fs.readFile('docs/model-coverage-verification.json','utf8'));
  if(!modelCoverage.passed)throw new Error('模型全地图检查尚未通过');
  for(const [name,digest] of Object.entries(modelCoverage.buildPayloadSha256))if(hash(await fs.readFile(name))!==digest)throw new Error('模型检查后的构建发生变化：'+name);
  for(const [name,digest] of Object.entries(modelCoverage.evidenceSha256))if(hash(await fs.readFile(name))!==digest)throw new Error('模型检查后的证据发生变化：'+name);
  const version=electronPackage.version,artifact=`electron-v${version}-win32-x64.zip`;
  const archive=path.join(release,artifact),checksums=JSON.parse(await fs.readFile('node_modules/electron/checksums.json','utf8'));
  const expected=checksums[artifact];if(!expected)throw new Error('缺少 Electron Windows 包的官方 SHA-256');
  let valid=false;try{valid=hash(await fs.readFile(archive))===expected;}catch{}
  if(!valid)throw new Error(`缓存 ${artifact} 不存在或校验不符；预览打包不会覆盖既有发布文件`);
  await fs.cp('dist',path.join(staging,'dist'),{recursive:true,filter:source=>{
    const relative=path.relative(path.resolve('dist'),path.resolve(source));
    return relative!=='native'&&!relative.startsWith('native'+path.sep);
  }});
  await fs.writeFile(path.join(staging,'package.json'),JSON.stringify({name:'sky-map-editor',productName:'Sky 地图编辑器渲染预览',version:previewVersion,main:'dist/main.cjs'}));
  const beamoArithmetic=await fs.readFile('docs/beamo-rsqrt-capability.bin'),beamoEvidence=JSON.parse(await fs.readFile('docs/beamo-rsqrt-capability.json','utf8'));
  if(hash(beamoArithmetic)!==beamoEvidence.binarySha256)throw new Error('Beamo 原数学查表 SHA 不符');
  await fs.mkdir(path.join(staging,'docs'),{recursive:true});
  await fs.writeFile(path.join(staging,'docs','beamo-rsqrt-capability.bin'),beamoArithmetic);
  await fs.mkdir(target,{recursive:true});
  execFileSync('python3',['-c','import zipfile,sys; zipfile.ZipFile(sys.argv[1]).extractall(sys.argv[2])',archive,target],{stdio:'inherit'});
  const asarPath=path.join(target,'resources','app.asar');await asar.createPackage(staging,asarPath);
  if(hash(asar.extractFile(asarPath,'docs/beamo-rsqrt-capability.bin'))!==beamoEvidence.binarySha256)throw new Error('Beamo 原数学查表 ASAR 校验失败');
  const native=await fs.readFile('dist/native/sky-vulkan.exe');
  if(native.readUInt16LE(0)!==0x5a4d||native.readUInt16LE(native.readUInt32LE(0x3c)+4)!==0x8664)throw new Error('Vulkan host 不是 Windows AMD64 PE');
  await fs.mkdir(path.join(target,'resources','native'),{recursive:true});
  await fs.writeFile(path.join(target,'resources','native','sky-vulkan.exe'),native);
  // The helper is launched from resources/native; put the official loader
  // next to it so a shortcut's working directory cannot break software fallback.
  await fs.copyFile(path.join(target,'vulkan-1.dll'),path.join(target,'resources','native','vulkan-1.dll'));
  await fs.cp('dist/vulkan-shaders',path.join(target,'resources','vulkan-shaders'),{recursive:true});
  await fs.rename(path.join(target,'electron.exe'),path.join(target,'SkyMapEditor.exe'));
  const instructions=`# Sky 地图编辑器：Windows 实时渲染试用版

版本：${previewVersion}，构建时间：${now.toISOString()}。

1. 完整解压，双击 SkyMapEditor.exe，保留 resources 和运行库。
2. 选择游戏 Data。本包不内置 Data；完整源码资源包提供 Data。预编译 shader 已包含，无需 Vulkan SDK。
3. WASD 移动，Q/E 升降，右键拖动看向，Shift 加速，中键旋转，滚轮缩放，Home 全景，F 聚焦。bin 模式编辑/播放已支持的 Objects 事件。
4. 保留白屏修复后的普通不透明窗口与画布。完整 Vulkan 原材质、贴图、深度、实体云、云片、雾、运动向量、时间抗锯齿及 Tonemap 已接入阶段保留。硬件 GPU 内转换最终 RGBA，再读回显示；不传输最终浮点图，中间 HDR 不走管道。每帧回复为 32 字节状态加最终 RGBA。
5. 若仍白屏，关闭编辑器，将“白屏恢复启动.cmd”放在 SkyMapEditor.exe 同一目录并双击。它固定使用画布并关闭网页 GPU 合成；游戏预览仍由独立 Vulkan 进程渲染。错误诊断记录在 %APPDATA%\\sky-map-editor\\render-diagnostics.log。
6. 右下角提供“流畅、均衡、清晰”三档，所有档位保留完整效果、原材质和原时间抗锯齿。Windows 默认均衡：内部线性尺寸在原生的 67%–100% 之间调节；清晰固定原生 100%，不因帧耗时下降分辨率。流畅保留旧版动态分辨率策略，GT 1030 内部长边范围 384–1600。超过 4096 的长边按协议上限缩放。所选档位会记住。FPS、响应耗时、实际显示图像尺寸和渲染比例每 250ms 更新。将鼠标放在 FPS 上可查看设备、GPU 总耗时以及地形/模型、云雾、抗锯齿、显示传输的分段计时。目标是三档均达到 60–70 FPS 以上；Windows GT 1030 的这一目标尚未实测验收，目标预算不等于实际帧率。硬件云纹理仍使用原生滤波，最终 RGBA 读回、资源缓存和单请求调度优化保留。
7. 完整视图静止或暂停后，补齐原时间抗锯齿八相采样，再停止按需渲染；原抗锯齿 shader 保持不变。裙边末尾四字节属性恢复原 SkirtBarn 的有符号归一化读取，修复透明裁边和过渡输入。没有改写 BstBaked.meshes 原文件，也没有改写原 skirt shader。未知裙边材质 ID 按原材质掩码规则忽略，不使整张地图加载失败。

本批减少了环境/LUT/probe更新、重复纹理和几何上传、模型变换、点选及暂停控制器的开销。模型移动只更新矩阵，选中框与辅助线独立上传；已确认安全的静态模型在视野外跳过绘制和 uniform 打包。支持时选择 MAILBOX，完成回调不再受网页 RAF 刷新节奏限制，始终只有一个 GPU 请求。

复杂地图首次加载仍需解析、准备大量资源，尚未实现首次秒开。后续预处理缓存、后台加载、资源常驻和原 Objects.level.bin 依赖继续推进。

本轮模型检查覆盖 ${modelCoverage.summary.maps} 张地图、${modelCoverage.summary.models} 个 LevelMesh 和 ${modelCoverage.summary.beamoInstances} 个 Beamo／BeamoDecal。贴图引用无缺失，带骨骼动画的 ${modelCoverage.summary.animatedModels} 个模型均可采样；按地图保存设置自动播放 ${modelCoverage.summary.automaticAnimationAvailableModels} 个实例。选中模型后可打开“模型动作预览”，选择默认或命名动作，播放、暂停、停止并还原。天空、远景云、雾体和湿地／沙地材质已接入，水面、花草、蜡烛专用 shader 随包提供，无需 Vulkan SDK。

这些是编辑器模型绘制与动画覆盖检查。${modelCoverage.classProgress.declaredClasses} 个原类中，${modelCoverage.classProgress.coreSubchainVerifiedClasses} 个有核心子链核验；完整原类运行验收仍为 ${modelCoverage.classProgress.completeRuntimeClasses}。完整生物 AI、鸟群自主运动、原 Model／Visibility／卸载所有权、动画分层与事件、玩家交互及原游戏完整画面仍未闭合。已有环境字段适配含 SpawnMotes。

蜡烛、黑暗植物和生物尚未全部完成。蜡烛已有本体绘制和部分逻辑，火焰及完整交互仍待接；黑暗植物的燃烧传播与奖励、生物自主运动与动画切换也仍待完成。具体范围见 docs/全地图模型贴图与动画续接.md。

已完成项目测试、类型检查及 Linux 共享 Vulkan/Electron 检查。Windows 真机、SwiftShader回退、实际显卡 FPS 尚未验证。原生双窗口显示保留为显式诊断入口 SKY_WINDOWS_NATIVE=1，默认不启用。

本版模型改动与验收见 docs/全地图模型贴图与动画续接.md、docs/model-coverage-verification.json。画面清晰度、裙边、性能和白屏修复的历史记录也保留在 docs 中，记录的哈希对应当时构建；当前包的精确构建哈希以本版模型验证和预览构建信息为准。旧包保留。
`;
  await fs.writeFile(path.join(target,'使用说明.md'),instructions);
  const recovery='@echo off\r\nsetlocal\r\nset "SKY_WINDOWS_CANVAS=1"\r\nset "SKY_WINDOWS_NATIVE=0"\r\ncd /d "%~dp0"\r\nif not exist "SkyMapEditor.exe" (\r\n  echo Place this CMD beside SkyMapEditor.exe, then run it again.\r\n  pause\r\n  exit /b 1\r\n)\r\nstart "" "%~dp0SkyMapEditor.exe" --sky-canvas --disable-gpu\r\n';
  await fs.writeFile(path.join(target,'白屏恢复启动.cmd'),recovery);
  await fs.copyFile('README.md',path.join(target,'开发说明.md'));
  await fs.mkdir(path.join(target,'docs'),{recursive:true});
  for(const name of ['Windows实时渲染优化.md','windows-performance-verification.json','windows-surface-smoke.json','BstBaked.meshes渲染清单.md','BstBaked.meshes逆向进展.md','实体云与Tex3D逆向进展.md','meshes-render-functions.json','meshes-render-checks.json','meshes-coverage.json','cloud-card-facing-oracle.json','cloud-card-visibility-ipc-check.json','地形与实体云渲染预览.md','viewport-cloud-check.json','material-batch-order-check.json','cloud-preview-parameters.json','cloud-avatar-query-oracle.json','viewport-shader-bundle.json','cloud-camera-query-oracle.json','cloud-spatial-depth-check.json','cloud-preview-compare.json','cloud-noise-compare.json','viewport-filter-check.json','BstBaked数据段清单.md','BstBaked数据段进度.json','meshes-object-links.json','temporal-aa-check.json','compositor-noise-oracle.json','viewport-cloud-all-maps-check.json','cloud-temporal-compare.json','相机采样与云地形时间历史逆向.md','camera-jitter-oracle.json','camera-temporal-check.json','viewport-camera-sampling-check.json','cloud-camera-compare.json','视口飞行相机.md','fly-camera-smoke.json','本次续接与试用包.md','Objects续接状态.md','环境共享状态遮挡事件与视口帧率.md','环境对象处理清单.md','环境原构造与共享状态.md','environment-objects-audit.json','environment-construction.json','environment-construction-oracle.json','environment-leaf-native.json','environment-leaf-oracle.json','environment-shared-continuation-verification.json','package-continuation-verification.json','environment-event-owner-smoke.json','viewport-performance.png','Beamo原材质绘制与SkyHub2效果.md','Beamo全LOD上传与基础类推进.md','model-material-SkyHub2-render.png','model-material-SkyHub2-smoke.json','model-material-verification.json','model-lifecycle-oracle.json','Objects与Avatar清单.md','model-shader-bundle-verification.json','beamo-rsqrt-capability.json','低配置性能优化续接.md','Objects.level.bin逻辑实现列表.md','Objects.level.bin逻辑实现列表.json','performance-auto.json','model-render-state-gpu-check.json'])
    await fs.copyFile(path.join('docs',name),path.join(target,'docs',name));
  for(const name of ['完整效果GPU渲染优化.md','full-preview-verification.json','full-preview-graph-check.json','full-preview-graph-surface-check.json','full-preview-ui-check.json'])await fs.copyFile(path.join('docs',name),path.join(target,'docs',name));
  for(const name of ['Windows白屏修复.md','white-screen-recovery.json'])await fs.copyFile(path.join('docs',name),path.join(target,'docs',name));
  for(const name of ['GT1030完整效果性能优化.md','gt1030-performance-verification.json'])await fs.copyFile(path.join('docs',name),path.join(target,'docs',name));
  await fs.copyFile('docs/cloud-hardware-filter-check.json',path.join(target,'docs/cloud-hardware-filter-check.json'));
  for(const name of ['gt1030-transfer-graph-check.json','gt1030-hardware-cloud-graph-check.json','gt1030-canvas-check.json','gt1030-vulkan-validation.json','cloud-shader-bundle-verification.json'])await fs.copyFile(path.join('docs',name),path.join(target,'docs',name));
  for(const name of ['画面清晰度与裙边修复.md','viewport-display-verification.json','viewport-display-smoke.json','skirt-render-check.json'])await fs.copyFile(path.join('docs',name),path.join(target,'docs',name));
  for(const name of ['全地图模型贴图与动画续接.md','model-coverage-verification.json','model-coverage-audit.json','model-coverage-smoke.json','model-material-coverage-gpu.json','Objects.level.bin类进度清单.md','Objects.level.bin类进度.json','自然动画与鸟群引导续接.md','螃蟹行为与群体转向续接.md','黑暗植物与生物加载续接.md','生物类续接.md','作者介绍与Windows源码.md','creature-continuation-verification.json','author-profile-smoke.json','水面花草效果续接.md','蜡烛逻辑与绘制续接.md'])await fs.copyFile(path.join('docs',name),path.join(target,'docs',name));
  for(const entry of [...JSON.parse(await fs.readFile('docs/model-coverage-smoke.json','utf8')).maps,...JSON.parse(await fs.readFile('docs/model-material-coverage-gpu.json','utf8')).cases])await fs.copyFile(entry.screenshot,path.join(target,entry.screenshot));
  for(const run of JSON.parse(await fs.readFile('docs/model-coverage-smoke.json','utf8')).runs??[])await fs.copyFile(run.report,path.join(target,run.report));
  await fs.cp('docs/Objects类清单',path.join(target,'docs/Objects类清单'),{recursive:true});
  await fs.mkdir(path.join(target,'docs/shader-effects'),{recursive:true});
  for(const level of ['Dawn','Prairie_ButterflyFields','Sunset'])for(const suffix of ['cloud-before-after','cloud-noise-before-after','cloud-temporal-before-after','cloud-camera-before-after'])await fs.copyFile(`docs/shader-effects/${level}-${suffix}.png`,path.join(target,'docs/shader-effects',`${level}-${suffix}.png`));
  const payloadFiles=['main.cjs','preload.cjs','app.js','index.html','style.css','classes.json','author-appreciation.png'];
  const payload={};
  for(const name of payloadFiles) {
    const source=await fs.readFile(path.join('dist',name));
    if(hash(asar.extractFile(asarPath,'dist/'+name))!==hash(source))throw new Error(`ASAR 文件校验失败：${name}`);
    payload['dist/'+name]=hash(source);
  }
  payload['resources/native/sky-vulkan.exe']=hash(native);
  payload['resources/native/vulkan-1.dll']=hash(await fs.readFile(path.join(target,'resources/native/vulkan-1.dll')));
  payload['白屏恢复启动.cmd']=hash(Buffer.from(recovery));
  for(const key of await fs.readdir('dist/vulkan-shaders'))if(/^[0-9a-f]{64}$/.test(key))for(const name of ['vert.spv','frag.spv','manifest.json']){const source=await fs.readFile(path.join('dist/vulkan-shaders',key,name)),relative=path.join('resources','vulkan-shaders',key,name);if(hash(await fs.readFile(path.join(target,relative)))!==hash(source))throw new Error('预编译 shader 复制校验失败');payload[relative.replaceAll(path.sep,'/')]=hash(source);}
  const manifest={kind:'render-preview',version:previewVersion,builtAtUTC:now.toISOString(),platform:'win32',architecture:'x64',
    electronVersion:version,electronArchiveSha256:expected,payloadSha256:payload,
    asarRuntimePayloadSha256:{'docs/beamo-rsqrt-capability.bin':beamoEvidence.binarySha256},
    currentScope:modelCoverage.scope,
    modelCoverage:{...modelCoverage.summary,viewportMaps:modelCoverage.viewportMaps,materialPixelCases:modelCoverage.materialPixelCases,verification:'docs/model-coverage-verification.json',completeOriginalClasses:modelCoverage.classProgress.completeRuntimeClasses},
    displayResolution:{defaultDesktopMode:'balanced',persisted:true,modes:{smooth:{adaptive:true,gt1030LongEdge:[384,1600]},balanced:{adaptive:true,minimumScale:.67,maximumScale:1},native:{adaptive:false,scale:1}},staticTemporalPhases:8,protocolLongEdgeLimit:4096,targetFps:60,requestedMinimumFps:70,requestedMinimumFpsVerified:false},
    performanceOptimization:{defaultQuality:'full',defaultPresentation:'canvas',nativePresentation:false,nativePresentationOptIn:true,frameResponseHeaderBytes:32,frameResponseBytes:'32 + width * height * 4',targetFrameBudgetMs:1000/60,adaptiveRenderLongEdge:[384,1920],gt1030RenderLongEdge:[384,1600],gt1030InitialLongEdge:960,softwareFullRenderLongEdge:[128,640],initialLongEdge:1280,defaultGraphics:'original materials and textures',automaticBasicFallback:false,completionScheduling:'hardware canvas and desktop native',maxConcurrentFrameRequests:1,presentMode:'Canvas2D by default; native MAILBOX/FIFO opt-in',staticFrustumCulling:true,originalVisibilityFrustumQuery:true,offscreenUniformPacking:false,fullGpuSubmissionsPerFrame:2,intermediateHdrPipeReadbacks:0,finalDisplayPipeReadbacks:1,hardwareFinalReadbackBytesPerPixel:4,previousFinalReadbackBytesPerPixel:16,gpuExposureGatherOnHardware:true,immutableAssetDigestCache:true,compatibleDirectAttachmentSampling:true,hardwareCloudFiltering:true,gpuStageTiming:true,fullEffectsReadbacksRemain:false,sparseNativeExposureReadbacksRemain:true,softwareFallback:'official Electron SwiftShader on Windows initialization failure',windowsSoftwareFallbackVerified:false,windowsHardwareFpsVerified:false},
    performanceHud:{position:'bottom-right',metrics:['completed draw FPS','draw-to-present milliseconds','internal render size','GPU work milliseconds','GPU stage times on hover'],refreshMs:250,idleRendering:'completion-driven hardware canvas/native while rendering; RAF for idle or hidden work'},
    completeOriginalClasses:0,completeOriginalObjects:0,completeBehaviorClasses:0,
    viewportShadersBundled:true,viewportShaderEntries:JSON.parse(await fs.readFile('docs/viewport-shader-bundle.json','utf8')).cacheEntries,
    modelShaderProgramsBundled:JSON.parse(await fs.readFile('docs/model-shader-bundle-verification.json','utf8')).modelPrograms,modelShadersVerifiedWithoutSDK:true,
    gameDataBundled:false,windowsRuntimeVerified:false,existingReleaseReplaced:false};
  await fs.writeFile(path.join(target,'预览构建信息.json'),JSON.stringify(manifest,null,2)+'\n');
  execFileSync('python3',['-c','import pathlib,zipfile,sys; p=pathlib.Path(sys.argv[1]); z=zipfile.ZipFile(sys.argv[2],"x",zipfile.ZIP_DEFLATED); [z.write(f,f.relative_to(p.parent)) for f in p.rglob("*") if f.is_file()]; z.close(); check=zipfile.ZipFile(sys.argv[2]); bad=check.testzip(); check.close(); assert bad is None, bad',target,output],{stdio:'inherit'});
  const bytes=await fs.readFile(output),sha256=hash(bytes);
  await fs.writeFile(output+'.sha256',`${sha256}  ${path.basename(output)}\n`);
  const report={...manifest,archive:output,archiveBytes:bytes.length,archiveSha256:sha256,extractedDirectory:target,asarPayloadVerified:true,zipIntegrityVerified:true};
  await fs.writeFile(path.join(buildRoot,'preview-package.json'),JSON.stringify(report,null,2)+'\n');
  await fs.writeFile('docs/preview-package.json',JSON.stringify(report,null,2)+'\n');
  console.log(JSON.stringify(report));
}finally{await fs.rm(staging,{recursive:true,force:true});}
