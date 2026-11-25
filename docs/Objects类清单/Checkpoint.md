# Checkpoint 单独类功能实现清单

功能分类：地图加载、出生与检查点。

此类职责：**检查点记录与恢复区域**。

类清单进度 30%（3/10），126 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Checkpoint 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 检查点记录与恢复区域：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（126 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Checkpoint) · [原字段、进度与全部实例 JSON](Checkpoint.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n28](../Objects.level.bin对象实现清单.html#Dawn%3An28) | BstNode_421 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 38066 + 25 bytes |
| [n189](../Objects.level.bin对象实现清单.html#Dawn%3An189) | BstNode_34603029 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 62477 + 30 bytes |
| [n249](../Objects.level.bin对象实现清单.html#Dawn%3An249) | BstNode_2446917719 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 73517 + 32 bytes |
| [n338](../Objects.level.bin对象实现清单.html#Dawn%3An338) | BstNode_1842806786 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 85651 + 32 bytes |
| [n429](../Objects.level.bin对象实现清单.html#Dawn%3An429) | BstNode_424 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 97755 + 25 bytes |
| [n530](../Objects.level.bin对象实现清单.html#Dawn%3An530) | BstNode_3156082694 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 115681 + 32 bytes |
| [n543](../Objects.level.bin对象实现清单.html#Dawn%3An543) | BstNode_2446917657 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 117445 + 32 bytes |
| [n703](../Objects.level.bin对象实现清单.html#Dawn%3An703) | BstNode_2446917708 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 143382 + 32 bytes |
| [n782](../Objects.level.bin对象实现清单.html#Dawn%3An782) | BstNode_2446917739 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 157093 + 32 bytes |
| [n1029](../Objects.level.bin对象实现清单.html#Dawn%3An1029) | BstNode_2446917713 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 191885 + 32 bytes |
| [n1051](../Objects.level.bin对象实现清单.html#Dawn%3An1051) | BstNode_2446917709 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 193759 + 32 bytes |
| [n1188](../Objects.level.bin对象实现清单.html#Dawn%3An1188) | BstNode_3122856203 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 211037 + 32 bytes |
| [n1302](../Objects.level.bin对象实现清单.html#Dawn%3An1302) | BstNode_3122856135 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 234418 + 32 bytes |
| [n1403](../Objects.level.bin对象实现清单.html#Dawn%3An1403) | BstNode_3122856113 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 246858 + 32 bytes |
| [n1476](../Objects.level.bin对象实现清单.html#Dawn%3An1476) | BstNode_3122856205 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 260048 + 32 bytes |
| [n1796](../Objects.level.bin对象实现清单.html#Dawn%3An1796) | BstNode_415 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 302281 + 25 bytes |
| [n1908](../Objects.level.bin对象实现清单.html#Dawn%3An1908) | BstNode_1293287872 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 314616 + 32 bytes |
| [n1926](../Objects.level.bin对象实现清单.html#Dawn%3An1926) | BstNode_3122856162 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 316639 + 32 bytes |
| [n2066](../Objects.level.bin对象实现清单.html#Dawn%3An2066) | BstNode_2279669965 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 339153 + 32 bytes |
| [n2211](../Objects.level.bin对象实现清单.html#Dawn%3An2211) | BstNode_2529558566 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 364438 + 32 bytes |
| [n2520](../Objects.level.bin对象实现清单.html#Dawn%3An2520) | BstNode_2446917717 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 421518 + 32 bytes |
| [n2640](../Objects.level.bin对象实现清单.html#Dawn%3An2640) | BstNode_2446917729 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 438146 + 32 bytes |
| [n2737](../Objects.level.bin对象实现清单.html#Dawn%3An2737) | BstNode_418 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 452847 + 25 bytes |
| [n191](../Objects.level.bin对象实现清单.html#DayEnd%3An191) | BstNode_2345992214 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 62671 + 32 bytes |
| [n327](../Objects.level.bin对象实现清单.html#DayEnd%3An327) | BstNode_2345992217 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 85727 + 32 bytes |
| [n650](../Objects.level.bin对象实现清单.html#DayEnd%3An650) | BstNode_2345992222 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 148459 + 32 bytes |
| [n771](../Objects.level.bin对象实现清单.html#DayHubCave%3An771) | BstNode_2446917706 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 167433 + 32 bytes |
| [n586](../Objects.level.bin对象实现清单.html#Dusk%3An586) | BstNode_2345992281 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 132497 + 32 bytes |
| [n663](../Objects.level.bin对象实现清单.html#Dusk%3An663) | BstNode_2345992698 | 20%（2/10），运行待验 | 1 / 1 | Dusk · 143250 + 32 bytes |
| [n727](../Objects.level.bin对象实现清单.html#Dusk%3An727) | BstNode_2446917663 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 153449 + 32 bytes |
| [n1120](../Objects.level.bin对象实现清单.html#Dusk%3An1120) | BstNode_2345992303 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 228898 + 32 bytes |
| [n1166](../Objects.level.bin对象实现清单.html#Dusk%3An1166) | BstNode_2345992652 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 237556 + 32 bytes |
| [n522](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An522) | BstNode_2345992548 | 20%（2/10），运行待验 | 1 / 2 | DuskGraveyard · 146078 + 32 bytes |
| [n693](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An693) | BstNode_2446917645 | 20%（2/10），运行待验 | 1 / 2 | DuskGraveyard · 183778 + 32 bytes |
| [n700](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An700) | BstNode_2345993018 | 20%（2/10），运行待验 | 1 / 2 | DuskGraveyard · 184871 + 32 bytes |
| [n1153](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1153) | BstNode_2345992767 | 20%（2/10），运行待验 | 1 / 2 | DuskGraveyard · 295395 + 32 bytes |
| [n1385](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1385) | BstNode_2446917657 | 20%（2/10），运行待验 | 1 / 1 | DuskGraveyard · 342345 + 32 bytes |
| [n135](../Objects.level.bin对象实现清单.html#DuskMid%3An135) | BstNode_2446917865 | 20%（2/10），运行待验 | 1 / 1 | DuskMid · 43803 + 32 bytes |
| [n214](../Objects.level.bin对象实现清单.html#DuskMid%3An214) | BstNode_2345992387 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 59319 + 32 bytes |
| [n959](../Objects.level.bin对象实现清单.html#DuskMid%3An959) | BstNode_2345992378 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 204424 + 32 bytes |
| [n1058](../Objects.level.bin对象实现清单.html#DuskMid%3An1058) | BstNode_2345992539 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 221635 + 32 bytes |
| [n1085](../Objects.level.bin对象实现清单.html#DuskMid%3An1085) | BstNode_2345992800 | 20%（2/10），运行待验 | 1 / 1 | DuskMid · 226104 + 32 bytes |
| [n1108](../Objects.level.bin对象实现清单.html#DuskMid%3An1108) | BstNode_2345992797 | 20%（2/10），运行待验 | 1 / 1 | DuskMid · 229457 + 32 bytes |
| [n85](../Objects.level.bin对象实现清单.html#HubReveal%3An85) | BstNode_1495 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 43443 + 26 bytes |
| [n567](../Objects.level.bin对象实现清单.html#HubReveal%3An567) | BstNode_1497 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 126477 + 26 bytes |
| [n1013](../Objects.level.bin对象实现清单.html#HubReveal%3An1013) | BstNode_2446917659 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 198485 + 32 bytes |
| [n1250](../Objects.level.bin对象实现清单.html#HubReveal%3An1250) | BstNode_2504654892 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 241890 + 32 bytes |
| [n144](../Objects.level.bin对象实现清单.html#Night%3An144) | BstNode_34603577 | 20%（2/10），运行待验 | 1 / 2 | Night · 44129 + 30 bytes |
| [n168](../Objects.level.bin对象实现清单.html#Night%3An168) | BstNode_34603995 | 20%（2/10），运行待验 | 1 / 2 | Night · 47404 + 30 bytes |
| [n251](../Objects.level.bin对象实现清单.html#Night%3An251) | BstNode_1342 | 20%（2/10），运行待验 | 1 / 2 | Night · 59124 + 26 bytes |
| [n1136](../Objects.level.bin对象实现清单.html#Night%3An1136) | BstNode_34603451 | 20%（2/10），运行待验 | 1 / 2 | Night · 190207 + 30 bytes |
| [n1303](../Objects.level.bin对象实现清单.html#Night%3An1303) | BstNode_1343 | 20%（2/10），运行待验 | 1 / 2 | Night · 214207 + 26 bytes |
| [n1320](../Objects.level.bin对象实现清单.html#Night%3An1320) | BstNode_1339 | 20%（2/10），运行待验 | 1 / 2 | Night · 216901 + 26 bytes |
| [n2188](../Objects.level.bin对象实现清单.html#Night%3An2188) | BstNode_1344 | 20%（2/10），运行待验 | 1 / 2 | Night · 346711 + 26 bytes |
| [n2369](../Objects.level.bin对象实现清单.html#Night%3An2369) | BstNode_1345 | 20%（2/10），运行待验 | 1 / 2 | Night · 371729 + 26 bytes |
| [n3042](../Objects.level.bin对象实现清单.html#Night%3An3042) | BstNode_2345992303 | 20%（2/10），运行待验 | 1 / 2 | Night · 473287 + 32 bytes |
| [n504](../Objects.level.bin对象实现清单.html#NightEnd%3An504) | BstNode_2446917636 | 20%（2/10），运行待验 | 1 / 1 | NightEnd · 106768 + 32 bytes |
| [n497](../Objects.level.bin对象实现清单.html#NightEntrance%3An497) | BstNode_2446917636 | 20%（2/10），运行待验 | 1 / 1 | NightEntrance · 90793 + 32 bytes |
| [n77](../Objects.level.bin对象实现清单.html#Prairie_Village%3An77) | BstNode_2345992232 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 43289 + 32 bytes |
| [n520](../Objects.level.bin对象实现清单.html#Prairie_Village%3An520) | BstNode_2345992226 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 115021 + 32 bytes |
| [n594](../Objects.level.bin对象实现清单.html#Prairie_Village%3An594) | BstNode_949 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 126028 + 25 bytes |
| [n1413](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1413) | BstNode_3122855965 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 258391 + 32 bytes |
| [n1543](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1543) | BstNode_3122855946 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 277149 + 32 bytes |
| [n1674](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1674) | BstNode_960 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 297331 + 25 bytes |
| [n1916](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1916) | BstNode_2345992227 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 342512 + 32 bytes |
| [n2678](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2678) | BstNode_959 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 453356 + 25 bytes |
| [n2787](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2787) | BstNode_2345992228 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 473382 + 32 bytes |
| [n329](../Objects.level.bin对象实现清单.html#Rain%3An329) | BstNode_2345993013 | 20%（2/10），运行待验 | 1 / 1 | Rain · 102022 + 32 bytes |
| [n614](../Objects.level.bin对象实现清单.html#Rain%3An614) | BstNode_585 | 20%（2/10），运行待验 | 1 / 1 | Rain · 167229 + 25 bytes |
| [n765](../Objects.level.bin对象实现清单.html#Rain%3An765) | BstNode_2345992578 | 20%（2/10），运行待验 | 1 / 1 | Rain · 201197 + 32 bytes |
| [n870](../Objects.level.bin对象实现清单.html#Rain%3An870) | BstNode_2446917866 | 20%（2/10），运行待验 | 1 / 1 | Rain · 226515 + 32 bytes |
| [n1059](../Objects.level.bin对象实现清单.html#Rain%3An1059) | BstNode_2345992528 | 20%（2/10），运行待验 | 1 / 1 | Rain · 267647 + 32 bytes |
| [n1099](../Objects.level.bin对象实现清单.html#Rain%3An1099) | BstNode_600 | 20%（2/10），运行待验 | 1 / 2 | Rain · 275955 + 25 bytes |
| [n1537](../Objects.level.bin对象实现清单.html#Rain%3An1537) | BstNode_2345992547 | 20%（2/10），运行待验 | 1 / 2 | Rain · 371312 + 32 bytes |
| [n590](../Objects.level.bin对象实现清单.html#RainEnd%3An590) | BstNode_2345992972 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 171723 + 32 bytes |
| [n746](../Objects.level.bin对象实现清单.html#RainEnd%3An746) | BstNode_2446917867 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 209876 + 32 bytes |
| [n926](../Objects.level.bin对象实现清单.html#RainEnd%3An926) | BstNode_2446917641 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 248581 + 32 bytes |
| [n974](../Objects.level.bin对象实现清单.html#RainEnd%3An974) | BstNode_2345992974 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 259890 + 32 bytes |
| [n1228](../Objects.level.bin对象实现清单.html#RainEnd%3An1228) | BstNode_2345992939 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 323611 + 32 bytes |
| [n1251](../Objects.level.bin对象实现清单.html#RainEnd%3An1251) | BstNode_2345992963 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 328294 + 32 bytes |
| [n143](../Objects.level.bin对象实现清单.html#RainForest%3An143) | BstNode_2446917865 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 49863 + 32 bytes |
| [n153](../Objects.level.bin对象实现清单.html#RainForest%3An153) | BstNode_34603155 | 20%（2/10），运行待验 | 1 / 2 | RainForest · 51669 + 30 bytes |
| [n354](../Objects.level.bin对象实现清单.html#RainForest%3An354) | BstNode_2345992264 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 87387 + 32 bytes |
| [n445](../Objects.level.bin对象实现清单.html#RainForest%3An445) | BstNode_2345992257 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 100442 + 32 bytes |
| [n869](../Objects.level.bin对象实现清单.html#RainForest%3An869) | BstNode_2345992262 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 199810 + 32 bytes |
| [n1109](../Objects.level.bin对象实现清单.html#RainForest%3An1109) | BstNode_2446917867 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 249452 + 32 bytes |
| [n236](../Objects.level.bin对象实现清单.html#RainMid%3An236) | BstNode_2345992879 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 72274 + 32 bytes |
| [n476](../Objects.level.bin对象实现清单.html#RainMid%3An476) | BstNode_2345992855 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 115927 + 32 bytes |
| [n708](../Objects.level.bin对象实现清单.html#RainMid%3An708) | BstNode_2345992430 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 160563 + 32 bytes |
| [n1231](../Objects.level.bin对象实现清单.html#RainMid%3An1231) | BstNode_2345992867 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 252604 + 32 bytes |
| [n1525](../Objects.level.bin对象实现清单.html#RainMid%3An1525) | BstNode_2345992869 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 305914 + 32 bytes |
| [n1728](../Objects.level.bin对象实现清单.html#RainMid%3An1728) | BstNode_2446917905 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 343558 + 32 bytes |
| [n2070](../Objects.level.bin对象实现清单.html#RainMid%3An2070) | BstNode_2345992436 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 398740 + 32 bytes |
| [n2135](../Objects.level.bin对象实现清单.html#RainMid%3An2135) | BstNode_2446917909 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 413729 + 32 bytes |
| [n2139](../Objects.level.bin对象实现清单.html#RainMid%3An2139) | BstNode_2446917906 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 414115 + 32 bytes |
| [n2166](../Objects.level.bin对象实现清单.html#RainMid%3An2166) | BstNode_2345992696 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 419995 + 32 bytes |
| [n738](../Objects.level.bin对象实现清单.html#SkyHub2%3An738) | BstNode_1167524193 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 168495 + 32 bytes |
| [n1021](../Objects.level.bin对象实现清单.html#SkyHub2%3An1021) | BstNode_1167523950 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 219278 + 32 bytes |
| [n1887](../Objects.level.bin对象实现清单.html#SkyHub2%3An1887) | BstNode_2345992560 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 356283 + 32 bytes |
| [n531](../Objects.level.bin对象实现清单.html#Storm%3An531) | BstNode_2529560021 | 20%（2/10），运行待验 | 1 / 1 | Storm · 117826 + 32 bytes |
| [n1272](../Objects.level.bin对象实现清单.html#Storm%3An1272) | BstNode_2529560020 | 20%（2/10），运行待验 | 1 / 1 | Storm · 250256 + 32 bytes |
| [n1273](../Objects.level.bin对象实现清单.html#Storm%3An1273) | BstNode_2529560008 | 20%（2/10），运行待验 | 1 / 1 | Storm · 250288 + 32 bytes |
| [n1277](../Objects.level.bin对象实现清单.html#Storm%3An1277) | BstNode_2529560016 | 20%（2/10），运行待验 | 1 / 1 | Storm · 250946 + 32 bytes |
| [n1301](../Objects.level.bin对象实现清单.html#Storm%3An1301) | BstNode_2529560010 | 20%（2/10），运行待验 | 1 / 1 | Storm · 254106 + 32 bytes |
| [n1329](../Objects.level.bin对象实现清单.html#Storm%3An1329) | BstNode_2529560004 | 20%（2/10），运行待验 | 1 / 1 | Storm · 258203 + 32 bytes |
| [n1340](../Objects.level.bin对象实现清单.html#Storm%3An1340) | BstNode_2529560000 | 20%（2/10），运行待验 | 1 / 1 | Storm · 259441 + 32 bytes |
| [n1575](../Objects.level.bin对象实现清单.html#Storm%3An1575) | BstNode_2529560025 | 20%（2/10），运行待验 | 1 / 2 | Storm · 300131 + 32 bytes |
| [n1609](../Objects.level.bin对象实现清单.html#Storm%3An1609) | BstNode_2529559998 | 20%（2/10），运行待验 | 1 / 0 | Storm · 306818 + 32 bytes |
| [n367](../Objects.level.bin对象实现清单.html#Sunset%3An367) | BstNode_1167524227 | 20%（2/10），运行待验 | 1 / 2 | Sunset · 97044 + 32 bytes |
| [n906](../Objects.level.bin对象实现清单.html#Sunset%3An906) | BstNode_2446917865 | 20%（2/10），运行待验 | 1 / 3 | Sunset · 184461 + 32 bytes |
| [n1117](../Objects.level.bin对象实现清单.html#Sunset%3An1117) | BstNode_2446917638 | 20%（2/10），运行待验 | 1 / 1 | Sunset · 216420 + 32 bytes |
| [n1368](../Objects.level.bin对象实现清单.html#Sunset%3An1368) | BstNode_2446917696 | 20%（2/10），运行待验 | 1 / 2 | Sunset · 257105 + 32 bytes |
| [n1554](../Objects.level.bin对象实现清单.html#Sunset%3An1554) | BstNode_2446917676 | 20%（2/10），运行待验 | 1 / 2 | Sunset · 287459 + 32 bytes |
| [n1732](../Objects.level.bin对象实现清单.html#Sunset%3An1732) | BstNode_2446917684 | 20%（2/10），运行待验 | 1 / 2 | Sunset · 318222 + 32 bytes |
| [n972](../Objects.level.bin对象实现清单.html#SunsetEnd%3An972) | BstNode_2345992194 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 188399 + 32 bytes |
| [n1045](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1045) | BstNode_1167524215 | 20%（2/10），运行待验 | 1 / 3 | SunsetEnd · 201470 + 32 bytes |
| [n1097](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1097) | BstNode_2446917643 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 208639 + 32 bytes |
| [n1119](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1119) | BstNode_2446917865 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd · 211301 + 32 bytes |
| [n1134](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1134) | BstNode_2446917704 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd · 212790 + 32 bytes |
| [n1159](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1159) | BstNode_1167524483 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd · 217158 + 32 bytes |
| [n1191](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1191) | BstNode_1167524446 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd · 223168 + 32 bytes |
| [n1569](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1569) | BstNode_2446917636 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 293315 + 32 bytes |
| [n121](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An121) | BstNode_2446917646 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 47410 + 32 bytes |
| [n302](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An302) | BstNode_2345992218 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 85444 + 32 bytes |
| [n623](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An623) | BstNode_2345992221 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 157599 + 32 bytes |
| [n683](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An683) | BstNode_1049165925 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 171632 + 32 bytes |
