# LevelParameters 单独类功能实现清单

功能分类：地图加载、出生与检查点。

此类职责：**地图与烘焙生成全局参数**。

类清单进度 30%（3/10），33 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：LevelParameters 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 11 项。
- [ ] 地图与烘焙生成全局参数：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（8 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 11 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=LevelParameters) · [原字段、进度与全部实例 JSON](LevelParameters.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n409](../Objects.level.bin对象实现清单.html#CandleSpace%3An409) | BstNode_2446917634 | 20%（2/10），运行待验 | 1 / 0 | CandleSpace · 84225 + 68 bytes |
| [n394](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An394) | BstNode_2446917634 | 20%（2/10），运行待验 | 1 / 0 | CandleSpaceEnd · 91070 + 68 bytes |
| [n105](../Objects.level.bin对象实现清单.html#CarryLand%3An105) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | CarryLand · 26204 + 59 bytes |
| [n229](../Objects.level.bin对象实现清单.html#CarryLand2%3An229) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | CarryLand2 · 50433 + 59 bytes |
| [n21](../Objects.level.bin对象实现清单.html#CarryLand3%3An21) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | CarryLand3 · 8665 + 59 bytes |
| [n348](../Objects.level.bin对象实现清单.html#Dawn%3An348) | BstNode_7 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 86430 + 59 bytes |
| [n1017](../Objects.level.bin对象实现清单.html#DayEnd%3An1017) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 215109 + 59 bytes |
| [n633](../Objects.level.bin对象实现清单.html#DayHubCave%3An633) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | DayHubCave · 143421 + 59 bytes |
| [n280](../Objects.level.bin对象实现清单.html#Dusk%3An280) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 75095 + 59 bytes |
| [n456](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An456) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 130906 + 59 bytes |
| [n276](../Objects.level.bin对象实现清单.html#DuskMid%3An276) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 69649 + 59 bytes |
| [n229](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An229) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 67331 + 59 bytes |
| [n260](../Objects.level.bin对象实现清单.html#HubReveal%3An260) | BstNode_5305 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 73433 + 62 bytes |
| [n2093](../Objects.level.bin对象实现清单.html#Night%3An2093) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | Night · 332203 + 59 bytes |
| [n446](../Objects.level.bin对象实现清单.html#NightEnd%3An446) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | NightEnd · 98583 + 59 bytes |
| [n284](../Objects.level.bin对象实现清单.html#NightEntrance%3An284) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 59795 + 59 bytes |
| [n396](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An396) | BstNode_5305 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 110149 + 62 bytes |
| [n686](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An686) | BstNode_5305 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 185728 + 62 bytes |
| [n293](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An293) | BstNode_5305 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 89729 + 62 bytes |
| [n445](../Objects.level.bin对象实现清单.html#Prairie_Village%3An445) | BstNode_5305 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 103875 + 62 bytes |
| [n257](../Objects.level.bin对象实现清单.html#Rain%3An257) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | Rain · 85689 + 59 bytes |
| [n207](../Objects.level.bin对象实现清单.html#RainEnd%3An207) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 78644 + 59 bytes |
| [n283](../Objects.level.bin对象实现清单.html#RainForest%3An283) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 76024 + 59 bytes |
| [n1953](../Objects.level.bin对象实现清单.html#RainMid%3An1953) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 379580 + 59 bytes |
| [n285](../Objects.level.bin对象实现清单.html#SkyHub2%3An285) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 87233 + 59 bytes |
| [n523](../Objects.level.bin对象实现清单.html#Storm%3An523) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | Storm · 116701 + 59 bytes |
| [n273](../Objects.level.bin对象实现清单.html#StormEnd%3An273) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 69125 + 59 bytes |
| [n490](../Objects.level.bin对象实现清单.html#Sunset%3An490) | BstNode_7 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 117179 + 59 bytes |
| [n268](../Objects.level.bin对象实现清单.html#SunsetEnd%3An268) | BstNode_7 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 78766 + 59 bytes |
| [n535](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An535) | BstNode_7 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 137445 + 59 bytes |
| [n377](../Objects.level.bin对象实现清单.html#SunsetRace%3An377) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 96009 + 59 bytes |
| [n14](../Objects.level.bin对象实现清单.html#TitleWater%3An14) | BstNode_52 | 20%（2/10），运行待验 | 1 / 0 | TitleWater · 18487 + 60 bytes |
| [n0](../Objects.level.bin对象实现清单.html#WorldEmpty%3An0) | BstNode_7 | 20%（2/10），运行待验 | 0 / 0 | WorldEmpty · 375 + 54 bytes |
