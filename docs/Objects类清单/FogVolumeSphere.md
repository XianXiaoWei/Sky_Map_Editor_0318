# FogVolumeSphere 单独类功能实现清单

功能分类：水、雾与天气。

此类职责：**球形体积雾与可见性参数**。

类清单进度 30%（3/10），78 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：FogVolumeSphere 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 8 项。
- [ ] 球形体积雾与可见性参数：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：PointLight（28 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=FogVolumeSphere) · [原字段、进度与全部实例 JSON](FogVolumeSphere.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n482](../Objects.level.bin对象实现清单.html#Dawn%3An482) | BstNode_1049166278 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 106367 + 103 bytes |
| [n624](../Objects.level.bin对象实现清单.html#Dawn%3An624) | BstNode_1049166276 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 129362 + 103 bytes |
| [n898](../Objects.level.bin对象实现清单.html#Dawn%3An898) | BstNode_2279669768 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 175127 + 103 bytes |
| [n1427](../Objects.level.bin对象实现清单.html#Dawn%3An1427) | BstNode_3122856957 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 251294 + 103 bytes |
| [n1455](../Objects.level.bin对象实现清单.html#Dawn%3An1455) | BstNode_3122856821 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 256140 + 103 bytes |
| [n1590](../Objects.level.bin对象实现清单.html#Dawn%3An1590) | BstNode_404 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 274561 + 96 bytes |
| [n1742](../Objects.level.bin对象实现清单.html#Dawn%3An1742) | BstNode_1049166277 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 296320 + 103 bytes |
| [n1932](../Objects.level.bin对象实现清单.html#Dawn%3An1932) | BstNode_2446917724 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 317647 + 103 bytes |
| [n2145](../Objects.level.bin对象实现清单.html#Dawn%3An2145) | BstNode_1049166275 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 351128 + 103 bytes |
| [n2331](../Objects.level.bin对象实现清单.html#Dawn%3An2331) | BstNode_2279669779 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 387277 + 103 bytes |
| [n2835](../Objects.level.bin对象实现清单.html#Dawn%3An2835) | BstNode_2279669791 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 464806 + 103 bytes |
| [n2842](../Objects.level.bin对象实现清单.html#Dawn%3An2842) | BstNode_386 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 465541 + 96 bytes |
| [n169](../Objects.level.bin对象实现清单.html#DayEnd%3An169) | BstNode_980 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 58260 + 96 bytes |
| [n301](../Objects.level.bin对象实现清单.html#DayEnd%3An301) | BstNode_876 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 80937 + 96 bytes |
| [n489](../Objects.level.bin对象实现清单.html#DayEnd%3An489) | BstNode_981 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 117523 + 96 bytes |
| [n833](../Objects.level.bin对象实现清单.html#DayEnd%3An833) | BstNode_720 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 181577 + 96 bytes |
| [n1092](../Objects.level.bin对象实现清单.html#DayEnd%3An1092) | BstNode_987 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 227754 + 96 bytes |
| [n1198](../Objects.level.bin对象实现清单.html#DayEnd%3An1198) | BstNode_721 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 248949 + 96 bytes |
| [n440](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An440) | BstNode_2345992690 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 128414 + 103 bytes |
| [n929](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An929) | BstNode_2345992723 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 240389 + 103 bytes |
| [n1665](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1665) | BstNode_2345992696 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 411007 + 103 bytes |
| [n9](../Objects.level.bin对象实现清单.html#HubReveal%3An9) | BstNode_1507 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 30564 + 97 bytes |
| [n705](../Objects.level.bin对象实现清单.html#HubReveal%3An705) | BstNode_2084 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 147173 + 97 bytes |
| [n927](../Objects.level.bin对象实现清单.html#HubReveal%3An927) | BstNode_1740 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 186431 + 97 bytes |
| [n1098](../Objects.level.bin对象实现清单.html#HubReveal%3An1098) | BstNode_2082 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 213744 + 97 bytes |
| [n9](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An9) | BstNode_1507 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 25830 + 97 bytes |
| [n468](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An468) | BstNode_898 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 122426 + 96 bytes |
| [n518](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An518) | BstNode_1740 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 135110 + 97 bytes |
| [n822](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An822) | BstNode_2082 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 184761 + 97 bytes |
| [n93](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An93) | BstNode_1842807032 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 46487 + 103 bytes |
| [n100](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An100) | BstNode_3122856273 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 48069 + 103 bytes |
| [n277](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An277) | BstNode_1842806873 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 87221 + 103 bytes |
| [n508](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An508) | BstNode_3122856272 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 141428 + 103 bytes |
| [n575](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An575) | BstNode_3122856153 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 157153 + 103 bytes |
| [n846](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An846) | BstNode_1842806861 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 220768 + 103 bytes |
| [n848](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An848) | BstNode_2753888416 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 221262 + 103 bytes |
| [n977](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An977) | BstNode_2753888417 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 249575 + 103 bytes |
| [n993](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An993) | BstNode_1293287513 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 252785 + 103 bytes |
| [n1075](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1075) | BstNode_2753888448 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 271581 + 103 bytes |
| [n1167](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1167) | BstNode_1842806846 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 294309 + 103 bytes |
| [n1202](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1202) | BstNode_2753888418 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 300797 + 103 bytes |
| [n1472](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1472) | BstNode_1293287464 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 370372 + 103 bytes |
| [n1727](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1727) | BstNode_1842807039 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 442651 + 103 bytes |
| [n178](../Objects.level.bin对象实现清单.html#Rain%3An178) | BstNode_400 | 20%（2/10），运行待验 | 0 / 0 | Rain · 68465 + 96 bytes |
| [n441](../Objects.level.bin对象实现清单.html#Rain%3An441) | BstNode_2345992352 | 20%（2/10），运行待验 | 0 / 0 | Rain · 127282 + 103 bytes |
| [n731](../Objects.level.bin对象实现清单.html#Rain%3An731) | BstNode_2345992354 | 20%（2/10），运行待验 | 0 / 0 | Rain · 195046 + 103 bytes |
| [n883](../Objects.level.bin对象实现清单.html#Rain%3An883) | BstNode_2345992259 | 20%（2/10），运行待验 | 0 / 0 | Rain · 227633 + 103 bytes |
| [n912](../Objects.level.bin对象实现清单.html#Rain%3An912) | BstNode_579 | 20%（2/10），运行待验 | 0 / 0 | Rain · 235022 + 96 bytes |
| [n988](../Objects.level.bin对象实现清单.html#Rain%3An988) | BstNode_569 | 20%（2/10），运行待验 | 0 / 0 | Rain · 252528 + 96 bytes |
| [n1171](../Objects.level.bin对象实现清单.html#Rain%3An1171) | BstNode_570 | 20%（2/10），运行待验 | 0 / 0 | Rain · 293255 + 96 bytes |
| [n1278](../Objects.level.bin对象实现清单.html#Rain%3An1278) | BstNode_2345992434 | 20%（2/10），运行待验 | 1 / 0 | Rain · 314140 + 103 bytes |
| [n1615](../Objects.level.bin对象实现清单.html#Rain%3An1615) | BstNode_684 | 20%（2/10），运行待验 | 0 / 0 | Rain · 387662 + 96 bytes |
| [n1704](../Objects.level.bin对象实现清单.html#Rain%3An1704) | BstNode_840696321 | 20%（2/10），运行待验 | 0 / 0 | Rain · 409659 + 102 bytes |
| [n1708](../Objects.level.bin对象实现清单.html#Rain%3An1708) | BstNode_2345992742 | 20%（2/10），运行待验 | 0 / 0 | Rain · 410745 + 103 bytes |
| [n1752](../Objects.level.bin对象实现清单.html#Rain%3An1752) | BstNode_2345992884 | 20%（2/10），运行待验 | 1 / 0 | Rain · 420703 + 103 bytes |
| [n26](../Objects.level.bin对象实现清单.html#RainEnd%3An26) | BstNode_107 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 34245 + 96 bytes |
| [n188](../Objects.level.bin对象实现清单.html#RainEnd%3An188) | BstNode_840696133 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 75217 + 102 bytes |
| [n1186](../Objects.level.bin对象实现清单.html#RainEnd%3An1186) | BstNode_840696132 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 311619 + 102 bytes |
| [n188](../Objects.level.bin对象实现清单.html#RainForest%3An188) | BstNode_400 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 59143 + 96 bytes |
| [n583](../Objects.level.bin对象实现清单.html#RainForest%3An583) | BstNode_2345992742 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 135019 + 103 bytes |
| [n753](../Objects.level.bin对象实现清单.html#RainForest%3An753) | BstNode_570 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 173948 + 96 bytes |
| [n795](../Objects.level.bin对象实现清单.html#RainForest%3An795) | BstNode_569 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 182385 + 96 bytes |
| [n831](../Objects.level.bin对象实现清单.html#RainForest%3An831) | BstNode_840696321 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 189777 + 102 bytes |
| [n107](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An107) | BstNode_840695855 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 43791 + 102 bytes |
| [n271](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An271) | BstNode_840695951 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 78996 + 102 bytes |
| [n764](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An764) | BstNode_840695930 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 186883 + 102 bytes |
| [n268](../Objects.level.bin对象实现清单.html#SunsetRace%3An268) | BstNode_1049165974 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 72754 + 103 bytes |
| [n288](../Objects.level.bin对象实现清单.html#SunsetRace%3An288) | BstNode_1049165910 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 76358 + 103 bytes |
| [n373](../Objects.level.bin对象实现清单.html#SunsetRace%3An373) | BstNode_1049165972 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 95337 + 103 bytes |
| [n565](../Objects.level.bin对象实现清单.html#SunsetRace%3An565) | BstNode_1049165907 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 136898 + 103 bytes |
| [n678](../Objects.level.bin对象实现清单.html#SunsetRace%3An678) | BstNode_1049165973 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 157358 + 103 bytes |
| [n708](../Objects.level.bin对象实现清单.html#SunsetRace%3An708) | BstNode_840696065 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 161808 + 102 bytes |
| [n1125](../Objects.level.bin对象实现清单.html#SunsetRace%3An1125) | BstNode_2279669910 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 231020 + 103 bytes |
| [n1175](../Objects.level.bin对象实现清单.html#SunsetRace%3An1175) | BstNode_1049165908 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 239836 + 103 bytes |
| [n1247](../Objects.level.bin对象实现清单.html#SunsetRace%3An1247) | BstNode_840696042 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 254992 + 102 bytes |
| [n1444](../Objects.level.bin对象实现清单.html#SunsetRace%3An1444) | BstNode_840696066 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 294799 + 102 bytes |
| [n1488](../Objects.level.bin对象实现清单.html#SunsetRace%3An1488) | BstNode_1049165909 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 303263 + 103 bytes |
| [n1529](../Objects.level.bin对象实现清单.html#SunsetRace%3An1529) | BstNode_840695930 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 312693 + 102 bytes |
