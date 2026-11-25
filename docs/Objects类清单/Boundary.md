# Boundary 单独类功能实现清单

功能分类：轨道、导航与引导。

此类职责：**轨道定义的场景边界**。

类清单进度 30%（3/10），34 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Boundary 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 2 项。
- [ ] 轨道定义的场景边界：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（34 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Boundary) · [原字段、进度与全部实例 JSON](Boundary.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n391](../Objects.level.bin对象实现清单.html#CandleSpace%3An391) | BstNode_2446917884 | 20%（2/10），运行待验 | 1 / 0 | CandleSpace · 81984 + 28 bytes |
| [n454](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An454) | BstNode_2446917884 | 20%（2/10），运行待验 | 1 / 0 | CandleSpaceEnd · 99306 + 28 bytes |
| [n711](../Objects.level.bin对象实现清单.html#Dawn%3An711) | BstNode_2753888297 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 145520 + 28 bytes |
| [n1237](../Objects.level.bin对象实现清单.html#DayEnd%3An1237) | BstNode_589 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 257168 + 21 bytes |
| [n605](../Objects.level.bin对象实现清单.html#DayHubCave%3An605) | BstNode_2345992709 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 139647 + 28 bytes |
| [n1130](../Objects.level.bin对象实现清单.html#Dusk%3An1130) | BstNode_2345992293 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 231445 + 28 bytes |
| [n1543](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1543) | BstNode_2345992547 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 381156 + 28 bytes |
| [n962](../Objects.level.bin对象实现清单.html#DuskMid%3An962) | BstNode_2345992371 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 204762 + 28 bytes |
| [n1437](../Objects.level.bin对象实现清单.html#HubReveal%3An1437) | BstNode_831 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 271896 + 21 bytes |
| [n255](../Objects.level.bin对象实现清单.html#NightEntrance%3An255) | BstNode_2345992436 | 20%（2/10），运行待验 | 1 / 0 | NightEntrance · 54473 + 28 bytes |
| [n1293](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1293) | BstNode_831 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 280173 + 21 bytes |
| [n777](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An777) | BstNode_3122855960 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 204650 + 28 bytes |
| [n535](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An535) | BstNode_831 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 136284 + 21 bytes |
| [n3072](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3072) | BstNode_831 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 521858 + 21 bytes |
| [n1573](../Objects.level.bin对象实现清单.html#Rain%3An1573) | BstNode_47 | 20%（2/10），运行待验 | 1 / 0 | Rain · 378711 + 20 bytes |
| [n629](../Objects.level.bin对象实现清单.html#RainEnd%3An629) | BstNode_2345992936 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 181603 + 28 bytes |
| [n239](../Objects.level.bin对象实现清单.html#RainForest%3An239) | BstNode_47 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 69241 + 20 bytes |
| [n106](../Objects.level.bin对象实现清单.html#RainMid%3An106) | BstNode_2345992508 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 47277 + 28 bytes |
| [n25](../Objects.level.bin对象实现清单.html#SkyHub2%3An25) | BstNode_1167524071 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 36791 + 28 bytes |
| [n353](../Objects.level.bin对象实现清单.html#SkyHub2%3An353) | BstNode_1167524073 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 100466 + 28 bytes |
| [n839](../Objects.level.bin对象实现清单.html#SkyHub2%3An839) | BstNode_1167524074 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 186835 + 28 bytes |
| [n883](../Objects.level.bin对象实现清单.html#SkyHub2%3An883) | BstNode_1167523900 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 194588 + 28 bytes |
| [n1171](../Objects.level.bin对象实现清单.html#SkyHub2%3An1171) | BstNode_1167524072 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 245730 + 28 bytes |
| [n1663](../Objects.level.bin对象实现清单.html#SkyHub2%3An1663) | BstNode_1167524070 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 319440 + 28 bytes |
| [n1673](../Objects.level.bin对象实现清单.html#SkyHub2%3An1673) | BstNode_1167524080 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 320799 + 28 bytes |
| [n2365](../Objects.level.bin对象实现清单.html#SkyHub2%3An2365) | BstNode_831 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 445927 + 21 bytes |
| [n63](../Objects.level.bin对象实现清单.html#StormEnd%3An63) | BstNode_2345992674 | 20%（2/10），运行待验 | 1 / 0 | StormEnd · 32455 + 28 bytes |
| [n216](../Objects.level.bin对象实现清单.html#Sunset%3An216) | BstNode_1167523911 | 20%（2/10），运行待验 | 1 / 2 | Sunset · 67367 + 28 bytes |
| [n1689](../Objects.level.bin对象实现清单.html#Sunset%3An1689) | BstNode_173 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 311139 + 21 bytes |
| [n1771](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1771) | BstNode_173 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 332823 + 21 bytes |
| [n795](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An795) | BstNode_173 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 192238 + 21 bytes |
| [n856](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An856) | BstNode_3156082689 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 203688 + 28 bytes |
| [n1560](../Objects.level.bin对象实现清单.html#SunsetRace%3An1560) | BstNode_173 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 317877 + 21 bytes |
| [n122](../Objects.level.bin对象实现清单.html#TitleWater%3An122) | BstNode_2446917641 | 20%（2/10），运行待验 | 1 / 0 | TitleWater · 32549 + 28 bytes |
