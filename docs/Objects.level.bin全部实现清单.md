# Objects.level.bin 全部类与对象实现清单

优先 Windows 原材质 Vulkan 的原游戏渲染方法、卡顿与换图优化，再继续 Objects.level.bin；沿 Model/LOD/Visibility/RenderList 及环境依赖推进。先逆向原加载、创建、注册、更新和销毁整体调用链，再按原依赖从基础类向功能类推进。引用到未实现的玩法、交互、UI、贴图、音频、shader、BstBaked 或 Avatar 功能时一同恢复。最终目标为原游戏逻辑 100% 还原；五个 BstBaked 段仍以各 9/10 为真机验收前阶段目标，最后一项为真机与原游戏校验。 完整原逻辑目前未达到，不能用检查项比例替代。

覆盖 33 张地图、283 个实际声明类型（280 种有顶层实例）、49,824 个顶层对象，60,016 条非空引用。主结构为功能分类 → 单独类 → 该类全部实例；每个类有自己的职责与功能实施项，每个对象有原始身份、依赖和独立验收清单。地图仅作来源信息。完整类运行已验收 0 类，实例独立完整运行已验收 0 个。

- [全部类逐项清单](Objects.level.bin类进度清单.md) · [类交互页面](Objects.level.bin类进度.html)
- [全部对象交互清单](Objects.level.bin对象实现清单.html)：默认按功能和单独类查看，进入该类即可集中查看全部实例、自身实施项与依赖
- [完整对象 JSON](Objects.level.bin对象实现清单.json) · [逐类 JSON](Objects.level.bin类进度.json)

每个对象的独立验收项：

1. 实际对象身份、原始字节范围与引用清点
2. 该对象原始字节完整解析及无修改回写
3. 该实例完整原构造、缺字段默认值与继承初始化
4. 该实例原资源加载、注册与启用传播
5. 该实例原启动状态、入口和调用顺序
6. 该实例全部事件、依赖调用与反馈结果
7. 该实例原更新、状态转换及边界行为
8. 该实例实际场景、绘制、物理或游戏 UI 接入
9. 该实例注销、销毁、切图及状态恢复
10. 该实例 Windows 真机与原游戏行为验收

当前实例自身全部为 2/10（只完成原字节格式与引用验证）；类平均清单为 31.27%（分母不同）。原核心子链报告只计明确范围；原函数依赖、未知行为和失败项继续保留，完整逻辑进度保持 null。

## 场景基础与对象变换

容器、空间标记、对象层级及变换控制。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| Clump | 对象引用容器 | 40% | 9627 | [实施与所有实例](Objects类清单/Clump.md) |
| MakeFloaty | 对象浮动、旋转与错峰动画 | 30% | 10 | [实施与所有实例](Objects类清单/MakeFloaty.md) |
| Marker | 位置、旋转、缩放与启用的空间标记 | 40% | 6538 | [实施与所有实例](Objects类清单/Marker.md) |
| Parent | 对象父子跟随与关节挂接 | 40% | 270 | [实施与所有实例](Objects类清单/Parent.md) |
| RiseWhenStoodOn | 站立交互引发网格升起 | 30% | 4 | [实施与所有实例](Objects类清单/RiseWhenStoodOn.md) |
| RotateObject | 对象旋转范围与速度控制 | 30% | 8 | [实施与所有实例](Objects类清单/RotateObject.md) |
| StrobeObject | 对象闪烁、时长与结束状态 | 30% | 12 | [实施与所有实例](Objects类清单/StrobeObject.md) |
| TransformObject | 对象变换目标、过渡与完成事件 | 40% | 317 | [实施与所有实例](Objects类清单/TransformObject.md) |
| Tweener | 属性与变换补间控制 | 30% | 6 | [实施与所有实例](Objects类清单/Tweener.md) |

## 轨道、导航与引导

曲线数据、路径跟随和轨道附着。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AddPoi | 标记定义的关注点与权重 | 30% | 1 | [实施与所有实例](Objects类清单/AddPoi.md) |
| AttachBeacon | 空间信标、颜色与强度过渡 | 30% | 14 | [实施与所有实例](Objects类清单/AttachBeacon.md) |
| AttachGuideRail | 附加轨道引导与运动限制 | 30% | 20 | [实施与所有实例](Objects类清单/AttachGuideRail.md) |
| Boundary | 轨道定义的场景边界 | 30% | 34 | [实施与所有实例](Objects类清单/Boundary.md) |
| MoveObjectAlongRail | 对象沿轨道运动 | 40% | 232 | [实施与所有实例](Objects类清单/MoveObjectAlongRail.md) |
| Rail | 轨道曲线、循环与更新 | 40% | 402 | [实施与所有实例](Objects类清单/Rail.md) |
| TrackAvatarOnRail | 按玩家位置跟踪轨道对象 | 30% | 7 | [实施与所有实例](Objects类清单/TrackAvatarOnRail.md) |
| Waypoint | 导航点与范围 | 30% | 9 | [实施与所有实例](Objects类清单/Waypoint.md) |

## 地图加载、出生与检查点

