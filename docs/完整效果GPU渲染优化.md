# 完整效果 GPU 渲染优化

2026-11-22，Windows 0.3.4。用户要求只保留完整效果预览，优先解决卡顿，再继续 Objects.level.bin。

后续 0.3.5：用户报告所有地图白屏，Windows 默认改为普通窗口内画布显示，保留这里的完整 GPU 图和原材质，仅增加最终 RGBA 读回。以下零最终读回成绩仅适用于 0.3.4 原生显示路径。当前恢复方案、开销和验收见 [Windows白屏修复](Windows白屏修复.md)、[white-screen-recovery.json](white-screen-recovery.json)。Windows 设备根因仍未直接确认。

## 结果与瓶颈

界面默认并只提供完整效果。原材质、深度、实体云与云片、雾、运动向量、时间抗锯齿和 Tonemap 的现有预览阶段在 GPU 内衔接。删除基础/快速/自动效果入口，以及单独显示 light0/light1/light2 的画面入口；材质、对象和烘焙数据编辑接口保留。

此前完整预览在每个阶段读回整张浮点图，再做半精度转换、翻转和上传。Dawn 320×180 两帧基线包含 28 次附件读取，读回 15,925,760 字节，初始化及两帧上传合计 91,432,220 字节。渲染阶段多并不是问题本身；反复停止 GPU、跨管道往返和重新准备资源才是这条预览链的额外开销。

新路径使用持久阶段、GPU 附件和独立 CloudCore/TAA 历史。原生窗口每帧只回复 32 字节状态、尺寸和曝光值，没有最终 RGBA 或中间 HDR 管道读回。无原生窗口的诊断入口仅返回最终 RGBA，旧 CPU 链保留为像素对照入口 `SKY_FULL_CPU_REFERENCE=1`。

## 实现边界

沿已恢复的原阶段与 GLSL 连接：Opaque/Alpha → 深度三阶段 → 1/8、1/4 云粗层 → 半尺寸 CloudFluffy/CloudCard 双附件 → FogUpsample → MotionGen/MotionDilate → TemporalAa → Tonemap。显式保留阶段尺寸、UV 翻转、滤波与半精度。Vulkan blit 的半精度舍入与现有 CPU RTE 转换有差异，新增 GPU 位运算转换，保证本轮对照字节一致。

阶段按 16 个固定身份缓存，静态着色器和几何复用，变化资源和云片顶点增量更新。换图时恢复缓存阶段自有纹理再绑定新附件，避免无云地图继承已释放的云视图。曝光首遍固定单位曝光，第二遍更新实际曝光；缓存未变化或重放时也重置计量输入，避免重复使用上一次已经修改的 UBO。

每帧两次 GPU 提交。曝光仍沿既有编辑器算法，少量亮度样本只读取到原生进程；这不是原游戏完整 GPU luminance feedback。最终图像在 Vulkan swapchain 呈现，已有 TAA 后不再次加 FXAA。

完整效果按耗时调整内部尺寸，始终保持完整阶段。Windows 硬件长边初始 1920、范围 1280–2560，受实际视口物理尺寸限制；软件 Vulkan 范围 320–640。240 FPS 是调度预算，不是已实现或测得的设备帧率。

## 验证

最终结果、日志和构建哈希见 `full-preview-verification.json`。`full-preview-graph-check.json` 比较 CPU 参考和 GPU 常驻链；`full-preview-graph-surface-check.json` 进一步检查真实 XCB 窗口；`full-preview-ui-check.json` 检查生产 Electron 的完整效果、换图、导航、矩阵增量编辑与尺寸/DPI。

对照使用实际 Dawn、SkyHub2、WorldEmpty 原资源，检查动画、相机变化、尺寸切换、地图切换和渲染器重启。CPU 参考一致仅证明优化保留既有预览输出，并不证明原游戏整图等价。历史崩溃和重放曝光失败日志保留在 `/root/sky-research`，不计入通过证据。

## 完整链实测

同一 Dawn、320×180、两帧，先参考链再 GPU 常驻链顺序运行。原资源和最终 PNG SHA256 一致：`f81a2534f21fc4f7464c465cf6479e60274af9a47e757e7cb224911e25758175`。这是地形/云链诊断，不含生产编辑器全部模型。

| 项目 | CPU 参考链（已有阶段缓存） | GPU 常驻链 |
|---|---:|---:|
| 两帧管道像素字节 | 15,925,760 | 460,800 |
| 初始化及两帧上传字节 | 73,945,668 | 49,030,612 |
| 总耗时 ms | 14,928.98 | 10,699.52 |
| Node CPU ms | 9,105.69 | 7,392.07 |
| 第二帧合成 ms | 1,145.35 | 469.5 |

GPU 诊断路径的 460,800 字节仅为最终两张 RGBA；原生生产界面的最终像素管道字节为 0。生产 Electron 检查通过 Dawn → SkyHub2 → Dawn → WorldEmpty、模型 #7 平移 3、撤销、窗口尺寸/DPI，单次矩阵请求 1、场景/材质重传 0，43 个成功原生回复未携带像素。

实测软件 Vulkan 的 Dawn 首次加载 26.46 秒、SkyHub2 19.47 秒、重复 Dawn 11.98 秒，导航状态速率分别约 1.51、2.55、1.58 帧/秒；目前仍不流畅。这些结果不替代 Windows 显卡实测，也不与此前简化/快速档比较。

## 仍需推进

Linux 软件 Vulkan 检查不能代替 Windows 真机帧率或透明窗口合成验收。首次加载解析与资源准备仍耗时，秒加载和稳定几百帧未达到。原水、fog-volume、bloom、motion-blur、完整灯光/阴影、Model/Scene 所有权与 Objects 全类生命周期仍有缺口；完整原类和实例验收保持 0。后续优先恢复原曝光/场景资源生命周期、Model/LOD/Visibility/RenderList 与加载缓存，再扩大 Objects 行为覆盖。
