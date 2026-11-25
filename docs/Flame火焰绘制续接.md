# Flame 火焰绘制续接 · 2026-11-24

蜡烛与地图独立 Flame 的主火焰已接入原 `Flame60724.vert`／`Flame60724.frag`：从共享原布局记录生成 Sprite，再展开原 24 字节 position／color／UV 顶点。火焰使用现有 Stage 14，与 Flower 一起读取原透明颜色／log-depth 附件，共享不透明深度，随后送入 FogUpsample 和 TAA。未增加 stage 或更改原资源。

[原生对照](flame-sprite-oracle.json) 执行 SHA256 校验后的原可执行文件，共 123 组、16,168,644 字节，零差异。覆盖主图元子段 `0x10033e5e3..0x10033e841`、完整 SpriteRenderer.Add／Reset，以及为单个朝向相机图元供给明确服务后的完整 SpriteRenderer.Render。包含尺寸／亮度／风场／颜色变化、两种锚点、相机重合与轴向退化、重叠输入、容量断言和满内存比较；保留浮点运算顺序、原颜色通道、负 NaN 及截断颜色打包。sinf 返回和硬件 RSQRTSS 估计独立捕获并重放；原主图元子段所有指令和分支保留。

对照发现并修正：随机相位应在颜色第四通道；侧向归一化的加法顺序必须与原 SIMD 一致。测试重建原输入保留 JSON 无法表示的负零，核验独立原生内存哈希。

[实际地图 GPU 检查](flame-candle-map-gpu-check.json) 覆盖 Dawn、SkyHub2、Rain 共 18 帧，验证点燃／启用／关闭／变换／缩放和源文件哈希。相同生产 Flame 批次、相同 uniform 下，仅移除索引：分别确认 31、18、76 个实际火焰像素；颜色和 log-depth 输出均无非有限值。截图：[Dawn](flame-isolated-Dawn.png)、[SkyHub2](flame-isolated-SkyHub2.png)、[Rain](flame-isolated-Rain.png)。本体和火焰分开核验，未把本体亮度变化当作火焰绘制证据。

[点火窗口回归](viewport-ignition-smoke.json) 验证鼠标／X 键、暂停材质时间时立即点火、GPU 重启后保留同一 owner、同图重置删除刚点燃的火焰、黑暗植物变色／缩退／消失及重置恢复。窗口回归结果以该 JSON 的 passed 字段为准。

编辑器调用方明确提供白色无遮挡颜色、采样风、时钟、视锥／距离排序、数学 rsqrt 估计及 GPU／资源服务。RSQRTSS 的原估计只在原生对照中重放；运行视口使用数学估计，不宣称实际游戏逐像素一致。原 SpriteRenderer 其他分支、完整排序、完整 FlameBarn、Flame.Update 交互／传播／水／Avatar／音效后段、辉光／粒子、奖励／网络以及原 GPU／资源 owner 继续待恢复。黑暗植物燃烧缩退仍含编辑器模拟，完整类验收计数仍为 0。

下一步先补 Flame／Darkstone 原交互、传播与消费调用方，再接生物 Model、螃蟹外层更新／碰撞与自主动画。保持用户要求的水面 → 蜡烛／黑暗植物交互 → 生物顺序，完成前不重新打包。
