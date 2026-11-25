# SpawnMotes 单独类功能实现清单

功能分类：光点、碎片与灵魂。

此类职责：**发射光点数量、速度与时长**。

类清单进度 30%（3/10），76 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SpawnMotes 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 发射光点数量、速度与时长：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：MoteParams（76 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SpawnMotes) · [原字段、进度与全部实例 JSON](SpawnMotes.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n1047](../Objects.level.bin对象实现清单.html#Dawn%3An1047) | BstNode_3122856195 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 193540 + 104 bytes |
| [n2491](../Objects.level.bin对象实现清单.html#Dawn%3An2491) | BstNode_3122856103 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 414924 + 104 bytes |
| [n92](../Objects.level.bin对象实现清单.html#DayEnd%3An92) | BstNode_228 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 41224 + 97 bytes |
| [n220](../Objects.level.bin对象实现清单.html#DayEnd%3An220) | BstNode_74 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 67706 + 96 bytes |
| [n321](../Objects.level.bin对象实现清单.html#DayEnd%3An321) | BstNode_569 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 84768 + 97 bytes |
| [n348](../Objects.level.bin对象实现清单.html#DayEnd%3An348) | BstNode_96 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 89500 + 96 bytes |
| [n375](../Objects.level.bin对象实现清单.html#DayEnd%3An375) | BstNode_248 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 94095 + 97 bytes |
| [n423](../Objects.level.bin对象实现清单.html#DayEnd%3An423) | BstNode_331 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 104347 + 97 bytes |
| [n537](../Objects.level.bin对象实现清单.html#DayEnd%3An537) | BstNode_833 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 125904 + 97 bytes |
| [n616](../Objects.level.bin对象实现清单.html#DayEnd%3An616) | BstNode_94 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 142087 + 96 bytes |
| [n839](../Objects.level.bin对象实现清单.html#DayEnd%3An839) | BstNode_31 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 182141 + 96 bytes |
| [n1005](../Objects.level.bin对象实现清单.html#DayEnd%3An1005) | BstNode_229 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 212475 + 97 bytes |
| [n232](../Objects.level.bin对象实现清单.html#DayHubCave%3An232) | BstNode_2345992669 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 62109 + 104 bytes |
| [n309](../Objects.level.bin对象实现清单.html#DayHubCave%3An309) | BstNode_94 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 78313 + 96 bytes |
| [n327](../Objects.level.bin对象实现清单.html#DayHubCave%3An327) | BstNode_2345992714 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 81832 + 104 bytes |
| [n411](../Objects.level.bin对象实现清单.html#DayHubCave%3An411) | BstNode_2345992679 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 99779 + 104 bytes |
| [n457](../Objects.level.bin对象实现清单.html#DayHubCave%3An457) | BstNode_2345992676 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 109304 + 104 bytes |
| [n618](../Objects.level.bin对象实现清单.html#DayHubCave%3An618) | BstNode_2345992717 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 140723 + 104 bytes |
| [n835](../Objects.level.bin对象实现清单.html#DayHubCave%3An835) | BstNode_2345992666 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 178667 + 104 bytes |
| [n174](../Objects.level.bin对象实现清单.html#HubReveal%3An174) | BstNode_1320 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 59147 + 98 bytes |
| [n551](../Objects.level.bin对象实现清单.html#HubReveal%3An551) | BstNode_1857 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 125019 + 98 bytes |
| [n695](../Objects.level.bin对象实现清单.html#HubReveal%3An695) | BstNode_33 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 146030 + 96 bytes |
| [n821](../Objects.level.bin对象实现清单.html#HubReveal%3An821) | BstNode_2498 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 166893 + 98 bytes |
| [n1273](../Objects.level.bin对象实现清单.html#HubReveal%3An1273) | BstNode_1177 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 246237 + 98 bytes |
| [n39](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An39) | BstNode_3122856004 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 32604 + 104 bytes |
| [n106](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An106) | BstNode_3122856051 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 46741 + 104 bytes |
| [n135](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An135) | BstNode_3122856061 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 51825 + 104 bytes |
| [n153](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An153) | BstNode_3122856003 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 55958 + 104 bytes |
| [n182](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An182) | BstNode_1221 | 20%（2/10），运行待验 | 1 / 5 | Prairie_ButterflyFields · 61537 + 98 bytes |
| [n304](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An304) | BstNode_1582 | 20%（2/10），运行待验 | 1 / 5 | Prairie_ButterflyFields · 90144 + 98 bytes |
| [n319](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An319) | BstNode_1065 | 20%（2/10），运行待验 | 1 / 4 | Prairie_ButterflyFields · 94199 + 98 bytes |
| [n428](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An428) | BstNode_3122856002 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 115993 + 104 bytes |
| [n433](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An433) | BstNode_1167523925 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 116589 + 104 bytes |
| [n480](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An480) | BstNode_3122856037 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 125239 + 104 bytes |
| [n520](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An520) | BstNode_3122856025 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 135238 + 104 bytes |
| [n554](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An554) | BstNode_2446917679 | 20%（2/10），运行待验 | 1 / 4 | Prairie_ButterflyFields · 142383 + 104 bytes |
| [n589](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An589) | BstNode_1298 | 20%（2/10），运行待验 | 1 / 5 | Prairie_ButterflyFields · 147180 + 98 bytes |
| [n650](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An650) | BstNode_984 | 20%（2/10），运行待验 | 1 / 4 | Prairie_ButterflyFields · 157125 + 97 bytes |
| [n653](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An653) | BstNode_2345992563 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 157548 + 104 bytes |
| [n673](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An673) | BstNode_1167523952 | 20%（2/10），运行待验 | 1 / 0 | Prairie_ButterflyFields · 161458 + 104 bytes |
| [n708](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An708) | BstNode_3122856001 | 20%（2/10），运行待验 | 1 / 3 | Prairie_ButterflyFields · 167043 + 104 bytes |
| [n724](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An724) | BstNode_3122856056 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 169898 + 104 bytes |
| [n734](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An734) | BstNode_669 | 20%（2/10），运行待验 | 1 / 4 | Prairie_ButterflyFields · 172109 + 97 bytes |
| [n742](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An742) | BstNode_954 | 20%（2/10），运行待验 | 1 / 4 | Prairie_ButterflyFields · 173520 + 97 bytes |
| [n753](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An753) | BstNode_1336 | 20%（2/10），运行待验 | 1 / 5 | Prairie_ButterflyFields · 175034 + 98 bytes |
| [n777](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An777) | BstNode_771 | 20%（2/10），运行待验 | 1 / 5 | Prairie_ButterflyFields · 177245 + 97 bytes |
| [n800](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An800) | BstNode_2060386314 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 180773 + 104 bytes |
| [n1017](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1017) | BstNode_1282 | 20%（2/10），运行待验 | 1 / 5 | Prairie_ButterflyFields · 219934 + 98 bytes |
| [n1074](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1074) | BstNode_1132 | 20%（2/10），运行待验 | 1 / 5 | Prairie_ButterflyFields · 233175 + 98 bytes |
| [n1112](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1112) | BstNode_872 | 20%（2/10），运行待验 | 1 / 5 | Prairie_ButterflyFields · 241716 + 97 bytes |
| [n1127](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1127) | BstNode_3122856031 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 244805 + 104 bytes |
| [n297](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An297) | BstNode_1057 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Cave · 91755 + 98 bytes |
| [n1058](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1058) | BstNode_1320 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Cave · 267368 + 98 bytes |
| [n973](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An973) | BstNode_34603222 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 236649 + 102 bytes |
| [n82](../Objects.level.bin对象实现清单.html#Prairie_Village%3An82) | BstNode_814 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 43936 + 97 bytes |
| [n308](../Objects.level.bin对象实现清单.html#Prairie_Village%3An308) | BstNode_1592 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 79088 + 98 bytes |
| [n1021](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1021) | BstNode_426 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 198613 + 97 bytes |
| [n1239](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1239) | BstNode_2259 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 230705 + 98 bytes |
| [n2334](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2334) | BstNode_2170 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 403213 + 98 bytes |
| [n2474](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2474) | BstNode_1057 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 423654 + 98 bytes |
| [n2881](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2881) | BstNode_34603111 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 490063 + 102 bytes |
| [n2903](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2903) | BstNode_1589 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 493522 + 98 bytes |
| [n1041](../Objects.level.bin对象实现清单.html#RainEnd%3An1041) | BstNode_396 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 277611 + 97 bytes |
| [n1010](../Objects.level.bin对象实现清单.html#RainForest%3An1010) | BstNode_591 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 231893 + 97 bytes |
| [n1156](../Objects.level.bin对象实现清单.html#RainForest%3An1156) | BstNode_1318 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 258636 + 98 bytes |
| [n1087](../Objects.level.bin对象实现清单.html#RainMid%3An1087) | BstNode_1698 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 224975 + 98 bytes |
| [n1089](../Objects.level.bin对象实现清单.html#RainMid%3An1089) | BstNode_2345992700 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 225554 + 104 bytes |
| [n1481](../Objects.level.bin对象实现清单.html#RainMid%3An1481) | BstNode_2345992699 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 296604 + 104 bytes |
| [n1668](../Objects.level.bin对象实现清单.html#RainMid%3An1668) | BstNode_2345992701 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 334759 + 104 bytes |
| [n1687](../Objects.level.bin对象实现清单.html#RainMid%3An1687) | BstNode_2345992822 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 337426 + 104 bytes |
| [n1723](../Objects.level.bin对象实现清单.html#RainMid%3An1723) | BstNode_2345992816 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 343172 + 104 bytes |
| [n1733](../Objects.level.bin对象实现清单.html#RainMid%3An1733) | BstNode_2345992698 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 344694 + 104 bytes |
| [n1797](../Objects.level.bin对象实现清单.html#RainMid%3An1797) | BstNode_2345993111 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 355736 + 104 bytes |
| [n771](../Objects.level.bin对象实现清单.html#SkyHub2%3An771) | BstNode_2060386367 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 173922 + 104 bytes |
| [n2042](../Objects.level.bin对象实现清单.html#SkyHub2%3An2042) | BstNode_2060386359 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 384064 + 104 bytes |
| [n1631](../Objects.level.bin对象实现清单.html#Sunset%3An1631) | BstNode_294 | 20%（2/10），运行待验 | 1 / 2 | Sunset · 301142 + 97 bytes |
