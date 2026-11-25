最新续接（2026-11-25）：螃蟹完整状态包编解码与真实BinaryStream／PlayerId上下文／NetPlayerBarn映射接入实际Barn收发，432组原程序对照零差异。包缓冲、读回、游标／对齐／有效位和原故障核验通过。主要缺口仍是两类外层更新、世界碰撞、真实动画／GPU和切图生命周期；按已有要求生物完成后打包，详见 [本段范围与打包验收](螃蟹真实包编解码与打包门槛.md)。

最新续接（2026-11-25）：冥龙完整玩家／鸟目标检测与警戒组合179组、螃蟹状态快照／收发与实际Barn.Update组合176组原程序零差异。私有转换引用、明确解码计数、scratch保留和重叠写回已核验。两类外层更新、原动画／碰撞／资源与真实网络仍待接，完整生物类保持0；详见 [冥龙与螃蟹续接](冥龙与螃蟹续接.md)。

最新续接（2026-11-25）：继续原游戏生物 AI。中断的轨道段全量 650 项测试、类型检查与 Windows 构建已补齐。本次新增鸟／遥鲲对象跟随、直接 Seek／Brake／Orbit，独立 283 组、实际整帧组合 67 组原对照零差异；最多连续 10 帧。当前仍需真实 Avatar／世界／碰撞／轨道几何、Critter 效果、方向／倾斜及 Model／动画／GPU owner，不计完整生物。只维护 Windows，生物完成前不创建 ZIP。最终验证与下一入口见 [生物类续接](生物类续接.md)、[验证记录](creature-continuation-verification.json)。以下保留历史阶段。

---

最新续接（2026-11-22，Windows 0.3.8）：用户已确认渲染恢复并要求继续 Objects.level.bin 环境／物品。已定位 FlowerPatch、CandleObject、Water 及相关火焰、门控、贴花／云片类；修复原 Image source 别名解析，76 个模型新增贴图依赖满足。恢复三类原池式创建和 Candle 变换／启用等八个原内核，1216 组、159407968 字节零差异；620 个真实草花／水实例使用共享原槽位。完整草花、水、蜡烛更新／绘制及原生命周期仍待接，完整类／实例 0；GT 1030 高帧率未实测。详见 [本轮原类推进](Objects环境物品类推进.md)、[逐实例清单](objects-environment-items-audit.json)、[原内核对照](object-effects-oracle.json)。以下保留白屏阶段等历史记录。

本批收尾：486 项项目回归、15 项相关回归及类型检查通过。HeatTex、BasicGeoAtlas1、LifeForceMural02Sh、BirdStripTex 四种别名已用原模型／shader 实际 GPU 出图；鸟群用原三角面近景验证，避免全模型低分辨率缩略图的 mip/alpha-test 消失。Dawn → CarryLand2 → Prairie_Cave → WorldEmpty 的完整 Vulkan 画布、槽位／模型资源、IPC 图片字节、源文件不变及切图清理通过，截图保存实际画布像素。详见 [GPU 出图](image-alias-gpu-check.json)、[实际地图](objects-environment-items-smoke.json)、[当前开发构建验收](object-effects-verification.json)。0.3.7 已验证 native/shader、三档与裙边逻辑保持，当前开发构建绑定单独记录；不把开发构建核验当成已打包 ASAR 或 Windows 真机启动验收。

---

最新续接（2026-11-22，Windows 0.3.5）：用户报告所有地图白屏，光影扩展暂停，先恢复显示。Windows 默认由未经实机验证的透明双窗口改为普通窗口内画布，保留同一完整 Vulkan 图与原材质；中间 HDR 不读回，仅增加最终 RGBA 显示读回。恢复启动文件也适用于 0.3.4。474 项测试及类型检查通过，Khronos 同步验证和真实画布检查见 [白屏修复](Windows白屏修复.md)、[本版验收](white-screen-recovery.json)。Windows 用户设备根因和修复效果尚未实测，不能把软件 Vulkan 出图说成真机修复成功。原游戏整图光影和完整类/实例仍未闭合。

此前（2026-11-22，Windows 0.3.4）：用户要求只保留完整效果。已将现有原深度/云/云片/雾/运动/TAA/Tonemap预览阶段改为GPU附件连接，原生窗口每帧32字节状态/曝光，中间与最终画面管道读回为0。修复云地图→空地图的缓存附件悬空引用，以及曝光计量UBO重放状态；完整效果只按耗时调整尺寸，不切简化材质。详见 [当轮说明](完整效果GPU渲染优化.md)、[当轮验证](full-preview-verification.json)。秒加载、Windows真机帧率与原游戏整图效果仍待验收；原水/光影/Model/Scene/Objects完整生命周期未闭合，完整类/实例0不变。下面保留此前记录。

---

最新续接（2026-11-22）：补完 RenderList 8 个完整原注册/注销/提交/图元计数/格式上下文内核，接已有 VertexRender 默认初始化/释放和 Model 实际队列提交接口。248 组准备输入、798 操作快照、26,291,400 比较字节零差异，初始化→提交→释放→重新初始化组合通过。详见 [本轮说明](RenderList原注册提交与生命周期推进.md)、[原对照](render-list-oracle.json)、[最终验证](render-list-verification.json)。实际主视口原 Scene 队列、清帧 count 所有者、完整排序/绘制、Model ctor/实际资源绑定仍缺；本轮没有新的 Windows FPS 成绩，完整类/实例仍为 0。

此前 Windows 0.3.3 批验证完成：465 项项目回归、最后 15 项视口检查、TypeScript、Windows PE交叉编译、8组GPU/桌面/播放检查通过。原生默认视口回复像素字节为0；模型 #7平移3只发1次矩阵请求、场景/材质重传0；暂停控制器重复transform/enabled请求0。详见 windows-performance-verification.json。Windows 真机、完整管线、秒加载和几百帧均未验收，完整类/实例仍0。

最新用户要求：保留 Vulkan GPU 接口，使用原游戏渲染方法；先性能后 Objects.level.bin。当前已将原 QueryAABBs frustum-only 接入已核验静态模型剔除，下一步原 Model/资源/LOD/Visibility深度/RenderList 生命周期，原字段/材质/事件子链延续。几百帧与秒加载未达到，完整类/实例仍 0。

