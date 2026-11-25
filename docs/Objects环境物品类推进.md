# Objects.level.bin 环境与物品类推进（0.3.8）

本轮按原 TGCL 类及原注册调用链推进。草花、水和蜡烛分别由 `FlowerBarn`、`Ocean`、`CandleBarn` 管理。字段解析、原内核验证、地图接入及完整效果分别记录；完整原类和实例验收仍为 0。

| 原对象类 | 33 图实例 | 原职责及恢复入口 |
| --- | ---: | --- |
| FlowerPatch | 582 | 花草区域、密度、颜色、尺寸；FlowerBarn 创建、地表分布、绘制 |
| CandleObject | 1077 | 蜡烛本体、寿命、点燃、蜡量；CandleBarn 创建与更新 |
| Flame / SetFlame / OnFlame | 290 / 43 / 154 | 火焰、点燃控制及状态事件，需要与蜡烛区分 |
| CandleGate | 23 | 蜡烛门和事件依赖 |
| Water / SetOceanRender | 38 / 15 | 局部水面及海洋绘制开关；Ocean 模块 |
| BeamoDecal / CloudCard | 552 / 356 | 烘焙贴花与云片，不同的材质、几何和绘制链 |

逐实例原字段、引用、地图和文件 SHA 位于 [清单](objects-environment-items-audit.json)。原注册函数和所有者方法地址位于 [原函数入口](object-effects-native.json) 及 `evidence/object-effects-*-registration.asm`。

## 本轮实际改动

修复 Image 资源名被误当文件名的错误。`ImageDefs.lua` 的 `source` 决定真实图片；`HeatTex → Heat.png`、`BasicGeoAtlas1 → LandColTex.png`、`LifeForceMural02Sh → LifeForceMuralSh_02.png`、`BirdStripTex → birdStripTex.png` 都是原配置。缺图检查、图片 IPC、地形／模型和云贴图加载共用这条解析链，并保留大小写、gamma、mip 和寻址声明。缺失的声明源文件不再退回同名图片。

全图静态 LevelMesh 贴图依赖满足数从 3322 增至 3398，增加 76 个；按原保存启用和 render 状态可显示数从 2781 增至 2837，增加 56 个。这是依赖检查数，不表示这 76 个对象都完成了原事件启动或全部贴片问题已解决。其余 `u_averageProbeColor`、动画、Water/Puddle、天空和资源缺口继续保留。

四种别名已用原 LevelMesh 几何、打包顶点、着色器和声明采样方式实际出图。GPU 资源的基础 mip 字节与真实 PNG 解码逐字节一致，gamma 格式及源文件 SHA 通过；出图分别覆盖 3623、1290、1437、721 像素。鸟群模型 `BirdStripCurve` 跨度数千单位，全模型 96×96 缩略图中的小鸟会经 mip/alpha test 消失；验证改为聚焦原三角面 2400，仍上传完整原模型和材质，并保留原 time=0。未改 alpha 阈值、贴图、shader、mip 或生产相机来让检查通过。

出图与相机、原 GPU 浮点附件 SHA 见 [GPU 检查](image-alias-gpu-check.json)。便于查看的图片仅做 `v/(1+v)` 和 sRGB 显示转换：[HeatTex](image-alias-HeatTex-render.png)、[BasicGeoAtlas1](image-alias-BasicGeoAtlas1-render.png)、[LifeForceMural02Sh](image-alias-LifeForceMural02Sh-render.png)、[BirdStripTex](image-alias-BirdStripTex-render.png)。单物体检查不代替原场景光照及贴花完整合成。

恢复三个原池式创建内核：FlowerPatch 每图最多 255 个、272 字节步长；CandleObject 最多 196 个、176 字节步长；Water 最多 8 个、1488 字节步长。计数增长、容量断言、原字节保留和蜡烛初始化均按原机器码。草花与水全部 620 个真实实例已使用这些原槽位，加载字段和原父构造仍在同一地址；运行信息新增 `effectPools`。切图丢弃编辑器池所有权，不把它称作完整原 GPU 卸载。

蜡烛恢复 SetTransform / GetTransform 的逐列复制和别名顺序；SetEnabled 同时写对象和 `+0x90` 所指向的实际 Candle 渲染记录，GetEnabled 读取原字节。它们和 CandleBarn 创建已通过原机器码对照，但原 CandleBarn 装载／渲染记录尚未接到地图，因此不会虚构记录来声称蜡烛能点燃或显示。

八个原内核共 1216 组对照、159407968 字节零差异，包含全部 1077 个真实蜡烛保存矩阵；详见 [原对照](object-effects-oracle.json)。FlowerBarn 卸载内核的释放函数是明确服务，只验释放顺序与计数复位。

## 按原调用链继续实现

草花：从 `FlowerBarn.Initialize → OnLevelLoad → Update → BuildScene → RenderFlush` 接下去。已确认 shape 为 0 全地图、1 球、2 盒；type 为 0 Circle、1 Blade。原生成器依赖 CollisionGeoBarn 地表采样、区域筛选、原整数噪声、尺寸／高度／颜色及材质；生成后还要走原 Visibility、Flowers / FlowerShadows 队列及原 Flower shader。不能只用随机草片代替这条链。

蜡烛：接 `CandleBarn.Initialize / OnLevelLoad` 的原资源表、真实 Candle 记录、MeshType 和烘焙，再恢复 `Update / RenderFlush`。原资源包括 CandleDefault、Candles_02、CandleAncestor、CandlePlayer。Candle 本体 shader 消费模型顶点属性及光照／探针，光晕和火焰另有流程；lit、consumable、lifetime 和 numWaxToGive 需要原更新与事件／游戏服务，不能用定时器猜测点燃、熄灭和奖励。

水：接 `Ocean.Initialize / OnLevelLoad / Update`，恢复模拟区域、历史纹理和 WaterSim / WaterSimReset / PuddleSim；原 Metal WaterSimComp / Clear 需另恢复计算算法。之后接 Ocean / OceanMesh 的原水面顶点、法线、波纹、折射、反射和合成。原 shader 需要 `u_waterSim`、`u_waterSimNorm`、`u_opaqueTexRGBDepth`、probe、法线和焦散；湿水还依赖 puddle。当前水和 puddle 静态占位输入仍是明确缺口，本轮没有把它说成完整原水效果。

贴片：Image source 修复之后，继续按具体对象定位平均探针、原贴花深度／混合、动态 shader 参数、云片照明和启用事件。仍被阻断的实例逐对象保留原因，避免无资源或无全局输入时显示白色占位并误判为已恢复。

三档分辨率、原材质、裙边 SNORM、八相静止抗锯齿和单 GPU 请求调度延续。本轮没有 Windows GT 1030 帧率实测，60–70 FPS 目标尚未验收。

实际 Electron 完整 Vulkan 画布检查包含 Dawn → CarryLand2 → Prairie_Cave → WorldEmpty，核验花草／水共享槽位、HeatTex 模型资源、全白屏检查、最终不透明像素和切图清理；四种别名的图片 IPC 字节均与各自原 source 文件一致。见 [地图检查](objects-environment-items-smoke.json) 和 [当前构建验收](object-effects-verification.json)。地图截图：[Dawn](object-effects-Dawn-viewport.png)、[CarryLand2](object-effects-CarryLand2-viewport.png)、[Prairie_Cave](object-effects-Prairie_Cave-viewport.png)、[WorldEmpty](object-effects-WorldEmpty-viewport.png)。这是 Linux 软件 Vulkan 的小尺寸渲染检查，不表示 GT 1030 画质或帧率已验收。
