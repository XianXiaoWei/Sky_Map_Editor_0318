# 共享渲染与 Avatar 滑移推进

2026-11-21 12:50 UTC。按用户要求将 Avatar 提为同批重点；Objects 模型调用与 BstBaked 消费优先级保留。共用内核按批实现和核验，全部基础类、环境类、逻辑类仍继续推进。本批没有完整原类／完整游戏验收。

## Objects 与 BstBaked

`BeamoBarn.Load 0x100196094..0x100196447` 整个材质／renderable循环恢复，包含三阶段、两子组、Alpha 后缀、Shader／Image引用观察和释放、所有向量／纹理参数绑定。复用已核验的原 ResourceRef 构造／Observe／清理；缺纹理请求后按当前引用绑定，允许 null，不填入猜测贴图。

完整正常 `Scene.GetRenderListByName 0x10017e8d0` 覆盖原 23 个名称、null／空返回和未知名称断言。完整正常共享 `VertexRender.Initialize 0x1007f5e90`／`InitializeFormat 0x1007f5fb0` 恢复注册、格式检查、VertexData／ShaderDef、程序创建和参数／顶点流绑定的原写入顺序。这两项可复用给 Model、Beamo 和其它绘制类。原初始化只清零 32-byte format scratch；不能读取未初始化的后续栈字节。原 0x134-byte memcpy 来源是 VertexData。

[原指令报告](beamo-render-oracle.json)：**180 组／569,675,792 字节零差异**，其中 147 准备配置及全部 33 张地图、7,150 Beamo／Decal、309 材质和 252 绘制组。比较全部 3 MiB live memory 与 13,442 个顺序服务调用。真实材质默认 shader／参数、声明名称和 Image 文件存在、独立分组数量参与准备；资源异步加载／反射和 GPU 输入仍为明确服务。

同一运行记录与 VertexData 已在组合测试中通过全 LOD 上传 → 分组 → 渲染初始化／纹理绑定 → Shader／Image引用清理。上传服务与 GPU／RenderList 服务明确保留，不能称完整绘制。BstBaked Mesh 检查项仍为 5/10；新证据写入部分项，未把子链算作完整注册／绘制／烘焙生成器完成。

## Avatar

完整正常原滑移函数 `0x100147230` 恢复八次迭代、第二次 0.05 探测、速度投影／保留初始速度、0.001 剩余距离门限、实时状态读取及可选输出的别名顺序。未使用 SIMD W 也参与全字节对照；不能用常见三维归一化公式替代原寄存器排列。

完整正常动作定位请求 `0x100147c70` 保存初始物理位置／forward、请求 forward、duration／delay、名称和位置差；包含原名称长度断言与日志回调后重读。它是动作状态准备，动画资源载入、骨架播放和混合仍待恢复。

新增完整正常受力队列 `0x100148780`、默认最大速度包装 `0x100148750` 和导出 `0x100148920`，以及独立 nearby-effect 队列 `0x100148690`／导出 `0x100148700`。保留原 32 槽／32-byte stride／padding、容量和断言、alias顺序；导出不自动清空队列。nearby 队列保留原 count==32 判定和平方距离 400 门限。

[原指令报告](avatar-locomotion-oracle.json)：**534 组／35,150,048 字节零差异**（滑移264、动作60、受力120、nearby90）。这些是准备配置，未冒充真实 Avatar 地图运行覆盖。

`AvatarSlidePreview` 将原滑移接入实际 Avatar 模式，与出生定位使用同一 `0xd00` 物理状态。移动／重置／放置同步位置和速度，保留独立相机与编辑器相机恢复。三角网格球形接触、速度／重力／跳跃参数和资源静态姿态仍是编辑器服务。Avatar 模式的画面仍是静态原模型；骨架／animpack／换装／原输入和完整游戏 UI 尚未接通。

组合回归核验同地址位置 setter → 动作请求 → 受力 → 滑移；实际三角网格回归核验地面、薄墙、跳跃、暂停和源顶点保持。实际 Electron／Vulkan 检查及项目验证汇总见 [最终核验](beamo-avatar-verification.json)。

## 下一批

Avatar 继续作为重点：沿动作请求到实际动画状态消费，恢复 animpack／骨架／蒙皮与运动同步；继续原每帧碰撞、能量／受力、输入和相机。Objects／BstBaked 补 ResourceManager／Barn.Load 前半段、RenderList／参数／buffer 生命周期、Model构造／Visibility／绘制与重烘焙生成器。所有基础类、环境和逻辑的 factory／注册／启动／生命周期依赖同步推进。

只增量同步源码、dist、测试、证据与清单，不重打 release、不改原地图／reference。Windows／原 Metal 真机验收仍未完成。
