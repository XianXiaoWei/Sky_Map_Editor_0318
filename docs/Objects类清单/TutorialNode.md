# TutorialNode 单独类功能实现清单

功能分类：教程、平台门控与统计。

此类职责：**教程步骤、目标、拖动与行走事件**。

类清单进度 30%（3/10），25 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：TutorialNode 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 10 项。
- [ ] 教程步骤、目标、拖动与行走事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（24 条引用）、Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 10 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=TutorialNode) · [原字段、进度与全部实例 JSON](TutorialNode.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n99](../Objects.level.bin对象实现清单.html#Dawn%3An99) | BstNode_3156082731 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 48981 + 85 bytes |
| [n104](../Objects.level.bin对象实现清单.html#Dawn%3An104) | BstNode_3156082709 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 49366 + 85 bytes |
| [n547](../Objects.level.bin对象实现清单.html#Dawn%3An547) | BstNode_1257 | 20%（2/10），运行待验 | 2 / 3 | Dawn · 117977 + 79 bytes |
| [n902](../Objects.level.bin对象实现清单.html#Dawn%3An902) | BstNode_1293287789 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 175435 + 85 bytes |
| [n906](../Objects.level.bin对象实现清单.html#Dawn%3An906) | BstNode_1293287791 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 176318 + 85 bytes |
| [n914](../Objects.level.bin对象实现清单.html#Dawn%3An914) | BstNode_2446917677 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 177006 + 85 bytes |
| [n979](../Objects.level.bin对象实现清单.html#Dawn%3An979) | BstNode_2446917764 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 185553 + 85 bytes |
| [n1023](../Objects.level.bin对象实现清单.html#Dawn%3An1023) | BstNode_3122856161 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 191411 + 85 bytes |
| [n1059](../Objects.level.bin对象实现清单.html#Dawn%3An1059) | BstNode_2446917684 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 194335 + 85 bytes |
| [n1086](../Objects.level.bin对象实现清单.html#Dawn%3An1086) | BstNode_1583 | 20%（2/10），运行待验 | 1 / 5 | Dawn · 199336 + 79 bytes |
| [n1489](../Objects.level.bin对象实现清单.html#Dawn%3An1489) | BstNode_2446917680 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 262102 + 85 bytes |
| [n2043](../Objects.level.bin对象实现清单.html#Dawn%3An2043) | BstNode_2446917637 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 334301 + 85 bytes |
| [n2359](../Objects.level.bin对象实现清单.html#Dawn%3An2359) | BstNode_2446917757 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 391916 + 85 bytes |
| [n2650](../Objects.level.bin对象实现清单.html#Dawn%3An2650) | BstNode_1662 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 439486 + 79 bytes |
| [n2942](../Objects.level.bin对象实现清单.html#Dawn%3An2942) | BstNode_3122856265 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 481045 + 85 bytes |
| [n198](../Objects.level.bin对象实现清单.html#DayEnd%3An198) | BstNode_699 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 63365 + 78 bytes |
| [n254](../Objects.level.bin对象实现清单.html#HubReveal%3An254) | BstNode_2446917652 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 72571 + 85 bytes |
| [n720](../Objects.level.bin对象实现清单.html#HubReveal%3An720) | BstNode_1855 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 150171 + 79 bytes |
| [n1108](../Objects.level.bin对象实现清单.html#HubReveal%3An1108) | BstNode_2645622813 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 214943 + 85 bytes |
| [n1242](../Objects.level.bin对象实现清单.html#HubReveal%3An1242) | BstNode_1662 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 240697 + 79 bytes |
| [n391](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An391) | BstNode_1293287717 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Cave · 114863 + 85 bytes |
| [n435](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An435) | BstNode_1293287706 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Cave · 123595 + 85 bytes |
| [n1469](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1469) | BstNode_1662 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Cave · 369753 + 79 bytes |
| [n1269](../Objects.level.bin对象实现清单.html#SkyHub2%3An1269) | BstNode_1167524146 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 262114 + 85 bytes |
| [n2096](../Objects.level.bin对象实现清单.html#SkyHub2%3An2096) | BstNode_2529558597 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 393849 + 85 bytes |