当前续接（2026-11-22）：用户改为优先 Windows x64，要求流畅实时渲染，并明确完成性能优化后继续推进 Objects.level.bin。0.3.3 默认原生 Vulkan swapchain；原材质不再整帧读回/网页绘制，GPU 完成后调度、支持时 MAILBOX，240 FPS 预算与 1280 长边画质下限。模型/环境增量资源、点选加速和控制器重复更新抑制延续。完整说明见 [Windows 优化](Windows实时渲染优化.md)；Windows 真机 FPS、首次秒加载、完整云/TAA和原光影尚未验收。

本批原逻辑下一步沿现有环境/模型依赖继续，基础子链不计作完整类/实例；完整验收仍为 0。以下保留 Android 和此前研究记录。

---

最新续接（2026-11-22）：Android 0.3.2 / versionCode 6 优先修复换图、环境更新和模型互动卡顿。环境/LUT/probe 更新复用已有资源，纹理/几何有界缓存与共享传输，静态模型变换只更新矩阵；点选使用保留原三角形顺序的空间索引，真实 Dawn/SkyHub2 查询约 15 倍/7 倍加速。环境 owner 重置采用递增渲染版本，避免命中旧光照缓存。

458 项测试、类型检查及 HDR/透明/深度、贴图共享、模型变换、环境开关和 Surface GPU 回归通过。横屏生产 UI 的换图与互动性能证据、范围见 [卡顿修复说明](Android卡顿修复.md)，本版交付见 [交付收据](android-delivery-verification.json)。性能测量为 Linux 软件 Vulkan，持续导航帧率未达 60 FPS；Android Activity/SurfaceView/手机 FPS/16 KB 页未验收。完整实体云、原阴影、局部灯光、水和完整类/实例仍未闭合，完整验收计数保持 0。

---

此前 0.3.1 记录：

最新续接（2026-11-22）：Android 0.3.1 / versionCode 5 按横屏编辑器需求完成 GPU 直出视口。默认原材质 GPU 合成后直接呈现到 SurfaceView，每帧仅返回 20 字节状态；增加 FXAA、sRGB 显示转换，实时分辨率长边上限 2560、下限 1280，受视口物理尺寸限制。固定 sensorLandscape，紧凑面板和触屏编辑保留。

452 项项目测试、类型检查、原生构建、24 项材质 GPU 检查及共享 Presenter 的 XCB/触屏联调通过。新版 CLI Bionic GUI 库加载因 libicu.so / APEX 访问受限失败，Android 应用内启动、SurfaceView 合成、实际 FPS 和 16 KB 页兼容性未验收。不能将此前 0.3.0 的运行库结果当成此版启动验证。默认实时路径未覆盖完整实体云/TAA，完整特效仍走昂贵读回；完整原类/实例保持 0。新版说明、证据和交付见 [横屏实时视口](Android横屏实时视口.md)、[本轮验证](android-surface-verification.json)、[交付收据](android-delivery-verification.json)。

---

此前 Android 0.3.0 续接（2026-11-22，历史验证）：用户已改为 Android ARM64 架构。沿上一轮中断处完成应用进程内 Vulkan 共享库、真实 Bionic Node 18 生产服务核验及新版 APK 打包；保留全套已有编辑/模型/环境/预览逻辑，左右摇杆、升降与触屏编辑接入同一业务接口。Data 位于 assets/Data，首次启动建立可编辑工作副本。

449 项全项目测试与新增重启回归 1 项通过；触屏/保存/导出/横竖屏联调通过，12 帧进程内渲染对照与 4 次重启通过，真实 Android 运行库读取 WorldEmpty/Dawn/SkyHub2 通过。当前环境没有可访问的 Android GPU，Activity 安装、真机 FPS 与 16 KB 页兼容性仍待验证。完整对象类/实例验收仍为 0；水、蜡烛、粒子、模型/资源/Visibility 与 Avatar 后续逻辑按既有清单继续。详见 [Android 迁移与打包](Android迁移与打包.md)、[核验](android-migration-verification.json) 和 [APK](android-package-verification.json)。以下为历史进展。

---

最新续接：用户要求优先解决每张地图 0–1 FPS、五六秒延迟，且后续以游戏可观察逻辑/行为/事件顺序相符为标准，不再要求代码或内存 1:1。

本批自动档支持基础画面、GPU 内一次提交合成、线性管道拆包和透明绘制顺序增量更新。逐图软件 Vulkan 实测、Windows 独立包和 reference 哈希见 [低配置性能续接](低配置性能优化续接.md)。283 类完整行为列表已生成，49 部分实现、4 实现中、227 待实现、3 仅声明；完整行为验收仍 0。水与蜡烛等所有物品类进入清单，未把简化画面或旧字段装载当作完整生命周期实现。此前原核验与各阶段成果保留，以下为历史记录。

---

# 2026-11-21 环境/遮挡与视口续接


## 2026-11-21 继续收尾并交付试用包

本次补充 SpawnMotes 正常原 placement ctor `0x100480880`、原实际大小 160 字节和 SetTransform/GetTransform 四列原样读写。25 类/2482 个共享环境相关对象，新增 76 个 SpawnMotes；225 组构造、774 组环境辅助原机器码对照全部通过。一个 DropOcclusion 根继续因 SpawnMotes 的原 Event 启用和 Emitter/Mote 生命周期阻断；新构造和变换字段装载不代替这些依赖。右下角 FPS、耗时与渲染尺寸功能及此前 Beamo/环境事件一起进入独立 Windows x64 试用包，完整原类/实例仍为 0。最新验证与交付范围见 [本次续接与试用包](本次续接与试用包.md)，以下段落为此前工作记录。

最新用户补充：视口右下角显示帧率/耗时并保持流畅。新增实际呈现 FPS、绘制到呈现耗时与内部像素尺寸，250ms 刷新，不额外请求 GPU 帧。每帧四次场景遍历合并为一次。修复环境重置异步回调递增 sceneRevision，取消正在进行的地图模型创建；改 VulkanViewport.invalidate，只请求重绘且保留挂起帧之后的无效标记。

