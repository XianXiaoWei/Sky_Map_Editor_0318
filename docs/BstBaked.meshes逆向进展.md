# BstBaked.meshes：实现范围、正确性与剩余逻辑

当前实施目标：Mesh.bin、Terrain.bin、Cloud.bin、Skirt.bin、Occluder.bin 五段同等优先推进至各 9/10（90%）；第 10 项保留 Windows 真机和原游戏校验；共享对象、资源、生成及 Visibility 依赖一起恢复。 Objects 逐类清单见 [Objects 逐类进度](Objects.level.bin类进度清单.md)。

当前目标是 **编辑器与原游戏初始化地图画面一致**，BstBaked.meshes 编辑开发无限期停止。已建立 [逐阶段/逐函数渲染清单](BstBaked.meshes渲染清单.md)：全部 54,121 个原函数地址已索引，目前追踪 231 个渲染根函数、301 个直接依赖及 20 个渲染阶段；完整函数归属和间接可达性尚未闭合，暂不计算完成百分比。33 张地图的 LOD0 已全部解析；主视口仍为原生 Vulkan 诊断渲染，完整原材质、环境与云合成尚未接入。下面八类为整体项目历史范围，当前渲染任务以新清单为准。

本轮新增原天空七 tap 渐变、cheap fog 和球形大气射线采样，1,280 组 /5,120 个 float32 分量与原指令逐位一致，包括雾下溢的负 NaN。原 Ambience.Initialize 六组 33 个字段在两种画质分支、四组明确输入下对照 1,140 字节一致。导入的 expf/exp2f 绑定 Linux libm；完整 macOS 数学库和游戏启动尚未验证。证据见 [atmosphere-native-check.json](atmosphere-native-check.json)、[ambience-initial-check.json](ambience-initial-check.json)。

原 GLES 程序现在显式转换 Vulkan 投影 Y/Z，并保留原屏幕坐标供光照网格采样。真实 Dawn 六类地形程序编译通过，128 个实际 GPU 坐标/深度/剔除分量与预期一致。cube 六个面、三层 mip、六种整数纹理及 R8 mip 对齐共 448 个 GPU 分量通过。主视口仍未自动提交原地形程序和资源。线框已独立开关，沿网格/包围盒/隐藏选择和关闭后的视图恢复均通过真实 Dawn 桌面检查。

## 全量文件覆盖

本轮审计 [meshes-coverage.json](meshes-coverage.json) 覆盖全部 33 个真实文件，合计 189,997,299 个解压字节。所有文件只声明 LOD0；没有遗漏的其他 TOC 段。未修改回写继续逐字节一致。

| 记录 | 数量 | 已实现和已核对 | 主要未完成项 |
| --- | ---: | --- | --- |
| 模型烘焙 | 10,653 份 /11,311 个 LOD | 读取、LOD 映射、照明展开、单采样编辑 | 36 个资源/LOD 未匹配；原烘焙算法和实际光照 |
| 地形 | 77 份 /3,274,619 个三角形 | 顶点、边引用、96,309 个区块、材质 scatter 原机器码对照 | 区块语义、剔除/LOD、拓扑和碰撞重建 |
| 实体云 | 27 份 /399,839 个稀疏块 | 五图集、CPU 距离、Tex3D 噪声、代理属性原机器码对照；云/深度 AIR 与 Vulkan 对照 | 完整合成、真实场景深度/光照、Metal 插值边界、编辑重建与交互 |
| 裙边 | 2,533 份 /446,524 个三角形 | 原顶点布局、材质存在规则、新增与回写 | 新几何照明、边界和游戏联动 |
| 遮挡几何 | 33 份 /381,355 个三角形 | 读取、位置编辑、未解四字节保留 | 属性语义、遮挡提交与运行行为 |

全部地图的地形序列化碰撞块长度均为零。不能把“保留空块”算作碰撞树实现；原游戏加载时如何构建和查询碰撞仍需逆向。

## 至少 8 类剩余工作

