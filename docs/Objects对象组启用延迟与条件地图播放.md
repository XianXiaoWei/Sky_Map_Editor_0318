# Objects 对象组启用、延迟与条件地图播放

2026-11-19，Objects.level.bin 的 Enable、IfEnabled、Delay 和嵌套 Clump 已接入统一地图播放。bin 模式选择前三类，点击「运行对象事件」；TransformObject 仍使用「播放对象变换」。原 EventBarn Update/排序驱动整条事件链，支持对象组启用/关闭、条件判断、延迟输出及后续变换。暂停冻结整链，停止还原矩阵和编辑器可见性，编辑、切换模式及切图清理播放状态。

33 张地图的当前字段/递归依赖预检如下，合计 540 个候选；实际运行还要求受影响模型已加载。预检通过不表示完整原场景已恢复。

| 类 | 保存配置 | 满足当前依赖 |
| --- | ---: | ---: |
| TransformObject | 317 | 246 |
| Enable | 1,287 | 239 |
| Delay | 284 | 54 |
| IfEnabled | 36 | 1 |

[原机器码联合对照](object-logic-preview-oracle.json)通过 301 组、7,525 帧、263,925,600 比较字节，零差异。其中 293 个真实根包括 238 个 Enable、54 个 Delay、1 个 IfEnabled；8 组合成混合链使用真实字段组件，单独计数。另一个依赖预检通过的 Enable 超出当前 native harness 的 48 节点/受影响对象容量，未计入真实根对照。每根执行 25 帧，长延迟可能仍在等待，不能称所有真实事件已完整结束。

原 EventBarn 完整 Update/指针排序、首帧装载/启用/更新/完成，以及 Enable/IfEnabled/Delay/TransformObject、递归 Clump SetEnabled、ObjectFactory Get/SetEnabled 和 Event/Marker/LevelMesh 原反射 wrapper 连续执行。每帧比较整块准备对象内存、分配游标和包含 1,280 槽身份的 Barn 前缀。Delay 使用原帧时间钳制 0.0001～0.266 秒；启用请求按原槽遍历顺序在同帧或后续帧生效。

IfEnabled 使用原保存字段 areTheseObjectsEnabled。Clump 缺少聚合 GetEnabled 时保留原缺方法默认 true，不把成员启用状态自行合并成条件。Marker 的保存 enabled 字节显式装载；LevelMesh 使用已恢复的启用/矩阵接口。直接 Clump 同步递归循环、waitForBeat、缺字段、未知目标、音效、Timeline 和 stepped 在场景写入前阻断，原因见 [候选清单](object-logic-preview-availability.json)。

构造与保存字段准备、metadata/类型转换、槽登记及顺序、Heap/scratch 与 GameTime 是明确输入或服务；Linux libm 使用独立原执行输出回放并核对输入位模式。真实 LevelMesh 的 Model 指针仍为加载前准备的 null，地图效果通过已有编辑器模型显示。此报告不证明完整原构造/资源装载、Model 创建/绑定、原 GPU 绘制、自动启动、碰撞或 Avatar 完整生命周期。

[地图运行检查](object-logic-preview-smoke.json)保留 CandleSpace Enable #31 对 12 个 TutorialRocks LevelMesh 的状态验证。可见性截图使用 CandleSpaceEnd 原 Enable #201 关闭 AncestorStatueNight_01（LevelMesh #448），停止恢复；同一镜头检查画布像素变化，未编辑原字段。拍摄使用 light0 烘焙查看及地图真实网格线叠加，便于辨认现有模型；普通材质预览层次和完整原 Model 着色仍待闭合。两张实际 Electron/Vulkan 截图：[关闭后](object-logic-preview-disabled.png)、[停止还原后](object-logic-preview-restored.png)。

2026-11-20 补充 [编辑器模型 RGBDepth 检查](object-preview-depth-check.json)：原 Mesh GLSL 的 `min(256000, 1/gl_FragCoord.w)*0.1` 深度规则接入通用不透明模型 HDR 输出，避免用固定 opacity 代替雾效输入深度；透明层/编辑器辅助线保留底层深度。5、10、20 单位距离与覆盖层的实际 Vulkan 输出已检查，普通 RGBA 显示保留。播放时继续遵守 LevelMesh 保存 render 标志。此修复仅闭合编辑器模型与合成深度的连接，不增加完整原 Model/GPU/场景验收。

[本轮完整检查](object-logic-preview-verification.json)汇总原对照、351 项项目测试、15 项相关测试、TypeScript/构建及旧 TransformObject UI 回归。实现见 [依赖预检](../src/core/object-playback-plan.ts)、[地图播放内核](../src/core/transform-object-preview.ts)与 [原执行 harness](../tools/native-object-logic-preview-oracle.c)。

26 类核心子链、856/2830（30.25%）清单比例保持，完整原类/实例验收仍为 0。BstBaked.meshes 的 10,653 条记录快照资源消费、1,152 Mesh/1,231 LOD 和 Vertex 数据构造结果保留；完整 Model、LevelMesh +0x228 绑定、GPU 上传/提交/绘制/释放继续闭合。Avatar 的出生定位、静态几何与独立相机/位置震动结果保留，完整运动、碰撞、蒙皮和生命周期仍待恢复。
