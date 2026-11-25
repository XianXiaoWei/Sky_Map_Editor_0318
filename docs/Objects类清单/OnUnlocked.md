# OnUnlocked 单独类功能实现清单

功能分类：收集物、蜡烛与解锁。

此类职责：**解锁、未确认与未解锁事件**。

类清单进度 30%（3/10），37 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：OnUnlocked 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 解锁、未确认与未解锁事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（59 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=OnUnlocked) · [原字段、进度与全部实例 JSON](OnUnlocked.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n143](../Objects.level.bin对象实现清单.html#CandleSpace%3An143) | BstNode_2529559051 | 20%（2/10），运行待验 | 2 / 1 | CandleSpace · 41817 + 48 bytes |
| [n215](../Objects.level.bin对象实现清单.html#CandleSpace%3An215) | BstNode_1293287436 | 20%（2/10），运行待验 | 1 / 1 | CandleSpace · 52490 + 51 bytes |
| [n348](../Objects.level.bin对象实现清单.html#CandleSpace%3An348) | BstNode_3156082716 | 20%（2/10），运行待验 | 2 / 1 | CandleSpace · 74923 + 50 bytes |
| [n422](../Objects.level.bin对象实现清单.html#CandleSpace%3An422) | BstNode_2529558564 | 20%（2/10），运行待验 | 1 / 1 | CandleSpace · 85990 + 52 bytes |
| [n444](../Objects.level.bin对象实现清单.html#CandleSpace%3An444) | BstNode_2446917742 | 20%（2/10），运行待验 | 2 / 2 | CandleSpace · 88170 + 50 bytes |
| [n2724](../Objects.level.bin对象实现清单.html#Dawn%3An2724) | BstNode_2529558650 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 451667 + 48 bytes |
| [n776](../Objects.level.bin对象实现清单.html#DayEnd%3An776) | BstNode_2446917741 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 171772 + 48 bytes |
| [n1086](../Objects.level.bin对象实现清单.html#DuskMid%3An1086) | BstNode_2446917654 | 20%（2/10），运行待验 | 2 / 2 | DuskMid · 226136 + 49 bytes |
| [n439](../Objects.level.bin对象实现清单.html#HubReveal%3An439) | BstNode_2446917663 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 105323 + 45 bytes |
| [n584](../Objects.level.bin对象实现清单.html#HubReveal%3An584) | BstNode_3156082787 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 128931 + 45 bytes |
| [n739](../Objects.level.bin对象实现清单.html#HubReveal%3An739) | BstNode_3156082760 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 153239 + 48 bytes |
| [n317](../Objects.level.bin对象实现清单.html#NightEnd%3An317) | BstNode_2446917656 | 20%（2/10），运行待验 | 2 / 2 | NightEnd · 74100 + 50 bytes |
| [n133](../Objects.level.bin对象实现清单.html#RainEnd%3An133) | BstNode_2446917736 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 60048 + 49 bytes |
| [n15](../Objects.level.bin对象实现清单.html#SkyHub2%3An15) | BstNode_2446917890 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 34606 + 63 bytes |
| [n106](../Objects.level.bin对象实现清单.html#SkyHub2%3An106) | BstNode_1167523964 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 53209 + 55 bytes |
| [n184](../Objects.level.bin对象实现清单.html#SkyHub2%3An184) | BstNode_2529558876 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 66499 + 51 bytes |
| [n341](../Objects.level.bin对象实现清单.html#SkyHub2%3An341) | BstNode_2529558878 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 98342 + 51 bytes |
| [n496](../Objects.level.bin对象实现清单.html#SkyHub2%3An496) | BstNode_2446917770 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 125957 + 45 bytes |
| [n776](../Objects.level.bin对象实现清单.html#SkyHub2%3An776) | BstNode_2446917899 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 174420 + 43 bytes |
| [n786](../Objects.level.bin对象实现清单.html#SkyHub2%3An786) | BstNode_2529558880 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 177622 + 52 bytes |
| [n903](../Objects.level.bin对象实现清单.html#SkyHub2%3An903) | BstNode_2529558731 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 197590 + 45 bytes |
| [n1003](../Objects.level.bin对象实现清单.html#SkyHub2%3An1003) | BstNode_2529558732 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 216469 + 45 bytes |
| [n1031](../Objects.level.bin对象实现清单.html#SkyHub2%3An1031) | BstNode_2446917881 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 220329 + 50 bytes |
| [n1135](../Objects.level.bin对象实现清单.html#SkyHub2%3An1135) | BstNode_2529558877 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 239828 + 53 bytes |
| [n1372](../Objects.level.bin对象实现清单.html#SkyHub2%3An1372) | BstNode_2446917893 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 274102 + 50 bytes |
| [n1466](../Objects.level.bin对象实现清单.html#SkyHub2%3An1466) | BstNode_1167523895 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 285266 + 63 bytes |
| [n1552](../Objects.level.bin对象实现清单.html#SkyHub2%3An1552) | BstNode_1293287436 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 298943 + 51 bytes |
| [n1723](../Objects.level.bin对象实现清单.html#SkyHub2%3An1723) | BstNode_2529558604 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 328499 + 45 bytes |
| [n1775](../Objects.level.bin对象实现清单.html#SkyHub2%3An1775) | BstNode_2529558843 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 334985 + 51 bytes |
| [n1778](../Objects.level.bin对象实现清单.html#SkyHub2%3An1778) | BstNode_2529558859 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 335850 + 63 bytes |
| [n2134](../Objects.level.bin对象实现清单.html#SkyHub2%3An2134) | BstNode_1167524069 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 400825 + 52 bytes |
| [n2175](../Objects.level.bin对象实现清单.html#SkyHub2%3An2175) | BstNode_2446917842 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 409438 + 62 bytes |
| [n2262](../Objects.level.bin对象实现清单.html#SkyHub2%3An2262) | BstNode_2529558730 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 426169 + 45 bytes |
| [n2333](../Objects.level.bin对象实现清单.html#SkyHub2%3An2333) | BstNode_2529558879 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 440330 + 52 bytes |
| [n732](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An732) | BstNode_2446917658 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd2 · 180875 + 51 bytes |
| [n79](../Objects.level.bin对象实现清单.html#TitleWater%3An79) | BstNode_1528234019 | 20%（2/10），运行待验 | 3 / 1 | TitleWater · 27276 + 48 bytes |
| [n143](../Objects.level.bin对象实现清单.html#TitleWater%3An143) | BstNode_3156082691 | 20%（2/10），运行待验 | 2 / 0 | TitleWater · 36339 + 48 bytes |