1. 完整原材质与光照：全局输出、默认资源、探针、阴影与主视口自动绑定。
2. 实体云管线：CloudCard/粒子自动对象生成、可见性及完整 Scene 调度、场景深度生成、水/蓝噪声、历史帧和重投影；原 Metal 的边界插值、快速数学与 half 溢出验收。
3. 地形运行：区块剔除、可见性 Job、LOD、细分、真实 shader 句柄与排序调度。
4. 地形编辑重建：拓扑、边表、边界/网格、碰撞树和交互。
5. 裙边新增几何：照明、边界、碰撞与原游戏加载联动。
6. 原烘焙与云编辑：生成照明，同步重建云稀疏场、代理和碰撞。
7. 遮挡运行：末尾四字节语义与原提交/可见性逻辑。
8. 目标验收：Windows GPU、原游戏加载与完整画面/编辑保存对照。

右上角 Blender 式方块仍待实现；它属于后续视口交互，不计入上面八类文件/游戏逻辑。

## 本轮纠正的逻辑

- 关闭 `editGeometry` 单独移动云代理的 API 漏口。修改代理而不重建距离场/碰撞会产生脱节；拒绝操作时不改变既有补丁、原文件或待保存的太阳遮蔽参数。
- TOC 拒绝重复标签、重叠范围及位于数据内部的空段；压缩段变长后，其他段和末尾空标记按原段末尾正确重定位。新增测试覆盖未排序目录与前后不透明数据保留。
- 云代理 byte 12..15 已由原 CloudBarn 描述符确认是 SNORM4 法线，读取器现暴露全部四分量；27 张地图 /201,960 个代理顶点逐 byte 核对。遮挡几何的四字节仍保持未解释。
- 六组云和三组前置深度程序的 18 个原 AIR 阶段已生成 Vulkan 源，共 3,380 条指令；保留原分支、并行 phi、uniform 转换和 Metal 投影。half 算术显式舍入；原 `fast` 允许的单次使用乘加采用 FMA，记录全部 40 处融合。前四组云为 19 处，新增 CloudCard/粒子为 17 处，深度为 4 处，不融合未标记 fast 或多次使用的乘法。
- 当前 llvmpipe 会省略部分直接 half 转换；253,956 个 IEEE half 样本中，直接转换有 190,466 个舍入失败。显式位运算舍入全部通过，见 [vulkan-half-check.json](vulkan-half-check.json)。这不是原 Metal 运算验收。
- R8 三维硬件线性过滤差异改由原字节上的显式 float32 三线性插值处理；6 张真实纹理 /6,144 点与独立 CPU sampler 一致。原 half 快速乘加的舍入边界已修正，独立 LLVM FMA 对照 8,192 项通过。云的等尺寸 2,048 个采样、Dawn 127×73 的 24,464 个采样、CarryLand 64×40 的 6,800 个采样均在原容差下通过。原 AIR 指令体不变，报告保留源哈希、生成哈希与融合清单。
- 原 Compositor 的尺寸、half 附件和 sampler 已执行机器码对照。CloudCore 在 Opaque 读取现有 CloudA，后续 fine 才覆盖 CloudA；CloudA/B 不是双缓冲。fine 之后的 Cloud 列表已实现同 pass 多 draw，首两附件 RGB 使用 srcAlpha + dstOne、alpha 使用 srcOne + dstOne，关闭深度测试/写入和剔除。`vulkanCloudPass` 允许调用方给出已排序的 CloudCard/蓬松粒子输入；自动调度和主视口仍未接入。
- 三段原深度处理已接入原生 Vulkan 和桌面 IPC，保留 signed alpha、零值 25600、抖动邻居排列及 quarter min/max。91,560 个采样 /264,600 个分量的采样隔离检查逐字节一致；quarter 使用捕获的实际 Vulkan UV，并独立检查原顶点插值。纯 CPU 光栅插值在零抖动边界仍有 781 个分量不同，失败报告保留为 [cloud-depth-air-check.json](cloud-depth-air-check.json)，隔离结果见 [cloud-depth-sampling-check.json](cloud-depth-sampling-check.json)。不能把后者当作 Metal 光栅边界验收。
- 三段深度实际输出连接云的 127×73 测试共 34,652 个采样通过；输入深度、相机、光照、水和蓝噪声仍为明确测试数据。R16F/RG16F/RGBA16F 上传每种全部 63,488 个有限 half 编码一致，但 float32→half 溢出仍有 12 项饱和/Infinity 差异，[vulkan-target-formats.json](vulkan-target-formats.json) 保持失败。