地图切换、入口选择、加载事件及恢复。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AvatarSetPos | 玩家定位、相对标记与出生入口 | 40% | 59 | [实施与所有实例](Objects类清单/AvatarSetPos.md) |
| ChangeLevelWithFade | 带淡入淡出的地图切换 | 30% | 28 | [实施与所有实例](Objects类清单/ChangeLevelWithFade.md) |
| Checkpoint | 检查点记录与恢复区域 | 30% | 126 | [实施与所有实例](Objects类清单/Checkpoint.md) |
| CheckpointRestore | 恢复检查点与重载控制 | 30% | 24 | [实施与所有实例](Objects类清单/CheckpointRestore.md) |
| CheckpointState | 恢复时启用的对象集合 | 30% | 17 | [实施与所有实例](Objects类清单/CheckpointState.md) |
| HasReachedLevel | 已到达地图条件事件 | 30% | 11 | [实施与所有实例](Objects类清单/HasReachedLevel.md) |
| IsLatestCheckpoint | 检查最新检查点与事件 | 30% | 8 | [实施与所有实例](Objects类清单/IsLatestCheckpoint.md) |
| LevelLink | 地图连接、锚点与加载事件 | 30% | 64 | [实施与所有实例](Objects类清单/LevelLink.md) |
| LevelParameters | 地图与烘焙生成全局参数 | 30% | 33 | [实施与所有实例](Objects类清单/LevelParameters.md) |
| OnLevelStart | 地图启动事件 | 30% | 21 | [实施与所有实例](Objects类清单/OnLevelStart.md) |
| OnLevelUp | 等级变化事件 | 30% | 5 | [实施与所有实例](Objects类清单/OnLevelUp.md) |
| ResumeEnable | 恢复时启用对象 | 40% | 5 | [实施与所有实例](Objects类清单/ResumeEnable.md) |
| ResumeGate | 恢复流程门控 | 20% | 1 | [实施与所有实例](Objects类清单/ResumeGate.md) |
| StreamLevelLink | 带轨道、门槛和场景引导的地图连接 | 30% | 1 | [实施与所有实例](Objects类清单/StreamLevelLink.md) |

## 摄像机与镜头

相机引导、关键帧、切换与震动。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| CameraGuide | 空间摄像机引导与画面构图 | 30% | 395 | [实施与所有实例](Objects类清单/CameraGuide.md) |
| CameraKeyFrame | 镜头关键帧、视场角与运动参数 | 40% | 987 | [实施与所有实例](Objects类清单/CameraKeyFrame.md) |
| PauseCameraConfig | 摄像机配置保持、淡入和暂停 | 30% | 6 | [实施与所有实例](Objects类清单/PauseCameraConfig.md) |
| SetCameraKeyFrameShake | 关键帧震动参数与过渡 | 40% | 10 | [实施与所有实例](Objects类清单/SetCameraKeyFrameShake.md) |
| SetCameraShake | 摄像机震动强度与时长 | 40% | 10 | [实施与所有实例](Objects类清单/SetCameraShake.md) |
| SnapToCam | 摄像机切换、注视与过渡 | 30% | 732 | [实施与所有实例](Objects类清单/SnapToCam.md) |

## 模型、材质与绘制

模型资源、烘焙、材质与绘制状态。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| Beamo | 密度模型、LOD、材质与烘焙参数 | 40% | 6598 | [实施与所有实例](Objects类清单/Beamo.md) |
| BeamoDecal | 模型贴花、距离与材质绑定 | 40% | 552 | [实施与所有实例](Objects类清单/BeamoDecal.md) |
| DropOcclusion | 遮挡对象、强度和淡入淡出 | 30% | 64 | [实施与所有实例](Objects类清单/DropOcclusion.md) |
| LevelMaterial | 原材质、shader、参数与物理材质绑定 | 40% | 309 | [实施与所有实例](Objects类清单/LevelMaterial.md) |
| LevelMesh | 场景模型、资源、烘焙及几何生成参数 | 40% | 4133 | [实施与所有实例](Objects类清单/LevelMesh.md) |
| LevelMeshShaderParam | 模型 shader 参数声明 | 30% | 0 | [实施与所有实例](Objects类清单/LevelMeshShaderParam.md) |
| LevelShaderParam | shader 参数声明 | 40% | 0 | [实施与所有实例](Objects类清单/LevelShaderParam.md) |
| SetAvatarRender | 本地与远端玩家绘制开关 | 30% | 13 | [实施与所有实例](Objects类清单/SetAvatarRender.md) |
| SetMeshShaderParam | 模型 uniform 值与过渡 | 30% | 359 | [实施与所有实例](Objects类清单/SetMeshShaderParam.md) |
| SetRender | 模型绘制开关 | 30% | 10 | [实施与所有实例](Objects类清单/SetRender.md) |

## 地形生成

地形密度、分组、预制体及烘焙来源。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| TerrainBlob | 地形密度形状、噪声与侵蚀参数 | 40% | 7174 | [实施与所有实例](Objects类清单/TerrainBlob.md) |
| TerrainBlobGroup | 地形对象集合、网格生成与细分配置 | 30% | 109 | [实施与所有实例](Objects类清单/TerrainBlobGroup.md) |
| TerrainBlobPrefab | 地形预制资源、变换与生成顺序 | 30% | 316 | [实施与所有实例](Objects类清单/TerrainBlobPrefab.md) |

## 云、风场与环境

环境参数、云对象、风场和空间混合。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| CloudBob | 云对象运动及缓冲偏移 | 30% | 2 | [实施与所有实例](Objects类清单/CloudBob.md) |
| CloudCard | 云卡模型、烘焙与透明度 | 40% | 356 | [实施与所有实例](Objects类清单/CloudCard.md) |
| EnvNode | 空间环境参数与混合 | 40% | 134 | [实施与所有实例](Objects类清单/EnvNode.md) |
| SetEnvDefault | 设置默认环境参数 | 40% | 29 | [实施与所有实例](Objects类清单/SetEnvDefault.md) |
| SetEnvHull | 设置区域环境参数 | 40% | 4 | [实施与所有实例](Objects类清单/SetEnvHull.md) |
| SetWind | 全局或区域风场设置 | 30% | 4 | [实施与所有实例](Objects类清单/SetWind.md) |
| Wind | 区域、轨道与附加标记的风场 | 40% | 120 | [实施与所有实例](Objects类清单/Wind.md) |

## 水、雾与天气

