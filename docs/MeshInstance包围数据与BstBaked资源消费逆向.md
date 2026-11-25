# MeshInstance 包围数据与 BstBaked 资源消费连接

本轮完整恢复 `0x10045f880` 网格实例初始化，以及 `0x10045fa00` 模型网格资源消费者，接上原完整 GUID 查找。它们执行原函数本体，不再只在顶点数量门控片段处返回。实现见 [model-baked-runtime.ts](../src/core/model-baked-runtime.ts)，证据见 [model-baked-native.json](model-baked-native.json)。

| 原机器码对照 | 结果 |
| --- | ---: |
| 全部样本 | 12,069 组，零差异 |
| 实际比较输出 | 100,345,752 字节 |
| 全部 Mesh v28 资源 / LOD | 1,152 / 1,231 |
| 扫描地图 / 有烘焙记录地图 | 33 / 32 |
| 全部序列化烘焙 GUID 快照 | 10,653 |
| 完整初始化 / 消费调用 | 1,381 / 10,688 |
| 原断言 / 合成诊断样本 | 30 / 15 |

[原报告](model-baked-oracle.json) 比较每个动作后全部 8,192 字节核验器状态、资源类型/查找/观察/释放服务顺序、原诊断文本与原断言。额外 847,316 字节为独立 AVX 双 NaN 探针输出，仅作显式算术输入服务，未计入比较字节。fixture 对完整输出内存先直接比较，再以 SHA256 压缩。

资源消费者先清输出前 21 字节，再观察 Mesh。查找失败会请求资源，但没有观察引用即触发 `Mesh.h:109 Observed()` 原断言，不能把请求视为已经载入。随后观察 LevelData，按非负载入索引和线性首次 GUID 查找记录。兼容规则仍只比较**资源 LOD0**与记录首个已展开 LOD 的顶点数量，不随所选 LOD 改变。兼容时初始化两次；不兼容时先初始化，再输出含 signed GUID 的原失败信息，最后再次无烘焙初始化。正常出口先释放 LevelData 引用，再释放 Mesh 引用；原断言不执行这些正常出口调用。

网格实例使用 `0xb0`（176）字节输出。原函数保留调用者未写的 padding，先写 data / LOD index，再进行 signed LOD 断言，通过后写 baked record。首包围球中心是两个端点分别乘 0.5 后相加；半径按 `sqrt(z² + (x² + y²)) * 0.5`。第一 OBB 来自首组端点；第二 OBB 来自 LOD 的 `+0x1c/+0x28` 端点，中心则按先加后除 2。原内存重叠和写入顺序保留，第二组输入在第一组输出写入后读取。

[Mesh v28 读取器](../src/core/resources.ts) 现在保留此前跳过的第二组包围数据 `secondaryBounds`。原 LOD reader `0x100455e90` 明确从文件分别读取 `+0x1c/+0x28` 两个 12 字节向量；小于 v28 的回填分支仍不在现有 parser 支持范围。本轮全 1,231 个实际 LOD 的两组文件端点进入原初始化核验。

NaN/Infinity/signed-zero/subnormal 与有限溢出按位核验；两个不同 NaN 的选择是显式独立 AVX 探针服务，核对操作与两个输入位模式，不宣称 QEMU 选择规则等于 macOS 或真实硬件。非默认 MXCSR、异常标志及 unwind 没有恢复。

10,653 条记录来自全部原序列化记录。核验器按原资源名准备资源快照，首个展开顶点数沿用已有 bake audit；不是原资源管理器实际载入结果。10,635 条跑到正常有烘焙输出，18 条触发缺 Mesh 原断言。18 条缺资源记录并不等于 61 条尚未关联到 Objects 的记录；后者继续保留，不能擅自关联。ResourceRef 创建/观察/析构、资源管理器注册/请求、metadata 与 libc++ 诊断流内部仍为显式服务。

## 下一段真实连接

已确认原路径：

`LevelMeshBarn.Load 0x100400180` → `LevelMesh.Load 0x100400ed0` 等待 Mesh `+0x108` → `LevelMesh.Create 0x100401040` → baked `ModelBarn.Create 0x10046ca30` 或 unbaked `0x10046c700` → `Model.constructor 0x100467330` → `MeshInstance.consumer 0x10045fa00`。

`0x100401d40` 把创建返回值写入 LevelMesh `+0x228`，才是实际 Model 指针绑定位置。ModelBarn baked 创建使用 `0x3e0` stride、`0x400` 个池槽，并调用 Model constructor。新增这些完整反汇编用于依赖研究，**尚未将它们计作已恢复或完整执行通过**；上一轮 1,024 字节 Model 状态区也不代表这次已经建立完整 Model allocation。

Objects 核心子链仍 26 类，856/2830（30.25%）仍仅为类清单比例。BstBaked 五段完整资源装载、无效 GUID 改写、Model/LevelMesh 创建绑定、GPU 属性提交、动画/绘制/卸载与 Avatar 完整物理/相机/生命周期继续推进；完整原类和实例运行验收仍为 0。验证与源码同步见 [本轮记录](model-baked-verification.json)。

复现：

```sh
python3 tools/reverse-model-baked.py /path/to/Sky
SKY_DATA=/path/to/Data npx tsx tools/model-baked-oracle.ts /path/to/Sky
npx tsx --test tests/model-baked-runtime.test.ts
```

后续 [ResourceRef原链表连接](ResourceRef链表与模型资源消费连接逆向.md) 已用原构造/观察/正常析构/cleanup替换本轮引用整体服务。基础报告单独保留；资源虚回调内部与实际管理器仍是明确依赖。
