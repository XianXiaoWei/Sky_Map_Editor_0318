# Beamo 包围盒、材质分组与 Parent 池推进

本轮继续用户指定顺序：先补 Objects 模型调用与 BstBaked 消费链，基础类扩大到 ParentBarn 的池生命周期；完整环境与更多逻辑沿已有共享接口后续推进。此次没有把任何类或实例升级成完整原游戏实现。

## 原 Beamo 运行记录与碰撞输入

`beamo-spatial-runtime.ts` 恢复 Barn.Load 连续区间 `0x10019579b..0x100195bc5`。从已解析 Mesh 第一 LOD 读取 min/max XYZ，调用原 GetTransform 后重新读取运行表和当前 Beamo 指针，写 384 字节记录中的对象矩阵、世界 OBB、球体半径、第三禁用距离，以及碰撞描述符、颜色、回调、注册返回实例。

原球体归约保留 `(x²+z²)+(y²+w²)`，每步 float32。中心是 `(min+max)*0.5`，第三距离默认计算保留 `float32(66.666664*radius)` 后自加的两步；NaN 距离保留原 bits，启用字段非零或 NaN 选原距离，零选 float32 max。Decal 的运行距离保留此前第一轮结果。私有 min/max W lane 是 caller 明确准备值，未猜生产调用栈内容。

碰撞材质原 `0x10077d4b0` 调三次 powf 后保留 alpha bits，颜色缩放使用原 255 常量；SSE clamp/truncate 与回调材质 override 两个 byte 均保留。描述符有效长度为 **56 字节**，末尾另外 8 字节保留此前矩阵内容；没有擅自清零整个 64 字节。烘焙接受时照明指针来自已加载 bake 第一 LOD 的 +8，CollisionGeo.Register 的参数和返回写回使用同一原运行记录。

`beamo-spatial-oracle.json`：7,504 组＝354 准备＋33 图全部 6,598 Beamo 和 552 Decal，130,924,672 字节零差异；7,147 独立接受烘焙，真实字段缺失 0。原区间、原 Beamo GetTransform、矩阵乘法和颜色转换直接执行。20,151 powf 调用的输入/输出 bits 单独保存并回放，直接 JS Math.pow 有 3 次不同；此能力来自 Linux libm，不算原 macOS libm 验收。6,717 注册调用包含 6,598 个真实对象对应的**准备碰撞输入**；geometry ID、owner、LevelData 标志、资源观察以及完整注册/空间索引内核仍是明确输入或服务。

## 材质分组与释放

`beamo-material-groups-runtime.ts` 恢复 `0x100195f89..0x100196094`。原临时表含 6×材质数个 int32，region 0 为普通主材质、1 为 Decal 主材质、2 为次材质、5 为 Alpha。逐记录按原首次遇到顺序分配 render group，写 `+0xe8/+0xec/+0xf0`；次材质 null 时保留原次索引。最后严格断言 renderCount <16，达到16也失败，uint32回绕行为不另改。

`beamo-material-groups-oracle.json`：276 组＝243准备＋33图全部7,150对象对应记录，289,409,184 字节零差异。地图投影明确准备 Beamo 后接 Decal、序列化材质 ordinal，尚不是实际 loader 注册顺序证明。后续 shader/RenderList/Renderable/纹理和 GPU 合并绘制仍未恢复。

`collision-geo-runtime.ts` 恢复整个正常 `CollisionGeo.Remove 0x100779200`，保留原 unsigned byte 范围断言、三次空间索引解除服务、实时 ushort/owner/count 读取、查找首匹配、末尾交换与 free-list 归还。原范围判断允许部分非对齐地址，未额外加对齐规则。查找失败在服务调用之后断言，inactive 尾槽仍保留已移除指针。

`collision-geo-remove-oracle.json`：77 准备组、80,754,524 字节零差异。三次底层索引解除仍为服务，未把池准备对象当作真实物理实例。

同地址组合检查使用 `prepareOriginalBeamoSpatialRecord` 生成同一记录的球体/OBB/碰撞实例，交给现有 `uploadOriginalBeamoBarn` 发布球体并写两个 LOD 范围，再写材质索引，最终原 Unload 调上述移除内核。upload/VertexData/注册/底层索引/析构是明确服务；完整几何上传另由上一轮全部 7,739 真实 LOD 原对照保证。组合检查没有重新宣称完整游戏主链。

## Parent 基础池生命周期

`parent-barn-runtime.ts` 恢复 ParentBarn Reset、Create、Release、ReleaseAll、HotDate、FindByTarget 与 Parent ReleaseNodes 的整个正常入口。128 槽×144 字节，首槽 +16，free-head +0x4810，update count +0x4c18，dirty +0x4c1c，node pool +0x4c20。Create 先推进 live free-head，后构造 cached slot；enabled、跟随目标保留。Release 保留 jointName 描述符/目标并清 enabled/activity，解除全部五个 node（含 null），使用实时 free-head 归还。Reset 按倒序释放长字符串并重建全部槽，保留 dirty/原描述符和未写字段。FindByTarget 包含 inactive 槽，不自行筛 enabled。

`parent-barn-oracle.json`：639组＝99准备＋270真实 Parent 对应的540准备创建/释放调用，21,297,516 字节零差异。真实保存 enabled 和 jointName 短/长分类参加准备；字符串内容/真实引用和实际地图池注册仍未恢复。元数据、reset bootstrap、字符串allocator/free及底层 node removal为明确服务。原同地址 ParentEndpoint 创建→enabled→释放→查找→复用通过，未完整恢复依赖排序、joint生成或跟随更新。

## 验证及交付边界

新增两份测试覆盖全部原 snapshot 重放、原 powf 输入核对、颜色 alias、Beamo同记录组合和Parent同地址复用。源码/evidence/oracle/fixture、逐类和逐实例清单、dist增量同步；最终测试/构建与原文件哈希见 `beamo-spatial-parent-verification.json`。

继续优先原 ResourceRef/Observe 和完整 Barn.Load、Beamo shader/RenderList/Renderable/材质合并绘制/Visibility/skirts；LevelMesh→原Model ctor→+0x228、完整LevelData IO/卸载/重烘焙生成器。同时基础公共factory/default cache/Barn启动、TerrainBlob生成、CameraSystem与Parent排序/joints/follow继续闭合，环境启动/parser/probe/lifecycle后扩大逻辑类。完整类/实例验收仍0；Windows硬件/原Metal仍未验收。
