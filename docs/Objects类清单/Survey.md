# Survey 单独类功能实现清单

功能分类：教程、平台门控与统计。

此类职责：**问卷入口**。

类清单进度 30%（3/10），34 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Survey 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 问卷入口：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Survey) · [原字段、进度与全部实例 JSON](Survey.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n564](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An564) | BstNode_2529558530 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 113959 + 56 bytes |
| [n1133](../Objects.level.bin对象实现清单.html#Dawn%3An1133) | BstNode_2060386306 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 204861 + 38 bytes |
| [n2934](../Objects.level.bin对象实现清单.html#Dawn%3An2934) | BstNode_2060386305 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 480537 + 40 bytes |
| [n223](../Objects.level.bin对象实现清单.html#DayEnd%3An223) | BstNode_34603027 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 67991 + 45 bytes |
| [n741](../Objects.level.bin对象实现清单.html#DayEnd%3An741) | BstNode_2060386305 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 162042 + 42 bytes |
| [n1091](../Objects.level.bin对象实现清单.html#DayEnd%3An1091) | BstNode_2060386310 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 227714 + 40 bytes |
| [n683](../Objects.level.bin对象实现清单.html#DayHubCave%3An683) | BstNode_2060386307 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 151688 + 35 bytes |
| [n18](../Objects.level.bin对象实现清单.html#Dusk%3An18) | BstNode_2060386407 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 27007 + 54 bytes |
| [n87](../Objects.level.bin对象实现清单.html#Dusk%3An87) | BstNode_2060386408 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 38511 + 52 bytes |
| [n353](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An353) | BstNode_2060386392 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 108992 + 49 bytes |
| [n410](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An410) | BstNode_2060386403 | 20%（2/10），运行待验 | 0 / 1 | DuskGraveyard · 121521 + 47 bytes |
| [n209](../Objects.level.bin对象实现清单.html#DuskMid%3An209) | BstNode_34603010 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 57853 + 41 bytes |
| [n2127](../Objects.level.bin对象实现清单.html#Night%3An2127) | BstNode_34604505 | 20%（2/10），运行待验 | 0 / 1 | Night · 337423 + 38 bytes |
| [n197](../Objects.level.bin对象实现清单.html#NightEnd%3An197) | BstNode_2060386305 | 20%（2/10），运行待验 | 0 / 0 | NightEnd · 54735 + 33 bytes |
| [n461](../Objects.level.bin对象实现清单.html#NightEntrance%3An461) | BstNode_2060386306 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 85575 + 38 bytes |
| [n837](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An837) | BstNode_2060386312 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 186361 + 49 bytes |
| [n1016](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1016) | BstNode_2060386339 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 258747 + 38 bytes |
| [n953](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An953) | BstNode_2060386305 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 231954 + 47 bytes |
| [n485](../Objects.level.bin对象实现清单.html#Rain%3An485) | BstNode_2060386378 | 20%（2/10），运行待验 | 0 / 1 | Rain · 137222 + 38 bytes |
| [n1033](../Objects.level.bin对象实现清单.html#Rain%3An1033) | BstNode_2060386371 | 20%（2/10），运行待验 | 0 / 1 | Rain · 260770 + 40 bytes |
| [n100](../Objects.level.bin对象实现清单.html#RainEnd%3An100) | BstNode_34603012 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 52489 + 40 bytes |
| [n1592](../Objects.level.bin对象实现清单.html#RainEnd%3An1592) | BstNode_2060386398 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 401785 + 41 bytes |
| [n672](../Objects.level.bin对象实现清单.html#RainForest%3An672) | BstNode_2060386419 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 154399 + 46 bytes |
| [n1137](../Objects.level.bin对象实现清单.html#RainForest%3An1137) | BstNode_2060386424 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 255742 + 44 bytes |
| [n1990](../Objects.level.bin对象实现清单.html#RainMid%3An1990) | BstNode_2060386388 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 384623 + 41 bytes |
| [n2000](../Objects.level.bin对象实现清单.html#RainMid%3An2000) | BstNode_34603132 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 386539 + 40 bytes |
| [n1640](../Objects.level.bin对象实现清单.html#SkyHub2%3An1640) | BstNode_2060386339 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 315612 + 44 bytes |
| [n119](../Objects.level.bin对象实现清单.html#Storm%3An119) | BstNode_2060386306 | 20%（2/10），运行待验 | 0 / 0 | Storm · 43930 + 41 bytes |
| [n121](../Objects.level.bin对象实现清单.html#Storm%3An121) | BstNode_2060386307 | 20%（2/10），运行待验 | 0 / 1 | Storm · 44355 + 39 bytes |
| [n525](../Objects.level.bin对象实现清单.html#Sunset%3An525) | BstNode_34603012 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 122263 + 49 bytes |
| [n1501](../Objects.level.bin对象实现清单.html#Sunset%3An1501) | BstNode_2060386307 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 279024 + 40 bytes |
| [n195](../Objects.level.bin对象实现清单.html#SunsetEnd%3An195) | BstNode_2060386305 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 62523 + 43 bytes |
| [n834](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An834) | BstNode_2060386305 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 200385 + 46 bytes |
| [n815](../Objects.level.bin对象实现清单.html#SunsetRace%3An815) | BstNode_2060386306 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 183274 + 46 bytes |