环境共享 owner 24 类/2406 对象的原正常父构造、实际原大小、POD/字符串/恢复引用已接同地址；120 Wind/26 Rail 与材质/实体云共用帧时间。新增七类天气/环境/遮挡桥，SetEmitterFlowRail 两配置、SetRainParams 全13配置、点光源521实例原256槽池、普通 Ambience 点光 uniform、DropOcclusion Load/Unload/OnEnabled/Update 与 CloudBarn 512槽路由已恢复相应正常子链。最新原机器码联合616组、40,484,928比较字节、4268服务调用零差异。全部64 Drop字段/count/Float配置参与；空间对象作为明确服务，地图共享运行63根，1根含9个SpawnMotes目标仍阻断。暂停冻结alpha/记录，恢复不重复OnEnabled；实时Float位模式、Marker变换/开关、停止和卸载已检查。

原默认颜色/字符串/metadata与分配服务、JS logf/expf、未恢复复合数组/枚举仍列pending；原cloud drop世界采样/GPU、Rain粒子/声音/碰撞、水、局部PointLight投影/阴影、FogSphere、Emitter/花草/烟花更新仍缺。Model析构/重建继承4306组原对照为内核/显式服务，主视口完整原Model ctor/Visibility/资源与GPU所有权尚未闭合，不能称模型整类完成。

验证与同步收据见 environment-shared-continuation-verification.json；整类/实例验收0，条件尚未满足，未提前打试用包。下段优先SpawnMotes空间/启用与Mote/Emitter依赖、drop后续世界采样与渲染、天气/水/体积雾生命周期、Model ctor/Visibility/卸载和基础factory/defaults，继续按原依赖推进。

---

2026-11-21 15:12 UTC：本轮模型调用类接入原材质视口并完成上次中断交付。Beamo/BeamoDecal LOD0 原打包上传、LevelMaterial shader/贴图和六种原绘制组接到主视口；189个SkyHub2原LOD0观察的快照SHA/顶点/索引/材质重放通过。2,087,452个独立RSQRTSS输入能力保留，未知编辑输入仍阻断；透明颜色/log-depth附件与不透明深度连接，14项原状态Vulkan检查沿用未改变的已通过结果。透明包围远近排序仍是编辑器适配，不算原Scene sort完成。

实际SkyHub2 #20 X+8、上传字节改变和撤销恢复通过；共享LevelMaterial #1959 StoneGrunge2→Black的83个owner重绑、几何字节不变、撤销和WorldEmpty清理通过，原文件不保存。材质修改复用不变几何，场景提交刷新并复用材质索引；地图/撤销和批量材质更新完成后再绘制，减少中间集合上传。renderedGeometrySha256对应已显示帧的几何/材质纹理哈希。Playwright waitForFunction不轮询异步Promise谓词，本轮检查改为实际状态轮询，避免选择/旧绑定帧提前通过；关闭超时有进程清理。

新SkyHub2无变换手柄截图与报告：docs/model-material-SkyHub2-render.png / viewport.png / model-material-SkyHub2.png、model-material-SkyHub2-smoke.json。182个Beamo/贴花实例合并6批，171个LevelMesh批，20个地形/裙边批，总336284三角面。保存完整相机矩阵和已显示几何/纹理哈希；平均probe、skin/animation、Skybox和部分Beamo材质缺口仍逐对象保留，不能称所有建模类或原游戏画面完成。

33图4133个LevelMesh静态材质依赖预检刷新：3322满足（此前3072），2781保存状态允许显示（此前2546）；增加250个绘制组依赖满足实例，只计预检、不计完整运行。model-draw-availability.json保留全部阻断。

全项目基线424项通过，最终源码相关28项、tsc和build通过。66原地图文件、830原Mesh和reference SHA保持。核心子链31、完整原类/实例0、BstBaked阶段分数和Avatar完整运行验收保持。新增文档Beamo原材质绘制与SkyHub2效果.md；最终核验beamo-draw-verification.json。类/实例和Objects/Avatar清单补明确证据，不额外计完整项。开发源码/dist/证据只增量同步；收据/root/sky-research/beamo-draw-sync-verification.json，不重打release、不改reference。

下一段优先恢复实际Scene u_averageProbeColor、其余天空/材质依赖、native动画/蒙皮和外部weight volumes，再闭合ResourceRef/Observe/IO、完整Model ctor和LevelMesh +0x228、自动LOD/Visibility、Barn/GPU所有权/卸载及原重烘焙。基础类factory/default缓存/Barn启动、TerrainBlob生成、CameraSystem、Parent跟随/排序/joints、环境与逻辑按用户依赖顺序继续；Avatar运动/动画/碰撞持续补齐。不要重复已通过全量原核验或随意打release。

---

2026-11-21 13:17 UTC：继续 Objects.level.bin 模型调用优先链。本批新增七个共享正常原内核：RenderPipeline.Initialize 0x1007bfd80／SetVertexData 0x1007bdfd0／Free 0x1007c0cc0，GpuBuffer.GetReadId 0x1007950a0／Reset 0x100794f80，VertexData.Reset 0x1007f5250，Renderable.Reset 0x1007f6b80。共222组（189准备＋33图原材质/分组输入，涉及7150 Beamo/Decal、309材质、252绘制组）/709077336字节、41880有序服务调用零差异。排序/重复/UTF-8、0..6UBO、read-ID/layout断言、十四buffer与mapped write-ID、实时计数/句柄/table回调修改、二次free及NaN/default矩阵保留均核验。反射表/UBO/allocator/GPU/default matrix/RenderList注销为明确服务，不冒充实际shader反射。

connectOriginalVertexRenderPipeline和prepareOriginalBeamoRenderablesWithPipeline接同地址共享管线；同一Beamo Mesh记录→两LOD上传→分组→原VertexRender/管线/材质绑定→VertexData/Renderable/管线释放组合通过。旧180组Beamo fixture仍通过。新原入口SHA及边界见render-pipeline-native.json；原x64导入跳板改用五字节近跳避免六字节相邻stub覆盖，GPU服务目标占用未执行的upload helper区间，不能宣称该helper同时原样执行。

全项目418测试/tsc/build及逐类/逐实例Electron界面通过。33图66原文件、830 Mesh和原程序SHA保持，native renderer二进制SHA未变；283声明/280对象类/49824对象/60016引用/断链0、31核心子链、阶段均值30.42%，完整原类/实例仍0；BstBaked各段分数不擅自提高。更新类/实例清单与Objects/Avatar汇总；文档Objects共享渲染管线生命周期推进.md，最终核验render-pipeline-verification.json；开发目录增量同步收据/root/sky-research/render-pipeline-sync-verification.json，不重打release、不改reference。

