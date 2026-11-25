本次继续补齐 `FishV2.AI` 五个状态、`Pursuit`、累积避障及两个对象过滤函数，并接入正式 Update 与转向力组合。1,460 组独立原程序对比、223,247,120 字节、49,770 次调用，零差异。详细证据见 `docs/fish-ai-verification.json`。

本轮补齐 `FishV2.Update`（`0x100337540..0x1003384a0`），以及它使用的原转向、侧倾缓存更新和运动变换读取。独立执行原程序的 493 组用例，比较 67,319,568 字节、14,027 次调用，零差异。

覆盖速度积分与上限、纵向阻力、最多三次碰撞修正、接近竖直方向时的旋转修正、姿态基底、模型变换、四种动画权重、水面材质判断与涟漪请求、可选光源、完整 16 项变换的 NaN 断言、玩家受惊与交互，以及计时随机后续请求。连续帧和回调后重新读取的参数、模型、动画、位置及计时器均纳入对照。正式的转向／侧倾／运动变换组合也单独比较。

原数学函数输入和输出逐次记录、回放；`sincos` 的高两项由调用方明确提供。保持四项向量的 W 运算、原加法顺序和无序比较，不把 JavaScript 数学库视为 macOS 数学库的替代证明。

`FishV2.AI`（`0x100335a40..0x1003370c0`）已在本次恢复并验证。本轮已修正反汇编边界：`0x1003370a4` 开始是五项相对跳转表，之后是填充，不能当成代码。先前的 Update 单独对照保留 AI 外部服务；本次新增对照已经实际调用 AI、Begin／Avoidance／Flee／Seek／Pursuit／Wander／Flocking／End 和运动函数。碰撞、元数据、轨道几何、动画、光源、水面及玩家交互等真实场景 owner 仍需接入；整个场景运行尚未验收。

`CharFishGroupAnim` 是 `LevelMesh` 资源，和 `FishV2` 独立。33 张原地图中有 5 个鱼群模型实例、10 个 `PlayAnimation`、5 个 `OnRegion`、5 个轨道移动事件和 5 个延时重启事件。原字段、引用、轨道点及动作范围已经核实，地图原字节回写保持一致。

| 地图 | 鱼群 | 进入区域 | 受惊动画事件 | 重启延时 | 轨道移动事件 |
| --- | ---: | ---: | ---: | ---: | ---: |
| DayHubCave | 660 | 414 | 535 | 889 | 942 |
| DayHubCave | 772 | 950 | 120 | 935 | 948 |
| Prairie_Village | 98 | 2399 | 2493 | 3044 | 248 |
| Prairie_Village | 865 | 214 | 746 | 3045 | 613 |
| SkyHub2 | 535 | 1410 | 239 | 1465 | 2428 |

上述触发器均使用本地玩家位置，`useCameraPos=0`、`onEnter=1`、`fireOnce=1`。它们启用事件组中的 `PlayAnimation`，序列名为 `Disturb`；同组 `Delay` 在 4 秒后重新启用原触发器。另一动画事件选择 `SwimAround`。保存的序列名与可用的 `DayHubFishDisturb`、`DayHubFishSwimLoop` 动作资源分别记录，原序列注册表绑定尚未验收。

沿轨道运动和区域／延时／动画的完整 EventBarn 场景组合仍待接入；本轮的地图审计通过只说明保存的关系与资源范围正确。33 图没有实际 `FishV2` 节点，不能用 FishV2 函数对照代替这 5 个 LevelMesh 鱼群的行为验收。

冥龙 Update 后半段、螃蟹 Update、FishV2 真实场景资源和生物生命周期、切图及 Windows 真机验收仍在打包门槛内。完整生物类数量保持 0。遵照用户要求，生物完成前不生成新的 Windows 压缩包，也不做 APK。

可复查文件：`docs/fish-update-native.json`、`docs/fish-update-oracle.json`、`docs/fish-group-map-audit.json`、`docs/fish-update-verification.json`。
