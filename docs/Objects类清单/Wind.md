# Wind 单独类功能实现清单

功能分类：云、风场与环境。

此类职责：**区域、轨道与附加标记的风场**。

类清单进度 40%（4/10），120 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：Wind 的原默认值、继承初始化及 12 个序列化字段变体；原注册字段 12 项。
- [ ] 区域、轨道与附加标记的风场（部分完成）：范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。
- [ ] 依赖调用与事件：Rail（26 条引用）、Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。
- [x] 明确范围的原核心子链已独立核验：范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Wind) · [原字段、进度与全部实例 JSON](Wind.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n293](../Objects.level.bin对象实现清单.html#Dawn%3An293) | BstNode_2279669794 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 79353 + 122 bytes |
| [n343](../Objects.level.bin对象实现清单.html#Dawn%3An343) | BstNode_3156082693 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 85977 + 122 bytes |
| [n550](../Objects.level.bin对象实现清单.html#Dawn%3An550) | BstNode_3156082737 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 118325 + 122 bytes |
| [n998](../Objects.level.bin对象实现清单.html#Dawn%3An998) | BstNode_1293287631 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 188774 + 122 bytes |
| [n1334](../Objects.level.bin对象实现清单.html#Dawn%3An1334) | BstNode_3122856883 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 239703 + 122 bytes |
| [n1521](../Objects.level.bin对象实现清单.html#Dawn%3An1521) | BstNode_1855 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 266418 + 116 bytes |
| [n2049](../Objects.level.bin对象实现清单.html#Dawn%3An2049) | BstNode_3122856246 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 335758 + 122 bytes |
| [n734](../Objects.level.bin对象实现清单.html#DayEnd%3An734) | BstNode_629 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 161017 + 115 bytes |
| [n764](../Objects.level.bin对象实现清单.html#DayEnd%3An764) | BstNode_840695844 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 168466 + 121 bytes |
| [n821](../Objects.level.bin对象实现清单.html#DayEnd%3An821) | BstNode_596 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 179494 + 115 bytes |
| [n27](../Objects.level.bin对象实现清单.html#Dusk%3An27) | BstNode_2345992604 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 28187 + 137 bytes |
| [n173](../Objects.level.bin对象实现清单.html#Dusk%3An173) | BstNode_2279669785 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 55348 + 122 bytes |
| [n271](../Objects.level.bin对象实现清单.html#Dusk%3An271) | BstNode_2345992375 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 73602 + 137 bytes |
| [n298](../Objects.level.bin对象实现清单.html#Dusk%3An298) | BstNode_2345992258 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 77452 + 137 bytes |
| [n831](../Objects.level.bin对象实现清单.html#Dusk%3An831) | BstNode_2345992368 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 174196 + 137 bytes |
| [n1060](../Objects.level.bin对象实现清单.html#Dusk%3An1060) | BstNode_2345992590 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 216435 + 137 bytes |
| [n1138](../Objects.level.bin对象实现清单.html#Dusk%3An1138) | BstNode_2345992574 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 232829 + 137 bytes |
| [n760](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An760) | BstNode_2345992924 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 198775 + 122 bytes |
| [n1335](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1335) | BstNode_2345992923 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 331144 + 122 bytes |
| [n38](../Objects.level.bin对象实现清单.html#DuskMid%3An38) | BstNode_2345992228 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 27330 + 132 bytes |
| [n167](../Objects.level.bin对象实现清单.html#DuskMid%3An167) | BstNode_2345992214 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 49056 + 132 bytes |
| [n173](../Objects.level.bin对象实现清单.html#DuskMid%3An173) | BstNode_2345992223 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 49622 + 132 bytes |
| [n381](../Objects.level.bin对象实现清单.html#DuskMid%3An381) | BstNode_143 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 87809 + 125 bytes |
| [n450](../Objects.level.bin对象实现清单.html#DuskMid%3An450) | BstNode_2345992229 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 100097 + 132 bytes |
| [n492](../Objects.level.bin对象实现清单.html#DuskMid%3An492) | BstNode_2345992225 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 108816 + 132 bytes |
| [n583](../Objects.level.bin对象实现清单.html#DuskMid%3An583) | BstNode_2345992222 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 125854 + 132 bytes |
| [n649](../Objects.level.bin对象实现清单.html#DuskMid%3An649) | BstNode_2345992215 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 138439 + 132 bytes |
| [n652](../Objects.level.bin对象实现清单.html#DuskMid%3An652) | BstNode_2345992226 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 139112 + 132 bytes |
| [n653](../Objects.level.bin对象实现清单.html#DuskMid%3An653) | BstNode_2345992230 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 139244 + 132 bytes |
| [n655](../Objects.level.bin对象实现清单.html#DuskMid%3An655) | BstNode_2345992224 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 139534 + 132 bytes |
| [n658](../Objects.level.bin对象实现清单.html#DuskMid%3An658) | BstNode_2345992231 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 140154 + 132 bytes |
| [n846](../Objects.level.bin对象实现清单.html#DuskMid%3An846) | BstNode_2345992227 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 182244 + 132 bytes |
| [n867](../Objects.level.bin对象实现清单.html#DuskMid%3An867) | BstNode_2345992221 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 186302 + 132 bytes |
| [n970](../Objects.level.bin对象实现清单.html#DuskMid%3An970) | BstNode_136 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 206636 + 125 bytes |
| [n981](../Objects.level.bin对象实现清单.html#DuskMid%3An981) | BstNode_139 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 209332 + 125 bytes |
| [n1062](../Objects.level.bin对象实现清单.html#DuskMid%3An1062) | BstNode_142 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 221913 + 125 bytes |
| [n585](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An585) | BstNode_2345992590 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 146746 + 137 bytes |
| [n875](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An875) | BstNode_2345992604 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 216881 + 137 bytes |
| [n1060](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1060) | BstNode_2345992258 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 257432 + 137 bytes |
| [n257](../Objects.level.bin对象实现清单.html#HubReveal%3An257) | BstNode_2446917809 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 72898 + 122 bytes |
| [n457](../Objects.level.bin对象实现清单.html#HubReveal%3An457) | BstNode_2446917739 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 108883 + 122 bytes |
| [n600](../Objects.level.bin对象实现清单.html#HubReveal%3An600) | BstNode_3156082717 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 131111 + 122 bytes |
| [n784](../Objects.level.bin对象实现清单.html#HubReveal%3An784) | BstNode_2446917786 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 160550 + 122 bytes |
| [n1054](../Objects.level.bin对象实现清单.html#HubReveal%3An1054) | BstNode_3156082689 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 206035 + 122 bytes |
| [n1268](../Objects.level.bin对象实现清单.html#HubReveal%3An1268) | BstNode_3156082752 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 245300 + 122 bytes |
| [n1275](../Objects.level.bin对象实现清单.html#HubReveal%3An1275) | BstNode_3156082720 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 246482 + 122 bytes |
| [n1372](../Objects.level.bin对象实现清单.html#HubReveal%3An1372) | BstNode_3156082719 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 259983 + 122 bytes |
| [n716](../Objects.level.bin对象实现清单.html#NightEnd%3An716) | BstNode_34603107 | 20%（2/10），运行待验 | 0 / 0 | NightEnd · 140780 + 120 bytes |
| [n426](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An426) | BstNode_1842806848 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 115774 + 122 bytes |
| [n563](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An563) | BstNode_2446917936 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 144439 + 122 bytes |
| [n1356](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1356) | BstNode_3122856086 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 291235 + 122 bytes |
| [n1215](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1215) | BstNode_3122856154 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 303229 + 122 bytes |
| [n1594](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1594) | BstNode_3122855970 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 404000 + 122 bytes |
| [n271](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An271) | BstNode_34603058 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 83724 + 120 bytes |
| [n399](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An399) | BstNode_2446917936 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 113087 + 122 bytes |
| [n495](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An495) | BstNode_34603052 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 128812 + 120 bytes |
| [n806](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An806) | BstNode_34603059 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 201277 + 120 bytes |
| [n891](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An891) | BstNode_34603099 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 220588 + 120 bytes |
| [n124](../Objects.level.bin对象实现清单.html#Prairie_Village%3An124) | BstNode_1167524034 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 52041 + 122 bytes |
| [n1124](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1124) | BstNode_1167524113 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 214618 + 122 bytes |
| [n1133](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1133) | BstNode_2446917935 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 216094 + 122 bytes |
| [n1283](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1283) | BstNode_1167524029 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 238014 + 122 bytes |
| [n1942](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1942) | BstNode_1167524031 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 345910 + 122 bytes |
| [n1947](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1947) | BstNode_1167524024 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 346645 + 122 bytes |
| [n2008](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2008) | BstNode_1163 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 356764 + 123 bytes |
| [n2496](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2496) | BstNode_3156082760 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 426387 + 122 bytes |
| [n2522](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2522) | BstNode_1167524036 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 429476 + 122 bytes |
| [n96](../Objects.level.bin对象实现清单.html#Rain%3An96) | BstNode_840696222 | 20%（2/10），运行待验 | 0 / 0 | Rain · 50162 + 121 bytes |
| [n809](../Objects.level.bin对象实现清单.html#Rain%3An809) | BstNode_840696118 | 20%（2/10），运行待验 | 1 / 0 | Rain · 209697 + 121 bytes |
| [n1541](../Objects.level.bin对象实现清单.html#RainEnd%3An1541) | BstNode_774 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 391995 + 115 bytes |
| [n0](../Objects.level.bin对象实现清单.html#RainForest%3An0) | BstNode_2345992273 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 21235 + 122 bytes |
| [n696](../Objects.level.bin对象实现清单.html#RainForest%3An696) | BstNode_2345992279 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 159900 + 122 bytes |
| [n491](../Objects.level.bin对象实现清单.html#RainMid%3An491) | BstNode_2345993019 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 118485 + 122 bytes |
| [n556](../Objects.level.bin对象实现清单.html#RainMid%3An556) | BstNode_2345993005 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 129773 + 122 bytes |
| [n1251](../Objects.level.bin对象实现清单.html#RainMid%3An1251) | BstNode_2345992983 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 255614 + 122 bytes |
| [n1720](../Objects.level.bin对象实现清单.html#RainMid%3An1720) | BstNode_2345993129 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 342328 + 122 bytes |
| [n213](../Objects.level.bin对象实现清单.html#SkyHub2%3An213) | BstNode_2446917798 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 71840 + 122 bytes |
| [n522](../Objects.level.bin对象实现清单.html#SkyHub2%3An522) | BstNode_1167524366 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 131025 + 122 bytes |
| [n775](../Objects.level.bin对象实现清单.html#SkyHub2%3An775) | BstNode_1167523923 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 174298 + 122 bytes |
| [n1225](../Objects.level.bin对象实现清单.html#SkyHub2%3An1225) | BstNode_2446917805 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 255056 + 122 bytes |
| [n1306](../Objects.level.bin对象实现清单.html#SkyHub2%3An1306) | BstNode_2446917796 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 266257 + 122 bytes |
| [n1361](../Objects.level.bin对象实现清单.html#SkyHub2%3An1361) | BstNode_1167524365 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 272745 + 122 bytes |
| [n1699](../Objects.level.bin对象实现清单.html#SkyHub2%3An1699) | BstNode_1167523999 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 323107 + 122 bytes |
| [n1760](../Objects.level.bin对象实现清单.html#SkyHub2%3An1760) | BstNode_2279670115 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 333036 + 122 bytes |
| [n2015](../Objects.level.bin对象实现清单.html#SkyHub2%3An2015) | BstNode_1167524367 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 379818 + 122 bytes |
| [n2128](../Objects.level.bin对象实现清单.html#SkyHub2%3An2128) | BstNode_2446917648 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 400273 + 122 bytes |
| [n0](../Objects.level.bin对象实现清单.html#Storm%3An0) | BstNode_2529559767 | 20%（2/10），运行待验 | 1 / 0 | Storm · 23424 + 122 bytes |
| [n333](../Objects.level.bin对象实现清单.html#Storm%3An333) | BstNode_2529558589 | 20%（2/10），运行待验 | 0 / 1 | Storm · 82307 + 122 bytes |
| [n770](../Objects.level.bin对象实现清单.html#Storm%3An770) | BstNode_2529558783 | 20%（2/10），运行待验 | 1 / 0 | Storm · 161094 + 122 bytes |
| [n1419](../Objects.level.bin对象实现清单.html#Storm%3An1419) | BstNode_304 | 20%（2/10），运行待验 | 0 / 1 | Storm · 274930 + 115 bytes |
| [n1425](../Objects.level.bin对象实现清单.html#Storm%3An1425) | BstNode_2529559543 | 20%（2/10），运行待验 | 0 / 0 | Storm · 276023 + 122 bytes |
| [n1547](../Objects.level.bin对象实现清单.html#Storm%3An1547) | BstNode_2529558560 | 20%（2/10），运行待验 | 1 / 0 | Storm · 295725 + 122 bytes |
| [n99](../Objects.level.bin对象实现清单.html#StormEnd%3An99) | BstNode_2345992494 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 38670 + 122 bytes |
| [n104](../Objects.level.bin对象实现清单.html#StormEnd%3An104) | BstNode_3156082696 | 20%（2/10），运行待验 | 0 / 1 | StormEnd · 39093 + 122 bytes |
| [n181](../Objects.level.bin对象实现清单.html#StormEnd%3An181) | BstNode_2529558589 | 20%（2/10），运行待验 | 0 / 1 | StormEnd · 51913 + 122 bytes |
| [n394](../Objects.level.bin对象实现清单.html#StormEnd%3An394) | BstNode_2345992637 | 20%（2/10），运行待验 | 0 / 1 | StormEnd · 92135 + 122 bytes |
| [n572](../Objects.level.bin对象实现清单.html#StormEnd%3An572) | BstNode_2446917906 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 122897 + 122 bytes |
| [n655](../Objects.level.bin对象实现清单.html#StormEnd%3An655) | BstNode_2446917905 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 133778 + 122 bytes |
| [n1067](../Objects.level.bin对象实现清单.html#StormEnd%3An1067) | BstNode_3156082695 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 204124 + 122 bytes |
| [n588](../Objects.level.bin对象实现清单.html#Sunset%3An588) | BstNode_1482555573 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 132057 + 122 bytes |
| [n1510](../Objects.level.bin对象实现清单.html#Sunset%3An1510) | BstNode_222 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 280182 + 115 bytes |
| [n1653](../Objects.level.bin对象实现清单.html#Sunset%3An1653) | BstNode_1482555586 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 304059 + 122 bytes |
| [n205](../Objects.level.bin对象实现清单.html#SunsetEnd%3An205) | BstNode_2279669913 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 64377 + 122 bytes |
| [n293](../Objects.level.bin对象实现清单.html#SunsetEnd%3An293) | BstNode_2279669895 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 81209 + 122 bytes |
| [n650](../Objects.level.bin对象实现清单.html#SunsetEnd%3An650) | BstNode_1167523871 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 134351 + 122 bytes |
| [n835](../Objects.level.bin对象实现清单.html#SunsetEnd%3An835) | BstNode_2279669896 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 166232 + 122 bytes |
| [n869](../Objects.level.bin对象实现清单.html#SunsetEnd%3An869) | BstNode_2345992215 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 171172 + 122 bytes |
| [n885](../Objects.level.bin对象实现清单.html#SunsetEnd%3An885) | BstNode_2279669948 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 173763 + 122 bytes |
| [n959](../Objects.level.bin对象实现清单.html#SunsetEnd%3An959) | BstNode_1167523921 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 186450 + 122 bytes |
| [n1662](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1662) | BstNode_1167523989 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 311571 + 122 bytes |
| [n1833](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1833) | BstNode_1167524168 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 346809 + 122 bytes |
| [n50](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An50) | BstNode_2345992215 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 32111 + 122 bytes |
| [n78](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An78) | BstNode_2279669948 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 37169 + 122 bytes |
| [n183](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An183) | BstNode_2279669913 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 58225 + 122 bytes |
| [n388](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An388) | BstNode_2279669896 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 102054 + 122 bytes |
| [n721](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An721) | BstNode_2279669895 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 178389 + 122 bytes |
| [n143](../Objects.level.bin对象实现清单.html#SunsetRace%3An143) | BstNode_1167523851 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 47840 + 122 bytes |
| [n154](../Objects.level.bin对象实现清单.html#SunsetRace%3An154) | BstNode_1167523852 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 49869 + 122 bytes |
| [n385](../Objects.level.bin对象实现清单.html#SunsetRace%3An385) | BstNode_1167523885 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 98895 + 122 bytes |
| [n1371](../Objects.level.bin对象实现清单.html#SunsetRace%3An1371) | BstNode_222 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 280783 + 115 bytes |
