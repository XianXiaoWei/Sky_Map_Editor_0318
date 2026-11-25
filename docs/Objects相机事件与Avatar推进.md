# Objects 相机事件与 Avatar（2026-11-18）

本轮恢复 `SetCameraShake` 和 `SetCameraKeyFrameShake` 的完整 OnStart/Update 局部链，并在 Avatar 面板接入实际地图事件的显式运行、停止、计时和目标参数观察。状态使用独立预览缓冲，不写入 Objects 或 meshes。

[原机器码核验](camera-events-oracle.json)：220 组、1,540 帧、3,642,016 比较字节、零差异，含两类全部 20 条真实字段及 Clump 引用配置。比较逐帧 Event、Whisker、八份关键帧、EventBarn 的非指针状态，以及反射调用顺序、成员数量变化和断言前部分写入。源浮点输入按十六进制保存负零；有限输入导致的 x86 运算 NaN 保留原负 indefinite 字节。

原程序 SHA256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。完整函数地址、边界、哈希和常量见 [原函数证据](camera-events-native.json)。

| 局部行为 | SetCameraShake | SetCameraKeyFrameShake |
|---|---|---|
| OnStart | 清零 `event+0x4c` | 清零 `event+0x58` |
| 时间推进 | 先计算和写入，再加本帧步长 | 先加本帧步长，再计算和写入 |
| 写入目标 | Whisker 的 speed `+0x378`、force `+0x37c`、weight `+0x380` | Clump 中每个 CameraKeyFrame 的 idle `+0x78`、moving `+0x7c`、speed `+0x80` |
| 淡出 | 权重夹紧到 `[0,1]`，保留原小分母判断 | 保留未夹紧权重及原 `0 * (1-weight)` 运算 |
| 结束请求 | 更新时间之前，`elapsed > total` 调用 Event::Start | 更新时间之后，`elapsed >= total` 调用 Event::Start |

`SetCameraShake` 在 `Whisker+0x378/+0x37c` 写入的是两项 float 的原八字节，不是事件指针。该结论与字段字节对照一致，不能仅凭 qword 指令解释为对象引用。

两个 Update 均采用原 float32 时间步长：先将调试缩放（关闭时使用 1）、`Game+0x160` 时钟的 `+0x20` 和 `+0x14` 按原次序相乘，再以原 SSE MIN/MAX 规则夹紧到 `[float32(0.0001), float32(0.266)]`。因此零输入仍得到最小步长。编辑器暂停时明确跳过预览事件更新，而不是把零步长冒充原暂停规则。

核验保留原 `CameraSystem::AcquireCameraHandle` 整个函数体及其临时句柄建立/解除路径；反射 metadata/cast、运行时时钟/调试状态和 stack guard 是明确服务。关键帧测试覆盖空列表、1/3/8 个成员、服务改变成员数量及字段、无效成员断言。实际完整类型装载、所有句柄持有者的生命周期和构造缺字段默认值仍待闭合；真实快照中的缺字段仅在 oracle 使用明确零分配，不被界面视作原默认值。

Avatar 面板仅允许使用完整序列化参数。关键帧事件按原 `Clump.data` 引用解析 CameraKeyFrame；缺字段、无效 Clump 或错误成员保留禁用状态。用户手动选择和运行事件，预览时钟、实例缓冲、类型查找和结束分发由编辑器提供。切图和模式切换清空会话。原 autoStart、场景启动次序和完整 EventBarn 调度尚未接入。

事件计时/参数写入的核验范围与震动画面分别验收。后续 [位置震动与相机推进](Avatar位置震动与Objects相机推进.md) 已恢复完整 Whisker 震动/基底辅助函数并接入独立 Avatar 相机的位置震动；Whisker/CameraGuide 的完整连续更新、关键帧震动采样、避障、最终矩阵/镜头混合与原投影仍待恢复。Avatar 与编辑器继续使用不同相机实例；出生定位及相机重置的上一轮联合核验见 [出生定位与独立相机](Avatar出生定位与独立相机逆向.md)。

[实际 Electron/Vulkan 检查](camera-events-smoke.json) 覆盖 Dawn 两类原事件、实际 Clump 引用和参数写入、停止后时间冻结、模式/地图清理与文件未变脏。[界面截图](camera-events-preview.png)。完整类运行及 Windows 原游戏验收仍为未完成。

[Avatar 回归检查](avatar-mode-smoke.json) 同时确认原身体/头发/斗篷静态网格、出生定位、独立相机控制和返回编辑视角继续正常。255 项项目测试、TypeScript 与构建通过。逐类清单现为 20 类核心子链、850/2830 项（30.04%），完整原类运行 0 类；清单比例不代表玩法完成度。

实现：[原更新链](../src/core/camera-events.ts)、[隔离的预览会话](../src/core/camera-event-preview.ts)、[Avatar 独立相机](../src/renderer/avatar-camera-controller.ts)。