- CloudCard/蓬松粒子新增四个原 AIR 阶段：Dawn 和 CarryLand 各 15,522 个采样通过，按 metadata 名称桥接 varying，保留 half 量化和原 intrinsic ABI。
- 原生多 draw 的混合、绕序、深度关闭、描述符隔离和单场景重置共 24,576 个分量精确，见 [cloud-blend-check.json](cloud-blend-check.json)。真实 fine+CloudCard+粒子组合相对 RTE 参照有 8,633 个分量差异；独立 4,096 texel 探针确认当前 llvmpipe 的 half 混合转换为 RTZ，按 RTZ 重现零差异。原 Metal 转换未确认，[cloud-pass-check.json](cloud-pass-check.json) 保留 `passed:false`。
- CloudCardBarn 世界球与严格相交连接组已实现，直接执行原加载机器码验证全部 33 张地图及合成边界，共 72 组 /690 张云卡 /3,450 个分量逐字节一致，见 [cloud-card-layout-oracle.json](cloud-card-layout-oracle.json)。模型包围盒中心、实际顶点半径、矩阵列最大尺度和 float32 指令顺序均保留；相切不连接，连锁相交归同组。原分配容量由 `0x1002216c4` 确认是 512。桌面 `cloudCardLayout` 使用明确的 TGCL 顺序，原连接组排序、累计索引和显式可见顺序的 draw 队列已有实现；六平面/球测试/原压缩已有实现，原注册顺序/真实遮挡分类/动态顶点生成仍未实现。


- CloudCard 原连接组排序 `0x100222830` 使用 uint32 升序，距离排序 `0x100224290` 使用 float32 **升序，即从近到远**。保留原交换/分区、小数组处理、部分插入排序与同键排列；两类插入阈值分别是 6/30。每类 7,321 组 /1,071,732 条记录的完整排列、键 byte 和伴随字段均精确，与 JS 稳定排序有 3,935/1,927 组不同，见 [cloud-card-sort-oracle.json](cloud-card-sort-oracle.json)。不能用通用稳定排序替换原流程。
- 排序后的原顶点偏移、索引偏移及全部 uint32 累计索引已实现；执行原加载、原排序和索引循环，72 组 /690 张云卡 /20,604 个分量精确，其中完整索引 13,014 个。Dawn 的 78 张云卡共享 2,688 个索引，见 [cloud-card-index-oracle.json](cloud-card-index-oracle.json)。
- 原 draw 队列 `0x100221270..0x100221339` 已恢复：float32 球心到 eye 的平方距离不含半径；按明确开关选择距离排序，再提交每卡 first/count。原队列准备、排序和 GPU range 提交共 344 组 /14,080 次 draw /70,400 个分量精确，其中 32 组输入来自独立原可见性捕获，见 [cloud-card-draw-oracle.json](cloud-card-draw-oracle.json)。旧 `cloudCardDrawPlan` 入口允许明确给出压缩后的顺序；新入口负责六平面测试和压缩，仍要求明确提供 Visibility 分类状态。

- 构建后的 `cloudCardLayout`/`cloudCardDrawPlan` IPC 已用真实 Dawn 验证 78 张卡、2,688 个累计索引和 4 组 /195 次 draw，排列与原机器码 fixture 一致，重复可见卡输入被拒绝，见 [cloud-card-plan-ipc-check.json](cloud-card-plan-ipc-check.json)。

