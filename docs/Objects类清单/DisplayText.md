# DisplayText 单独类功能实现清单

功能分类：按钮、文字与菜单。

此类职责：**文字、颜色、位置与淡入淡出**。

类清单进度 30%（3/10），30 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：DisplayText 的原默认值、继承初始化及 21 个序列化字段变体；原注册字段 20 项。
- [ ] 文字、颜色、位置与淡入淡出：30 个节点和字段已清点；字体、定位、投影、图层、计时及淡入淡出待恢复。
- [ ] 依赖调用与事件：Float（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 20 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

30 个节点和字段已清点；字体、定位、投影、图层、计时及淡入淡出待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=DisplayText) · [原字段、进度与全部实例 JSON](DisplayText.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n430](../Objects.level.bin对象实现清单.html#CandleSpace%3An430) | BstNode_2446917701 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 86946 + 177 bytes |
| [n135](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An135) | BstNode_3156082696 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 35473 + 176 bytes |
| [n359](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An359) | BstNode_3156082701 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 85632 + 176 bytes |
| [n398](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An398) | BstNode_3156082700 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 91323 + 176 bytes |
| [n16](../Objects.level.bin对象实现清单.html#CarryLand%3An16) | BstNode_3707306057 | 20%（2/10），运行待验 | 0 / 0 | CarryLand · 11329 + 188 bytes |
| [n73](../Objects.level.bin对象实现清单.html#CarryLand%3An73) | BstNode_3707306056 | 20%（2/10），运行待验 | 0 / 0 | CarryLand · 19799 + 195 bytes |
| [n89](../Objects.level.bin对象实现清单.html#CarryLand%3An89) | BstNode_3707306055 | 20%（2/10），运行待验 | 0 / 0 | CarryLand · 21812 + 188 bytes |
| [n18](../Objects.level.bin对象实现清单.html#CarryLand2%3An18) | BstNode_3707306057 | 20%（2/10），运行待验 | 0 / 0 | CarryLand2 · 15839 + 188 bytes |
| [n22](../Objects.level.bin对象实现清单.html#CarryLand2%3An22) | BstNode_3707306056 | 20%（2/10），运行待验 | 0 / 0 | CarryLand2 · 16590 + 195 bytes |
| [n42](../Objects.level.bin对象实现清单.html#CarryLand2%3An42) | BstNode_3707306055 | 20%（2/10），运行待验 | 0 / 0 | CarryLand2 · 19634 + 188 bytes |
| [n187](../Objects.level.bin对象实现清单.html#CarryLand2%3An187) | BstNode_3707306198 | 20%（2/10），运行待验 | 0 / 1 | CarryLand2 · 44047 + 171 bytes |
| [n143](../Objects.level.bin对象实现清单.html#Dawn%3An143) | BstNode_2446917908 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 56839 + 176 bytes |
| [n318](../Objects.level.bin对象实现清单.html#Dawn%3An318) | BstNode_2446917911 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 83125 + 176 bytes |
| [n331](../Objects.level.bin对象实现清单.html#Dawn%3An331) | BstNode_3122855971 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 84989 + 176 bytes |
| [n971](../Objects.level.bin对象实现清单.html#Dawn%3An971) | BstNode_2446917909 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 183907 + 176 bytes |
| [n1169](../Objects.level.bin对象实现清单.html#Dawn%3An1169) | BstNode_2446917681 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 208325 + 176 bytes |
| [n1842](../Objects.level.bin对象实现清单.html#Dawn%3An1842) | BstNode_2446917910 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 307267 + 176 bytes |
| [n2206](../Objects.level.bin对象实现清单.html#Dawn%3An2206) | BstNode_2446917738 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 363625 + 172 bytes |
| [n2318](../Objects.level.bin对象实现清单.html#Dawn%3An2318) | BstNode_2446917688 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 384214 + 176 bytes |
| [n2779](../Objects.level.bin对象实现清单.html#Dawn%3An2779) | BstNode_2446917700 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 457116 + 176 bytes |
| [n2892](../Objects.level.bin对象实现清单.html#Dawn%3An2892) | BstNode_2446917736 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 474893 + 172 bytes |
| [n245](../Objects.level.bin对象实现清单.html#NightEntrance%3An245) | BstNode_2279669770 | 20%（2/10），运行待验 | 0 / 2 | NightEntrance · 53263 + 121 bytes |
| [n1922](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1922) | BstNode_2446917924 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 343195 + 164 bytes |
| [n840](../Objects.level.bin对象实现清单.html#SkyHub2%3An840) | BstNode_2446917701 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 186863 + 177 bytes |
| [n2325](../Objects.level.bin对象实现清单.html#SkyHub2%3An2325) | BstNode_1682898984 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 437853 + 177 bytes |
| [n407](../Objects.level.bin对象实现清单.html#Storm%3An407) | BstNode_2529560077 | 20%（2/10），运行待验 | 0 / 1 | Storm · 96400 + 166 bytes |
| [n182](../Objects.level.bin对象实现清单.html#StormEnd%3An182) | BstNode_2529559297 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 52035 + 176 bytes |
| [n477](../Objects.level.bin对象实现清单.html#StormEnd%3An477) | BstNode_3156082698 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 108484 + 173 bytes |
| [n623](../Objects.level.bin对象实现清单.html#StormEnd%3An623) | BstNode_3156082697 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 129301 + 178 bytes |
| [n360](../Objects.level.bin对象实现清单.html#SunsetEnd%3An360) | BstNode_1167523949 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 90941 + 180 bytes |
