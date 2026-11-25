# AncestorEngine 单独类功能实现清单

功能分类：任务、先祖与场景机制。

此类职责：**充能机关、区域与激活计时**。

类清单进度 30%（3/10），51 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：AncestorEngine 的原默认值、继承初始化及 32 个序列化字段变体；原注册字段 31 项。
- [ ] 充能机关、区域与激活计时：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（205 条引用）、Float（73 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 31 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=AncestorEngine) · [原字段、进度与全部实例 JSON](AncestorEngine.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n679](../Objects.level.bin对象实现清单.html#Dawn%3An679) | BstNode_2529558561 | 20%（2/10），运行待验 | 3 / 1 | Dawn · 140232 + 139 bytes |
| [n1002](../Objects.level.bin对象实现清单.html#Dawn%3An1002) | BstNode_2446917943 | 20%（2/10），运行待验 | 3 / 1 | Dawn · 189603 + 139 bytes |
| [n1435](../Objects.level.bin对象实现清单.html#Dawn%3An1435) | BstNode_2446917802 | 20%（2/10），运行待验 | 3 / 2 | Dawn · 252402 + 139 bytes |
| [n50](../Objects.level.bin对象实现清单.html#DayHubCave%3An50) | BstNode_2345992241 | 20%（2/10），运行待验 | 6 / 1 | DayHubCave · 30891 + 139 bytes |
| [n100](../Objects.level.bin对象实现清单.html#DayHubCave%3An100) | BstNode_2345992268 | 20%（2/10），运行待验 | 5 / 1 | DayHubCave · 40794 + 139 bytes |
| [n259](../Objects.level.bin对象实现清单.html#DayHubCave%3An259) | BstNode_2345992250 | 20%（2/10），运行待验 | 5 / 1 | DayHubCave · 67741 + 139 bytes |
| [n279](../Objects.level.bin对象实现清单.html#DayHubCave%3An279) | BstNode_2345992277 | 20%（2/10），运行待验 | 5 / 1 | DayHubCave · 72082 + 139 bytes |
| [n377](../Objects.level.bin对象实现清单.html#DayHubCave%3An377) | BstNode_2345992259 | 20%（2/10），运行待验 | 5 / 1 | DayHubCave · 93431 + 139 bytes |
| [n405](../Objects.level.bin对象实现清单.html#DayHubCave%3An405) | BstNode_2345992286 | 20%（2/10），运行待验 | 5 / 1 | DayHubCave · 98004 + 139 bytes |
| [n614](../Objects.level.bin对象实现清单.html#DayHubCave%3An614) | BstNode_2345992230 | 20%（2/10），运行待验 | 5 / 1 | DayHubCave · 140348 + 139 bytes |
| [n802](../Objects.level.bin对象实现清单.html#DayHubCave%3An802) | BstNode_2345992295 | 20%（2/10），运行待验 | 5 / 1 | DayHubCave · 173095 + 139 bytes |
| [n39](../Objects.level.bin对象实现清单.html#Dusk%3An39) | BstNode_34603719 | 20%（2/10），运行待验 | 2 / 1 | Dusk · 30640 + 137 bytes |
| [n170](../Objects.level.bin对象实现清单.html#Dusk%3An170) | BstNode_34603722 | 20%（2/10），运行待验 | 2 / 1 | Dusk · 54827 + 137 bytes |
| [n208](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An208) | BstNode_1293287785 | 20%（2/10），运行待验 | 4 / 0 | Dusk_CrabField · 62355 + 139 bytes |
| [n962](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An962) | BstNode_2446917943 | 20%（2/10），运行待验 | 4 / 1 | Dusk_CrabField · 235351 + 139 bytes |
| [n168](../Objects.level.bin对象实现清单.html#NightEntrance%3An168) | BstNode_2345992332 | 20%（2/10），运行待验 | 8 / 2 | NightEntrance · 41572 + 139 bytes |
| [n279](../Objects.level.bin对象实现清单.html#NightEntrance%3An279) | BstNode_1293287464 | 20%（2/10），运行待验 | 7 / 2 | NightEntrance · 59121 + 139 bytes |
| [n215](../Objects.level.bin对象实现清单.html#Prairie_Village%3An215) | BstNode_2345992332 | 20%（2/10），运行待验 | 9 / 2 | Prairie_Village · 65438 + 139 bytes |
| [n453](../Objects.level.bin对象实现清单.html#Prairie_Village%3An453) | BstNode_2345992292 | 20%（2/10），运行待验 | 9 / 2 | Prairie_Village · 104905 + 139 bytes |
| [n789](../Objects.level.bin对象实现清单.html#Prairie_Village%3An789) | BstNode_2345992249 | 20%（2/10），运行待验 | 9 / 2 | Prairie_Village · 158534 + 139 bytes |
| [n2484](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2484) | BstNode_2345992287 | 20%（2/10），运行待验 | 9 / 2 | Prairie_Village · 425428 + 139 bytes |
| [n848](../Objects.level.bin对象实现清单.html#Rain%3An848) | BstNode_1293287526 | 20%（2/10），运行待验 | 7 / 2 | Rain · 220863 + 139 bytes |
| [n1162](../Objects.level.bin对象实现清单.html#Rain%3An1162) | BstNode_1293287513 | 20%（2/10），运行待验 | 8 / 1 | Rain · 291423 + 139 bytes |
| [n1193](../Objects.level.bin对象实现清单.html#Rain%3An1193) | BstNode_1293287785 | 20%（2/10），运行待验 | 7 / 2 | Rain · 296483 + 139 bytes |
| [n233](../Objects.level.bin对象实现清单.html#RainEnd%3An233) | BstNode_2345992779 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 84632 + 139 bytes |
| [n321](../Objects.level.bin对象实现清单.html#RainEnd%3An321) | BstNode_2645622829 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 106019 + 139 bytes |
| [n551](../Objects.level.bin对象实现清单.html#RainEnd%3An551) | BstNode_2345992807 | 20%（2/10），运行待验 | 6 / 1 | RainEnd · 162613 + 139 bytes |
| [n591](../Objects.level.bin对象实现清单.html#RainEnd%3An591) | BstNode_2345992763 | 20%（2/10），运行待验 | 5 / 0 | RainEnd · 171755 + 139 bytes |
| [n958](../Objects.level.bin对象实现清单.html#RainEnd%3An958) | BstNode_2345992863 | 20%（2/10），运行待验 | 5 / 1 | RainEnd · 255376 + 139 bytes |
| [n970](../Objects.level.bin对象实现清单.html#RainEnd%3An970) | BstNode_840696217 | 20%（2/10），运行待验 | 5 / 0 | RainEnd · 258396 + 138 bytes |
| [n1147](../Objects.level.bin对象实现清单.html#RainEnd%3An1147) | BstNode_2345992734 | 20%（2/10），运行待验 | 4 / 0 | RainEnd · 302749 + 139 bytes |
| [n1250](../Objects.level.bin对象实现清单.html#RainEnd%3An1250) | BstNode_2345992635 | 20%（2/10），运行待验 | 4 / 0 | RainEnd · 328155 + 139 bytes |
| [n66](../Objects.level.bin对象实现清单.html#RainMid%3An66) | BstNode_2345993045 | 20%（2/10），运行待验 | 4 / 0 | RainMid · 38853 + 139 bytes |
| [n689](../Objects.level.bin对象实现清单.html#RainMid%3An689) | BstNode_2345993265 | 20%（2/10），运行待验 | 4 / 0 | RainMid · 156498 + 139 bytes |
| [n950](../Objects.level.bin对象实现清单.html#RainMid%3An950) | BstNode_2345992572 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 199897 + 139 bytes |
| [n1402](../Objects.level.bin对象实现清单.html#RainMid%3An1402) | BstNode_2345993084 | 20%（2/10），运行待验 | 4 / 0 | RainMid · 282788 + 139 bytes |
| [n1404](../Objects.level.bin对象实现清单.html#RainMid%3An1404) | BstNode_2345993267 | 20%（2/10），运行待验 | 4 / 0 | RainMid · 283010 + 139 bytes |
| [n2073](../Objects.level.bin对象实现清单.html#RainMid%3An2073) | BstNode_2345992569 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 399515 + 139 bytes |
| [n170](../Objects.level.bin对象实现清单.html#SkyHub2%3An170) | BstNode_2345992332 | 20%（2/10），运行待验 | 8 / 3 | SkyHub2 · 63920 + 139 bytes |
| [n366](../Objects.level.bin对象实现清单.html#SkyHub2%3An366) | BstNode_2345992292 | 20%（2/10），运行待验 | 9 / 5 | SkyHub2 · 102487 + 139 bytes |
| [n709](../Objects.level.bin对象实现清单.html#SkyHub2%3An709) | BstNode_2446917739 | 20%（2/10），运行待验 | 7 / 5 | SkyHub2 · 163754 + 139 bytes |
| [n912](../Objects.level.bin对象实现清单.html#SkyHub2%3An912) | BstNode_2345992354 | 20%（2/10），运行待验 | 7 / 7 | SkyHub2 · 199752 + 139 bytes |
| [n1762](../Objects.level.bin对象实现清单.html#SkyHub2%3An1762) | BstNode_2345992287 | 20%（2/10），运行待验 | 9 / 5 | SkyHub2 · 333249 + 139 bytes |
| [n1893](../Objects.level.bin对象实现清单.html#SkyHub2%3An1893) | BstNode_2446917754 | 20%（2/10），运行待验 | 7 / 5 | SkyHub2 · 357527 + 139 bytes |
| [n2065](../Objects.level.bin对象实现清单.html#SkyHub2%3An2065) | BstNode_2345992355 | 20%（2/10），运行待验 | 7 / 4 | SkyHub2 · 389013 + 139 bytes |
| [n2119](../Objects.level.bin对象实现清单.html#SkyHub2%3An2119) | BstNode_1293287464 | 20%（2/10），运行待验 | 9 / 3 | SkyHub2 · 398851 + 139 bytes |
| [n435](../Objects.level.bin对象实现清单.html#Storm%3An435) | BstNode_1293287493 | 20%（2/10），运行待验 | 3 / 0 | Storm · 100625 + 139 bytes |
| [n75](../Objects.level.bin对象实现清单.html#Sunset%3An75) | BstNode_34603040 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 40407 + 137 bytes |
| [n269](../Objects.level.bin对象实现清单.html#Sunset%3An269) | BstNode_2645622789 | 20%（2/10），运行待验 | 9 / 3 | Sunset · 78279 + 139 bytes |
| [n1147](../Objects.level.bin对象实现清单.html#Sunset%3An1147) | BstNode_2529558561 | 20%（2/10），运行待验 | 9 / 3 | Sunset · 220610 + 139 bytes |
| [n1317](../Objects.level.bin对象实现清单.html#Sunset%3An1317) | BstNode_34603065 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 249069 + 137 bytes |
