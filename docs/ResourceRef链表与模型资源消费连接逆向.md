# ResourceRef 链表与模型资源消费连接

本轮恢复原 ResourceRef 正常构造、Resource::Observe、正常析构与无回调 cleanup，并接回完整模型网格资源消费者。代码见 [resource-ref-runtime.ts](../src/core/resource-ref-runtime.ts)，原函数、布局和连接跳板证据见 [resource-ref-native.json](resource-ref-native.json)。

| 对照 | 原执行结果 | 范围 |
| --- | --- | --- |
| [独立引用序列](resource-ref-oracle.json) | 109 组 / 2,075 快照 / 8,525,948 字节，零差异 | 完整原四个函数，每动作比较全部4,096字节；头/尾/中间摘除、重复观察、缺资源指针、回调中移除/嵌套观察 |
| [ResourceRef→模型消费者](model-baked-ref-oracle.json) | 12,069 组 / 101,369,448 比较字节，零差异 | 全部1,152 Mesh / 1,231 LOD、10,653烘焙GUID快照，以及原构造/观察/正常释放接上MeshInstance初始化/消费者/查找 |

连接报告扫描全部33地图，32地图有烘焙记录。10,635条资源快照跑到正常有烘焙出口，18条缺Mesh触发原Observed断言。30个原断言、15个合成失败诊断样本分列；18条缺资源与61条尚未关联Objects的记录是不同统计。上一轮 [基础消费者报告](model-baked-oracle.json) 已复跑，12,069组 / 100,345,752比较字节仍零差异；两份连接报告复用同一输入语料，不是两批独立真实对象。

## 原引用语义

资源在自身 `+0x40` 内嵌handle，分别保存头引用（+0x40）、尾引用（+0x48）和资源指针（+0x50）。引用体是handle / next / previous三个指针，以及+24 observed字节。完整构造以两次重叠16-byte清零写25字节，保留之后的分配padding；正常析构和cleanup仅清24字节，**保留observed字节**。不能把它改成独立分配的计数handle。

| 原函数 | 地址 | 行为 |
| --- | --- | --- |
| 构造 | `0x1007c2530` | 清handle/next/previous/observed，保留padding |
| 观察 | `0x1007c2310` | 旧资源回调+0x40，然后移除旧引用；插入新资源尾部，调用+0x38，最后置observed=1 |
| 正常析构 | `0x1007c2570` | 资源回调+0x30，然后重新读取handle并摘除；缺资源指针时不回调，但仍摘除 |
| cleanup | `0x1007c2600` | 不调用资源回调，修复两侧链表并清三个指针 |

同一资源重复观察也保留原移除/插入回调顺序。回调可先移除当前引用、移除相邻引用、清资源指针或嵌套观察另一引用；原调用方重新读取状态，不能使用回调前缓存的指针。观察回调看到的是置1之前的observed值；回调中摘除后，原Observe仍会置1，形成handle为空、observed为1的合法输出。

## 连接核验边界

独立核验原四个函数在原地址运行，未改本体。消费者连接为了记录构造/观察/析构调用顺序，完整复制入口的无PC相对指令前缀，再绝对跳转到原尾部；原分支/算术/链表指令没有替换。三个前缀的长度、字节和原指令边界经SHA门控核验。ResourceRef使用原消费者栈槽，先明确准备分配padding；输出仅把资源头/尾里的栈引用地址映射为固定逻辑引用身份，以便比较地址和全部状态。运行时链表仍用实际栈地址。

连接已执行原ResourceRef构造、观察、正常析构与cleanup，替代上一轮这三项整体服务。资源虚回调内部、ResourceManager类型/查找/请求、注册与实际加载、metadata和libc++诊断流仍是服务。双NaN使用独立AVX探针结果并核对两个位模式，847,316字节探针输出不计入比较字节；不宣称QEMU规则等于macOS/硬件。并发、异常unwind/terminate、完整Model构造与GPU/动画/绘制/卸载尚未闭合。

原断言保存当时仍挂着的引用，不跑正常出口，也不虚构异常cleanup。例如LOD越界后两个资源头/尾仍指向其局部引用；观察回调使Mesh引用失效后，Observed断言看到的是空handle。这些状态和回调顺序已逐字节对照。

下一段继续ResourceManager实际查找和Model创建/LevelMesh +0x228指针连接。Objects核心子链仍26类、856/2830（30.25%）类清单比例；完整原类/实例仍0，Avatar本轮没有新增完整运行验收。[本轮检查与同步](resource-ref-verification.json)。

复现：

```sh
python3 tools/reverse-resource-ref.py /path/to/Sky
npx tsx tools/resource-ref-oracle.ts /path/to/Sky
SKY_DATA=/path/to/Data SKY_MODEL_BAKED_REFS=1 npx tsx tools/model-baked-oracle.ts /path/to/Sky
npx tsx --test tests/resource-ref-runtime.test.ts tests/model-baked-ref-runtime.test.ts
```
