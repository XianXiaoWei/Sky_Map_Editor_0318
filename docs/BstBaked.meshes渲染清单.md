# BstBaked.meshes 渲染清单

目标是编辑器视口与原游戏初始化地图画面一致。按当前要求优先将地形与云推进到完整验收，Mesh／Skirt／Occluder 放慢；共享依赖联合恢复，再推进 Objects 基础/模型类与烘焙、裙边、遮挡依赖，再完成 Objects 区域/UI，最后完成 Avatar 原游戏完整游玩体验；跨段依赖一起恢复。

主视口已运行原地形/裙边、CloudCore 历史、三段深度、粗细云和动态 CloudCard，再运行原 FogUpsample/Tonemap。曝光、完整风场、真实光照/阴影、Visibility、透明/水/泛光和 Metal 画面对照仍有缺口，见地形与实体云渲染预览。

Wind 单体、附加标记点/轨道分支、优先级合成与计时子段已按显式运行快照对照原机器码。全局阵风核心另有 256 组原子段/数学回调对照；Rail 缓存和正常输入求值已核验；完整初始化/事件、动态缓存、自动交互力和视口风场接入仍待恢复。独立理想材质采样及 Metal 失败报告保留。

已建立 54,121 个原程序函数的地址索引，渲染发现根函数 507 个、直接依赖 505 个。
未展开依赖函数体 389 个，未解析间接调用位置 462 个，反汇编缺口 9 个。

这些是可追踪的当前发现数量，不是全部剩余实现数量；完整渲染可达性和函数归属尚未闭合，不计算完成百分比。

每个函数的边界、机器码哈希、符号、调用位置、代码指针引用、实现范围和证据见 [meshes-render-functions.json](meshes-render-functions.json)。全部原函数地址见 [native-function-index.json](native-function-index.json)。

## 当前渲染阶段

| 编号 | 工作 | 当前状态 | 原地址/子段 | 缺口 |
| --- | --- | --- | --- | --- |
| R01 | BstBaked.meshes LOD0/烘焙/几何读取 | 已实现，原加载链部分恢复 | `0x1003f4840`、`0x1003f68d0`、`0x100455e90` | 完整 LevelDataBarn 原加载/资源注册与未解释字段；不包含修改后的重建 |
| R02 | MaterialDefBarn 原定义、地图覆盖和参数 | 部分实现并验证 | `0x10043fb70`、`0x100443f50`、`0x100443810`、`0x100443a70` | 真实默认资源/句柄、全局参数自动绑定 |
| R03 | TerrainBarn 基础/叠加表面和三角形分批 | 分批已实现并原机器码验证 | `0x1006a1c50`、`0x1006a7280` | 初始化其他字段/完整资源创建，真实运行 LOD/剔除 |
| R04 | 地形运行可见性、Job、LOD 与细分 | OBB/LOD、bin 几何/packet、显隐/动态登记清理及任务入口已核验；完整运行待恢复 | `0x1006a24d0`、`0x1006a2630`、`0x1006a7b50`、`0x1006a8f80`、`0x1006aa110`、`0x1006ade10`、`0x10015e420`、`0x1006a3118`、`0x1006a3274`、`0x1006a9000`、`0x1006a88c0`、`0x100789e80`、`0x10078c950`、`0x1006a8100`、`0x10077e4b0`、`0x1006ad3f0` | 原 OBB 与 LOD 子段已核验；完整原创建正常路径核对 31 地图／77 记录／96,309 bins 的 sphere／bounds、packet 与 59 索引流，完整纯 bin 绘制准备 170 组／1,028 次通过。明确 CPU heap／导入服务与跳过碰撞快照；其他 model 字段、实际加载／变换／资源、Camera、碰撞／LOD 转场／Job 与视口调度待闭合。 新增显隐/原动态登记清理/任务分发 345 组／1,558 步，原 packet 覆盖 31 地图全部 77 记录抽样 5,339 bins；真实队列、worker、回收及主视口仍未闭合。 |
| R05 | SkirtBarn 原顶点拆流、材质存在规则和上传 | 部分实现并数据审计 | `0x1005abf50`、`0x1005aca70`、`0x1005acaf0`、`0x1007f6ae0` | 已恢复显式已加载记录下的完整 CPU 拆流/全局 u32 索引/XYZ bounds/材质掩码，正常终止与重复终止、显式摄像机查询结果下的绘制驱动和原 chunk 合并；83 组/33 地图全部 2533 裙边/45,939,862 项比较通过。实际资源 fallback/引用所有权、Camera/距离数学、GPU 完整生命周期、隐藏 sentinel chunk 槽、生成/烘焙/碰撞与主视口原调度仍待恢复；不提升完整生命周期/可见性检查项。 |
| R06 | CloudBarn 五图集/距离/代理/噪声 | 核心已实现并原机器码验证 | `0x100211690`、`0x100214810`、`0x1004b72d0`、`0x100212510` | 完整自动初始化/运行资源绑定、真实风场和代理遮挡提交；CloudBarn非debug Update偏移已验证，依赖样本明确提供 |
| R07 | CloudCard 原注册/资源和 bake 关联 | TGCL 适配已实现，原完整注册待恢复 | `0x10021fb40`、`0x1002216b0` | 原 LevelModelBarn 注册时序、原资源管理器和 bake 绑定 |
| R08 | CloudCard 世界球、连接组、组排序和累计索引 | 已实现并原机器码验证 | `0x10021fa30`、`0x10021fd80`、`0x100220090`、`0x1002202c0`、`0x100220360`、`0x100222830`、`0x100223420`、`0x100223d00` | 加载函数其他资源/生命周期部分仍未实现 |
| R09 | CloudCard 六平面、球测试、原剔除压缩 | 已实现并原机器码验证 | `0x1002206f0`、`0x100220b10` | Visibility 分类为明确输入 |
| R10 | 真实 Visibility 遮挡分类/缓冲 | 球／AABB 与完整生命周期原方法已按显式资源快照核验；真实加载／视口待恢复 | `0x100720dd0`、`0x100721ce0`、`0x10071d660`、`0x10071d9f0`、`0x10071e020`、`0x10071d9b0` | 2,928 组查询与 227 组／2,724 步完整生命周期通过，原资源名红黑树／类型／metadata-ID 查找及引用链实际执行；heap／scratch 初始快照、资源虚方法和导入为明确主机服务。默认 Update 只绘制调试视锥，不修改 Camera。真实 Camera 生产／class 默认／模块调度／资源加载／对象和主视口链仍未闭合，QEMU 不代表原硬件。 |
| R11 | CloudCard 原矩阵求逆、局部相机方向 | 已实现并原机器码验证 | `0x100076940`、`0x100220bd0` | 已衔接桌面可见性准备入口；原 Camera getter 为明确输入回调，后续旋转/动态顶点另列 R12/R13 |
| R12 | CloudCard 朝向旋转与动态位置 | 子段已实现并原机器码/GPU验证 | `0x100220cc0`、`0x100076df0`、`0x100220e70` | 原Mac libm逐bit精度、完整注册/Visibility和主视口自动云合成；bake/default光照必须明确提供 |
| R13 | CloudCard 28-byte 动态顶点属性 | 子段已实现并原机器码/GPU验证 | `0x100220f90`、`0x1002210c0` | 真实TGCL alphaMult和原half/SNORM字节已接IPC；完整原光照/动态云视口合成待恢复 |
| R14 | CloudCard 距离排序与 first/count 绘制队列 | 已实现并原机器码验证 | `0x100221270`、`0x100224290`、`0x1007f6ae0` | GPU draw 为捕获回调，动态几何上传未接入自动视口 |
| R15 | 蓬松云粒子发射、物理、寿命与实例排序 | 核心发射/队列、最近三个交互源、积分与寿命/实例/排序已按各自范围原机器码验证 | `0x100225cc0`、`0x100225f30`、`0x10022660f`、`0x1002279f2`、`0x100229600`、`0x100229d10`、`0x100225e90`、`0x100228a30`、`0x1002289b0`、`0x1001a1140`、`0x1001a1670`、`0x1001a4e90`、`0x100226920`、`0x10022757e` | Avatar/模型自动状态与全局 RNG、192 字节 source 准备、逐 sphere 交互力、原 GPU 实例注册和自动云合成；运行链仍要求明确交互结果 |
| R16 | 原地形/裙边 shader 与场景光照资源 | 主视口原 GLSL/贴图/顶点流、HDR 混合已接入；33 张地图采样绘制通过 | `0x1007f5430`、`0x1007f6280`、`0x1003879d0`、`0x100328050`、`0x100324a80` | 完整初始化/事件、场景探针、阴影/点光源、原 mip/默认纹理和完整合成；完整EnvironmentForces风场和理想CPU/原Metal采样精度 |
| R17 | Scene 列表、Opaque/Decal/Skirts 状态与排序 | 状态/排序核心已实现并验证 | `0x10058f9d0`、`0x10058ed00`、`0x1007b9cd0`、`0x1007ba0c0`、`0x1007bcc00` | 真实句柄和完整列表生产/消费调度 |
| R18 | Compositor 原目标/深度/粗细云/Cloud pass | 显式输入管线已实现并验证，自动场景待接入 | `0x10023d350`、`0x10023de50`、`0x100243a30` | 真实 RGB/深度、水/蓝噪声、历史/重投影和主视口合成 |
| R19 | 遮挡几何属性及运行提交 | 顶点／光栅／裁剪／连续提交数值链与深度 mip 已原函数核验；实际资源和生命周期待恢复 | `0x1007236a0`、`0x10071e020`、`0x100720250`、`0x10071e7f0`、`0x10071ee60`、`0x10071f790`、`0x100720560`、`0x10071d9f0`、`0x100076df0` | 完整数值提交链按全部 33 地图遮挡顶点/索引和显式投影核验；球/AABB 数值查询见 R10。堆/scratch 初始内存为回调快照，诊断开关关闭。变换 W scratch 和运算 NaN payload 排除；QEMU RCPPS/MIN/MAX 能力明确记录，原硬件、真实 Resize/Update、实际查询来源、DropOcclusion 和视口剔除待恢复。第 15 字节语义未定。 |
| R20 | 原 Metal/Windows/完整画面验收 | 未通过 | `0x100a6afc0`、`0x100a6d530` | 混合舍入、quarter 光栅边界、half 溢出；Windows GPU 和原游戏画面对照 |
| R21 | EnvironmentForces 风采样与 Wind 计时 | 显式快照核心已实现并原机器码验证 | `0x100328200`、`0x100328810`、`0x10078ce10`、`0x100324b62`、`0x1003276f0` | 基础1,422组和新增1,638组原 Wind→Rail 连续调用已核验；完整构造/事件/globalWind 初始化、动态轨道生命周期/通用元数据分发、自动交互力、macOS libm 和视口接入待恢复。计时仅原子段，整个 Update 未恢复。 |
| R22 | EnvironmentForces 全局阵风噪声与平滑 | 原指令子段/明确数学回调对照通过；预览数学有失败 | `0x100326666` | 256 组 /2,304 分量原子段与回调精确通过；JS Math 对 Linux libc 1/256 失败保留。完整 Update/SetWind 事件/初始状态、macOS libm 和视口接入待恢复。 |
| R23 | Marker getter 与 Rail 缓存/样条/最近点/变换 | 正常初始化输入已原函数核验；辅助线已接入 | `0x10043e2d0`、`0x10043e470`、`0x1004d2260`、`0x10055cf30`、`0x10078a710`、`0x10055d820`、`0x10055e420`、`0x1005609d0`、`0x100560b40`、`0x100789ac0` | 402 条实际 Rail 缓存与正常输入核验；四个退化查询、动态缓存失效/参数推进、通用 Object 分发/加载/事件/销毁、macOS libm 待恢复；JS sincos 求值12组、Wind4组差异保留。 |
| R24 | Rail 弧长表、双向转换与懒重建 | 初始化快照原函数核验通过；异常端点明确排除 | `0x10055c6a0`、`0x10055b560`、`0x10055d410`、`0x10055d4e0`、`0x10055bc50` | 594 组／249,514 有效 float32 分量，全部 402 条 Rail 表和两种懒查询覆盖。20 次旧长度端点超过重建末项的不安全扫描／日志断言排除；原自动分配、selfUpdating 位移失效、MoveObjectAlongRail 推进、通用生命周期与原游戏验收待恢复。 |
| R25 | 模型烘焙 GUID 查找与三种消费兼容检查 | 明确已载入快照／原兼容子段通过 | `0x1003f68d0`、`0x100195050`、`0x10021fb40`、`0x10045fa00` | 11,710 查询／全部 33 地图 10,653 GUID 快照通过；Beamo LOD 数量、CloudCard 和模型首个展开 LOD 顶点数规则分别核验。原 loaded-state／缺失资源 GUID 改写、Object GUID 虚表来源、完整类/材质/Skirt/Visibility 链与视口接入仍未闭合。 |
| R26 | 共享数值、基础事件和运行依赖音效 | 28 个原函数明确范围成批恢复；EventBarn 连续驱动数值/音效已核验，完整对象/烘焙场景仍待闭合 | `0x1007191a0`、`0x100717b20`、`0x10032ef60`、`0x1007194a0`、`0x100717f80`、`0x100718320`、`0x1007176f0`、`0x100717730`、`0x10032eea0`、`0x10032f0f0`、`0x10032f110`、`0x10032f130`、`0x10032f170`、`0x10032f1e0`、`0x10032f200`、`0x10032f220`、`0x100534410`、`0x1005343d0`、`0x10032e2c0`、`0x10032e2f0`、`0x10032f5b0`、`0x10032ea90`、`0x10032e540`、`0x10032e920`、`0x10032ec50`、`0x10032f3e0`、`0x100330980`、`0x1003315d0` | 原 ObjectFactory/缺字段默认值、Get/SetEnabled 元数据方法、EventBarn 类型索引树/切图卸载、真实 GameTime、Mac libm、FMOD bank 路由/解码/播放/卸载、LevelMesh/Beamo 创建/更新/材质/动画和 BstBaked 完整运行仍待闭合 |

