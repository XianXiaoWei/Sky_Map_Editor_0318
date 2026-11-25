# LensFlair 单独类功能实现清单

功能分类：粒子、灯光与场景效果。

此类职责：**镜头光效颜色、强度与样式**。

类清单进度 30%（3/10），44 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：LensFlair 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 8 项。
- [ ] 镜头光效颜色、强度与样式：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=LensFlair) · [原字段、进度与全部实例 JSON](LensFlair.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n171](../Objects.level.bin对象实现清单.html#CandleSpace%3An171) | BstNode_1293287462 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 45821 + 112 bytes |
| [n232](../Objects.level.bin对象实现清单.html#CandleSpace%3An232) | BstNode_1293287463 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 54923 + 112 bytes |
| [n264](../Objects.level.bin对象实现清单.html#CandleSpace%3An264) | BstNode_1293287465 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 59096 + 112 bytes |
| [n355](../Objects.level.bin对象实现清单.html#CandleSpace%3An355) | BstNode_1293287464 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 75723 + 112 bytes |
| [n58](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An58) | BstNode_85 | 20%（2/10），运行待验 | 0 / 0 | CandleSpaceEnd · 25043 + 104 bytes |
| [n113](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An113) | BstNode_2504654908 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 32682 + 112 bytes |
| [n288](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An288) | BstNode_2504654878 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 70481 + 112 bytes |
| [n409](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An409) | BstNode_2504654919 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 92367 + 112 bytes |
| [n415](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An415) | BstNode_1682898968 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 93627 + 112 bytes |
| [n580](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An580) | BstNode_2504654950 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 115125 + 112 bytes |
| [n588](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An588) | BstNode_2529558658 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 115693 + 112 bytes |
| [n615](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An615) | BstNode_2504654933 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 120085 + 112 bytes |
| [n16](../Objects.level.bin对象实现清单.html#Dawn%3An16) | BstNode_2279669931 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 35847 + 112 bytes |
| [n1961](../Objects.level.bin对象实现清单.html#Dawn%3An1961) | BstNode_2783838236 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 321680 + 112 bytes |
| [n2748](../Objects.level.bin对象实现清单.html#Dawn%3An2748) | BstNode_1842806845 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 454311 + 112 bytes |
| [n202](../Objects.level.bin对象实现清单.html#DayEnd%3An202) | BstNode_840695836 | 20%（2/10），运行待验 | 0 / 5 | DayEnd · 64033 + 111 bytes |
| [n270](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An270) | BstNode_615 | 20%（2/10），运行待验 | 0 / 1 | DuskGraveyard · 87098 + 104 bytes |
| [n1096](../Objects.level.bin对象实现清单.html#DuskMid%3An1096) | BstNode_615 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 228039 + 105 bytes |
| [n604](../Objects.level.bin对象实现清单.html#HubReveal%3An604) | BstNode_1749 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 132100 + 106 bytes |
| [n272](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An272) | BstNode_840695918 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 83568 + 111 bytes |
| [n431](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An431) | BstNode_840695918 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 122547 + 111 bytes |
| [n1648](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1648) | BstNode_3122856122 | 20%（2/10），运行待验 | 0 / 6 | Prairie_Cave · 420334 + 112 bytes |
| [n208](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An208) | BstNode_840695918 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 70352 + 111 bytes |
| [n276](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An276) | BstNode_2529558795 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 84690 + 112 bytes |
| [n293](../Objects.level.bin对象实现清单.html#Prairie_Village%3An293) | BstNode_840695918 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 76811 + 111 bytes |
| [n3007](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3007) | BstNode_3122856122 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 511179 + 112 bytes |
| [n1855](../Objects.level.bin对象实现清单.html#Rain%3An1855) | BstNode_932 | 20%（2/10），运行待验 | 0 / 0 | Rain · 447830 + 105 bytes |
| [n111](../Objects.level.bin对象实现清单.html#RainEnd%3An111) | BstNode_935 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 54252 + 105 bytes |
| [n1161](../Objects.level.bin对象实现清单.html#RainForest%3An1161) | BstNode_932 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 259700 + 105 bytes |
| [n518](../Objects.level.bin对象实现清单.html#SkyHub2%3An518) | BstNode_1049166059 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 130101 + 112 bytes |
| [n589](../Objects.level.bin对象实现清单.html#SkyHub2%3An589) | BstNode_1293288024 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 142652 + 112 bytes |
| [n931](../Objects.level.bin对象实现清单.html#SkyHub2%3An931) | BstNode_1049165848 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 202934 + 112 bytes |
| [n1337](../Objects.level.bin对象实现清单.html#SkyHub2%3An1337) | BstNode_1049166061 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 271208 + 112 bytes |
| [n1986](../Objects.level.bin对象实现清单.html#SkyHub2%3An1986) | BstNode_1049166060 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 376281 + 112 bytes |
| [n1995](../Objects.level.bin对象实现清单.html#SkyHub2%3An1995) | BstNode_1682898968 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 377454 + 112 bytes |
| [n2030](../Objects.level.bin对象实现清单.html#SkyHub2%3An2030) | BstNode_1049166058 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 382553 + 112 bytes |
| [n2189](../Objects.level.bin对象实现清单.html#SkyHub2%3An2189) | BstNode_1049166066 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 412658 + 112 bytes |
| [n966](../Objects.level.bin对象实现清单.html#Storm%3An966) | BstNode_2529558777 | 20%（2/10），运行待验 | 0 / 0 | Storm · 194596 + 112 bytes |
| [n1041](../Objects.level.bin对象实现清单.html#StormEnd%3An1041) | BstNode_2529558777 | 20%（2/10），运行待验 | 0 / 7 | StormEnd · 200766 + 112 bytes |
| [n663](../Objects.level.bin对象实现清单.html#Sunset%3An663) | BstNode_1049165881 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 146031 + 112 bytes |
| [n721](../Objects.level.bin对象实现清单.html#SunsetEnd%3An721) | BstNode_1049165881 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 147342 + 112 bytes |
| [n521](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An521) | BstNode_1049165881 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 133112 + 112 bytes |
| [n538](../Objects.level.bin对象实现清单.html#SunsetRace%3An538) | BstNode_1049165881 | 20%（2/10），运行待验 | 0 / 1 | SunsetRace · 132678 + 112 bytes |
| [n46](../Objects.level.bin对象实现清单.html#TitleWater%3An46) | BstNode_479 | 20%（2/10），运行待验 | 0 / 0 | TitleWater · 23136 + 105 bytes |
