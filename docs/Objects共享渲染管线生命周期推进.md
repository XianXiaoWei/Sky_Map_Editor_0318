# Objects 共享渲染管线生命周期推进

本批接续 Objects.level.bin 的模型调用优先级，恢复 Beamo／BeamoDecal 共用的七个渲染管线正常原内核，并把它们接到同一地址的材质加载入口。Model 的完整资源加载、GPU 和场景启动仍待恢复，完整类／实例验收仍为 0。

| 原入口 | 本批恢复范围 |
| --- | --- |
| RenderPipeline.Initialize `0x1007bfd80` | 验证 texture／uniform 名称排序，逐 UBO 创建请求与 CPU backing 分配，uniform 指针表、管线清零及参数集创建请求 |
| RenderPipeline.SetVertexData `0x1007bdfd0` | 零尺寸先跳过，六槽／layout stride 断言，保存 buffer／offset，读取实时参数句柄和原 read-ID 后请求绑定 |
| RenderPipeline.Free `0x1007c0cc0` | 先把 program 标为 -1，释放 UBO 和 CPU backing，销毁参数集后释放实时 uniform table；重复调用保留原断言 |
| GpuBuffer.GetReadId `0x1007950a0` | 原 readIndex／idCount 断言及 ID 读取 |
| GpuBuffer.Reset `0x100794f80` | 先 detach 映射的 write-ID，逐 ID 请求销毁并重读 count，清空全部 40 字节 |
| VertexData.Reset `0x1007f5250` | 重置十四个嵌入 buffer 与原 header／complete 字段，保留 AutoLister／name／owner 和未写区 |
| Renderable.Reset `0x1007f6b80` | 任意非零 initialized 时注销列表、释放管线、销毁实时 program；恢复原矩阵／OBB／状态，保留 list pointer |

实现位于 `src/core/render-pipeline-runtime.ts`；`connectOriginalVertexRenderPipeline` 可供共享 VertexRender 初始化调用，`prepareOriginalBeamoRenderablesWithPipeline` 在 `src/core/beamo-render-runtime.ts` 把整段材质循环接到这些原 CPU 内核。两者读取调用方的 live memory，不创建替代 Model，也不从材质字段猜造真实 Shader 反射。

原程序对照见 [render-pipeline-oracle.json](render-pipeline-oracle.json)，入口字节 SHA 与边界见 [render-pipeline-native.json](render-pipeline-native.json)。222 组包含 189 组准备输入和全部 33 图的原材质／分组输入，涉及 7,150 个 Beamo／Decal、309 材质和 252 绘制组。全部 709,077,336 字节及 41,880 次有序服务调用、断言 line／severity 零差异。

准备输入覆盖 texture／uniform 空表、排序／重复／逆序、UTF-8 字节排序，0..6 个 UBO，0／16／64 字节 backing，空 buffer 跳过、0..7 绑定槽、stride 0、read-ID 门控、十四缓冲的非空释放和映射 write-ID。还覆盖 create／allocate／bind／destroy／free／unregister 回调期间的计数／句柄／table 变更、重复 free、默认矩阵中的 NaN／Infinity／signed-zero／subnormal。负 reflection count 与超出准备堆容量仍为显式边界，不宣称复现无效原内存崩溃。

有意义的组合测试在 `tests/render-pipeline-runtime.test.ts`：同一 Beamo 运行记录和 VertexData 经两 LOD 上传、材质分组、原 VertexRender／管线初始化、纹理绑定服务，再经历原 VertexData／Renderable／管线释放；检查服务顺序、十四缓冲清零、list pointer 保留、上传数据和资源引用清理。原 `beamo-render` fixture 也继续重放。

GPU reflection、program／buffer／parameter-set 创建和销毁、vertex binding、allocator、RenderList 注册／context／注销和 default matrix 都是明确服务。33 图的 serialized 材质／资源／分组输入来自上一批已核验 fixture；本批给它们准备排序 reflection 名称和 UBO 大小，不能算真实 Shader 反射已恢复。参数 vector／texture setter 内部仍是服务；完整 RenderList 所有权、Barn 卸载、实际 Visibility／skirts／绘制、ResourceManager IO、原 Model 和整个场景启动继续补齐。

原 x64 函数在 SHA 固定的 Mach-O 映像中执行，Linux／qemu 和 libc 是能力边界。本批新增 import 跳板只覆盖五字节，避免六字节相邻 Mach-O import stub 相互覆盖。GPU 服务目标放在未执行的 Beamo upload helper 区域，本 oracle 不同时声称该 helper 原样执行。Windows／原 Metal／原游戏真机验收尚未完成。

开发文件增量同步到下载目录，原地图、Mesh 和 reference 不改，release 不重打。最终项目检查和哈希收据见 `docs/render-pipeline-verification.json` 与 `/root/sky-research/render-pipeline-sync-verification.json`。