## 函数逐项追踪

| 函数起始地址 | 阶段 | 证据 | 外部直调 | 未解间接调用 | 当前状态 |
| --- | --- | --- | --- | --- | --- |
| `0x100064820` | 共享/模块依赖 | evidence/material-uniform-100064820.asm | 7 | 0 | 已定位，待恢复 |
| `0x100064a20` | 共享/模块依赖 | evidence/material-uniform-100064a20.asm | 7 | 0 | 已定位，待恢复 |
| `0x100064c60` | 共享/模块依赖 | evidence/material-uniform-100064c60.asm | 7 | 0 | 已定位，待恢复 |
| `0x100067e00` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x100067ee0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100067ef0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100068160` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100068170` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x1000682d0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1000682e0` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100068440` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x1000684e0` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100068560` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100068570` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100068940` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100068950` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100068d60` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100068d70` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100068ed0` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x100068f30` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100076940` | R11 | evidence/cloud-card-inverse.asm | 1 | 0 | 部分实现/验证 |
| `0x100076df0` | R12, R19 | 符号/机器码地址 | 0 | 0 | 部分实现/验证 |
| `0x1000ec410` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10011d2a0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1001234d0` | 共享/模块依赖 | evidence/cloud-particle-caller-1001234d0.asm | 194 | 1 | 已定位，待恢复 |
| `0x10015e420` | R04 | evidence/terrain-frustum-10015e420.asm | 0 | 0 | 部分实现/验证 |
| `0x100195050` | R25 | 符号/机器码地址 | 80 | 7 | 部分实现/验证 |
| `0x1001a1140` | R15 | evidence/cloud-particle-caller-1001a1140.asm | 14 | 0 | 部分实现/验证 |
| `0x1001a1670` | R15 | evidence/cloud-particle-caller-1001a1670.asm | 7 | 0 | 部分实现/验证 |
| `0x1001a4e90` | R15 | evidence/cloud-particle-caller-1001a4e90.asm | 12 | 3 | 部分实现/验证 |
| `0x100211690` | R06 | evidence/cloud-initialize-100211690.asm, evidence/cloud-initialize.asm | 7 | 0 | 部分实现/验证 |
| `0x100212510` | R06 | evidence/cloud-update.asm | 11 | 0 | 部分实现/验证 |
| `0x1002128e0` | 共享/模块依赖 | evidence/cloud-unload.asm | 11 | 0 | 已定位，待恢复 |
| `0x1002129c0` | 共享/模块依赖 | evidence/cloud-render-flush.asm | 0 | 0 | 已定位，待恢复 |
| `0x1002129f0` | 共享/模块依赖 | evidence/cloud-load.asm | 146 | 0 | 已定位，待恢复 |
| `0x100213dd0` | 共享/模块依赖 | evidence/cloud-distance-sample.asm | 26 | 0 | 已定位，待恢复 |
| `0x100214810` | R06 | evidence/cloud-noise-sample.asm | 0 | 0 | 部分实现/验证 |
| `0x1002149c0` | 共享/模块依赖 | evidence/cloud-avatar-query-1002149c0.asm, evidence/cloud-sample.asm | 11 | 0 | 已定位，待恢复 |
| `0x100215220` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1002152e0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002152f0` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100215450` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x1002154b0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002154d0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002154e0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002156d0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002156e0` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100215840` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100215850` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100215a20` | 共享/模块依赖 | evidence/cloud-env-constructor.asm | 0 | 0 | 已定位，待恢复 |
| `0x100215c10` | 共享/模块依赖 | evidence/cloud-meta-and-tweaks.asm | 3 | 0 | 已定位，待恢复 |
| `0x100216480` | 共享/模块依赖 | evidence/cloud-atlas-index.asm | 0 | 0 | 已定位，待恢复 |
| `0x1002164b0` | 共享/模块依赖 | evidence/cloud-block-index.asm | 0 | 0 | 已定位，待恢复 |
| `0x100216510` | 共享/模块依赖 | evidence/cloud-active-block.asm | 0 | 0 | 已定位，待恢复 |
| `0x100216530` | 共享/模块依赖 | evidence/cloud-border-neighbor.asm | 0 | 0 | 已定位，待恢复 |
| `0x100216670` | 共享/模块依赖 | evidence/cloud-coordinate.asm | 3 | 0 | 已定位，待恢复 |
| `0x10021fa30` | R08 | evidence/cloud-card-connect.asm | 0 | 0 | 部分实现/验证 |
| `0x10021fb40` | R07, R08, R25 | evidence/cloud-card-load.asm | 70 | 2 | 部分实现/验证 |
| `0x1002206f0` | R09, R11, R12, R13, R14 | evidence/cloud-card-render.asm, evidence/cloud-card-visibility.asm | 67 | 0 | 部分实现/验证 |
| `0x1002216b0` | R07 | evidence/cloud-card-allocate.asm | 4 | 0 | 部分实现/验证 |
| `0x100221990` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x100221c90` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x100221cf0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100221d10` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x100221db0` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100221e30` | 共享/模块依赖 | 符号/机器码地址 | 2 | 2 | 已定位，待恢复 |
| `0x100221ec0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100222360` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x100222370` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x100222410` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100222490` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x1002224f0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100222510` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100222520` | 共享/模块依赖 | 符号/机器码地址 | 8 | 0 | 已定位，待恢复 |
| `0x1002226c0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002226d0` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100222830` | R08 | evidence/cloud-card-group-sort.asm | 9 | 1 | 部分实现/验证 |
| `0x100223420` | R08 | evidence/cloud-card-group-sort3.asm | 1 | 0 | 部分实现/验证 |
| `0x100223d00` | R08 | evidence/cloud-card-group-insertion.asm | 5 | 1 | 部分实现/验证 |
| `0x100224290` | R14 | evidence/cloud-card-distance-sort.asm | 5 | 1 | 部分实现/验证 |
| `0x100225400` | 共享/模块依赖 | evidence/cloud-card-metadata-100225400.asm | 2 | 0 | 已定位，待恢复 |
| `0x100225cc0` | R15 | evidence/cloud-particle-100225cc0.asm | 17 | 0 | 部分实现/验证 |
| `0x100225e90` | R15 | evidence/cloud-particle-100225e90.asm | 0 | 0 | 部分实现/验证 |
| `0x100225f30` | R15 | evidence/cloud-particle-100225f30.asm, evidence/cloud-particle-selection-100226920.asm | 117 | 0 | 部分实现/验证 |
| `0x100228630` | 共享/模块依赖 | evidence/cloud-particle-100228630.asm | 24 | 0 | 已定位，待恢复 |
| `0x1002289b0` | R15 | evidence/cloud-particle-1002289b0.asm | 1 | 0 | 部分实现/验证 |
| `0x100228a30` | R15 | evidence/cloud-particle-100228a30.asm | 1 | 0 | 部分实现/验证 |
| `0x100228b60` | 共享/模块依赖 | evidence/cloud-particle-100228b60.asm | 1 | 0 | 已定位，待恢复 |
| `0x100229030` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x100229040` | 共享/模块依赖 | evidence/dynamics-100229040.asm | 1 | 0 | 已定位，待恢复 |
| `0x100229050` | 共享/模块依赖 | evidence/dynamics-100229050.asm | 1 | 0 | 已定位，待恢复 |
| `0x100229240` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x1002292a0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002292c0` | 共享/模块依赖 | evidence/dynamics-1002292c0.asm | 1 | 0 | 已定位，待恢复 |
| `0x1002292d0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002292e0` | 共享/模块依赖 | evidence/dynamics-1002292e0.asm | 10 | 10 | 已定位，待恢复 |
| `0x100229600` | R15 | evidence/cloud-particle-100229600.asm | 4 | 1 | 部分实现/验证 |
| `0x100229d10` | R15 | evidence/cloud-particle-100229d10.asm | 0 | 0 | 部分实现/验证 |
| `0x10022a1c0` | 共享/模块依赖 | evidence/cloud-particle-10022a1c0.asm | 7 | 0 | 已定位，待恢复 |
| `0x10022b470` | 共享/模块依赖 | evidence/cloud-particle-10022b470.asm | 1 | 0 | 已定位，待恢复 |
| `0x10023d350` | R18 | evidence/compositor-create.asm | 46 | 2 | 部分实现/验证 |
| `0x10023d900` | 共享/模块依赖 | evidence/compositor-10023d900.asm, evidence/compositor-samplers.asm | 16 | 1 | 已定位，待恢复 |
| `0x10023daf0` | 共享/模块依赖 | evidence/compositor-10023daf0.asm | 15 | 3 | 已定位，待恢复 |
| `0x10023de00` | 共享/模块依赖 | evidence/compositor-10023de00.asm | 1 | 0 | 已定位，待恢复 |
| `0x10023de50` | R18 | evidence/compositor-outline.asm | 300 | 1 | 部分实现/验证 |
| `0x100241d70` | 共享/模块依赖 | evidence/compositor-100241d70.asm | 2 | 4 | 已定位，待恢复 |
| `0x100241e30` | 共享/模块依赖 | evidence/compositor-100241e30.asm | 1 | 0 | 已定位，待恢复 |
| `0x100241f70` | 共享/模块依赖 | evidence/compositor-100241f70.asm, evidence/outline-resource-user-100241f70.asm | 6 | 0 | 已定位，待恢复 |
| `0x100242120` | 共享/模块依赖 | evidence/compositor-100242120.asm | 2 | 0 | 已定位，待恢复 |
| `0x1002422e0` | 共享/模块依赖 | evidence/compositor-1002422e0.asm | 10 | 0 | 已定位，待恢复 |
| `0x1002427c0` | 共享/模块依赖 | evidence/compositor-1002427c0.asm | 7 | 0 | 已定位，待恢复 |
| `0x1002428f0` | 共享/模块依赖 | evidence/compositor-1002428f0.asm | 5 | 0 | 已定位，待恢复 |
| `0x100242940` | 共享/模块依赖 | evidence/compositor-100242940.asm | 10 | 0 | 已定位，待恢复 |
| `0x100242a50` | 共享/模块依赖 | evidence/compositor-100242a50.asm | 18 | 0 | 已定位，待恢复 |
| `0x100242c20` | 共享/模块依赖 | evidence/compositor-100242c20.asm | 1 | 0 | 已定位，待恢复 |
| `0x100242cc0` | 共享/模块依赖 | evidence/compositor-100242cc0.asm | 1 | 0 | 已定位，待恢复 |
| `0x100242d10` | 共享/模块依赖 | evidence/compositor-100242d10.asm | 5 | 2 | 已定位，待恢复 |
| `0x100243a30` | R18 | evidence/compositor-100243a30.asm, evidence/outline-resource-user-100243a30.asm | 33 | 0 | 部分实现/验证 |
| `0x100244030` | 共享/模块依赖 | evidence/compositor-100244030.asm | 11 | 0 | 已定位，待恢复 |
| `0x100244a30` | 共享/模块依赖 | evidence/compositor-100244a30.asm, evidence/outline-resource-user-100244a30.asm | 93 | 0 | 已定位，待恢复 |
| `0x100247060` | 共享/模块依赖 | evidence/compositor-100247060.asm, evidence/compositor-frame-update.asm | 12 | 0 | 已定位，待恢复 |
| `0x100247850` | 共享/模块依赖 | evidence/outline-resource-user-100247850.asm | 0 | 0 | 已定位，待恢复 |
| `0x10024ba00` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x10024c250` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10024c260` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10024c510` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x10024c570` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10024c590` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10024c5a0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10024c7d0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10024c7e0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1002b9810` | 共享/模块依赖 | evidence/cloud-particle-1002b9810.asm, evidence/visibility-debug-renderer-get.asm | 0 | 0 | 已定位，待恢复 |
| `0x1002b9fc0` | 共享/模块依赖 | evidence/cloud-particle-1002b9fc0.asm | 4 | 0 | 已定位，待恢复 |
| `0x1002bb510` | 共享/模块依赖 | evidence/cloud-particle-1002bb510.asm | 3 | 0 | 已定位，待恢复 |
| `0x1002bcda0` | 共享/模块依赖 | evidence/visibility-debug-camera.asm | 25 | 0 | 已定位，待恢复 |
| `0x100323f00` | 共享/模块依赖 | evidence/dynamics-100323f00.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323f10` | 共享/模块依赖 | evidence/dynamics-100323f10.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323f20` | 共享/模块依赖 | evidence/dynamics-100323f20.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323f30` | 共享/模块依赖 | evidence/dynamics-100323f30.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323f40` | 共享/模块依赖 | evidence/dynamics-100323f40.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323f70` | 共享/模块依赖 | evidence/dynamics-100323f70.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323f80` | 共享/模块依赖 | evidence/dynamics-100323f80.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323f90` | 共享/模块依赖 | evidence/dynamics-100323f90.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323fa0` | 共享/模块依赖 | evidence/dynamics-100323fa0.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323fb0` | 共享/模块依赖 | evidence/dynamics-100323fb0.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323fc0` | 共享/模块依赖 | evidence/dynamics-100323fc0.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323fd0` | 共享/模块依赖 | evidence/dynamics-100323fd0.asm | 0 | 0 | 已定位，待恢复 |
| `0x100323fe0` | 共享/模块依赖 | evidence/dynamics-100323fe0.asm, evidence/environment-lifecycle-100323fe0.asm, evidence/material-dynamic-binding-100323fe0.asm | 6 | 0 | 已定位，待恢复 |
| `0x100324070` | 共享/模块依赖 | evidence/dynamics-100324070.asm | 10 | 1 | 已定位，待恢复 |
| `0x1003242f0` | 共享/模块依赖 | evidence/dynamics-1003242f0.asm, evidence/environment-lifecycle-1003242f0.asm | 0 | 0 | 已定位，待恢复 |
| `0x100324a80` | R16, R21, R22 | evidence/dynamics-100324a80.asm, evidence/environment-lifecycle-100324a80.asm | 75 | 9 | 部分实现/验证 |
| `0x1003276f0` | R21 | evidence/wind-create-1003276f0.asm | 1 | 0 | 部分实现/验证 |
| `0x100328050` | R16 | evidence/dynamics-100328050.asm, evidence/environment-update-100328050.asm | 1 | 0 | 部分实现/验证 |
| `0x100328200` | R21 | evidence/dynamics-100328200.asm, evidence/wind-sample-100328200.asm | 3 | 2 | 部分实现/验证 |
| `0x100328810` | R21 | evidence/environment-function-100328810.asm, evidence/wind-volume-100328810.asm | 9 | 3 | 部分实现/验证 |
| `0x100328c20` | 共享/模块依赖 | evidence/environment-strongest-force-100328c20.asm | 0 | 2 | 已定位，待恢复 |
| `0x100329f90` | 共享/模块依赖 | evidence/wind-constructor-100329f90.asm | 1 | 0 | 已定位，待恢复 |
| `0x10032a0c0` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x10032a0d0` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x10032a170` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x10032a1f0` | 共享/模块依赖 | 符号/机器码地址 | 2 | 2 | 已定位，待恢复 |
| `0x10032a270` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10032a2a0` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x10032a340` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x10032a3c0` | 共享/模块依赖 | 符号/机器码地址 | 2 | 2 | 已定位，待恢复 |
| `0x10032a440` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10032b3f0` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x10032b400` | 共享/模块依赖 | evidence/environment-metaclass-getter-10032b400.asm | 0 | 0 | 已定位，待恢复 |
| `0x10032b410` | 共享/模块依赖 | evidence/environment-destroy-10032b410.asm | 65 | 0 | 已定位，待恢复 |
| `0x10032b830` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x10032b890` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10032b8b0` | 共享/模块依赖 | evidence/dynamics-10032b8b0.asm | 3 | 2 | 已定位，待恢复 |
| `0x10032b950` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x10032b9d0` | 共享/模块依赖 | evidence/dynamics-10032b9d0.asm | 3 | 2 | 已定位，待恢复 |
| `0x10032ba70` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x10032baf0` | 共享/模块依赖 | evidence/dynamics-10032baf0.asm | 2 | 3 | 已定位，待恢复 |
| `0x10032bbb0` | 共享/模块依赖 | 符号/机器码地址 | 5 | 0 | 已定位，待恢复 |
| `0x10032bc30` | 共享/模块依赖 | 符号/机器码地址 | 2 | 3 | 已定位，待恢复 |
| `0x10032bcf0` | 共享/模块依赖 | 符号/机器码地址 | 5 | 0 | 已定位，待恢复 |
| `0x10032bd70` | 共享/模块依赖 | 符号/机器码地址 | 2 | 3 | 已定位，待恢复 |
| `0x10032be30` | 共享/模块依赖 | 符号/机器码地址 | 5 | 0 | 已定位，待恢复 |
| `0x10032ca80` | 共享/模块依赖 | evidence/dynamics-10032ca80.asm, evidence/wind-register-10032ca80.asm | 6 | 0 | 已定位，待恢复 |
| `0x10032e2c0` | R26 | evidence/event-dispatch-10032e2c0.asm, evidence/event-set-enabled.asm | 2 | 0 | 部分实现/验证 |
| `0x10032e2f0` | R26 | evidence/event-dispatch-10032e2f0.asm, evidence/event-request-enabled.asm | 11 | 0 | 部分实现/验证 |
| `0x10032e540` | R26 | evidence/event-barn-level-load.asm | 4 | 1 | 部分实现/验证 |
| `0x10032e920` | R26 | evidence/event-barn-release-all.asm | 1 | 2 | 部分实现/验证 |
| `0x10032ea90` | R26 | evidence/event-barn-update.asm | 13 | 2 | 部分实现/验证 |
| `0x10032ec50` | R26 | evidence/event-barn-render.asm | 0 | 1 | 部分实现/验证 |
| `0x10032eea0` | R26 | evidence/event-constructor.asm | 1 | 0 | 部分实现/验证 |
| `0x10032ef60` | R26 | evidence/event-start.asm | 11 | 0 | 部分实现/验证 |
| `0x10032f0f0` | R26 | evidence/event-resume.asm | 1 | 0 | 部分实现/验证 |
| `0x10032f110` | R26 | evidence/event-has-unique-id.asm | 0 | 0 | 部分实现/验证 |
| `0x10032f130` | R26 | evidence/event-unique-id.asm | 1 | 0 | 部分实现/验证 |
| `0x10032f170` | R26 | evidence/event-type-index.asm | 2 | 0 | 部分实现/验证 |
| `0x10032f1e0` | R26 | evidence/event-forward-30.asm | 0 | 1 | 部分实现/验证 |
| `0x10032f200` | R26 | evidence/event-forward-38.asm | 0 | 1 | 部分实现/验证 |
| `0x10032f220` | R26 | evidence/event-forward-40.asm | 0 | 1 | 部分实现/验证 |
| `0x10032f3e0` | R26 | evidence/event-barn-10032f3e0.asm, evidence/event-barn-find-uid.asm | 0 | 0 | 部分实现/验证 |
| `0x10032f430` | 共享/模块依赖 | evidence/event-barn-10032f430.asm | 5 | 1 | 已定位，待恢复 |
| `0x10032f5b0` | R26 | evidence/event-barn-10032f5b0.asm, evidence/event-barn-dispatch.asm | 1 | 5 | 部分实现/验证 |
| `0x10032f670` | 共享/模块依赖 | evidence/event-barn-10032f670.asm | 16 | 0 | 已定位，待恢复 |
| `0x10032f850` | 共享/模块依赖 | evidence/event-barn-10032f850.asm | 10 | 2 | 已定位，待恢复 |
| `0x100330980` | R26 | evidence/event-sort-100330980.asm, evidence/event-unique-sort.asm | 9 | 1 | 部分实现/验证 |
| `0x1003315d0` | R26 | evidence/event-sequence-sort.asm, evidence/event-sort-1003315d0.asm | 5 | 1 | 部分实现/验证 |
| `0x10037c9d0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037c9e0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cb20` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cb50` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cb60` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cb90` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cbb0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cc80` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cc90` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cca0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037ccc0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cd70` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037ce60` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037ced0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10037cf90` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100387810` | 共享/模块依赖 | evidence/dynamics-100387810.asm, evidence/material-dynamic-binding-100387810.asm | 11 | 0 | 已定位，待恢复 |
| `0x1003879d0` | R16 | evidence/dynamics-1003879d0.asm | 3 | 0 | 部分实现/验证 |
| `0x100388000` | 共享/模块依赖 | evidence/dynamics-100388000.asm | 2 | 0 | 已定位，待恢复 |
| `0x100388030` | 共享/模块依赖 | evidence/dynamics-100388030.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388040` | 共享/模块依赖 | evidence/dynamics-100388040.asm | 1 | 0 | 已定位，待恢复 |
| `0x100388070` | 共享/模块依赖 | evidence/dynamics-100388070.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388080` | 共享/模块依赖 | evidence/dynamics-100388080.asm | 1 | 0 | 已定位，待恢复 |
| `0x100388090` | 共享/模块依赖 | evidence/dynamics-100388090.asm | 0 | 0 | 已定位，待恢复 |
| `0x1003880a0` | 共享/模块依赖 | evidence/dynamics-1003880a0.asm | 0 | 0 | 已定位，待恢复 |
| `0x1003880b0` | 共享/模块依赖 | evidence/dynamics-1003880b0.asm | 1 | 0 | 已定位，待恢复 |
| `0x1003880d0` | 共享/模块依赖 | evidence/dynamics-1003880d0.asm | 1 | 0 | 已定位，待恢复 |
| `0x1003880f0` | 共享/模块依赖 | evidence/dynamics-1003880f0.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388100` | 共享/模块依赖 | evidence/dynamics-100388100.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388110` | 共享/模块依赖 | evidence/dynamics-100388110.asm | 1 | 0 | 已定位，待恢复 |
| `0x100388170` | 共享/模块依赖 | evidence/dynamics-100388170.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388180` | 共享/模块依赖 | evidence/dynamics-100388180.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388190` | 共享/模块依赖 | evidence/dynamics-100388190.asm | 0 | 0 | 已定位，待恢复 |
| `0x1003881a0` | 共享/模块依赖 | evidence/dynamics-1003881a0.asm | 0 | 0 | 已定位，待恢复 |
| `0x1003881b0` | 共享/模块依赖 | evidence/dynamics-1003881b0.asm | 5 | 0 | 已定位，待恢复 |
| `0x100388200` | 共享/模块依赖 | evidence/dynamics-100388200.asm | 1 | 0 | 已定位，待恢复 |
| `0x100388220` | 共享/模块依赖 | evidence/dynamics-100388220.asm | 2 | 0 | 已定位，待恢复 |
| `0x100388250` | 共享/模块依赖 | evidence/dynamics-100388250.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388260` | 共享/模块依赖 | evidence/dynamics-100388260.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388270` | 共享/模块依赖 | evidence/dynamics-100388270.asm | 0 | 0 | 已定位，待恢复 |
| `0x100388280` | 共享/模块依赖 | evidence/dynamics-100388280.asm | 1 | 1 | 已定位，待恢复 |
| `0x1003882e0` | 共享/模块依赖 | evidence/dynamics-1003882e0.asm | 2 | 1 | 已定位，待恢复 |
| `0x100388340` | 共享/模块依赖 | evidence/dynamics-100388340.asm | 1 | 0 | 已定位，待恢复 |
| `0x100388360` | 共享/模块依赖 | evidence/dynamics-100388360.asm | 3 | 2 | 已定位，待恢复 |
| `0x1003f10c0` | 共享/模块依赖 | evidence/visibility-leveldata-type.asm | 0 | 0 | 已定位，待恢复 |
| `0x1003f4840` | R01 | 符号/机器码地址 | 165 | 4 | 部分实现/验证 |
| `0x1003f68d0` | R01, R25 | 符号/机器码地址 | 0 | 0 | 部分实现/验证 |
| `0x1003f7c80` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1003f8dd0` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1003f8de0` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x1003f8e80` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x1003f8f00` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x1003f8f60` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1003f8f80` | 共享/模块依赖 | 符号/机器码地址 | 2 | 3 | 已定位，待恢复 |
| `0x1003f9040` | 共享/模块依赖 | 符号/机器码地址 | 5 | 0 | 已定位，待恢复 |
| `0x1003f90c0` | 共享/模块依赖 | 符号/机器码地址 | 2 | 3 | 已定位，待恢复 |
| `0x1003f9180` | 共享/模块依赖 | 符号/机器码地址 | 5 | 0 | 已定位，待恢复 |
| `0x1003f9200` | 共享/模块依赖 | 符号/机器码地址 | 2 | 3 | 已定位，待恢复 |
| `0x1003f92c0` | 共享/模块依赖 | 符号/机器码地址 | 5 | 0 | 已定位，待恢复 |
| `0x1004048a0` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1004048b0` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x100404910` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100404930` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100404940` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100404bd0` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x100404c70` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100404cf0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100404d00` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x10040a2b0` | 共享/模块依赖 | evidence/material-registration.asm | 6 | 0 | 已定位，待恢复 |
| `0x10043e2d0` | R23 | evidence/rail-marker-10043e2d0.asm | 0 | 0 | 部分实现/验证 |
| `0x10043e470` | R23 | evidence/rail-marker-10043e470.asm | 0 | 0 | 部分实现/验证 |
| `0x10043fb70` | R02 | evidence/material-initialize.asm | 66 | 0 | 部分实现/验证 |
| `0x100443810` | R02 | evidence/material-upload.asm | 27 | 0 | 部分实现/验证 |
| `0x100443a70` | R02 | evidence/material-parameters.asm | 1 | 0 | 部分实现/验证 |
| `0x100443f50` | R02 | evidence/material-reset.asm | 4 | 0 | 部分实现/验证 |
| `0x100444a10` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x100444a20` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x100444ad0` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100455e90` | R01 | 符号/机器码地址 | 43 | 0 | 部分实现/验证 |
| `0x100457950` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x10045fa00` | R25 | 符号/机器码地址 | 37 | 0 | 部分实现/验证 |
| `0x1004b72d0` | R06 | 符号/机器码地址 | 5 | 1 | 部分实现/验证 |
| `0x1004bae40` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1004bae50` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x1004baef0` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x1004d1e40` | 共享/模块依赖 | evidence/rail-cache-1004d1e40.asm | 6 | 4 | 已定位，待恢复 |
| `0x1004d2140` | 共享/模块依赖 | evidence/rail-cache-1004d2140.asm | 6 | 4 | 已定位，待恢复 |
| `0x1004d2260` | R23 | evidence/rail-cache-1004d2260.asm | 3 | 0 | 部分实现/验证 |
| `0x1004d3d80` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1004d3d90` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1004d3da0` | 共享/模块依赖 | 符号/机器码地址 | 8 | 0 | 已定位，待恢复 |
| `0x1004d5f00` | 共享/模块依赖 | evidence/dynamics-1004d5f00.asm, evidence/material-dynamic-binding-1004d5f00.asm | 10 | 0 | 已定位，待恢复 |
| `0x1005343d0` | R26 | evidence/play-sound-2d-resume.asm, evidence/sound-event-1005343d0.asm | 1 | 2 | 部分实现/验证 |
| `0x100534410` | R26 | evidence/play-sound-2d-update.asm | 3 | 7 | 部分实现/验证 |
| `0x100534710` | 共享/模块依赖 | evidence/play-sound-2d-preload.asm | 1 | 2 | 已定位，待恢复 |
| `0x1005347f0` | 共享/模块依赖 | evidence/sound-event-1005347f0.asm | 1 | 2 | 已定位，待恢复 |
| `0x100534840` | 共享/模块依赖 | evidence/play-sound-3d-update.asm | 4 | 9 | 已定位，待恢复 |
| `0x100538940` | 共享/模块依赖 | evidence/sound-event-registration.asm | 13 | 0 | 已定位，待恢复 |
| `0x10055b090` | 共享/模块依赖 | evidence/rail-cache-10055b090.asm | 1 | 0 | 已定位，待恢复 |
| `0x10055b4a0` | 共享/模块依赖 | evidence/rail-cache-10055b4a0.asm | 4 | 0 | 已定位，待恢复 |
| `0x10055b560` | R24 | evidence/rail-cache-10055b560.asm | 3 | 0 | 部分实现/验证 |
| `0x10055b690` | 共享/模块依赖 | evidence/rail-cache-10055b690.asm | 0 | 0 | 已定位，待恢复 |
| `0x10055b6a0` | 共享/模块依赖 | evidence/rail-cache-10055b6a0.asm | 0 | 0 | 已定位，待恢复 |
| `0x10055b6b0` | 共享/模块依赖 | evidence/rail-cache-10055b6b0.asm | 2 | 0 | 已定位，待恢复 |
| `0x10055b720` | 共享/模块依赖 | evidence/rail-cache-10055b720.asm | 2 | 0 | 已定位，待恢复 |
| `0x10055b780` | 共享/模块依赖 | evidence/rail-cache-10055b780.asm | 2 | 0 | 已定位，待恢复 |
| `0x10055b7e0` | 共享/模块依赖 | evidence/rail-cache-10055b7e0.asm | 2 | 0 | 已定位，待恢复 |
| `0x10055b880` | 共享/模块依赖 | evidence/rail-cache-10055b880.asm | 1 | 0 | 已定位，待恢复 |
| `0x10055ba10` | 共享/模块依赖 | evidence/rail-arc-10055ba10.asm, evidence/rail-cache-10055ba10.asm | 8 | 0 | 已定位，待恢复 |
| `0x10055bb40` | 共享/模块依赖 | evidence/rail-arc-10055bb40.asm | 0 | 0 | 已定位，待恢复 |
| `0x10055bb50` | 共享/模块依赖 | evidence/rail-arc-10055bb50.asm | 0 | 0 | 已定位，待恢复 |
| `0x10055bb60` | 共享/模块依赖 | evidence/rail-arc-10055bb60.asm, evidence/rail-arc-10055bc00.asm | 1 | 0 | 已定位，待恢复 |
| `0x10055bc40` | 共享/模块依赖 | evidence/rail-arc-10055bc40.asm | 0 | 0 | 已定位，待恢复 |
| `0x10055bc50` | R24 | evidence/rail-arc-10055bc50.asm | 2 | 0 | 部分实现/验证 |
| `0x10055bcb0` | 共享/模块依赖 | evidence/rail-arc-10055bcb0.asm | 2 | 0 | 已定位，待恢复 |
| `0x10055bd40` | 共享/模块依赖 | evidence/rail-arc-10055bd40.asm | 1 | 0 | 已定位，待恢复 |
| `0x10055bd90` | 共享/模块依赖 | evidence/rail-arc-10055bd90.asm, evidence/rail-arc-10055be10.asm, evidence/rail-cache-10055bd90.asm | 12 | 0 | 已定位，待恢复 |
| `0x10055c3f0` | 共享/模块依赖 | evidence/rail-arc-10055c3f0.asm, evidence/rail-cache-10055c3f0.asm | 2 | 0 | 已定位，待恢复 |
| `0x10055c530` | 共享/模块依赖 | evidence/rail-arc-10055c530.asm | 1 | 0 | 已定位，待恢复 |
| `0x10055c580` | 共享/模块依赖 | evidence/rail-arc-10055c580.asm | 1 | 0 | 已定位，待恢复 |
| `0x10055c6a0` | R24 | evidence/rail-arc-10055c6a0.asm | 2 | 0 | 部分实现/验证 |
| `0x10055cb20` | 共享/模块依赖 | evidence/rail-arc-10055cb20.asm, evidence/rail-cache-10055cb20.asm | 1 | 0 | 已定位，待恢复 |
| `0x10055cbc0` | 共享/模块依赖 | evidence/rail-arc-10055cbc0.asm, evidence/rail-cache-10055cbc0.asm | 1 | 0 | 已定位，待恢复 |
| `0x10055cc60` | 共享/模块依赖 | evidence/rail-arc-10055cc60.asm, evidence/rail-cache-10055cc60.asm | 21 | 0 | 已定位，待恢复 |
| `0x10055cf30` | R23 | evidence/rail-arc-10055cf30.asm, evidence/rail-cache-10055cf30.asm | 4 | 0 | 部分实现/验证 |
| `0x10055d200` | 共享/模块依赖 | evidence/rail-arc-10055d200.asm, evidence/rail-cache-10055d200.asm | 8 | 0 | 已定位，待恢复 |
| `0x10055d2d0` | 共享/模块依赖 | evidence/rail-arc-10055d2d0.asm | 0 | 0 | 已定位，待恢复 |
| `0x10055d310` | 共享/模块依赖 | evidence/rail-arc-10055d310.asm, evidence/rail-cache-10055d310.asm | 0 | 0 | 已定位，待恢复 |
| `0x10055d410` | R24 | evidence/rail-arc-10055d410.asm | 2 | 0 | 部分实现/验证 |
| `0x10055d4e0` | R24 | evidence/rail-arc-10055d4e0.asm | 21 | 0 | 部分实现/验证 |
| `0x10055d820` | R23 | evidence/rail-closest-point-10055d820.asm | 7 | 0 | 部分实现/验证 |
| `0x10055e420` | R23 | evidence/rail-function-10055e420.asm | 1 | 0 | 部分实现/验证 |
| `0x1005609d0` | R23 | evidence/rail-function-1005609d0.asm | 1 | 0 | 部分实现/验证 |
| `0x100560b40` | R23 | evidence/rail-transform-100560b40.asm | 9 | 0 | 部分实现/验证 |
| `0x100562490` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1005627e0` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x100562880` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100562900` | 共享/模块依赖 | 符号/机器码地址 | 2 | 2 | 已定位，待恢复 |
| `0x100562980` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1005629b0` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x100562a50` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100562ad0` | 共享/模块依赖 | 符号/机器码地址 | 2 | 2 | 已定位，待恢复 |
| `0x100562b50` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100562b80` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100562b90` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100562d10` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100562d20` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100562eb0` | 共享/模块依赖 | 符号/机器码地址 | 2 | 2 | 已定位，待恢复 |
| `0x100562f40` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100562f70` | 共享/模块依赖 | 符号/机器码地址 | 2 | 2 | 已定位，待恢复 |
| `0x100563000` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100563030` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100563040` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x10058ed00` | R17 | evidence/scene-render-flush.asm | 46 | 0 | 部分实现/验证 |
| `0x10058f9d0` | R17 | evidence/scene-list-descriptor.asm | 14 | 1 | 部分实现/验证 |
| `0x100590120` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x100590230` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x1005902d0` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100590350` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x1005903f0` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100590470` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x100590510` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x1005abf50` | R05 | evidence/skirt-load.asm, evidence/skirt-runtime-1005abf50.asm | 61 | 0 | 部分实现/验证 |
| `0x1005aca70` | R05 | evidence/skirt-runtime-1005aca70.asm | 3 | 0 | 部分实现/验证 |
| `0x1005acaf0` | R05 | evidence/skirt-runtime-1005acaf0.asm | 6 | 0 | 部分实现/验证 |
| `0x1005b38b0` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1005b38c0` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x1005b3960` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x1005b39e0` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x1005b3a40` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1005b77d0` | 共享/模块依赖 | evidence/outline-resource-user-1005b77d0.asm | 10 | 0 | 已定位，待恢复 |
| `0x100600930` | 共享/模块依赖 | evidence/outline-resource-user-100600930.asm | 55 | 26 | 已定位，待恢复 |
| `0x10060a400` | 共享/模块依赖 | evidence/sound-runtime-10060a400.asm | 0 | 0 | 已定位，待恢复 |
| `0x10060a550` | 共享/模块依赖 | evidence/sound-runtime-10060a550.asm | 0 | 0 | 已定位，待恢复 |
| `0x10060a6a0` | 共享/模块依赖 | evidence/sound-runtime-10060a6a0.asm | 0 | 0 | 已定位，待恢复 |
| `0x10060bf20` | 共享/模块依赖 | evidence/sound-runtime-10060bf20.asm | 1 | 0 | 已定位，待恢复 |
| `0x100611240` | 共享/模块依赖 | evidence/sound-emitter-registration.asm | 8 | 0 | 已定位，待恢复 |
| `0x1006a1c50` | R03 | evidence/terrain-runtime-1006a1c50.asm | 15 | 0 | 部分实现/验证 |
| `0x1006a24d0` | R04 | evidence/terrain-runtime-1006a24d0.asm | 0 | 0 | 部分实现/验证 |
| `0x1006a24f0` | 共享/模块依赖 | evidence/terrain-runtime-1006a24f0.asm | 15 | 0 | 已定位，待恢复 |
| `0x1006a2630` | R04 | evidence/terrain-runtime-1006a2630.asm | 111 | 0 | 部分实现/验证 |
| `0x1006a4690` | 共享/模块依赖 | evidence/terrain-runtime-1006a4690.asm | 4 | 0 | 已定位，待恢复 |
| `0x1006a47c0` | 共享/模块依赖 | evidence/terrain-runtime-1006a47c0.asm | 0 | 0 | 已定位，待恢复 |
| `0x1006a47d0` | 共享/模块依赖 | evidence/terrain-runtime-1006a47d0.asm | 151 | 0 | 已定位，待恢复 |
| `0x1006a57c0` | 共享/模块依赖 | evidence/terrain-runtime-1006a57c0.asm | 35 | 0 | 已定位，待恢复 |
| `0x1006a5ea0` | 共享/模块依赖 | evidence/terrain-runtime-1006a5ea0.asm | 3 | 0 | 已定位，待恢复 |
| `0x1006a64b0` | 共享/模块依赖 | evidence/terrain-runtime-1006a64b0.asm | 5 | 1 | 已定位，待恢复 |
| `0x1006a65e0` | 共享/模块依赖 | evidence/terrain-runtime-1006a65e0.asm | 12 | 0 | 已定位，待恢复 |
| `0x1006a7280` | R03 | evidence/terrain-scatter.asm | 32 | 0 | 部分实现/验证 |
| `0x1006a7b50` | R04 | evidence/terrain-runtime-1006a7b50.asm | 0 | 0 | 部分实现/验证 |
| `0x1006a8100` | R04 | evidence/terrain-runtime-1006a8100.asm | 7 | 0 | 部分实现/验证 |
| `0x1006a81d0` | 共享/模块依赖 | evidence/terrain-runtime-1006a81d0.asm | 46 | 0 | 已定位，待恢复 |
| `0x1006a88c0` | R04 | evidence/terrain-runtime-1006a88c0.asm | 31 | 0 | 部分实现/验证 |
| `0x1006a8f80` | R04 | evidence/terrain-runtime-1006a8f80.asm | 2 | 0 | 部分实现/验证 |
| `0x1006a9000` | R04 | evidence/terrain-runtime-1006a9000.asm | 29 | 0 | 部分实现/验证 |
| `0x1006a9cb0` | 共享/模块依赖 | evidence/terrain-runtime-1006a9cb0.asm | 17 | 0 | 已定位，待恢复 |
| `0x1006aa110` | R04 | evidence/terrain-runtime-1006aa110.asm | 96 | 0 | 部分实现/验证 |
| `0x1006ac7f0` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1006ac800` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1006ac810` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1006acac0` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x1006acb60` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x1006acbe0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1006acbf0` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x1006acd50` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1006acd60` | 共享/模块依赖 | 符号/机器码地址 | 8 | 0 | 已定位，待恢复 |
| `0x1006acf00` | 共享/模块依赖 | 符号/机器码地址 | 2 | 1 | 已定位，待恢复 |
| `0x1006acf60` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1006acf80` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1006acf90` | 共享/模块依赖 | 符号/机器码地址 | 8 | 0 | 已定位，待恢复 |
| `0x1006ad1c0` | 共享/模块依赖 | evidence/terrain-runtime-1006ad1c0.asm | 1 | 0 | 已定位，待恢复 |
| `0x1006ad260` | 共享/模块依赖 | evidence/terrain-runtime-1006ad260.asm | 5 | 0 | 已定位，待恢复 |
| `0x1006ad2e0` | 共享/模块依赖 | evidence/terrain-runtime-1006ad2e0.asm | 2 | 0 | 已定位，待恢复 |
| `0x1006ad3f0` | R04 | evidence/terrain-runtime-1006ad3f0.asm | 2 | 0 | 部分实现/验证 |
| `0x1006ade10` | R04 | evidence/terrain-runtime-1006ade10.asm | 9 | 0 | 部分实现/验证 |
| `0x1007176f0` | R26 | evidence/set-float-reset.asm | 0 | 0 | 部分实现/验证 |
| `0x100717730` | R26 | evidence/set-float-update.asm | 3 | 0 | 部分实现/验证 |
| `0x100717b20` | R26 | evidence/float-split.asm | 4 | 1 | 部分实现/验证 |
| `0x100717f80` | R26 | evidence/float-enable.asm | 4 | 1 | 部分实现/验证 |
| `0x100718320` | R26 | evidence/if-enabled.asm | 4 | 0 | 部分实现/验证 |
| `0x1007191a0` | R26 | evidence/float-mult.asm | 0 | 0 | 部分实现/验证 |
| `0x1007194a0` | R26 | evidence/float-add.asm | 1 | 0 | 部分实现/验证 |
| `0x10071a7e0` | 共享/模块依赖 | evidence/numeric-class-registration.asm | 23 | 0 | 已定位，待恢复 |
| `0x10071d660` | R10 | evidence/visibility-initialize.asm | 2 | 0 | 部分实现/验证 |
| `0x10071d9b0` | R10 | evidence/visibility-terminate.asm | 2 | 0 | 部分实现/验证 |
| `0x10071d9f0` | R10, R19 | evidence/visibility-resize.asm | 3 | 0 | 部分实现/验证 |
| `0x10071e020` | R10, R19 | evidence/visibility-update.asm | 25 | 0 | 部分实现/验证 |
| `0x10071e7e0` | 共享/模块依赖 | evidence/visibility-render-flush.asm | 1 | 0 | 已定位，待恢复 |
| `0x10071e7f0` | R19 | evidence/visibility-transform-vertices.asm | 0 | 0 | 部分实现/验证 |
| `0x10071ee60` | R19 | evidence/visibility-triangle-depth.asm | 1 | 0 | 部分实现/验证 |
| `0x10071f790` | R19 | evidence/visibility-selected-triangles.asm | 19 | 0 | 部分实现/验证 |
| `0x100720250` | R19 | evidence/visibility-geometry-submit.asm | 38 | 0 | 部分实现/验证 |
| `0x100720560` | R19 | evidence/visibility-depth-mips.asm | 0 | 0 | 部分实现/验证 |
| `0x100720a40` | 共享/模块依赖 | evidence/visibility-depth-debug-upload.asm | 19 | 0 | 已定位，待恢复 |
| `0x100720dd0` | R10 | evidence/visibility-spheres.asm | 7 | 0 | 部分实现/验证 |
| `0x100721ce0` | R10 | evidence/visibility-aabbs.asm | 8 | 0 | 部分实现/验证 |
| `0x100722d10` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x100722e50` | 共享/模块依赖 | evidence/visibility-meta-100722e50.asm | 5 | 0 | 已定位，待恢复 |
| `0x100722ec0` | 共享/模块依赖 | evidence/visibility-meta-100722ec0.asm | 1 | 0 | 已定位，待恢复 |
| `0x100722ee0` | 共享/模块依赖 | evidence/visibility-meta-100722ee0.asm | 2 | 0 | 已定位，待恢复 |
| `0x100722f40` | 共享/模块依赖 | evidence/visibility-meta-100722f40.asm | 0 | 0 | 已定位，待恢复 |
| `0x100722f50` | 共享/模块依赖 | evidence/visibility-meta-100722f50.asm | 0 | 0 | 已定位，待恢复 |
| `0x100722f60` | 共享/模块依赖 | evidence/visibility-meta-100722f60.asm | 0 | 0 | 已定位，待恢复 |
| `0x100722f70` | 共享/模块依赖 | evidence/visibility-meta-100722f70.asm | 1 | 1 | 已定位，待恢复 |
| `0x100722fd0` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100722fe0` | 共享/模块依赖 | 符号/机器码地址 | 7 | 0 | 已定位，待恢复 |
| `0x100723140` | 共享/模块依赖 | 符号/机器码地址 | 3 | 2 | 已定位，待恢复 |
| `0x1007231e0` | 共享/模块依赖 | 符号/机器码地址 | 6 | 0 | 已定位，待恢复 |
| `0x100723260` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100723270` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100723460` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x100723470` | 共享/模块依赖 | 符号/机器码地址 | 1 | 0 | 已定位，待恢复 |
| `0x1007236a0` | R19 | evidence/visibility-registration.asm | 2 | 0 | 部分实现/验证 |
| `0x10076bd20` | 共享/模块依赖 | evidence/visibility-camera-constructor.asm | 1 | 0 | 已定位，待恢复 |
| `0x10077e4b0` | R04 | evidence/terrain-runtime-10077e4b0.asm | 0 | 0 | 部分实现/验证 |
| `0x100780880` | 共享/模块依赖 | evidence/cloud-decompress.asm | 4 | 0 | 已定位，待恢复 |
| `0x100789ac0` | R23 | evidence/rail-function-100789ac0.asm | 0 | 0 | 部分实现/验证 |
| `0x100789e80` | R04 | evidence/terrain-math-100789e80.asm | 0 | 0 | 部分实现/验证 |
| `0x10078a710` | R23 | evidence/rail-cache-10078a710.asm | 1 | 0 | 部分实现/验证 |
| `0x10078c950` | R04 | evidence/terrain-math-10078c950.asm | 0 | 0 | 部分实现/验证 |
| `0x10078ce10` | R21 | evidence/wind-box-distance-10078ce10.asm | 0 | 0 | 部分实现/验证 |
| `0x1007abc10` | 共享/模块依赖 | evidence/numeric-object-type.asm | 0 | 0 | 已定位，待恢复 |
| `0x1007b9cd0` | R17 | evidence/render-list-sort.asm | 8 | 0 | 部分实现/验证 |
| `0x1007b9f90` | 共享/模块依赖 | evidence/render-list-shader-compare.asm | 0 | 0 | 已定位，待恢复 |
| `0x1007ba0c0` | R17 | evidence/render-list-introsort.asm | 4 | 31 | 部分实现/验证 |
| `0x1007bb3f0` | 共享/模块依赖 | 符号/机器码地址 | 8 | 0 | 已定位，待恢复 |
| `0x1007bbe10` | 共享/模块依赖 | 符号/机器码地址 | 0 | 0 | 已定位，待恢复 |
| `0x1007bc100` | 共享/模块依赖 | evidence/outline-resource.asm | 8 | 0 | 已定位，待恢复 |
| `0x1007bc2d0` | 共享/模块依赖 | evidence/outline-resource-alt.asm | 8 | 0 | 已定位，待恢复 |
| `0x1007bc4a0` | 共享/模块依赖 | evidence/outline-resource-user-1007bc4a0.asm | 8 | 0 | 已定位，待恢复 |
| `0x1007bc670` | 共享/模块依赖 | evidence/outline-add-depth-state.asm | 8 | 0 | 已定位，待恢复 |
| `0x1007bc820` | 共享/模块依赖 | evidence/outline-reset.asm | 1 | 0 | 已定位，待恢复 |
| `0x1007bc8b0` | 共享/模块依赖 | evidence/outline-pass.asm, evidence/outline-resource-user-1007bc8b0.asm | 5 | 0 | 已定位，待恢复 |
| `0x1007bcbc0` | 共享/模块依赖 | evidence/outline-end.asm | 0 | 0 | 已定位，待恢复 |
| `0x1007bcc00` | R17 | evidence/outline-add-render-list.asm, evidence/outline-list.asm | 1 | 0 | 部分实现/验证 |
| `0x1007bcde0` | 共享/模块依赖 | evidence/outline-quad.asm | 3 | 0 | 已定位，待恢复 |
| `0x1007bef60` | 共享/模块依赖 | evidence/outline-execute.asm | 9 | 0 | 已定位，待恢复 |
| `0x1007c2310` | 共享/模块依赖 | evidence/visibility-resource-ref-retain.asm | 0 | 2 | 已定位，待恢复 |
| `0x1007c2530` | 共享/模块依赖 | evidence/visibility-resource-ref-init.asm | 0 | 0 | 已定位，待恢复 |
| `0x1007c2570` | 共享/模块依赖 | evidence/visibility-resource-ref-release.asm | 2 | 1 | 已定位，待恢复 |
| `0x1007c4360` | 共享/模块依赖 | evidence/visibility-resource-get.asm | 4 | 1 | 已定位，待恢复 |
| `0x1007c4640` | 共享/模块依赖 | evidence/visibility-resource-require.asm | 34 | 1 | 已定位，待恢复 |
| `0x1007f53c0` | 共享/模块依赖 | evidence/vertex-1007f53c0.asm | 2 | 0 | 已定位，待恢复 |
| `0x1007f5430` | R16 | evidence/vertex-buffer-format.asm | 4 | 0 | 部分实现/验证 |
| `0x1007f5d90` | 共享/模块依赖 | evidence/cloud-core-render-create.asm | 10 | 0 | 已定位，待恢复 |
| `0x1007f5e90` | 共享/模块依赖 | evidence/vertex-render-initialize.asm | 6 | 0 | 已定位，待恢复 |
| `0x1007f6280` | R16 | evidence/vertex-refresh-pipeline.asm | 7 | 2 | 部分实现/验证 |
| `0x1007f6540` | 共享/模块依赖 | evidence/cloud-core-render-submit.asm | 4 | 0 | 已定位，待恢复 |
| `0x1007f6a50` | 共享/模块依赖 | evidence/render-list-shader-key.asm | 0 | 0 | 已定位，待恢复 |
| `0x1007f6ae0` | R05, R14 | evidence/skirt-runtime-1007f6ae0.asm | 1 | 0 | 部分实现/验证 |
| `0x1008d9792` | 共享/模块依赖 | evidence/outline-resource-user-1008d9792.asm | 13 | 2 | 已定位，待恢复 |
| `0x10091363c` | 共享/模块依赖 | evidence/outline-resource-user-10091363c.asm | 5 | 1 | 已定位，待恢复 |
| `0x100947bb8` | 共享/模块依赖 | evidence/outline-resource-user-100947bb8.asm | 9 | 1 | 已定位，待恢复 |
| `0x100987bd4` | 共享/模块依赖 | evidence/outline-resource-user-100987bd4.asm | 1 | 1 | 已定位，待恢复 |
| `0x1009ad192` | 共享/模块依赖 | evidence/outline-resource-user-1009ad192.asm | 2 | 1 | 已定位，待恢复 |
| `0x1009b00dc` | 共享/模块依赖 | evidence/outline-resource-user-1009b00dc.asm | 2 | 2 | 已定位，待恢复 |
| `0x100a69680` | 共享/模块依赖 | evidence/metal-depth-state.asm | 14 | 47 | 已定位，待恢复 |
| `0x100a69d80` | 共享/模块依赖 | evidence/metal-texture-create.asm | 28 | 68 | 已定位，待恢复 |
| `0x100a6aa30` | 共享/模块依赖 | evidence/metal-cloud-target-sampler.asm, evidence/metal-sampler-create.asm, evidence/metal-setMagFilter-100a6aa30.asm, evidence/metal-setMinFilter-100a6aa30.asm, evidence/metal-setSAddressMode-100a6aa30.asm, evidence/metal-setTAddressMode-100a6aa30.asm | 4 | 18 | 已定位，待恢复 |
| `0x100a6afc0` | R20 | evidence/metal-cloud-target-format.asm, evidence/metal-setPixelFormat-100a6afc0.asm | 7 | 28 | 部分实现/验证 |
| `0x100a6d530` | R20 | evidence/metal-render-pass.asm | 7 | 13 | 部分实现/验证 |
| `0x100a6d9c0` | 共享/模块依赖 | evidence/metal-cull-state.asm | 0 | 1 | 已定位，待恢复 |
| `0x100a6da50` | 共享/模块依赖 | evidence/metal-depth-bias.asm | 0 | 1 | 已定位，待恢复 |
| `0x100a6ede0` | 共享/模块依赖 | evidence/metal-command-context.asm, evidence/vertex-100a6ede0.asm | 7 | 13 | 已定位，待恢复 |

## 渲染版打包验收

- 从真实地图数据自动构建地形、裙边和云的材质/资源/绘制列表，完成主视口合成。
- 核对 Visibility、动态顶点、LOD 与资源句柄，并通过原机器码及真实地图输入验证。
- 保留并解决云混合、quarter 光栅边界及 half 溢出三份未通过报告，确认原 Metal 行为。
- 完成 Windows GPU 和原游戏画面对照；编辑重建不再阻塞当前渲染阶段。

## 联合恢复与其他待办

- 地形拓扑/碰撞树修改与重建
- 新增裙边的照明/边界重建
- 云距离场/代理/碰撞同步编辑
- 原版新烘焙生成
- 右上角导航方块
- Objects 区域触发、摄像机按钮文字与 Avatar 原入口/玩家状态/衣柜/动作联合阶段，见 Objects与Avatar清单.md

重建：`python3 tools/meshes-render-inventory.py /path/to/Sky`。原 executable 的 SHA-256 必须匹配，生成器不修改 reference 或发布包。