水面、体积雾、降雨与空间天气。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| DarkstoneRainRegion | 区域降落物、收集物与能量消耗 | 30% | 11 | [实施与所有实例](Objects类清单/DarkstoneRainRegion.md) |
| FogVolumeSphere | 球形体积雾与可见性参数 | 30% | 78 | [实施与所有实例](Objects类清单/FogVolumeSphere.md) |
| RainCurtainParams | 雨幕标记、雨滴密度和尺寸 | 30% | 6 | [实施与所有实例](Objects类清单/RainCurtainParams.md) |
| SetOceanRender | 海洋绘制开关 | 30% | 15 | [实施与所有实例](Objects类清单/SetOceanRender.md) |
| SetRainParams | 降雨强度、速度与过渡 | 30% | 13 | [实施与所有实例](Objects类清单/SetRainParams.md) |
| Water | 水面空间与阴影配置 | 30% | 38 | [实施与所有实例](Objects类清单/Water.md) |

## 数值变量与运算

Float 输入、输出、插值与条件表达式。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AddFloatToStatUsingName | 命名统计值增加浮点输入 | 30% | 21 | [实施与所有实例](Objects类清单/AddFloatToStatUsingName.md) |
| Float | 浮点值对象 | 40% | 184 | [实施与所有实例](Objects类清单/Float.md) |
| FloatAdd | 增量、限制范围及逐帧输出 | 40% | 31 | [实施与所有实例](Objects类清单/FloatAdd.md) |
| FloatDistanceFade | 按位置或摄像机距离映射浮点值 | 30% | 2 | [实施与所有实例](Objects类清单/FloatDistanceFade.md) |
| FloatMult | 两项浮点输入相乘 | 40% | 14 | [实施与所有实例](Objects类清单/FloatMult.md) |
| FloatSplit | 按连续区间映射输入到多个浮点输出 | 40% | 2 | [实施与所有实例](Objects类清单/FloatSplit.md) |
| OnFloat | 浮点条件组合与事件 | 40% | 94 | [实施与所有实例](Objects类清单/OnFloat.md) |
| SetDroppableCountFloat | 可掉落数量到浮点输出 | 30% | 2 | [实施与所有实例](Objects类清单/SetDroppableCountFloat.md) |
| SetFloat | 浮点目标值与时间过渡 | 40% | 4 | [实施与所有实例](Objects类清单/SetFloat.md) |

## 事件调度与逻辑条件

时间序列、启用传播与条件分支。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| Branch | 事件分支与触发规则 | 30% | 3 | [实施与所有实例](Objects类清单/Branch.md) |
| DebugLogline | 日志文本事件 | 30% | 2 | [实施与所有实例](Objects类清单/DebugLogline.md) |
| Delay | 时间、帧或节拍延迟事件 | 40% | 284 | [实施与所有实例](Objects类清单/Delay.md) |
| Enable | 对象集合启用、禁用及事件终止 | 40% | 1287 | [实施与所有实例](Objects类清单/Enable.md) |
| EventSeries | 事件序列状态与重置计时 | 30% | 11 | [实施与所有实例](Objects类清单/EventSeries.md) |
| FireTriggerAtRandom | 随机间隔及事件选择 | 30% | 9 | [实施与所有实例](Objects类清单/FireTriggerAtRandom.md) |
| IfEnabled | 对象集合启用状态条件 | 40% | 36 | [实施与所有实例](Objects类清单/IfEnabled.md) |
| IfTweakVar | 原调试变量条件分支 | 30% | 2 | [实施与所有实例](Objects类清单/IfTweakVar.md) |
| OnChangeAnd | 集合状态与 AND 条件变化 | 30% | 1 | [实施与所有实例](Objects类清单/OnChangeAnd.md) |
| OnEventSeries | 序列数量与触发规则 | 30% | 4 | [实施与所有实例](Objects类清单/OnEventSeries.md) |
| ScheduledEvent | 命名计划事件与对象集合 | 30% | 28 | [实施与所有实例](Objects类清单/ScheduledEvent.md) |
| SetGlobalEventParameter | 全局事件参数设置 | 30% | 2 | [实施与所有实例](Objects类清单/SetGlobalEventParameter.md) |
| Timeline | 时间轴对象和时间节点调度 | 30% | 293 | [实施与所有实例](Objects类清单/Timeline.md) |
| TimelineNode | 时间轴时间与目标对象声明 | 30% | 0 | [实施与所有实例](Objects类清单/TimelineNode.md) |

## 区域、喊叫与空间触发

位置、进入离开、人数和空间条件事件。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| Critter_OnRegion | 生物集合进入区域条件 | 40% | 4 | [实施与所有实例](Objects类清单/Critter_OnRegion.md) |
| IfInRegion | 区域内或区域外条件触发 | 30% | 30 | [实施与所有实例](Objects类清单/IfInRegion.md) |
| IsOutfitInRegion | 区域内装扮与玩家条件 | 30% | 1 | [实施与所有实例](Objects类清单/IsOutfitInRegion.md) |
| NotOnRegion | 区域外事件触发 | 30% | 16 | [实施与所有实例](Objects类清单/NotOnRegion.md) |
| OnAvatarEnergy | 玩家能量与区域条件事件 | 30% | 10 | [实施与所有实例](Objects类清单/OnAvatarEnergy.md) |
| OnAvatarOnGround | 玩家落地、速度与区域条件事件 | 30% | 9 | [实施与所有实例](Objects类清单/OnAvatarOnGround.md) |
| OnMoteCarry | 光点携带开始或结束事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnMoteCarry.md) |
| OnRegion | 进入离开、逐帧和人数条件区域触发 | 40% | 381 | [实施与所有实例](Objects类清单/OnRegion.md) |
| OnShout | 指定标记区域内喊叫事件 | 30% | 6 | [实施与所有实例](Objects类清单/OnShout.md) |
| OnTapCount | 区域内点击次数事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnTapCount.md) |

## 碰撞、受力与移动限制

