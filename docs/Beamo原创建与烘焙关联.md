# Beamo 原创建与烘焙关联

这一阶段补上 Beamo／BeamoDecal 的原池创建、加载第一轮运行记录、独立烘焙接受规则，以及卸载和普通析构控制流。完整绘制和依赖生命周期仍待恢复，完整原类／实例验收保持 0。

## 原对象、运行记录与烘焙

两类共享 `BeamoBarn.Load`，使用各自分支。Beamo 位于 Barn＋16、步长 192、最多 512；BeamoDecal 位于 Barn＋0x18010、步长 128、最多 256。运行记录步长 384，表指针在 Barn＋0x20020。

加载第一轮 `0x1001950da..0x100195330` 清空运行记录，写入原对象地址。记录＋8 指向原对象；＋0x10 指向 Beamo，对 Decal 则为 null。主材质在＋0xd8，次材质在＋0xe0。已恢复的 `LevelModelBarn` 原 GUID 首匹配规则参与这条链。Beamo 主材质在这一轮允许为 null；请求的次材质缺失在 Beamo.cpp:590 断言，Decal 主材质缺失在 :603 断言。

Decal 的正 `disableDist` 保留；零、负数和 NaN 改用原常量 `0x7f7fffff`，即 float32 最大值。Beamo 的运行碰撞字节来自传入 LevelData＋13 与 1 异或，保留原非规范布尔字节；autoMoss 保留原字节。

烘焙接受范围为 `0x100195427..0x100195678`。先按原 GUID 首匹配并检查 LOD 总数，再执行各自的选择：Beamo 检查保存的前两个 `lodEnables`，Decal 检查前两个存在的 LOD。**原检查加载 LOD＋16 的附加数据指针，不能替换为＋8 的光照指针。** 所选 LOD 的展开顶点数必须相等。Beamo 非正距离复制原 Mesh v28 LOD header 的首个 float；NaN 距离保留。最终接受记录写入运行记录＋0x20，所选范围写入＋0xb8。

`ResourceMeshLOD.lodDistance` 保存此前丢弃的原 LOD 距离。同步资源查询和 scratch ABI 属于编辑器准备服务；没有生成新的光照烘焙，也没有分配替代 Model。

## 创建、卸载与互动

原 placement、Barn.Initialize、CreateBeamo、CreateBeamoDecal、Changed、GetTransform 和 SetTransform 已恢复普通路径。Beamo 创建保留旧 slot 字节；Decal 创建先清空全部 128 字节。计数在 metadata 服务之前递增，Create 最后写入 Barn 指针。placement 不写 transform、GUID 和 Barn 指针；未写字段保持原字节。

SetTransform 只复制四列矩阵；Changed 才设置同一 Barn＋12 的 dirty 字节。`OriginalBeamoEndpoint` 操作 live 原对象地址。组合检查连接原池创建→运行记录→烘焙选择→同地址变换／Changed，确认对象地址和烘焙指针不被替换；这是内核组合检查，不是完整地图启动。

整个 Barn.Unload 控制流 `0x100194a90` 已转述：先重置 VertexData，再按原计数重置 Renderable，随后释放需要的碰撞实例，最后虚调用 Beamo／Decal 析构并清空两个对象计数。碰撞释放后重读 loadedCount；跳过释放时保留上次缓存计数。运行表指针逐轮重读。原函数保留 loadedCount、Renderable count、runtime pointer 和 dirty 字节。普通非删除析构保留长字符串指针读取→allocator getter→free 顺序。VertexData、Renderable、CollisionGeo、虚析构与字符串释放仍通过明确 ABI 服务完成，不能据此宣称这些依赖的完整原实现已恢复。

## 证据与实际编辑器检查

| 原程序对照 | 范围 | 结果 |
| --- | --- | --- |
| [创建与变换](beamo-runtime-oracle.json) | 239 准备输入＋7,150 个真实 transform | 7,389 组，2,305,368 字节零差异 |
| [加载第一轮](beamo-record-oracle.json) | 155 准备输入＋全部 7,150 个对象的保存材质／autoMoss／距离输入 | 7,305 组，3,093,792 字节零差异；真实输入字段缺失数 0 |
| [烘焙选择](beamo-bake-oracle.json) | 1,400 准备输入＋全部 7,150 个对象 | 8,550 组，35,029,350 字节零差异 |
| [卸载与析构](beamo-unload-oracle.json) | 48 卸载＋24 析构，包含回调改计数／替换表和最大池容量 | 72 组，11,662,848 字节零差异 |

原程序 SHA256 固定为 `3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。烘焙对照只排除 private stack slot 内 upper EDI 的 3 个 caller-clobbered 字节，低 predicate 字节和全部对象／record／计数／距离仍比较；卸载对照只归一化准备服务的栈 vtable 地址。各报告逐项保留边界。

[33 图关联审计](beamo-bake-bindings.json)：10,653 记录、11,311 LOD，18 失效资源 GUID、36 清空 LOD、11,275 成功展开 LOD。LevelMesh 4,133 个中 3,071 满足原接受条件；Beamo 6,598 中 6,595；Decal 552 中 552；CloudCard 356 中 356。这是接受条件和资源依赖数量，不能当作完整绘制数量。

[实际 Electron 检查](beamo-environment-map-smoke.json) 已通过 Dawn #23 Beamo 与 #47 BeamoDecal 的 IPC／“查看烘焙关联”按钮，检查 GUID、LOD 光照／附加数据和材质对象链接；原 Objects／BstBaked 哈希保持。Infinity／NaN 距离以文本和原始 `distanceBits` 保留，避免 JSON 变成 null。截图为 [实际界面](beamo-environment-Dawn-inspector.png)。Beamo 在视口的完整原 shader 绘制尚未接通。

## 下一段

新增整个正常 LOD 上传／法线／区域权重／trisCulled 压缩和 Barn 全 LOD stream 配置／范围调度，及 TerrainBlob、Parent、CameraKeyFrame 的普通构造／直接操作，见 [全 LOD 上传与基础类推进](Beamo全LOD上传与基础类推进.md)。继续完整 Barn.Load 的资源 Observe、运行 OBB／collision、合并材质绘制、Visibility 和 skirts；完整 LevelMesh→Model ctor→＋0x228 绑定、LevelData 多层 IO／卸载和原重新烘焙生成器仍需推进。基础类继续公共 factory／defaults cache／Barn 加载顺序／ResourceManager／GameTime，以及这些新类的完整消费；环境完整生命周期之后扩大逻辑类，共用同一原对象接口。