- CloudCard 六平面归一化、球测试、候选初始化和原末尾覆盖压缩已恢复。平面次序及 `(x*nx+z*nz)+(y*ny+d)` 的 float32 点积按原执行核对；相切保留，零状态剔除，非零状态保留。全部 33 张地图及边界共 1,052 组 /31,504 张卡 /189,420 个分量逐 bit 精确，见 [cloud-card-visibility-oracle.json](cloud-card-visibility-oracle.json)。外部 Visibility 分类回调返回明确状态，真实遮挡分类/缓冲未实现；`cloudCardVisibilityDrawPlan` 已衔接原距离队列，见 [cloud-card-visibility-ipc-check.json](cloud-card-visibility-ipc-check.json)。原 CPU 视锥矩阵来自 Camera `+0x1c0`，不能自动套用未核对的 GPU 矩阵。

- CloudCard 原逆矩阵及局部相机方向已恢复。原求逆函数 `0x100076940` 的 140 个 float32 运算顺序保留，`0x100220bd0..0x100220c73` 保留长度阈值、局部 Y 半球翻转及原 scratch W 除数。33 张地图及边界共 387 组 /10,030 张卡 /198,500 个分量逐 bit 精确，见 [cloud-card-facing-oracle.json](cloud-card-facing-oracle.json)。桌面布局/可见性队列已返回逆矩阵和局部方向；旋转、动态位置和 28-byte 顶点属性仍待实现。

## 已恢复的原程序行为

- `MaterialDefBarn::Initialize`：`0x10043fb70`，重置函数 `0x100443f50`。实际执行原初始化与颜色转换，提取 30 项定义，保留原顺序、线性颜色、粗糙度、金属度、UV 尺度、两个权重阈值和纹理/数值参数。Dawn、Prairie_NestAndKeeper、RainMid、SkyHub2、SunsetEnd 五张地图有原生覆盖值。
- `TerrainBarn` 材质表：`0x1006a22e0` 写入 30 项材质和 59 项 surface；`0x1006a2309` 按原序号取定义。前 30 项是基础表面，后 29 项是叠加表面。基础变体使用原 shader 名，叠加变体追加 `Alpha`。
- 三角形 scatter：`0x1006a7280`。顶点最多读取四槽；ID 为 0 时停止；权重大于 `minimumWeight` 时加入材质；达到 `stopWeight` 时停止后续槽。三顶点取并集，最小材质序号留在基础批次，其余进入叠加批次。每个批次保持输入三角形顺序，空集合不绘制。
- 裙边加载：`0x1005abf50`。40-byte 顶点前 36-byte 上传基础流，末尾四个 byte 上传独立 `a_userData1`；原 shader 使用 UNORM vec4。逐顶点检查全部四个非零材质 ID，不以权重过滤，也不在零 ID 处停止。每个存在的材质绘制完整裙边索引范围，shader 追加 `AlphaSkirt`；原 `u_skirtDRange = 5`。
- 原材质 uniform 上传：`0x100443810`；shader 参数生成：`0x100443a70`。实现保留 `u_materialId`、`u_matColor`、`u_matUvScale`、`u_matMetalness`、`u_matRoughness` 和原命名资源。
- Compositor 绘制命令组装：`0x10023de50`；RenderOutline::AddRenderList：`0x1007bcc00`。实际执行原描述符写入和列表存储，确认相关顺序是 `Opaque → Decal → Skirts`；贴花和裙边使用与基础层同一深度通道。基础层开启深度测试/写入，比较为 ≤，剔除背面，不混合。贴花与裙边测试 ≤、关闭深度写入、剔除背面；RGB 使用源 alpha / 1−源 alpha，关闭目标 alpha 写入。二者的偏移三分量为 `[0, -2, 0]`，对应常数/斜率/钳制参数。原 Metal setter 使用 `setDepthBias:slopeScale:clamp:`。
- Scene 的 23 项列表描述符：`0x10058f9d0`。实际执行后确认 Opaque/Skirts/Decal 的 `3072/32/256` 是容量，另一个 DWORD 是排序模式 `3`，不能当作深度/混合状态位。模式 3 在 `0x1007b9cd0` 获取 shader 描述符首 DWORD，按有符号升序排序；未初始化或空 shader 指针的键为 −1。原 getter、比较器和 introsort 对 32 个明确合成句柄实际执行验证，涵盖正负边界、重复键与无效指针。同键排序不稳定；真实原句柄分配与全部绘制调度仍待恢复。
- Metal 深度和剔除转换：`0x100a69680` / `0x100a6d9c0`。以捕获的 Objective-C 调用执行原转换；比较枚举 3 转为 Metal LessEqual，native cull 1 转为 Metal back 2。偏移 setter `0x100a6da50` 也实际执行，捕获并核对全部 7 项的三个浮点输入和缓存写回。混合因子表 `0x100b06650` 是静态机器码证据，未执行完整 Metal pipeline 构造。详见 [meshes-render-state.json](meshes-render-state.json)。

