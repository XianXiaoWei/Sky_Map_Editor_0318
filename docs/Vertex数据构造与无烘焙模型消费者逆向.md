# Vertex 数据构造与无烘焙模型消费者

Model constructor 的无烘焙网格分支与两个 Vertex.cpp 数据构造函数已恢复。它们继续缩小完整Model创建依赖，但不能算已创建原Model或完成GPU绘制。

| 原对照 | 结果 | 范围 |
| --- | --- | --- |
| [无烘焙消费者](model-unbaked-oracle.json) | 1,436组 / 11,958,208比较字节，零差异 | 原0x10045f770→registered lookup→ResourceRef→MeshInstance，全部1,152资源/1,231 LOD；准备的ready门控、特殊浮点、alias与原断言 |
| [Vertex数据构造](vertex-data-oracle.json) | 186组 / 419完整快照 / 3,438,712字节，零差异 | 完整0x1007f5010、0x1007f5b20及转发0x1007f5d80、内嵌AutoLister 0x1007f6ca0 |

实现见 [model-baked-runtime.ts](../src/core/model-baked-runtime.ts) 和 [vertex-data-runtime.ts](../src/core/vertex-data-runtime.ts)。原函数、字段、常量和全局依赖见 [vertex-data-native.json](vertex-data-native.json)。无烘焙报告的124,272字节独立双NaN算术探针输出不计入比较字节。21个消费者原断言、30个数据构造/登记原断言分列。

Mesh未找到时无烘焙消费者请求原类型名，然后保留Observed断言。观察成功后检查资源+0x108 ready字节；零ready只清输出前21字节，跳过初始化及LOD断言，仍正常释放引用。非零ready执行完整初始化，bake指针为null。ready是明确准备输入，不能当作实际资源已加载。

0x438-byte Vertex数据构造先写字段默认值，再登记+0x400内嵌链表节点，然后清前0x134字节及+0x148起0x2b0字节，写+0x410自身指针和+0x418的Unnamed标签。+0x13c、+0x144、+0x3f9、+0x434等padding保持原样；登记失败保存此前原写入，不自行清零其余数据或解锁。

AutoLister先进入锁服务，再重新读取全局vars与+0x48最新节点。已有节点的+8指向新entry，重新读取vars+0x48后写新entry的previous，再重新读全局vars并追加新节点，最后next=0并解锁。锁回调重定向/清vars、previous节点写入与head地址alias已逐快照核验；锁实际内部、并发与异常unwind仍待闭合。

0x540-byte render-data构造保留未写字节；矩阵、OBB轴、状态标志、索引与队列字节按原位模式写入。原默认OBB矩阵由0x100c0db08提供，三个轴先乘0x4e6e6b28，再存储，第四lane置零。默认矩阵与输出重叠、NaN/Inf/零/subnormal已对照。全局矩阵/vars、libc、锁和分配准备仍为服务；MXCSR/硬件一致性、Vertex设置/上传/队列/绘制/释放及完整Model/LevelMesh/Avatar场景未验收。[检查记录](vertex-data-verification.json)。

```sh
python3 tools/reverse-vertex-data.py /path/to/Sky
SKY_DATA=/path/to/Data npx tsx tools/model-unbaked-oracle.ts /path/to/Sky
npx tsx tools/vertex-data-oracle.ts /path/to/Sky
npx tsx --test tests/model-unbaked-runtime.test.ts tests/vertex-data-runtime.test.ts
```
