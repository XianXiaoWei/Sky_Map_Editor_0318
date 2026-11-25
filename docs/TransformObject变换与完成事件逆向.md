# TransformObject 变换与完成事件

原 Sky 0.3.18 SHA256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。

本轮贯通 TransformObject 的原构造、加载、起始快照、启用、恢复、停止、普通/连续变换和完成事件，并接到原单 Event 分发及 ObjectFactory 矩阵/启用反射。代码见 [变换内核](../src/core/transform-object-runtime.ts)、[对象矩阵反射](../src/core/object-transform-runtime.ts) 和 [原 Event 分发](../src/core/event-barn-runtime.ts)。这是一条有明确服务边界的有限运行子链；编辑器完整场景、全部目标类及 Avatar/BstBaked 生命周期尚未闭合。

[原机器码核验](transform-object-oracle.json)：695 组、5,102 个完整内存快照、380,591,888 字节，零差异。每次动作之后比较全部 65,536 字节对象/堆/输入状态和 EventBarn 序列计数，最后再次比较完整状态；fixture 保存 SHA256 以压缩回归数据。注册表与保存字段为显式准备的输入，本轮没有重新执行整份 TGCL 装载。

| 核验结果 | 数量 | 范围 |
| --- | ---: | --- |
| 跑完设定有限序列 | 462 | 包含 91 个真实根配置；不表示完成整类或完整依赖图 |
| 原断言 | 5 | target 缺失、目标数不符、负 delay、null 成员、Timeline 节点缺失 |
| 未恢复目标类边界 | 198 | 到 AsClass 服务立即停止，保留原类名，不代入 Marker |
| 动作前依赖阻断 | 30 | 音效 29（真实 28、合成 1）、stepped 1；该次 Update 未执行 |

真实语料覆盖全部 317 个 TransformObject：普通 290、continuous 27、stepped 全部关闭；159 个 smooth、24 个 twoPhase、6 个 gotoCurrentTargetTransform、9 个非零 staggeredDelay、52 个 playDragSound 和 3 个 Timeline。52 个音效配置中，一部分在到达音效 Update 之前已遇到未知类，因此阻断分类以实际首次停止位置为准；3 个真实 Timeline 配置均先停在未知类处。所有配置只是各自一个有限片段；未知依赖以外的其他实际行为仍需后续验收。

[地址与布局](transform-object-native.json) 和 [原反汇编](../evidence/transform-object-Update.asm) 包含可复查证据。TransformObject 本体为 216 字节；原 placement 仅写明确字段，其他字节保留分配内容，不能把测试输入初值当作已恢复的注册默认值。注册函数边界包含后续 RotateObject 注册，字段依据 `native-properties.json` 的 TransformObject 条目区分。

| 原入口 | 地址 |
| --- | --- |
| placement / sizeof | `0x1006d94c0` / `0x1006d93e0` |
| OnLevelLoad / OnStart | `0x1006d5d80` / `0x1006d6090` |
| OnEnable / OnStop | `0x1006d6370` / `0x1006d62e0` |
| Update | `0x1006d6380` |
| GetResumeEnabled / OnResumeEnabled | `0x1006d9150` / `0x1006d9160` |
| destructor | `0x1006d9240` |

OnLevelLoad 分配原对象/目标矩阵数组；continuous/stepped 在此捕获初始变换，普通模式在 OnStart 重捕获。OnStart 也捕获目标快照。原 firstUpdateSkip 会跳过首次 Update；OnStart 不自行清零 elapsed 或重新跳首帧。gotoCurrentTargetTransform 使用起始快照，否则每次查询目标当前变换。

普通路径保留全局 cosine 平滑及随后每目标 quintic 平滑，两层不可合并。quintic 夹到 `[0,1]`，精确零必须保留。所有有限 SSE 加减乘除、sqrt 与归约按原顺序逐操作 float32 舍入；旋转采用最短路径 slerp，组装矩阵的 quaternion 轴不会采用 Marker GetTransform 的轴归一化替代。

连续位置乘原 dt/time；连续缩放直接加 targetScale-initialScale，**没有 dt/time 因子**。连续旋转使用原初始基底逆矩阵、增量 quaternion 与当前 quaternion 合成。264 组补充旋转样本包含多轴、四种分解分支、负 quaternion、普通/连续、smooth/reverse、不同缩放与 duration。循环尾重新读取 objects 数量；原 Heap/cast 可产生回调状态改变，完整动态服务行为仍待闭合。

原 GameTime 三项乘法每步 float32 后夹到 `[0.0001,0.266]`。prepared Timeline 采用 clock-start，再按原 `max(0,oldElapsed-newElapsed)` 得到 dt，保留看似反向的差值。真实 Timeline 仅保留依赖，不虚构调度状态。

完成事件先按 Clump 原顺序反射 SetEnabled(true)，再停止可用音效、清 elapsed、调用 Event::Start；原 Event 分发随后执行 OnStop。测试核验请求字、活跃状态和序列顺序。Enable 末端只执行原启用请求，没有调度其后续完整行为。析构仅处理长字符串的 pool free，加载堆矩阵没有在此释放。

cosf/acosf/sinf 的 Linux/QEMU 输入和输出位模式均记录；TypeScript 回放输出并独立核对调用顺序和输入。**没有宣称 Linux libm 等于原 macOS libm**。Heap、metadata bootstrap、Object/receiver/scalar/Matrix4 转换及字符串池同样是显式服务。音效、stepped 残差、完整默认缓存、未知目标虚方法、非有限算术/NaN/MXCSR、整关加载卸载与 Windows/原游戏验收仍保留缺口。Avatar 的出生定位和 Whisker 子链、BstBaked 的 GUID/部分资源子链沿用已有结果，本轮未增加其完整运行验收。

复现：

```sh
python3 tools/reverse-transform-object.py /path/to/Sky
SKY_DATA=/path/to/Data npx tsx tools/transform-object-oracle.ts /path/to/Sky
npx tsx --test tests/transform-object-runtime.test.ts
```

开发源码通过 `tools/sync-source.py` 增量同步；不重打发布包，不修改 reference。
