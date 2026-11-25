# Delay 创建、字段装载与对象组调度

Delay 已接入 ValueBarn / ClumpBarn / EventBarn 的联合运行核验：原 placement 构造 → 保存字段读取与引用修复 → 触发登记和 OnLevelLoad → 启用 / 恢复 → 计时与输出 → 释放、卸载和重建。完整 ObjectFactory、metadata 注册、场景启动与实际交互仍沿用既有验收边界。

[联合原机器码报告](logic-chain-oracle.json)：486 组、2,119 个加载后与逐帧快照、160,615,784 字节对照，零差异。比上一版新增 322 组，包含 283 个实际 Delay 配置片段和 39 个受控分支用例；此前 82 个 Enable、全部 36 个 IfEnabled 片段继续核验。9 个原断言和 244 次未恢复类服务边界分别记录。234 组完成核验器规定的有限执行步骤，**不代表完整类、实例或真实依赖图运行完成**。

实际语料共有 284 个 Delay。283 个根图可容纳在当前 48 节点核验器中，另一个超出容量。真实片段保留源文件 SHA256、节点创建顺序、保存字段顺序和字节、Clump 成员顺序、autoStart 及原引用关系；引用只重映射到局部对象表。装载后由核验器请求启用所选根，再运行最多六帧，遇到未恢复类行为即记录服务边界。因此长延迟配置可能尚未到达输出时间，未把有限帧通过当作完整配置功能验收。

| 完整原函数 | 地址 | 已恢复行为 |
| --- | --- | --- |
| placement | `0x1002c62f0` | 80-byte Event 派生对象；原基类构造、classId / vptr、delay=0、events=null；其余字段保留分配内容 |
| OnEnable | `0x1002c6410` | 清零 elapsed 和成员 index，共 8 字节 |
| OnResume | `0x1002c6420` | 同样清零 elapsed 和成员 index |
| Update | `0x1002c6430` | 时间 / 帧模式、节拍门控、错开 / 全部输出、原断言、Start 与计数顺序 |

[实现](../src/core/delay-event-runtime.ts)与[原虚表及注册证据](delay-event-native.json)使用同一原执行文件 SHA256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。C 核验器执行未翻译的原函数及原 EventBarn 调度、Object 继承方法查找和反射包装；TypeScript 重放同一输入，比较全部测试对象内存、Barn 内存、游标、对象表、服务调用及快照。

| 字段 | 本体偏移 | 规则 |
| --- | --- | --- |
| delay | `+0x38` | 原 float32 阈值 |
| staggered | `+0x3c` | 每次启用一个成员，并清零 elapsed |
| waitForBeat | `+0x3d` | 达到阈值后才查询音乐节拍；未到节拍继续等待 |
| useFrames | `+0x3e` | 帧模式在比较之后加一 |
| events | `+0x40` | 输出 Clump 指针 |
| elapsed / index | `+0x48 / +0x4c` | 运行字段；由 enable / resume 初始化，不自行添加保存字段 |

时间模式按原 float32 顺序计算速度覆盖 × scale × delta，再限制到 `0.0001..0.266`；覆盖开关关闭时用 1。零 scale、负 delta 和零 delta 仍得到原最小增量。帧模式比较时不加时间，Update 末尾再加一；delay=2 的单次输出例子为 Float 值 `0 → 0 → 0 → 1`（包括加载快照）。

错开模式在启用最后一个成员之前调用 Start，每次启用后 index 加一、elapsed 清零，帧模式随后将 elapsed 加到 1。两个单次 FloatAdd、delay=2 的例子输出 `0,0,0,1,1,2`。全部输出模式先 Start，再逐一启用成员；每个反射回调后重新读取 Clump。空成员保留 `Clump.h:71`，错开索引越界保留 `Clump.h:54`；空输出的全部发送路径可以完成，错开路径触发原索引断言。

原注册 `0x1002c6d29..0x1002c6d5f` 明确 waitForBeat 的 Tool_DefaultValue 为 false。本轮全部真实根配置均保存该字段，按原字节装载。缺字段 false 缓存在独立受控 placement 用例中提供并核验；没有凭字段名猜测其他默认值，完整默认缓存准备仍待恢复。

Game / Time 初始状态、音乐对象的 beat 虚方法、metadata 转换、Heap / pool 和方法缓存内部仍为明确服务。当前并未接入实际音乐播放；未知目标继续保留类名和引用位置，执行到其 metadata 行为时停止。真实启动事件、完整场景 / UI / Avatar 反馈与 Windows / 原游戏验收尚未完成。类清单新增 Delay 核心子链项；完整原类和完整实例计数保持为 0。

复现：

```bash
python3 tools/reverse-delay-events.py /path/to/Sky
npx tsx tools/logic-chain-oracle.ts /path/to/Sky
npx tsx --test tests/logic-chain-runtime.test.ts
```

统一 Objects 核验入口 `tools/object-runtime-verify.mjs` 已增加 Delay 证据和联合调用链；联合报告单列，避免把复用函数重复加入原有函数总量。

本轮验证：262 项项目测试全部通过（其中联合调用链测试 12 项），TypeScript 检查与构建通过。清单更新为 21 类核心子链、851/2830 项（30.07%），完整类和实例仍为 0。