下一段先继续Beamo Load上游Mesh ResourceRef/Observe与UnitCube fallback、真实shader反射/vector/texture setter、完整Barn卸载/RenderList所有权/Visibility/skirts，然后LevelMesh→完整Model ctor/resource加载→+0x228、LevelData IO/原重烘焙。基础类factory/default缓存/Barn启动、TerrainBlob生成、CameraSystem、Parent排序/joints/follow以及环境/逻辑仍按用户依赖顺序扩大。Avatar上一批滑移/定位/force/nearby成果保留；真实碰撞服务与加载/动画/蒙皮仍未完成。

---

2026-11-21 12:50 UTC：共享渲染内核和Avatar同批重点推进。Beamo Barn.Load完整材质/renderable循环＋Scene 23名称查找＋共享VertexRender两完整正常入口＋真实ResourceRef内核：180组（147准备＋全部33图7150对象/309材质/252组）/569675792字节零差异；同一记录/VertexData上传→分组→渲染初始化/纹理绑定→引用清理组合通过。ResourceManager IO/RenderList context/GPU参数与流绑定仍明确服务，完整绘制/原启动/Visibility/skirts未闭合。

Avatar原八次迭代滑移、动作定位请求、32槽受力/默认wrapper/导出、nearby队列/导出：534准备组/35150048字节零差异。滑移已接实际Avatar模式移动预览，并与出生定位共用0xd00物理状态；同地址位置setter→动作→受力→滑移和三角网格地面/薄墙/跳跃/暂停回归通过。碰撞Move、三角球形接触、速度/重力参数和静态原模型仍明确服务；动作请求不能当骨架播放完成。Avatar不再仅推进相机，下一批继续实际动画消费/animpack/骨架/蒙皮、每帧碰撞/输入/能量与运动同步。

本批合计714组/604825840字节零差异；全项目416项、post-refactor Avatar 3项、tsc/build通过。实际Avatar模式219次原滑移调用、独立相机跟随与退出还原通过；逐类/逐实例Electron清单通过。33图66原文件/830 Mesh/reference SHA保持。报告beamo-render-oracle.json/avatar-locomotion-oracle.json，文档共享渲染与Avatar滑移推进.md。最终验证/构建/实际界面见beamo-avatar-verification.json；同期清单部分证据更新，完整原类/实例仍0，BstBaked阶段分数保持、不把子链算完整项。只增量同步开发文件，不重打release、不改reference；同步收据/root/sky-research/beamo-avatar-sync-verification.json。

---

2026-11-21 12:22 UTC：按用户优先继续模型调用与BstBaked消费，然后扩大基础类。新Beamo Barn.Load 0x10019579b..0x100195bc5 世界OBB/球体/第三disable distance与collision描述符/颜色/回调/注册写回：7504组（354准备＋全部6598 Beamo/552 Decal）/130924672字节零差异，真实字段缺失0，7147独立烘焙接受。20,151 powf调用输入bits回放，直接JS Math.pow有3次差异；Linux libm是显式能力，非macOS验收。min/max W、collision owner/geometry ID/LevelData flag明确准备，注册与索引内核未恢复。描述符有效56字节，末尾8字节保留原矩阵，未擅自清空；physicsMaterialOverrideActive/+0x22与physicsMaterialOverride/+0x23使用真实保存字段。

新材质分组0x100195f89..0x100196094：276组（243准备＋33图7150记录）/289409184字节零差异。6*materialCount原int32 scratch，normal primary region0/Decal primary1/secondary2/Alpha5；严格renderCount<16，保留空次材质索引，真实注册顺序仍准备，shader/RenderList/Renderable/GPU后半段待恢复。新CollisionGeo.Remove整个正常内核77准备组/80754524字节零差异：三次索引服务、范围/查找断言、实时读取、尾交换、free-list归还。同地址Beamo记录→球体发布→两LOD范围→分组→原Unload调用移除内核组合通过，upload/VertexData/注册/索引/析构保留明确服务。

基础类新ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget＋Parent ReleaseNodes：639组（99准备＋270原Parent对应540准备调用）/21297516字节零差异。保留enabled/target/jointName描述符/dirty未写字段、inactive匹配、回调实时字段顺序，已接同地址OriginalParentEndpoint创建/释放/复用；实际jointName内容/引用/排序/joints/follow/地图启动仍待恢复。

四段新增合计8496组/522385896字节零差异。全项目411测试通过，新相关7项/tsc/build通过，逐类/逐实例Electron清单检查通过；283声明/280对象类/49824对象/60016引用/断链0，核心子链31，完整类/实例仍0。33图66原文件和参与Mesh/reference SHA保持。新文档Beamo包围盒材质分组与Parent池推进.md，核验beamo-spatial-parent-verification.json；增量同步收据/root/sky-research/beamo-spatial-parent-sync-verification.json，不重打release、不改reference。

下一段继续完整ResourceRef/Observe/Barn.Load、原shader/RenderList/Renderable合并材质绘制/Visibility/skirts，LevelMesh→Model ctor→+0x228、完整LevelData IO/unload/重烘焙；基础factory/default cache/Barn启动、TerrainBlob生成/CameraSystem/Parent排序/joints/follow后扩大环境parser/startup/probe/lifecycle与逻辑类。先完成模型链优先级不变，不能把上述明确服务当整类完成。

---

2026-11-21 09:42 UTC：继续用户顺序——优先 Objects 模型调用与 BstBaked 消费，扩展全部基础类范围，环境／逻辑随后；本轮新增以下原内核，完整原类／实例仍0。

整个 Beamo/Decal LOD upload 0x100197ab0、法线生成/区域权重/OBB距离/默认光照构造编码：8,379组（640准备覆盖LOD0..3＋全部7,150对象的7,739真实LOD），717,931,744字节零差异。真实只有LOD0/1，约430万顶点/1178万索引，真实断言0。48-byte顶点/12-byte光照/三个索引区/全部scratch guards/分配释放/断言metadata均比较；trisCulled非零剔除后压缩顶点、总alpha>674次材质分界保留。2,912,317个RSQRTSS输入输出能力重放，直接JS倒数平方根有769,485个bit差异，禁止自动当原CPU等价。

