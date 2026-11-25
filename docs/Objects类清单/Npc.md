# Npc 单独类功能实现清单

功能分类：NPC 行为与社交。

此类职责：**NPC 模型、动画、装扮与玩家状态**。

类清单进度 30%（3/10），67 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Npc 的原默认值、继承初始化及 23 个序列化字段变体；原注册字段 23 项。
- [ ] NPC 模型、动画、装扮与玩家状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 23 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Npc) · [原字段、进度与全部实例 JSON](Npc.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n300](../Objects.level.bin对象实现清单.html#CandleSpace%3An300) | BstNode_2529559011 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 67086 + 196 bytes |
| [n2713](../Objects.level.bin对象实现清单.html#Dawn%3An2713) | BstNode_1746 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 449756 + 151 bytes |
| [n425](../Objects.level.bin对象实现清单.html#DayEnd%3An425) | BstNode_809 | 20%（2/10），运行待验 | 0 / 3 | DayEnd · 104600 + 223 bytes |
| [n788](../Objects.level.bin对象实现清单.html#DayEnd%3An788) | BstNode_2446917681 | 20%（2/10），运行待验 | 0 / 4 | DayEnd · 173038 + 234 bytes |
| [n1082](../Objects.level.bin对象实现清单.html#DayEnd%3An1082) | BstNode_2446917682 | 20%（2/10），运行待验 | 0 / 4 | DayEnd · 225406 + 229 bytes |
| [n1102](../Objects.level.bin对象实现清单.html#DayEnd%3An1102) | BstNode_808 | 20%（2/10），运行待验 | 0 / 3 | DayEnd · 229187 + 218 bytes |
| [n60](../Objects.level.bin对象实现清单.html#DayHubCave%3An60) | BstNode_1708 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 33088 + 206 bytes |
| [n132](../Objects.level.bin对象实现清单.html#DayHubCave%3An132) | BstNode_2504654851 | 20%（2/10），运行待验 | 0 / 3 | DayHubCave · 45585 + 175 bytes |
| [n164](../Objects.level.bin对象实现清单.html#DayHubCave%3An164) | BstNode_2504654854 | 20%（2/10），运行待验 | 0 / 3 | DayHubCave · 52062 + 177 bytes |
| [n542](../Objects.level.bin对象实现清单.html#DayHubCave%3An542) | BstNode_2446917689 | 20%（2/10），运行待验 | 0 / 5 | DayHubCave · 127213 + 193 bytes |
| [n320](../Objects.level.bin对象实现清单.html#Dusk%3An320) | BstNode_2345992299 | 20%（2/10），运行待验 | 0 / 3 | Dusk · 81215 + 169 bytes |
| [n536](../Objects.level.bin对象实现清单.html#Dusk%3An536) | BstNode_1842 | 20%（2/10），运行待验 | 0 / 3 | Dusk · 124537 + 197 bytes |
| [n1346](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1346) | BstNode_2345992766 | 20%（2/10），运行待验 | 0 / 3 | DuskGraveyard · 333531 + 179 bytes |
| [n584](../Objects.level.bin对象实现清单.html#DuskMid%3An584) | BstNode_2345992388 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 125986 + 194 bytes |
| [n884](../Objects.level.bin对象实现清单.html#DuskMid%3An884) | BstNode_2345992436 | 20%（2/10），运行待验 | 0 / 3 | DuskMid · 189917 + 244 bytes |
| [n560](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An560) | BstNode_1842 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 141345 + 199 bytes |
| [n95](../Objects.level.bin对象实现清单.html#HubReveal%3An95) | BstNode_3156082741 | 20%（2/10），运行待验 | 0 / 4 | HubReveal · 45936 + 198 bytes |
| [n626](../Objects.level.bin对象实现清单.html#HubReveal%3An626) | BstNode_2529559046 | 20%（2/10），运行待验 | 0 / 3 | HubReveal · 135824 + 191 bytes |
| [n832](../Objects.level.bin对象实现清单.html#HubReveal%3An832) | BstNode_3156082742 | 20%（2/10），运行待验 | 0 / 4 | HubReveal · 169106 + 198 bytes |
| [n1056](../Objects.level.bin对象实现清单.html#HubReveal%3An1056) | BstNode_2504654869 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 206222 + 198 bytes |
| [n1331](../Objects.level.bin对象实现清单.html#HubReveal%3An1331) | BstNode_2612 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 255164 + 192 bytes |
| [n298](../Objects.level.bin对象实现清单.html#Night%3An298) | BstNode_34603573 | 20%（2/10），运行待验 | 0 / 2 | Night · 66824 + 182 bytes |
| [n404](../Objects.level.bin对象实现清单.html#Night%3An404) | BstNode_2345992299 | 20%（2/10），运行待验 | 0 / 2 | Night · 82936 + 184 bytes |
| [n435](../Objects.level.bin对象实现清单.html#Night%3An435) | BstNode_34604512 | 20%（2/10），运行待验 | 0 / 2 | Night · 88243 + 182 bytes |
| [n646](../Objects.level.bin对象实现清单.html#Night%3An646) | BstNode_2446917678 | 20%（2/10），运行待验 | 0 / 2 | Night · 119751 + 225 bytes |
| [n2159](../Objects.level.bin对象实现清单.html#Night%3An2159) | BstNode_34603992 | 20%（2/10），运行待验 | 0 / 2 | Night · 342923 + 182 bytes |
| [n17](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An17) | BstNode_3122856000 | 20%（2/10），运行待验 | 0 / 2 | Prairie_ButterflyFields · 27765 + 214 bytes |
| [n817](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An817) | BstNode_1708 | 20%（2/10），运行待验 | 0 / 3 | Prairie_ButterflyFields · 183550 + 189 bytes |
| [n228](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An228) | BstNode_2504654946 | 20%（2/10），运行待验 | 0 / 13 | Prairie_Cave · 75572 + 187 bytes |
| [n787](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An787) | BstNode_2612 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Cave · 206251 + 192 bytes |
| [n807](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An807) | BstNode_2504654952 | 20%（2/10），运行待验 | 0 / 6 | Prairie_Cave · 210530 + 170 bytes |
| [n347](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An347) | BstNode_2504654991 | 20%（2/10），运行待验 | 0 / 8 | Prairie_NestAndKeeper · 101174 + 185 bytes |
| [n820](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An820) | BstNode_2504654992 | 20%（2/10），运行待验 | 0 / 8 | Prairie_NestAndKeeper · 203962 + 168 bytes |
| [n947](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An947) | BstNode_656801795 | 20%（2/10），运行待验 | 0 / 5 | Prairie_NestAndKeeper · 230932 + 189 bytes |
| [n351](../Objects.level.bin对象实现清单.html#Prairie_Village%3An351) | BstNode_2504655005 | 20%（2/10），运行待验 | 0 / 8 | Prairie_Village · 86273 + 183 bytes |
| [n971](../Objects.level.bin对象实现清单.html#Prairie_Village%3An971) | BstNode_1528234014 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 190420 + 171 bytes |
| [n1356](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1356) | BstNode_1842806838 | 20%（2/10），运行待验 | 0 / 5 | Prairie_Village · 249233 + 191 bytes |
| [n1528](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1528) | BstNode_1842806806 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Village · 274274 + 174 bytes |
| [n2396](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2396) | BstNode_2504655065 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Village · 412933 + 183 bytes |
| [n2427](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2427) | BstNode_2504654876 | 20%（2/10），运行待验 | 0 / 9 | Prairie_Village · 418028 + 186 bytes |
| [n2617](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2617) | BstNode_656801846 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 443777 + 187 bytes |
| [n446](../Objects.level.bin对象实现清单.html#Rain%3An446) | BstNode_2446917678 | 20%（2/10），运行待验 | 0 / 2 | Rain · 128649 + 231 bytes |
| [n1003](../Objects.level.bin对象实现清单.html#Rain%3An1003) | BstNode_2345992342 | 20%（2/10），运行待验 | 0 / 2 | Rain · 254783 + 230 bytes |
| [n1009](../Objects.level.bin对象实现清单.html#Rain%3An1009) | BstNode_2345992882 | 20%（2/10），运行待验 | 0 / 2 | Rain · 255685 + 171 bytes |
| [n1041](../Objects.level.bin对象实现清单.html#Rain%3An1041) | BstNode_2345992339 | 20%（2/10），运行待验 | 0 / 5 | Rain · 262860 + 262 bytes |
| [n675](../Objects.level.bin对象实现清单.html#RainEnd%3An675) | BstNode_2345992606 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 192082 + 181 bytes |
| [n162](../Objects.level.bin对象实现清单.html#RainForest%3An162) | BstNode_34603154 | 20%（2/10），运行待验 | 0 / 4 | RainForest · 53074 + 223 bytes |
| [n742](../Objects.level.bin对象实现清单.html#RainForest%3An742) | BstNode_2345992436 | 20%（2/10），运行待验 | 0 / 2 | RainForest · 171322 + 210 bytes |
| [n816](../Objects.level.bin对象实现清单.html#RainForest%3An816) | BstNode_2345992433 | 20%（2/10），运行待验 | 0 / 2 | RainForest · 187280 + 213 bytes |
| [n38](../Objects.level.bin对象实现清单.html#RainMid%3An38) | BstNode_1609 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 33901 + 189 bytes |
| [n369](../Objects.level.bin对象实现清单.html#RainMid%3An369) | BstNode_1846 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 95695 + 166 bytes |
| [n606](../Objects.level.bin对象实现清单.html#RainMid%3An606) | BstNode_2345992860 | 20%（2/10），运行待验 | 0 / 3 | RainMid · 140818 + 230 bytes |
| [n1591](../Objects.level.bin对象实现清单.html#RainMid%3An1591) | BstNode_1757 | 20%（2/10），运行待验 | 0 / 3 | RainMid · 319529 + 196 bytes |
| [n766](../Objects.level.bin对象实现清单.html#SkyHub2%3An766) | BstNode_2504654849 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 173142 + 196 bytes |
| [n918](../Objects.level.bin对象实现清单.html#SkyHub2%3An918) | BstNode_2529558599 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 200733 + 167 bytes |
| [n1395](../Objects.level.bin对象实现清单.html#SkyHub2%3An1395) | BstNode_1167524183 | 20%（2/10），运行待验 | 0 / 38 | SkyHub2 · 276693 + 246 bytes |
| [n1625](../Objects.level.bin对象实现清单.html#SkyHub2%3An1625) | BstNode_1167524201 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 313238 + 195 bytes |
| [n2062](../Objects.level.bin对象实现清单.html#SkyHub2%3An2062) | BstNode_2504654869 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 388726 + 222 bytes |
| [n620](../Objects.level.bin对象实现清单.html#StormEnd%3An620) | BstNode_2446917729 | 20%（2/10），运行待验 | 0 / 10 | StormEnd · 129006 + 170 bytes |
| [n1297](../Objects.level.bin对象实现清单.html#Sunset%3An1297) | BstNode_1167524229 | 20%（2/10），运行待验 | 0 / 2 | Sunset · 246096 + 227 bytes |
| [n1393](../Objects.level.bin对象实现清单.html#Sunset%3An1393) | BstNode_2345992436 | 20%（2/10），运行待验 | 0 / 3 | Sunset · 260624 + 169 bytes |
| [n456](../Objects.level.bin对象实现清单.html#SunsetEnd%3An456) | BstNode_2504654856 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 105182 + 227 bytes |
| [n564](../Objects.level.bin对象实现清单.html#SunsetEnd%3An564) | BstNode_1167524181 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 122881 + 192 bytes |
| [n1163](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1163) | BstNode_1708 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 217499 + 221 bytes |
| [n1465](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1465) | BstNode_2345992436 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 274408 + 169 bytes |
| [n1793](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1793) | BstNode_2504654855 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 338810 + 227 bytes |
| [n99](../Objects.level.bin对象实现清单.html#TitleWater%3An99) | BstNode_1528234046 | 20%（2/10），运行待验 | 0 / 1 | TitleWater · 29070 + 221 bytes |
