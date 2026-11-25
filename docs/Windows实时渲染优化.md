# Windows 实时渲染与原方法续接

用户要求：优先 Windows 流畅运行，保留 Vulkan 显卡接口，按原版游戏方法渲染；性能后继续 `Objects.level.bin`。当前版本 0.3.3。

Windows 原先逐帧 GPU 读回 RGBA，经过原生管道、Electron IPC，再由网页 `putImageData` 显示。默认原材质路径现在在 GPU 内完成天空/雾/透明/Tonemap，直接写入原生 Win32 child HWND swapchain，每帧仅回复 20 字节状态。网页工具与输入由独立透明窗口覆盖。原程序为 macOS/Metal，当前工作是恢复原算法、运行链与数据消费，再通过 Vulkan 执行；没有直接移植或嵌入原游戏引擎。

## 本批实现

- GPU 完成状态后用 MessageChannel 继续下一帧，始终只有一个请求。Win32 支持时采用 MAILBOX，否则 FIFO。隐藏/忙碌时回到网页 RAF 调度。
- 自动原材质档以 `1000/240 ms` 为帧预算；长边初始 1920、下限 1280、上限 2560，受视口物理尺寸限制。慢帧保留原 shader 与贴图，不自动改为无贴图基础材质。预算不是实测帧率。
- 原 `Visibility::QueryAABBs`（0x100721ce0）的 frustum-only 分支接入视口。Mesh0/Mesh27454 原顶点阶段经过内容 SHA 核实：位置只由原 model/viewProj 矩阵变换。其它位移、动画或未审查 shader 继续显示。
- 原 shader、材质贴图、opaque/alpha/depth 输出、变换矩阵与已有原状态规则延续。绘制世界盒和相机快照仍为明确适配，加入保守边界；原软件遮挡深度、Barn 查询来源、完整 Model/资源/LOD/RenderList 所有权仍未闭合。
- 确认可见性后再打包 uniform，隐藏模型跳过无用更新。probe 变化仍同步共享贴图；重新可见时写入当前矩阵与参数。
- 96 MiB GPU 纹理共享缓存、64 MiB 解码/mip 缓存、48 MiB Beamo 几何缓存及预编译 shader；模型准备批量 RPC，原材质/环境/LUT/probe 改为 patch 现有资源。
- 模型互动只增量提交矩阵，辅助线与选中框独立上传；点选空间索引保留原三角形顺序。暂停/相同控制器矩阵和 enabled 状态不重复发送，停止/重启清理去重状态。
- 修复初始化前提前读回、缩放请求错误处理、跨 DPI 分辨率刷新，以及窄视口中的预览按钮可点击性。

## 验证与限制

完整项目测试、TypeScript、Windows PE 交叉编译、Linux Vulkan 原 shader/贴图/深度/透明/共享资源与 swapchain 检查；原模型隐藏返回视野、增量矩阵与完整导出的像素对照；生产桌面 UI 的 Dawn/SkyHub2/Dawn 换图、WASD、编辑/撤销、缩放/DPI、WorldEmpty 清理；原事件链的播放/暂停/停止/重启。最终结果以 [验证报告](windows-performance-verification.json) 为准。

Linux XCB 用于共享显示代码与桌面 UI 检查。它的独立测试窗口不验证 Win32 HWND、透明双窗口合成或 Windows 显卡驱动。没有 Windows 真机实测，也没有稳定几百帧验收。右下 FPS 是完成渲染请求/呈现状态回复速率，不能等同于显示器实际显示帧率。

首次复杂地图仍需解析、解码、模型准备与上传，尚未秒开。完整实体云/TAA档仍保留昂贵读回路径；局部灯光、原阴影、水、曝光与完整原游戏画面有缺口。软件 Vulkan 的低帧率不代表 Windows 显卡成绩。

## 继续原逻辑

先闭合 Scene → 资源观察/常驻 → Model 创建/LOD → Visibility 软件深度/对象来源 → RenderList 提交与释放，再沿相同对象地址接回 `Objects.level.bin` 的启用、变换、环境和互动。地图预处理缓存、后台准备与资源常驻用于后续换图优化。已有 Emitter/Mote/SpawnMotes、水、粒子、局部灯/阴影等缺口保留，完整类/实例验收仍为 0。

独立 Windows ZIP 保留旧发布包；完整源码 ZIP 含 Data、代码、原生库源码与已构建二进制、测试和证据。Windows 运行包已带预编译 shader，无需 Vulkan SDK。设置 `SKY_WINDOWS_CANVAS=1` 可用于排查原生窗口兼容性，此路径有整帧读回开销。

最终 Linux 软件 Vulkan 实测：Dawn首次约 20.53 秒，SkyHub2约 15.56 秒，重复Dawn约 10.53 秒；导航状态回复约 4.65–6.85 FPS。模型 #7 平移3约 1.27 秒到增量渲染回复，1次矩阵请求、场景/材质重传均0。全程完成的原生视口回复像素字节为0；暂停控制器矩阵/enabled重复请求均0。时间不代表 Windows 显卡成绩。