证据提取器检查所提供可执行文件的 SHA-256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。完整表和反汇编地址见 [meshes-evidence.json](meshes-evidence.json) 与 `evidence/`。

## 编辑器变化

地形、裙边使用原材质表和原分批规则，替换按 `LevelMaterial` ID 收集对象、取纹理平均颜色的旧路径。多个独立 `LevelMaterial` 对象可能共享同一 ID；其对象 shader 参数不能直接覆盖整张地图的 TerrainBarn 材质表。

顶点上传保留 `a_position`、四分量 packed normal、两组 UNORM 材质属性、三组 UNORM 烘焙照明和裙边 `a_userData1`。材质权重保持 byte/255，不再次归一化；ID 在检查 shader 中按原 `ivec4(a_material0 * 256)` 匹配。涂抹后会重新分批。用于选取的父几何保留原索引，因此无有效材质的三角形仍可选中并涂抹。

视口新增材质分层、Meshes light0/1/2 RGB、原环境光解码和裙边 userData1 RGB 六个视图。早期分层视图展示原材质颜色和权重；当前默认材质模式已运行原地形/裙边 GLSL 与贴图，属性模式仍用检查 shader。完整场景光照与合成未完成。环境光零除数以紫色显示，避免填入猜测的烘焙值。独立属性视图保留双面显示以便检查数据。

现存 Three/GLES 材质适配器以 ZERO/ONE alpha 混合保留目标 alpha，深度偏移为 units=0、factor=−2；这些是适配器和独立 GLES 检查范围。当前主视口使用原生 Vulkan，Three 只承担场景、相机和选择数学，Canvas2D 呈现 RGBA。不能将原 Metal 目标/投影或旧适配器验证直接算作完整原视口验收。主视口已补原地形/裙边 GLSL 提交，完整原句柄与排序调度仍未接入。

选中几何可查看每批的材质 ID、原 shader 文件、三角形数、原深度/混合/剔除状态和未解决的全局/管线绑定。调色板提供全部 30 项原定义，包括空地图。`nativeBakedGroupMaterial` 可以按 Opaque/Decal/Skirts 原状态创建材质，仍要求调用方明确提供全部有效 uniform；自定义状态接口还要求完整混合因子和深度测试设置。不会自动造光照网格、环境贴图或默认纹理。

地形元数据保留每个原区块的索引范围、第二个原始字段和边数量。云代理和遮挡几何仍以线框检查；云法线已确认并读出，遮挡几何位置编辑继续保留其未解释的四字节属性。

## 验证

