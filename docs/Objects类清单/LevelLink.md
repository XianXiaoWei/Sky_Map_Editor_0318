# LevelLink 单独类功能实现清单

功能分类：地图加载、出生与检查点。

此类职责：**地图连接、锚点与加载事件**。

类清单进度 30%（3/10），64 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：LevelLink 的原默认值、继承初始化及 12 个序列化字段变体；原注册字段 12 项。
- [ ] 地图连接、锚点与加载事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（71 条引用）、Beamo（5 条引用）、Clump（15 条引用）、LevelMesh（5 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=LevelLink) · [原字段、进度与全部实例 JSON](LevelLink.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n760](../Objects.level.bin对象实现清单.html#Dawn%3An760) | BstNode_1293287440 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 153953 + 129 bytes |
| [n1411](../Objects.level.bin对象实现清单.html#Dawn%3An1411) | BstNode_3122856912 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 247419 + 153 bytes |
| [n2355](../Objects.level.bin对象实现清单.html#Dawn%3An2355) | BstNode_34603079 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 391003 + 151 bytes |
| [n72](../Objects.level.bin对象实现清单.html#DayEnd%3An72) | BstNode_2446917671 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 36923 + 135 bytes |
| [n106](../Objects.level.bin对象实现清单.html#DayEnd%3An106) | BstNode_34603009 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 44708 + 146 bytes |
| [n39](../Objects.level.bin对象实现清单.html#DayHubCave%3An39) | BstNode_2345992578 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 29171 + 145 bytes |
| [n459](../Objects.level.bin对象实现清单.html#DayHubCave%3An459) | BstNode_2345992574 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 109435 + 145 bytes |
| [n239](../Objects.level.bin对象实现清单.html#Dusk%3An239) | BstNode_1167523847 | 20%（2/10），运行待验 | 2 / 0 | Dusk · 67770 + 134 bytes |
| [n413](../Objects.level.bin对象实现清单.html#Dusk%3An413) | BstNode_930 | 20%（2/10），运行待验 | 3 / 2 | Dusk · 98925 + 141 bytes |
| [n1052](../Objects.level.bin对象实现清单.html#Dusk%3An1052) | BstNode_2279669895 | 20%（2/10），运行待验 | 2 / 0 | Dusk · 214598 + 136 bytes |
| [n584](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An584) | BstNode_929 | 20%（2/10），运行待验 | 2 / 0 | DuskGraveyard · 158961 + 133 bytes |
| [n1610](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1610) | BstNode_2345992196 | 20%（2/10），运行待验 | 2 / 0 | DuskGraveyard · 398780 + 136 bytes |
| [n337](../Objects.level.bin对象实现清单.html#DuskMid%3An337) | BstNode_929 | 20%（2/10），运行待验 | 3 / 0 | DuskMid · 80422 + 134 bytes |
| [n90](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An90) | BstNode_2529559391 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 34322 + 148 bytes |
| [n203](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An203) | BstNode_2529558986 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 61461 + 153 bytes |
| [n206](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An206) | BstNode_2529558985 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 61868 + 136 bytes |
| [n350](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An350) | BstNode_2529558995 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 92741 + 149 bytes |
| [n983](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An983) | BstNode_2529558990 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 240237 + 134 bytes |
| [n206](../Objects.level.bin对象实现清单.html#HubReveal%3An206) | BstNode_876 | 20%（2/10），运行待验 | 3 / 0 | HubReveal · 64894 + 130 bytes |
| [n342](../Objects.level.bin对象实现清单.html#HubReveal%3An342) | BstNode_875 | 20%（2/10），运行待验 | 3 / 0 | HubReveal · 87922 + 130 bytes |
| [n535](../Objects.level.bin对象实现清单.html#HubReveal%3An535) | BstNode_73 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 122008 + 135 bytes |
| [n805](../Objects.level.bin对象实现清单.html#HubReveal%3An805) | BstNode_707 | 20%（2/10），运行待验 | 3 / 0 | HubReveal · 163329 + 130 bytes |
| [n1091](../Objects.level.bin对象实现清单.html#HubReveal%3An1091) | BstNode_897 | 20%（2/10），运行待验 | 3 / 0 | HubReveal · 212519 + 130 bytes |
| [n1299](../Objects.level.bin对象实现清单.html#HubReveal%3An1299) | BstNode_2446917654 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 249537 + 148 bytes |
| [n719](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An719) | BstNode_1842806936 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 169296 + 151 bytes |
| [n736](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An736) | BstNode_362938398 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 172310 + 156 bytes |
| [n783](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An783) | BstNode_1167523880 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 178002 + 148 bytes |
| [n1120](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1120) | BstNode_2529558842 | 20%（2/10），运行待验 | 0 / 2 | Prairie_ButterflyFields · 243100 + 148 bytes |
| [n1232](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1232) | BstNode_1842806934 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 266947 + 169 bytes |
| [n866](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An866) | BstNode_1842806852 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 225403 + 146 bytes |
| [n1686](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1686) | BstNode_1842806936 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 430049 + 162 bytes |
| [n374](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An374) | BstNode_34603609 | 20%（2/10），运行待验 | 2 / 0 | Prairie_NestAndKeeper · 107260 + 144 bytes |
| [n552](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An552) | BstNode_34603615 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 139160 + 169 bytes |
| [n1178](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1178) | BstNode_34603009 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 221688 + 137 bytes |
| [n1551](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1551) | BstNode_362938369 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 278376 + 164 bytes |
| [n1609](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1609) | BstNode_2529558530 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 288887 + 152 bytes |
| [n1682](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1682) | BstNode_1167524192 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 298281 + 143 bytes |
| [n1805](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1805) | BstNode_2345992221 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 321433 + 140 bytes |
| [n285](../Objects.level.bin对象实现清单.html#Rain%3An285) | BstNode_2345992299 | 20%（2/10），运行待验 | 2 / 0 | Rain · 91805 + 142 bytes |
| [n527](../Objects.level.bin对象实现清单.html#Rain%3An527) | BstNode_1167523920 | 20%（2/10），运行待验 | 2 / 0 | Rain · 147198 + 134 bytes |
| [n1344](../Objects.level.bin对象实现清单.html#Rain%3An1344) | BstNode_2446917671 | 20%（2/10），运行待验 | 2 / 1 | Rain · 327509 + 137 bytes |
| [n784](../Objects.level.bin对象实现清单.html#RainEnd%3An784) | BstNode_2446917645 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 216906 + 139 bytes |
| [n317](../Objects.level.bin对象实现清单.html#RainForest%3An317) | BstNode_2345992299 | 20%（2/10），运行待验 | 3 / 0 | RainForest · 81155 + 136 bytes |
| [n616](../Objects.level.bin对象实现清单.html#RainForest%3An616) | BstNode_2345992428 | 20%（2/10），运行待验 | 2 / 0 | RainForest · 141902 + 140 bytes |
| [n1261](../Objects.level.bin对象实现清单.html#RainMid%3An1261) | BstNode_2345992475 | 20%（2/10），运行待验 | 3 / 0 | RainMid · 256961 + 143 bytes |
| [n209](../Objects.level.bin对象实现清单.html#SkyHub2%3An209) | BstNode_34603020 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 71384 + 162 bytes |
| [n463](../Objects.level.bin对象实现清单.html#SkyHub2%3An463) | BstNode_2446917877 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 121978 + 123 bytes |
| [n510](../Objects.level.bin对象实现清单.html#SkyHub2%3An510) | BstNode_1167523868 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 129221 + 131 bytes |
| [n677](../Objects.level.bin对象实现清单.html#SkyHub2%3An677) | BstNode_2446917878 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 157364 + 123 bytes |
| [n807](../Objects.level.bin对象实现清单.html#SkyHub2%3An807) | BstNode_73 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 182006 + 137 bytes |
| [n1681](../Objects.level.bin对象实现清单.html#SkyHub2%3An1681) | BstNode_1167523867 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 321666 + 135 bytes |
| [n2350](../Objects.level.bin对象实现清单.html#SkyHub2%3An2350) | BstNode_1167523854 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 443191 + 131 bytes |
| [n299](../Objects.level.bin对象实现清单.html#Storm%3An299) | BstNode_2446917857 | 20%（2/10），运行待验 | 1 / 0 | Storm · 75462 + 137 bytes |
| [n489](../Objects.level.bin对象实现清单.html#StormEnd%3An489) | BstNode_2529559326 | 20%（2/10），运行待验 | 1 / 0 | StormEnd · 110908 + 138 bytes |
| [n79](../Objects.level.bin对象实现清单.html#Sunset%3An79) | BstNode_2446917634 | 20%（2/10），运行待验 | 2 / 0 | Sunset · 40851 + 140 bytes |
| [n1644](../Objects.level.bin对象实现清单.html#Sunset%3An1644) | BstNode_1167523848 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 302916 + 146 bytes |
| [n1669](../Objects.level.bin对象实现清单.html#Sunset%3An1669) | BstNode_1167523858 | 20%（2/10），运行待验 | 2 / 0 | Sunset · 306987 + 136 bytes |
| [n806](../Objects.level.bin对象实现清单.html#SunsetEnd%3An806) | BstNode_2279669906 | 20%（2/10），运行待验 | 3 / 1 | SunsetEnd · 160315 + 149 bytes |
| [n1677](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1677) | BstNode_1167523853 | 20%（2/10），运行待验 | 3 / 0 | SunsetEnd · 313384 + 149 bytes |
| [n558](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An558) | BstNode_1049165933 | 20%（2/10），运行待验 | 1 / 3 | SunsetEnd2 · 142322 + 138 bytes |
| [n661](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An661) | BstNode_1167523908 | 20%（2/10），运行待验 | 3 / 1 | SunsetEnd2 · 166708 + 148 bytes |
| [n802](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An802) | BstNode_2279669906 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd2 · 193525 + 134 bytes |
| [n509](../Objects.level.bin对象实现清单.html#SunsetRace%3An509) | BstNode_1167523850 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 126422 + 142 bytes |
| [n1044](../Objects.level.bin对象实现清单.html#SunsetRace%3An1044) | BstNode_1167523842 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 218888 + 148 bytes |