碰撞几何、受力和运动区域。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| BoomCone | 锥形冲量、时长与继承速度 | 20% | 2 | [实施与所有实例](Objects类清单/BoomCone.md) |
| EnableCollision | 碰撞几何开关 | 30% | 4 | [实施与所有实例](Objects类清单/EnableCollision.md) |
| ForwardAcceleration | 区域方向与地面空中加速度 | 30% | 3 | [实施与所有实例](Objects类清单/ForwardAcceleration.md) |
| KillBox | 空间死亡区域 | 30% | 146 | [实施与所有实例](Objects类清单/KillBox.md) |
| MakeMagnetize | 标记区域吸附与反重力 | 30% | 21 | [实施与所有实例](Objects类清单/MakeMagnetize.md) |
| PlatformingRegion | 平台运动区域 | 30% | 7 | [实施与所有实例](Objects类清单/PlatformingRegion.md) |
| SetAvatarMinYSpeed | 玩家最小竖直速度与起飞 | 30% | 13 | [实施与所有实例](Objects类清单/SetAvatarMinYSpeed.md) |
| SetForce | 标记区域内受力与速度限制 | 30% | 3 | [实施与所有实例](Objects类清单/SetForce.md) |

## 玩家状态与输入

能量、姿态、飞行、输入和玩家控制。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AvatarAirtimeEffectFloat | 玩家滞空效果的浮点输出 | 30% | 3 | [实施与所有实例](Objects类清单/AvatarAirtimeEffectFloat.md) |
| AvatarBreakHandHold | 玩家牵手关系解除 | 30% | 2 | [实施与所有实例](Objects类清单/AvatarBreakHandHold.md) |
| AvatarChargeEnergy | 按速率与时长补充玩家能量 | 30% | 22 | [实施与所有实例](Objects类清单/AvatarChargeEnergy.md) |
| AvatarForceEnableFlightMode | 强制启用飞行模式 | 20% | 1 | [实施与所有实例](Objects类清单/AvatarForceEnableFlightMode.md) |
| AvatarGrindToPos | 玩家轨道式定位与停止 | 30% | 46 | [实施与所有实例](Objects类清单/AvatarGrindToPos.md) |
| AvatarHijack | 玩家控制接管与恢复 | 30% | 8 | [实施与所有实例](Objects类清单/AvatarHijack.md) |
| AvatarSetCandleState | 玩家蜡烛状态 | 30% | 4 | [实施与所有实例](Objects类清单/AvatarSetCandleState.md) |
| AvatarSetEnergy | 玩家能量设定或增量 | 30% | 7 | [实施与所有实例](Objects类清单/AvatarSetEnergy.md) |
| AvatarSetEnergyCapacity | 玩家能量容量与时间过渡 | 30% | 8 | [实施与所有实例](Objects类清单/AvatarSetEnergyCapacity.md) |
| AvatarSetInnerGlow | 玩家内发光强度与过渡 | 30% | 6 | [实施与所有实例](Objects类清单/AvatarSetInnerGlow.md) |
| AvatarSetStance | 站立、坐下、睡眠与朝向姿态 | 30% | 11 | [实施与所有实例](Objects类清单/AvatarSetStance.md) |
| AvatarSetZeroG | 玩家零重力与能量状态 | 30% | 1 | [实施与所有实例](Objects类清单/AvatarSetZeroG.md) |
| DisableCliffJump | 悬崖跳跃限制 | 20% | 2 | [实施与所有实例](Objects类清单/DisableCliffJump.md) |
| DisableDpad | 方向输入限制 | 20% | 2 | [实施与所有实例](Objects类清单/DisableDpad.md) |
| DisableJump | 跳跃限制 | 20% | 1 | [实施与所有实例](Objects类清单/DisableJump.md) |
| DisableRise | 上升动作限制 | 20% | 1 | [实施与所有实例](Objects类清单/DisableRise.md) |
| DisableStep | 步行动作限制 | 20% | 2 | [实施与所有实例](Objects类清单/DisableStep.md) |
| DoShout | 在指定位置发起喊叫效果 | 30% | 59 | [实施与所有实例](Objects类清单/DoShout.md) |
| SetBlockUpdraftWind | 上升风场作用限制 | 20% | 1 | [实施与所有实例](Objects类清单/SetBlockUpdraftWind.md) |
| SetFlightParams | 飞行巡航角与升力配置 | 30% | 4 | [实施与所有实例](Objects类清单/SetFlightParams.md) |
| SetGlide | 滑翔与飞行能力开关 | 30% | 7 | [实施与所有实例](Objects类清单/SetGlide.md) |
| SetInputState | 玩家与摄像机输入开关 | 30% | 38 | [实施与所有实例](Objects类清单/SetInputState.md) |
| StopGrinding | 停止轨道运动并关联动画 | 30% | 2 | [实施与所有实例](Objects类清单/StopGrinding.md) |

## 动画、回放与装扮

动画播放、动作、回放及衣柜事件。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| CloseOutfitShop | 关闭装扮商店 | 20% | 1 | [实施与所有实例](Objects类清单/CloseOutfitShop.md) |
| OnOutfitShopPurchase | 装扮购买事件 | 30% | 2 | [实施与所有实例](Objects类清单/OnOutfitShopPurchase.md) |
| OnTapPlayAnim | 点击动作动画、延迟与进度事件 | 30% | 26 | [实施与所有实例](Objects类清单/OnTapPlayAnim.md) |
| OnUnlockOutfit | 装扮解锁后启用对象 | 30% | 1 | [实施与所有实例](Objects类清单/OnUnlockOutfit.md) |
| OutfitSelect | 衣柜、区域、商店与购买事件 | 30% | 12 | [实施与所有实例](Objects类清单/OutfitSelect.md) |
| PlayAnimation | 对象动画序列、速度与状态 | 40% | 187 | [实施与所有实例](Objects类清单/PlayAnimation.md) |
| PlayAvatarAnimSeq | 本地或远端玩家动画序列 | 30% | 42 | [实施与所有实例](Objects类清单/PlayAvatarAnimSeq.md) |
| Replay | 玩家回放及 NPC 显示控制 | 30% | 6 | [实施与所有实例](Objects类清单/Replay.md) |
| Replay_HandHold | 回放玩家与 NPC 牵手 | 30% | 1 | [实施与所有实例](Objects类清单/Replay_HandHold.md) |
| Replay_PlayAnim | 回放玩家动画 | 30% | 4 | [实施与所有实例](Objects类清单/Replay_PlayAnim.md) |

