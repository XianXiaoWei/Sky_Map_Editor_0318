# AvatarSetPos 单独类功能实现清单

功能分类：地图加载、出生与检查点。

此类职责：**玩家定位、相对标记与出生入口**。

类清单进度 40%（4/10），59 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：AvatarSetPos 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 玩家定位、相对标记与出生入口（部分完成）：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 依赖调用与事件（部分完成）：Marker（59 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] Windows 真机与原游戏验收

59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=AvatarSetPos) · [原字段、进度与全部实例 JSON](AvatarSetPos.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n368](../Objects.level.bin对象实现清单.html#CandleSpace%3An368) | BstNode_2529558623 | 20%（2/10），运行待验 | 1 / 0 | CandleSpace · 77297 + 37 bytes |
| [n39](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An39) | BstNode_2504654850 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 22928 + 37 bytes |
| [n50](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An50) | BstNode_2529558623 | 20%（2/10），运行待验 | 1 / 0 | CandleSpaceEnd · 23875 + 37 bytes |
| [n399](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An399) | BstNode_2504655001 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 91499 + 37 bytes |
| [n51](../Objects.level.bin对象实现清单.html#CarryLand%3An51) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 15583 + 29 bytes |
| [n56](../Objects.level.bin对象实现清单.html#CarryLand2%3An56) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 21645 + 29 bytes |
| [n25](../Objects.level.bin对象实现清单.html#CarryLand3%3An25) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | CarryLand3 · 8917 + 29 bytes |
| [n290](../Objects.level.bin对象实现清单.html#Dawn%3An290) | BstNode_851 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 79107 + 30 bytes |
| [n1028](../Objects.level.bin对象实现清单.html#Dawn%3An1028) | BstNode_570 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 191855 + 30 bytes |
| [n1294](../Objects.level.bin对象实现清单.html#Dawn%3An1294) | BstNode_2279670005 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 233105 + 37 bytes |
| [n1515](../Objects.level.bin对象实现清单.html#Dawn%3An1515) | BstNode_1221 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 265431 + 31 bytes |
| [n42](../Objects.level.bin对象实现清单.html#DayEnd%3An42) | BstNode_742 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 30433 + 30 bytes |
| [n275](../Objects.level.bin对象实现清单.html#DayEnd%3An275) | BstNode_309 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 77661 + 30 bytes |
| [n608](../Objects.level.bin对象实现清单.html#DayEnd%3An608) | BstNode_11 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 140498 + 29 bytes |
| [n293](../Objects.level.bin对象实现清单.html#DayHubCave%3An293) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 75231 + 29 bytes |
| [n589](../Objects.level.bin对象实现清单.html#Dusk%3An589) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | Dusk · 132766 + 29 bytes |
| [n832](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An832) | BstNode_34603869 | 20%（2/10），运行待验 | 1 / 2 | DuskGraveyard · 218073 + 35 bytes |
| [n1076](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1076) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | DuskGraveyard · 280288 + 29 bytes |
| [n139](../Objects.level.bin对象实现清单.html#DuskMid%3An139) | BstNode_2345992617 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 44075 + 37 bytes |
| [n556](../Objects.level.bin对象实现清单.html#DuskMid%3An556) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | DuskMid · 121396 + 29 bytes |
| [n600](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An600) | BstNode_11 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 149977 + 29 bytes |
| [n240](../Objects.level.bin对象实现清单.html#HubReveal%3An240) | BstNode_784 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 71335 + 30 bytes |
| [n242](../Objects.level.bin对象实现清单.html#HubReveal%3An242) | BstNode_2529558542 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 71507 + 37 bytes |
| [n1150](../Objects.level.bin对象实现清单.html#HubReveal%3An1150) | BstNode_2504654858 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 224327 + 37 bytes |
| [n1109](../Objects.level.bin对象实现清单.html#Night%3An1109) | BstNode_34603374 | 20%（2/10），运行待验 | 1 / 2 | Night · 184717 + 35 bytes |
| [n1482](../Objects.level.bin对象实现清单.html#Night%3An1482) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | Night · 236109 + 29 bytes |
| [n1809](../Objects.level.bin对象实现清单.html#Night%3An1809) | BstNode_707 | 20%（2/10），运行待验 | 1 / 2 | Night · 282326 + 30 bytes |
| [n101](../Objects.level.bin对象实现清单.html#NightEnd%3An101) | BstNode_34603096 | 20%（2/10），运行待验 | 1 / 2 | NightEnd · 38559 + 35 bytes |
| [n262](../Objects.level.bin对象实现清单.html#NightEnd%3An262) | BstNode_2504654851 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 65520 + 37 bytes |
| [n628](../Objects.level.bin对象实现清单.html#NightEnd%3An628) | BstNode_34603092 | 20%（2/10），运行待验 | 1 / 2 | NightEnd · 125801 + 35 bytes |
| [n130](../Objects.level.bin对象实现清单.html#NightEntrance%3An130) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | NightEntrance · 36489 + 28 bytes |
| [n1344](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1344) | BstNode_99 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 289168 + 29 bytes |
| [n10](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An10) | BstNode_2504654987 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 25259 + 37 bytes |
| [n883](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An883) | BstNode_1293287676 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Cave · 229298 + 37 bytes |
| [n969](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An969) | BstNode_99 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 236394 + 29 bytes |
| [n481](../Objects.level.bin对象实现清单.html#Prairie_Village%3An481) | BstNode_99 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 110386 + 29 bytes |
| [n1](../Objects.level.bin对象实现清单.html#Rain%3An1) | BstNode_2345992273 | 20%（2/10），运行待验 | 1 / 2 | Rain · 28598 + 37 bytes |
| [n474](../Objects.level.bin对象实现清单.html#Rain%3An474) | BstNode_2345992328 | 20%（2/10），运行待验 | 1 / 2 | Rain · 134759 + 37 bytes |
| [n1801](../Objects.level.bin对象实现清单.html#Rain%3An1801) | BstNode_11 | 20%（2/10），运行待验 | 1 / 0 | Rain · 435254 + 29 bytes |
| [n152](../Objects.level.bin对象实现清单.html#RainEnd%3An152) | BstNode_925 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 65806 + 30 bytes |
| [n1009](../Objects.level.bin对象实现清单.html#RainEnd%3An1009) | BstNode_72 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 268356 + 29 bytes |
| [n1114](../Objects.level.bin对象实现清单.html#RainForest%3An1114) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 250220 + 29 bytes |
| [n321](../Objects.level.bin对象实现清单.html#RainMid%3An321) | BstNode_1167523978 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 87751 + 37 bytes |
| [n1655](../Objects.level.bin对象实现清单.html#RainMid%3An1655) | BstNode_1167523980 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 332765 + 37 bytes |
| [n1934](../Objects.level.bin对象实现清单.html#RainMid%3An1934) | BstNode_213 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 375972 + 30 bytes |
| [n611](../Objects.level.bin对象实现清单.html#SkyHub2%3An611) | BstNode_11 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 146604 + 29 bytes |
| [n1316](../Objects.level.bin对象实现清单.html#Storm%3An1316) | BstNode_11 | 20%（2/10），运行待验 | 1 / 0 | Storm · 256759 + 29 bytes |
| [n139](../Objects.level.bin对象实现清单.html#StormEnd%3An139) | BstNode_2446917733 | 20%（2/10），运行待验 | 1 / 2 | StormEnd · 45478 + 37 bytes |
| [n580](../Objects.level.bin对象实现清单.html#StormEnd%3An580) | BstNode_11 | 20%（2/10），运行待验 | 1 / 0 | StormEnd · 123674 + 29 bytes |
| [n1079](../Objects.level.bin对象实现清单.html#Sunset%3An1079) | BstNode_123 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 210755 + 30 bytes |
| [n1496](../Objects.level.bin对象实现清单.html#Sunset%3An1496) | BstNode_2446917636 | 20%（2/10），运行待验 | 1 / 1 | Sunset · 278315 + 37 bytes |
| [n444](../Objects.level.bin对象实现清单.html#SunsetEnd%3An444) | BstNode_1167524201 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 103958 + 37 bytes |
| [n942](../Objects.level.bin对象实现清单.html#SunsetEnd%3An942) | BstNode_1 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 184032 + 28 bytes |
| [n463](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An463) | BstNode_1167523843 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 117407 + 37 bytes |
| [n515](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An515) | BstNode_656801803 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 131549 + 36 bytes |
| [n102](../Objects.level.bin对象实现清单.html#SunsetRace%3An102) | BstNode_123 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 41229 + 30 bytes |
| [n9](../Objects.level.bin对象实现清单.html#TitleWater%3An9) | BstNode_2470641665 | 20%（2/10），运行待验 | 1 / 0 | TitleWater · 17811 + 37 bytes |
| [n100](../Objects.level.bin对象实现清单.html#TitleWater%3An100) | BstNode_1528234052 | 20%（2/10），运行待验 | 1 / 1 | TitleWater · 29291 + 37 bytes |
| [n114](../Objects.level.bin对象实现清单.html#TitleWater%3An114) | BstNode_1 | 20%（2/10），运行待验 | 1 / 2 | TitleWater · 31066 + 28 bytes |
