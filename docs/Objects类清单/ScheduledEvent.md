# ScheduledEvent 单独类功能实现清单

功能分类：事件调度与逻辑条件。

此类职责：**命名计划事件与对象集合**。

类清单进度 30%（3/10），28 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：ScheduledEvent 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 命名计划事件与对象集合：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（13 条引用）、SoulTrap（8 条引用）、Marker（1 条引用）、AncestorEngine（5 条引用）、ClockTower（1 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=ScheduledEvent) · [原字段、进度与全部实例 JSON](ScheduledEvent.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n450](../Objects.level.bin对象实现清单.html#Dusk%3An450) | BstNode_2060386322 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 106433 + 45 bytes |
| [n1015](../Objects.level.bin对象实现清单.html#Dusk%3An1015) | BstNode_2060386344 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 207471 + 45 bytes |
| [n1470](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1470) | BstNode_2060386321 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 362245 + 45 bytes |
| [n1541](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1541) | BstNode_2060386320 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 380597 + 45 bytes |
| [n499](../Objects.level.bin对象实现清单.html#DuskMid%3An499) | BstNode_2060386321 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 110257 + 45 bytes |
| [n941](../Objects.level.bin对象实现清单.html#DuskMid%3An941) | BstNode_2060386320 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 201345 + 45 bytes |
| [n211](../Objects.level.bin对象实现清单.html#Prairie_Village%3An211) | BstNode_2529558565 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 64799 + 37 bytes |
| [n478](../Objects.level.bin对象实现清单.html#Prairie_Village%3An478) | BstNode_1475018779 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 110248 + 42 bytes |
| [n406](../Objects.level.bin对象实现清单.html#Rain%3An406) | BstNode_2060386415 | 20%（2/10），运行待验 | 1 / 0 | Rain · 118561 + 45 bytes |
| [n482](../Objects.level.bin对象实现清单.html#Rain%3An482) | BstNode_2060386416 | 20%（2/10），运行待验 | 1 / 0 | Rain · 137075 + 45 bytes |
| [n217](../Objects.level.bin对象实现清单.html#RainEnd%3An217) | BstNode_2060386349 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 81070 + 45 bytes |
| [n1328](../Objects.level.bin对象实现清单.html#RainEnd%3An1328) | BstNode_2060386331 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 347660 + 45 bytes |
| [n455](../Objects.level.bin对象实现清单.html#RainForest%3An455) | BstNode_2060386401 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 102799 + 45 bytes |
| [n480](../Objects.level.bin对象实现清单.html#RainForest%3An480) | BstNode_1475018810 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 109126 + 41 bytes |
| [n1142](../Objects.level.bin对象实现清单.html#RainForest%3An1142) | BstNode_2060386400 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 256063 + 45 bytes |
| [n412](../Objects.level.bin对象实现清单.html#RainMid%3An412) | BstNode_2529558614 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 103330 + 39 bytes |
| [n1885](../Objects.level.bin对象实现清单.html#RainMid%3An1885) | BstNode_2060386510 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 368407 + 45 bytes |
| [n2120](../Objects.level.bin对象实现清单.html#RainMid%3An2120) | BstNode_2060386513 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 410716 + 45 bytes |
| [n322](../Objects.level.bin对象实现清单.html#SkyHub2%3An322) | BstNode_2446917849 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 94572 + 38 bytes |
| [n1104](../Objects.level.bin对象实现清单.html#SkyHub2%3An1104) | BstNode_2446917862 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 234588 + 38 bytes |
| [n1245](../Objects.level.bin对象实现清单.html#SkyHub2%3An1245) | BstNode_1528233997 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 259033 + 43 bytes |
| [n1671](../Objects.level.bin对象实现清单.html#SkyHub2%3An1671) | BstNode_2446917860 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 320691 + 38 bytes |
| [n1697](../Objects.level.bin对象实现清单.html#SkyHub2%3An1697) | BstNode_2446917861 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 322986 + 38 bytes |
| [n1700](../Objects.level.bin对象实现清单.html#SkyHub2%3An1700) | BstNode_2446917864 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 323229 + 38 bytes |
| [n1987](../Objects.level.bin对象实现清单.html#SkyHub2%3An1987) | BstNode_2446917863 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 376393 + 38 bytes |
| [n2313](../Objects.level.bin对象实现清单.html#SkyHub2%3An2313) | BstNode_2446917633 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 435203 + 42 bytes |
| [n2387](../Objects.level.bin对象实现清单.html#SkyHub2%3An2387) | BstNode_2060386426 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 451080 + 44 bytes |
| [n2398](../Objects.level.bin对象实现清单.html#SkyHub2%3An2398) | BstNode_2060386420 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 452909 + 44 bytes |
