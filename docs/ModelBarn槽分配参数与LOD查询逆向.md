# ModelBarn 槽分配、参数传递与 LOD 查询

已恢复完整正常 `ModelBarn::CreateBaked` / `CreateUnbaked` 创建wrapper，以及 Model constructor 调用的 Mesh LOD数量查询。实现见 [model-barn-runtime.ts](../src/core/model-barn-runtime.ts) 与 [model-baked-runtime.ts](../src/core/model-baked-runtime.ts)，原函数边界和ABI布局见 [证据](model-barn-native.json)。

| 原对照 | 结果 | 范围 |
| --- | --- | --- |
| [ModelBarn wrappers](model-barn-oracle.json) | 2,410组 / 2,685,560,004比较字节，零差异 | 1,152 Mesh文件名在两个分支的2,304参数快照、106边界样本；每次比较完整0x110000-byte准备内存 |
| [Mesh LOD查询](model-lod-oracle.json) | 1,168组 / 9,726,868比较字节，零差异 | 全1,152 Mesh名字/LOD数量，原registered lookup→ResourceRef→查询→正常释放，4个原断言 |

两个报告证明所列完整正常函数；**完整Model创建仍0**。ModelBarn oracle将完整constructor作为捕获参数的服务，正常服务不修改Model，另有4个明确失败边界。2,361次捕获调用和wrapper返回的准备池地址不能算真正完成Model初始化、LevelMesh加载绑定或原场景运行。Mesh LOD查询执行原查找与引用生命周期，metadata转换/已注册名字树、资源虚回调内部/真实加载仍保留服务边界。其79,424字节无关算术探针输出不计入比較字节。

## 原槽与参数规则

| 原函数 | 地址 | 规则 |
| --- | --- | --- |
| CreateUnbaked | `0x10046c700` | options先断言，复制Mesh名、传递shader/transform，再分配槽和调用constructor |
| CreateBaked | `0x10046ca30` | options先断言，依次复制Level名与Mesh名、GUID、shader/transform，再分配槽和调用constructor |
| Mesh LOD数量 | `0x1004653c0` | 查已注册Mesh，观察引用，先读+0xe8数量再析构引用；找不到即原found断言，不能请求加载 |

池从Barn+0x10开始，stride 0x3e0、limit 0x400，uint32计数在+0xf8010。比较计数后先增加，再进入完整constructor。constructor服务失败时计数已提交，原wrapper没有自行回滚。槽耗尽在增加前断言。null options在名字长度错误或槽耗尽之前断言；固定字符串最多63字节正文，64字节正文即失败，按C字符串NUL截断和UTF8字节长度计算。

Barn的heap / renderer / ResourceManager分别为+0xfd250 / +0xfd258 / +0xfd260，两个vec4在+0xfd270 / +0xfd290。constructor接收152-byte按值参数块、两个16-byte向量；二者之间原有16-byte未写对齐padding未计为语义输出。参数块的Level名+0、Mesh名+64、GUID/未初始化dword+128、bakedFlag+132、shaderPointer+136、transformPointer+144。

**Unbaked分支不初始化参数+128的dword**。原caller核验先显式填充未来栈区域，恢复器从已分配scratch保留该4字节；不能将它擅自置零或误称有效GUID。两分支首先清零前128字节，原按值复制的顺序和最后8字节重叠均保留。完整constructor在type0分支无需把该字段当烘焙GUID。原name、池和向量字节经过相同准备；真实资源文件名快照不代替真实Objects参数或场景布局。

Mesh查询返回uint32原位模式，包括0、0x80000000与0xffffffff；观察失败保存原断言时的引用状态，没有正常析构或虚构unwind。独立完整函数执行的前缀tracing、栈引用地址规范沿用 [ResourceRef连接](ResourceRef链表与模型资源消费连接逆向.md)，仅比较逻辑身份，原运行仍用实际栈地址。

无烘焙网格消费者与Vertex数据构造已继续接入，见 [后续依赖核验](Vertex数据构造与无烘焙模型消费者逆向.md)。下一段继续Vertex设置与提交依赖，逐段接回完整constructor；实际LevelMesh +0x228指针写入、动画、GPU绘制、碰撞、卸载、Avatar完整生命周期仍待闭合。Objects26类核心子链、856/2830（30.25%）类清单比例保持，完整原类/实例仍0。[本轮检查](model-barn-verification.json)。

```sh
python3 tools/reverse-model-barn.py /path/to/Sky
SKY_DATA=/path/to/Data npx tsx tools/model-lod-oracle.ts /path/to/Sky
SKY_DATA=/path/to/Data npx tsx tools/model-barn-oracle.ts /path/to/Sky
npx tsx --test tests/model-lod-runtime.test.ts tests/model-barn-runtime.test.ts
```
