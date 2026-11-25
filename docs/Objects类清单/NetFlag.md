# NetFlag 单独类功能实现清单

功能分类：网络、账户与社交流程。

此类职责：**网络标志声明，实际行为待恢复**。

类清单进度 20%（2/10），34 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：NetFlag 的原默认值、继承初始化及 0 个序列化字段变体；原注册字段 0 项。
- [ ] 网络标志声明，实际行为待恢复：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=NetFlag) · [原字段、进度与全部实例 JSON](NetFlag.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n292](../Objects.level.bin对象实现清单.html#CandleSpace%3An292) | BstNode_2446917764 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 66188 + 23 bytes |
| [n1083](../Objects.level.bin对象实现清单.html#Dawn%3An1083) | BstNode_501 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 199069 + 16 bytes |
| [n1313](../Objects.level.bin对象实现清单.html#Dawn%3An1313) | BstNode_1696 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 236063 + 17 bytes |
| [n1851](../Objects.level.bin对象实现清单.html#Dawn%3An1851) | BstNode_2446917720 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 309045 + 23 bytes |
| [n2094](../Objects.level.bin对象实现清单.html#Dawn%3An2094) | BstNode_2446917725 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 343177 + 23 bytes |
| [n334](../Objects.level.bin对象实现清单.html#DayEnd%3An334) | BstNode_2446917664 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 86976 + 23 bytes |
| [n783](../Objects.level.bin对象实现清单.html#DayEnd%3An783) | BstNode_2446917665 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 172612 + 23 bytes |
| [n840](../Objects.level.bin对象实现清单.html#DayEnd%3An840) | BstNode_2446917697 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 182237 + 23 bytes |
| [n576](../Objects.level.bin对象实现清单.html#DayHubCave%3An576) | BstNode_2345992683 | 20%（2/10），运行待验 | 0 / 2 | DayHubCave · 134220 + 23 bytes |
| [n931](../Objects.level.bin对象实现清单.html#DuskMid%3An931) | BstNode_2345992538 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 199416 + 23 bytes |
| [n508](../Objects.level.bin对象实现清单.html#Night%3An508) | BstNode_1350 | 20%（2/10），运行待验 | 0 / 2 | Night · 99098 + 17 bytes |
| [n893](../Objects.level.bin对象实现清单.html#Night%3An893) | BstNode_1348 | 20%（2/10），运行待验 | 0 / 2 | Night · 156652 + 17 bytes |
| [n1395](../Objects.level.bin对象实现清单.html#Night%3An1395) | BstNode_34603397 | 20%（2/10），运行待验 | 0 / 2 | Night · 226374 + 21 bytes |
| [n1441](../Objects.level.bin对象实现清单.html#Night%3An1441) | BstNode_1351 | 20%（2/10），运行待验 | 0 / 2 | Night · 232228 + 17 bytes |
| [n2650](../Objects.level.bin对象实现清单.html#Night%3An2650) | BstNode_1349 | 20%（2/10），运行待验 | 0 / 2 | Night · 413512 + 17 bytes |
| [n2702](../Objects.level.bin对象实现清单.html#Night%3An2702) | BstNode_1346 | 20%（2/10），运行待验 | 0 / 2 | Night · 421120 + 17 bytes |
| [n370](../Objects.level.bin对象实现清单.html#Prairie_Village%3An370) | BstNode_975 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 89938 + 16 bytes |
| [n1036](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1036) | BstNode_2753888270 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 201802 + 23 bytes |
| [n1613](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1613) | BstNode_2753888271 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 289225 + 23 bytes |
| [n1727](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1727) | BstNode_2753888272 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 306809 + 23 bytes |
| [n642](../Objects.level.bin对象实现清单.html#Rain%3An642) | BstNode_2345992581 | 20%（2/10），运行待验 | 0 / 2 | Rain · 174876 + 23 bytes |
| [n689](../Objects.level.bin对象实现清单.html#RainEnd%3An689) | BstNode_2345993037 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 195761 + 23 bytes |
| [n1549](../Objects.level.bin对象实现清单.html#RainEnd%3An1549) | BstNode_2446917637 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 394080 + 23 bytes |
| [n16](../Objects.level.bin对象实现清单.html#RainMid%3An16) | BstNode_2345992881 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 29386 + 23 bytes |
| [n284](../Objects.level.bin对象实现清单.html#RainMid%3An284) | BstNode_2345992880 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 80712 + 23 bytes |
| [n1319](../Objects.level.bin对象实现清单.html#RainMid%3An1319) | BstNode_2345992882 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 267411 + 23 bytes |
| [n939](../Objects.level.bin对象实现清单.html#Sunset%3An939) | BstNode_2446917679 | 20%（2/10），运行待验 | 0 / 3 | Sunset · 189645 + 23 bytes |
| [n972](../Objects.level.bin对象实现清单.html#Sunset%3An972) | BstNode_2446917685 | 20%（2/10），运行待验 | 0 / 3 | Sunset · 194222 + 23 bytes |
| [n1373](../Objects.level.bin对象实现清单.html#Sunset%3An1373) | BstNode_2446917697 | 20%（2/10），运行待验 | 0 / 3 | Sunset · 257541 + 23 bytes |
| [n23](../Objects.level.bin对象实现清单.html#SunsetEnd%3An23) | BstNode_1167524628 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 29205 + 23 bytes |
| [n478](../Objects.level.bin对象实现清单.html#SunsetEnd%3An478) | BstNode_1167523847 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 109064 + 23 bytes |
| [n981](../Objects.level.bin对象实现清单.html#SunsetEnd%3An981) | BstNode_1167523844 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 189331 + 23 bytes |
| [n1595](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1595) | BstNode_2446917644 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 297643 + 23 bytes |
| [n393](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An393) | BstNode_2184 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd2 · 102728 + 17 bytes |
