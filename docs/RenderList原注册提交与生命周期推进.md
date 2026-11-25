# RenderList 原注册、提交与生命周期推进

2026-11-22。本轮保留 Windows Vulkan 接口，继续恢复原游戏的模型调度方法。新增的是共享 CPU 原内核及已有 Model/VertexRender 接口连接；主视口尚未换成完整原 Scene 队列，本轮没有新的 Windows FPS 或加载速度成绩。

原程序 SHA256 为 `3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`，来自提供的 macOS/Metal 可执行文件。没有修改原文件，也没有把它当作 Windows 游戏引擎直接嵌入。

## 已恢复的原行为

| 原入口 | 行为 | 核验范围 |
| --- | --- | --- |
| `0x1007b97b0` | 注册到固定槽位 | 首个空槽、重复注册、空指针不处理、容量满断言 |
| `0x1007b9820` | 注销 | 清掉全部匹配注册项，保持顺序删除全部匹配队列项，保留未使用尾部和 queued 字节 |
| `0x1007b9990` | 追加绘制队列 | 先检查 initialized，再写 count 和指针；原入口自身无容量检查 |
| `0x1007f65d0` | 图元计数 | 索引/非索引、选定索引缓冲、偏移/分块断言、uint32 求和回绕、拓扑除法 |
| `0x1007f6540` | VertexRender 提交 | initialized/enabled 非零、queued 恰为 1 的重复断言、有图元才追加；list 为空仍设置 queued |
| `0x1007f6770` | EndQueue | 仅清掉 queued；不负责清队列 count |
| `0x1007ba080` | 查渲染格式上下文 | 未就绪不写输出、可空输出、别名写入顺序 |
| `0x1007b9fc0` | 更新列表格式上下文 | 原复制顺序、实时注册表/容量回读、所有刷新回调后才标为就绪 |

实现见 [render-list-runtime.ts](../src/core/render-list-runtime.ts)，原函数完整边界及原字节 SHA 见 [render-list-native.json](render-list-native.json)。其中非索引分块仍按原代码用所选索引缓冲容量检查 chunk offset，没有擅自修成编辑器认为合理的规则。

## 接口连接与验证

已有 `initializeOriginalVertexRender` 默认调用真实注册/格式查找，`resetOriginalRenderable` 默认调用真实注销；独立原核验需要的显式 ABI override 仍可提供。新增 `submitOriginalModelToRenderLists` 在同一存储上调用原 Model 提交、原 VertexRender 图元判断和原队列追加。场景提供真实地址、存储和 debug 状态，不创建替身 Model。

独立 C runner 执行原机器码，未替换注册、注销、查找、图元判断或队列入口。248 组准备输入、798 次操作快照、26,291,400 比较字节、87 次显式服务回调全部零差异，详见 [render-list-oracle.json](render-list-oracle.json)。所有输入均为明确准备的 ABI 状态，真实地图实例验收为 0。

组合执行包含完整原 VertexRender Initialize → 真实注册/查找 → 完整格式 initializer，完整原 Model Submit → 原队列，完整原 Renderable Reset → 真实注销 → 完整原 RenderPipeline Free。释放组合的反射输入为明确准备的零 UBO 数据，GPU/参数/程序/内存释放仍为服务；其它 UBO/GpuBuffer 子链保留此前独立核验证据。

初始化失败后不继续向缺失 VertexData 的状态提交；原程序会解引用空数据。这是测试准备条件，不能用容错返回冒充原规则。相应诊断保存在开发研究目录。有效生命周期核验包括初始化、提交、释放、重新初始化、再次提交和再次释放。

## 尚未闭合

Scene/Barn 原始分配及每帧 count 重置的所有者、完整排序/绘制、GPU 格式变更和资源引用生命周期仍缺。此前原 mode 3 shader-key sort 证据保留；主视口透明包围盒距离排序仍是编辑器适配，未替换为未经核验的原距离函数。

原完整 Model ctor、实际 LevelMesh `+0x228` 绑定、自动 LOD/Visibility 深度/动画/异步 IO 仍待接齐；本轮不能宣称主视口已使用完整原游戏调度，也不能宣称秒加载或几百帧。Objects/Model/RenderList 完整类与实例验收保持 0，不提高声明类分母或完成率。

本轮项目回归、类型检查、桌面构建与源码同步的最终状态见 [render-list-verification.json](render-list-verification.json)。未改 native Vulkan 源码；桌面构建按既有流程重建 Linux 本地 native 和 bundle，没有重打 Windows 预览 ZIP，也没有新的 Windows 真机验证。
