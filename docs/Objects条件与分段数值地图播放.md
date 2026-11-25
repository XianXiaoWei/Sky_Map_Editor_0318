# Objects 条件与分段数值地图播放

OnFloat、FloatSplit 已加入编辑器统一对象事件播放，与 FloatAdd、FloatMult、SetFloat、Delay、Enable、IfEnabled、TransformObject 共用原 EventBarn 调度和 Float 存储。地图内手动选择事件即可运行满足依赖的子图；尚未恢复完整原地图自动启动。

[汇总](float-condition-map-preview-verification.json)与[原程序核验](float-condition-map-preview-oracle.json)：396 组、9,676 帧、323,130,696 比较字节零差异，349 个真实根与 47 组准备输入分列。全部 2 个 FloatSplit、3/94 个 OnFloat 和新增 2 个 Delay 真实根接通；其余 OnFloat 多被 Timeline、SoundEmitter、SetMeshShaderParam 等输出依赖阻断。每个真实根检查 25 帧，非空 FloatSplit 持续运行，长 Delay 不一定完成。[预检](float-condition-map-preview-availability.json)记录 33 图九类 596 个配置可用，另需其目标模型已加载。

| 类 | 接入保留的原行为 |
| --- | --- |
| OnFloat | 五种比较，float32 差值与严格 0.0001 阈值，uint32 操作符，双侧条件求值，AND/OR；嵌套引用为 BODY 指针，反转使用原始字节比较；分支为 Object 指针，endOnTrigger/checkOnce 各自结束请求 |
| FloatSplit | 输入和初始数量只读取一次，每次成员读取前重查 Clump；按序写共享 Float，保留输入/输出及输出间别名，分段钳制到 0..1；空输出不读取输入，非空输出不自动结束 |

OnFloat 的 24 字节短字符串描述符和复制服务接回原内核。debug 输出、超过 22 UTF-8 字节的长字符串池和同步嵌套求值循环明确在写场景前阻断；普通跨帧事件接力循环仍允许。空分支不会因 endOnTrigger 结束，checkOnce 独立生效。准备案例单独核验未知操作符、严格阈值、两种空分支结束模式、短中文名字、嵌套共享/反转/布尔、FloatSplit 别名及空输入。

实际 DayHubCave 演示由 [准备器](../tools/float-condition-map-preview-map.ts)生成，只改 15 个控制字段/链接，原 PlatformRain_01 LevelMesh #339、目标 #451、TransformObject #270 的模型/变换/网格字段保留。Enable #444 同时启动 SetFloat #43 和 OnFloat #229；共享 Float #874 达到 0.35 后请求 Delay #65，等待至少 0.5 秒再请求 #270。此副本是显式修改输入，不算新增原地图根。原 DayHubCave SetFloat 的 time=0 首帧终值也在 UI 中独立检查。

[UI 核验](float-condition-map-preview-smoke.json)通过，记录 344 个状态快照；阈值前和 Delay 等待期间平台保持原矩阵，Delay 达到 0.5 秒后变换开始。暂停、恢复、停止/重启还原、模式/切图清理和源/副本哈希检查通过。[图片核验](float-condition-map-preview-screenshot-check.json)检查同一相机的完整 world/projection/view-projection 矩阵，两张图完全一致；截图前渲染帧的对象矩阵也与暂停的事件状态一致，视口 84,948 像素发生大于 8 的 RGB 变化。

![触发前](float-condition-map-preview-before.png)

![条件与延迟触发后](float-condition-map-preview-moving.png)

图片来自实际 Electron/Vulkan 地图的 light0 烘焙检查和原线框叠加。原材质路径仍有[12 个非有限 RGB 的异常](set-float-map-preview-material-boundary.json)，本轮没有修复或消除它，图片不表示原材质视觉一致。

366 项项目测试、6 项新增条件检查、TypeScript 和构建通过。核验逐帧比较完整准备对象存储、分配游标、1280 槽 Barn 前缀及所有 math 输入位模式；568 次 logf/expf 原执行服务回放。metadata/字段装载/槽序/Heap/GameTime 与 Linux libm 是明确准备输入或服务，JS Math 仅供预览。原 Model 创建和 LevelMesh 绑定、GPU、音效、碰撞、Avatar、完整场景和 Windows 真机验收仍待闭合；完整类/实例验收保持 0。

复查命令：

```sh
SKY_LOGIC_PREVIEW_REPORT_PREFIX=float-condition-map-preview npx tsx tools/object-logic-preview-oracle.ts
npx tsx --test tests/float-condition-map-preview.test.ts
xvfb-run -a node tools/float-condition-map-preview-smoke.mjs
npx tsx tools/float-condition-map-preview-screenshot-check.ts
```