- 33 张地图、77 份真实地形，加 33 份槽位边界合成案例，共 3,276,599 个输入三角形。所有 59 项计数和完整输出索引，与原 x64 scatter 逐项一致。真实三角形为 3,274,619 个。
- 33 张地图的 2,533 份裙边都能按原材质表构建基础分批；此项是数据审计，没有把它记为原机器码裙边绘制验证。
- Oracle 实际执行原材质初始化、颜色转换与 scatter。scatter 的 scratch 获取/分配/释放调用转到测试分配器；原分类与索引生成指令保持原样。libc 导入绑定到 Linux libc。此验证不包含原堆策略、完整 Game 启动、可见性 Job 或 GPU 绘制。见 [meshes-oracle.json](meshes-oracle.json)。
- 独立 Mesa llvmpipe OpenGL ES 3 环境对 18 组原版材质 shader 编译、链接、提交测试三角形和读回像素，GL 错误均为零；另一个属性检查 shader 读回 RGBA `[128, 64, 32, 255]` 与源 byte 一致。环境、矩阵和小纹理为明确的合成测试输入，不是原地图默认值；某些裙边和 Cloud 程序在这些输入下无可见像素。见 [meshes-gpu.json](meshes-gpu.json)。这不是原游戏截图比对或 Electron WebGL 渲染验收。
- 状态 Oracle 执行原命令组装至 `0x10023eec0`，随后跳到原返回尾部；资源创建、参数和 Outline setup 使用明确的 mock，原状态写入与 AddRenderList 存储指令未改。分别检查 alpha-depth 能力关闭/开启两种输入，7 个绘制列表和 23 个 Scene 描述符；三个深度状态、none/front/back 剔除转换及各列表偏移实际执行原 Metal 指令。没有执行原 GPU、完整 Compositor 或后续合成。
- 独立 GLES 另有 6 项生产状态适配器的像素检查：贴花再裙边的 alpha 混合、目标 alpha 保留、叠加不写深度、遮挡深度测试、基础层深度写入、背面剔除、带偏移的斜面共面贴花（首项同时检查顺序与 alpha 保留）。全部通过，GL 错误为零。测试使用明确的小颜色 shader 和合成三角形，不是原版场景画面比对。
- 72 项项目测试通过；TypeScript 和构建验证见开发状态。此前桌面 IPC 检查覆盖原材质调色板、裙边附加属性、Dawn 基础/叠加批次、原状态显示与 IPC、关联 TerrainBlobGroup、shader 依赖、既有烘焙编辑及保存。深度及 Cloud pass IPC 检查单独记录；Cloud pass 的 18,144 个返回 half 分量与原生输出一致，Dawn 78 张云卡 /6 个连接组与原加载 oracle 一致。33 张地图/66 个文件的未修改回写仍逐字节一致。

可运行 `python3 tools/reverse-render-state.py 原可执行文件` 重建状态证据；依赖 capstone、qemu-x86_64 和 x86_64-linux-gnu-gcc。`python3 tools/meshes-gpu-check.py` 重建独立 GLES 验证记录。

## 下一步

继续恢复真实原 shader 句柄分配和完整绘制调度，接入准确的 Ambience 初始输出、动态光照网格、探针与阴影资源，然后在视口运行完整原 fragment shader。云的原纹理上传、粗/细 AIR 与三段深度处理已有实现；同 pass Cloud 列表执行和云卡世界球/连接组已有实现；还需恢复真实 Visibility 遮挡分类/缓冲、云卡动态顶点/粒子自动对象生成和原注册顺序，生成真实场景深度，维护历史及主视口合成。地形区块剔除/Job/tessellation、碰撞与拓扑重建也未完成。

发布包保持 0.2.0，增量同步源码与构建结果。按当前用户优先级推进 Objects 模型调用与 BstBaked 烘焙消费／上传关系，并继续原生成器、完整主视口和原游戏验收。

## 2026-11-15 视口材质接入

当前主视口已自动运行原地形/裙边 GLSL、原贴图与 packed 顶点数据，并共享浮点 HDR 和深度附件。默认背景有地图环境、天空和原 Sun shader；相机支持右上角按钮与拖动。天空 probe、曝光曲线和显示转换仍为明确的预览适配，场景探针、阴影/点光源、模型原材质、云雾与原 Tonemap 合成及启动事件尚未完成，未达到原游戏画面。

验证、实际截图和剩余资源见 [视口材质接入进展](视口材质接入进展.md)。发布归档未重打。

