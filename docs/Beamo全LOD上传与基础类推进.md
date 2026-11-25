# Beamo 全 LOD 上传与基础类推进

本轮继续 Objects 模型调用类与 BstBaked.meshes 的消费链。原程序对照已覆盖全部 6,598 个 Beamo、552 个 BeamoDecal 和 7,739 个实际模型 LOD；真实资源只有 LOD0/1，另用准备边界输入验证 LOD0..3。新增 TerrainBlob、CameraKeyFrame 和 Parent 的普通构造与直接操作。完整原类／实例验收仍为 0。

## Beamo 和 BeamoDecal 上传

[beamo-geometry-runtime.ts](../src/core/beamo-geometry-runtime.ts) 恢复整个正常 `0x100197ab0` 上传函数，并接回原法线生成 `0x10045edf0/0x10045ee30`、次材质权重 `0x1001975c0` 和 OBB 距离 `0x10078ce10`。输入来自真实 Mesh、运行记录和已展开的 LevelData 烘焙记录，使用同一原对象／记录地址。

- 保存矩阵按原 float32 次序变换 XYZ；原 RGB 字节保留，alpha 融合原颜色与次材质权重。
- 原 bake remap 用于面积法线累积，不拿附加数据当作 remap。生成法线后保持第四字节未写状态。
- autoMoss 与按原顺序查询的 UnitCube 区域更新权重，保留原 32 OBB scratch 容量。
- 有烘焙时，加载 LOD＋16 的 `trisCulled` 每三角形一个字节：非零剔除。只压缩仍被保留三角形引用的顶点，再重映射索引。
- 每个保留顶点输出 48 字节：XYZ／颜色、法线、两组 half4 UV、加载 LOD＋8 的 12 字节光照。无烘焙使用实际原默认光照构造／编码输出 `ff0076ffff00038080ff8000`。
- 有次材质时，三个 alpha 字节之和大于 674 进入次材质索引区；1..674 同时进入主材质与 alpha 区；0 只进入主材质区。没有次材质时只写主材质区。
- 缺 `trisCulled` 保留原 `Beamo.cpp:475` 断言。真实 7,739 个 LOD 没有触发该断言；准备输入专门验证断言时的已有分配和未释放状态。

独立对照 8,379 组（640 准备输入＋7,739 真实 LOD）／717,931,744 字节零差异；共验证 2,912,317 次 RSQRTSS 能力输入。原上传、法线／权重、矩阵、OBB 距离和默认光照指令体不改写；scratch heap、导入 libc/libm 与区域虚方法为明确服务。全部输出顶点、三个索引窗口、调用方偏移、scratch 内容和 guard、分配／释放顺序、返回计数与断言 metadata 均比较。原执行文件 SHA 与逐图原文件 SHA 保存在 [独立上传对照](beamo-upload-oracle.json)，回归 fixture 在 `tests/fixtures/beamo-upload-native.json.gz`。

`RSQRTSS` 是独立数值能力。原对照记录了每次输入／输出位模式，并在 TS 重放时验证全部输入；直接 JS 平方根倒数有 769,485 次位模式差异。不能将 JS 替代算式当作原 Intel／Mac CPU 等价。生产原内核要求调用方显式提供能力；`beamoJsRsqrt` 仅是单独标明的编辑器算术服务。本次没有将近似结果自动用于原 Beamo 绘制。

原几何 ABI 准备窗口已扩容并隔离输入、区域 Barn、顶点、索引和 scratch，涵盖最大的原 v28 Mesh：顶点输出 2,929,776 字节、三个索引区 1,521,504 字节。此前全地图对照停在 1 MiB 工具窗口限制；真实输入已全部通过新的窗口。

## Barn 上传调度

[beamo-upload-barn-runtime.ts](../src/core/beamo-upload-barn-runtime.ts) 恢复 `Barn.Load 0x100195be7..0x100195f45`：发布运行记录球体字节，按全部 Mesh LOD 累加 uint64 顶点／索引容量，配置原 stream／索引格式，映射共享缓冲，逐 LOD 调用上传，写入每个 LOD 的范围／计数，递增四个 uint32 偏移，按原顺序 unmap／finish。

