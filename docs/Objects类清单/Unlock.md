# Unlock 单独类功能实现清单

功能分类：收集物、蜡烛与解锁。

此类职责：**命名解锁与确认事件**。

类清单进度 30%（3/10），27 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Unlock 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 命名解锁与确认事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Unlock) · [原字段、进度与全部实例 JSON](Unlock.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n186](../Objects.level.bin对象实现清单.html#CandleSpace%3An186) | BstNode_3156082694 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 48912 + 43 bytes |
| [n298](../Objects.level.bin对象实现清单.html#CandleSpace%3An298) | BstNode_2446917763 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 66971 + 43 bytes |
| [n388](../Objects.level.bin对象实现清单.html#CandleSpace%3An388) | BstNode_2529558586 | 20%（2/10），运行待验 | 0 / 1 | CandleSpace · 81468 + 45 bytes |
| [n452](../Objects.level.bin对象实现清单.html#CandleSpace%3An452) | BstNode_2529558770 | 20%（2/10），运行待验 | 1 / 1 | CandleSpace · 89023 + 41 bytes |
| [n903](../Objects.level.bin对象实现清单.html#Dawn%3An903) | BstNode_1211 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 175520 + 28 bytes |
| [n345](../Objects.level.bin对象实现清单.html#HubReveal%3An345) | BstNode_2446917662 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 88478 + 38 bytes |
| [n898](../Objects.level.bin对象实现清单.html#HubReveal%3An898) | BstNode_936 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 179836 + 29 bytes |
| [n1320](../Objects.level.bin对象实现清单.html#HubReveal%3An1320) | BstNode_3156082761 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 253546 + 41 bytes |
| [n94](../Objects.level.bin对象实现清单.html#NightEnd%3An94) | BstNode_2446917634 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 36775 + 48 bytes |
| [n67](../Objects.level.bin对象实现清单.html#NightEntrance%3An67) | BstNode_2446917634 | 20%（2/10），运行待验 | 0 / 1 | NightEntrance · 26432 + 48 bytes |
| [n945](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An945) | BstNode_2529558651 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 202644 + 37 bytes |
| [n1726](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1726) | BstNode_2529558651 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 442614 + 37 bytes |
| [n971](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An971) | BstNode_2529558651 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 236488 + 37 bytes |
| [n230](../Objects.level.bin对象实现清单.html#SkyHub2%3An230) | BstNode_2529558885 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 74787 + 44 bytes |
| [n441](../Objects.level.bin对象实现清单.html#SkyHub2%3An441) | BstNode_2529558899 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 117716 + 44 bytes |
| [n966](../Objects.level.bin对象实现清单.html#SkyHub2%3An966) | BstNode_1167524319 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 207414 + 38 bytes |
| [n991](../Objects.level.bin对象实现清单.html#SkyHub2%3An991) | BstNode_2529558866 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 212609 + 43 bytes |
| [n995](../Objects.level.bin对象实现清单.html#SkyHub2%3An995) | BstNode_2529558841 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 213485 + 44 bytes |
| [n1011](../Objects.level.bin对象实现清单.html#SkyHub2%3An1011) | BstNode_2529558906 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 217467 + 45 bytes |
| [n1221](../Objects.level.bin对象实现清单.html#SkyHub2%3An1221) | BstNode_1293287428 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 254451 + 44 bytes |
| [n1438](../Objects.level.bin对象实现清单.html#SkyHub2%3An1438) | BstNode_2446917850 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 283184 + 55 bytes |
| [n1458](../Objects.level.bin对象实现清单.html#SkyHub2%3An1458) | BstNode_1167523913 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 284642 + 56 bytes |
| [n1843](../Objects.level.bin对象实现清单.html#SkyHub2%3An1843) | BstNode_2529558911 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 347931 + 45 bytes |
| [n2009](../Objects.level.bin对象实现清单.html#SkyHub2%3An2009) | BstNode_2529558892 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 379327 + 46 bytes |
| [n2238](../Objects.level.bin对象实现清单.html#SkyHub2%3An2238) | BstNode_2446917897 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 421552 + 36 bytes |
| [n2312](../Objects.level.bin对象实现清单.html#SkyHub2%3An2312) | BstNode_1167523943 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 435155 + 48 bytes |
| [n706](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An706) | BstNode_1049165921 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 175847 + 48 bytes |
