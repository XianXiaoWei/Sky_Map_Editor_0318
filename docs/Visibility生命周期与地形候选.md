# Visibility 生命周期与地形候选

本轮按“地形和云优先推进，Mesh／Skirt／Occluder 放慢”的要求，继续恢复两者共用的 Visibility。五段检查项仍为地形 6/10、云 7/10、Mesh 5/10、Skirt 5/10、Occluder 2/10；下面完成的是未完成项里的子链，不增加整项分数。

原 Initialize、Resize、Update、Terminate 的完整方法体已连续执行核验，不再用 Resize 分配前的返回跳板代替生命周期。227 组状态序列共 2,724 步，核对 2,411,020 项结果，全部通过；包含全部 33 地图的 190,987 个遮挡顶点和 1,144,065 个索引。[原函数对照报告](visibility-lifecycle-oracle.json)记录具体范围。

明确提供的主机服务只有堆／scratch 分配释放、导入的内存／字符串操作、资源虚表 retain／release 和栈 cookie。原资源名红黑树查找、类型／metadata-ID 分派以及引用链挂接／移除实际执行。两个同名资源节点的 metadata 类型不同，查找必须跳过第一个错误类型。引用链 anchor 位于资源 +0x40，其 +0x10 指向有虚表的 LevelData payload；Update 与 Release 都通过这个 payload 访问数据／虚调用。真实文件加载器和资源虚方法本身没有因此恢复。

| 原入口 | 已核验行为 |
| --- | --- |
| Initialize `0x10071d660` | 分配 0x300 字节 Camera，执行原 Camera 构造后复制输入 |
| Resize `0x10071d9f0` | DeviceInfo +0x284/+0x288 得出四分之一整数尺寸，补偶数 mip、连续分配、填深度、复制 Camera |
| Update `0x10071e020` | 开关早退、Camera 分支、逻辑深度清除、原资源查找／引用、只提交首个遮挡记录、生成 mip、释放引用 |
| Terminate `0x10071d9b0` | 释放 Camera 和深度，保留原指针字 |

需要更正旧续接点：`0x1002bcda0` 是调试视锥绘制，不是摄像机准备。默认 Update 执行其禁用绘制分支时不会修改 Camera；`kUpdateOcclusionCamera` 的值位于 `0x100d0d4c0`，为真时才复制输入 Camera。`kDisableVisibility` 在 Camera 分支前早退；`kDisableOcclusionTesting` 在该分支后、清除／资源查找前早退。

Camera 复制跳过 +0x18..+0x1f 的八字节 padding。Resize 的四分之一整数宽高没有变化时，在 Camera 复制、深度清除和 +0x30 比值更新前返回。这个比值来自 DeviceInfo +0x244/+0x298，尚未命名其语义。Resize 保留环境舍入模式；Update／查询临时启用 RTZ／FTZ／DAZ，然后恢复控制位。Update 只清除逻辑宽×高个 float，不能清空第一层补边和整段 guard 来替代。缓冲的跨层读取和 128 字节显式 guard 都逐字核对。

`VisibilityRuntime` 保存 0x240 字节可移植检查快照；原 metaclass 的对象大小 getter 返回 0x238，额外八字节用于保留尾部检查范围。快照里的指针表示 allocation ID 和偏移。输入 Buffer 被复制到独立 Uint8Array，避免 Buffer.slice 共享原快照及 pooled Buffer 非零偏移造成错误。Terminate 后保留指针仅供检查，调用方必须遵守原生命周期。

本轮尺寸序列从 8×8 起，覆盖不同 mip 形状、同一四分之一尺寸的早退、重新分配／同尺寸复用和 RTE／RTZ 输入。极小视口的原函数可能访问没有分配的 mip；可移植运行层拒绝任一维小于 8 的输入，不宣称恢复原异常处理。原 class 默认字段、Camera 生产、模块调度、启用的调试绘制和实际硬件行为仍待恢复。

地形第一阶段使用原有向包围盒测试 `0x10015e420`，不是云卡的球视锥规则。其三列 half-axis 先归一化，再乘回原长度，保留舍入和退化轴行为；与平面恰好相切时被拒绝。完整原函数没有修改代码或导入回调；RTE 和 RTZ／FTZ／DAZ 下 3,044 组、6,088 项检查通过，包括 31 地图的 77 条地形 bounds 派生的显式 OBB。[地形对照报告](terrain-frustum-oracle.json)不把这些检查盒体当成已恢复的原对象加载状态。

`terrainOcclusionCandidates` 按 `0x1006a2c90..0x1006a2d71` 收集 enabled 且 OBB 通过的候选，读取原对象 +0xa0 的球快照，按候选顺序调用球查询（initialize=true），再执行对象／状态的 swap-with-last 压缩。云卡查询的 initialize=false 不能直接复用。

随后补齐了 bin 的数值 LOD 选择。[LOD 对照报告](terrain-lod-oracle.json)记录 1,732 组／74,328 项检查，全部通过。`0x1006a3118..0x1006a3217` 将非零 AABB 状态映射为 LOD 3，零状态映射为 `0xffff`，包含 32 项 SIMD 批次与标量尾部。`0x1006a3274..0x1006a331f` 计算中心距离平方减球半径平方，依次比较三项平方阈值，选出 LOD 0～3；最低 LOD 先经 CVTTSS2SI，再取低 16 位进行有符号比较。遮挡状态为零直接输出 `0xffff`，不执行最低 LOD 限制。最低 LOD 的 NaN／无穷／溢出、阈值相切、异常 sphere、guard 和环境 RTE／RTZ 均包含检查；数量为零由进入子段前的测试 harness 保留输出。

这两个原指令范围仅在入口和出口设置跳板，不包含导入／数值回调，也不代表完整 TerrainBarn。`queryTerrainBinLods` 已按原 bin 数组顺序衔接 AABB 查询与 LOD 决策，要求原 minima／maxima／sphere／eye／三档阈值快照。保存回归样本包含 31／32／33、64／65、128／129 项的批次边界。原 bin +0x1b8／+0x1c0 的边界、+0x1a0 的球及 +0x1a8 的 LOD 来源，对象距离排序、LOD 转场／细分／碰撞、资源和 Job 调度仍待恢复；不能用编辑器整片几何盒体代替原 bin。

当前主视口仍没有自动建立原 Visibility 输入。地形原 bin 包围盒和对象启用／变换、云卡资源／照明／风场、动态粒子、光照／曝光／透明合成、烘焙重建和 Windows／原游戏画面对照继续保留为未完成。上述 CPU 原函数一致性不能替代 GPU 像素或完整游戏验收。

重建命令：`npx tsx tools/visibility-lifecycle-oracle.ts`、`npx tsx tools/terrain-frustum-oracle.ts`、`npx tsx tools/terrain-lod-oracle.ts`。保存的 gzip 原输出供 [生命周期回归测试](../tests/visibility-runtime.test.ts)和[地形候选／bin LOD 回归测试](../tests/terrain-visibility.test.ts)使用，无需安装原资源。早期导入跳转覆盖／资源引用快照错误的失败报告保留；最终通过报告和重新生成的 fixture 为当前结果。
