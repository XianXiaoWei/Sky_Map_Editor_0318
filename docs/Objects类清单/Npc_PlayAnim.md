# Npc_PlayAnim 单独类功能实现清单

功能分类：NPC 行为与社交。

此类职责：**NPC 动画播放与速度**。

类清单进度 30%（3/10），54 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Npc_PlayAnim 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] NPC 动画播放与速度：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（54 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Npc_PlayAnim) · [原字段、进度与全部实例 JSON](Npc_PlayAnim.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n1078](../Objects.level.bin对象实现清单.html#Dawn%3An1078) | BstNode_1747 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 197768 + 30 bytes |
| [n86](../Objects.level.bin对象实现清单.html#DayEnd%3An86) | BstNode_799 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 40216 + 29 bytes |
| [n322](../Objects.level.bin对象实现清单.html#DayEnd%3An322) | BstNode_798 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 84865 + 29 bytes |
| [n152](../Objects.level.bin对象实现清单.html#DayHubCave%3An152) | BstNode_2504654852 | 20%（2/10），运行待验 | 1 / 2 | DayHubCave · 50555 + 56 bytes |
| [n481](../Objects.level.bin对象实现清单.html#DayHubCave%3An481) | BstNode_2504654858 | 20%（2/10），运行待验 | 1 / 2 | DayHubCave · 114310 + 56 bytes |
| [n644](../Objects.level.bin对象实现清单.html#DayHubCave%3An644) | BstNode_2446917690 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 144695 + 62 bytes |
| [n816](../Objects.level.bin对象实现清单.html#DayHubCave%3An816) | BstNode_2446917691 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 175539 + 62 bytes |
| [n191](../Objects.level.bin对象实现清单.html#Dusk%3An191) | BstNode_2504654851 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 59522 + 55 bytes |
| [n1146](../Objects.level.bin对象实现清单.html#Dusk%3An1146) | BstNode_2504654884 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 234366 + 52 bytes |
| [n44](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An44) | BstNode_2504654867 | 20%（2/10），运行待验 | 1 / 2 | DuskGraveyard · 35153 + 51 bytes |
| [n39](../Objects.level.bin对象实现清单.html#DuskMid%3An39) | BstNode_2504654850 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 27462 + 58 bytes |
| [n94](../Objects.level.bin对象实现清单.html#HubReveal%3An94) | BstNode_2504654873 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 45876 + 60 bytes |
| [n522](../Objects.level.bin对象实现清单.html#HubReveal%3An522) | BstNode_3156082745 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 118452 + 60 bytes |
| [n747](../Objects.level.bin对象实现清单.html#HubReveal%3An747) | BstNode_3156082748 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 154748 + 43 bytes |
| [n752](../Objects.level.bin对象实现清单.html#HubReveal%3An752) | BstNode_3156082749 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 155945 + 43 bytes |
| [n1419](../Objects.level.bin对象实现清单.html#HubReveal%3An1419) | BstNode_3156082744 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 268377 + 59 bytes |
| [n2537](../Objects.level.bin对象实现清单.html#Night%3An2537) | BstNode_34603388 | 20%（2/10），运行待验 | 1 / 1 | Night · 397654 + 34 bytes |
| [n328](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An328) | BstNode_2504654948 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 98539 + 57 bytes |
| [n364](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An364) | BstNode_2504654990 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 108274 + 57 bytes |
| [n377](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An377) | BstNode_2504654883 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 111963 + 61 bytes |
| [n466](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An466) | BstNode_2504654967 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Cave · 131979 + 51 bytes |
| [n981](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An981) | BstNode_2504654957 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 250300 + 62 bytes |
| [n1360](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1360) | BstNode_2504654966 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 338490 + 61 bytes |
| [n105](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An105) | BstNode_656801801 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 44591 + 53 bytes |
| [n210](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An210) | BstNode_2504654997 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 70854 + 53 bytes |
| [n402](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An402) | BstNode_2504654996 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 113744 + 58 bytes |
| [n671](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An671) | BstNode_2060386313 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 166750 + 52 bytes |
| [n847](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An847) | BstNode_2060386310 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 211195 + 57 bytes |
| [n157](../Objects.level.bin对象实现清单.html#Prairie_Village%3An157) | BstNode_656801801 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 56679 + 58 bytes |
| [n405](../Objects.level.bin对象实现清单.html#Prairie_Village%3An405) | BstNode_2504655008 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 96506 + 47 bytes |
| [n722](../Objects.level.bin对象实现清单.html#Prairie_Village%3An722) | BstNode_656801802 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 147703 + 58 bytes |
| [n912](../Objects.level.bin对象实现清单.html#Prairie_Village%3An912) | BstNode_1842806797 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 180202 + 54 bytes |
| [n968](../Objects.level.bin对象实现清单.html#Prairie_Village%3An968) | BstNode_2504655070 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 189764 + 50 bytes |
| [n975](../Objects.level.bin对象实现清单.html#Prairie_Village%3An975) | BstNode_2504654856 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 190880 + 51 bytes |
| [n1053](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1053) | BstNode_1842806835 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 204061 + 53 bytes |
| [n1474](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1474) | BstNode_2504654869 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 266671 + 51 bytes |
| [n1492](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1492) | BstNode_2504654854 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 269256 + 48 bytes |
| [n247](../Objects.level.bin对象实现清单.html#Rain%3An247) | BstNode_2345992326 | 20%（2/10），运行待验 | 1 / 2 | Rain · 83657 + 47 bytes |
| [n704](../Objects.level.bin对象实现清单.html#Rain%3An704) | BstNode_2345992289 | 20%（2/10），运行待验 | 1 / 2 | Rain · 188206 + 43 bytes |
| [n1421](../Objects.level.bin对象实现清单.html#Rain%3An1421) | BstNode_2345992340 | 20%（2/10），运行待验 | 1 / 2 | Rain · 345817 + 47 bytes |
| [n1428](../Objects.level.bin对象实现清单.html#Rain%3An1428) | BstNode_2345992341 | 20%（2/10），运行待验 | 1 / 2 | Rain · 348128 + 36 bytes |
| [n1160](../Objects.level.bin对象实现清单.html#RainForest%3An1160) | BstNode_2504654850 | 20%（2/10），运行待验 | 1 / 3 | RainForest · 259642 + 58 bytes |
| [n1683](../Objects.level.bin对象实现清单.html#RainMid%3An1683) | BstNode_2345992863 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 337082 + 65 bytes |
| [n130](../Objects.level.bin对象实现清单.html#SkyHub2%3An130) | BstNode_2504654873 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 56966 + 56 bytes |
| [n337](../Objects.level.bin对象实现清单.html#SkyHub2%3An337) | BstNode_2529558622 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 97788 + 43 bytes |
| [n1297](../Objects.level.bin对象实现清单.html#SkyHub2%3An1297) | BstNode_2446917928 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 265448 + 55 bytes |
| [n1591](../Objects.level.bin对象实现清单.html#SkyHub2%3An1591) | BstNode_1167524400 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 307478 + 54 bytes |
| [n1618](../Objects.level.bin对象实现清单.html#SkyHub2%3An1618) | BstNode_1167524397 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 312118 + 55 bytes |
| [n1647](../Objects.level.bin对象实现清单.html#SkyHub2%3An1647) | BstNode_2504654859 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 316510 + 55 bytes |
| [n2348](../Objects.level.bin对象实现清单.html#SkyHub2%3An2348) | BstNode_1167523860 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 442758 + 42 bytes |
| [n593](../Objects.level.bin对象实现清单.html#StormEnd%3An593) | BstNode_2446917730 | 20%（2/10），运行待验 | 1 / 2 | StormEnd · 124592 + 54 bytes |
| [n622](../Objects.level.bin对象实现清单.html#StormEnd%3An622) | BstNode_2446917757 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 129248 + 53 bytes |
| [n924](../Objects.level.bin对象实现清单.html#StormEnd%3An924) | BstNode_2446917763 | 20%（2/10），运行待验 | 1 / 0 | StormEnd · 177323 + 52 bytes |
| [n1075](../Objects.level.bin对象实现清单.html#StormEnd%3An1075) | BstNode_2446917728 | 20%（2/10），运行待验 | 1 / 2 | StormEnd · 205994 + 56 bytes |
