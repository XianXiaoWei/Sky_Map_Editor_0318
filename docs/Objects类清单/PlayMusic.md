# PlayMusic 单独类功能实现清单

功能分类：声音、音乐与混音。

此类职责：**音乐切换、音量与淡入淡出**。

类清单进度 30%（3/10），92 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：PlayMusic 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 音乐切换、音量与淡入淡出：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=PlayMusic) · [原字段、进度与全部实例 JSON](PlayMusic.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n258](../Objects.level.bin对象实现清单.html#CandleSpace%3An258) | BstNode_1700134913 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 58694 + 47 bytes |
| [n202](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An202) | BstNode_1700134913 | 20%（2/10），运行待验 | 0 / 0 | CandleSpaceEnd · 50630 + 47 bytes |
| [n313](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An313) | BstNode_757399671 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 77667 + 45 bytes |
| [n5](../Objects.level.bin对象实现清单.html#CarryLand%3An5) | BstNode_528 | 20%（2/10），运行待验 | 0 / 1 | CarryLand · 9758 + 42 bytes |
| [n218](../Objects.level.bin对象实现清单.html#CarryLand2%3An218) | BstNode_528 | 20%（2/10），运行待验 | 0 / 1 | CarryLand2 · 49149 + 42 bytes |
| [n3](../Objects.level.bin对象实现清单.html#CarryLand3%3An3) | BstNode_528 | 20%（2/10），运行待验 | 0 / 1 | CarryLand3 · 6164 + 42 bytes |
| [n212](../Objects.level.bin对象实现清单.html#Dawn%3An212) | BstNode_1700134913 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 65097 + 50 bytes |
| [n472](../Objects.level.bin对象实现清单.html#Dawn%3An472) | BstNode_3122856348 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 105146 + 47 bytes |
| [n611](../Objects.level.bin对象实现清单.html#Dawn%3An611) | BstNode_2446917829 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 126993 + 39 bytes |
| [n620](../Objects.level.bin对象实现清单.html#Dawn%3An620) | BstNode_2279670000 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 129071 + 47 bytes |
| [n1268](../Objects.level.bin对象实现清单.html#Dawn%3An1268) | BstNode_1700134915 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 227601 + 47 bytes |
| [n1337](../Objects.level.bin对象实现清单.html#Dawn%3An1337) | BstNode_301 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 239933 + 40 bytes |
| [n1367](../Objects.level.bin对象实现清单.html#Dawn%3An1367) | BstNode_3122856176 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 242758 + 47 bytes |
| [n1474](../Objects.level.bin对象实现清单.html#Dawn%3An1474) | BstNode_3156082723 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 259569 + 39 bytes |
| [n1706](../Objects.level.bin对象实现清单.html#Dawn%3An1706) | BstNode_1293287870 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 290350 + 47 bytes |
| [n1738](../Objects.level.bin对象实现清单.html#Dawn%3An1738) | BstNode_3156082722 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 295661 + 48 bytes |
| [n1832](../Objects.level.bin对象实现清单.html#Dawn%3An1832) | BstNode_1700134914 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 306579 + 47 bytes |
| [n1834](../Objects.level.bin对象实现清单.html#Dawn%3An1834) | BstNode_3156082716 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 306657 + 39 bytes |
| [n1840](../Objects.level.bin对象实现清单.html#Dawn%3An1840) | BstNode_812 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 307106 + 36 bytes |
| [n1887](../Objects.level.bin对象实现清单.html#Dawn%3An1887) | BstNode_1842806816 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 312800 + 50 bytes |
| [n1964](../Objects.level.bin对象实现清单.html#Dawn%3An1964) | BstNode_10 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 321994 + 31 bytes |
| [n2072](../Objects.level.bin对象实现清单.html#Dawn%3An2072) | BstNode_936 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 340097 + 43 bytes |
| [n2157](../Objects.level.bin对象实现清单.html#Dawn%3An2157) | BstNode_1842806861 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 353776 + 39 bytes |
| [n464](../Objects.level.bin对象实现清单.html#DayEnd%3An464) | BstNode_207 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 112339 + 36 bytes |
| [n724](../Objects.level.bin对象实现清单.html#DayEnd%3An724) | BstNode_9 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 159451 + 45 bytes |
| [n231](../Objects.level.bin对象实现清单.html#DayHubCave%3An231) | BstNode_528 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 62067 + 42 bytes |
| [n1049](../Objects.level.bin对象实现清单.html#Dusk%3An1049) | BstNode_528 | 20%（2/10），运行待验 | 0 / 2 | Dusk · 214359 + 42 bytes |
| [n1579](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1579) | BstNode_1700134913 | 20%（2/10），运行待验 | 0 / 1 | DuskGraveyard · 390544 + 52 bytes |
| [n522](../Objects.level.bin对象实现清单.html#DuskMid%3An522) | BstNode_528 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 115861 + 39 bytes |
| [n592](../Objects.level.bin对象实现清单.html#DuskMid%3An592) | BstNode_2345992767 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 127152 + 51 bytes |
| [n926](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An926) | BstNode_528 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 227813 + 42 bytes |
| [n27](../Objects.level.bin对象实现清单.html#HubReveal%3An27) | BstNode_2504654862 | 20%（2/10），运行待验 | 0 / 3 | HubReveal · 33209 + 47 bytes |
| [n319](../Objects.level.bin对象实现清单.html#HubReveal%3An319) | BstNode_3156082789 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 83968 + 39 bytes |
| [n505](../Objects.level.bin对象实现清单.html#HubReveal%3An505) | BstNode_3156082782 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 116230 + 45 bytes |
| [n1059](../Objects.level.bin对象实现清单.html#HubReveal%3An1059) | BstNode_1253 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 206840 + 33 bytes |
| [n1286](../Objects.level.bin对象实现清单.html#HubReveal%3An1286) | BstNode_1851 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 247973 + 42 bytes |
| [n212](../Objects.level.bin对象实现清单.html#Night%3An212) | BstNode_1700134913 | 20%（2/10），运行待验 | 0 / 1 | Night · 54617 + 44 bytes |
| [n1472](../Objects.level.bin对象实现清单.html#Night%3An1472) | BstNode_1882 | 20%（2/10），运行待验 | 0 / 1 | Night · 235425 + 45 bytes |
| [n2528](../Objects.level.bin对象实现清单.html#Night%3An2528) | BstNode_2039 | 20%（2/10），运行待验 | 0 / 0 | Night · 396917 + 42 bytes |
| [n2610](../Objects.level.bin对象实现清单.html#Night%3An2610) | BstNode_2038 | 20%（2/10），运行待验 | 0 / 0 | Night · 407293 + 33 bytes |
| [n2852](../Objects.level.bin对象实现清单.html#Night%3An2852) | BstNode_528 | 20%（2/10），运行待验 | 0 / 0 | Night · 442384 + 37 bytes |
| [n25](../Objects.level.bin对象实现清单.html#NightEnd%3An25) | BstNode_34603100 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 24143 + 41 bytes |
| [n142](../Objects.level.bin对象实现清单.html#NightEnd%3An142) | BstNode_528 | 20%（2/10），运行待验 | 0 / 2 | NightEnd · 42859 + 43 bytes |
| [n239](../Objects.level.bin对象实现清单.html#NightEnd%3An239) | BstNode_2039 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 61509 + 42 bytes |
| [n108](../Objects.level.bin对象实现清单.html#NightEntrance%3An108) | BstNode_528 | 20%（2/10），运行待验 | 0 / 1 | NightEntrance · 33465 + 39 bytes |
| [n407](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An407) | BstNode_3122855940 | 20%（2/10），运行待验 | 0 / 2 | Prairie_ButterflyFields · 111770 + 50 bytes |
| [n670](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An670) | BstNode_2783838209 | 20%（2/10），运行待验 | 0 / 3 | Prairie_ButterflyFields · 160852 + 55 bytes |
| [n706](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An706) | BstNode_3122855940 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 190029 + 51 bytes |
| [n1113](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1113) | BstNode_2783838209 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Cave · 281167 + 54 bytes |
| [n1170](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1170) | BstNode_34603016 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 295057 + 49 bytes |
| [n1786](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1786) | BstNode_2783838213 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Cave · 459464 + 50 bytes |
| [n435](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An435) | BstNode_2783838211 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 120850 + 55 bytes |
| [n456](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An456) | BstNode_34603200 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 123292 + 43 bytes |
| [n874](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An874) | BstNode_2783838212 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 216465 + 52 bytes |
| [n537](../Objects.level.bin对象实现清单.html#Prairie_Village%3An537) | BstNode_2783838214 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 118078 + 50 bytes |
| [n583](../Objects.level.bin对象实现清单.html#Prairie_Village%3An583) | BstNode_2783838217 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 124383 + 54 bytes |
| [n737](../Objects.level.bin对象实现清单.html#Prairie_Village%3An737) | BstNode_2304 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 150898 + 37 bytes |
| [n1107](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1107) | BstNode_2783838219 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 212899 + 50 bytes |
| [n1735](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1735) | BstNode_1299 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 308186 + 41 bytes |
| [n1966](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1966) | BstNode_71 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Village · 350893 + 39 bytes |
| [n2424](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2424) | BstNode_43 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Village · 417759 + 39 bytes |
| [n2451](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2451) | BstNode_2026 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 421706 + 37 bytes |
| [n2565](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2565) | BstNode_2024 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 435593 + 37 bytes |
| [n3142](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3142) | BstNode_2783838213 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 533587 + 53 bytes |
| [n234](../Objects.level.bin对象实现清单.html#Rain%3An234) | BstNode_1700134976 | 20%（2/10），运行待验 | 0 / 0 | Rain · 80988 + 47 bytes |
| [n291](../Objects.level.bin对象实现清单.html#Rain%3An291) | BstNode_1700134974 | 20%（2/10），运行待验 | 0 / 2 | Rain · 93616 + 39 bytes |
| [n595](../Objects.level.bin对象实现清单.html#Rain%3An595) | BstNode_1700134975 | 20%（2/10），运行待验 | 0 / 2 | Rain · 163562 + 47 bytes |
| [n982](../Objects.level.bin对象实现清单.html#Rain%3An982) | BstNode_82 | 20%（2/10），运行待验 | 0 / 1 | Rain · 252098 + 39 bytes |
| [n749](../Objects.level.bin对象实现清单.html#RainEnd%3An749) | BstNode_1700134917 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 210004 + 51 bytes |
| [n832](../Objects.level.bin对象实现清单.html#RainEnd%3An832) | BstNode_1700134921 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 227955 + 51 bytes |
| [n1148](../Objects.level.bin对象实现清单.html#RainEnd%3An1148) | BstNode_528 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 302888 + 42 bytes |
| [n300](../Objects.level.bin对象实现清单.html#RainForest%3An300) | BstNode_1700134970 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 78887 + 47 bytes |
| [n1621](../Objects.level.bin对象实现清单.html#RainMid%3An1621) | BstNode_528 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 327056 + 41 bytes |
| [n1881](../Objects.level.bin对象实现清单.html#RainMid%3An1881) | BstNode_1700135008 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 368147 + 52 bytes |
| [n1766](../Objects.level.bin对象实现清单.html#SkyHub2%3An1766) | BstNode_1255 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 333904 + 39 bytes |
| [n1788](../Objects.level.bin对象实现清单.html#SkyHub2%3An1788) | BstNode_1167524147 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 337490 + 45 bytes |
| [n18](../Objects.level.bin对象实现清单.html#Storm%3An18) | BstNode_1034 | 20%（2/10），运行待验 | 0 / 0 | Storm · 26700 + 38 bytes |
| [n769](../Objects.level.bin对象实现清单.html#Storm%3An769) | BstNode_1219 | 20%（2/10），运行待验 | 0 / 2 | Storm · 161050 + 44 bytes |
| [n161](../Objects.level.bin对象实现清单.html#StormEnd%3An161) | BstNode_1700134913 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 49130 + 47 bytes |
| [n632](../Objects.level.bin对象实现清单.html#StormEnd%3An632) | BstNode_3156082783 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 130639 + 56 bytes |
| [n648](../Objects.level.bin对象实现清单.html#StormEnd%3An648) | BstNode_1700134914 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 133308 + 48 bytes |
| [n663](../Objects.level.bin对象实现清单.html#StormEnd%3An663) | BstNode_1700134915 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 135481 + 43 bytes |
| [n933](../Objects.level.bin对象实现清单.html#StormEnd%3An933) | BstNode_2529558564 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 178912 + 55 bytes |
| [n992](../Objects.level.bin对象实现清单.html#Sunset%3An992) | BstNode_1700134926 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 196377 + 43 bytes |
| [n996](../Objects.level.bin对象实现清单.html#Sunset%3An996) | BstNode_1049165838 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 196646 + 43 bytes |
| [n1287](../Objects.level.bin对象实现清单.html#Sunset%3An1287) | BstNode_1049165835 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 244617 + 50 bytes |
| [n99](../Objects.level.bin对象实现清单.html#SunsetEnd%3An99) | BstNode_768 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 45177 + 45 bytes |
| [n135](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An135) | BstNode_771 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 50610 + 46 bytes |
| [n1006](../Objects.level.bin对象实现清单.html#SunsetRace%3An1006) | BstNode_1700134914 | 20%（2/10），运行待验 | 0 / 2 | SunsetRace · 211663 + 43 bytes |
| [n1010](../Objects.level.bin对象实现清单.html#SunsetRace%3An1010) | BstNode_1167524126 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 212298 + 46 bytes |
| [n1300](../Objects.level.bin对象实现清单.html#SunsetRace%3An1300) | BstNode_1700134919 | 20%（2/10），运行待验 | 0 / 2 | SunsetRace · 266057 + 53 bytes |
| [n88](../Objects.level.bin对象实现清单.html#TitleWater%3An88) | BstNode_78 | 20%（2/10），运行待验 | 0 / 1 | TitleWater · 28421 + 40 bytes |
