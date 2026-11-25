# MatchHint 单独类功能实现清单

功能分类：网络、账户与社交流程。

此类职责：**匹配人数、距离与拆分规则**。

类清单进度 30%（3/10），20 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：MatchHint 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 匹配人数、距离与拆分规则：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=MatchHint) · [原字段、进度与全部实例 JSON](MatchHint.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n2504](../Objects.level.bin对象实现清单.html#Dawn%3An2504) | BstNode_402 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 418052 + 26 bytes |
| [n296](../Objects.level.bin对象实现清单.html#DayHubCave%3An296) | BstNode_2345992613 | 20%（2/10），运行待验 | 0 / 0 | DayHubCave · 75946 + 33 bytes |
| [n758](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An758) | BstNode_2345992627 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 198580 + 33 bytes |
| [n85](../Objects.level.bin对象实现清单.html#DuskMid%3An85) | BstNode_2345992493 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 35117 + 33 bytes |
| [n391](../Objects.level.bin对象实现清单.html#HubReveal%3An391) | BstNode_2295 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 96597 + 27 bytes |
| [n1384](../Objects.level.bin对象实现清单.html#HubReveal%3An1384) | BstNode_2291 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 262394 + 27 bytes |
| [n511](../Objects.level.bin对象实现清单.html#Night%3An511) | BstNode_34603454 | 20%（2/10），运行待验 | 0 / 0 | Night · 99331 + 31 bytes |
| [n667](../Objects.level.bin对象实现清单.html#NightEnd%3An667) | BstNode_34603117 | 20%（2/10），运行待验 | 0 / 0 | NightEnd · 132621 + 31 bytes |
| [n703](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An703) | BstNode_19 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 166184 + 25 bytes |
| [n466](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An466) | BstNode_19 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 124540 + 25 bytes |
| [n710](../Objects.level.bin对象实现清单.html#Prairie_Village%3An710) | BstNode_19 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 146102 + 25 bytes |
| [n999](../Objects.level.bin对象实现清单.html#RainEnd%3An999) | BstNode_154 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 266232 + 26 bytes |
| [n1524](../Objects.level.bin对象实现清单.html#RainMid%3An1524) | BstNode_154 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 305888 + 26 bytes |
| [n1379](../Objects.level.bin对象实现清单.html#SkyHub2%3An1379) | BstNode_1167523967 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 274933 + 33 bytes |
| [n511](../Objects.level.bin对象实现清单.html#Storm%3An511) | BstNode_2529560076 | 20%（2/10），运行待验 | 0 / 0 | Storm · 115120 + 33 bytes |
| [n448](../Objects.level.bin对象实现清单.html#StormEnd%3An448) | BstNode_2529558605 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 104454 + 33 bytes |
| [n771](../Objects.level.bin对象实现清单.html#Sunset%3An771) | BstNode_1049166024 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 163671 + 33 bytes |
| [n436](../Objects.level.bin对象实现清单.html#SunsetEnd%3An436) | BstNode_1656 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 103259 + 27 bytes |
| [n420](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An420) | BstNode_1656 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 108585 + 27 bytes |
| [n1463](../Objects.level.bin对象实现清单.html#SunsetRace%3An1463) | BstNode_1167524473 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 298264 + 33 bytes |
