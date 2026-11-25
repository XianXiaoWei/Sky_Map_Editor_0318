# PlaySound2D 单独类功能实现清单

功能分类：声音、音乐与混音。

此类职责：**二维声音播放**。

类清单进度 40%（4/10），109 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：PlaySound2D 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 二维声音播放（部分完成）：完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=PlaySound2D) · [原字段、进度与全部实例 JSON](PlaySound2D.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n26](../Objects.level.bin对象实现清单.html#CandleSpace%3An26) | BstNode_2783838218 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 26965 + 46 bytes |
| [n257](../Objects.level.bin对象实现清单.html#CandleSpace%3An257) | BstNode_1700134922 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 58645 + 49 bytes |
| [n69](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An69) | BstNode_2783838218 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 26181 + 46 bytes |
| [n133](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An133) | BstNode_2783838211 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 35367 + 43 bytes |
| [n142](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An142) | BstNode_2783838209 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 37541 + 46 bytes |
| [n205](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An205) | BstNode_2783838215 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 51488 + 45 bytes |
| [n228](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An228) | BstNode_1700134922 | 20%（2/10），运行待验 | 0 / 0 | CandleSpaceEnd · 59984 + 49 bytes |
| [n408](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An408) | BstNode_2783838210 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 92318 + 49 bytes |
| [n545](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An545) | BstNode_2783838216 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 112314 + 46 bytes |
| [n548](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An548) | BstNode_2783838217 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 112503 + 48 bytes |
| [n579](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An579) | BstNode_2783838219 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 115078 + 47 bytes |
| [n581](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An581) | BstNode_2783838220 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 115237 + 49 bytes |
| [n639](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An639) | BstNode_2783838212 | 20%（2/10），运行待验 | 0 / 12 | CandleSpaceEnd · 125647 + 47 bytes |
| [n645](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An645) | BstNode_2783838213 | 20%（2/10），运行待验 | 0 / 0 | CandleSpaceEnd · 126191 + 45 bytes |
| [n648](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An648) | BstNode_2783838214 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 126368 + 46 bytes |
| [n285](../Objects.level.bin对象实现清单.html#Dawn%3An285) | BstNode_3122856136 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 78314 + 45 bytes |
| [n757](../Objects.level.bin对象实现清单.html#Dawn%3An757) | BstNode_629 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 153708 + 38 bytes |
| [n794](../Objects.level.bin对象实现清单.html#Dawn%3An794) | BstNode_3122856158 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 159357 + 46 bytes |
| [n908](../Objects.level.bin对象实现清单.html#Dawn%3An908) | BstNode_436 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 176486 + 39 bytes |
| [n1030](../Objects.level.bin对象实现清单.html#Dawn%3An1030) | BstNode_3122856248 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 191917 + 45 bytes |
| [n1165](../Objects.level.bin对象实现清单.html#Dawn%3An1165) | BstNode_437 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 208105 + 52 bytes |
| [n1429](../Objects.level.bin对象实现清单.html#Dawn%3An1429) | BstNode_283 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 251470 + 38 bytes |
| [n1518](../Objects.level.bin对象实现清单.html#Dawn%3An1518) | BstNode_3122856202 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 265607 + 59 bytes |
| [n1697](../Objects.level.bin对象实现清单.html#Dawn%3An1697) | BstNode_3122856212 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 289278 + 45 bytes |
| [n1823](../Objects.level.bin对象实现清单.html#Dawn%3An1823) | BstNode_1293287868 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 305176 + 52 bytes |
| [n2079](../Objects.level.bin对象实现清单.html#Dawn%3An2079) | BstNode_679 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 340967 + 43 bytes |
| [n2393](../Objects.level.bin对象实现清单.html#Dawn%3An2393) | BstNode_1253 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 397732 + 37 bytes |
| [n2410](../Objects.level.bin对象实现清单.html#Dawn%3An2410) | BstNode_412 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 400841 + 38 bytes |
| [n2609](../Objects.level.bin对象实现清单.html#Dawn%3An2609) | BstNode_3122856272 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 434835 + 41 bytes |
| [n2752](../Objects.level.bin对象实现清单.html#Dawn%3An2752) | BstNode_1842806807 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 454665 + 46 bytes |
| [n2784](../Objects.level.bin对象实现清单.html#Dawn%3An2784) | BstNode_1842806828 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 458090 + 45 bytes |
| [n351](../Objects.level.bin对象实现清单.html#DayEnd%3An351) | BstNode_815 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 90021 + 36 bytes |
| [n588](../Objects.level.bin对象实现清单.html#DayEnd%3An588) | BstNode_606 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 136071 + 40 bytes |
| [n638](../Objects.level.bin对象实现清单.html#DayEnd%3An638) | BstNode_605 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 146650 + 39 bytes |
| [n733](../Objects.level.bin对象实现清单.html#DayEnd%3An733) | BstNode_559 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 160979 + 38 bytes |
| [n810](../Objects.level.bin对象实现清单.html#DayEnd%3An810) | BstNode_752 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 177852 + 39 bytes |
| [n996](../Objects.level.bin对象实现清单.html#DayEnd%3An996) | BstNode_728 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 210884 + 39 bytes |
| [n1093](../Objects.level.bin对象实现清单.html#DayEnd%3An1093) | BstNode_613 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 227850 + 41 bytes |
| [n112](../Objects.level.bin对象实现清单.html#DayHubCave%3An112) | BstNode_1700134948 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 42934 + 47 bytes |
| [n550](../Objects.level.bin对象实现清单.html#Dusk%3An550) | BstNode_2783838209 | 20%（2/10），运行待验 | 0 / 2 | Dusk · 126138 + 47 bytes |
| [n914](../Objects.level.bin对象实现清单.html#Dusk%3An914) | BstNode_2783838231 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 188524 + 44 bytes |
| [n1036](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1036) | BstNode_2783838209 | 20%（2/10），运行待验 | 0 / 2 | DuskGraveyard · 271870 + 44 bytes |
| [n524](../Objects.level.bin对象实现清单.html#DuskMid%3An524) | BstNode_2783838211 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 115972 + 48 bytes |
| [n802](../Objects.level.bin对象实现清单.html#DuskMid%3An802) | BstNode_2783838210 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 171640 + 43 bytes |
| [n1054](../Objects.level.bin对象实现清单.html#DuskMid%3An1054) | BstNode_1700135133 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 221255 + 47 bytes |
| [n1110](../Objects.level.bin对象实现清单.html#DuskMid%3An1110) | BstNode_2783838212 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 229572 + 57 bytes |
| [n971](../Objects.level.bin对象实现清单.html#HubReveal%3An971) | BstNode_2504654912 | 20%（2/10），运行待验 | 0 / 3 | HubReveal · 192601 + 44 bytes |
| [n1240](../Objects.level.bin对象实现清单.html#HubReveal%3An1240) | BstNode_1700134919 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 240578 + 47 bytes |
| [n1367](../Objects.level.bin对象实现清单.html#HubReveal%3An1367) | BstNode_1700134915 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 259558 + 47 bytes |
| [n621](../Objects.level.bin对象实现清单.html#Night%3An621) | BstNode_2783838237 | 20%（2/10），运行待验 | 0 / 0 | Night · 115429 + 42 bytes |
| [n1822](../Objects.level.bin对象实现清单.html#Night%3An1822) | BstNode_2783838246 | 20%（2/10），运行待验 | 0 / 1 | Night · 283590 + 43 bytes |
| [n2383](../Objects.level.bin对象实现清单.html#Night%3An2383) | BstNode_2783838211 | 20%（2/10），运行待验 | 0 / 1 | Night · 373877 + 46 bytes |
| [n542](../Objects.level.bin对象实现清单.html#NightEnd%3An542) | BstNode_2783838209 | 20%（2/10），运行待验 | 0 / 2 | NightEnd · 111077 + 49 bytes |
| [n269](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An269) | BstNode_650 | 20%（2/10），运行待验 | 0 / 2 | Prairie_ButterflyFields · 83065 + 41 bytes |
| [n380](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An380) | BstNode_2783838211 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Cave · 112247 + 54 bytes |
| [n1105](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1105) | BstNode_3122856054 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Cave · 279798 + 49 bytes |
| [n1288](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1288) | BstNode_1700134956 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 317893 + 47 bytes |
| [n1503](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1503) | BstNode_2783838210 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Cave · 380326 + 48 bytes |
| [n1775](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1775) | BstNode_3122856115 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Cave · 455875 + 57 bytes |
| [n441](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An441) | BstNode_2783838209 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 121386 + 54 bytes |
| [n751](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An751) | BstNode_2783838210 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 187293 + 53 bytes |
| [n870](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An870) | BstNode_2783838214 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 215573 + 55 bytes |
| [n966](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An966) | BstNode_2783838213 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 235798 + 54 bytes |
| [n99](../Objects.level.bin对象实现清单.html#Prairie_Village%3An99) | BstNode_2783838223 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 46681 + 54 bytes |
| [n926](../Objects.level.bin对象实现清单.html#Prairie_Village%3An926) | BstNode_1842806853 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 183007 + 53 bytes |
| [n1083](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1083) | BstNode_2783838215 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 209753 + 54 bytes |
| [n1090](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1090) | BstNode_2783838211 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 210663 + 54 bytes |
| [n1100](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1100) | BstNode_2783838216 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 212123 + 57 bytes |
| [n1307](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1307) | BstNode_2783838224 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 241603 + 53 bytes |
| [n1445](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1445) | BstNode_2305 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 262558 + 33 bytes |
| [n1465](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1465) | BstNode_3122855956 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 265250 + 47 bytes |
| [n1487](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1487) | BstNode_1167523868 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 268928 + 39 bytes |
| [n1837](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1837) | BstNode_2027 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 327208 + 33 bytes |
| [n1849](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1849) | BstNode_2025 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 330083 + 33 bytes |
| [n2422](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2422) | BstNode_1167523999 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 417556 + 54 bytes |
| [n2468](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2468) | BstNode_2783838209 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 423102 + 54 bytes |
| [n910](../Objects.level.bin对象实现清单.html#Rain%3An910) | BstNode_266 | 20%（2/10），运行待验 | 0 / 4 | Rain · 234829 + 42 bytes |
| [n1204](../Objects.level.bin对象实现清单.html#Rain%3An1204) | BstNode_2783838271 | 20%（2/10），运行待验 | 0 / 1 | Rain · 297315 + 47 bytes |
| [n1216](../Objects.level.bin对象实现清单.html#Rain%3An1216) | BstNode_2783838270 | 20%（2/10），运行待验 | 0 / 2 | Rain · 299634 + 47 bytes |
| [n1654](../Objects.level.bin对象实现清单.html#Rain%3An1654) | BstNode_2783838286 | 20%（2/10），运行待验 | 0 / 1 | Rain · 398636 + 47 bytes |
| [n1661](../Objects.level.bin对象实现清单.html#Rain%3An1661) | BstNode_2783838295 | 20%（2/10），运行待验 | 0 / 1 | Rain · 399327 + 47 bytes |
| [n1850](../Objects.level.bin对象实现清单.html#Rain%3An1850) | BstNode_1700135137 | 20%（2/10），运行待验 | 0 / 2 | Rain · 446590 + 47 bytes |
| [n950](../Objects.level.bin对象实现清单.html#RainEnd%3An950) | BstNode_2783838212 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 254021 + 48 bytes |
| [n1655](../Objects.level.bin对象实现清单.html#RainEnd%3An1655) | BstNode_1700134918 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 416211 + 47 bytes |
| [n232](../Objects.level.bin对象实现清单.html#RainForest%3An232) | BstNode_34603157 | 20%（2/10），运行待验 | 0 / 2 | RainForest · 67342 + 45 bytes |
| [n417](../Objects.level.bin对象实现清单.html#RainForest%3An417) | BstNode_1700135140 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 95518 + 47 bytes |
| [n1181](../Objects.level.bin对象实现清单.html#RainForest%3An1181) | BstNode_1700135133 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 262360 + 47 bytes |
| [n537](../Objects.level.bin对象实现清单.html#RainMid%3An537) | BstNode_1700135069 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 125918 + 47 bytes |
| [n1772](../Objects.level.bin对象实现清单.html#RainMid%3An1772) | BstNode_1700135080 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 351292 + 47 bytes |
| [n1916](../Objects.level.bin对象实现清单.html#RainMid%3An1916) | BstNode_1700135077 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 373088 + 47 bytes |
| [n2167](../Objects.level.bin对象实现清单.html#RainMid%3An2167) | BstNode_1700135073 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 420027 + 47 bytes |
| [n930](../Objects.level.bin对象实现清单.html#SkyHub2%3An930) | BstNode_1700134967 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 202887 + 47 bytes |
| [n2437](../Objects.level.bin对象实现清单.html#SkyHub2%3An2437) | BstNode_2783838213 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 461602 + 44 bytes |
| [n1216](../Objects.level.bin对象实现清单.html#Storm%3An1216) | BstNode_1270 | 20%（2/10），运行待验 | 0 / 2 | Storm · 240776 + 40 bytes |
| [n605](../Objects.level.bin对象实现清单.html#StormEnd%3An605) | BstNode_2783838224 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 126407 + 45 bytes |
| [n683](../Objects.level.bin对象实现清单.html#StormEnd%3An683) | BstNode_2783838225 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 138336 + 51 bytes |
| [n741](../Objects.level.bin对象实现清单.html#Sunset%3An741) | BstNode_1049165837 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 159621 + 49 bytes |
| [n805](../Objects.level.bin对象实现清单.html#Sunset%3An805) | BstNode_1700135133 | 20%（2/10），运行待验 | 0 / 3 | Sunset · 169086 + 47 bytes |
| [n981](../Objects.level.bin对象实现清单.html#Sunset%3An981) | BstNode_1700134921 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 195423 + 49 bytes |
| [n1484](../Objects.level.bin对象实现清单.html#Sunset%3An1484) | BstNode_1167524231 | 20%（2/10），运行待验 | 0 / 2 | Sunset · 275828 + 47 bytes |
| [n238](../Objects.level.bin对象实现清单.html#SunsetEnd%3An238) | BstNode_1700134917 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 72797 + 47 bytes |
| [n663](../Objects.level.bin对象实现清单.html#SunsetEnd%3An663) | BstNode_1700134929 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 136293 + 47 bytes |
| [n1089](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1089) | BstNode_1167524326 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 207675 + 47 bytes |
| [n1161](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1161) | BstNode_1700135133 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 217321 + 47 bytes |
| [n1583](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1583) | BstNode_1700134925 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 295260 + 47 bytes |
| [n677](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An677) | BstNode_360 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 170261 + 40 bytes |
| [n1012](../Objects.level.bin对象实现清单.html#SunsetRace%3An1012) | BstNode_1700134918 | 20%（2/10），运行待验 | 0 / 2 | SunsetRace · 212467 + 48 bytes |
| [n113](../Objects.level.bin对象实现清单.html#TitleWater%3An113) | BstNode_108 | 20%（2/10），运行待验 | 0 / 0 | TitleWater · 31033 + 33 bytes |
| [n126](../Objects.level.bin对象实现清单.html#TitleWater%3An126) | BstNode_102 | 20%（2/10），运行待验 | 0 / 0 | TitleWater · 33041 + 35 bytes |