遮挡顶点三个法线字节及原 Visibility 注册／提交／变换／三角形深度／mip 入口已确认，packedNormals 已接入几何读取。第 15 字节语义、完整 CPU 运行和真实剔除仍未恢复，Occluder 保持 2/10；见 [遮挡数据逆向](遮挡数据逆向.md)。

Visibility 球／AABB 数值查询已恢复：2,928 组／177,670 项原函数对照通过，覆盖 33 地图 356 个云卡世界球和全部 2,669 个几何顶点包围盒。云卡新增按视锥候选顺序执行原查询／非稳定压缩的入口；149 项项目测试、TypeScript 与构建通过。实际摄像机准备、资源／生命周期、DropOcclusion 和主视口剔除尚未闭合，不增加完整类清单分数，见 [遮挡数据逆向](遮挡数据逆向.md)。

最新续接优先推进地形与云，另三项放慢。Visibility 完整生命周期新增 227 组／2,724 步／2,411,020 项原方法检查；原资源名／类型查找和引用链实际执行。地形 OBB 完整函数 3,044 组／6,088 项、bin LOD 数值子段 1,732 组／74,328 项通过，AABB→LOD 和候选压缩已适配。157 项项目测试、TypeScript 和构建通过。默认 Update 的 `0x1002bcda0` 是调试视锥绘制，不会刷新 Camera；真实加载器、Camera 生产、地形 bin／LOD 转场／Job 和主视口仍未闭合，分数保持地形 6/10、云 7/10，详见 [Visibility生命周期与地形候选](Visibility生命周期与地形候选.md)。

地形 bin 创建与初始绘制准备：31 地图／77 条记录／96,309 个 bin 的原 bounds、sphere、packet 和 59 类索引流已核验；完整初始绘制准备 170 组／1,028 次通过。162 项项目测试、类型检查和构建通过；真实 loader、碰撞、LOD 转场／Job 与主视口调度仍待闭合，清单分数不变。详见 [地形bin创建与绘制准备](地形bin创建与绘制准备.md)。

地形 bin 显隐/动态登记清理和 LOD 任务分发新增 345 组／1,558 步原指令核验；167 项项目测试、类型检查和构建通过，完整任务队列/细分/回收仍待恢复。见 [地形bin显隐与LOD任务入口](地形bin显隐与LOD任务入口.md)。

裙边加载与绘制驱动本轮新增 83 组／33 地图全部 2,533 条记录／45,939,862 项原函数核验，零差异；原拆流、XYZ bounds／材质掩码、正常 chunk 合并和重复终止已恢复。171 项项目测试、类型检查和构建通过；真实资源／Camera／GPU 生命周期、生成／烘焙／碰撞与原调度待闭合，Skirt 保持 5/10。见 [裙边加载与绘制调度逆向](裙边加载与绘制调度逆向.md)。


2026-11-20 原模型材质绘制、默认显示/材质分支、四组UV、原stream/submit子链与原材质条件互动的新证据见 [模型原始渲染与逻辑接口](模型原始渲染与逻辑接口.md)。新截图使用实际原shader/贴图和无网格线的画布；原Metal、Model完整创建/生命周期、Beamo/动画/遮挡和完整场景互动仍待验收。较早llvmpipe退化UV采样错误已由独立原输入复现和驱动兼容解决，不修改原shader。


## 2026-11-21 Beamo 全 LOD 与地形基础依赖

新增原 Beamo／BeamoDecal 全 LOD 顶点、光照、trisCulled压缩、法线／区域权重和三个材质索引窗口。8,379组／717,931,744字节零差异，真实7,150对象／7,739 LOD全部通过；第三／第四LOD另外由准备输入覆盖。Barn全LOD容量／stream／范围／unmap调度156组／473,649,840字节通过。TerrainBlob原普通构造／变换／local OBB／world AABB加入基础类内核，局部OBB仍为明确准备输入。详见[全LOD上传与基础类推进](Beamo全LOD上传与基础类推进.md)。完整资源加载、材质合并绘制、Visibility/collision/skirts和原重新生成烘焙仍需恢复；这些结果不能当作原baker已完成。