## NPC 行为与社交

NPC 状态、运动、动画、互动和回调。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| Npc | NPC 模型、动画、装扮与玩家状态 | 30% | 67 | [实施与所有实例](Objects类清单/Npc.md) |
| Npc_BreakHandHold | NPC 解除牵手 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_BreakHandHold.md) |
| Npc_Chat | NPC 聊天消息 | 30% | 2 | [实施与所有实例](Objects类清单/Npc_Chat.md) |
| Npc_DisableGiftGiving | NPC 赠礼功能限制 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_DisableGiftGiving.md) |
| Npc_DisableRelationshipMenu | NPC 关系菜单限制 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_DisableRelationshipMenu.md) |
| Npc_GetAttention | NPC 请求关注 | 30% | 2 | [实施与所有实例](Objects类清单/Npc_GetAttention.md) |
| Npc_GiveCandle | NPC 赠送蜡烛与接受事件 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_GiveCandle.md) |
| Npc_HandHold | NPC 发起牵手 | 30% | 6 | [实施与所有实例](Objects类清单/Npc_HandHold.md) |
| Npc_Hug | NPC 发起拥抱 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_Hug.md) |
| Npc_OnHandHold | NPC 牵手事件 | 30% | 3 | [实施与所有实例](Objects类清单/Npc_OnHandHold.md) |
| Npc_OnHug | NPC 拥抱事件 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_OnHug.md) |
| Npc_OnNicknamed | NPC 命名事件 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_OnNicknamed.md) |
| Npc_OnRecieveGift | NPC 收礼事件 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_OnRecieveGift.md) |
| Npc_PlayAnim | NPC 动画播放与速度 | 30% | 54 | [实施与所有实例](Objects类清单/Npc_PlayAnim.md) |
| Npc_Prompt | NPC 交互图标与激活事件 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_Prompt.md) |
| Npc_Reflect | NPC 状态向本地玩家的映射 | 30% | 2 | [实施与所有实例](Objects类清单/Npc_Reflect.md) |
| Npc_SetScale | NPC 身高、缩放与时间过渡 | 30% | 9 | [实施与所有实例](Objects类清单/Npc_SetScale.md) |
| Npc_TakeOutFlame | NPC 取出或收起火焰 | 30% | 1 | [实施与所有实例](Objects类清单/Npc_TakeOutFlame.md) |
| Npc_Teleport | NPC 定位 | 30% | 13 | [实施与所有实例](Objects类清单/Npc_Teleport.md) |
| Npc_Turn | NPC 朝向过渡与完成事件 | 30% | 7 | [实施与所有实例](Objects类清单/Npc_Turn.md) |
| Npc_WalkTo | NPC 移动目标与完成事件 | 30% | 2 | [实施与所有实例](Objects类清单/Npc_WalkTo.md) |

## 生物、群体与 AI

鸟、螃蟹、暗生物、伙伴与参数。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AwakenDarkCreatures | 唤醒暗生物集合 | 40% | 9 | [实施与所有实例](Objects类清单/AwakenDarkCreatures.md) |
| BirdFlock | 鸟群发射、轨道、距离与预填充 | 40% | 58 | [实施与所有实例](Objects类清单/BirdFlock.md) |
| BirdV2 | 鸟类实例与 AI 参数 | 40% | 184 | [实施与所有实例](Objects类清单/BirdV2.md) |
| BirdV2AiParams | 鸟类追踪、群体、目标与到达参数 | 30% | 33 | [实施与所有实例](Objects类清单/BirdV2AiParams.md) |
| BirdV2Params | 鸟类运动、引导与效果参数 | 30% | 46 | [实施与所有实例](Objects类清单/BirdV2Params.md) |
| BirdV2ParamSwap | 替换鸟类实例参数 | 40% | 15 | [实施与所有实例](Objects类清单/BirdV2ParamSwap.md) |
| Buddy | 伙伴实例 | 40% | 1 | [实施与所有实例](Objects类清单/Buddy.md) |
| BuddyParams | 伙伴发现、休息与动画状态参数 | 40% | 1 | [实施与所有实例](Objects类清单/BuddyParams.md) |
| Crab | 螃蟹实例 | 40% | 140 | [实施与所有实例](Objects类清单/Crab.md) |
| CrabParams | 螃蟹追逐、逃跑与状态参数 | 30% | 7 | [实施与所有实例](Objects类清单/CrabParams.md) |
| Critter_Shout | 生物集合喊叫音效与视觉 | 40% | 15 | [实施与所有实例](Objects类清单/Critter_Shout.md) |
| DarkCreature | 暗生物实例 | 40% | 13 | [实施与所有实例](Objects类清单/DarkCreature.md) |
| DarkCreatureParams | 暗生物巡逻轨道与计时参数 | 30% | 13 | [实施与所有实例](Objects类清单/DarkCreatureParams.md) |
| DetachFromBirdGuides | 解除鸟类引导 | 40% | 4 | [实施与所有实例](Objects类清单/DetachFromBirdGuides.md) |
| ReleaseBirds | 释放鸟类集合 | 40% | 3 | [实施与所有实例](Objects类清单/ReleaseBirds.md) |
| SetBirdGuidesEnabled | 鸟类引导开关 | 40% | 4 | [实施与所有实例](Objects类清单/SetBirdGuidesEnabled.md) |
| SetDarkCreaturesNetworked | 暗生物网络同步配置 | 40% | 3 | [实施与所有实例](Objects类清单/SetDarkCreaturesNetworked.md) |

