# Rail 缓存、求值与风场调用链

33 张地图共 402 条 Rail，全部控制点引用均指向字段完整的 Marker。原版缓存、位置/尺度样条、最近点和轨道变换已恢复到独立核心，风场可直接调用缓存；对象视图辅助线采用原位置样条，控制点编辑后重新生成。完整 Objects 生命周期和主视口风场尚未接入。

| 检查 | 用例 | 有效 float32 分量 | 结果 |
| --- | ---: | ---: | --- |
| Marker getter／缓存／尺度／转角展开 | 658（含 402 条实际 Rail） | 126,730 | 原函数逐位一致 |
| 位置／尺度／最近点／矩阵／线段距离 | 1,586（含全部 402 条 Rail） | 44,408 | 原函数＋记录的 sincosf 返回值逐位一致 |
| Wind → 最近点 → 轨道矩阵 → 风采样 | 1,638（含全部 26 个引用 Rail 的 Wind） | 6,552 | 原函数连续执行逐位一致 |
| 弧长采样／完整表／双向转换／懒重建状态 | 594（含全部 402 条 Rail） | 249,514 | 有效查询与原函数逐位一致；20 个异常距离查询另列 |

缓存检查包含 5,510 个控制点。求值检查包含 1,202 个实际地图查询；四个额外端点查询选中退化线段，未执行不安全的原缓存索引路径，具体地图、节点和位置保留在报告。此结论不代表退化查询或整个 Rail 生命周期已还原。

## 原地址和输入

| 原函数 | 地址 | 已核验范围 |
| --- | --- | --- |
| Marker GetTransform | `0x10043e2d0` | 四元数矩阵各轴归一化，再应用尺度 |
| Marker GetObb | `0x10043e470` | 原 diag(.5,.5,.5,1) |
| Object GetScale | `0x1004d2260` | GetTransform × GetObb，各轴 xyz 长度 |
| Rail 缓存重建 | `0x10055cf30` | 非空已分配点缓存、selfUpdating=false |
| 控制点相对转角 | `0x10078a710` | 原 SIMD shuffle／投影／atan2f 参数 |
| 标量样条 | `0x1005609d0` | 尺度、转角曲线 |
| 位置样条 | `0x10055e420` | xyz；SIMD scratch W 不比较 |
| 快速线段平方距离 | `0x100789ac0` | 投影分支及原抵消运算 |
| 最近点 | `0x10055d820` | 线段选择、16 次采样、一次切向修正 |
| 轨道矩阵 | `0x100560b40` | 朝向、转角、位置、尺度、两次原矩阵乘法 |

Rail 的 dataPoints 指针位于 +32，计数 +40，looped +44，selfUpdating +64，enabled +65，transform +80。缓存位置在 +0x90，三个尺度曲线在 +0xa0／+0xa8／+0xb0，转角曲线 +0xb8。

缓存直接读取控制点世界位置，并将 Object GetScale 的结果相加自身后存入三个尺度曲线。求矩阵时再乘 .5；Marker 的 GetObb 原本也是 .5 对角矩阵。不能把这些中间步骤简化成读 scale 字段，否则会改变负尺度、非单位四元数和 float32 舍入。

缓存的连续转角逐项展开：`d = current-previous`，减去 `floor((d+π)/(2π))*2π`，再加到 previous。π 和 2π 都使用原 float32 常量，每一步按原指令舍入。

## 样条和最近点

三次位置样条为 Catmull–Rom，保留原每一步 float32 运算。开轨 clamp 到 0..1，共 N−1 段；闭轨 fmod 后将负参数加 1，共 N 段。开轨端点相邻控制点重复，闭轨按原索引规则环绕。标量函数以 `-5*p1` 相加，向量函数以 `5*p1` 相减；实现按各自指令顺序保留。

最近点先遍历直线段的平方距离，相同距离选择后出现的段，初始距离为 1e9。投影触及开轨最外端点时直接返回。其余情况下以投影参数为中心，半径 `.25/segments`，做 16 次中点采样；每次先取参数小数部分，开轨也执行这一步。严格更小距离才更新最优项。随后以导数做一次切向修正，按原顺序连续除以导数长度、长度和段数，再比较候选平方距离与原最优距离开方后重新平方的值。

