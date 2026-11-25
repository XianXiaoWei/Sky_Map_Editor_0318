# 地形 bin 创建与绘制准备

本轮继续优先推进地形和云，补齐原地形 bin 的 CPU 生产与初始绘制准备。清单仍为地形 6/10、云 7/10、Mesh 5/10、Skirt 5/10、Occluder 2/10；这次完成的是完整运行项里的子链。

原创建函数 `0x1006a9000` 的正常方法体连续执行，包括原 GetScale、bounds→OBB、矩阵乘法、整片及逐 bin 的材质 scatter。170 组输入对照通过，包含 31 地图全部 77 条地形记录及 96,309 个原 bin；每条真实记录使用显式单位矩阵和单位尺度的 90 度旋转／平移矩阵。19 条记录没有 bin，保留原整片地形路径，不能强制切块。[创建报告](terrain-bin-geometry-oracle.json)记录逐字段比较范围。

原 CPU heap／scratch 获取、分配释放及导入的内存／字符串／powf 是明确的主机服务。测试分别以 0 和 0x55 初始化分配区，并保留 64 字节 guard。Terrain +0xc1 明确设为 1，以执行原跳过碰撞注册分支；这不是恢复 CollisionGeoBarn。原材料表仍由 MaterialDefBarn Initialize 生成。原 free-list、Barn 容量、资源和 transform 均为显式快照，实际加载器和对象注册没有因此闭合。

| 原字段 | 已恢复的生产规则 |
| --- | --- |
| terrain +0x88 | 原 bin 记录：u32 索引数量，后接 XYZ 三个字节和保留字节 |
| model +0x1a0 | 球中心 = gridOrigin + halfCell × 坐标 × 2 + halfCell，再按 model transform 变换；半径为 float32 halfCell 转 double × **1.7321** 再转 float32 |
| model +0x1b8/+0x1c0 | 遍历 bin 的连续原索引范围，逐轴忽略 NaN，求局部极值后分别变换两个端点 |
| model +0x1d0 | 每 bin 128 字节、16 槽；按 59 类材质编号递增写入非零项，offset 为该材质此前所有 bin 的索引累计量 |
| model +0x1dc | 每类材质出现的 bin 数，按未截断的非零 u32 数量计数 |
| model +0x2cc/+0x3b8 | 整片 scatter 数量和 59 个独立索引流；与原稳定三角形顺序一致 |
| model +0x1a8/+0x1b0 | 初始 LOD 写为 FFFF；pending 数组在创建中不初始化，保留分配字节 |

包围盒生产不能替换为旋转后的常规 world AABB：原函数只变换局部最小和最大两个端点，旋转后可能倒置。空 bin 保留 FLT_MAX／-FLT_MAX 极值并进行原浮点变换。比较包含 NaN 数值但排除运算产生的 NaN payload。此生产接口当前明确采用环境 RTE；没有把它记为其他 MXCSR 模式一致。

packet 只清空全部槽的 u16 count。没有写入的 offset、selector 和 padding 必须保留初始 heap 字节，不能用“所有空槽归零”替代。非零 u32 count 写到槽内时取低 16 位；65,538 项被写成 2 的样本已验证。每 bin 超过 16 个非空材质会导致原越界写，可移植接口拒绝此类输入；真实语料未触发该限制。

`buildTerrainBinGeometry` 返回原 bin spheres／minima／maxima、packets、59 类数量／人口和索引流。`MeshesDocument.terrainBinSource` 已从解析器提供原分区、网格数据和实际材质顶点输入，transform 由调用方明确提供。材质分类共用 `terrainTriangleMasks`；`terrainPartitionSurfaceCounts` 在单次分类后累计各分区，避免每个 bin 都扫描全部地形顶点。

随后执行了完整纯函数 `0x1006a7b50`，没有修改原函数、导入或回调。170 组／1,028 次连续调用通过，覆盖其他 bin 不变、整个块和 guard、重复调用、空 draw 指针、selector 0／58、零计数覆盖、u32 大 offset 和 uint64 地址回绕。[绘制准备报告](terrain-bin-draw-oracle.json)保存范围。

`prepareTerrainBinDraw` 选择 model +0x1c8 的 0x3e0 字节块，清空 +0x28 及 59 个计数字段，复制 +0x5d8 顶点指针；按全部 16 条 packet 顺序设置每类 count 和 indexBase + offset×2。重复 selector 后项覆盖前项，包括零 count；其他指针和 padding 不修改。draw 指针为空时跳过 packet，仍将 LOD 写为 3、pending 写为 FFFE。pointer words 是不解引用的 uint64 token，不代表资源创建完成。

首轮创建 runner 的 allocation tracking 容量 512 不足以容纳最大记录的 8,697 个 bin，已改为 65,536 并在原释放调用到达时释放 scratch；该 harness 失败保留在报告中。第一版输入校验曾错误要求无 bin 记录也完整分区，现已保留原整片分支。当前通过报告与保存的原输出 fixture 为最终结果。

本轮仍未完成其他 model 字段、真实 CPU 分配策略、CollisionGeoBarn、bin LOD 转场／细分／Job、对象变换与启用事件、实际加载注册、默认 Camera／模块调度以及主视口自动剔除。云完整风场／粒子／照明／曝光／透明合成、原烘焙重建和 Windows／原游戏画面验收继续保留为未完成。

重建命令：`npx tsx tools/terrain-bin-geometry-oracle.ts`、`npx tsx tools/terrain-bin-draw-oracle.ts`。创建 runner 的原输出以输入、runner 源码和原 executable 的 SHA 联合校验缓存于 `/root/sky-research`，相同输入可复用原输出核对修正后的 JS；gzip fixture 独立供项目测试使用，无需原资源。
