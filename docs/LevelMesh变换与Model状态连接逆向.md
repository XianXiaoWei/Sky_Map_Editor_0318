# LevelMesh 变换与 Model 状态连接

本轮将 LevelMesh 的原构造、变换、启用、OBB 和 GUID 接到 TransformObject→原单 Event 分发→ObjectFactory 反射链；同时恢复被转发调用的 Model 普通/延迟变换与启用状态方法。代码见 [LevelMesh 内核](../src/core/level-mesh-runtime.ts)，地址、虚槽和布局见 [原证据](level-mesh-native.json)。

原执行文件 SHA256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。

| 核验 | 结果 | 范围 |
| --- | --- | --- |
| [LevelMesh 独立原机器码](level-mesh-oracle.json) | 16,699 组 / 138,058,444 字节 / 零差异 | 全部 4,133 个真实 LevelMesh 的保存矩阵与 GUID，各四个有限接口样本；167 组合成构造、Model、反射、OBB、别名、特殊位模式 |
| [TransformObject→LevelMesh→Model](transform-object-level-mesh-oracle.json) | 887 组 / 8,322 快照 / 636,011,224 字节 / 零差异 | 全部 317 个真实 TransformObject 根配置，另含 192 个有/无 Model、普通/延迟 Model、普通/continuous、smooth/reverse 和变换分量组合 |

两份报告合计 17,586 组、774,069,668 字节，覆盖范围不同，不能把两份语料合并当作独立真实对象数。每个原动作比较全部核验器分配内存（含完整 LevelMesh 和所需的 1,024 字节 Model 状态区）；连接核验也比较矩阵堆、Event 状态及 Barn 序列计数。测试 fixture 用 SHA256 压缩完整输出。

| 317 个真实根配置的首次结束位置 | 上轮 | 本轮 |
| --- | ---: | ---: |
| 跑完设定有限序列 | 91 | 250 |
| 核验器未接入的目标/完成事件类 | 198 | 12 |
| 动作前音效依赖阻断 | 28 | 52 |
| 动作前真实 Timeline 依赖阻断 | 0 | 3 |

前置依赖阻断时，该次原 Update 未执行。音效/Timeline 阻断增加，是因为已越过此前的 LevelMesh 类边界。12 个剩余片段涉及 LensFlair、CandleObject、Star、PlayAnimation，以及尚未在此核验器连接的 TransformObject/Delay/IfInRegion/SetForce 完成事件；“未接入”不表示仓库里这些类都没有已核验子链。

真实配置中的 422 个局部 LevelMesh 端点保留源节点关联、保存矩阵、enabled 与 GUID，并构造为明确准备的加载前状态（Model 指针 null）；它们不是已完成原资源加载后的 Model 实例。192 个合成连接样本提供 Model 字节状态，执行原 Model 方法，没有替换转发算法。**250 个片段通过不是 250 个实例完整游戏验收**，完整原类/实例仍为 0。

原 LevelMesh 本体为 `0xa60`（2,656）字节。正常构造写初始状态、字符串和 16 个内嵌 shader 参数体/指针；transform、GUID、enabled、Model 指针等未写字节必须保留调用者分配内容。注册表/类型 ID 为显式服务；完整注册、缺字段默认缓存和异常 unwind 尚未闭合。

| 原行为 | 地址 | 状态连接 |
| --- | --- | --- |
| LevelMesh SetTransform | `0x1003ffe10` | 先四次 16 字节复制到本体 `+0x10`，有 `+0x228` Model 再转发同一输入 |
| LevelMesh GetTransform | `0x100402ab0` | 有 Model 时按其 `+0x32e` 选择 `+0x160` 或 `+0x240`；null 时返回本体保存矩阵 |
| Model SetTransform | `0x100463750` | 普通写 `+0x160` 并置 `+0x225`；延迟写 `+0x240` 并置 `+0x280`，保留普通矩阵 |
| LevelMesh SetEnabled | `0x1003ffe50` | 写本体 `+0xd0`，转发 Model；false 置本体 `+0xa55`，再次启用不清此标记 |
| Model SetEnabled | `0x1004636d0` | 写 `+0x228`；false 另清 `+0x227` 与 `+0x3c0` |
| LevelMesh GetEnabled | `0x100402a80` | 有 Model 读取 **可见字节 `+0x227`**；null 才读本体 enabled。重新启用不会立即改回可见状态 |
| Local / World OBB | `0x100402b10` / `0x100402b60` | local 来自 Model `+0x120`；world 经原变换与 OBB 相乘 |
| BstGuid | `0x100402bc0` | 原虚槽 `+0x30` 读取本体 `+0x50`，保留 uint32 位模式 |

GetObb 原函数直接解引用 Model；null Model 在核验器动作前停止，内核抛显式依赖边界，不能将其虚构成原断言或返回单位 OBB。24 个独立原反射参数个数断言与 2 个 null Model OBB 前置阻断分列；连接报告另有 5 个原 TransformObject 断言、12 个类边界和 57 个前置依赖阻断（真实 55、合成 2）。

四次矩阵复制按原顺序保留前向重叠语义；不能改成一次无重叠假设的批量复制。LevelMesh/Model setter 没有 Marker 的 NaN 验证，原 SNaN/QNaN/Infinity/signed-zero 位模式直接复制，不借用 Marker 的分解/归一化算法。原反射 wrapper 的虚成员指针、this-adjustment、参数个数和转换调用已对照。

BstBaked 此轮补上 LevelMesh GUID 的原虚方法来源及 Model 状态连接；已有 GUID 查找/部分绑定证据继续有效。完整资源加载、Model 指针绑定、BstBaked 五段装载、LOD/照明展开、动画、延迟提交、绘制、Visibility/Skirt、碰撞及卸载仍待闭合。Avatar 本轮没有新增完整运行验收。Linux cosf/acosf/sinf 在连接核验中仍是显式位模式回放服务，不宣称等于原 macOS libm。

复现：

```sh
python3 tools/reverse-level-mesh.py /path/to/Sky
SKY_DATA=/path/to/Data npx tsx tools/level-mesh-oracle.ts /path/to/Sky
SKY_DATA=/path/to/Data SKY_TRANSFORM_LEVEL_MESH=1 npx tsx tools/transform-object-oracle.ts /path/to/Sky
npx tsx --test tests/level-mesh-runtime.test.ts tests/transform-object-level-mesh.test.ts
```

本轮检查与同步见 [核验记录](level-mesh-verification.json)。
