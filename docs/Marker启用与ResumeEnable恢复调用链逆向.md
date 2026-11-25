# Marker 启用与 ResumeEnable 恢复调用链

Objects.level.bin 的条件/时序输出现在接到原 Marker 启用字节，并新增 ResumeEnable 的检查点恢复调用。Marker 使用原 MarkerBarn 池创建，装载保存的 pos/quat/scale/enabled，经过原 Object GetEnabled/SetEnabled 方法查找和反射 wrapper 改变启用状态；IfEnabled 可消费这份状态并触发数值输出。ResumeEnable 经过 Clump OnResumeEnabled、ObjectFactory TryResume 和原方法查找，恢复嵌套 Clump / Enable；没有恢复方法时才使用普通 SetEnabled。

[联合原机器码报告](logic-chain-oracle.json)：**906 组、4,313 个快照、398,249,100 字节对照，零差异**。616 个真实根片段包括 Enable 196、IfEnabled 36、Delay 283、FloatSplit 2、OnFloat 94、ResumeEnable 全部 5 个。真实图保留原节点/成员顺序、保存字节和引用关系，仅重映射局部对象索引。真实根显式请求启用并执行至多六帧；653 组完成核验器的有限步骤，25 个原断言、1 个字符串长度错误服务和 227 次缺失类服务边界分别记录。

相比上一轮，新增 148 组，其中 119 个真实片段和 29 个受控用例。遇到缺失类而终止的用例从 297 组降至 227 组，但新增片段数量和原断言也改变，不能把差额视作完整场景完成数。联合输入包含 **904 个 Marker 装载样本，来自 273 个不同真实节点**；已成功加载的每个 Marker 保存字段都逐字节核对。其余 Marker 尚未逐实例运行验收。

按保存引用检查，目标类型全部处于当前支持范围的根配置为 Enable 124、Delay 56、OnFloat 3、FloatSplit 2、IfEnabled 1。这个检查不涵盖全部虚方法、全局、资源和场景依赖；不代表这些原类或实例已完整恢复。原 284 个 Delay 中一个仍超过 48 节点容量；另有两个 Enable 根图也超过容量。

| 原执行体 | 地址 | 本轮范围 |
| --- | --- | --- |
| Marker placement | `0x10043e1b0` | 完整 80-byte placement，只写类 ID 与 vptr |
| Marker SetEnabled / GetEnabled | `0x10043cff0` / `0x10043e2c0` | 写/读本体 +0x40 原字节；GetEnabled 通过原虚表 |
| Marker set/get wrapper | `0x10043e700` / `0x10043e820` | 原参数转换、成员调用及结果转换 |
| MarkerBarn placement / Initialize | `0x10043eaa0` / `0x10043d020` | 构造容量/计数/bitmap/data 指针；Initialize 只清 next ID |
| MarkerBarn Create / Release | `0x10043d6a0` / `0x10043d7a0` | 第一个空槽、80-byte 清零、编号、释放和复用 |
| MarkerBarn OnLevelUnload / Terminate | `0x10043d030` / `0x10043d1d0` | 原 Marker 析构为空；正常稳定池遍历，卸载额外清 next ID |
| ResumeEnable placement / Update | `0x10058abf0` / `0x10058a9e0` | 64-byte 构造清 objects；Update 恢复 Clump 后 Start |
| Clump OnResumeEnabled / wrapper | `0x10022bba0` / `0x10022cba0` | 每个成员 TryResume，否则普通启用；嵌套递归 |
| Enable OnResumeEnabled / wrapper | `0x100316400` / `0x100316df0` | 输出调试服务后请求启用 Enable 自身 |
| ObjectFactory TryResume | `0x1004d2440` | 原 metadata/方法查找、Game 参数、receiver 转换、调用和断言 |

