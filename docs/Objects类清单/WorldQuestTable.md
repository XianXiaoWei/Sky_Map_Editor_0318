# WorldQuestTable 单独类功能实现清单

功能分类：任务、先祖与场景机制。

此类职责：**任务桌、菜单与地图连接**。

类清单进度 30%（3/10），23 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：WorldQuestTable 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 9 项。
- [ ] 任务桌、菜单与地图连接：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（19 条引用）、Marker（19 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=WorldQuestTable) · [原字段、进度与全部实例 JSON](WorldQuestTable.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n54](../Objects.level.bin对象实现清单.html#Dawn%3An54) | BstNode_2446917745 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 43360 + 107 bytes |
| [n260](../Objects.level.bin对象实现清单.html#DayEnd%3An260) | BstNode_2446917732 | 20%（2/10），运行待验 | 2 / 0 | DayEnd · 75118 + 107 bytes |
| [n658](../Objects.level.bin对象实现清单.html#Dusk%3An658) | BstNode_2446917646 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 142447 + 91 bytes |
| [n1689](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1689) | BstNode_2446917633 | 20%（2/10），运行待验 | 2 / 0 | DuskGraveyard · 417555 + 100 bytes |
| [n382](../Objects.level.bin对象实现清单.html#DuskMid%3An382) | BstNode_2446917641 | 20%（2/10），运行待验 | 2 / 0 | DuskMid · 87934 + 105 bytes |
| [n393](../Objects.level.bin对象实现清单.html#HubReveal%3An393) | BstNode_2446917790 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 97015 + 107 bytes |
| [n2260](../Objects.level.bin对象实现清单.html#Night%3An2260) | BstNode_2446917655 | 20%（2/10），运行待验 | 2 / 2 | Night · 356605 + 100 bytes |
| [n439](../Objects.level.bin对象实现清单.html#NightEnd%3An439) | BstNode_2446917643 | 20%（2/10），运行待验 | 2 / 0 | NightEnd · 97223 + 105 bytes |
| [n524](../Objects.level.bin对象实现清单.html#NightEntrance%3An524) | BstNode_2446917719 | 20%（2/10），运行待验 | 1 / 0 | NightEntrance · 94961 + 91 bytes |
| [n893](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An893) | BstNode_2060386349 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 194699 + 107 bytes |
| [n603](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An603) | BstNode_2753888278 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 163934 + 107 bytes |
| [n336](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An336) | BstNode_1475018753 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 98689 + 107 bytes |
| [n866](../Objects.level.bin对象实现清单.html#Prairie_Village%3An866) | BstNode_2446917666 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 172492 + 107 bytes |
| [n671](../Objects.level.bin对象实现清单.html#Rain%3An671) | BstNode_2446917706 | 20%（2/10），运行待验 | 2 / 0 | Rain · 181241 + 100 bytes |
| [n957](../Objects.level.bin对象实现清单.html#RainEnd%3An957) | BstNode_2446917725 | 20%（2/10），运行待验 | 2 / 0 | RainEnd · 255269 + 107 bytes |
| [n343](../Objects.level.bin对象实现清单.html#RainForest%3An343) | BstNode_2446917689 | 20%（2/10），运行待验 | 2 / 0 | RainForest · 85617 + 104 bytes |
| [n204](../Objects.level.bin对象实现清单.html#RainMid%3An204) | BstNode_2446917719 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 67011 + 100 bytes |
| [n1892](../Objects.level.bin对象实现清单.html#SkyHub2%3An1892) | BstNode_2446917939 | 20%（2/10），运行待验 | 2 / 4 | SkyHub2 · 357420 + 107 bytes |
| [n106](../Objects.level.bin对象实现清单.html#Storm%3An106) | BstNode_2446917706 | 20%（2/10），运行待验 | 2 / 0 | Storm · 42002 + 100 bytes |
| [n318](../Objects.level.bin对象实现清单.html#Sunset%3An318) | BstNode_2446917719 | 20%（2/10），运行待验 | 2 / 0 | Sunset · 88701 + 107 bytes |
| [n372](../Objects.level.bin对象实现清单.html#SunsetEnd%3An372) | BstNode_2446917719 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 92479 + 107 bytes |
| [n541](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An541) | BstNode_2446917648 | 20%（2/10），运行待验 | 2 / 0 | SunsetEnd2 · 139337 + 107 bytes |
| [n976](../Objects.level.bin对象实现清单.html#SunsetRace%3An976) | BstNode_2446917638 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 207058 + 107 bytes |