Barn.Load 0x100195be7..0x100195f45 原球体发布/uint64容量/all Mesh LOD stream和index配置/map/上传/LOD范围计数/unmap/finish：156组（123准备＋33图），16,241次上传服务，473,649,840字节零差异。真实调用使用上述独立原上传计数；球体是明确准备字节，VertexData/buffer及upload仍是服务。动态loadedCount/LOD数量/table替换/offset修改重读和cached metadata写回通过；LOD启用不筛掉这轮上传。私有loader临时context不比较，live Barn/两张运行表/Mesh全部比较。

新增非虚基础类 Parent144-byte / CameraKeyFrame144-byte / TerrainBlob640-byte普通分配与placement；Parent enabled叶函数，Camera矩阵/HotDate，Terrain矩阵/local OBB和原16角点world AABB。16,924组/69,862,272字节零差异，含全部7,174 TerrainBlob和987 CameraKeyFrame保存矩阵取写、270 Parent对应准备调用。构造未写字段保留；原AABB min/max W初值均0，NaN候选保留和signed-zero/对齐alias通过。局部OBB是明确准备输入，不算真实shape/rail生成；Parent缺保存enabled不用猜测值。两个endpoint共用live原对象地址。

全项目404测试通过，新几何/基础类相关回归、tsc/build通过。进度清单283声明/280对象类/49,824对象/60,016引用/断链0；核心子链31类（此前28），完整类/实例仍0，阶段均值30.42%不是游戏恢复率。新文档 Beamo全LOD上传与基础类推进.md；最终与同步结果见 beamo-geometry-foundation-verification.json及 /root/sky-research/beamo-geometry-foundation-sync-verification.json。只增量同步开发源码/dist/证据/清单，不重打release，不修改reference。Windows/原Metal仍未验收。

下一段优先完整ResourceRef/Observe/Barn.Load、原运行OBB/collision、Renderable/材质合并绘制/Visibility/skirts；LevelMesh→Model ctor→+0x228、完整LevelData IO/卸载/原重烘焙生成器。基础类不限Marker/Clump/Rail：公共factory/defaults cache/Barn启动和TerrainBlob生成、CameraSystem、Parent跟随/joints/排序更新继续；环境owner既有结果保留，完整环境启动/parser/probe等补齐后扩大逻辑。旧SetMeshShaderParam构造/enable前缀、Rail selfUpdating及Avatar缺口保留。

---

2026-11-21 08:46 UTC：继续用户优先顺序——先 Objects 模型调用类与 BstBaked 烘焙关系，再所有基础类、环境类、逻辑类。完整原类／实例验收仍为 0；以下是新增已核验子链和编辑器交付范围，不是全部类完成。

Beamo／BeamoDecal 独立原创建、Barn.Initialize、Changed／SetTransform／GetTransform：7,389 组／2,305,368 字节零差异。Beamo 保留旧 slot；Decal 创建先清空 128 字节；创建计数先递增，最后写 Barn 指针。OriginalBeamoEndpoint 共用 live 原对象地址，SetTransform 不自动 Changed。

本次续接新增 Barn.Load 第一轮 0x1001950da..0x100195330：7,305 组（155 准备＋6,598 Beamo＋552 Decal）／3,093,792 字节零差异，真实输入无字段缺失；原 LevelModelBarn GUID 查找直接参加 native 对照。384-byte 运行记录＋8 原对象，＋0x10 Beamo 或 Decal null，＋0xd8 主材质，＋0xe0 次材质。Beamo 主材质这一轮允许 null；请求的次材质缺失、Decal 主材质缺失保留原断言。Decal 非正／NaN disableDist 取 float32 max。仍为已解析资源之后的第一轮，完整 ResourceRef／Load 尚未闭合。

独立烘焙接受 8,550 组（1,400 准备＋全部 7,150 原对象）／35,029,350 字节零差异。检查 LOD＋16 附加指针，而非＋8 光照指针；Beamo 保存前两 lodEnables，Decal 前两个存在 LOD。顶点数／默认原 Mesh LOD 距离／NaN 保留和接受记录＋0x20 已实现。只排除 private upper EDI 3 个 caller-clobbered 字节；全部有效字段比较。ResourceMeshLOD 现保留原 LOD header 距离；缺 Mesh 的 UnitCube 解析是显式同步服务。

本次续接新增整个 Barn.Unload 控制流和两类普通非删除析构：72 组／11,662,848 字节零差异。VertexData／Renderable 重置、碰撞释放、虚析构及字符串 allocator／free 是明确服务；计数增长／缩小、运行表替换、长字符串先捕获指针均核验。原 Unload 只清空两个对象计数，保留 loadedCount／Renderable count／runtime pointer／dirty。依赖释放内核仍需恢复。

33图新 beamo-bake-bindings.json：10,653 记录／11,311 LOD；18 失效 GUID／36 清空 LOD／11,275 成功展开。LevelMesh 4,133／接受3,071；Beamo 6,598／接受6,595；Decal 552／接受552；CloudCard 356 原烘焙。数字是接受条件／资源依赖，不能称绘制／整类完成。旧 level-data-bake-audit.json 保留历史。

EnvNode 整个构造 146 组含全部134对象／303,680字节零差异；构造未写 enabled／transform 保留原字节，缺enabled原tag为true。Ambience太阳子链297组／3,755个libm调用／15,460输出字节零差异，直接JS Math有3组差异边界。天空／模型／云共用环境owner，advance与sample分开；WorldEmpty保留原Ambience初始化输出。env-node-gpu-check.json：Dawn启用388,377分量变化，关闭淡出恢复0差异；空地图55种RGB。完整原事件启动／parser/cache／上一帧planetSphere／cheapFog lookup／前景雾／probe／生命周期仍缺。

beamo-environment-map-smoke.json passed：实际Dawn #23 Beamo、#47 Decal 新“查看烘焙关联”按钮／IPC，原GUID／LOD光照与附加数据／材质链接通过；Infinity／NaN以文本＋原distanceBits保存。环境暂停／重复采样／相机重绘计时保持、启停、切图重置通过；原Objects／BstBaked哈希保持。截图 beamo-environment-Dawn-inspector.png 是实际界面，Beamo原完整shader绘制仍未接通。新增同地址组合测试确认池创建→运行记录→烘焙选择→变换／Changed操作同一原对象。

逐类和逐实例清单已重生成：283声明类／280对象类／49,824实例，核心子链核验从26增至28；完整类／实例0保持。清单阶段均值30.32%不是游戏恢复率，原引用60,016／断链0／全部原字节回写保持。

