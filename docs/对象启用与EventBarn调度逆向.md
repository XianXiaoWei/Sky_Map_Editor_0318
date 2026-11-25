# 对象启用与 EventBarn 连续调度

本批新增 10 个原入口的明确正常运行体：SetEnabled、启用请求、单事件状态机、EventBarn Update、OnLevelLoad、ReleaseAll、渲染转发、FindUniqueId，以及两个原指针排序函数。与此前 Start、FloatAdd、PlaySound2D Update/OnResumeEnabled 连续执行，共覆盖 14 个原函数。本报告不表示完整游戏、完整派生类或原内存分配器已经运行。

原可执行文件 SHA256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。完整证据与明确代码边界见 [原函数清单](object-runtime-native.json)；逐字节结果见 [本批机器码核验](event-barn-oracle.json)。固定原输出用于项目测试，运行实现没有读取预期输出。

## 已恢复行为

| 原入口 | 实现与核验范围 |
| --- | --- |
| SetEnabled `0x10032e2c0`、启用请求 `0x10032e2f0` | true 设置 +0x21 pending；false 调原 Start 设置 +0x22。各自仅在其 pending 字节为零时分配序号，按 uint32 回绕；null Barn 保留原 86-byte 日志 |
| 单事件驱动 `0x10032f5b0` | 加载、首次启用/恢复、Update、结束和 +0x25 驱动的 Start/+0x24 清除；每个回调后的重新读取与原分支一致 |
| Update `0x10032ea90` | 完整 1280 槽位扫描、一次捕获节点、按序号排序、逐事件执行、按捕获 event 判定释放，按当前 node.event 卸载/析构/free；最后计数清零并释放 scratch |
| OnLevelLoad `0x10032e540` | 收集 persistence=1 的 event 指针、按 UniqueId 排序、保留 HasUniqueId 断言、按 +0xc 触发启用请求并加载；记录 load heap 用量 |
| ReleaseAll `0x10032e920` | 正序全部节点，回调后重读槽位；空槽也链接 free-list，最后 freeHead=null/+0x5038=1。此入口不会自动重建可用池 |
| 渲染转发 `0x10032ec50` | +0x24/+0x20/+0x23 都非零才调用 vslot 0x58，保持槽位顺序 |
| FindUniqueId `0x10032f3e0` | 首个 ID 相等的事件；不额外要求 persistence=1，保留重复 ID 和 0xffff 查询 |
| 排序 `0x100330980`、`0x1003315d0` | 原 libc++ 分区/小数组/插入排序与相等键排列；长度 0～1280、30/31 与 999/1000 阈值逐身份比较。跳表作为 data 保留，反汇编显式截至 0x100331018/0x100331cc0 |

Update 的捕获对象是节点地址。回调启用一个未入捕获列表的 trigger，并使它 +0x24 非零，不会把它补进本轮；它在下一轮执行。已经捕获、尚未执行的节点，则能在本轮观察新的事件请求。排序只执行一次，回调改序号不会自动重排本轮。

## 数值与依赖音效连续调用

原 FloatAdd Update 与 PlaySound2D Update/OnResumeEnabled 通过明确虚方法服务，在原 EventBarn 状态机内部执行。包含 31 个实际 FloatAdd 的字段/引用配置、109 个实际 PlaySound2D 音效名与合成边界状态。FloatAdd 的 Start 由同一帧结束分支消费；音效覆盖有效播放参数、播放结束、句柄 ID 过期、description 结束，以及恢复启用时停止与 Start。

比较完整 Float 单元、对象非指针字节、全部槽位/链表身份、Barn 非指针前缀与 heap 用量、每次回调的状态/序号/profile、完整音效名字/128-byte options/432-byte zero 与参数包。包数据按全部字节比较，额外 hash 仅作追踪。没有使用 bank sampleNames 代替 FMOD event 路由。

所有状态快照、派生驱动绑定、SoundManager/句柄/GameTime、heap/log/assert 服务均明确提供。未恢复的派生回调使用核验服务；原 ObjectFactory、metadata 启用传播、类型索引红黑树、OnLevelUnload、失败分配/异常 unwind、全部 LevelMesh/Beamo/动画/可见性与 FMOD 播放仍待闭合。部分字段配置缺失的实际对象没有凭空补默认值。无效 ID 的断言已比较，但断言后的局部排序临时数组没有作为可用运行结果。

## 本批核验数量

3435 组连续原机器码用例、128,135,820 比较字节，0 差异。其中排序1073组、启用请求128组、状态机1600组、完整池100组、回调场景31组、派生数值/音效503组（包括31个实际 FloatAdd 节点与109个实际 PlaySound2D 音效名的四种运行状态）。数字仅表示所列明确运行范围。

## 验证与来源

统一执行：`SKY_DATA=/path/to/original/Data node tools/object-runtime-verify.mjs`。本次参考目录 TitleWater 文件为 JSON，原始 Sky0.3.18.zip 中对应 TGCL 二进制的 SHA256 与此前全量清单一致：`46841a22d17b360fcc3c7ceb8406d8c7e73441fd59023f64b4bce4057e1b9414`。从该原始压缩包提取全部 Data 到单独验证语料（2441 文件）；全部33份 Objects 二进制均与此前清单 SHA256 一致，未修改 reference。完整副本也保留原资源路径检查，不使用越界 symlink。

实现：[事件状态机](../src/core/event-barn-runtime.ts)、[原排序](../src/core/event-original-sort.ts)、[派生体明确适配](../src/core/event-derived-drivers.ts)。原排序算法对照 LLVM libc++ release_50，许可保存在相邻 LICENSE 文件。原代码本体不打补丁；核验 C harness 只替换列明的外部服务函数。

此轮不增加 BstBaked 五段完整检查项，也不把 EventBarn 作为新的实际序列化类纳入 283 类分母。LevelMesh/Beamo 的索引、材质、动画、原生命周期分别按其单独类清单继续验收。

统一验证最终通过：28个不重复原数值/流程/事件/Barn/音效函数明确范围，10,184组用例，共130,702,796比较字节；另有11,710次烘焙 GUID/兼容规则查询、全部8个WAV的1,421,920有效PCM样本对照。188项项目测试、TypeScript、构建、两套283类/49,824对象清单UI均通过。完整类运行仍0，按类清单检查项均值29.75%；本批不虚增完整类进度。详见 [统一验证报告](object-runtime-batch-verification.json)。

后续已将原触发创建/唯一ID/类型索引登记与FloatMult字段装载接入本调度链，全部14个真实配置子图自动运行、停用/恢复均有原输出核验，见 [FloatMult触发登记与自动调度](FloatMult触发登记与自动调度逆向.md)。
