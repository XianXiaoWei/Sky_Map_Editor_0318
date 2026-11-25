# OnFlame 单独类功能实现清单

功能分类：收集物、蜡烛与解锁。

此类职责：**火焰集合、消耗、点燃与熄灭事件**。

类清单进度 40%（4/10），154 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：OnFlame 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 8 项。
- [ ] 火焰集合、消耗、点燃与熄灭事件（部分完成）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 依赖调用与事件：Clump（308 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=OnFlame) · [原字段、进度与全部实例 JSON](OnFlame.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n12](../Objects.level.bin对象实现清单.html#CandleSpace%3An12) | BstNode_2446917755 | 20%（2/10），运行待验 | 2 / 1 | CandleSpace · 25490 + 44 bytes |
| [n377](../Objects.level.bin对象实现清单.html#CandleSpace%3An377) | BstNode_2529558720 | 20%（2/10），运行待验 | 2 / 2 | CandleSpace · 79699 + 44 bytes |
| [n269](../Objects.level.bin对象实现清单.html#Dawn%3An269) | BstNode_2446917643 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 77036 + 44 bytes |
| [n828](../Objects.level.bin对象实现清单.html#Dawn%3An828) | BstNode_2645622787 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 164827 + 44 bytes |
| [n1575](../Objects.level.bin对象实现清单.html#Dawn%3An1575) | BstNode_505 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 272434 + 37 bytes |
| [n1650](../Objects.level.bin对象实现清单.html#Dawn%3An1650) | BstNode_3122857032 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 282247 + 44 bytes |
| [n360](../Objects.level.bin对象实现清单.html#DayEnd%3An360) | BstNode_2446917696 | 20%（2/10），运行待验 | 2 / 0 | DayEnd · 91579 + 44 bytes |
| [n1053](../Objects.level.bin对象实现清单.html#DayEnd%3An1053) | BstNode_2446917700 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 220997 + 44 bytes |
| [n1146](../Objects.level.bin对象实现清单.html#DayEnd%3An1146) | BstNode_2446917709 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 237130 + 44 bytes |
| [n23](../Objects.level.bin对象实现清单.html#DayHubCave%3An23) | BstNode_3156082789 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 27459 + 44 bytes |
| [n145](../Objects.level.bin对象实现清单.html#DayHubCave%3An145) | BstNode_3156082776 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 48973 + 44 bytes |
| [n183](../Objects.level.bin对象实现清单.html#DayHubCave%3An183) | BstNode_3156082778 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 55481 + 44 bytes |
| [n187](../Objects.level.bin对象实现清单.html#DayHubCave%3An187) | BstNode_3156082779 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 56199 + 44 bytes |
| [n193](../Objects.level.bin对象实现清单.html#DayHubCave%3An193) | BstNode_3156082780 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 56906 + 44 bytes |
| [n220](../Objects.level.bin对象实现清单.html#DayHubCave%3An220) | BstNode_3156082777 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 60846 + 44 bytes |
| [n234](../Objects.level.bin对象实现清单.html#DayHubCave%3An234) | BstNode_3156082774 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 62260 + 44 bytes |
| [n243](../Objects.level.bin对象实现清单.html#DayHubCave%3An243) | BstNode_34603264 | 20%（2/10），运行待验 | 2 / 1 | DayHubCave · 63754 + 42 bytes |
| [n335](../Objects.level.bin对象实现清单.html#DayHubCave%3An335) | BstNode_3156082773 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 84079 + 44 bytes |
| [n610](../Objects.level.bin对象实现清单.html#DayHubCave%3An610) | BstNode_3156082775 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 140163 + 44 bytes |
| [n600](../Objects.level.bin对象实现清单.html#Dusk%3An600) | BstNode_2446917757 | 20%（2/10），运行待验 | 2 / 1 | Dusk · 133925 + 44 bytes |
| [n738](../Objects.level.bin对象实现清单.html#Dusk%3An738) | BstNode_34603740 | 20%（2/10），运行待验 | 2 / 2 | Dusk · 155709 + 42 bytes |
| [n1026](../Objects.level.bin对象实现清单.html#Dusk%3An1026) | BstNode_34603726 | 20%（2/10），运行待验 | 2 / 1 | Dusk · 209686 + 42 bytes |
| [n1134](../Objects.level.bin对象实现清单.html#Dusk%3An1134) | BstNode_34603730 | 20%（2/10），运行待验 | 2 / 2 | Dusk · 232439 + 42 bytes |
| [n286](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An286) | BstNode_34603862 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 92168 + 42 bytes |
| [n1025](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1025) | BstNode_34603843 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 270360 + 42 bytes |
| [n1448](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1448) | BstNode_34603863 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 355961 + 42 bytes |
| [n1035](../Objects.level.bin对象实现清单.html#HubReveal%3An1035) | BstNode_2446917757 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 202317 + 44 bytes |
| [n1246](../Objects.level.bin对象实现清单.html#HubReveal%3An1246) | BstNode_1477 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 241442 + 38 bytes |
| [n5](../Objects.level.bin对象实现清单.html#Night%3An5) | BstNode_34604447 | 20%（2/10），运行待验 | 2 / 0 | Night · 24818 + 42 bytes |
| [n37](../Objects.level.bin对象实现清单.html#Night%3An37) | BstNode_411 | 20%（2/10），运行待验 | 2 / 0 | Night · 29047 + 37 bytes |
| [n133](../Objects.level.bin对象实现清单.html#Night%3An133) | BstNode_1252 | 20%（2/10），运行待验 | 2 / 1 | Night · 42968 + 38 bytes |
| [n183](../Objects.level.bin对象实现清单.html#Night%3An183) | BstNode_1217 | 20%（2/10），运行待验 | 2 / 1 | Night · 48921 + 38 bytes |
| [n241](../Objects.level.bin对象实现清单.html#Night%3An241) | BstNode_400 | 20%（2/10），运行待验 | 2 / 0 | Night · 58252 + 37 bytes |
| [n250](../Objects.level.bin对象实现清单.html#Night%3An250) | BstNode_1147 | 20%（2/10），运行待验 | 2 / 0 | Night · 59086 + 38 bytes |
| [n267](../Objects.level.bin对象实现清单.html#Night%3An267) | BstNode_2215 | 20%（2/10），运行待验 | 2 / 0 | Night · 61893 + 38 bytes |
| [n302](../Objects.level.bin对象实现清单.html#Night%3An302) | BstNode_1783 | 20%（2/10），运行待验 | 2 / 0 | Night · 67536 + 38 bytes |
| [n305](../Objects.level.bin对象实现清单.html#Night%3An305) | BstNode_851 | 20%（2/10），运行待验 | 2 / 0 | Night · 67936 + 37 bytes |
| [n360](../Objects.level.bin对象实现清单.html#Night%3An360) | BstNode_1119 | 20%（2/10），运行待验 | 2 / 0 | Night · 75391 + 38 bytes |
| [n371](../Objects.level.bin对象实现清单.html#Night%3An371) | BstNode_672 | 20%（2/10），运行待验 | 2 / 0 | Night · 77940 + 37 bytes |
| [n386](../Objects.level.bin对象实现清单.html#Night%3An386) | BstNode_731 | 20%（2/10），运行待验 | 2 / 0 | Night · 80596 + 37 bytes |
| [n488](../Objects.level.bin对象实现清单.html#Night%3An488) | BstNode_1152 | 20%（2/10），运行待验 | 2 / 1 | Night · 96270 + 38 bytes |
| [n565](../Objects.level.bin对象实现清单.html#Night%3An565) | BstNode_782 | 20%（2/10），运行待验 | 2 / 0 | Night · 106145 + 37 bytes |
| [n571](../Objects.level.bin对象实现清单.html#Night%3An571) | BstNode_550 | 20%（2/10），运行待验 | 2 / 0 | Night · 106604 + 37 bytes |
| [n576](../Objects.level.bin对象实现清单.html#Night%3An576) | BstNode_1132 | 20%（2/10），运行待验 | 2 / 1 | Night · 107717 + 38 bytes |
| [n589](../Objects.level.bin对象实现清单.html#Night%3An589) | BstNode_382 | 20%（2/10），运行待验 | 2 / 0 | Night · 110292 + 37 bytes |
| [n655](../Objects.level.bin对象实现清单.html#Night%3An655) | BstNode_1406 | 20%（2/10），运行待验 | 2 / 1 | Night · 120522 + 38 bytes |
| [n698](../Objects.level.bin对象实现清单.html#Night%3An698) | BstNode_1225 | 20%（2/10），运行待验 | 2 / 1 | Night · 126565 + 38 bytes |
| [n725](../Objects.level.bin对象实现清单.html#Night%3An725) | BstNode_722 | 20%（2/10），运行待验 | 2 / 0 | Night · 130341 + 37 bytes |
| [n801](../Objects.level.bin对象实现清单.html#Night%3An801) | BstNode_1099 | 20%（2/10），运行待验 | 2 / 1 | Night · 143199 + 38 bytes |
| [n825](../Objects.level.bin对象实现清单.html#Night%3An825) | BstNode_1209 | 20%（2/10），运行待验 | 2 / 1 | Night · 146240 + 38 bytes |
| [n833](../Objects.level.bin对象实现清单.html#Night%3An833) | BstNode_1109 | 20%（2/10），运行待验 | 2 / 0 | Night · 147345 + 38 bytes |
| [n873](../Objects.level.bin对象实现清单.html#Night%3An873) | BstNode_1275 | 20%（2/10），运行待验 | 2 / 1 | Night · 153786 + 38 bytes |
| [n919](../Objects.level.bin对象实现清单.html#Night%3An919) | BstNode_1167 | 20%（2/10），运行待验 | 2 / 1 | Night · 161144 + 38 bytes |
| [n1071](../Objects.level.bin对象实现清单.html#Night%3An1071) | BstNode_464 | 20%（2/10），运行待验 | 2 / 0 | Night · 181619 + 37 bytes |
| [n1135](../Objects.level.bin对象实现清单.html#Night%3An1135) | BstNode_1201 | 20%（2/10），运行待验 | 2 / 1 | Night · 190169 + 38 bytes |
| [n1198](../Objects.level.bin对象实现清单.html#Night%3An1198) | BstNode_469 | 20%（2/10），运行待验 | 2 / 0 | Night · 199451 + 37 bytes |
| [n1219](../Objects.level.bin对象实现清单.html#Night%3An1219) | BstNode_1090 | 20%（2/10），运行待验 | 2 / 1 | Night · 202382 + 38 bytes |
| [n1354](../Objects.level.bin对象实现清单.html#Night%3An1354) | BstNode_651 | 20%（2/10），运行待验 | 2 / 0 | Night · 221931 + 37 bytes |
| [n1372](../Objects.level.bin对象实现清单.html#Night%3An1372) | BstNode_540 | 20%（2/10），运行待验 | 2 / 0 | Night · 224141 + 37 bytes |
| [n1387](../Objects.level.bin对象实现清单.html#Night%3An1387) | BstNode_1300 | 20%（2/10），运行待验 | 2 / 1 | Night · 225561 + 38 bytes |
| [n1418](../Objects.level.bin对象实现清单.html#Night%3An1418) | BstNode_34603264 | 20%（2/10），运行待验 | 2 / 1 | Night · 229252 + 42 bytes |
| [n1556](../Objects.level.bin对象实现清单.html#Night%3An1556) | BstNode_832 | 20%（2/10），运行待验 | 2 / 0 | Night · 244934 + 37 bytes |
| [n1562](../Objects.level.bin对象实现清单.html#Night%3An1562) | BstNode_790 | 20%（2/10），运行待验 | 2 / 0 | Night · 245846 + 37 bytes |
| [n1585](../Objects.level.bin对象实现清单.html#Night%3An1585) | BstNode_871 | 20%（2/10），运行待验 | 2 / 0 | Night · 248529 + 37 bytes |
| [n1705](../Objects.level.bin对象实现清单.html#Night%3An1705) | BstNode_583 | 20%（2/10），运行待验 | 2 / 0 | Night · 267002 + 37 bytes |
| [n1714](../Objects.level.bin对象实现清单.html#Night%3An1714) | BstNode_1116 | 20%（2/10），运行待验 | 2 / 0 | Night · 267733 + 38 bytes |
| [n1719](../Objects.level.bin对象实现清单.html#Night%3An1719) | BstNode_842 | 20%（2/10），运行待验 | 2 / 0 | Night · 268413 + 37 bytes |
| [n1782](../Objects.level.bin对象实现清单.html#Night%3An1782) | BstNode_811 | 20%（2/10），运行待验 | 2 / 0 | Night · 278854 + 37 bytes |
| [n1812](../Objects.level.bin对象实现清单.html#Night%3An1812) | BstNode_807 | 20%（2/10），运行待验 | 2 / 0 | Night · 282491 + 37 bytes |
| [n1835](../Objects.level.bin对象实现清单.html#Night%3An1835) | BstNode_34604572 | 20%（2/10），运行待验 | 2 / 0 | Night · 285971 + 42 bytes |
| [n1888](../Objects.level.bin对象实现清单.html#Night%3An1888) | BstNode_352 | 20%（2/10），运行待验 | 2 / 0 | Night · 292123 + 37 bytes |
| [n2072](../Objects.level.bin对象实现清单.html#Night%3An2072) | BstNode_34604555 | 20%（2/10），运行待验 | 2 / 0 | Night · 329103 + 42 bytes |
| [n2087](../Objects.level.bin对象实现清单.html#Night%3An2087) | BstNode_393 | 20%（2/10），运行待验 | 2 / 0 | Night · 331730 + 37 bytes |
| [n2096](../Objects.level.bin对象实现清单.html#Night%3An2096) | BstNode_565 | 20%（2/10），运行待验 | 2 / 0 | Night · 333050 + 37 bytes |
| [n2130](../Objects.level.bin对象实现清单.html#Night%3An2130) | BstNode_375 | 20%（2/10），运行待验 | 2 / 0 | Night · 338421 + 37 bytes |
| [n2150](../Objects.level.bin对象实现清单.html#Night%3An2150) | BstNode_2444 | 20%（2/10），运行待验 | 2 / 2 | Night · 341152 + 38 bytes |
| [n2163](../Objects.level.bin对象实现清单.html#Night%3An2163) | BstNode_1124 | 20%（2/10），运行待验 | 2 / 0 | Night · 344008 + 38 bytes |
| [n2169](../Objects.level.bin对象实现清单.html#Night%3An2169) | BstNode_1182 | 20%（2/10），运行待验 | 2 / 1 | Night · 344535 + 38 bytes |
| [n2280](../Objects.level.bin对象实现清单.html#Night%3An2280) | BstNode_620 | 20%（2/10），运行待验 | 2 / 0 | Night · 359858 + 37 bytes |
| [n2305](../Objects.level.bin对象实现清单.html#Night%3An2305) | BstNode_1387 | 20%（2/10），运行待验 | 2 / 1 | Night · 362941 + 38 bytes |
| [n2357](../Objects.level.bin对象实现清单.html#Night%3An2357) | BstNode_1365 | 20%（2/10），运行待验 | 2 / 1 | Night · 369565 + 38 bytes |
| [n2451](../Objects.level.bin对象实现清单.html#Night%3An2451) | BstNode_2446917757 | 20%（2/10），运行待验 | 2 / 1 | Night · 384640 + 44 bytes |
| [n2500](../Objects.level.bin对象实现清单.html#Night%3An2500) | BstNode_820 | 20%（2/10），运行待验 | 2 / 0 | Night · 391919 + 37 bytes |
| [n2503](../Objects.level.bin对象实现清单.html#Night%3An2503) | BstNode_34604576 | 20%（2/10），运行待验 | 2 / 0 | Night · 392163 + 42 bytes |
| [n2543](../Objects.level.bin对象实现清单.html#Night%3An2543) | BstNode_34604459 | 20%（2/10），运行待验 | 2 / 1 | Night · 398459 + 42 bytes |
| [n2546](../Objects.level.bin对象实现清单.html#Night%3An2546) | BstNode_34604541 | 20%（2/10），运行待验 | 2 / 0 | Night · 398695 + 42 bytes |
| [n2607](../Objects.level.bin对象实现清单.html#Night%3An2607) | BstNode_1193 | 20%（2/10），运行待验 | 2 / 1 | Night · 407009 + 38 bytes |
| [n2663](../Objects.level.bin对象实现清单.html#Night%3An2663) | BstNode_777 | 20%（2/10），运行待验 | 2 / 0 | Night · 414969 + 37 bytes |
| [n2801](../Objects.level.bin对象实现清单.html#Night%3An2801) | BstNode_523 | 20%（2/10），运行待验 | 2 / 0 | Night · 435233 + 37 bytes |
| [n2802](../Objects.level.bin对象实现清单.html#Night%3An2802) | BstNode_818 | 20%（2/10），运行待验 | 2 / 0 | Night · 435270 + 37 bytes |
| [n2812](../Objects.level.bin对象实现清单.html#Night%3An2812) | BstNode_816 | 20%（2/10），运行待验 | 2 / 0 | Night · 436586 + 37 bytes |
| [n2871](../Objects.level.bin对象实现清单.html#Night%3An2871) | BstNode_1081 | 20%（2/10），运行待验 | 2 / 1 | Night · 446199 + 38 bytes |
| [n2878](../Objects.level.bin对象实现清单.html#Night%3An2878) | BstNode_34604444 | 20%（2/10），运行待验 | 2 / 0 | Night · 447566 + 42 bytes |
| [n2889](../Objects.level.bin对象实现清单.html#Night%3An2889) | BstNode_646 | 20%（2/10），运行待验 | 2 / 1 | Night · 449310 + 37 bytes |
| [n2984](../Objects.level.bin对象实现清单.html#Night%3An2984) | BstNode_692 | 20%（2/10），运行待验 | 2 / 0 | Night · 462923 + 37 bytes |
| [n3017](../Objects.level.bin对象实现清单.html#Night%3An3017) | BstNode_347 | 20%（2/10），运行待验 | 2 / 0 | Night · 469490 + 37 bytes |
| [n3029](../Objects.level.bin对象实现清单.html#Night%3An3029) | BstNode_878 | 20%（2/10），运行待验 | 2 / 1 | Night · 471306 + 37 bytes |
| [n105](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An105) | BstNode_1071 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 46703 + 38 bytes |
| [n147](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An147) | BstNode_965 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 54292 + 37 bytes |
| [n228](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An228) | BstNode_1023 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 72855 + 38 bytes |
| [n232](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An232) | BstNode_1251 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 73747 + 38 bytes |
| [n279](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An279) | BstNode_681 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 85706 + 37 bytes |
| [n415](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An415) | BstNode_1269 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 113242 + 38 bytes |
| [n590](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An590) | BstNode_2060386321 | 20%（2/10），运行待验 | 2 / 0 | Prairie_ButterflyFields · 147278 + 44 bytes |
| [n826](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An826) | BstNode_1267 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 185506 + 38 bytes |
| [n849](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An849) | BstNode_1230 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 187653 + 38 bytes |
| [n879](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An879) | BstNode_1288 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 192190 + 38 bytes |
| [n957](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An957) | BstNode_1316 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 205161 + 38 bytes |
| [n1043](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1043) | BstNode_995 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 226866 + 37 bytes |
| [n1060](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1060) | BstNode_1348 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 230496 + 38 bytes |
| [n1212](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1212) | BstNode_1053 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 262860 + 38 bytes |
| [n1289](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1289) | BstNode_1114 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 279511 + 38 bytes |
| [n1300](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1300) | BstNode_878 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 281638 + 37 bytes |
| [n1353](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1353) | BstNode_934 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 290748 + 37 bytes |
| [n1363](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1363) | BstNode_1157 | 20%（2/10），运行待验 | 2 / 1 | Prairie_ButterflyFields · 292811 + 38 bytes |
| [n96](../Objects.level.bin对象实现清单.html#Prairie_Village%3An96) | BstNode_2409 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 46137 + 38 bytes |
| [n127](../Objects.level.bin对象实现清单.html#Prairie_Village%3An127) | BstNode_1482555544 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 52329 + 44 bytes |
| [n647](../Objects.level.bin对象实现清单.html#Prairie_Village%3An647) | BstNode_1167524009 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 133820 + 44 bytes |
| [n804](../Objects.level.bin对象实现清单.html#Prairie_Village%3An804) | BstNode_2406 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 161077 + 38 bytes |
| [n1797](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1797) | BstNode_553 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 320494 + 37 bytes |
| [n1983](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1983) | BstNode_2345992496 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 353559 + 44 bytes |
| [n2432](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2432) | BstNode_515 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 418773 + 37 bytes |
| [n2439](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2439) | BstNode_2393 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 419643 + 38 bytes |
| [n2516](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2516) | BstNode_2753888377 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 428847 + 44 bytes |
| [n2519](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2519) | BstNode_1167523926 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 429306 + 44 bytes |
| [n2554](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2554) | BstNode_935 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 434253 + 37 bytes |
| [n2626](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2626) | BstNode_2753888382 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 445631 + 44 bytes |
| [n2940](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2940) | BstNode_34604444 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 499331 + 42 bytes |
| [n2966](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2966) | BstNode_1167523981 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 504028 + 44 bytes |
| [n3028](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3028) | BstNode_2753888380 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 514632 + 44 bytes |
| [n3082](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3082) | BstNode_1167523908 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 523301 + 44 bytes |
| [n3084](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3084) | BstNode_1167523995 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 523410 + 44 bytes |
| [n3114](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3114) | BstNode_1482555535 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 528808 + 44 bytes |
| [n828](../Objects.level.bin对象实现清单.html#Rain%3An828) | BstNode_840696281 | 20%（2/10），运行待验 | 2 / 0 | Rain · 215743 + 43 bytes |
| [n898](../Objects.level.bin对象实现清单.html#Rain%3An898) | BstNode_2345992318 | 20%（2/10），运行待验 | 2 / 0 | Rain · 232547 + 44 bytes |
| [n1717](../Objects.level.bin对象实现清单.html#Rain%3An1717) | BstNode_2345992320 | 20%（2/10），运行待验 | 2 / 0 | Rain · 412997 + 44 bytes |
| [n554](../Objects.level.bin对象实现清单.html#RainEnd%3An554) | BstNode_2446917636 | 20%（2/10），运行待验 | 2 / 0 | RainEnd · 163528 + 44 bytes |
| [n759](../Objects.level.bin对象实现清单.html#RainForest%3An759) | BstNode_2446917757 | 20%（2/10），运行待验 | 2 / 1 | RainForest · 175121 + 44 bytes |
| [n1968](../Objects.level.bin对象实现清单.html#RainMid%3An1968) | BstNode_34603111 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 381346 + 42 bytes |
| [n723](../Objects.level.bin对象实现清单.html#SkyHub2%3An723) | BstNode_2060386382 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 165953 + 44 bytes |
| [n1084](../Objects.level.bin对象实现清单.html#SkyHub2%3An1084) | BstNode_3156082713 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 229759 + 44 bytes |
| [n1894](../Objects.level.bin对象实现清单.html#SkyHub2%3An1894) | BstNode_2060386358 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 357666 + 44 bytes |
| [n1556](../Objects.level.bin对象实现清单.html#Storm%3An1556) | BstNode_1047 | 20%（2/10），运行待验 | 2 / 0 | Storm · 297403 + 38 bytes |
| [n486](../Objects.level.bin对象实现清单.html#Sunset%3An486) | BstNode_2446917764 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 116568 + 44 bytes |
| [n896](../Objects.level.bin对象实现清单.html#Sunset%3An896) | BstNode_34603066 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 183084 + 42 bytes |
| [n1137](../Objects.level.bin对象实现清单.html#Sunset%3An1137) | BstNode_2446917757 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 219509 + 44 bytes |
| [n1229](../Objects.level.bin对象实现清单.html#Sunset%3An1229) | BstNode_34603073 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 235140 + 42 bytes |
| [n1343](../Objects.level.bin对象实现清单.html#Sunset%3An1343) | BstNode_34603033 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 253858 + 42 bytes |
| [n299](../Objects.level.bin对象实现清单.html#SunsetEnd%3An299) | BstNode_1785 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd · 81749 + 38 bytes |
| [n334](../Objects.level.bin对象实现清单.html#SunsetEnd%3An334) | BstNode_1167524225 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd · 85708 + 44 bytes |
| [n1560](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1560) | BstNode_1167524231 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd · 292273 + 44 bytes |
| [n1701](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1701) | BstNode_1778 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd · 317532 + 38 bytes |
| [n432](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An432) | BstNode_1167523864 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd2 · 110465 + 44 bytes |
| [n615](../Objects.level.bin对象实现清单.html#SunsetRace%3An615) | BstNode_1167523970 | 20%（2/10），运行待验 | 2 / 0 | SunsetRace · 146401 + 44 bytes |