最终全项目400项、相关6项通过。构建、类型检查和同步收据以 beamo-foundation-verification.json／environment-foundation-verification.json 为准；增量同步收据放 /root/sky-research/beamo-environment-sync-verification.json。新文档 Beamo原创建与烘焙关联.md、环境原构造与共享状态.md；不重打release、不修改reference，Windows真机／原Metal仍未验收。

下一段：完整BeamoBarn.Load的资源Observe、第三／第四LOD、VertexData stream／材质合并绘制／Visibility／collision／skirts；LevelMesh→Model ctor 0x100467330→＋0x228绑定；完整LevelData多层IO／卸载与原重新烘焙生成器。基础类不限Marker／Rail／Clump，已有49,824对象／280类依赖排名；优先公共ObjectFactory／defaults cache／Barn加载顺序／ResourceManager／GameTime，再TerrainBlob／Parent／CameraKeyFrame等，环境类完善后继续扩大逻辑类共享endpoint。旧SetMeshShaderParam构造／enable前缀、Rail动态失效及其他既有缺口保留。

---

# Objects 续接状态

2026-11-21：按用户要求优先继续烘焙并核验 Clump/Marker/Rail。新增 level-data-bake-runtime.ts 恢复 LevelData 原 GUID 失效与单 LOD 校验/读跳过/24 字节清空/12 字节展开子链；新增 level-data-bake-adapter.ts 建立明确同步编辑器加载表。原指令 0x1003f4c63..0x1003f4c6e 与 0x1003f4db5..0x1003f4f67（单 LOD continuation 0x1003f4d99）对照 11,563 组/78,562,125 字节零差异，其中 252 准备输入、33 图 11,311 真实 LOD。新 native/evidence/oracle/320-case fixture 已保存；完整 LevelData::Load/资源异步读取/原 Model ctor 仍没恢复。

真实表 10,653 记录：18 个缺资源 GUID 失效，18 个 LOD 采样不匹配，共 36 清空；11,275 成功展开 LOD 光照/opaque 与此前正确绑定一致。main bakedResource 去掉名称＋GUID双匹配，走加载后 GUID 首匹配并检查首 LOD；返回选中记录自己的 remap，不按请求 Mesh 重展开。加载缓存以 MeshesDocument 为键，编辑/撤销/重开文档重建。CloudCard 实际356个均满足原烘焙兼容，接原28-byte动态流前8字节/顶点；无烘焙 default-light 为显式预览服务，完整CloudCard/Visibility/注册生命周期仍缺。

最新 Objects 关联：LevelMesh4133/原加载烘焙条件满足3071；Beamo6598/兼容6595，但完整创建/绘制未闭合；BeamoDecal552加载记录满足，独立兼容消费者仍未核验，禁止借用Beamo规则。基础类 Clump9627/Marker6538/Rail402 都明确整类未完全复原；详见“烘焙与基础类完整性核验.md”。Clump/Marker 原池/启用/恢复/空间变换子链与Rail缓存/查询/弧长/Wind通过的范围原样保留，Rail selfUpdating/动态失效/移动事件/异常查询/macOS libm及通用加载/生命周期仍缺。全部完整原类/实例验收0不变。

387项项目测试、10项相关测试、tsc/build通过。Dawn actual Vulkan云链2帧：78原烘焙CloudCard、74可见；viewport-cloud-check.json passed。Prairie_Cave实际原材质视口23模型/7原烘焙CloudCard、Black/Caustics与原源哈希通过；level-data-bake-map-smoke.json，截图 model-material-Prairie_Cave-render.png。视觉仍含原明确preview天空/光照/曝光/默认服务边界，不能称原游戏整图等价。最终报告 level-data-bake-verification.json；只增量同步开发文件，不重打release、不修改reference。同步收据放 /root/sky-research/level-data-bake-sync-verification.json。

下一段优先：BeamoDecal独立烘焙接受与原创建入口、完整LevelData资源加载/卸载与Model ctor/LevelMesh +0x228绑定；基础类原Barn/地图加载及Rail selfUpdating自动失效继续闭合。材质参数/变换/Event共享原对象地址接口保留，不用预览状态冒充原默认显示。SetMeshShaderParam构造/enable前缀仍未闭合，不遗漏旧任务。

---

2026-11-21 03:12 UTC：上一轮材质同步已补完，50项复制/52关键SHA一致，收据model-parameter-sync-verification.json。继续恢复 SetMeshShaderParam整个原Update 0x100592940：107准备输入/428快照/28,094,176字节0差异，执行原Update→LevelMesh三种setter/正常更新→Model ready LOD转发。新core set-mesh-shader-param-runtime.ts，新证据set-mesh-shader-param-update.asm/native.json。保存旧elapsed，加入原GameTime夹取0.0001..0.266；只有old≤i×stagger<new时触发，循环重新读取Clump/count；Float逐目标实时读，Float4复制默认向量后逐可空Float分量覆盖；全部pass0。第一次oracle捕获Buffer.slice视图污染默认向量，已改真实副本，完整对照通过。未知type/空cast断言与计时/结束顺序保留。

383项项目测试、6项相关检查、tsc、build和实际GPU检查通过。最终报告set-mesh-shader-param-verification.json；增量同步收据 /root/sky-research/set-mesh-shader-param-sync-verification.json。只同步开发src/dist/证据/图片，不重打release，不修改原资源/reference。完整原Model/Scene/SetMeshShaderParam/Avatar类验收仍为0。

新 set-mesh-shader-param-gpu-check.json passed：原Update用明确准备Event/前缀/单目标调用同一OriginalLevelMeshMaterialEndpoint，3次Event.Start服务；实际原DayHubCave平台half49413/retarget50021/Black63287 HDR RGB分量变化，clear0差异，3上传/3uniform，同实例重导出复用。图为set-mesh-shader-param-{before,half,retarget,black,restored}.png。不是359真实实例/原地图自动启动完成；构造、enable字符串前缀、registry/clock owner、Event.Start/Barn/地图启动和资源/GPU生命周期仍有明确依赖。Model/Beamo/Avatar完整类/实例0不变。新文档 SetMeshShaderParam原Update与材质接入.md；原类自动清单没有擅自升级完整完成率。下一段优先原enable前缀和构造/字段映射后接统一Barn/地图，继续Model ctor/Visibility/卸载与Beamo/Avatar。

