# TerrainBlobGroup 单独类功能实现清单

功能分类：地形生成。

此类职责：**地形对象集合、网格生成与细分配置**。

类清单进度 30%（3/10），109 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：TerrainBlobGroup 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 16 项。
- [ ] 地形对象集合、网格生成与细分配置：已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。
- [ ] 依赖调用与事件：Clump（134 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 16 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=TerrainBlobGroup) · [原字段、进度与全部实例 JSON](TerrainBlobGroup.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n39](../Objects.level.bin对象实现清单.html#CandleSpace%3An39) | BstNode_2529559349 | 20%（2/10），运行待验 | 1 / 0 | CandleSpace · 28919 + 59 bytes |
| [n109](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An109) | BstNode_2529559349 | 20%（2/10），运行待验 | 1 / 0 | CandleSpaceEnd · 32054 + 59 bytes |
| [n6](../Objects.level.bin对象实现清单.html#CarryLand%3An6) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | CarryLand · 9800 + 50 bytes |
| [n19](../Objects.level.bin对象实现清单.html#CarryLand%3An19) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | CarryLand · 11677 + 50 bytes |
| [n144](../Objects.level.bin对象实现清单.html#CarryLand2%3An144) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | CarryLand2 · 36344 + 50 bytes |
| [n220](../Objects.level.bin对象实现清单.html#CarryLand2%3An220) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | CarryLand2 · 49263 + 50 bytes |
| [n13](../Objects.level.bin对象实现清单.html#CarryLand3%3An13) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | CarryLand3 · 7692 + 50 bytes |
| [n39](../Objects.level.bin对象实现清单.html#CarryLand3%3An39) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | CarryLand3 · 11167 + 50 bytes |
| [n270](../Objects.level.bin对象实现清单.html#Dawn%3An270) | BstNode_1680 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 77080 + 53 bytes |
| [n1181](../Objects.level.bin对象实现清单.html#Dawn%3An1181) | BstNode_2446917830 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 209539 + 59 bytes |
| [n2630](../Objects.level.bin对象实现清单.html#Dawn%3An2630) | BstNode_6 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 437305 + 50 bytes |
| [n201](../Objects.level.bin对象实现清单.html#DayEnd%3An201) | BstNode_654 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 63981 + 52 bytes |
| [n366](../Objects.level.bin对象实现清单.html#DayEnd%3An366) | BstNode_42 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 92694 + 51 bytes |
| [n891](../Objects.level.bin对象实现清单.html#DayEnd%3An891) | BstNode_6 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 191690 + 50 bytes |
| [n378](../Objects.level.bin对象实现清单.html#DayHubCave%3An378) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 93570 + 50 bytes |
| [n601](../Objects.level.bin对象实现清单.html#DayHubCave%3An601) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 139062 + 50 bytes |
| [n93](../Objects.level.bin对象实现清单.html#Dusk%3An93) | BstNode_2345992566 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 39723 + 59 bytes |
| [n156](../Objects.level.bin对象实现清单.html#Dusk%3An156) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | Dusk · 52079 + 50 bytes |
| [n871](../Objects.level.bin对象实现清单.html#Dusk%3An871) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 182067 + 50 bytes |
| [n226](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An226) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | DuskGraveyard · 76811 + 50 bytes |
| [n1563](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1563) | BstNode_132 | 20%（2/10），运行待验 | 2 / 0 | DuskGraveyard · 386734 + 52 bytes |
| [n131](../Objects.level.bin对象实现清单.html#DuskMid%3An131) | BstNode_2345992610 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 43112 + 59 bytes |
| [n137](../Objects.level.bin对象实现清单.html#DuskMid%3An137) | BstNode_132 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 43907 + 52 bytes |
| [n154](../Objects.level.bin对象实现清单.html#DuskMid%3An154) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | DuskMid · 47394 + 50 bytes |
| [n744](../Objects.level.bin对象实现清单.html#DuskMid%3An744) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 159870 + 50 bytes |
| [n144](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An144) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | Dusk_CrabField · 46451 + 50 bytes |
| [n235](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An235) | BstNode_2529559093 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 68273 + 59 bytes |
| [n837](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An837) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 207119 + 50 bytes |
| [n938](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An938) | BstNode_2529559213 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 230972 + 59 bytes |
| [n958](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An958) | BstNode_2529559375 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 234384 + 59 bytes |
| [n48](../Objects.level.bin对象实现清单.html#HubReveal%3An48) | BstNode_1301 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 36301 + 53 bytes |
| [n368](../Objects.level.bin对象实现清单.html#HubReveal%3An368) | BstNode_1312 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 92540 + 53 bytes |
| [n607](../Objects.level.bin对象实现清单.html#HubReveal%3An607) | BstNode_1567 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 132625 + 53 bytes |
| [n713](../Objects.level.bin对象实现清单.html#HubReveal%3An713) | BstNode_5303 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 148417 + 53 bytes |
| [n1425](../Objects.level.bin对象实现清单.html#HubReveal%3An1425) | BstNode_612 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 270107 + 52 bytes |
| [n1550](../Objects.level.bin对象实现清单.html#Night%3An1550) | BstNode_5 | 20%（2/10），运行待验 | 1 / 0 | Night · 244521 + 50 bytes |
| [n237](../Objects.level.bin对象实现清单.html#NightEnd%3An237) | BstNode_5 | 20%（2/10），运行待验 | 1 / 0 | NightEnd · 61429 + 50 bytes |
| [n170](../Objects.level.bin对象实现清单.html#NightEntrance%3An170) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | NightEntrance · 41815 + 50 bytes |
| [n214](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An214) | BstNode_2529558805 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 68259 + 59 bytes |
| [n227](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An227) | BstNode_1293287451 | 20%（2/10），运行待验 | 2 / 0 | Prairie_ButterflyFields · 72796 + 59 bytes |
| [n284](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An284) | BstNode_2279669794 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 86816 + 59 bytes |
| [n894](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An894) | BstNode_5303 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 194806 + 53 bytes |
| [n1073](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1073) | BstNode_1842806926 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 233116 + 59 bytes |
| [n1184](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1184) | BstNode_2529558796 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 256074 + 59 bytes |
| [n1228](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1228) | BstNode_2279669793 | 20%（2/10），运行待验 | 2 / 0 | Prairie_ButterflyFields · 266240 + 59 bytes |
| [n241](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An241) | BstNode_5303 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 79618 + 53 bytes |
| [n344](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An344) | BstNode_1293287451 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 102428 + 59 bytes |
| [n1466](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1466) | BstNode_2753888632 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Cave · 368912 + 59 bytes |
| [n1550](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1550) | BstNode_2753888305 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 394303 + 59 bytes |
| [n1669](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1669) | BstNode_1842806928 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Cave · 425680 + 59 bytes |
| [n1778](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1778) | BstNode_1567 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 456714 + 53 bytes |
| [n56](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An56) | BstNode_2279669773 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 34547 + 59 bytes |
| [n113](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An113) | BstNode_2279669913 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 46096 + 59 bytes |
| [n124](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An124) | BstNode_5303 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 48627 + 53 bytes |
| [n170](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An170) | BstNode_1293287451 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 61329 + 59 bytes |
| [n270](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An270) | BstNode_34603353 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 83667 + 57 bytes |
| [n307](../Objects.level.bin对象实现清单.html#Prairie_Village%3An307) | BstNode_2279669794 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 79029 + 59 bytes |
| [n1233](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1233) | BstNode_1567 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 229667 + 53 bytes |
| [n1687](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1687) | BstNode_1293287451 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 299229 + 59 bytes |
| [n1811](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1811) | BstNode_2753888276 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 322348 + 59 bytes |
| [n2618](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2618) | BstNode_312 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 443964 + 52 bytes |
| [n258](../Objects.level.bin对象实现清单.html#Rain%3An258) | BstNode_3 | 20%（2/10），运行待验 | 2 / 0 | Rain · 85748 + 50 bytes |
| [n739](../Objects.level.bin对象实现清单.html#Rain%3An739) | BstNode_804 | 20%（2/10），运行待验 | 2 / 0 | Rain · 196701 + 52 bytes |
| [n1541](../Objects.level.bin对象实现清单.html#Rain%3An1541) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | Rain · 371827 + 50 bytes |
| [n228](../Objects.level.bin对象实现清单.html#RainEnd%3An228) | BstNode_16 | 20%（2/10），运行待验 | 2 / 0 | RainEnd · 83435 + 51 bytes |
| [n745](../Objects.level.bin对象实现清单.html#RainEnd%3An745) | BstNode_479 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 209824 + 52 bytes |
| [n791](../Objects.level.bin对象实现清单.html#RainEnd%3An791) | BstNode_887 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 217755 + 52 bytes |
| [n795](../Objects.level.bin对象实现清单.html#RainEnd%3An795) | BstNode_243 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 218683 + 52 bytes |
| [n1312](../Objects.level.bin对象实现清单.html#RainEnd%3An1312) | BstNode_64 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 343052 + 51 bytes |
| [n285](../Objects.level.bin对象实现清单.html#RainForest%3An285) | BstNode_3 | 20%（2/10），运行待验 | 2 / 0 | RainForest · 76153 + 50 bytes |
| [n981](../Objects.level.bin对象实现清单.html#RainForest%3An981) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 226364 + 50 bytes |
| [n1211](../Objects.level.bin对象实现清单.html#RainForest%3An1211) | BstNode_804 | 20%（2/10），运行待验 | 2 / 0 | RainForest · 267511 + 52 bytes |
| [n1073](../Objects.level.bin对象实现清单.html#RainMid%3An1073) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 222840 + 50 bytes |
| [n1095](../Objects.level.bin对象实现清单.html#RainMid%3An1095) | BstNode_1049165970 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 226306 + 59 bytes |
| [n1912](../Objects.level.bin对象实现清单.html#RainMid%3An1912) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 372468 + 50 bytes |
| [n217](../Objects.level.bin对象实现清单.html#SkyHub2%3An217) | BstNode_1049166076 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 72263 + 59 bytes |
| [n562](../Objects.level.bin对象实现清单.html#SkyHub2%3An562) | BstNode_2279669949 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 137422 + 59 bytes |
| [n1869](../Objects.level.bin对象实现清单.html#SkyHub2%3An1869) | BstNode_1167523862 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 352498 + 59 bytes |
| [n2031](../Objects.level.bin对象实现清单.html#SkyHub2%3An2031) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 382665 + 50 bytes |
| [n421](../Objects.level.bin对象实现清单.html#Storm%3An421) | BstNode_134 | 20%（2/10），运行待验 | 1 / 0 | Storm · 98675 + 52 bytes |
| [n643](../Objects.level.bin对象实现清单.html#Storm%3An643) | BstNode_2529559694 | 20%（2/10），运行待验 | 1 / 0 | Storm · 137314 + 59 bytes |
| [n1371](../Objects.level.bin对象实现清单.html#Storm%3An1371) | BstNode_15 | 20%（2/10），运行待验 | 1 / 0 | Storm · 266049 + 51 bytes |
| [n30](../Objects.level.bin对象实现清单.html#StormEnd%3An30) | BstNode_15 | 20%（2/10），运行待验 | 1 / 0 | StormEnd · 27897 + 51 bytes |
| [n222](../Objects.level.bin对象实现清单.html#StormEnd%3An222) | BstNode_134 | 20%（2/10），运行待验 | 1 / 0 | StormEnd · 58414 + 52 bytes |
| [n535](../Objects.level.bin对象实现清单.html#StormEnd%3An535) | BstNode_2345992725 | 20%（2/10），运行待验 | 1 / 0 | StormEnd · 118884 + 59 bytes |
| [n158](../Objects.level.bin对象实现清单.html#Sunset%3An158) | BstNode_3501195407 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 53741 + 59 bytes |
| [n240](../Objects.level.bin对象实现清单.html#Sunset%3An240) | BstNode_5 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 72062 + 50 bytes |
| [n295](../Objects.level.bin对象实现清单.html#Sunset%3An295) | BstNode_1049165890 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 83674 + 59 bytes |
| [n366](../Objects.level.bin对象实现清单.html#Sunset%3An366) | BstNode_1049166164 | 20%（2/10），运行待验 | 2 / 0 | Sunset · 96985 + 59 bytes |
| [n1421](../Objects.level.bin对象实现清单.html#Sunset%3An1421) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 264758 + 50 bytes |
| [n46](../Objects.level.bin对象实现清单.html#SunsetEnd%3An46) | BstNode_15 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 34157 + 51 bytes |
| [n422](../Objects.level.bin对象实现清单.html#SunsetEnd%3An422) | BstNode_1482555522 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 101810 + 59 bytes |
| [n749](../Objects.level.bin对象实现清单.html#SunsetEnd%3An749) | BstNode_3501195346 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 151724 + 59 bytes |
| [n1155](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1155) | BstNode_840695810 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 216351 + 58 bytes |
| [n1621](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1621) | BstNode_840696059 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 303534 + 58 bytes |
| [n1821](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1821) | BstNode_840696141 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 344225 + 58 bytes |
| [n23](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An23) | BstNode_1167523884 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 26239 + 59 bytes |
| [n169](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An169) | BstNode_840695810 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 56153 + 58 bytes |
| [n357](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An357) | BstNode_1167524541 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 96695 + 59 bytes |
| [n758](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An758) | BstNode_15 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 185684 + 51 bytes |
| [n236](../Objects.level.bin对象实现清单.html#SunsetRace%3An236) | BstNode_840696036 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 65590 + 58 bytes |
| [n284](../Objects.level.bin对象实现清单.html#SunsetRace%3An284) | BstNode_3501195354 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 75992 + 59 bytes |
| [n388](../Objects.level.bin对象实现清单.html#SunsetRace%3An388) | BstNode_840696039 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 99798 + 58 bytes |
| [n564](../Objects.level.bin对象实现清单.html#SunsetRace%3An564) | BstNode_3501195346 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 136839 + 59 bytes |
| [n1084](../Objects.level.bin对象实现清单.html#SunsetRace%3An1084) | BstNode_840695921 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 225682 + 58 bytes |
| [n1279](../Objects.level.bin对象实现清单.html#SunsetRace%3An1279) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 261431 + 50 bytes |
| [n1356](../Objects.level.bin对象实现清单.html#SunsetRace%3An1356) | BstNode_5 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 276971 + 50 bytes |
| [n87](../Objects.level.bin对象实现清单.html#TitleWater%3An87) | BstNode_6 | 20%（2/10），运行待验 | 1 / 0 | TitleWater · 28371 + 50 bytes |
| [n134](../Objects.level.bin对象实现清单.html#TitleWater%3An134) | BstNode_36 | 20%（2/10），运行待验 | 1 / 0 | TitleWater · 34429 + 51 bytes |
