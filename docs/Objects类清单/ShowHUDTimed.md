# ShowHUDTimed 单独类功能实现清单

功能分类：按钮、文字与菜单。

此类职责：**HUD 纹理、图层、时长与过渡**。

类清单进度 30%（3/10），73 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：ShowHUDTimed 的原默认值、继承初始化及 16 个序列化字段变体；原注册字段 15 项。
- [ ] HUD 纹理、图层、时长与过渡：73 个节点和字段已清点；原纹理、持续时间、图层、淡入淡出和摄像机/玩家事件待恢复。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 15 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

73 个节点和字段已清点；原纹理、持续时间、图层、淡入淡出和摄像机/玩家事件待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=ShowHUDTimed) · [原字段、进度与全部实例 JSON](ShowHUDTimed.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n121](../Objects.level.bin对象实现清单.html#CandleSpace%3An121) | BstNode_2446917750 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 39283 + 92 bytes |
| [n435](../Objects.level.bin对象实现清单.html#CandleSpace%3An435) | BstNode_1782 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 87415 + 86 bytes |
| [n40](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An40) | BstNode_2504654867 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 22965 + 92 bytes |
| [n237](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An237) | BstNode_2504654866 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 61670 + 92 bytes |
| [n485](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An485) | BstNode_757399606 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 103803 + 91 bytes |
| [n574](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An574) | BstNode_2529558619 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 114698 + 92 bytes |
| [n597](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An597) | BstNode_3156082697 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 117138 + 91 bytes |
| [n1942](../Objects.level.bin对象实现清单.html#Dawn%3An1942) | BstNode_1765 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 319104 + 86 bytes |
| [n2513](../Objects.level.bin对象实现清单.html#Dawn%3An2513) | BstNode_869 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 419901 + 85 bytes |
| [n2714](../Objects.level.bin对象实现清单.html#Dawn%3An2714) | BstNode_2446917763 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 449907 + 92 bytes |
| [n2864](../Objects.level.bin对象实现清单.html#Dawn%3An2864) | BstNode_3156082744 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 470145 + 92 bytes |
| [n2912](../Objects.level.bin对象实现清单.html#Dawn%3An2912) | BstNode_1842806791 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 476716 + 92 bytes |
| [n74](../Objects.level.bin对象实现清单.html#DayEnd%3An74) | BstNode_814 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 37441 + 86 bytes |
| [n113](../Objects.level.bin对象实现清单.html#DayEnd%3An113) | BstNode_1167523901 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 46760 + 92 bytes |
| [n338](../Objects.level.bin对象实现清单.html#DayEnd%3An338) | BstNode_109 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 87578 + 85 bytes |
| [n926](../Objects.level.bin对象实现清单.html#DayEnd%3An926) | BstNode_67 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 198892 + 84 bytes |
| [n937](../Objects.level.bin对象实现清单.html#DayEnd%3An937) | BstNode_819 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 201240 + 85 bytes |
| [n1247](../Objects.level.bin对象实现清单.html#DayEnd%3An1247) | BstNode_437 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 259242 + 85 bytes |
| [n199](../Objects.level.bin对象实现清单.html#DayHubCave%3An199) | BstNode_3156082793 | 20%（2/10），运行待验 | 0 / 2 | DayHubCave · 57942 + 92 bytes |
| [n96](../Objects.level.bin对象实现清单.html#Dusk%3An96) | BstNode_1167523901 | 20%（2/10），运行待验 | 0 / 2 | Dusk · 40032 + 92 bytes |
| [n215](../Objects.level.bin对象实现清单.html#Dusk%3An215) | BstNode_2345992630 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 64447 + 92 bytes |
| [n309](../Objects.level.bin对象实现清单.html#Dusk%3An309) | BstNode_2345992634 | 20%（2/10），运行待验 | 0 / 2 | Dusk · 79383 + 92 bytes |
| [n98](../Objects.level.bin对象实现清单.html#DuskMid%3An98) | BstNode_2345992796 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 37715 + 92 bytes |
| [n177](../Objects.level.bin对象实现清单.html#DuskMid%3An177) | BstNode_2345992616 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 50682 + 92 bytes |
| [n1031](../Objects.level.bin对象实现清单.html#DuskMid%3An1031) | BstNode_2345992632 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 218005 + 92 bytes |
| [n216](../Objects.level.bin对象实现清单.html#HubReveal%3An216) | BstNode_1167523869 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 67380 + 92 bytes |
| [n688](../Objects.level.bin对象实现清单.html#HubReveal%3An688) | BstNode_1167523873 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 145272 + 92 bytes |
| [n693](../Objects.level.bin对象实现清单.html#HubReveal%3An693) | BstNode_1167523857 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 145895 + 92 bytes |
| [n1119](../Objects.level.bin对象实现清单.html#HubReveal%3An1119) | BstNode_2446917761 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 217864 + 92 bytes |
| [n1237](../Objects.level.bin对象实现清单.html#HubReveal%3An1237) | BstNode_1167523894 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 240059 + 92 bytes |
| [n1432](../Objects.level.bin对象实现清单.html#HubReveal%3An1432) | BstNode_1167523858 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 270873 + 92 bytes |
| [n1370](../Objects.level.bin对象实现清单.html#Night%3An1370) | BstNode_1167523901 | 20%（2/10），运行待验 | 0 / 2 | Night · 223359 + 92 bytes |
| [n440](../Objects.level.bin对象实现清单.html#NightEnd%3An440) | BstNode_2504654849 | 20%（2/10），运行待验 | 0 / 3 | NightEnd · 97328 + 92 bytes |
| [n754](../Objects.level.bin对象实现清单.html#NightEnd%3An754) | BstNode_2504654881 | 20%（2/10），运行待验 | 0 / 3 | NightEnd · 145685 + 92 bytes |
| [n776](../Objects.level.bin对象实现清单.html#NightEnd%3An776) | BstNode_86 | 20%（2/10），运行待验 | 0 / 2 | NightEnd · 148481 + 84 bytes |
| [n58](../Objects.level.bin对象实现清单.html#NightEntrance%3An58) | BstNode_2279669773 | 20%（2/10），运行待验 | 0 / 2 | NightEntrance · 24587 + 92 bytes |
| [n81](../Objects.level.bin对象实现清单.html#NightEntrance%3An81) | BstNode_2279669772 | 20%（2/10），运行待验 | 0 / 2 | NightEntrance · 28457 + 92 bytes |
| [n125](../Objects.level.bin对象实现清单.html#NightEntrance%3An125) | BstNode_2279669769 | 20%（2/10），运行待验 | 0 / 2 | NightEntrance · 35966 + 92 bytes |
| [n154](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An154) | BstNode_2504654988 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Cave · 59511 + 92 bytes |
| [n280](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An280) | BstNode_2504654949 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Cave · 87787 + 92 bytes |
| [n246](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An246) | BstNode_656801797 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 78537 + 91 bytes |
| [n314](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An314) | BstNode_2504655003 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 93664 + 92 bytes |
| [n639](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An639) | BstNode_2504655002 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 158203 + 92 bytes |
| [n711](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An711) | BstNode_656801800 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 176598 + 91 bytes |
| [n631](../Objects.level.bin对象实现清单.html#Prairie_Village%3An631) | BstNode_2504654890 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 132042 + 92 bytes |
| [n972](../Objects.level.bin对象实现清单.html#Prairie_Village%3An972) | BstNode_656801795 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 190591 + 91 bytes |
| [n978](../Objects.level.bin对象实现清单.html#Prairie_Village%3An978) | BstNode_2504654859 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 191075 + 92 bytes |
| [n1193](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1193) | BstNode_1842806841 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 223505 + 92 bytes |
| [n1305](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1305) | BstNode_2504655084 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 241420 + 92 bytes |
| [n1306](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1306) | BstNode_656801796 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 241512 + 91 bytes |
| [n1351](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1351) | BstNode_656801845 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 248567 + 91 bytes |
| [n1426](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1426) | BstNode_2504655085 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 260396 + 92 bytes |
| [n2140](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2140) | BstNode_2382 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 375040 + 86 bytes |
| [n2191](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2191) | BstNode_2381 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 382550 + 86 bytes |
| [n2343](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2343) | BstNode_2380 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 403912 + 86 bytes |
| [n377](../Objects.level.bin对象实现清单.html#Rain%3An377) | BstNode_1167523906 | 20%（2/10），运行待验 | 0 / 2 | Rain · 112437 + 92 bytes |
| [n608](../Objects.level.bin对象实现清单.html#RainEnd%3An608) | BstNode_468 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 177156 + 85 bytes |
| [n691](../Objects.level.bin对象实现清单.html#RainEnd%3An691) | BstNode_530 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 196168 + 85 bytes |
| [n1427](../Objects.level.bin对象实现清单.html#RainMid%3An1427) | BstNode_704 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 287038 + 85 bytes |
| [n577](../Objects.level.bin对象实现清单.html#SkyHub2%3An577) | BstNode_1167524246 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 139822 + 92 bytes |
| [n1667](../Objects.level.bin对象实现清单.html#SkyHub2%3An1667) | BstNode_2446917743 | 20%（2/10），运行待验 | 0 / 12 | SkyHub2 · 320090 + 92 bytes |
| [n573](../Objects.level.bin对象实现清单.html#StormEnd%3An573) | BstNode_3156082754 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 123019 + 92 bytes |
| [n797](../Objects.level.bin对象实现清单.html#StormEnd%3An797) | BstNode_2529559331 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 154857 + 92 bytes |
| [n1019](../Objects.level.bin对象实现清单.html#Sunset%3An1019) | BstNode_1167523983 | 20%（2/10），运行待验 | 0 / 2 | Sunset · 200517 + 92 bytes |
| [n1636](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1636) | BstNode_1167524141 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 306896 + 92 bytes |
| [n42](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An42) | BstNode_824 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 29712 + 85 bytes |
| [n122](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An122) | BstNode_1167523865 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd2 · 47442 + 92 bytes |
| [n340](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An340) | BstNode_2446917663 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 92716 + 92 bytes |
| [n658](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An658) | BstNode_2087 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 165840 + 86 bytes |
| [n1482](../Objects.level.bin对象实现清单.html#SunsetRace%3An1482) | BstNode_1167523972 | 20%（2/10），运行待验 | 0 / 2 | SunsetRace · 301943 + 92 bytes |
| [n19](../Objects.level.bin对象实现清单.html#TitleWater%3An19) | BstNode_63 | 20%（2/10），运行待验 | 0 / 0 | TitleWater · 18808 + 88 bytes |
| [n48](../Objects.level.bin对象实现清单.html#TitleWater%3An48) | BstNode_12 | 20%（2/10），运行待验 | 0 / 0 | TitleWater · 23264 + 85 bytes |
| [n111](../Objects.level.bin对象实现清单.html#TitleWater%3An111) | BstNode_45 | 20%（2/10），运行待验 | 0 / 1 | TitleWater · 30554 + 88 bytes |