---

2026-11-20 09:48 UTC：本轮继续建模材质原逻辑，新增模型材质原始参数接口.md、model-parameter-native.json及9个入口完整反汇编。LevelMesh原shader float/float4/tex setter、find/allocate、有效uniform正常帧更新与Model已就绪LOD转发：312组/849快照/55,711,472字节0差异。字符串短/长/嵌入NUL/增长/别名/断言顺序、float32插值/途中重设目标、计时dirty、回调期间count修改已核验。Vertex、ResourceManager/ResourceRef和字符串池仍为显式ABI服务；hot reload和无效uniform日志/交换移除/异常展开为明确边界。完整类/实例0不变。

OriginalLevelMeshMaterialEndpoint共用真实LevelMesh地址和实时Model +0x228；setFloat/setVector/setTexture/update可以与OriginalLevelMeshModelEndpoint启用/变换接口操作同一存储，不构造假Model。GPU setModelParameterBinding是瞬时Vertex服务投影，不改Objects保存字段；场景全局参数交给场景所有者。浮点参数/模型矩阵更新只传uniform，shader/参数名称类型/纹理/几何签名才影响管线重上传。model-parameter-gpu-check.json passed：实际原DayHubCave #339平台、明确准备Model/参数/单ready LOD，原LevelMesh→Model→Vertex服务驱动GPU；half 49413 RGB变化、retarget 50021、Black 63287、clear恢复0变化；零delta状态不变、同实例重导出保留材质，3次材质上传/3次uniform更新。原Model构造/Scene/Metal/资源引用完整实现仍缺。

原空纹理在0x10040238c..396选择Black，已作为临时材质绑定接入且保存空名称不变。进一步确认原Scene 0x10005a71e..0x10005a796查找/Observe Image Caustics→u_caustics；model-parameter-scene-globals.asm保存完整函数，model-global-textures.ts只转述已证实资源身份，不算完整Scene初始化/引用恢复。33图4133 LevelMesh静态依赖满足增至3072、初始保存render/enabled允许显示2546，比上一轮增加1104/1035；这是材质上传依赖数，不是完整游戏/互动完成率。原DarkStone空纹理阻断已消除，剩余Blended384/Backfaces64/native动画289/u_averageProbeColor146/其他RenderList和资源/全局依赖仍保留。

Prairie_Cave #240 Darkshroom_A_01/DarkStone实际原材质地图检查passed，23模型/23地形，原Black/Caustics参与真实绑定、无wire/helpers/selection outline、原Objects和BstBaked前后SHA不变。model-material-Prairie_Cave-render.png是真实GPU画布，完整天空/云/探针/原启动逻辑仍有预览边界。RainMid #227原材质地图检查也passed，64模型；两个报告/图片分别保存，未覆盖前轮DayHubCave证据。平台隔离参数变化图片在model-parameter-{before,half,retarget,black,restored}.png（同地图空间曝光/display mapping），不是AI生成或原游戏真机对照。

380项项目测试及9项最终相关测试、tsc、构建、原内核与实际GPU/地图检查通过；本轮native C++无改动，无需重编Windows专属源码；Windows真机/原Metal验收仍未完成。最终核验model-parameter-verification.json，同步收据 /root/sky-research/model-parameter-sync-verification.json；只增量同步src/dist等开发文件，不重打release，不修改reference。下一段优先完整Model ctor/资源绑定/Visibility/释放、Beamo/BeamoDecal，以及SetMeshShaderParam原类及启动调度接入已有材质endpoint；其它逻辑类、Avatar蒙皮/运动/碰撞仍待恢复。不要把DarkStone保存零色值擅自改成猜测颜色；应沿原启动/SetMeshShaderParam链恢复。

---

2026-11-20 09:12 UTC：用户最新优先级改为建模类原始创建/默认显示/材质/UV/绘制，逻辑类后续扩大，但接口共用同一对象。新文档 模型原始渲染与逻辑接口.md。本轮 Vertex stream setter 124组/512368字节0差异，Model submit debug关闭完整路径及LevelMesh enable/transform实时指针连接771组/779快照/6386244字节0差异；RenderBuffer和队列为明确服务，完整Model constructor/loader/visibility/animation/GPU原实现尚缺。OriginalLevelMeshModelEndpoint使用真实+0x228指针，没有构造假Model。

模型GPU渲染已接原GLSL、原贴图、原float3+UNORM色彩/SNORM法线/两个half4 UV与12-byte烘焙照明，上传交错48-byte、每实例单独原矩阵。默认材质从MaterialDef原生成器选择shader+Mesh，区分其texture kind 1与自定义LevelMesh valueType 2。保存render/enabled用于初始显示，visibleInWorld不作启用；Native Model visible/重新启用语义另有原函数核验。完整Model可见性更新仍待接入。模型纯变换只更新uniform，不重上传全部贴图；原平台GPU检查1材质上传/1uniform更新及44394 RGB变化。

33图4133 LevelMesh静态预检完成：1968满足当前材质依赖、其中1511初始保存状态允许显示；不能当完整运行完成率。DarkStone空贴图1007、native动画289、多个RenderList/全局uniform及资源缺失仍明确阻断。Beamo6598/BeamoDecal552、完整Model/Avatar及所有原互动仍缺，完整类/实例0不变。新 model-draw-availability.json保存逐实例和shader源哈希。研究已定位u_averageProbeColor原全局注册0x10005a607，Scene+0x65580及SH邻接字段，尚未接入；研究文件 /root/sky-research/model-probe-global-register.asm / model-missing-global-xrefs.json，继续结合原probe内核，而不能猜成averageSkyColor。

默认CandleSpace #342 RockFaceShMesh/WallSh实际GPU输出有限8072覆盖像素；DayHubCave #339 MeshSh平台GPU UV检查7657覆盖像素，UV0变化22768 RGB、UV3变化22771，UV2字节不变，UV1因原White常量贴图不变。model-uv-gpu-check.json含原输入/着色器哈希与矩阵。DayHubCave无网格线实际原材质图已保存model-material-DayHubCave-render.png，70模型/22地形批次。后来准备链 model-material-playback-smoke.json passed=true：15明确控制/引用变化、838状态，条件>=0.35、Delay>=0.5s后TransformObject驱动原平台；暂停/还原/重启/模式/切图、源和副本哈希、实际渲染对象/同相机对齐。model-material-playback-render-before.png / moving.png是原贴图的实际画布，材质时间暂停。两图的像素比较单列，不宣称所有差异仅来自平台/原Metal等价。

