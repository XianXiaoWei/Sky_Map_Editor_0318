# Objects 完成事件与循环变换地图播放

已把 TransformObject 的完成请求接到原 EventBarn 完整 Update、排序和单事件状态机。前一段完成后经原 Event::SetEnabled 请求后一段；共享的事件状态允许循环，不按编辑器自定义计时重排。StormEnd 的 #512（5 秒）与 #433（0 秒）相互触发，#710 与 #738 是另一组；RainEnd #617 完成后触发 #1510。

打开地图 → bin 编辑 → 选择 TransformObject → 播放对象变换。右侧显示当前段及启动次数，暂停冻结整条链，停止还原全部受影响对象。Marker 的范围位移可打开顶部“辅助线框”观察。开始字段编辑或拖动、切换模式或地图会停止整条链，播放不写入 Objects 或 meshes。

33 地图 317 个 TransformObject 配置中，246 个满足当前字段与递归依赖条件，比此前增加 5 个真实根。只接入 TransformObject 完成目标；其他完成目标、缺字段、未接空间类、音效、Timeline、stepped 在播放前说明原因并阻断。可用性是依赖检查结果，不是完整场景验收。

[原机器码核验](transform-sequence-oracle.json)：5 组真实 RainEnd/StormEnd 子图，320 帧、11,104,768 比较字节零差异。每帧比较整块准备对象内存及包含全部 1,280 槽身份的 EventBarn 前缀；原 Update/排序、TransformObject 更新/完成与反射 Event::SetEnabled 连续执行。四个循环根保留共享状态，零时长段可能在同一帧完成，启动次数用于观察这种触发。

初始状态是已完成显式加载的编辑器快照，槽登记/顺序、类别与 metadata 转换、Heap/scratch、GameTime 是准备输入或服务；后续 libm 使用独立原执行输出，并核对输入位模式。此报告不证明原创建、完整 TGCL/metadata/default 或实际场景加载。原构造/加载内核沿用已有独立报告，浏览器数学仍不声称与原平台逐位等价。新子图均为 Marker 端点；LevelMesh 矩阵内核沿用已有核验，原 Model 指针仍为加载前准备的 null。

实现：[transform-object-preview.ts](../src/core/transform-object-preview.ts)；原执行 harness：[native-transform-sequence-oracle.c](../tools/native-transform-sequence-oracle.c)。回归覆盖每帧原快照、循环接力/重复启动、暂停与全部矩阵还原、序列化不变、递归遇到缺依赖时的写入前阻断。

[本轮检查](transform-sequence-verification.json)、[地图播放检查](transform-sequence-smoke.json)、[运行截图](transform-sequence-map-preview.png)。26 类核心子链、856/2830（30.25%）清单比例保持，完整原类/实例验收仍为 0；完整 Model 创建/LevelMesh 绑定、GPU 原绘制、碰撞、其他完成目标、音效、Timeline 和 Avatar 完整生命周期继续恢复。
