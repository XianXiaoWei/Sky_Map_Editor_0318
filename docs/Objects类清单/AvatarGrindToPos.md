# AvatarGrindToPos 单独类功能实现清单

功能分类：玩家状态与输入。

此类职责：**玩家轨道式定位与停止**。

类清单进度 30%（3/10），46 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：AvatarGrindToPos 的原默认值、继承初始化及 16 个序列化字段变体；原注册字段 15 项。
- [ ] 玩家轨道式定位与停止：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（57 条引用）、Npc（7 条引用）
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

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=AvatarGrindToPos) · [原字段、进度与全部实例 JSON](AvatarGrindToPos.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n362](../Objects.level.bin对象实现清单.html#CandleSpace%3An362) | BstNode_2529559061 | 20%（2/10），运行待验 | 1 / 2 | CandleSpace · 76521 + 75 bytes |
| [n73](../Objects.level.bin对象实现清单.html#Dawn%3An73) | BstNode_656801799 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 45488 + 74 bytes |
| [n225](../Objects.level.bin对象实现清单.html#Dawn%3An225) | BstNode_2446917751 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 68320 + 75 bytes |
| [n456](../Objects.level.bin对象实现清单.html#Dawn%3An456) | BstNode_1293287714 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 102271 + 75 bytes |
| [n1366](../Objects.level.bin对象实现清单.html#Dawn%3An1366) | BstNode_3122856123 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 242683 + 75 bytes |
| [n1539](../Objects.level.bin对象实现清单.html#Dawn%3An1539) | BstNode_1293287867 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 268314 + 75 bytes |
| [n1793](../Objects.level.bin对象实现清单.html#Dawn%3An1793) | BstNode_656801812 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 301493 + 74 bytes |
| [n2083](../Objects.level.bin对象实现清单.html#Dawn%3An2083) | BstNode_3122856239 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 341241 + 75 bytes |
| [n2184](../Objects.level.bin对象实现清单.html#Dawn%3An2184) | BstNode_1293287724 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 359745 + 75 bytes |
| [n2299](../Objects.level.bin对象实现清单.html#Dawn%3An2299) | BstNode_3122856312 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 381072 + 75 bytes |
| [n2324](../Objects.level.bin对象实现清单.html#Dawn%3An2324) | BstNode_1293287733 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 384686 + 75 bytes |
| [n2829](../Objects.level.bin对象实现清单.html#Dawn%3An2829) | BstNode_3122856341 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 463735 + 75 bytes |
| [n558](../Objects.level.bin对象实现清单.html#DayEnd%3An558) | BstNode_1167523867 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 129076 + 75 bytes |
| [n235](../Objects.level.bin对象实现清单.html#Dusk%3An235) | BstNode_2345992694 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 67424 + 75 bytes |
| [n986](../Objects.level.bin对象实现清单.html#Dusk%3An986) | BstNode_2345992657 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 201578 + 75 bytes |
| [n29](../Objects.level.bin对象实现清单.html#HubReveal%3An29) | BstNode_15 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 33398 + 67 bytes |
| [n932](../Objects.level.bin对象实现清单.html#HubReveal%3An932) | BstNode_3156082769 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 186760 + 75 bytes |
| [n1196](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1196) | BstNode_2529558548 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 259767 + 75 bytes |
| [n179](../Objects.level.bin对象实现清单.html#Rain%3An179) | BstNode_140 | 20%（2/10），运行待验 | 1 / 2 | Rain · 68561 + 68 bytes |
| [n380](../Objects.level.bin对象实现清单.html#Rain%3An380) | BstNode_2227 | 20%（2/10），运行待验 | 1 / 2 | Rain · 113590 + 69 bytes |
| [n753](../Objects.level.bin对象实现清单.html#Rain%3An753) | BstNode_510 | 20%（2/10），运行待验 | 1 / 2 | Rain · 199727 + 68 bytes |
| [n21](../Objects.level.bin对象实现清单.html#RainMid%3An21) | BstNode_2345993200 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 30083 + 75 bytes |
| [n139](../Objects.level.bin对象实现清单.html#SkyHub2%3An139) | BstNode_2279670123 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 58706 + 75 bytes |
| [n340](../Objects.level.bin对象实现清单.html#SkyHub2%3An340) | BstNode_2529558664 | 20%（2/10），运行待验 | 3 / 1 | SkyHub2 · 98267 + 75 bytes |
| [n573](../Objects.level.bin对象实现清单.html#SkyHub2%3An573) | BstNode_2529558576 | 20%（2/10），运行待验 | 3 / 2 | SkyHub2 · 139477 + 75 bytes |
| [n888](../Objects.level.bin对象实现清单.html#SkyHub2%3An888) | BstNode_2529558658 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 195178 + 75 bytes |
| [n1004](../Objects.level.bin对象实现清单.html#SkyHub2%3An1004) | BstNode_2529558534 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 216514 + 75 bytes |
| [n1162](../Objects.level.bin对象实现清单.html#SkyHub2%3An1162) | BstNode_1167524409 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 244228 + 75 bytes |
| [n1197](../Objects.level.bin对象实现清单.html#SkyHub2%3An1197) | BstNode_2529558698 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 250012 + 75 bytes |
| [n1283](../Objects.level.bin对象实现清单.html#SkyHub2%3An1283) | BstNode_2529558569 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 263416 + 75 bytes |
| [n1322](../Objects.level.bin对象实现清单.html#SkyHub2%3An1322) | BstNode_2446917895 | 20%（2/10），运行待验 | 3 / 0 | SkyHub2 · 269154 + 75 bytes |
| [n1334](../Objects.level.bin对象实现清单.html#SkyHub2%3An1334) | BstNode_2529558637 | 20%（2/10），运行待验 | 3 / 1 | SkyHub2 · 270584 + 75 bytes |
| [n1345](../Objects.level.bin对象实现清单.html#SkyHub2%3An1345) | BstNode_1167524403 | 20%（2/10），运行待验 | 3 / 1 | SkyHub2 · 271830 + 75 bytes |
| [n1386](../Objects.level.bin对象实现清单.html#SkyHub2%3An1386) | BstNode_2529558709 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 275311 + 75 bytes |
| [n1452](../Objects.level.bin对象实现清单.html#SkyHub2%3An1452) | BstNode_1167523992 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 283931 + 75 bytes |
| [n1739](../Objects.level.bin对象实现清单.html#SkyHub2%3An1739) | BstNode_1167524161 | 20%（2/10），运行待验 | 3 / 1 | SkyHub2 · 330354 + 75 bytes |
| [n1992](../Objects.level.bin对象实现清单.html#SkyHub2%3An1992) | BstNode_1167524150 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 377107 + 75 bytes |
| [n2159](../Objects.level.bin对象实现清单.html#SkyHub2%3An2159) | BstNode_1167524406 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 406414 + 75 bytes |
| [n2328](../Objects.level.bin对象实现清单.html#SkyHub2%3An2328) | BstNode_1167523952 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 439199 + 75 bytes |
| [n547](../Objects.level.bin对象实现清单.html#StormEnd%3An547) | BstNode_2446917751 | 20%（2/10），运行待验 | 1 / 2 | StormEnd · 120133 + 75 bytes |
| [n584](../Objects.level.bin对象实现清单.html#StormEnd%3An584) | BstNode_2446917745 | 20%（2/10），运行待验 | 1 / 2 | StormEnd · 123935 + 75 bytes |
| [n588](../Objects.level.bin对象实现清单.html#StormEnd%3An588) | BstNode_2529559315 | 20%（2/10），运行待验 | 1 / 2 | StormEnd · 124300 + 75 bytes |
| [n662](../Objects.level.bin对象实现清单.html#StormEnd%3An662) | BstNode_2446917748 | 20%（2/10），运行待验 | 1 / 2 | StormEnd · 135406 + 75 bytes |
| [n44](../Objects.level.bin对象实现清单.html#TitleWater%3An44) | BstNode_1528234047 | 20%（2/10），运行待验 | 1 / 0 | TitleWater · 22986 + 75 bytes |
| [n45](../Objects.level.bin对象实现清单.html#TitleWater%3An45) | BstNode_1528234049 | 20%（2/10），运行待验 | 1 / 1 | TitleWater · 23061 + 75 bytes |
| [n191](../Objects.level.bin对象实现清单.html#TitleWater%3An191) | BstNode_39 | 20%（2/10），运行待验 | 1 / 2 | TitleWater · 43736 + 67 bytes |
