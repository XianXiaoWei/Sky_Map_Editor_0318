# Windows 全地图白屏恢复

2026-11-22，版本 0.3.5。用户报告上一版所有地图的视口都变成白屏。

## 原因范围

0.3.4 默认在 Windows 创建 BaseWindow、独立 Vulkan 子 HWND 和透明 Electron 覆盖窗口。收到成功呈现状态后，网页画布会隐藏。该状态只能证明提交和呈现调用返回成功，不能证明底层窗口穿过透明覆盖窗口显示到了屏幕。上一版只做过 Linux/XCB 验证，没有 Windows 双窗口实机验收。

本次 Linux 软件 Vulkan 暂未复现用户的全白结果。不能断言是曝光、地图损坏或 Windows 透明窗口导致；Windows 合成路径是尚未排除的重要嫌疑。原游戏 executable 和 Data 保持只读。

## 恢复改动

Windows 默认打开一个普通不透明 BrowserWindow，并将完整 Vulkan 图的最终 RGBA 显示在窗口内的画布上。Vulkan 仍负责原材质、贴图、深度、云、CloudCard、FogUpsample、Motion、TAA 和 Tonemap。阶段之间的附件保持 GPU 常驻，中间 HDR 不经过网页或 Node 管道。

显示方式改变会增加一次最终图像读回和上传，回复由 32 字节状态变成 32 字节加 `width*height*4` 字节。它是恢复兼容性的临时取舍，不能把这一版称为零读回或承诺相同帧率。完整效果硬件尺寸下限仍保持 1280，画布上限 1920；软件 Vulkan 保持 320–640。视口自身尺寸仍可更小。

`SKY_WINDOWS_NATIVE=1` 或 `--sky-native-surface` 保留原生窗口诊断入口。`SKY_WINDOWS_CANVAS=1` 或 `--sky-canvas` 优先强制画布。只有实际开启原生窗口时才暴露对应的网页尺寸桥。

运行包附带 `白屏恢复启动.cmd`。把它放在 `SkyMapEditor.exe` 同目录，关闭编辑器后双击；它固定画布并传入 `--disable-gpu`，仅关闭 Electron 网页 GPU 合成，独立 Vulkan 游戏预览继续运行。这个启动文件也能使用 0.3.4 已有的 `SKY_WINDOWS_CANVAS=1` 入口。

启动方式、Vulkan 设备与渲染/网页错误写入用户配置目录的 `render-diagnostics.log`，超过 1 MiB 轮换保留上一份；不写入 Data。

## 验收

具体结果见 `white-screen-recovery.json`。项目测试和类型检查验证恢复入口及完整效果尺寸下限。额外启用 Khronos 同步验证检查原 Vulkan 链；生产 Electron 检查实际画布像素、导航、换图、模型变换和尺寸/DPI。

Windows 显卡和用户设备仍需要运行修复包验证；Linux 的非白图与像素对照不能替代 Windows 真机验收。原局部光照/阴影、水、Bloom、场景探针和完整游戏效果继续保留为未完成项，本次先恢复可见画面。
