# DropOcclusion 单独类功能实现清单

功能分类：模型、材质与绘制。

此类职责：**遮挡对象、强度和淡入淡出**。

类清单进度 30%（3/10），64 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：DropOcclusion 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 10 项。
- [ ] 遮挡对象、强度和淡入淡出：已有共享 Visibility 数值内核；此类原对象/Clump 提交与启用/销毁依赖待恢复。
- [ ] 依赖调用与事件：Clump（64 条引用）、Float（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 10 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验（部分完成，未计分）：已有共享 Visibility 数值内核；此类原对象/Clump 提交与启用/销毁依赖待恢复。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已有共享 Visibility 数值内核；此类原对象/Clump 提交与启用/销毁依赖待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=DropOcclusion) · [原字段、进度与全部实例 JSON](DropOcclusion.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n431](../Objects.level.bin对象实现清单.html#CandleSpace%3An431) | BstNode_2504654864 | 20%（2/10），运行待验 | 1 / 1 | CandleSpace · 87123 + 73 bytes |
| [n70](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An70) | BstNode_2504654883 | 20%（2/10），运行待验 | 1 / 1 | CandleSpaceEnd · 26227 + 73 bytes |
| [n91](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An91) | BstNode_2504654949 | 20%（2/10），运行待验 | 1 / 1 | CandleSpaceEnd · 29494 + 73 bytes |
| [n146](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An146) | BstNode_2504654918 | 20%（2/10），运行待验 | 1 / 1 | CandleSpaceEnd · 37794 + 73 bytes |
| [n514](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An514) | BstNode_2446917747 | 20%（2/10），运行待验 | 1 / 1 | CandleSpaceEnd · 108859 + 73 bytes |
| [n571](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An571) | BstNode_2504654907 | 20%（2/10），运行待验 | 1 / 1 | CandleSpaceEnd · 114446 + 73 bytes |
| [n636](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An636) | BstNode_2446917727 | 20%（2/10），运行待验 | 1 / 1 | CandleSpaceEnd · 125376 + 73 bytes |
| [n97](../Objects.level.bin对象实现清单.html#Dawn%3An97) | BstNode_3122856491 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 48856 + 73 bytes |
| [n492](../Objects.level.bin对象实现清单.html#Dawn%3An492) | BstNode_677 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 108187 + 66 bytes |
| [n585](../Objects.level.bin对象实现清单.html#Dawn%3An585) | BstNode_3156082698 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 123756 + 73 bytes |
| [n715](../Objects.level.bin对象实现清单.html#Dawn%3An715) | BstNode_3122856276 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 146390 + 73 bytes |
| [n989](../Objects.level.bin对象实现清单.html#Dawn%3An989) | BstNode_3122856223 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 186825 + 73 bytes |
| [n1191](../Objects.level.bin对象实现清单.html#Dawn%3An1191) | BstNode_2279670090 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 211532 + 73 bytes |
| [n1243](../Objects.level.bin对象实现清单.html#Dawn%3An1243) | BstNode_2504654971 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 222575 + 73 bytes |
| [n1415](../Objects.level.bin对象实现清单.html#Dawn%3An1415) | BstNode_3122856305 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 248341 + 73 bytes |
| [n1428](../Objects.level.bin对象实现清单.html#Dawn%3An1428) | BstNode_1049166294 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 251397 + 73 bytes |
| [n1516](../Objects.level.bin对象实现清单.html#Dawn%3An1516) | BstNode_3122856317 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 265462 + 73 bytes |
| [n1641](../Objects.level.bin对象实现清单.html#Dawn%3An1641) | BstNode_2504654908 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 281045 + 73 bytes |
| [n2195](../Objects.level.bin对象实现清单.html#Dawn%3An2195) | BstNode_2279670101 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 360932 + 73 bytes |
| [n479](../Objects.level.bin对象实现清单.html#DayEnd%3An479) | BstNode_2504654889 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 116417 + 73 bytes |
| [n814](../Objects.level.bin对象实现清单.html#DayEnd%3An814) | BstNode_2504654892 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 178255 + 73 bytes |
| [n914](../Objects.level.bin对象实现清单.html#DayEnd%3An914) | BstNode_2504654894 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 197019 + 73 bytes |
| [n1019](../Objects.level.bin对象实现清单.html#DayEnd%3An1019) | BstNode_548 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 215325 + 66 bytes |
| [n1175](../Objects.level.bin对象实现清单.html#DayEnd%3An1175) | BstNode_831 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 242691 + 66 bytes |
| [n946](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An946) | BstNode_2504654859 | 20%（2/10），运行待验 | 1 / 2 | DuskGraveyard · 245152 + 73 bytes |
| [n0](../Objects.level.bin对象实现清单.html#HubReveal%3An0) | BstNode_1051 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 29702 + 67 bytes |
| [n1074](../Objects.level.bin对象实现清单.html#Night%3An1074) | BstNode_34603385 | 20%（2/10），运行待验 | 1 / 1 | Night · 181818 + 71 bytes |
| [n1180](../Objects.level.bin对象实现清单.html#Night%3An1180) | BstNode_34603389 | 20%（2/10），运行待验 | 1 / 1 | Night · 197080 + 71 bytes |
| [n365](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An365) | BstNode_697 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 104009 + 66 bytes |
| [n1070](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1070) | BstNode_1229 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 232269 + 67 bytes |
| [n2](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An2) | BstNode_1051 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Cave · 22955 + 67 bytes |
| [n378](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An378) | BstNode_3122856132 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 112024 + 73 bytes |
| [n437](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An437) | BstNode_2504654997 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 124071 + 73 bytes |
| [n203](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An203) | BstNode_2279670081 | 20%（2/10），运行待验 | 1 / 4 | Prairie_NestAndKeeper · 69696 + 73 bytes |
| [n600](../Objects.level.bin对象实现清单.html#Prairie_Village%3An600) | BstNode_1029 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 126764 + 67 bytes |
| [n714](../Objects.level.bin对象实现清单.html#Prairie_Village%3An714) | BstNode_1842806874 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 146666 + 73 bytes |
| [n2251](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2251) | BstNode_968 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 391033 + 66 bytes |
| [n2961](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2961) | BstNode_998 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 503027 + 66 bytes |
| [n24](../Objects.level.bin对象实现清单.html#RainEnd%3An24) | BstNode_2504654867 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 33787 + 73 bytes |
| [n117](../Objects.level.bin对象实现清单.html#RainEnd%3An117) | BstNode_2504654864 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 55667 + 73 bytes |
| [n176](../Objects.level.bin对象实现清单.html#RainEnd%3An176) | BstNode_2504654870 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 72021 + 73 bytes |
| [n285](../Objects.level.bin对象实现清单.html#RainEnd%3An285) | BstNode_2504654861 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 97635 + 73 bytes |
| [n447](../Objects.level.bin对象实现清单.html#RainEnd%3An447) | BstNode_1122 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 138534 + 67 bytes |
| [n627](../Objects.level.bin对象实现清单.html#RainEnd%3An627) | BstNode_2504654855 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 181146 + 73 bytes |
| [n777](../Objects.level.bin对象实现清单.html#RainEnd%3An777) | BstNode_2504654866 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 215277 + 73 bytes |
| [n865](../Objects.level.bin对象实现清单.html#RainEnd%3An865) | BstNode_2504654863 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 236111 + 73 bytes |
| [n1123](../Objects.level.bin对象实现清单.html#RainEnd%3An1123) | BstNode_2504654865 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 297219 + 73 bytes |
| [n1346](../Objects.level.bin对象实现清单.html#RainEnd%3An1346) | BstNode_2504654858 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 352333 + 73 bytes |
| [n1399](../Objects.level.bin对象实现清单.html#RainEnd%3An1399) | BstNode_2504654869 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 366307 + 73 bytes |
| [n1439](../Objects.level.bin对象实现清单.html#RainEnd%3An1439) | BstNode_1154 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 374375 + 67 bytes |
| [n1497](../Objects.level.bin对象实现清单.html#RainEnd%3An1497) | BstNode_2504654868 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 385369 + 73 bytes |
| [n775](../Objects.level.bin对象实现清单.html#RainMid%3An775) | BstNode_1049165976 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 171384 + 73 bytes |
| [n823](../Objects.level.bin对象实现清单.html#RainMid%3An823) | BstNode_1049165945 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 180508 + 73 bytes |
| [n1595](../Objects.level.bin对象实现清单.html#RainMid%3An1595) | BstNode_1049165953 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 320527 + 73 bytes |
| [n64](../Objects.level.bin对象实现清单.html#SkyHub2%3An64) | BstNode_2279669830 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 44703 + 73 bytes |
| [n126](../Objects.level.bin对象实现清单.html#SkyHub2%3An126) | BstNode_2446917815 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 55751 + 73 bytes |
| [n529](../Objects.level.bin对象实现清单.html#SkyHub2%3An529) | BstNode_2753888286 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 132491 + 73 bytes |
| [n887](../Objects.level.bin对象实现清单.html#SkyHub2%3An887) | BstNode_1049165866 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 195105 + 73 bytes |
| [n1137](../Objects.level.bin对象实现清单.html#SkyHub2%3An1137) | BstNode_1049165890 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 239952 + 73 bytes |
| [n1417](../Objects.level.bin对象实现清单.html#SkyHub2%3An1417) | BstNode_1049166130 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 279555 + 73 bytes |
| [n82](../Objects.level.bin对象实现清单.html#Storm%3An82) | BstNode_2529559983 | 20%（2/10），运行待验 | 1 / 0 | Storm · 38481 + 73 bytes |
| [n625](../Objects.level.bin对象实现清单.html#StormEnd%3An625) | BstNode_3156082772 | 20%（2/10），运行待验 | 1 / 0 | StormEnd · 129512 + 73 bytes |
| [n287](../Objects.level.bin对象实现清单.html#SunsetEnd%3An287) | BstNode_2279669798 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd · 80723 + 73 bytes |
| [n159](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An159) | BstNode_2279669886 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 54692 + 73 bytes |
