本轮恢复整个 `FishV2.AI`（`0x100335a40..0x1003370c0`，1085 条指令及五项相对跳转表），并恢复原 Pursuit、累积 Avoidance 和两种对象过滤函数。五个 AI 状态、选轨／循环采样、Marker 评分、Mote 吃取与追逐、玩家逃离和互动、动画切换及颜色参数均进入原程序对比。

对比共 1460 组、223247120 字节、49770 次调用，零差异。按模式分为：AI 外层及明确服务边界 859；整个 Pursuit 58；整个累积 Avoidance 63；附近对象过滤 8；群聚过滤 8；正式 Update＋实际 AI／运动函数 140；实际 AI＋全部转向力函数 294；Update＋AI＋运动及转向力完整组合 30。组合对照执行原始函数体，包含原群聚查询的八次调用缓存、空邻域和 Actor 邻域以及连续帧。

`originalFishAISteeringServices` 组合原 Begin、Avoidance、Flee、Seek 两个重载、Pursuit、Wander、Flocking 与 End；`originalFishAIUpdateServices` 让 Update 实际调用 AI、TurnDirection、Bank 和运动变换。临时运动数据使用私有缓冲，避免写入场景对象。原 Marker 目标未写入的速度 W 明确由调用上下文提供；原 asinf／sincos 和运动 libm 结果在对照中记录回放，NaN 和 SIMD 上层通道不由近似数学函数替代。

原常量已从二进制核实：Marker 计数评分乘数 -15；Mote 追逐外围是半径的 6 倍；逃离玩家的近距离参数为 6、远距离为 10；附近玩家范围 8；玩家互动半径 1.25。原字段 +0x180 在最终条件下写入 2，和上述值 6 分开处理。

原世界避障／碰撞、元数据转换、Avatar／OBB 和轨道几何、Model／动画、粒子音频、玩家互动 owner 与 Barn 装卸仍是明确边界。独立 Flocking 旧对照保留 Avatar／普通对象覆盖，本次 AI 组合覆盖空邻域和 Actor 邻域。通过上述验证不等于完成场景验收。

33 张原图中的 5 个 CharFishGroupAnim 是 LevelMesh 鱼群；其区域进入、Disturb 播放、4 秒 Delay 重启及轨道移动场景链、序列绑定仍待接入。冥龙外层 Update 后半段、螃蟹外层 Update、切图／重复装卸及 Windows 真机验收仍待完成。完整生物类保持 0；不生成新的 Windows 压缩包或 APK。

旧 `fish-update-native.json`／`fish-update-verification.json` 是上一阶段记录，其中 AI 标记描述当时的服务边界；当前进度以 `fish-ai-verification.json` 和 `creature-continuation-verification.json` 为准。
