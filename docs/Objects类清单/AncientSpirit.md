# AncientSpirit 单独类功能实现清单

功能分类：任务、先祖与场景机制。

此类职责：**先祖交互、动画、收集与剧情**。

类清单进度 30%（3/10），42 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：AncientSpirit 的原默认值、继承初始化及 44 个序列化字段变体；原注册字段 43 项。
- [ ] 先祖交互、动画、收集与剧情：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（105 条引用）、Marker（158 条引用）、Collectible（42 条引用）、Npc（42 条引用）、Timeline（25 条引用）、LevelMesh（40 条引用）、CameraKeyFrame（99 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 43 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=AncientSpirit) · [原字段、进度与全部实例 JSON](AncientSpirit.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n2](../Objects.level.bin对象实现清单.html#CandleSpace%3An2) | BstNode_2529559023 | 20%（2/10），运行待验 | 7 / 1 | CandleSpace · 23698 + 157 bytes |
| [n958](../Objects.level.bin对象实现清单.html#DayHubCave%3An958) | BstNode_2446917675 | 20%（2/10），运行待验 | 15 / 0 | DayHubCave · 197959 + 242 bytes |
| [n117](../Objects.level.bin对象实现清单.html#Dusk%3An117) | BstNode_1843 | 20%（2/10），运行待验 | 13 / 1 | Dusk · 43073 + 191 bytes |
| [n616](../Objects.level.bin对象实现清单.html#Dusk%3An616) | BstNode_2345992300 | 20%（2/10），运行待验 | 12 / 1 | Dusk · 136433 + 171 bytes |
| [n920](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An920) | BstNode_2345992758 | 20%（2/10），运行待验 | 12 / 1 | DuskGraveyard · 237462 + 194 bytes |
| [n805](../Objects.level.bin对象实现清单.html#DuskMid%3An805) | BstNode_2345992391 | 20%（2/10），运行待验 | 12 / 1 | DuskMid · 172203 + 195 bytes |
| [n893](../Objects.level.bin对象实现清单.html#DuskMid%3An893) | BstNode_2504654859 | 20%（2/10），运行待验 | 15 / 1 | DuskMid · 192230 + 198 bytes |
| [n418](../Objects.level.bin对象实现清单.html#HubReveal%3An418) | BstNode_2529558608 | 20%（2/10），运行待验 | 9 / 2 | HubReveal · 101312 + 153 bytes |
| [n458](../Objects.level.bin对象实现清单.html#HubReveal%3An458) | BstNode_1056 | 20%（2/10），运行待验 | 12 / 0 | HubReveal · 109005 + 233 bytes |
| [n1303](../Objects.level.bin对象实现清单.html#HubReveal%3An1303) | BstNode_2529558568 | 20%（2/10），运行待验 | 14 / 1 | HubReveal · 250606 + 153 bytes |
| [n1279](../Objects.level.bin对象实现清单.html#Night%3An1279) | BstNode_34603993 | 20%（2/10），运行待验 | 13 / 1 | Night · 210311 + 243 bytes |
| [n2136](../Objects.level.bin对象实现清单.html#Night%3An2136) | BstNode_2345992300 | 20%（2/10），运行待验 | 14 / 2 | Night · 339552 + 245 bytes |
| [n2437](../Objects.level.bin对象实现清单.html#Night%3An2437) | BstNode_34604513 | 20%（2/10），运行待验 | 13 / 3 | Night · 382860 + 246 bytes |
| [n2734](../Objects.level.bin对象实现清单.html#Night%3An2734) | BstNode_34603574 | 20%（2/10），运行待验 | 15 / 1 | Night · 425723 + 240 bytes |
| [n287](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An287) | BstNode_1844 | 20%（2/10），运行待验 | 14 / 2 | Prairie_ButterflyFields · 87116 + 218 bytes |
| [n1138](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1138) | BstNode_2529558553 | 20%（2/10），运行待验 | 7 / 0 | Prairie_ButterflyFields · 247105 + 157 bytes |
| [n249](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An249) | BstNode_3122856084 | 20%（2/10），运行待验 | 8 / 4 | Prairie_Cave · 81697 + 167 bytes |
| [n355](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An355) | BstNode_1056 | 20%（2/10），运行待验 | 9 / 3 | Prairie_Cave · 105094 + 237 bytes |
| [n359](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An359) | BstNode_34603448 | 20%（2/10），运行待验 | 9 / 1 | Prairie_NestAndKeeper · 104008 + 179 bytes |
| [n397](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An397) | BstNode_34603015 | 20%（2/10），运行待验 | 10 / 3 | Prairie_NestAndKeeper · 112517 + 179 bytes |
| [n549](../Objects.level.bin对象实现清单.html#Prairie_Village%3An549) | BstNode_3122855947 | 20%（2/10），运行待验 | 12 / 1 | Prairie_Village · 119833 + 157 bytes |
| [n801](../Objects.level.bin对象实现清单.html#Prairie_Village%3An801) | BstNode_1293287623 | 20%（2/10），运行待验 | 10 / 1 | Prairie_Village · 160496 + 167 bytes |
| [n1117](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1117) | BstNode_2504655003 | 20%（2/10），运行待验 | 7 / 2 | Prairie_Village · 213968 + 167 bytes |
| [n1240](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1240) | BstNode_3122855967 | 20%（2/10），运行待验 | 14 / 1 | Prairie_Village · 230803 + 167 bytes |
| [n1621](../Objects.level.bin对象实现清单.html#Rain%3An1621) | BstNode_2504655072 | 20%（2/10），运行待验 | 14 / 3 | Rain · 389732 + 236 bytes |
| [n1256](../Objects.level.bin对象实现清单.html#RainEnd%3An1256) | BstNode_2345992604 | 20%（2/10），运行待验 | 14 / 2 | RainEnd · 330138 + 235 bytes |
| [n70](../Objects.level.bin对象实现清单.html#RainForest%3An70) | BstNode_2345992418 | 20%（2/10），运行待验 | 14 / 1 | RainForest · 35381 + 230 bytes |
| [n150](../Objects.level.bin对象实现清单.html#RainForest%3An150) | BstNode_1621 | 20%（2/10），运行待验 | 14 / 1 | RainForest · 51361 + 209 bytes |
| [n635](../Objects.level.bin对象实现清单.html#RainForest%3An635) | BstNode_2504654859 | 20%（2/10），运行待验 | 14 / 2 | RainForest · 145872 + 201 bytes |
| [n89](../Objects.level.bin对象实现清单.html#RainMid%3An89) | BstNode_2345992443 | 20%（2/10），运行待验 | 13 / 2 | RainMid · 44087 + 181 bytes |
| [n503](../Objects.level.bin对象实现清单.html#RainMid%3An503) | BstNode_2345992703 | 20%（2/10），运行待验 | 15 / 2 | RainMid · 120131 + 239 bytes |
| [n1115](../Objects.level.bin对象实现清单.html#RainMid%3An1115) | BstNode_1850 | 20%（2/10），运行待验 | 14 / 2 | RainMid · 229888 + 236 bytes |
| [n214](../Objects.level.bin对象实现清单.html#SkyHub2%3An214) | BstNode_1167524204 | 20%（2/10），运行待验 | 10 / 2 | SkyHub2 · 71962 + 179 bytes |
| [n726](../Objects.level.bin对象实现清单.html#SkyHub2%3An726) | BstNode_2446917930 | 20%（2/10），运行待验 | 14 / 1 | SkyHub2 · 166206 + 209 bytes |
| [n2442](../Objects.level.bin对象实现清单.html#SkyHub2%3An2442) | BstNode_2446917926 | 20%（2/10），运行待验 | 11 / 1 | SkyHub2 · 462658 + 180 bytes |
| [n197](../Objects.level.bin对象实现清单.html#Sunset%3An197) | BstNode_1621 | 20%（2/10），运行待验 | 14 / 2 | Sunset · 61289 + 219 bytes |
| [n1242](../Objects.level.bin对象实现清单.html#Sunset%3An1242) | BstNode_1167524232 | 20%（2/10），运行待验 | 15 / 1 | Sunset · 236871 + 243 bytes |
| [n251](../Objects.level.bin对象实现清单.html#SunsetEnd%3An251) | BstNode_1621 | 20%（2/10），运行待验 | 15 / 1 | SunsetEnd · 75713 + 232 bytes |
| [n270](../Objects.level.bin对象实现清单.html#SunsetEnd%3An270) | BstNode_2688 | 20%（2/10），运行待验 | 9 / 2 | SunsetEnd · 78978 + 231 bytes |
| [n352](../Objects.level.bin对象实现清单.html#SunsetEnd%3An352) | BstNode_1167524494 | 20%（2/10），运行待验 | 10 / 2 | SunsetEnd · 88931 + 229 bytes |
| [n1158](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1158) | BstNode_1167524175 | 20%（2/10），运行待验 | 15 / 2 | SunsetEnd · 216930 + 228 bytes |
| [n1181](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1181) | BstNode_1167524449 | 20%（2/10），运行待验 | 10 / 2 | SunsetEnd · 221123 + 240 bytes |
