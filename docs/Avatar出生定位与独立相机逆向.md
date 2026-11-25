# Avatar 出生定位与独立相机（2026-11-18）

Avatar 面板显示实际默认单网格定义中的身体、头发和斗篷，并允许明确选择 Objects.level.bin 中的 AvatarSetPos。本轮把出生事件接到原底层物理位置写入、Euler 朝向、AvatarBarn 就绪门控和完整 Whisker 初始化/重置局部链。进入 Avatar 使用独立相机；退出时继续使用原编辑视角。

原程序 SHA256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。

## AvatarSetPos 原更新链

完整原 `Update`（`0x100149c40`）在原地址运行，未删除落地或日志分支。与原 AvatarBarn 本地选择/getter、Avatar::SetPosition、Marker 方向、Euler 转换及 Event::Start 组成局部调用链。167 个用例、4,504,004 个比较字节、零差异；含全部 59 条真实 flag/Marker 变换快照。见 [核验报告](avatar-set-pos-oracle.json)。

覆盖：没有本地玩家时直接返回；四项出生覆盖按顺序短路且只 Start；断开牵手后的 state 指针重读；16 字节动量清零；相对 Marker 下的位置与方向变换；单次向下查询及随机最多 1,000 次查询；筛选失败回退；牵手组相对位移传播；Event sequence 及状态。

定位读取的 `0x10022ddd0(hit, 0x50)` 是碰撞材质通道查询，不能当作射线距离或归一化距离。随机落地法线与世界竖直方向比较；50° 阈值使用原 float32 常量。`0x100146d00` 输出 Euler 的三个分量，第四分量保留目标临时缓冲字节，随后复制到两个状态槽；它不是 quaternion。

上述 167 组是保留的首版核验配置，底层两个物理 setter 在该配置中是服务。当前扩展配置保留原 Update 的完整分支，直接执行两个原 setter，并继续执行原就绪门控、Euler→forward 和 Whisker 初始化/重置。Marker 虚拟矩阵、逆矩阵/乘积、碰撞/材质属性、随机源、牵手 group/member/peers/leader 和 libc++ 日志仍为明确服务边界。libm 返回由 Linux 捕获并重放，尚无 macOS libm 或真机一致性结论。测试输入以十六进制保留负零；JSON 数值仅用于阅读。

真实快照不证明场景启动顺序、账户覆盖状态或默认出生选择。面板明确选择候选，未将 43 条 `setLevelStartPosition=true` 自动视作地图入口。缺少默认字段的候选保留未知并禁用放置。编辑器接入使用自己的矩阵、三角查询、材质通道占位和明确的预览运行参数，不代表原物理/碰撞/牵手系统完成。

## 原物理状态与相机联合核验

[扩展核验报告](avatar-physical-oracle.json)：487 组、8,317,116 字节、零差异。包括原 167 组 Objects/Avatar 定位配置（59 条真实 flag/Marker 快照）、168 组普通/即时位置写入与别名输入、128 组 Euler→forward 和 24 组相机就绪门控配置。比较全部非指针 Event 字节、两份完整 `0xd00` 字节物理状态、完整 1,024 字节相机状态以及依赖调用参数/顺序。

普通位置函数 `0x100146de0` 先保存所需位置到 `+0x130`，再依据 `float32(state[+0xe4] * float32(0.07))` 和运行时全局向量 `0x1020041f0` 计算物理位置，写入 `+0x10/+0x20/+0xc80`；清除速度、多个标志及计数。第三参数为真时，所需位置 Y 再加 `float32(0.01)`，并清零重叠区域 `+0xba4..+0xbb1`。原 Avatar::SetPosition 的普通路径传入真。

即时位置函数 `0x1001480d0` 直接写入所给物理位置，反向计算 `+0x130`，不做 0.01 抬升或上述重叠区域清零。两函数保留原输入读取顺序；核验包含输入指向状态自身的七种布局与负零。`+0xe4` 的构造及语义归属仍未知，未将它命名为原角色半径；运行时向量和相机 BSS 字也不是文件默认值。见 [原函数和常量证据](avatar-physical-native.json)。

界面采用足够大的状态缓冲和这两个原写入实现。预览明确提供 `+0xe4=0`、全局轴 `[0,1,0,0]`，保留原普通路径的 0.01 修正。这些是编辑器运行参数，未冒充原构造值。

## Avatar 与编辑器相机分离

