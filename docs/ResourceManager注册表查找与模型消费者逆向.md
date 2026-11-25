# ResourceManager 注册表查找与模型消费者

原资源管理器名字范围、精确类型选择与 metadata ID getter 已恢复，并接回原 ResourceRef 与完整 MeshInstance 模型资源消费者。实现见 [resource-manager-runtime.ts](../src/core/resource-manager-runtime.ts)，地址和入口跳板边界见 [原证据](resource-lookup-native.json)。

| 对照 | 结果 | 范围 |
| --- | --- | --- |
| [独立查找](resource-lookup-oracle.json) | 29组 / 7,885次查询 / 1,206,824比较字节，零差异 | 全部1,152 Mesh名与33关卡名；重复名、多类型、UTF8、空名/前缀、null/fallback、回调修改、原classID断言 |
| [注册表→引用→模型消费者](model-baked-registry-oracle.json) | 12,069组 / 101,625,444比较字节，零差异 | 全部1,231 LOD / 10,653烘焙GUID快照，原查找、引用构造/观察/正常释放、包围数据和兼容诊断 |

扫描33地图，32地图有烘焙记录。10,635条真实记录快照达到正常有烘焙出口，18条缺Mesh触发原Observed断言；全部30个原断言、15个合成诊断分列。连接使用与前两轮相同的输入快照，不能累计为额外真实对象。原输出102,472,760字节中的847,316字节为独立双NaN AVX探针服务，未计入比较量；不声称QEMU等同macOS硬件算术策略。

## 原选择行为

| 函数 | 地址 | 行为 |
| --- | --- | --- |
| name equal_range | `0x1007c5970` | 区分大小写的C字符串比较，返回同名树节点范围 |
| registered lookup | `0x1007c4360` | 范围内按树迭代顺序匹配精确class指针 |
| metadata ID getter | `0x1007abd30` | classID小于1280才读取注册表，否则原断言 |

manager名字树为+0x428，end sentinel为+0x430。节点依次保存left / right / parent，+32名字指针、+40资源指针。比较按UTF8原字节顺序，不折叠大小写或移除扩展名。非空资源通过+8 classID查metadata；空资源使用void metadata。原虚asClass返回null才走fallback，按class指针精确相等判定，不做继承匹配。

匹配后重新读取节点+40，保留metadata回调更换资源的行为。匹配到null资源立即返回null，不能继续挑选后一个同名资源。独立原对照覆盖这些边界、重复名的首匹配以及classID1280/0xffffffff原断言。恢复器对没有注册metadata的依赖在解引用之前明确停止，不虚构类型；未查询的缺metadata节点可正常留在树中。

## 核验范围

独立三函数在原地址完整运行，未改本体。消费者连接为记录查找服务顺序，将18字节指令对齐、无PC相对指令的入口前缀原样复制，跳回原尾部；原分支和迭代行为未替换。ResourceRef连接沿用上一轮原入口跳板与栈引用身份规范，见 [引用连接说明](ResourceRef链表与模型资源消费连接逆向.md)。

名字树是准备的已注册平衡多重映射，树注册/分配/bootstrap、metadata asClass/void/fallback内部、Resource请求与实际加载、资源虚回调和诊断流仍是服务。执行原资源查找不能证明完整资源创建。Model constructor、ModelBarn分配后的完整初始化、LevelMesh +0x228实际指针绑定、动画/GPU/绘制/卸载及Avatar完整生命周期继续推进。

Objects核心子链仍26类，856/2830（30.25%）是类清单比例；完整原类/实例验收仍0。[检查记录](resource-lookup-verification.json)。UI仅更新说明和证据，沿用前轮同一进度生成器的UI检查；reference与发布包保持原样。

复现：

```sh
python3 tools/reverse-resource-lookup.py /path/to/Sky
SKY_DATA=/path/to/Data npx tsx tools/resource-lookup-oracle.ts /path/to/Sky
SKY_DATA=/path/to/Data SKY_MODEL_BAKED_LOOKUP=1 npx tsx tools/model-baked-oracle.ts /path/to/Sky
npx tsx --test tests/resource-lookup-runtime.test.ts tests/model-baked-registry-runtime.test.ts
```