## 收集物、蜡烛与解锁

拾取、蜡烛、收集状态、货币与奖励。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AccountAddCurrency | 账户货币增加与反馈 | 30% | 1 | [实施与所有实例](Objects类清单/AccountAddCurrency.md) |
| CandleGate | 蜡烛放置与门控事件 | 30% | 23 | [实施与所有实例](Objects类清单/CandleGate.md) |
| CandleObject | 蜡烛实例、寿命、点燃与蜡量 | 40% | 1077 | [实施与所有实例](Objects类清单/CandleObject.md) |
| CollectCollectible | 触发收集指定收集物 | 30% | 6 | [实施与所有实例](Objects类清单/CollectCollectible.md) |
| Collectible | 收集物类型、名称与空间 | 30% | 53 | [实施与所有实例](Objects类清单/Collectible.md) |
| CollectibleDisplay | 按地图收集状态显示对象 | 30% | 9 | [实施与所有实例](Objects类清单/CollectibleDisplay.md) |
| DropUnlock | 命名掉落解锁 | 30% | 6 | [实施与所有实例](Objects类清单/DropUnlock.md) |
| Flame | 火焰实例、点燃、按钮与熄灭 | 40% | 290 | [实施与所有实例](Objects类清单/Flame.md) |
| LockAllCollectible | 锁定收集物状态 | 20% | 1 | [实施与所有实例](Objects类清单/LockAllCollectible.md) |
| OnCollected | 收集与使用状态条件事件 | 30% | 7 | [实施与所有实例](Objects类清单/OnCollected.md) |
| OnFlame | 火焰集合、消耗、点燃与熄灭事件 | 40% | 154 | [实施与所有实例](Objects类清单/OnFlame.md) |
| OnUnlocked | 解锁、未确认与未解锁事件 | 30% | 37 | [实施与所有实例](Objects类清单/OnUnlocked.md) |
| Pickup | 拾取物、货币与拾取反馈 | 30% | 1 | [实施与所有实例](Objects类清单/Pickup.md) |
| RedeemReward | 奖励兑换结果事件 | 30% | 4 | [实施与所有实例](Objects类清单/RedeemReward.md) |
| ReserveCurrency | 预留指定货币数量 | 30% | 1 | [实施与所有实例](Objects类清单/ReserveCurrency.md) |
| ResetAllStormKeyProgress | 风暴钥匙进度重置 | 20% | 1 | [实施与所有实例](Objects类清单/ResetAllStormKeyProgress.md) |
| SetFlame | 火焰集合点燃状态与计时 | 40% | 43 | [实施与所有实例](Objects类清单/SetFlame.md) |
| Star | 星体收集、解锁与能量容量 | 30% | 1 | [实施与所有实例](Objects类清单/Star.md) |
| StormKeyUnlock | 风暴钥匙解锁结果 | 30% | 5 | [实施与所有实例](Objects类清单/StormKeyUnlock.md) |
| Unlock | 命名解锁与确认事件 | 30% | 27 | [实施与所有实例](Objects类清单/Unlock.md) |

## 光点、碎片与灵魂

发射、携带、聚集、捕获与灵魂提交。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| Mote | 光点实例与初始状态 | 30% | 50 | [实施与所有实例](Objects类清单/Mote.md) |
| MoteParams | 光点运动、携带、死亡与轨道参数 | 30% | 117 | [实施与所有实例](Objects类清单/MoteParams.md) |
| SoulDeposit | 灵魂提交类型、摄像机与事件 | 30% | 9 | [实施与所有实例](Objects类清单/SoulDeposit.md) |
| SoulTrap | 灵魂捕获物、几何与销毁事件 | 40% | 49 | [实施与所有实例](Objects类清单/SoulTrap.md) |
| SpawnMotes | 发射光点数量、速度与时长 | 30% | 76 | [实施与所有实例](Objects类清单/SpawnMotes.md) |
| SpinMotes | 区域光点旋转、捕获与死亡 | 30% | 4 | [实施与所有实例](Objects类清单/SpinMotes.md) |
| StarFragment | 星体碎片实例与收集事件 | 30% | 86 | [实施与所有实例](Objects类清单/StarFragment.md) |
| StarFragmentParams | 碎片飞行、跟随、携带与人数条件 | 30% | 17 | [实施与所有实例](Objects类清单/StarFragmentParams.md) |
| StarFragmentsConverge | 碎片汇聚、传送与完成事件 | 30% | 9 | [实施与所有实例](Objects类清单/StarFragmentsConverge.md) |
| SwapMoteParams | 光点参数在区域与阶段间切换 | 30% | 14 | [实施与所有实例](Objects类清单/SwapMoteParams.md) |

## 任务、先祖与场景机制

