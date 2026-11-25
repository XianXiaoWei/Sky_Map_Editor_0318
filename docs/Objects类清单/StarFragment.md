# StarFragment 单独类功能实现清单

功能分类：光点、碎片与灵魂。

此类职责：**星体碎片实例与收集事件**。

类清单进度 30%（3/10），86 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：StarFragment 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 5 项。
- [ ] 星体碎片实例与收集事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：StarFragmentParams（38 条引用）、SoulTrap（3 条引用）、Emitter（1 条引用）、Clump（4 条引用）、CameraGuide（1 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=StarFragment) · [原字段、进度与全部实例 JSON](StarFragment.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n9](../Objects.level.bin对象实现清单.html#CarryLand%3An9) | BstNode_3707306005 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 10070 + 27 bytes |
| [n77](../Objects.level.bin对象实现清单.html#CarryLand%3An77) | BstNode_3707306014 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 20442 + 27 bytes |
| [n81](../Objects.level.bin对象实现清单.html#CarryLand%3An81) | BstNode_3707306047 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 20916 + 27 bytes |
| [n1](../Objects.level.bin对象实现清单.html#CarryLand2%3An1) | BstNode_3707306194 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 12192 + 39 bytes |
| [n82](../Objects.level.bin对象实现清单.html#CarryLand2%3An82) | BstNode_3707306014 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 26748 + 39 bytes |
| [n96](../Objects.level.bin对象实现清单.html#CarryLand2%3An96) | BstNode_3707306047 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 28868 + 39 bytes |
| [n115](../Objects.level.bin对象实现清单.html#CarryLand2%3An115) | BstNode_3707306197 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 31813 + 39 bytes |
| [n126](../Objects.level.bin对象实现清单.html#CarryLand2%3An126) | BstNode_3707306005 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 33560 + 39 bytes |
| [n165](../Objects.level.bin对象实现清单.html#CarryLand2%3An165) | BstNode_3707306193 | 20%（2/10），运行待验 | 0 / 1 | CarryLand2 · 39983 + 39 bytes |
| [n213](../Objects.level.bin对象实现清单.html#CarryLand2%3An213) | BstNode_3707306200 | 20%（2/10），运行待验 | 0 / 1 | CarryLand2 · 48279 + 39 bytes |
| [n6](../Objects.level.bin对象实现清单.html#CarryLand3%3An6) | BstNode_3707306003 | 20%（2/10），运行待验 | 0 / 1 | CarryLand3 · 6608 + 39 bytes |
| [n7](../Objects.level.bin对象实现清单.html#CarryLand3%3An7) | BstNode_3707306005 | 20%（2/10），运行待验 | 0 / 1 | CarryLand3 · 6647 + 39 bytes |
| [n8](../Objects.level.bin对象实现清单.html#CarryLand3%3An8) | BstNode_3707306002 | 20%（2/10），运行待验 | 0 / 1 | CarryLand3 · 6686 + 39 bytes |
| [n16](../Objects.level.bin对象实现清单.html#CarryLand3%3An16) | BstNode_3707306000 | 20%（2/10），运行待验 | 0 / 1 | CarryLand3 · 7925 + 39 bytes |
| [n18](../Objects.level.bin对象实现清单.html#CarryLand3%3An18) | BstNode_3707306001 | 20%（2/10），运行待验 | 0 / 1 | CarryLand3 · 8113 + 39 bytes |
| [n24](../Objects.level.bin对象实现清单.html#CarryLand3%3An24) | BstNode_3707305999 | 20%（2/10），运行待验 | 0 / 1 | CarryLand3 · 8878 + 39 bytes |
| [n870](../Objects.level.bin对象实现清单.html#Dawn%3An870) | BstNode_34603065 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 171339 + 101 bytes |
| [n1170](../Objects.level.bin对象实现清单.html#Dawn%3An1170) | BstNode_3707305993 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 208501 + 103 bytes |
| [n365](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An365) | BstNode_2529559368 | 20%（2/10），运行待验 | 0 / 1 | Dusk_CrabField · 96096 + 27 bytes |
| [n113](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An113) | BstNode_3122856020 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 48001 + 103 bytes |
| [n807](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An807) | BstNode_1167523990 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 182038 + 103 bytes |
| [n818](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An818) | BstNode_1167523978 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 183739 + 103 bytes |
| [n851](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An851) | BstNode_1167523980 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 187726 + 103 bytes |
| [n889](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An889) | BstNode_3707305992 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 193990 + 103 bytes |
| [n897](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An897) | BstNode_3122856006 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 194939 + 103 bytes |
| [n898](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An898) | BstNode_3707305990 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 195042 + 103 bytes |
| [n899](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An899) | BstNode_3707305994 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 195145 + 103 bytes |
| [n1290](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1290) | BstNode_3122856009 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 279549 + 103 bytes |
| [n1295](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1295) | BstNode_1167523984 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 280585 + 103 bytes |
| [n1361](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1361) | BstNode_3707305993 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 292625 + 103 bytes |
| [n454](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An454) | BstNode_1528234054 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 129435 + 103 bytes |
| [n520](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An520) | BstNode_1842806841 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 144552 + 103 bytes |
| [n597](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An597) | BstNode_1842806971 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 162404 + 103 bytes |
| [n794](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An794) | BstNode_3122856006 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 207699 + 103 bytes |
| [n959](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An959) | BstNode_3707305990 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 245733 + 103 bytes |
| [n961](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An961) | BstNode_3707305992 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 246227 + 103 bytes |
| [n989](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An989) | BstNode_3707305994 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 251872 + 103 bytes |
| [n1049](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1049) | BstNode_1842806845 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 266432 + 103 bytes |
| [n1161](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1161) | BstNode_3122856020 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 293377 + 103 bytes |
| [n1187](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1187) | BstNode_3707305995 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 298697 + 103 bytes |
| [n1196](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1196) | BstNode_1842806856 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 300207 + 103 bytes |
| [n1534](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1534) | BstNode_1842806840 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 389658 + 103 bytes |
| [n1650](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1650) | BstNode_1842807041 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 420733 + 103 bytes |
| [n80](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An80) | BstNode_34603342 | 20%（2/10），运行待验 | 1 / 2 | Prairie_NestAndKeeper · 40562 + 101 bytes |
| [n99](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An99) | BstNode_1528233992 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 43722 + 103 bytes |
| [n250](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An250) | BstNode_34603339 | 20%（2/10），运行待验 | 1 / 2 | Prairie_NestAndKeeper · 79226 + 101 bytes |
| [n317](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An317) | BstNode_34603050 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 93929 + 101 bytes |
| [n332](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An332) | BstNode_1528234001 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 97667 + 103 bytes |
| [n442](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An442) | BstNode_1528233993 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 121440 + 103 bytes |
| [n443](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An443) | BstNode_1528234007 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 121543 + 103 bytes |
| [n455](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An455) | BstNode_1528234011 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 123189 + 103 bytes |
| [n462](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An462) | BstNode_34603051 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 123973 + 101 bytes |
| [n469](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An469) | BstNode_1528234008 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 124760 + 103 bytes |
| [n501](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An501) | BstNode_34603053 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 129621 + 101 bytes |
| [n517](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An517) | BstNode_34603343 | 20%（2/10），运行待验 | 1 / 2 | Prairie_NestAndKeeper · 133029 + 101 bytes |
| [n525](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An525) | BstNode_34603057 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 134751 + 101 bytes |
| [n694](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An694) | BstNode_34603054 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 172257 + 101 bytes |
| [n728](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An728) | BstNode_34603081 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 181203 + 101 bytes |
| [n783](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An783) | BstNode_1528234010 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 196626 + 103 bytes |
| [n925](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An925) | BstNode_34603082 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 225539 + 101 bytes |
| [n306](../Objects.level.bin对象实现清单.html#Prairie_Village%3An306) | BstNode_1528234054 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 78926 + 103 bytes |
| [n358](../Objects.level.bin对象实现清单.html#Prairie_Village%3An358) | BstNode_1528234133 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 88317 + 103 bytes |
| [n738](../Objects.level.bin对象实现清单.html#Prairie_Village%3An738) | BstNode_1528234137 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 150935 + 103 bytes |
| [n870](../Objects.level.bin对象实现清单.html#Prairie_Village%3An870) | BstNode_1528234055 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 173144 + 103 bytes |
| [n902](../Objects.level.bin对象实现清单.html#Prairie_Village%3An902) | BstNode_1528234015 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 178392 + 103 bytes |
| [n916](../Objects.level.bin对象实现清单.html#Prairie_Village%3An916) | BstNode_3707305993 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 180447 + 103 bytes |
| [n923](../Objects.level.bin对象实现清单.html#Prairie_Village%3An923) | BstNode_3707305994 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 182441 + 103 bytes |
| [n1088](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1088) | BstNode_1167523842 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 210537 + 103 bytes |
| [n1138](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1138) | BstNode_1528234016 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 216617 + 103 bytes |
| [n1176](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1176) | BstNode_34603026 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 221522 + 101 bytes |
| [n1219](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1219) | BstNode_1167523853 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 227119 + 103 bytes |
| [n1259](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1259) | BstNode_1528234012 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 234160 + 103 bytes |
| [n1264](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1264) | BstNode_1528234063 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 234961 + 103 bytes |
| [n1329](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1329) | BstNode_1167523852 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 244788 + 103 bytes |
| [n1348](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1348) | BstNode_1528234056 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 247953 + 103 bytes |
| [n1376](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1376) | BstNode_1842806915 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 252271 + 103 bytes |
| [n1418](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1418) | BstNode_1842806911 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 259033 + 103 bytes |
| [n1470](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1470) | BstNode_1842806913 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 265943 + 103 bytes |
| [n1471](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1471) | BstNode_1528234053 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 266046 + 103 bytes |
| [n1567](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1567) | BstNode_1528234058 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 281120 + 103 bytes |
| [n1640](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1640) | BstNode_1528234037 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 292461 + 103 bytes |
| [n1800](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1800) | BstNode_1528234138 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 320949 + 103 bytes |
| [n1902](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1902) | BstNode_1842806917 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 339851 + 103 bytes |
| [n2328](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2328) | BstNode_1528234069 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 402399 + 103 bytes |
| [n2561](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2561) | BstNode_1528234019 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 435204 + 103 bytes |
| [n3032](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3032) | BstNode_1528234030 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 514937 + 103 bytes |
