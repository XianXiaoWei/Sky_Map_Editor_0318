# FloatSplit 与 OnFloat 条件事件调用链

FloatSplit 的原创建和装载已接入联合对象链；OnFloat 新增原构造、正常求值 / Update 和析构路径。现在可在明确服务输入下连续执行：ValueBarn / ClumpBarn / EventBarn 创建 → TGCL 保存字段与引用修复 → 原触发登记 / 加载 / 调度 → FloatSplit 分段输出 → OnFloat 条件选择 → Clump / Delay / FloatAdd → 释放、卸载与重建。

[联合原机器码报告](logic-chain-oracle.json)：**758 组、3,092 个快照、247,072,924 字节对照，零差异**。其中 497 个真实根图片段为 Enable 82、IfEnabled 36、Delay 283、FloatSplit 2、OnFloat 94。相比 Delay 轮新增 272 组：96 个真实配置和 176 个受控用例。12 个原断言、1 个原字符串长度错误服务和 297 次未恢复类服务边界单独记录；448 组完成核验器规定的有限步骤，不等于完整原类、实例或场景验收。

真实语料中所有 2 个 FloatSplit 和 94 个 OnFloat 根配置均参与核验，保留原节点 / 字段 / 成员顺序、原保存字节、autoStart 和引用关系。引用索引仅重映射到局部对象表。真实根装载后显式请求启用、最多执行六帧；未知目标不装载字段、不赋予虚构启用状态，遇到未知 metadata 行为即终止并记录边界。全部真实 OnFloat 的 debug 为 false，91 个 debugName 为空、3 个为 14 字节。递归与长字符串路径由独立受控用例覆盖。

| 原执行体 | 地址 | 范围 |
| --- | --- | --- |
| FloatSplit placement | `0x100717a10` | 完整 72-byte 构造，保留未装载的 input / outputs |
| FloatSplit Update | `0x100717b20` | 完整分段映射体；复用此前已核验数值内核并接上字段与调度 |
| OnFloat placement | `0x100719e20` | 完整 192-byte 构造，只额外清空 debugName 的 24-byte 字符串描述 |
| OnFloat destructor | `0x100719f20` | 正常析构；长字符串经原 pool 释放调用，短字符串不释放 |
| OnFloat Update | `0x100719fc0` | 正常路径：复制 debugName、求值、释放临时串、选择输出、结束请求 |
| OnFloat Evaluate | `0x10071a140` | 正常路径：两个比较 / 嵌套条件、布尔组合、调试输出服务 |

[实现](../src/core/float-condition-event-runtime.ts)、[虚表和常量证据](float-condition-native.json)使用原执行文件 SHA256 `3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。C 核验器执行未翻译的原函数体；TypeScript 重放同一内存输入，比较全部测试对象内存、Barn 内存、游标、对象表、服务调用和快照。OnFloat 的原异常处理 / unwind 及调试流库内部继续保留为服务，不将正常路径称为完整异常运行。

## FloatSplit 的连接规则

非空 outputs 将输入区间按最初成员数 N 分段：第 i 个输出映射 `[i/N,(i+1)/N]` 到 0–1。最初的输入值和 N 捕获一次，查询每个成员前重新读取 Clump / count；cast 后修改 count 可触发下一轮原 bounds 断言。每个目标必须转换成 Float；null 或其他类保留 `Clump.h:71`。

两个输出、input=0.25 得到 `[0.5,0]`。input=0.5 且第一个输出与 input 同指，第一轮得到 `[1,0]`；写入 input 后仍使用原保存输入计算第二项。非空输出不调用 Start，因此下一帧会重新读取输入。空 outputs 直接 Start，连 input=null 也不读取；不能先解析 input 再判断空输出。

## OnFloat 的条件和输出

| 原运算符值 | 条件 |
| --- | --- |
| 0 | value > condition |
| 1 | value >= condition |
| 2 | value < condition |
| 3 | value <= condition |
| 4 | abs(float32(value − condition)) < 原 double 常量 0.0001 |
| 其他 | false |

conditionOneFloat / conditionTwoFloat 非空时读取其当前值，为空时使用各自保存标量。conditionOneOnFloat / conditionTwoOnFloat 非空时改为递归求值；not 字段按原字节与递归 bool 输出比较，不擅自归一化。例如 not=2 与 true 比较仍得到 true。OnFloat 的 Object 子对象位于本体 +8；两个递归指针在引用修复中使用 adjustment=8，得到本体地址。

booleanOperator=0 只采用第一个条件结果，1 为 AND，2 为 OR，其他值为 false。**两个条件始终都求值**；即使第一条件已决定结果，仍执行第二个递归调用、字符串复制 / 释放及调试服务。原代码没有递归深度门控；当前真实语料没有非空 OnFloat 递归引用，核验器另外拒绝递归依赖环。

结果为 true 时启用 trueEvents，false 时启用 falseEvents。所选指针非空才调用原 Object SetEnabled；endOnTrigger 也只在这条输出调用之后发出 Start。输出为空时 endOnTrigger 不结束事件。checkOnce 独立执行 Start，因此能结束没有输出的事件，并允许原两次 Start 调用顺序。

受控用例把真分支设为 +1、假分支设为 −1，独立核对运算符、epsilon 和布尔模式。实时更改 Float 阈值 / 输入会在下一次 Update 切换分支；两帧输出可为 `0 → 1 → 0`。连续链用例在第二帧通过 Delay 把分段输出从 0.5 改为 1.5，下一帧 FloatSplit 再按输入重写为 0.5，保留原调度顺序。

## 字符串及服务边界

OnFloat Update 总会复制 debugName，debug=false 也执行复制；递归时复制传入的调试字符串。短字符串逐字节复制全部 24-byte 描述，包括未使用尾部。长字符串长度小于 23 时转成短串，其他正常长度按 `(length + 16) & ~15` 分配并复制，长度 >= 4081（原 `cmp r14, 0xff1; jae`）进入原 length_error 服务；受控错误用例把长度设为 4097，核对该服务。临时长串先释放，随后才启用输出；卸载时释放对象保存的长串。96 字节用例分别分配保存串和临时串各 112 字节，两次释放顺序均通过核验。

原 TGCL ReadString 和字符串扩容接入联合 runner；池中字符串数据包含在完整测试对象内存比较中。pool 仍为受控分配 / 释放服务；实际复用、内存池启动和分配失败 / 异常 unwind 待恢复。debug=true 的格式化和输出仍是流服务，只比较原调用顺序、文字参数、级别和 float32 值，不声称终端日志库完整恢复。

完整 metadata / 默认缓存准备、Object cast 内部、方法缓存、Game / Time / beat 初始状态、未知目标的资源 / UI / Avatar 反馈、真实关卡启动与 Windows / 原游戏验收尚未闭合。两类的部分构造 / 加载 / 行为 / 生命周期证据已更新；核心子链新增 OnFloat，完整原类和完整实例计数仍为 0。

[本轮核验记录](float-condition-chain-verification.json)：20 项联合调用链行为测试和全部 270 项项目测试通过，失败/跳过均为 0；TypeScript 检查和构建通过。逐类清单为 22 类核心子链、852/2830 项（30.11%），仅表示清单检查项进度。

复现：

```bash
python3 tools/reverse-float-condition-events.py /path/to/Sky
npx tsx tools/logic-chain-oracle.ts /path/to/Sky
npx tsx --test tests/logic-chain-runtime.test.ts
```
