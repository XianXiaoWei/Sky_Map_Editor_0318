# SetMeshShaderParam 原 Update 与材质接入

2026-11-21：恢复整个原 Update `0x100592940`，并连接上一轮的同一 LevelMesh 材质状态。类的完整构造、enable 名称前缀处理、加载/启动调度和生命周期尚未完成。

[地址证据](set-mesh-shader-param-native.json) 与 [完整函数反汇编](../evidence/set-mesh-shader-param-update.asm) 来自 SHA256 固定的原程序。vptr `0x100cf1c68`，Update vtable slot `0x48`；enable hook `0x1005928a0` 与 allocation `0x100592630` 已定位，未宣称已恢复。

原 Update 先保存旧 elapsed，再把共享 GameTime/debug scale 的 float32 帧量（夹取 0.0001..0.266）加到 elapsed。第 i 个目标只在 **旧 elapsed ≤ i × stagger < 新 elapsed** 时设置参数；循环重新读取 Clump/count。类型分支为 float、float4、texture，pass 固定 0。Float 输入在每个目标实际触发时读取，空 Float 指针使用保存默认值。

Float4 先复制四个保存默认分量到原栈临时向量，再按 X/Y/Z/W 的可空 Float 指针逐分量覆盖。实现也必须使用真实副本；初次独立核验发现 Buffer.slice 的视图会污染默认向量，已改为独立 Uint8Array 副本，随后原内存全字节对照通过。所有 LevelMesh setter 继续操作已有参数表，不创建替代 Model。

完成条件使用本次循环结束时的 count × stagger；满足时清 elapsed，再调用 Event.Start。这个结束时刻与 shader 过渡完成时刻是独立的，过渡继续由 LevelMesh/Model 更新。空 Clump 也走原计时/结束分支。负 stagger、边界等号、NaN、空 cast 和未知 type 的原比较/断言顺序均保留。

[独立原程序执行](set-mesh-shader-param-oracle.json)：**107 组准备输入 / 428 个快照 / 28,094,176 字节零差异**。执行的是未改写的 SetMeshShaderParam Update、LevelMesh 三种 setter/正常更新和 Model 已就绪 LOD 转发。覆盖实时 Float 与默认分量、Float alias elapsed、重复目标顺序、原时钟夹取、负/零逐对象延迟以及断言后的已写状态。

这 107 组不是 359 个真实实例已验收。cast metadata、时钟所有者、Vertex/ResourceManager/ResourceRef/字符串池和 Event.Start 为明确依赖服务。debug override 关闭；完整构造、enable 字符串前缀/释放、地图自动启动/EventBarn 和完整类仍待恢复。

[实际 GPU 接入](set-mesh-shader-param-gpu-check.json) 通过：准备原 Event storage/名称前缀和单个目标，原 Update 驱动同一个 `OriginalLevelMeshMaterialEndpoint`，再通过恢复的 LevelMesh/Model 逻辑更新实际 DayHubCave #339 原 PlatformRain 网格、烘焙、shader/贴图。3 次 Event.Start 服务请求；half、retarget、Black 分别变化 49,413 / 50,021 / 63,287 个 HDR RGB 分量，清理后与初始 HDR 完全相同。3 次材质上传、3 次 uniform 更新，数值变化和同实例重导出复用管线。这个检查证明类接口与材质端连接，尚不是该类在原地图中自动启动。

[实际初始帧](set-mesh-shader-param-before.png)、[过渡一半](set-mesh-shader-param-half.png)、[途中重设目标](set-mesh-shader-param-retarget.png)、[原 Black 纹理](set-mesh-shader-param-black.png) 是生产 Vulkan 帧像素，无线框；原资源未修改。画面曝光/光照、后端和完整场景仍沿已有声明的预览边界，不能当原 Metal/原游戏画面一致。

全类/实例完整完成数继续为 0。下一段闭合 enable 前缀依赖、构造/保存字段映射及统一 EventBarn/地图启动，再推进原 Model 创建/Visibility/释放、Beamo 和 Avatar。
