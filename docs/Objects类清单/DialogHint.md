# DialogHint 单独类功能实现清单

功能分类：按钮、文字与菜单。

此类职责：**区域提示、文本、优先级与串联**。

类清单进度 30%（3/10），102 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：DialogHint 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 8 项。
- [ ] 区域提示、文本、优先级与串联：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（113 条引用）、DialogHint（34 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=DialogHint) · [原字段、进度与全部实例 JSON](DialogHint.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n166](../Objects.level.bin对象实现清单.html#CandleSpace%3An166) | BstNode_3156082703 | 20%（2/10），运行待验 | 2 / 2 | CandleSpace · 45414 + 47 bytes |
| [n183](../Objects.level.bin对象实现清单.html#CandleSpace%3An183) | BstNode_3156082719 | 20%（2/10），运行待验 | 1 / 1 | CandleSpace · 48789 + 62 bytes |
| [n340](../Objects.level.bin对象实现清单.html#CandleSpace%3An340) | BstNode_2446917806 | 20%（2/10），运行待验 | 2 / 0 | CandleSpace · 73986 + 64 bytes |
| [n357](../Objects.level.bin对象实现清单.html#CandleSpace%3An357) | BstNode_2529558603 | 20%（2/10），运行待验 | 1 / 2 | CandleSpace · 75884 + 65 bytes |
| [n417](../Objects.level.bin对象实现清单.html#CandleSpace%3An417) | BstNode_2446917760 | 20%（2/10），运行待验 | 2 / 2 | CandleSpace · 85679 + 65 bytes |
| [n434](../Objects.level.bin对象实现清单.html#CandleSpace%3An434) | BstNode_2446917728 | 20%（2/10），运行待验 | 3 / 1 | CandleSpace · 87351 + 64 bytes |
| [n44](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An44) | BstNode_2446917770 | 20%（2/10），运行待验 | 2 / 3 | CandleSpaceEnd · 23290 + 61 bytes |
| [n246](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An246) | BstNode_3156082695 | 20%（2/10），运行待验 | 3 / 0 | CandleSpaceEnd · 62830 + 61 bytes |
| [n621](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An621) | BstNode_2446917771 | 20%（2/10），运行待验 | 1 / 3 | CandleSpaceEnd · 120761 + 47 bytes |
| [n135](../Objects.level.bin对象实现清单.html#Dawn%3An135) | BstNode_2446917914 | 20%（2/10），运行待验 | 2 / 4 | Dawn · 55975 + 59 bytes |
| [n153](../Objects.level.bin对象实现清单.html#Dawn%3An153) | BstNode_1528233993 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 58325 + 64 bytes |
| [n351](../Objects.level.bin对象实现清单.html#Dawn%3An351) | BstNode_3156082700 | 20%（2/10），运行待验 | 2 / 3 | Dawn · 87222 + 64 bytes |
| [n378](../Objects.level.bin对象实现清单.html#Dawn%3An378) | BstNode_2446917664 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 89821 + 64 bytes |
| [n400](../Objects.level.bin对象实现清单.html#Dawn%3An400) | BstNode_2446917696 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 93767 + 47 bytes |
| [n403](../Objects.level.bin对象实现清单.html#Dawn%3An403) | BstNode_2645622809 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 93951 + 64 bytes |
| [n424](../Objects.level.bin对象实现清单.html#Dawn%3An424) | BstNode_2645622812 | 20%（2/10），运行待验 | 3 / 1 | Dawn · 97199 + 67 bytes |
| [n536](../Objects.level.bin对象实现清单.html#Dawn%3An536) | BstNode_2446917913 | 20%（2/10），运行待验 | 2 / 3 | Dawn · 116510 + 59 bytes |
| [n752](../Objects.level.bin对象实现清单.html#Dawn%3An752) | BstNode_2446917663 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 152867 + 63 bytes |
| [n950](../Objects.level.bin对象实现清单.html#Dawn%3An950) | BstNode_2446917916 | 20%（2/10），运行待验 | 2 / 4 | Dawn · 180278 + 59 bytes |
| [n1141](../Objects.level.bin对象实现清单.html#Dawn%3An1141) | BstNode_2446917918 | 20%（2/10），运行待验 | 1 / 4 | Dawn · 205440 + 47 bytes |
| [n1410](../Objects.level.bin对象实现清单.html#Dawn%3An1410) | BstNode_3122856697 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 247372 + 47 bytes |
| [n1446](../Objects.level.bin对象实现清单.html#Dawn%3An1446) | BstNode_3156082705 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 255138 + 65 bytes |
| [n1463](../Objects.level.bin对象实现清单.html#Dawn%3An1463) | BstNode_362938369 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 257671 + 66 bytes |
| [n1478](../Objects.level.bin对象实现清单.html#Dawn%3An1478) | BstNode_3156082753 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 260211 + 65 bytes |
| [n1649](../Objects.level.bin对象实现清单.html#Dawn%3An1649) | BstNode_3156082762 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 282200 + 47 bytes |
| [n1719](../Objects.level.bin对象实现清单.html#Dawn%3An1719) | BstNode_2446917726 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 292027 + 67 bytes |
| [n1741](../Objects.level.bin对象实现清单.html#Dawn%3An1741) | BstNode_2446917667 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 296250 + 70 bytes |
| [n1814](../Objects.level.bin对象实现清单.html#Dawn%3An1814) | BstNode_3156082697 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 304110 + 47 bytes |
| [n1861](../Objects.level.bin对象实现清单.html#Dawn%3An1861) | BstNode_2446917915 | 20%（2/10），运行待验 | 2 / 4 | Dawn · 309624 + 59 bytes |
| [n2572](../Objects.level.bin对象实现清单.html#Dawn%3An2572) | BstNode_3122856252 | 20%（2/10），运行待验 | 3 / 0 | Dawn · 429501 + 64 bytes |
| [n2576](../Objects.level.bin对象实现清单.html#Dawn%3An2576) | BstNode_2446917917 | 20%（2/10），运行待验 | 2 / 4 | Dawn · 429884 + 59 bytes |
| [n2618](../Objects.level.bin对象实现清单.html#Dawn%3An2618) | BstNode_2645622811 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 435891 + 47 bytes |
| [n475](../Objects.level.bin对象实现清单.html#DayHubCave%3An475) | BstNode_2446917656 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 112618 + 64 bytes |
| [n2](../Objects.level.bin对象实现清单.html#HubReveal%3An2) | BstNode_2645622791 | 20%（2/10），运行待验 | 2 / 2 | HubReveal · 29918 + 63 bytes |
| [n4](../Objects.level.bin对象实现清单.html#HubReveal%3An4) | BstNode_2529558689 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 30365 + 63 bytes |
| [n395](../Objects.level.bin对象实现清单.html#HubReveal%3An395) | BstNode_2645622793 | 20%（2/10），运行待验 | 2 / 2 | HubReveal · 97513 + 63 bytes |
| [n476](../Objects.level.bin对象实现清单.html#HubReveal%3An476) | BstNode_2446917666 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 110949 + 65 bytes |
| [n486](../Objects.level.bin对象实现清单.html#HubReveal%3An486) | BstNode_2645622787 | 20%（2/10），运行待验 | 2 / 2 | HubReveal · 112547 + 47 bytes |
| [n561](../Objects.level.bin对象实现清单.html#HubReveal%3An561) | BstNode_2446917776 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 126091 + 65 bytes |
| [n742](../Objects.level.bin对象实现清单.html#HubReveal%3An742) | BstNode_2645622786 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 153708 + 63 bytes |
| [n1146](../Objects.level.bin对象实现清单.html#HubReveal%3An1146) | BstNode_2446917656 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 223362 + 65 bytes |
| [n1204](../Objects.level.bin对象实现清单.html#HubReveal%3An1204) | BstNode_2645622811 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 235121 + 47 bytes |
| [n1323](../Objects.level.bin对象实现清单.html#HubReveal%3An1323) | BstNode_2446917672 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 254055 + 65 bytes |
| [n1386](../Objects.level.bin对象实现清单.html#HubReveal%3An1386) | BstNode_2446917691 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 262563 + 63 bytes |
| [n1480](../Objects.level.bin对象实现清单.html#HubReveal%3An1480) | BstNode_2645622785 | 20%（2/10），运行待验 | 2 / 2 | HubReveal · 278179 + 63 bytes |
| [n1502](../Objects.level.bin对象实现清单.html#HubReveal%3An1502) | BstNode_2446917693 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 280541 + 63 bytes |
| [n342](../Objects.level.bin对象实现清单.html#NightEnd%3An342) | BstNode_34603084 | 20%（2/10），运行待验 | 1 / 2 | NightEnd · 76846 + 64 bytes |
| [n420](../Objects.level.bin对象实现清单.html#NightEnd%3An420) | BstNode_34603074 | 20%（2/10），运行待验 | 1 / 2 | NightEnd · 93914 + 83 bytes |
| [n423](../Objects.level.bin对象实现清单.html#NightEnd%3An423) | BstNode_34603106 | 20%（2/10），运行待验 | 1 / 2 | NightEnd · 94121 + 64 bytes |
| [n494](../Objects.level.bin对象实现清单.html#NightEnd%3An494) | BstNode_1167524370 | 20%（2/10），运行待验 | 1 / 1 | NightEnd · 105891 + 62 bytes |
| [n50](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An50) | BstNode_1528234004 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 35136 + 64 bytes |
| [n117](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An117) | BstNode_34603009 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 49383 + 58 bytes |
| [n1350](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1350) | BstNode_2446917707 | 20%（2/10），运行待验 | 1 / 3 | Prairie_ButterflyFields · 290221 + 64 bytes |
| [n888](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An888) | BstNode_34603010 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Cave · 230377 + 62 bytes |
| [n912](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An912) | BstNode_34603020 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Cave · 235610 + 62 bytes |
| [n1011](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1011) | BstNode_2446917756 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 257662 + 68 bytes |
| [n242](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An242) | BstNode_34603231 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 77302 + 62 bytes |
| [n628](../Objects.level.bin对象实现清单.html#Prairie_Village%3An628) | BstNode_2446917756 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 131825 + 68 bytes |
| [n1157](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1157) | BstNode_2446917758 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 219130 + 68 bytes |
| [n1905](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1905) | BstNode_2446917754 | 20%（2/10），运行待验 | 1 / 17 | Prairie_Village · 340417 + 64 bytes |
| [n2820](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2820) | BstNode_2446917759 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 479022 + 68 bytes |
| [n228](../Objects.level.bin对象实现清单.html#Rain%3An228) | BstNode_2345992926 | 20%（2/10），运行待验 | 1 / 4 | Rain · 79585 + 63 bytes |
| [n1341](../Objects.level.bin对象实现清单.html#Rain%3An1341) | BstNode_2345992935 | 20%（2/10），运行待验 | 1 / 4 | Rain · 326984 + 63 bytes |
| [n225](../Objects.level.bin对象实现清单.html#RainForest%3An225) | BstNode_2345992950 | 20%（2/10），运行待验 | 1 / 4 | RainForest · 66278 + 68 bytes |
| [n1000](../Objects.level.bin对象实现清单.html#RainForest%3An1000) | BstNode_2345993031 | 20%（2/10），运行待验 | 1 / 4 | RainForest · 230746 + 63 bytes |
| [n83](../Objects.level.bin对象实现清单.html#SkyHub2%3An83) | BstNode_2529558606 | 20%（2/10），运行待验 | 2 / 3 | SkyHub2 · 48205 + 47 bytes |
| [n120](../Objects.level.bin对象实现清单.html#SkyHub2%3An120) | BstNode_1167523987 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 54668 + 62 bytes |
| [n136](../Objects.level.bin对象实现清单.html#SkyHub2%3An136) | BstNode_2446917773 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 58166 + 62 bytes |
| [n332](../Objects.level.bin对象实现清单.html#SkyHub2%3An332) | BstNode_2446917782 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 96529 + 61 bytes |
| [n491](../Objects.level.bin对象实现清单.html#SkyHub2%3An491) | BstNode_1167524143 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 125402 + 103 bytes |
| [n715](../Objects.level.bin对象实现清单.html#SkyHub2%3An715) | BstNode_2529558708 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 164855 + 65 bytes |
| [n790](../Objects.level.bin对象实现清单.html#SkyHub2%3An790) | BstNode_2446917765 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 178490 + 60 bytes |
| [n845](../Objects.level.bin对象实现清单.html#SkyHub2%3An845) | BstNode_2529558676 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 187791 + 65 bytes |
| [n928](../Objects.level.bin对象实现清单.html#SkyHub2%3An928) | BstNode_1167524140 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 202368 + 103 bytes |
| [n940](../Objects.level.bin对象实现清单.html#SkyHub2%3An940) | BstNode_2446917780 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 204598 + 61 bytes |
| [n1240](../Objects.level.bin对象实现清单.html#SkyHub2%3An1240) | BstNode_2529558581 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 258014 + 63 bytes |
| [n1271](../Objects.level.bin对象实现清单.html#SkyHub2%3An1271) | BstNode_1167524460 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 262242 + 63 bytes |
| [n1354](../Objects.level.bin对象实现清单.html#SkyHub2%3An1354) | BstNode_2529558536 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 272427 + 63 bytes |
| [n1383](../Objects.level.bin对象实现清单.html#SkyHub2%3An1383) | BstNode_1167524449 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 275170 + 63 bytes |
| [n1397](../Objects.level.bin对象实现清单.html#SkyHub2%3An1397) | BstNode_2645622811 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 277097 + 47 bytes |
| [n1421](../Objects.level.bin对象实现清单.html#SkyHub2%3An1421) | BstNode_1167524209 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 280228 + 63 bytes |
| [n1491](../Objects.level.bin对象实现清单.html#SkyHub2%3An1491) | BstNode_1167523874 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 289008 + 62 bytes |
| [n1574](../Objects.level.bin对象实现清单.html#SkyHub2%3An1574) | BstNode_1167523852 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 303571 + 62 bytes |
| [n1588](../Objects.level.bin对象实现清单.html#SkyHub2%3An1588) | BstNode_2446917876 | 20%（2/10），运行待验 | 1 / 4 | SkyHub2 · 307250 + 62 bytes |
| [n1599](../Objects.level.bin对象实现清单.html#SkyHub2%3An1599) | BstNode_1167523965 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 308739 + 62 bytes |
| [n1614](../Objects.level.bin对象实现清单.html#SkyHub2%3An1614) | BstNode_2446917771 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 310675 + 60 bytes |
| [n1655](../Objects.level.bin对象实现清单.html#SkyHub2%3An1655) | BstNode_1167524085 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 317499 + 63 bytes |
| [n1658](../Objects.level.bin对象实现清单.html#SkyHub2%3An1658) | BstNode_1167523984 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 318057 + 62 bytes |
| [n1678](../Objects.level.bin对象实现清单.html#SkyHub2%3An1678) | BstNode_2446917775 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 321457 + 60 bytes |
| [n1694](../Objects.level.bin对象实现清单.html#SkyHub2%3An1694) | BstNode_2529558645 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 322760 + 47 bytes |
| [n1844](../Objects.level.bin对象实现清单.html#SkyHub2%3An1844) | BstNode_34603011 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 347976 + 61 bytes |
| [n1954](../Objects.level.bin对象实现清单.html#SkyHub2%3An1954) | BstNode_2446917769 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 371348 + 59 bytes |
| [n1971](../Objects.level.bin对象实现清单.html#SkyHub2%3An1971) | BstNode_2529558719 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 373842 + 68 bytes |
| [n2223](../Objects.level.bin对象实现清单.html#SkyHub2%3An2223) | BstNode_1167523983 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 419968 + 62 bytes |
| [n2382](../Objects.level.bin对象实现清单.html#SkyHub2%3An2382) | BstNode_1167524144 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 449039 + 105 bytes |
| [n2444](../Objects.level.bin对象实现清单.html#SkyHub2%3An2444) | BstNode_2529558722 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 463229 + 65 bytes |
| [n482](../Objects.level.bin对象实现清单.html#Storm%3An482) | BstNode_34603106 | 20%（2/10），运行待验 | 1 / 1 | Storm · 109416 + 64 bytes |
| [n953](../Objects.level.bin对象实现清单.html#Storm%3An953) | BstNode_34603084 | 20%（2/10），运行待验 | 1 / 1 | Storm · 192088 + 64 bytes |
| [n957](../Objects.level.bin对象实现清单.html#Storm%3An957) | BstNode_34603074 | 20%（2/10），运行待验 | 1 / 1 | Storm · 192868 + 83 bytes |
| [n770](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An770) | BstNode_1049165929 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 188169 + 62 bytes |
| [n15](../Objects.level.bin对象实现清单.html#TitleWater%3An15) | BstNode_3156082690 | 20%（2/10），运行待验 | 2 / 1 | TitleWater · 18547 + 62 bytes |
| [n59](../Objects.level.bin对象实现清单.html#TitleWater%3An59) | BstNode_1528234053 | 20%（2/10），运行待验 | 1 / 2 | TitleWater · 24692 + 47 bytes |
