# BirdV2 单独类功能实现清单

功能分类：生物、群体与 AI。

此类职责：**鸟类实例与 AI 参数**。

类清单进度 40%（4/10），184 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：BirdV2 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 4 项。
- [ ] 鸟类实例与 AI 参数（部分完成）：原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。
- [ ] 依赖调用与事件：BirdV2AiParams（184 条引用）、BirdV2Params（184 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。
- [x] 明确范围的原核心子链已独立核验：原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=BirdV2) · [原字段、进度与全部实例 JSON](BirdV2.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n162](../Objects.level.bin对象实现清单.html#Dawn%3An162) | BstNode_840696147 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 58827 + 95 bytes |
| [n205](../Objects.level.bin对象实现清单.html#Dawn%3An205) | BstNode_2007 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 64125 + 90 bytes |
| [n247](../Objects.level.bin对象实现清单.html#Dawn%3An247) | BstNode_1842806890 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 73391 + 96 bytes |
| [n250](../Objects.level.bin对象实现清单.html#Dawn%3An250) | BstNode_2022 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 73549 + 90 bytes |
| [n273](../Objects.level.bin对象实现清单.html#Dawn%3An273) | BstNode_1494 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 77346 + 90 bytes |
| [n335](../Objects.level.bin对象实现清单.html#Dawn%3An335) | BstNode_1842806834 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 85418 + 96 bytes |
| [n393](../Objects.level.bin对象实现清单.html#Dawn%3An393) | BstNode_840696155 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 93006 + 95 bytes |
| [n447](../Objects.level.bin对象实现清单.html#Dawn%3An447) | BstNode_1489 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 100823 + 90 bytes |
| [n573](../Objects.level.bin对象实现清单.html#Dawn%3An573) | BstNode_1476 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 122115 + 90 bytes |
| [n660](../Objects.level.bin对象实现清单.html#Dawn%3An660) | BstNode_840696149 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 137024 + 95 bytes |
| [n683](../Objects.level.bin对象实现清单.html#Dawn%3An683) | BstNode_840696154 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 140545 + 95 bytes |
| [n704](../Objects.level.bin对象实现清单.html#Dawn%3An704) | BstNode_1655 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 143414 + 90 bytes |
| [n928](../Objects.level.bin对象实现清单.html#Dawn%3An928) | BstNode_1484 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 177988 + 90 bytes |
| [n933](../Objects.level.bin对象实现清单.html#Dawn%3An933) | BstNode_1842806839 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 178571 + 96 bytes |
| [n997](../Objects.level.bin对象实现清单.html#Dawn%3An997) | BstNode_1493 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 188684 + 90 bytes |
| [n1151](../Objects.level.bin对象实现清单.html#Dawn%3An1151) | BstNode_1474 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 206542 + 90 bytes |
| [n1167](../Objects.level.bin对象实现清单.html#Dawn%3An1167) | BstNode_1500 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 208186 + 90 bytes |
| [n1226](../Objects.level.bin对象实现清单.html#Dawn%3An1226) | BstNode_1842806804 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 218852 + 96 bytes |
| [n1237](../Objects.level.bin对象实现清单.html#Dawn%3An1237) | BstNode_1842806888 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 221623 + 96 bytes |
| [n1248](../Objects.level.bin对象实现清单.html#Dawn%3An1248) | BstNode_1842806785 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 223591 + 96 bytes |
| [n1450](../Objects.level.bin对象实现清单.html#Dawn%3An1450) | BstNode_2005 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 255426 + 90 bytes |
| [n1519](../Objects.level.bin对象实现清单.html#Dawn%3An1519) | BstNode_1842806885 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 265666 + 96 bytes |
| [n1585](../Objects.level.bin对象实现清单.html#Dawn%3An1585) | BstNode_1842806867 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 273454 + 96 bytes |
| [n1656](../Objects.level.bin对象实现清单.html#Dawn%3An1656) | BstNode_1842806879 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 283100 + 96 bytes |
| [n1680](../Objects.level.bin对象实现清单.html#Dawn%3An1680) | BstNode_1842806855 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 287207 + 96 bytes |
| [n1785](../Objects.level.bin对象实现清单.html#Dawn%3An1785) | BstNode_1842806831 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 300818 + 96 bytes |
| [n1808](../Objects.level.bin对象实现清单.html#Dawn%3An1808) | BstNode_1842806836 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 303575 + 96 bytes |
| [n1830](../Objects.level.bin对象实现清单.html#Dawn%3An1830) | BstNode_1834 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 306459 + 90 bytes |
| [n1950](../Objects.level.bin对象实现清单.html#Dawn%3An1950) | BstNode_1999 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 320267 + 90 bytes |
| [n2015](../Objects.level.bin对象实现清单.html#Dawn%3An2015) | BstNode_840696152 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 329950 + 95 bytes |
| [n2112](../Objects.level.bin对象实现清单.html#Dawn%3An2112) | BstNode_840696148 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 345501 + 95 bytes |
| [n2372](../Objects.level.bin对象实现清单.html#Dawn%3An2372) | BstNode_1842806788 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 394404 + 96 bytes |
| [n2384](../Objects.level.bin对象实现清单.html#Dawn%3An2384) | BstNode_840696150 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 396047 + 95 bytes |
| [n2462](../Objects.level.bin对象实现清单.html#Dawn%3An2462) | BstNode_840696146 | 20%（2/10），运行待验 | 2 / 3 | Dawn · 409690 + 95 bytes |
| [n2481](../Objects.level.bin对象实现清单.html#Dawn%3An2481) | BstNode_1736 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 413048 + 90 bytes |
| [n2528](../Objects.level.bin对象实现清单.html#Dawn%3An2528) | BstNode_840696153 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 422397 + 95 bytes |
| [n2542](../Objects.level.bin对象实现清单.html#Dawn%3An2542) | BstNode_961 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 425289 + 89 bytes |
| [n2558](../Objects.level.bin对象实现清单.html#Dawn%3An2558) | BstNode_1842806794 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 427488 + 96 bytes |
| [n2563](../Objects.level.bin对象实现清单.html#Dawn%3An2563) | BstNode_1471 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 427836 + 90 bytes |
| [n2647](../Objects.level.bin对象实现清单.html#Dawn%3An2647) | BstNode_1005 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 439294 + 90 bytes |
| [n2746](../Objects.level.bin对象实现清单.html#Dawn%3An2746) | BstNode_1907 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 453973 + 90 bytes |
| [n2755](../Objects.level.bin对象实现清单.html#Dawn%3An2755) | BstNode_1842806833 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 454846 + 96 bytes |
| [n2756](../Objects.level.bin对象实现清单.html#Dawn%3An2756) | BstNode_1004 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 454942 + 90 bytes |
| [n2778](../Objects.level.bin对象实现清单.html#Dawn%3An2778) | BstNode_1842806900 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 457020 + 96 bytes |
| [n2788](../Objects.level.bin对象实现清单.html#Dawn%3An2788) | BstNode_1842806801 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 458344 + 96 bytes |
| [n2826](../Objects.level.bin对象实现清单.html#Dawn%3An2826) | BstNode_840696151 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 463437 + 95 bytes |
| [n2860](../Objects.level.bin对象实现清单.html#Dawn%3An2860) | BstNode_1977 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 469064 + 90 bytes |
| [n2959](../Objects.level.bin对象实现清单.html#Dawn%3An2959) | BstNode_1872 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 482755 + 90 bytes |
| [n1096](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1096) | BstNode_561 | 20%（2/10），运行待验 | 2 / 1 | DuskGraveyard · 283869 + 89 bytes |
| [n63](../Objects.level.bin对象实现清单.html#HubReveal%3An63) | BstNode_172 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 39329 + 89 bytes |
| [n121](../Objects.level.bin对象实现清单.html#HubReveal%3An121) | BstNode_623 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 50468 + 89 bytes |
| [n130](../Objects.level.bin对象实现清单.html#HubReveal%3An130) | BstNode_980 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 52109 + 89 bytes |
| [n169](../Objects.level.bin对象实现清单.html#HubReveal%3An169) | BstNode_636 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 58008 + 89 bytes |
| [n201](../Objects.level.bin对象实现清单.html#HubReveal%3An201) | BstNode_983 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 64266 + 89 bytes |
| [n227](../Objects.level.bin对象实现清单.html#HubReveal%3An227) | BstNode_649 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 69667 + 89 bytes |
| [n273](../Objects.level.bin对象实现清单.html#HubReveal%3An273) | BstNode_963 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 75536 + 89 bytes |
| [n295](../Objects.level.bin对象实现清单.html#HubReveal%3An295) | BstNode_977 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 79759 + 89 bytes |
| [n315](../Objects.level.bin对象实现清单.html#HubReveal%3An315) | BstNode_181 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 83663 + 89 bytes |
| [n376](../Objects.level.bin对象实现清单.html#HubReveal%3An376) | BstNode_603 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 93772 + 89 bytes |
| [n404](../Objects.level.bin对象实现清单.html#HubReveal%3An404) | BstNode_960 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 99116 + 89 bytes |
| [n416](../Objects.level.bin对象实现清单.html#HubReveal%3An416) | BstNode_255 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 101158 + 89 bytes |
| [n553](../Objects.level.bin对象实现清单.html#HubReveal%3An553) | BstNode_624 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 125176 + 89 bytes |
| [n573](../Objects.level.bin对象实现清单.html#HubReveal%3An573) | BstNode_205 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 126967 + 89 bytes |
| [n594](../Objects.level.bin对象实现清单.html#HubReveal%3An594) | BstNode_893 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 130548 + 89 bytes |
| [n632](../Objects.level.bin对象实现清单.html#HubReveal%3An632) | BstNode_167 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 136372 + 89 bytes |
| [n655](../Objects.level.bin对象实现清单.html#HubReveal%3An655) | BstNode_106 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 139759 + 89 bytes |
| [n666](../Objects.level.bin对象实现清单.html#HubReveal%3An666) | BstNode_116 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 141400 + 89 bytes |
| [n668](../Objects.level.bin对象实现清单.html#HubReveal%3An668) | BstNode_176 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 141613 + 89 bytes |
| [n716](../Objects.level.bin对象实现清单.html#HubReveal%3An716) | BstNode_263 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 149246 + 89 bytes |
| [n764](../Objects.level.bin对象实现清单.html#HubReveal%3An764) | BstNode_160 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 157743 + 89 bytes |
| [n802](../Objects.level.bin对象实现清单.html#HubReveal%3An802) | BstNode_82 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 163050 + 88 bytes |
| [n828](../Objects.level.bin对象实现清单.html#HubReveal%3An828) | BstNode_670 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 168246 + 89 bytes |
| [n907](../Objects.level.bin对象实现清单.html#HubReveal%3An907) | BstNode_682 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 181565 + 89 bytes |
| [n1003](../Objects.level.bin对象实现清单.html#HubReveal%3An1003) | BstNode_643 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 197419 + 89 bytes |
| [n1083](../Objects.level.bin对象实现清单.html#HubReveal%3An1083) | BstNode_966 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 211319 + 89 bytes |
| [n1092](../Objects.level.bin对象实现清单.html#HubReveal%3An1092) | BstNode_982 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 212649 + 89 bytes |
| [n1141](../Objects.level.bin对象实现清单.html#HubReveal%3An1141) | BstNode_987 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 222771 + 89 bytes |
| [n1212](../Objects.level.bin对象实现清单.html#HubReveal%3An1212) | BstNode_619 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 235725 + 89 bytes |
| [n1227](../Objects.level.bin对象实现清单.html#HubReveal%3An1227) | BstNode_240 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 238563 + 89 bytes |
| [n1253](../Objects.level.bin对象实现清单.html#HubReveal%3An1253) | BstNode_975 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 242379 + 89 bytes |
| [n1261](../Objects.level.bin对象实现清单.html#HubReveal%3An1261) | BstNode_968 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 243408 + 89 bytes |
| [n1398](../Objects.level.bin对象实现清单.html#HubReveal%3An1398) | BstNode_642 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 264040 + 89 bytes |
| [n1484](../Objects.level.bin对象实现清单.html#HubReveal%3An1484) | BstNode_792 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 278432 + 89 bytes |
| [n107](../Objects.level.bin对象实现清单.html#Prairie_Village%3An107) | BstNode_1417 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 47800 + 90 bytes |
| [n126](../Objects.level.bin对象实现清单.html#Prairie_Village%3An126) | BstNode_1546 | 20%（2/10），运行待验 | 2 / 12 | Prairie_Village · 52239 + 90 bytes |
| [n148](../Objects.level.bin对象实现清单.html#Prairie_Village%3An148) | BstNode_568 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 54645 + 89 bytes |
| [n185](../Objects.level.bin对象实现清单.html#Prairie_Village%3An185) | BstNode_2061 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 61112 + 90 bytes |
| [n239](../Objects.level.bin对象实现清单.html#Prairie_Village%3An239) | BstNode_2096 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 69593 + 90 bytes |
| [n283](../Objects.level.bin对象实现清单.html#Prairie_Village%3An283) | BstNode_636 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 75521 + 89 bytes |
| [n391](../Objects.level.bin对象实现清单.html#Prairie_Village%3An391) | BstNode_649 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 93549 + 89 bytes |
| [n419](../Objects.level.bin对象实现清单.html#Prairie_Village%3An419) | BstNode_1564 | 20%（2/10），运行待验 | 2 / 13 | Prairie_Village · 99304 + 90 bytes |
| [n454](../Objects.level.bin对象实现清单.html#Prairie_Village%3An454) | BstNode_2095 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 105044 + 90 bytes |
| [n507](../Objects.level.bin对象实现清单.html#Prairie_Village%3An507) | BstNode_575 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 114186 + 89 bytes |
| [n575](../Objects.level.bin对象实现清单.html#Prairie_Village%3An575) | BstNode_2047 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 123280 + 90 bytes |
| [n637](../Objects.level.bin对象实现清单.html#Prairie_Village%3An637) | BstNode_357 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 132508 + 89 bytes |
| [n1003](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1003) | BstNode_2089 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 195840 + 90 bytes |
| [n1045](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1045) | BstNode_624 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 203432 + 89 bytes |
| [n1051](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1051) | BstNode_1565 | 20%（2/10），运行待验 | 2 / 11 | Prairie_Village · 203888 + 90 bytes |
| [n1345](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1345) | BstNode_643 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 247409 + 89 bytes |
| [n1373](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1373) | BstNode_563 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 252080 + 89 bytes |
| [n1447](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1447) | BstNode_2210 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 262626 + 90 bytes |
| [n1490](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1490) | BstNode_2048 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 269094 + 90 bytes |
| [n1617](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1617) | BstNode_2104 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 289457 + 90 bytes |
| [n1699](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1699) | BstNode_1602 | 20%（2/10），运行待验 | 2 / 22 | Prairie_Village · 301533 + 90 bytes |
| [n1956](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1956) | BstNode_670 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 348746 + 89 bytes |
| [n2018](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2018) | BstNode_574 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 358570 + 89 bytes |
| [n2038](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2038) | BstNode_2072 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 362734 + 90 bytes |
| [n2260](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2260) | BstNode_2105 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 392404 + 90 bytes |
| [n2277](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2277) | BstNode_2346 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 394984 + 90 bytes |
| [n2314](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2314) | BstNode_623 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 400974 + 89 bytes |
| [n2329](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2329) | BstNode_2094 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 402502 + 90 bytes |
| [n2392](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2392) | BstNode_2368 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 412319 + 90 bytes |
| [n2410](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2410) | BstNode_425 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 415033 + 89 bytes |
| [n2513](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2513) | BstNode_460 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 428669 + 89 bytes |
| [n2628](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2628) | BstNode_307 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 446158 + 89 bytes |
| [n2662](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2662) | BstNode_2056 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 450485 + 90 bytes |
| [n2672](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2672) | BstNode_402 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 452235 + 89 bytes |
| [n2684](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2684) | BstNode_2097 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 454700 + 90 bytes |
| [n2737](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2737) | BstNode_2291 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 463495 + 90 bytes |
| [n2795](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2795) | BstNode_619 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 474076 + 89 bytes |
| [n2918](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2918) | BstNode_2081 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 496158 + 90 bytes |
| [n2979](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2979) | BstNode_1419 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 506466 + 90 bytes |
| [n3005](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3005) | BstNode_259 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 510959 + 89 bytes |
| [n3018](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3018) | BstNode_682 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 512713 + 89 bytes |
| [n3030](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3030) | BstNode_642 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 514783 + 89 bytes |
| [n3063](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3063) | BstNode_2363 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 519870 + 90 bytes |
| [n3111](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3111) | BstNode_308 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 528457 + 89 bytes |
| [n3120](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3120) | BstNode_1414 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 529734 + 90 bytes |
| [n807](../Objects.level.bin对象实现清单.html#Rain%3An807) | BstNode_34603166 | 20%（2/10），运行待验 | 2 / 0 | Rain · 209448 + 94 bytes |
| [n7](../Objects.level.bin对象实现清单.html#RainEnd%3An7) | BstNode_840695933 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 29654 + 95 bytes |
| [n108](../Objects.level.bin对象实现清单.html#RainEnd%3An108) | BstNode_840695947 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 53716 + 95 bytes |
| [n597](../Objects.level.bin对象实现清单.html#RainEnd%3An597) | BstNode_536 | 20%（2/10），运行待验 | 2 / 0 | RainEnd · 173308 + 89 bytes |
| [n635](../Objects.level.bin对象实现清单.html#RainEnd%3An635) | BstNode_840695942 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 183281 + 95 bytes |
| [n707](../Objects.level.bin对象实现清单.html#RainEnd%3An707) | BstNode_840695939 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 199606 + 95 bytes |
| [n711](../Objects.level.bin对象实现清单.html#RainEnd%3An711) | BstNode_840695937 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 200382 + 95 bytes |
| [n913](../Objects.level.bin对象实现清单.html#RainEnd%3An913) | BstNode_840695940 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 246117 + 95 bytes |
| [n1157](../Objects.level.bin对象实现清单.html#RainEnd%3An1157) | BstNode_840695936 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 305142 + 95 bytes |
| [n1433](../Objects.level.bin对象实现清单.html#RainEnd%3An1433) | BstNode_840695938 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 373584 + 95 bytes |
| [n1506](../Objects.level.bin对象实现清单.html#RainEnd%3An1506) | BstNode_840695949 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 386930 + 95 bytes |
| [n1538](../Objects.level.bin对象实现清单.html#RainEnd%3An1538) | BstNode_840695948 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 391748 + 95 bytes |
| [n1563](../Objects.level.bin对象实现清单.html#RainEnd%3An1563) | BstNode_840695943 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 397668 + 95 bytes |
| [n1564](../Objects.level.bin对象实现清单.html#RainEnd%3An1564) | BstNode_840695941 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 397763 + 95 bytes |
| [n72](../Objects.level.bin对象实现清单.html#RainForest%3An72) | BstNode_34603166 | 20%（2/10），运行待验 | 2 / 0 | RainForest · 35658 + 94 bytes |
| [n141](../Objects.level.bin对象实现清单.html#RainForest%3An141) | BstNode_1601 | 20%（2/10），运行待验 | 2 / 0 | RainForest · 49703 + 90 bytes |
| [n723](../Objects.level.bin对象实现清单.html#RainMid%3An723) | BstNode_1782 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 162747 + 90 bytes |
| [n1702](../Objects.level.bin对象实现清单.html#RainMid%3An1702) | BstNode_2345992372 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 340021 + 96 bytes |
| [n1774](../Objects.level.bin对象实现清单.html#RainMid%3An1774) | BstNode_34603239 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 351409 + 94 bytes |
| [n2015](../Objects.level.bin对象实现清单.html#RainMid%3An2015) | BstNode_2060386400 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 388394 + 96 bytes |
| [n1108](../Objects.level.bin对象实现清单.html#Sunset%3An1108) | BstNode_131 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 215584 + 89 bytes |
| [n1130](../Objects.level.bin对象实现清单.html#Sunset%3An1130) | BstNode_20 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 218283 + 88 bytes |
| [n1226](../Objects.level.bin对象实现清单.html#Sunset%3An1226) | BstNode_1167523941 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 234900 + 96 bytes |
| [n1658](../Objects.level.bin对象实现清单.html#Sunset%3An1658) | BstNode_88 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 305038 + 88 bytes |
| [n1013](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1013) | BstNode_131 | 20%（2/10），运行待验 | 2 / 0 | SunsetEnd · 194855 + 89 bytes |
| [n1739](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1739) | BstNode_88 | 20%（2/10），运行待验 | 2 / 0 | SunsetEnd · 326349 + 88 bytes |
| [n67](../Objects.level.bin对象实现清单.html#SunsetRace%3An67) | BstNode_840695916 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 35070 + 95 bytes |
| [n150](../Objects.level.bin对象实现清单.html#SunsetRace%3An150) | BstNode_840695914 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 49281 + 95 bytes |
| [n417](../Objects.level.bin对象实现清单.html#SunsetRace%3An417) | BstNode_649 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 105869 + 89 bytes |
| [n568](../Objects.level.bin对象实现清单.html#SunsetRace%3An568) | BstNode_624 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 137305 + 89 bytes |
| [n669](../Objects.level.bin对象实现清单.html#SunsetRace%3An669) | BstNode_1167524157 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 155991 + 96 bytes |
| [n673](../Objects.level.bin对象实现清单.html#SunsetRace%3An673) | BstNode_1167524132 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 156679 + 96 bytes |
| [n690](../Objects.level.bin对象实现清单.html#SunsetRace%3An690) | BstNode_682 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 159145 + 89 bytes |
| [n762](../Objects.level.bin对象实现清单.html#SunsetRace%3An762) | BstNode_1167524143 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 172105 + 96 bytes |
| [n924](../Objects.level.bin对象实现清单.html#SunsetRace%3An924) | BstNode_1167524392 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 200163 + 96 bytes |
| [n1097](../Objects.level.bin对象实现清单.html#SunsetRace%3An1097) | BstNode_1167524094 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 227360 + 96 bytes |
| [n1265](../Objects.level.bin对象实现清单.html#SunsetRace%3An1265) | BstNode_619 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 258160 + 89 bytes |
| [n1299](../Objects.level.bin对象实现清单.html#SunsetRace%3An1299) | BstNode_840695913 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 265962 + 95 bytes |
| [n1430](../Objects.level.bin对象实现清单.html#SunsetRace%3An1430) | BstNode_603 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 292788 + 89 bytes |
| [n1590](../Objects.level.bin对象实现清单.html#SunsetRace%3An1590) | BstNode_840695851 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 324208 + 95 bytes |
| [n1597](../Objects.level.bin对象实现清单.html#SunsetRace%3An1597) | BstNode_840695864 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 325437 + 95 bytes |
| [n2](../Objects.level.bin对象实现清单.html#TitleWater%3An2) | BstNode_779 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 16342 + 89 bytes |
| [n10](../Objects.level.bin对象实现清单.html#TitleWater%3An10) | BstNode_788 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 17848 + 89 bytes |
| [n35](../Objects.level.bin对象实现清单.html#TitleWater%3An35) | BstNode_783 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 20968 + 89 bytes |
| [n77](../Objects.level.bin对象实现清单.html#TitleWater%3An77) | BstNode_801 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 26804 + 89 bytes |
| [n86](../Objects.level.bin对象实现清单.html#TitleWater%3An86) | BstNode_794 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 28282 + 89 bytes |
| [n98](../Objects.level.bin对象实现清单.html#TitleWater%3An98) | BstNode_781 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 28981 + 89 bytes |
| [n108](../Objects.level.bin对象实现清单.html#TitleWater%3An108) | BstNode_789 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 30264 + 89 bytes |
| [n140](../Objects.level.bin对象实现清单.html#TitleWater%3An140) | BstNode_798 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 35736 + 89 bytes |
| [n145](../Objects.level.bin对象实现清单.html#TitleWater%3An145) | BstNode_778 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 36778 + 89 bytes |
| [n148](../Objects.level.bin对象实现清单.html#TitleWater%3An148) | BstNode_710 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 36967 + 89 bytes |
| [n155](../Objects.level.bin对象实现清单.html#TitleWater%3An155) | BstNode_792 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 37972 + 89 bytes |
| [n165](../Objects.level.bin对象实现清单.html#TitleWater%3An165) | BstNode_776 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 39363 + 89 bytes |
| [n171](../Objects.level.bin对象实现清单.html#TitleWater%3An171) | BstNode_786 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 40100 + 89 bytes |
| [n176](../Objects.level.bin对象实现清单.html#TitleWater%3An176) | BstNode_46 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 41382 + 88 bytes |
| [n194](../Objects.level.bin对象实现清单.html#TitleWater%3An194) | BstNode_770 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 44250 + 89 bytes |