原 `CameraSystem` 注册入口 `0x1001e4810` 明确绑定 Initialize `0x1001de020`、OnLevelLoad `0x1001de6e0` 和 Update `0x1001def10`。Update 遍历 CameraNode 链并通过虚拟 `+0x18` 更新，保留前后状态，之后准备最终矩阵与输出；它不等同于编辑器 Orbit 相机。

`WhiskerCamera` 初始化 `0x10073aa90` 在本地玩家可用时调用重置 `0x10073ab80`。当前独立核验范围是重置进入机位的 XYZ 子链：

```
offset = [0, float32(0.8), 0]
pivot = float32(Avatar.physics.position + offset)
eye = float32(pivot + float32(Avatar.forward * -3))
```

首版 [相机机位核验](avatar-camera-oracle.json) 保留 64 个用例、576 个分量（offset/pivot/eye XYZ）、零差异。本轮联合核验进一步比较完整 initializer/reset 相机状态，包括姿态基向量、机位历史、Euler、时间、标志和各状态槽写入。

原 Euler→forward `0x100147510` 现按 SIMD 指令的分量排列、逐步 float32 运算和归一化阈值恢复，并在原机器码上核验。它读取 Euler X/Y，未使用 roll；不得直接以常见 yaw/pitch 公式替代。第四分量是未使用的 SIMD 临时值，部分输入会产生 x86 负 NaN；核验保留该字节模式，XYZ 不受影响。`sincosf` 的 packed 返回及上层 SIMD 分量由明确服务提供，Linux libm 捕获不证明 macOS libm/ABI。

就绪门控 `0x1000fe060` 先检查本地玩家及 Barn 的已定位字节，再读取牵手组 leader；无 leader 可就绪，有 leader 则进一步检查其可用性。相机初始化和重置均使用原门控，未一律视作可用。完整原手持组及 leader 查找仍由服务输入。

源码采用两个不同的 PerspectiveCamera 和独立目标/输入状态。Avatar 中禁用编辑器 Orbit/Fly 控制；转镜头、滚轮、跟随和 F/Home 都作用于 Avatar 相机。切回编辑器后恢复原实例的位置、朝向及目标。进入模式执行恢复的完整初始化/重置算术，提供浏览器 libm、预览 tick/BSS 字及可用状态；取原 eye/pivot 用于进入机位。最终绘制仍用预览 lookAt/投影，没有将 reset 的姿态基向量冒充完整 CameraSystem 输出。拖动/缩放/连续跟随仍是预览输入和移动适配。60° FOV、near/far 是当前渲染预览设置，不能当作原最终 CameraGuide/lens 输出。

连续 CameraNode/Whisker 更新、TouchInput、遮挡/避障、CameraGuide 选择与混合、最终镜头参数和原投影仍待闭合。[原相机入口与调用边界](avatar-camera-native.json) 单独列出完整反汇编和间接依赖；这些证据没有被计作完整相机行为。

## 实际角色与界面核验

从 OutfitDefs 的 `isDefault` 单网格条目和原 Mesh 资源 source/编译选项解析文件，实际读取 LOD0：body 2,749 顶点/3,246 三角面，hair 514/418，wing 4,686/3,774，共 7,438 三角面。多网格 mask 变体选择未猜测；默认标记不证明账户实际装备。

显示原静态几何，使用中性顶点着色和可调预览缩放，未恢复蒙皮动画、原 Avatar shader/贴图及角色比例。移动沿用编辑器交互球碰撞/跳跃/飞行适配。所有预览状态不写入 Objects 或 BstBaked。

[实际 Electron/Vulkan 界面检查](avatar-mode-smoke.json) 验证原资源 IPC、出生点选择、两份位置及所需位置槽、速度/标志写入、实际帧、独立相机转向/缩放/跟随、退出编辑视角恢复及切图状态清空。CarryLand3 的测试出生点物理 Y 从 2 变为原 float32 修正后的 2.009999990463257；相机 pivot Y 为 2.809999942779541。253 项测试、TypeScript 和构建通过。[截图](avatar-mode.png) 显示静态角色。没有 Windows 真机或完整原游戏画面验收。

实现：[AvatarSetPos](../src/core/avatar-set-pos.ts)、[物理位置状态](../src/core/avatar-physical-state.ts)、[相机朝向与重置状态](../src/core/avatar-camera.ts)、[独立相机控制](../src/renderer/avatar-camera-controller.ts)、[实际资源解析](../src/main/avatar-preview.ts)、[静态角色展示](../src/renderer/avatar-preview-controller.ts)。