任务活动、奖励、机关和剧情控制。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AchievementShrine | 成就机关、奖励与相机反馈 | 30% | 1 | [实施与所有实例](Objects类清单/AchievementShrine.md) |
| AncestorEngine | 充能机关、区域与激活计时 | 30% | 51 | [实施与所有实例](Objects类清单/AncestorEngine.md) |
| AncientSpirit | 先祖交互、动画、收集与剧情 | 30% | 42 | [实施与所有实例](Objects类清单/AncientSpirit.md) |
| CarryAncestorQuestPrefab | 先祖携带任务预制体 | 30% | 10 | [实施与所有实例](Objects类清单/CarryAncestorQuestPrefab.md) |
| CarryCreatureQuestPrefab | 生物携带任务预制体 | 20% | 3 | [实施与所有实例](Objects类清单/CarryCreatureQuestPrefab.md) |
| ClockBell | 钟与网格控制 | 30% | 1 | [实施与所有实例](Objects类清单/ClockBell.md) |
| ClockTower | 钟塔与钟组控制 | 30% | 1 | [实施与所有实例](Objects类清单/ClockTower.md) |
| DailyQuestsGiver | 每日任务 NPC 与区域 | 30% | 1 | [实施与所有实例](Objects类清单/DailyQuestsGiver.md) |
| DeathMarch | 剧情区域、时间轴与场景对象调度 | 30% | 2 | [实施与所有实例](Objects类清单/DeathMarch.md) |
| FragmentCollectActivity | 碎片数量与收集活动 | 30% | 15 | [实施与所有实例](Objects类清单/FragmentCollectActivity.md) |
| MeditationArea | 冥想区域、目标、相机与确认 | 30% | 45 | [实施与所有实例](Objects类清单/MeditationArea.md) |
| SpiritSoulsDisplayLord | 灵魂进度、标记与显示事件 | 30% | 1 | [实施与所有实例](Objects类清单/SpiritSoulsDisplayLord.md) |
| Turret | 机关眼部、光束与转动参数 | 30% | 1 | [实施与所有实例](Objects类清单/Turret.md) |
| WorldQuest | 世界任务、活动、加入与奖励状态 | 30% | 15 | [实施与所有实例](Objects类清单/WorldQuest.md) |
| WorldQuestTable | 任务桌、菜单与地图连接 | 30% | 23 | [实施与所有实例](Objects类清单/WorldQuestTable.md) |
| WorldQuestWorldAreaGateEffect | 世界任务区域门效果 | 30% | 1 | [实施与所有实例](Objects类清单/WorldQuestWorldAreaGateEffect.md) |

## 竞赛与计分

队伍、收集物分配、终点与退出。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AncestorRace | 先祖竞赛、队伍区域与目标 | 30% | 2 | [实施与所有实例](Objects类清单/AncestorRace.md) |
| AncestorRaceGoal | 竞赛终点、队伍得分与完成事件 | 30% | 1 | [实施与所有实例](Objects类清单/AncestorRaceGoal.md) |
| DistributeRaceCollectibles | 队伍竞赛收集物分配 | 30% | 1 | [实施与所有实例](Objects类清单/DistributeRaceCollectibles.md) |
| DistributeSpiritCollectibles | 灵魂收集物分配与完成事件 | 30% | 1 | [实施与所有实例](Objects类清单/DistributeSpiritCollectibles.md) |
| ExitRace | 退出竞赛 | 20% | 1 | [实施与所有实例](Objects类清单/ExitRace.md) |
| ScoreRaceCollectibles | 竞赛收集物计分 | 30% | 1 | [实施与所有实例](Objects类清单/ScoreRaceCollectibles.md) |

## 粒子、灯光与场景效果

发射器、光效、花草及破坏反馈。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| Blaze | 燃烧对象、网格和灰烬参数 | 40% | 17 | [实施与所有实例](Objects类清单/Blaze.md) |
| Emitter | 粒子发射、附着、吸引与受力 | 30% | 351 | [实施与所有实例](Objects类清单/Emitter.md) |
| FireWorkShow | 烟花源标记与演出 | 30% | 6 | [实施与所有实例](Objects类清单/FireWorkShow.md) |
| FlowerPatch | 花草密度、尺寸、噪声与材质 | 30% | 582 | [实施与所有实例](Objects类清单/FlowerPatch.md) |
| LensFlair | 镜头光效颜色、强度与样式 | 30% | 44 | [实施与所有实例](Objects类清单/LensFlair.md) |
| OnBlaze | 燃烧状态与激活事件 | 40% | 5 | [实施与所有实例](Objects类清单/OnBlaze.md) |
| OnBoomDestroy | 冲量破坏阈值、动画与网格反馈 | 30% | 1 | [实施与所有实例](Objects类清单/OnBoomDestroy.md) |
| PointLight | 点光源空间实例 | 30% | 521 | [实施与所有实例](Objects类清单/PointLight.md) |
| SetEmitterFlowRail | 发射器沿轨道流向设置 | 30% | 2 | [实施与所有实例](Objects类清单/SetEmitterFlowRail.md) |
| StarFallShower | 流星发射、颜色、轨道与范围 | 30% | 3 | [实施与所有实例](Objects类清单/StarFallShower.md) |

## 声音、音乐与混音

声音实例、播放、淡出、参数与混响。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| FadeSound | 声音集合音量过渡与停止 | 30% | 10 | [实施与所有实例](Objects类清单/FadeSound.md) |
| OnMusicOutro | 音乐尾段事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnMusicOutro.md) |
| PlayMusic | 音乐切换、音量与淡入淡出 | 30% | 92 | [实施与所有实例](Objects类清单/PlayMusic.md) |
| PlaySound2D | 二维声音播放 | 40% | 109 | [实施与所有实例](Objects类清单/PlaySound2D.md) |
| PlaySound3D | 空间声音播放 | 30% | 27 | [实施与所有实例](Objects类清单/PlaySound3D.md) |
| ReverbRegion | 区域混响与参数过渡 | 30% | 33 | [实施与所有实例](Objects类清单/ReverbRegion.md) |
| SetMixChannelLowpassFreq | 混音通道低通频率过渡 | 30% | 23 | [实施与所有实例](Objects类清单/SetMixChannelLowpassFreq.md) |
| SetMixChannelVolume | 混音通道音量过渡 | 30% | 23 | [实施与所有实例](Objects类清单/SetMixChannelVolume.md) |
| SetMusicVolume | 音乐音量过渡 | 30% | 52 | [实施与所有实例](Objects类清单/SetMusicVolume.md) |
| SetSoundParameter | 全局、音乐或发射器声音参数 | 30% | 11 | [实施与所有实例](Objects类清单/SetSoundParameter.md) |
| SoundEmitter | 声音实例、距离、方向与自动播放 | 30% | 371 | [实施与所有实例](Objects类清单/SoundEmitter.md) |