轨道矩阵使用 transform 的第二轴作为参考 up，切线的负方向作为第三轴，交叉得到其余轴，再绕正切线应用转角。原端点近似测试读取传入参数，闭轨也没有先环绕该测试参数。旋转后执行 translation × basis × scale 两次完整矩阵乘法。

首轮检查暴露了叉积归一化的求和次序错误。原 SIMD 中间向量为 `[y,z,x]`，其 lane 顺序求和换回语义 xyz 后是 `(x²+y²)+z²`。修正后全部正常输入通过；[首轮失败证据摘录](rail-initial-cross-order-failure.json)另存。

## 精度、运行与未完成项

缓存的 JavaScript atan2 与当前 Linux atan2f 对照全部一致。轨道变换的 JavaScript sincos 对 1,586 组测试有 12 组差异，连续 Wind 调用有 4 组差异。报告保留完整失败输入；使用记录的原 Linux libm 返回值时，算法运算逐位通过。macOS libm 尚未核验。

缓存 oracle 仅将通用元数据 GetTransform／GetObb 分发明确绑定到原 Marker 函数，Marker、Object GetScale、矩阵乘法、转角和缓存函数本身执行原指令。Wind 调用链不替换 Rail 求值函数。实际 Wind 的 timer 是明确运行快照（设为该节点 fadeTime），不能据此推断默认初始化、启动事件后的 enabled 或最终风场。

待恢复：通用 Object 元数据分发，构造和原加载/注册次序，selfUpdating 的位移累计及自动弧长表失效，动态点删除/空引用，MoveObjectAlongRail 的参数推进，事件/销毁/切图，退化查询和极小负闭轨参数的原越界行为，macOS 数学库与完整游戏验收。

实现：[rail.ts](../src/core/rail.ts)、[rail-level.ts](../src/core/rail-level.ts)、[environment-wind.ts](../src/core/environment-wind.ts)。报告：[缓存](rail-cache-oracle.json)、[求值](rail-oracle.json)、[风场调用链](wind-rail-oracle.json)。三个重建入口分别为 `npx tsx tools/rail-cache-oracle.ts`、`npx tsx tools/rail-oracle.ts`、`npx tsx tools/wind-rail-oracle.ts`。所有 oracle SHA-gate 原 executable，不修改 reference。

实际对象检查适配器已读取全部 402 条轨道，生成 47,026 个有限位置采样点，见 [rail-inspection-corpus.json](rail-inspection-corpus.json)。本阶段 131 项回归测试、TypeScript 和构建通过。

弧长表采样、构建及双向转换已实现于 [rail-arc.ts](../src/core/rail-arc.ts)，594 组原函数检查覆盖全部 402 条地图轨道。原分配 `0x10055cc60` 将表大小设为控制点数量 × 16；构造的默认细分数为 16，地图载入 `0x10055bc50` 显式以 32 构建。`0x10055c6a0` 连续累加参数，而非每次用 i×step；`0x10055b560` 的首项是 (1/size, 累计距离)，没有额外 (0,0)。两种查询都在 dirty 时以 16 细分懒重建；表、长度、细分数与 dirty 状态均逐位核验。自动分配、Barn 载入分发和动态位移失效仍仅定位。

原距离→参数函数先按旧 totalLength 限制／环绕距离，再重建。20 个测试快照的旧端点超过重建后末项：原线性扫描没有逐项容量检查，随后还有 macOS 日志／断言路径。oracle 用原函数构建的预检表记录并跳过这 20 次不安全扫描，仍核验对应轨道的完整表和参数→距离懒重建；核心保留原重建状态后显式抛错，不伪造端点返回值。见 [弧长报告](rail-arc-oracle.json) 与 [首轮原函数崩溃证据](rail-arc-native-failure-1794809250737.json)。负零经原整数转换后为正零，已修正 JS Math.trunc 保留负零造成的差异；85 组初轮差异另存于 rail-arc-oracle-failure 文件。重建入口：`npx tsx tools/rail-arc-oracle.ts`。

辅助线视口检查通过固定烘焙属性显示验证：Dawn 线条开关、Marker／Rail 辅助线、选中对象外框和聚焦，无资源修改。旧脚本早帧／动画／包围盒持续刷新比较的失败报告保留。包围盒改为边界变化时更新；400 次独立更新和最终实际视口检查确认，静止时不增加几何版本或提交帧，移动后正常更新。最终报告见 [viewport-overlay-smoke.json](viewport-overlay-smoke.json)。
