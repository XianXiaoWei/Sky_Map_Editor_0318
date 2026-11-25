# Objects 数值与平滑控制地图播放

2026-11-20：FloatAdd、FloatMult、SetFloat 接入现有 EventBarn 地图播放链。bin 模式选择这三类，点击「运行对象事件」，右侧显示本次运行的 Float 值。数值可与同一依赖图中的 TransformObject.progress01 共用内存；暂停冻结整链，停止重建保存输入并恢复模型矩阵。模式切换、切图和字段编辑清理运行状态。

[联合原机器码对照](set-float-map-preview-oracle.json)通过 362 组、9,146 帧、307,419,512 比较字节，零差异。342 个真实根包含 238 Enable、54 Delay、1 IfEnabled、31 FloatAdd、14 FloatMult、4 SetFloat；20 组合成输入独立计数。普通根每组 25 帧；单独的临时平台演示比较 121 帧。328 次 logf/expf 输入与输出按 float32 位模式重放。实际模型、资源装载、原 GPU 和完整场景生命周期不属于这项对照。

33 图七类共 589 个配置满足字段与递归依赖预检，其中 SetFloat 为 4/4、FloatAdd 为 31/31、FloatMult 为 14/14。预检不表示所有延迟已经结束，实际显示还要求受影响的模型资源已加载。

FloatAdd 保留 target / amountFloat / output 的独立或别名关系，先限制 max 再限制 min。CandleSpace #449 从保存的 input 0 输出 -0.15 到另一 Float，持续运行时不会自行积累到 input。Prairie_Village #1812 每帧 -0.1，但保存输入和下限均为 0，正确结果保持 0。此前界面测试等待负值的预期已修正；临时副本只将 Float #765 初值改为 0.9，单独检查逐帧递减、暂停、恢复、重启及文件哈希。[数值界面检查](numeric-map-preview-smoke.json)通过。

SetFloat 保留原 time、targetValue、snappiness 和启用捕获行为。全部实际保存配置 time=0，会在第一次更新写入精确终值并结束；平滑过程由明确修改的临时输入单独验证。snappiness=0 不进展，snappiness=30 直接结束，time=2 的原中间值可能超出 targetValue，不能自行归一化。logf/expf 是明确服务，界面使用 float32 包装的 JavaScript Math；原 macOS libm 与目标硬件精度仍未验收。

固定的 progress01 不等于所有矩阵字节都固定：continuous 模式仍按原增量移动；绝对变换的 transformRot=false 路径仍会规范化当前四元数。两种单次 FloatAdd 控制模式已加入整块原状态对照，位置和数值的验收不再错误要求持续规范化的旋转字节完全不变。

平台画面演示使用 DayHubCave 的原 PlatformRain_01（LevelMesh #339）、TransformObject #270 和目标 #451。临时副本把 SetFloat #43 的 time 改为 1、snappiness 改为 0.3，将 #270.progress01 接到 Float #874，再通过 Enable #444 / Clump #84 同时启动两类。共 8 项修改全部记录在 [演示准备器](../tools/set-float-map-preview-map.ts)的输出；原模型、端点变换、BstBaked.meshes 与参考文件保持原样。这个接线是准备的演示输入，不计为原地图的自动启动逻辑。

[平台界面检查](set-float-map-preview-smoke.json)通过：真实 #43 首帧结束；准备链共享数值驱动原平台矩阵，暂停冻结，恢复达到精确终值 1，停止/重启还原，模式/切图清理，原与临时保存文件哈希不变。两张实际 Electron/Vulkan 图片：[初始位置](set-float-map-preview-before.png)、[运行中](set-float-map-preview-moving.png)。拍摄使用 light0 烘焙检查和原网格线。DayHubCave 默认原材质入口另出现 12 个非有限 RGB 分量并导致 Vulkan 退出，已保留 [失败边界](set-float-map-preview-material-boundary.json)；这部分仍未通过，图片不代表原材质画面或完整原游戏效果。

当前项目 360 项测试通过，TypeScript 检查和源码构建通过。核心子链仍为 26 类，检查项比例 30.25%，完整原类与完整原实例验收仍为 0。BstBaked 的资源消费、模型与 Vertex 核验结果保留，完整 Model 创建/绑定/原材质绘制仍待恢复；Avatar 的出生定位、静态几何与独立相机结果保留，运动、碰撞、蒙皮和完整生命周期仍待恢复。

[本轮汇总](set-float-map-preview-verification.json)记录 589 个依赖预检候选与验证边界。[截图比较](set-float-map-preview-screenshot-check.json)在视口区域检测到 84,948 个超过 8 色阶差值的像素；没有独立记录两次相机矩阵，不能将这个数值作为原材质或相机一致性证明。源码增量同步，正式包和参考资产未改。

实现：[依赖预检](../src/core/object-playback-plan.ts)、[地图播放](../src/core/transform-object-preview.ts)、[原 SetFloat 更新](../src/core/set-float-runtime.ts)、[原执行 harness](../tools/native-object-logic-preview-oracle.c)。