## 按钮、文字与菜单

世界按钮、HUD、提示、菜单与显示。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| DialogHint | 区域提示、文本、优先级与串联 | 30% | 102 | [实施与所有实例](Objects类清单/DialogHint.md) |
| DisplayText | 文字、颜色、位置与淡入淡出 | 30% | 30 | [实施与所有实例](Objects类清单/DisplayText.md) |
| DisplayTitleCard | 标题卡主副标题与显示规则 | 30% | 10 | [实施与所有实例](Objects类清单/DisplayTitleCard.md) |
| FriendDisplayLord | 好友位置、蜡烛与场景显示 | 30% | 1 | [实施与所有实例](Objects类清单/FriendDisplayLord.md) |
| InviteDisplayLord | 邀请状态及场景显示控制 | 30% | 1 | [实施与所有实例](Objects类清单/InviteDisplayLord.md) |
| InviteDisplayRig | 邀请空位、待确认与已确认视图 | 30% | 1 | [实施与所有实例](Objects类清单/InviteDisplayRig.md) |
| OnBubbleButton | 世界气泡按钮距离、图标与点击事件 | 30% | 4 | [实施与所有实例](Objects类清单/OnBubbleButton.md) |
| OnButtonClick | 按钮点击事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnButtonClick.md) |
| OnConfirmMenu | 确认菜单、图标与确认取消事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnConfirmMenu.md) |
| OpenConstellationTable | 星座桌菜单与关闭事件 | 30% | 2 | [实施与所有实例](Objects类清单/OpenConstellationTable.md) |
| ShowHUDTimed | HUD 纹理、图层、时长与过渡 | 30% | 73 | [实施与所有实例](Objects类清单/ShowHUDTimed.md) |
| UIInterestMask | 界面关注区域标记 | 30% | 2 | [实施与所有实例](Objects类清单/UIInterestMask.md) |

## 网络、账户与社交流程

匹配、连接、账户就绪及社交状态。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| BenchChat | 长椅座位与聊天频道 | 30% | 18 | [实施与所有实例](Objects类清单/BenchChat.md) |
| MatchHint | 匹配人数、距离与拆分规则 | 30% | 20 | [实施与所有实例](Objects类清单/MatchHint.md) |
| NetDisconnect | 网络断开事件 | 20% | 1 | [实施与所有实例](Objects类清单/NetDisconnect.md) |
| NetFlag | 网络标志声明，实际行为待恢复 | 20% | 34 | [实施与所有实例](Objects类清单/NetFlag.md) |
| NetSetMatchmakingDisabled | 网络匹配开关 | 20% | 6 | [实施与所有实例](Objects类清单/NetSetMatchmakingDisabled.md) |
| OnAccountReady | 账户就绪、超时与回调 | 30% | 1 | [实施与所有实例](Objects类清单/OnAccountReady.md) |
| OnForgeGift | 赠礼条件后启用对象 | 30% | 2 | [实施与所有实例](Objects类清单/OnForgeGift.md) |
| OnGameReady | 游戏就绪事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnGameReady.md) |
| OnJoinPreviousGame | 重返上一游戏与失败事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnJoinPreviousGame.md) |
| OnOfferGift | 赠礼发起事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnOfferGift.md) |
| RefreshGiftMessages | 刷新赠礼消息 | 20% | 1 | [实施与所有实例](Objects类清单/RefreshGiftMessages.md) |

## 教程、平台门控与统计

教程、版本条件、调查和统计事件。

| 单独类 | 此类功能 | 类进度 | 全部实例数 | 独立清单 |
| --- | --- | --- | ---: | --- |
| AgeGate | 年龄验证与完成事件 | 30% | 1 | [实施与所有实例](Objects类清单/AgeGate.md) |
| FeatureFlag | 命名功能旗标与存在性分支 | 30% | 3 | [实施与所有实例](Objects类清单/FeatureFlag.md) |
| OnBetaMode | 测试版模式条件事件 | 30% | 2 | [实施与所有实例](Objects类清单/OnBetaMode.md) |
| OnDemoMode | 演示模式条件事件 | 30% | 10 | [实施与所有实例](Objects类清单/OnDemoMode.md) |
| OnLatestVersion | 最新版本条件事件 | 30% | 1 | [实施与所有实例](Objects类清单/OnLatestVersion.md) |
| SendAnalyticsEvent | 命名统计事件 | 30% | 3 | [实施与所有实例](Objects类清单/SendAnalyticsEvent.md) |
| SetShopTableTutorial | 任务桌商店教程配置 | 30% | 2 | [实施与所有实例](Objects类清单/SetShopTableTutorial.md) |
| SetTutorialMode | 教程状态设置 | 30% | 24 | [实施与所有实例](Objects类清单/SetTutorialMode.md) |
| ShowMOTD | 公告显示与关闭事件 | 30% | 1 | [实施与所有实例](Objects类清单/ShowMOTD.md) |
| Survey | 问卷入口 | 30% | 34 | [实施与所有实例](Objects类清单/Survey.md) |
| TitleGate | 标题流程门控 | 20% | 1 | [实施与所有实例](Objects类清单/TitleGate.md) |
| TutorialNode | 教程步骤、目标、拖动与行走事件 | 30% | 25 | [实施与所有实例](Objects类清单/TutorialNode.md) |

刷新全部清单：

```bash
npx tsx tools/objects-avatar-inventory.ts
```

也可运行 `npx tsx tools/objects-class-progress.ts` 同步刷新逐类/逐对象清单。生成器重新核验全部源文件和引用，并核对所有节点数、唯一键、嵌套数量及类归属。类与对象状态分别维护，原字段值只表示文件配置，实际默认值/启动结果待原逻辑验证。