[实现](../src/core/marker-runtime.ts)、[恢复调用适配](../src/core/object-resume-runtime.ts)、[原函数/虚表证据](marker-resume-native.json)均对应原执行文件 SHA256 `3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。C runner 调用未翻译原函数体，TypeScript 重放同一输入。除已有对象/Barn/游标/对象表/服务外，本轮增加全部 `0x140b4` 字节 MarkerBarn 终态及每帧池前部快照比较，覆盖整个 1024 槽位与位图；帧快照前部足够保存根片段的 48 节点上限。

## Marker 的保存状态和池

Marker 的 Object 子对象位于本体 +8，保存字段偏移按本体地址计算。placement 保留变换、enabled、编号和 padding；MarkerBarn CreateMarker 先清零 80 字节，再写类 ID/vptr 和编号。不能把 placement 的清零规则与池创建混用。保存 enabled 值 0、1、2、255 都保持原字节；反射读取再将非零结果转换为 true。缺少保存 enabled 时，联合 runner 使用原注册 `Tool_DefaultValue=true` 建立的缓存条目；完整默认缓存生成仍是依赖。

池容量为 1024，bitmap 为本体 +0x30 的 128 字节，data 为 +0xb0，每槽 80 字节；+0x140b0 是下一个编号。构造只设置容量、计数和指针，Initialize 只清编号，**都不清 bitmap**。核验器提供启动时清零 bitmap 的明确服务。每次 Create 选择第一个零位，先递增 count、设置位图，再清槽/构造/分配编号。编号按 uint32 回绕；释放空/null 槽不改状态，复用槽位分配新编号。

两个 Marker 编号 0/1，释放第一个再创建得到 2/1；next ID 为 0xffffffff 时，后两个编号为 0xffffffff/0。32 位 bitmap 跨组用例创建 33 槽，真实 1024 槽耗尽用例比较满池全部字节及第 1025 次创建的原 `ObjectPool.h:71` 断言。Release 保留原有符号位移/乘法的索引计算、负/越界断言，并在析构前清 bitmap。Terminate 清分配槽而保留 next ID；OnLevelUnload 另清 next ID。变更容量或 bitmap 的派生析构回调、完整 ObjectPool/Module 启动尚未闭合。

## 检查点恢复与普通启用

ResumeEnable Update 使用保存的 objects，调用原 Clump OnResumeEnabled 后结束自身。Clump 总会先输出调试服务，逐项查询精确名字 `OnResumeEnabled`；嵌套 Clump 命中恢复方法，Marker/Float/Delay 等没有该方法的当前目标才回退普通 SetEnabled。每次调用后重新读 count/data，回退前再读该成员，保留原有动态修改语义。

TryResume 的 null object 是 `ObjectManip.cpp:88` 断言，不采用 GetEnabled 对 null 的 true 默认值。method 不存在且 required=false 返回 false；required=true 保留第 103 行断言。有方法时用原 Game 名字/类型查询与参数转换服务、Object receiver 转换、原 wrapper 和调用顺序；receiver 转换失败保留 `Meta.h:1091`。

Enable 的 OnResumeEnabled 只请求 Enable 自身启用，**不直接恢复成员，也不读取保存 enable/killEvents 字段**。它的后续 Update 才使用这些保存字段。受控 false/killEvents 用例因此停止 FloatAdd，而不是将输出强行启用；Delay 的回退启用经过原调度进入 OnEnable，重置计时再按阈值触发。OnFloat → Marker → IfEnabled → FloatAdd 用例第一帧把保存关闭的 Marker 打开，IfEnabled 成功后按原单次触发规则结束，数值保持 `0 → 1 → 1 → 1`。

当前支持类型按原注册决定恢复方法；没有向 Event 或 Delay 添加虚构的 OnResumeEnabled。Game 类型查找/转换、metadata receiver/scalar 转换、调试流格式化/输出和异常 unwind 仍是服务。未知玩法/资源/UI 目标保持缺失类边界。Marker GetTransform/SetTransform/OBB、真实场景绘制/交互、完整切图与 Windows/原游戏验收继续待恢复，完整原类和实例计数仍为 0。

[本轮核验记录](marker-resume-chain-verification.json)：28 项调用链测试、全部 278 项项目测试通过，失败/跳过均为 0；TypeScript 检查和构建通过。逐类清单为 24 类核心子链、854/2830 项（30.18%），仅表示清单检查项进度。完整原类和实例仍为 0。

复现：

```bash
python3 tools/reverse-marker-resume.py /path/to/Sky
npx tsx tools/logic-chain-oracle.ts /path/to/Sky
npx tsx --test tests/logic-chain-runtime.test.ts
```