较早默认材质12 NaN已明确定位为llvmpipe退化UV的各向异性采样：仅该驱动改用三线性，原shader/texels不动，硬件仍使用请求值。material-degenerate-uv-check.json含3原三角面，旧2/4/8/16请求仍12非有限分量，新1/2/4/8/16全部0；仅算编辑器兼容。set-float-map-preview-material-boundary.json保留历史失败，不能再当当前未定位错误。额外DayHubCave cloud检查单存material-DayHubCave-cloud-check.json，旧三地图viewport-cloud-check.json已恢复。原事件396组/9676帧的证明未重跑，仅其有意义的项目回归与新原图接入检查运行。

本轮项目376项、渲染相关16项、tsc、build、新native/GPU/原材质互动检查通过；最终记录与同步在model-material-verification.json及 /root/sky-research/model-material-sync-verification.json。下一段优先原Model完整构造/Visibility/释放、Beamo/BeamoDecal、native skinning和更多RenderList；SetMeshShaderParam作为材质依赖应沿原参数/GPU接口闭合，后续逻辑类接同一endpoint。不要用预览默认值填补原贴图/光源/模型依赖，不常规重打release，不修改reference。

---

2026-11-20 08:13 UTC：OnFloat / FloatSplit 已加入统一地图播放，长期完整原游戏恢复目标尚未完成。最新汇总 float-condition-map-preview-verification.json：396组 / 9,676帧 / 323,130,696字节0差异，349真实根 / 47准备输入分列，568次logf/expf输入位模式服务回放。新增3 OnFloat、全部2 FloatSplit和2 Delay真实根；九类596配置满足依赖预检。全项目366项、6新增条件检查、tsc与构建通过。上一轮SetFloat证据仍保留。

本轮实现：object-playback-plan.ts / transform-object-preview.ts 加入两类构造/字段/指针/虚调度；OnFloat uint32操作符、短字符串描述符、双侧嵌套BODY指针和原始反转字节、Object分支、独立结束请求保留。FloatSplit共享Float存储和别名顺序、空输出不读input、非空持续运行保留。debug输出/长字符串池/同步条件求值循环显式预检阻断。native-object-logic-preview-oracle.c新增metadata、Float转换和memcpy/bzero服务。27组新准备链在 float-condition-map-preview-cases.ts；fixtures/float-condition-map-preview-native.json.gz 保存全部396组。

新地图准备器 float-condition-map-preview-map.ts：15字段/链接变化，DayHubCave Enable #444→SetFloat #43 / OnFloat #229→阈值0.35→Delay #65 0.5秒→TransformObject #270 / 原PlatformRain_01 #339 / 目标#451。float-condition-map-preview-smoke.json passed=true，344状态快照；阈值和延迟期间矩阵未变，之后变换开始，暂停/还原/清理/源副本哈希通过。图片 float-condition-map-preview-before.png / moving.png（另有viewport裁图）；完整相机矩阵相同，截图前renderedObjectPlayback.objects与暂停态相同，84,948视口像素差异。渲染器dataset记录实际渲染帧对象与完整相机矩阵，仅作见证。

numeric-map-preview-smoke.mjs 已修正真实 Prairie_Village #1812 下限 0 的错误负值预期。原文件保持零；另建临时初值 0.9 的地图检查递减/暂停/恢复/重启/模式切换/切图，最终文件哈希不变。numeric-map-preview-smoke.json passed=true。

SetFloat 已进入 object-playback-plan.ts / transform-object-preview.ts；88-byte 构造、字段、+0x40 target 指针、原 EventBarn 虚方法调度和 Float 共享存储均接通。math 服务独立 numericMath，默认 JS Math 只为预览。实际 4 个配置 time=0，初次更新立即结束；最后修正 UI 已结束进度为 100%。新 tests/set-float-map-preview.test.ts 独立检查原机内存与输入位模式、五个准备控制器和两种单次控制模式。单次固定 progress 的 continuous 变换仍移动，绝对变换不旋转时仍规范化当前四元数，因此只断言固定位置/数值，不错误要求全部矩阵字节相同。

真实平台演示的完整原状态另比较 121 帧，prepareSetFloatMap 保留 DayHubCave PlatformRain_01 #339 / TransformObject #270 / 目标 #451，明确改变 SetFloat #43、Enable #444、Clump #84 的 8 项控制/引用。该副本不是原地图自动启动。set-float-map-preview-smoke.json passed=true，暂停/终值 1/重启矩阵与数值/模式和切图清理/源与副本文件哈希均检查。图片 set-float-map-preview-before.png / moving.png 是实际 Electron/Vulkan light0 和原网格检查视图，84,948 像素变化；未独立保存相机矩阵。

必须保留未通过边界：直接以 DayHubCave 默认原材质启动，原生进程报 “Viewport shader produced 12 nonfinite RGB components” 并退出，记录在 set-float-map-preview-material-boundary.json。没有修改着色器或掩盖这些非有限数；演示从 CandleSpace 初始化 light0 后切图才能通过。下一段可以隔离默认材质、天空/云/HDR 管线定位来源，但不能称原材质地图已验收。

下一段优先继续扩大条件输出依赖。91个OnFloat被Timeline/SoundEmitter/SetMeshShaderParam等阻断；ResumeEnable已有原内核也可考虑接地图适配层。原材质错误的定位/恢复是地图视觉的另一个实际缺口。继续保留original EventBarn全状态对照与原字段，不模拟未接入类。BstBaked完整Model创建/LevelMesh +0x228绑定/GPU与Avatar运动/碰撞/蒙皮仍缺；26类核心子链、30.25%清单、完整类/实例0未变。不要重跑已通过的全量原对照，除非新增内核/原输入或有明确回归风险。源同步完成后收据单独保存，不常规重打release。

本轮交付同步完成：sync-source.py复制57项开发文件，未重打release/未修改reference；35个关键源码/fixture/报告/图片/dist及总清单SHA256一致。收据 /root/sky-research/float-condition-map-preview-sync-verification.json。生成器自带全部地图原字节/引用/计数断言通过；项目366项测试通过。额外尝试的progress独立test文件本仓库不存在，没有计入成功检查。
