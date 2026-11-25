# PlayAvatarAnimSeq 单独类功能实现清单

功能分类：动画、回放与装扮。

此类职责：**本地或远端玩家动画序列**。

类清单进度 30%（3/10），42 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：PlayAvatarAnimSeq 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 本地或远端玩家动画序列：42 个节点及动画包资源已清点；animpack 轨道、骨架、序列/混合、玩家状态与动作 UI 待恢复。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
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

42 个节点及动画包资源已清点；animpack 轨道、骨架、序列/混合、玩家状态与动作 UI 待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=PlayAvatarAnimSeq) · [原字段、进度与全部实例 JSON](PlayAvatarAnimSeq.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n222](../Objects.level.bin对象实现清单.html#CandleSpace%3An222) | BstNode_1406 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 53165 + 38 bytes |
| [n467](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An467) | BstNode_2529558676 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 100357 + 43 bytes |
| [n154](../Objects.level.bin对象实现清单.html#Dawn%3An154) | BstNode_2504654980 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 58389 + 51 bytes |
| [n474](../Objects.level.bin对象实现清单.html#Dawn%3An474) | BstNode_3122856150 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 105265 + 39 bytes |
| [n678](../Objects.level.bin对象实现清单.html#Dawn%3An678) | BstNode_1842806846 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 140193 + 39 bytes |
| [n795](../Objects.level.bin对象实现清单.html#Dawn%3An795) | BstNode_589 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 159403 + 37 bytes |
| [n814](../Objects.level.bin对象实现清单.html#Dawn%3An814) | BstNode_656801793 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 162040 + 36 bytes |
| [n864](../Objects.level.bin对象实现清单.html#Dawn%3An864) | BstNode_2279670014 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 170526 + 49 bytes |
| [n1027](../Objects.level.bin对象实现清单.html#Dawn%3An1027) | BstNode_1906 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 191822 + 33 bytes |
| [n1232](../Objects.level.bin对象实现清单.html#Dawn%3An1232) | BstNode_656801796 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 220300 + 38 bytes |
| [n1558](../Objects.level.bin对象实现清单.html#Dawn%3An1558) | BstNode_29 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 270841 + 37 bytes |
| [n1795](../Objects.level.bin对象实现清单.html#Dawn%3An1795) | BstNode_656801816 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 302243 + 38 bytes |
| [n2116](../Objects.level.bin对象实现清单.html#Dawn%3An2116) | BstNode_852 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 346103 + 38 bytes |
| [n2390](../Objects.level.bin对象实现清单.html#Dawn%3An2390) | BstNode_1842806809 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 397550 + 44 bytes |
| [n2565](../Objects.level.bin对象实现清单.html#Dawn%3An2565) | BstNode_513 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 428395 + 37 bytes |
| [n2588](../Objects.level.bin对象实现清单.html#Dawn%3An2588) | BstNode_2279670099 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 431978 + 46 bytes |
| [n282](../Objects.level.bin对象实现清单.html#DayEnd%3An282) | BstNode_729 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 78609 + 38 bytes |
| [n944](../Objects.level.bin对象实现清单.html#DayEnd%3An944) | BstNode_491 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 201719 + 29 bytes |
| [n1231](../Objects.level.bin对象实现清单.html#DayEnd%3An1231) | BstNode_333 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 255548 + 37 bytes |
| [n236](../Objects.level.bin对象实现清单.html#DuskMid%3An236) | BstNode_2504654913 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 62486 + 47 bytes |
| [n820](../Objects.level.bin对象实现清单.html#DuskMid%3An820) | BstNode_2504654862 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 175674 + 43 bytes |
| [n327](../Objects.level.bin对象实现清单.html#HubReveal%3An327) | BstNode_2504654860 | 20%（2/10），运行待验 | 0 / 3 | HubReveal · 85486 + 48 bytes |
| [n82](../Objects.level.bin对象实现清单.html#NightEnd%3An82) | BstNode_2504654883 | 20%（2/10），运行待验 | 0 / 3 | NightEnd · 34727 + 50 bytes |
| [n329](../Objects.level.bin对象实现清单.html#NightEnd%3An329) | BstNode_2504654857 | 20%（2/10），运行待验 | 0 / 3 | NightEnd · 75912 + 51 bytes |
| [n739](../Objects.level.bin对象实现清单.html#NightEnd%3An739) | BstNode_2504654887 | 20%（2/10），运行待验 | 0 / 3 | NightEnd · 143889 + 53 bytes |
| [n171](../Objects.level.bin对象实现清单.html#Rain%3An171) | BstNode_2044 | 20%（2/10），运行待验 | 0 / 2 | Rain · 67228 + 29 bytes |
| [n1748](../Objects.level.bin对象实现清单.html#Rain%3An1748) | BstNode_2233 | 20%（2/10），运行待验 | 0 / 2 | Rain · 419867 + 24 bytes |
| [n609](../Objects.level.bin对象实现清单.html#RainEnd%3An609) | BstNode_483 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 177241 + 38 bytes |
| [n1700](../Objects.level.bin对象实现清单.html#RainMid%3An1700) | BstNode_541 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 339581 + 26 bytes |
| [n1712](../Objects.level.bin对象实现清单.html#RainMid%3An1712) | BstNode_488 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 341607 + 24 bytes |
| [n1545](../Objects.level.bin对象实现清单.html#Storm%3An1545) | BstNode_2529558655 | 20%（2/10），运行待验 | 0 / 2 | Storm · 295622 + 31 bytes |
| [n68](../Objects.level.bin对象实现清单.html#StormEnd%3An68) | BstNode_2446917766 | 20%（2/10），运行待验 | 0 / 1 | StormEnd · 32831 + 46 bytes |
| [n574](../Objects.level.bin对象实现清单.html#StormEnd%3An574) | BstNode_2529558655 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 123111 + 31 bytes |
| [n598](../Objects.level.bin对象实现清单.html#StormEnd%3An598) | BstNode_2446917721 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 125628 + 47 bytes |
| [n626](../Objects.level.bin对象实现清单.html#StormEnd%3An626) | BstNode_3156082780 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 129585 + 34 bytes |
| [n644](../Objects.level.bin对象实现清单.html#StormEnd%3An644) | BstNode_2446917740 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 132917 + 46 bytes |
| [n658](../Objects.level.bin对象实现清单.html#StormEnd%3An658) | BstNode_2446917753 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 134103 + 48 bytes |
| [n719](../Objects.level.bin对象实现清单.html#StormEnd%3An719) | BstNode_2446917764 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 144728 + 45 bytes |
| [n881](../Objects.level.bin对象实现清单.html#SunsetEnd%3An881) | BstNode_44 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 173432 + 22 bytes |
| [n1098](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1098) | BstNode_43 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 208671 + 29 bytes |
| [n187](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An187) | BstNode_656801810 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 59356 + 44 bytes |
| [n247](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An247) | BstNode_656801807 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 73067 + 41 bytes |