本段不按保存 `lodEnables` 跳过上传；接受判定的前两 LOD 规则仍独立保留。第三／第四 LOD 的实际上传和调用方范围布局有准备输入核验，不能把它们说成真实地图中存在的 LOD。

原 stream formats 为 `[3,28,24,32,32,28,28,28]`，attributes 为 `[1,2,3,5,6,13,14,15]`。每 LOD 在运行记录 `+0xfc + lod*16` 写四个偏移，在 `+0x13c + lod*16` 写四个结果计数。上传回调改变 table／count／LOD 数量或偏移时，保留原缓存地址及重新读取位置。

[调度对照](beamo-upload-barn-oracle.json)：123 准备输入＋33 图，共 156 组、16,241 次上传服务调用、473,649,840 字节零差异。真实部分使用上面独立原上传取得的 7,739 组结果计数；VertexData／buffer 和 upload 是明确服务。球体生成尚未接通，此段比较准备球体（含 NaN payload）的复制发布。全部 live Barn、两张运行表和 Mesh 字节比较；私有 loader 临时上下文不在比较范围。

## 基础类扩展

[scene-foundation-runtime.ts](../src/core/scene-foundation-runtime.ts) 新增三个非虚 Object 记录类，class ID 在＋0，普通构造不写伪 vptr。分配先于 Object metadata getter；class ID 从 getter 之后的 live metadata 读取。

| 类 | 已实现的原普通路径 | 尚未闭合 |
| --- | --- | --- |
| TerrainBlob：7,174 个 | 640 字节分配／placement；rail 指针及四个原标量初始化；GetTransform／GetObb；SetTransform→live 本地 OBB 矩阵乘法→世界 AABB | 缺字段 defaults/cache、shape／rail 本地 OBB 创建、Barn／生成器、地形／烘焙重建与生命周期 |
| CameraKeyFrame：987 个 | 144 字节分配／placement；原单位矩阵、fov 60、pan 和震动字段；四列 Get／SetTransform；独立 HotDate 标志 | TGCL default/cache、CameraSystem 注册／调度、实际事件消费与生命周期 |
| Parent：270 个 | 144 字节分配／placement；原字符串／内部数组清理；GetEnabled／SetEnabled 保留完整原 byte | 原父子跟随／relative／joints、Barn 排序更新、缺字段 defaults/cache 与生命周期 |

构造未写的 transform、enabled、对象指针或 padding 均保留原字节，不能从这些构造推断完整序列化默认值。没有保存 Parent enabled 的对象仅参加明确的准备 placement，不填猜测的启用值。

TerrainBlob 世界 AABB 按原 16 个角点更新、逐条 float32 舍入，保留 MIN/MAX signed-zero ties 和 NaN 候选保留旧边界。原 min／max 常量第四分量均为 **0**，不能将全四分量初始化为 ±1e9。矩阵和 local OBB 读取／复制顺序保留对齐 alias 的原结果。

[基础类对照](scene-foundation-oracle.json)：16,924 组、69,862,272 字节零差异，含全部保存 TerrainBlob／CameraKeyFrame 矩阵的取写调用和全部 Parent 对象的对应准备调用。局部 OBB 是明确输入，尚不代表从真实 shape 生成的 OBB。两个 endpoint 供后续逻辑直接消费同一 live 地址，不使用编辑器矩阵冒充原加载对象。

## 验证与后续

新增几何／调度／基础类原 fixture 回归，全项目 404 项测试通过，类型检查与构建通过。逐类与逐实例清单保留完整类／实例 0；基础核心子链进展单独更新，不计为整个原游戏恢复率。

模型链仍需闭合 ResourceRef／Observe／完整 Barn.Load、原运行 OBB 生成／碰撞、合并材质／Renderable 绘制、Visibility、裙边及依赖释放；LevelMesh→Model 构造→＋0x228 绑定和完整 LevelData IO／原重新烘焙生成器继续推进。基础类下一段优先公共 factory／defaults cache／Barn 加载顺序及 TerrainBlob 生成依赖、CameraSystem、Parent 跟随；环境类和后续逻辑继续共用原对象与资源接口。

更新开发源码／构建文件，不重打 release，不修改 reference／原地图数据。原 Metal 与 Windows 真机仍未验收。
