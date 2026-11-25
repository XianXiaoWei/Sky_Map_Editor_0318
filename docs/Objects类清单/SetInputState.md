# SetInputState 单独类功能实现清单

功能分类：玩家状态与输入。

此类职责：**玩家与摄像机输入开关**。

类清单进度 30%（3/10），38 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SetInputState 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 玩家与摄像机输入开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetInputState) · [原字段、进度与全部实例 JSON](SetInputState.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n198](../Objects.level.bin对象实现清单.html#CandleSpace%3An198) | BstNode_2529558697 | 20%（2/10），运行待验 | 0 / 3 | CandleSpace · 49749 + 33 bytes |
| [n431](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An431) | BstNode_2504654868 | 20%（2/10），运行待验 | 0 / 3 | CandleSpaceEnd · 95111 + 32 bytes |
| [n592](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An592) | BstNode_2504654999 | 20%（2/10），运行待验 | 0 / 3 | CandleSpaceEnd · 116689 + 32 bytes |
| [n110](../Objects.level.bin对象实现清单.html#Dawn%3An110) | BstNode_2446917768 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 50075 + 33 bytes |
| [n632](../Objects.level.bin对象实现清单.html#Dawn%3An632) | BstNode_1842806857 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 130737 + 33 bytes |
| [n882](../Objects.level.bin对象实现清单.html#Dawn%3An882) | BstNode_1842806899 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 172792 + 33 bytes |
| [n1264](../Objects.level.bin对象实现清单.html#Dawn%3An1264) | BstNode_1842806939 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 226737 + 33 bytes |
| [n2026](../Objects.level.bin对象实现清单.html#Dawn%3An2026) | BstNode_1293287689 | 20%（2/10），运行待验 | 0 / 29 | Dawn · 331831 + 33 bytes |
| [n2902](../Objects.level.bin对象实现清单.html#Dawn%3An2902) | BstNode_696 | 20%（2/10），运行待验 | 0 / 5 | Dawn · 475850 + 26 bytes |
| [n317](../Objects.level.bin对象实现清单.html#DayEnd%3An317) | BstNode_1167523869 | 20%（2/10），运行待验 | 0 / 3 | DayEnd · 84386 + 33 bytes |
| [n1078](../Objects.level.bin对象实现清单.html#DayEnd%3An1078) | BstNode_476 | 20%（2/10），运行待验 | 0 / 3 | DayEnd · 224789 + 26 bytes |
| [n683](../Objects.level.bin对象实现清单.html#Dusk%3An683) | BstNode_2345992380 | 20%（2/10），运行待验 | 0 / 4 | Dusk · 146589 + 32 bytes |
| [n939](../Objects.level.bin对象实现清单.html#Dusk%3An939) | BstNode_2345992649 | 20%（2/10），运行待验 | 0 / 3 | Dusk · 192266 + 32 bytes |
| [n52](../Objects.level.bin对象实现清单.html#DuskMid%3An52) | BstNode_2345992536 | 20%（2/10），运行待验 | 0 / 3 | DuskMid · 29834 + 32 bytes |
| [n5](../Objects.level.bin对象实现清单.html#HubReveal%3An5) | BstNode_630 | 20%（2/10），运行待验 | 0 / 6 | HubReveal · 30428 + 25 bytes |
| [n67](../Objects.level.bin对象实现清单.html#HubReveal%3An67) | BstNode_3156082731 | 20%（2/10），运行待验 | 0 / 3 | HubReveal · 40009 + 32 bytes |
| [n71](../Objects.level.bin对象实现清单.html#HubReveal%3An71) | BstNode_3156082762 | 20%（2/10），运行待验 | 0 / 3 | HubReveal · 40793 + 32 bytes |
| [n1329](../Objects.level.bin对象实现清单.html#HubReveal%3An1329) | BstNode_2529558615 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 255001 + 32 bytes |
| [n1388](../Objects.level.bin对象实现清单.html#HubReveal%3An1388) | BstNode_2529558560 | 20%（2/10），运行待验 | 0 / 3 | HubReveal · 262756 + 32 bytes |
| [n160](../Objects.level.bin对象实现清单.html#NightEnd%3An160) | BstNode_2504654885 | 20%（2/10），运行待验 | 0 / 4 | NightEnd · 47053 + 32 bytes |
| [n900](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An900) | BstNode_656801815 | 20%（2/10），运行待验 | 0 / 4 | Prairie_NestAndKeeper · 221680 + 32 bytes |
| [n1623](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1623) | BstNode_656801807 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Village · 290219 + 32 bytes |
| [n1602](../Objects.level.bin对象实现清单.html#Rain%3An1602) | BstNode_1533 | 20%（2/10），运行待验 | 0 / 3 | Rain · 385621 + 26 bytes |
| [n517](../Objects.level.bin对象实现清单.html#RainEnd%3An517) | BstNode_914 | 20%（2/10），运行待验 | 0 / 3 | RainEnd · 154935 + 25 bytes |
| [n1139](../Objects.level.bin对象实现清单.html#RainMid%3An1139) | BstNode_489 | 20%（2/10），运行待验 | 0 / 3 | RainMid · 235426 + 25 bytes |
| [n1839](../Objects.level.bin对象实现清单.html#RainMid%3An1839) | BstNode_2345993188 | 20%（2/10），运行待验 | 0 / 3 | RainMid · 360984 + 32 bytes |
| [n747](../Objects.level.bin对象实现清单.html#SkyHub2%3An747) | BstNode_2529558678 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 169626 + 33 bytes |
| [n797](../Objects.level.bin对象实现清单.html#SkyHub2%3An797) | BstNode_1167523954 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 180403 + 33 bytes |
| [n1872](../Objects.level.bin对象实现清单.html#SkyHub2%3An1872) | BstNode_1167524155 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 353109 + 33 bytes |
| [n2235](../Objects.level.bin对象实现清单.html#SkyHub2%3An2235) | BstNode_2529558615 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 421442 + 33 bytes |
| [n1611](../Objects.level.bin对象实现清单.html#Storm%3An1611) | BstNode_2529558651 | 20%（2/10），运行待验 | 0 / 2 | Storm · 306885 + 32 bytes |
| [n404](../Objects.level.bin对象实现清单.html#StormEnd%3An404) | BstNode_2446917725 | 20%（2/10），运行待验 | 0 / 3 | StormEnd · 94050 + 33 bytes |
| [n624](../Objects.level.bin对象实现清单.html#StormEnd%3An624) | BstNode_2446917754 | 20%（2/10），运行待验 | 0 / 3 | StormEnd · 129479 + 33 bytes |
| [n646](../Objects.level.bin对象实现清单.html#StormEnd%3An646) | BstNode_3156082786 | 20%（2/10），运行待验 | 0 / 3 | StormEnd · 133126 + 33 bytes |
| [n1091](../Objects.level.bin对象实现清单.html#StormEnd%3An1091) | BstNode_2529558651 | 20%（2/10），运行待验 | 0 / 3 | StormEnd · 210068 + 33 bytes |
| [n261](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An261) | BstNode_656801855 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd2 · 76105 + 32 bytes |
| [n0](../Objects.level.bin对象实现清单.html#TitleWater%3An0) | BstNode_2645622789 | 20%（2/10），运行待验 | 0 / 1 | TitleWater · 16293 + 33 bytes |
| [n183](../Objects.level.bin对象实现清单.html#TitleWater%3An183) | BstNode_73 | 20%（2/10），运行待验 | 0 / 3 | TitleWater · 42610 + 25 bytes |
