# DoShout 单独类功能实现清单

功能分类：玩家状态与输入。

此类职责：**在指定位置发起喊叫效果**。

类清单进度 30%（3/10），59 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：DoShout 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 在指定位置发起喊叫效果：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（59 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=DoShout) · [原字段、进度与全部实例 JSON](DoShout.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n5](../Objects.level.bin对象实现清单.html#Dawn%3An5) | BstNode_1293287569 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 33446 + 32 bytes |
| [n38](../Objects.level.bin对象实现清单.html#Dawn%3An38) | BstNode_3122856004 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 39990 + 32 bytes |
| [n83](../Objects.level.bin对象实现清单.html#Dawn%3An83) | BstNode_656801885 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 46887 + 31 bytes |
| [n309](../Objects.level.bin对象实现清单.html#Dawn%3An309) | BstNode_3122856133 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 81298 + 32 bytes |
| [n367](../Objects.level.bin对象实现清单.html#Dawn%3An367) | BstNode_1293287584 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 89046 + 32 bytes |
| [n449](../Objects.level.bin对象实现清单.html#Dawn%3An449) | BstNode_3122856002 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 101057 + 32 bytes |
| [n455](../Objects.level.bin对象实现清单.html#Dawn%3An455) | BstNode_1293287562 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 102239 + 32 bytes |
| [n488](../Objects.level.bin对象实现清单.html#Dawn%3An488) | BstNode_656801811 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 107912 + 31 bytes |
| [n507](../Objects.level.bin对象实现清单.html#Dawn%3An507) | BstNode_3122855993 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 111836 + 32 bytes |
| [n576](../Objects.level.bin对象实现清单.html#Dawn%3An576) | BstNode_1293287559 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 122649 + 32 bytes |
| [n618](../Objects.level.bin对象实现清单.html#Dawn%3An618) | BstNode_3122856015 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 128648 + 32 bytes |
| [n897](../Objects.level.bin对象实现清单.html#Dawn%3An897) | BstNode_284 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 175102 + 25 bytes |
| [n943](../Objects.level.bin对象实现清单.html#Dawn%3An943) | BstNode_1293287527 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 179794 + 32 bytes |
| [n1080](../Objects.level.bin对象实现清单.html#Dawn%3An1080) | BstNode_3122856172 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 198189 + 32 bytes |
| [n1161](../Objects.level.bin对象实现清单.html#Dawn%3An1161) | BstNode_3122856181 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 207805 + 32 bytes |
| [n1175](../Objects.level.bin对象实现清单.html#Dawn%3An1175) | BstNode_656801890 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 208876 + 31 bytes |
| [n1322](../Objects.level.bin对象实现清单.html#Dawn%3An1322) | BstNode_656801886 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 237961 + 31 bytes |
| [n1355](../Objects.level.bin对象实现清单.html#Dawn%3An1355) | BstNode_3122856290 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 241361 + 32 bytes |
| [n1561](../Objects.level.bin对象实现清单.html#Dawn%3An1561) | BstNode_3122856180 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 271160 + 32 bytes |
| [n1757](../Objects.level.bin对象实现清单.html#Dawn%3An1757) | BstNode_656801884 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 298338 + 31 bytes |
| [n1781](../Objects.level.bin对象实现清单.html#Dawn%3An1781) | BstNode_3122856297 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 300682 + 32 bytes |
| [n1805](../Objects.level.bin对象实现清单.html#Dawn%3An1805) | BstNode_656801883 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 303124 + 31 bytes |
| [n1833](../Objects.level.bin对象实现清单.html#Dawn%3An1833) | BstNode_656801882 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 306626 + 31 bytes |
| [n1848](../Objects.level.bin对象实现清单.html#Dawn%3An1848) | BstNode_3122856301 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 307897 + 32 bytes |
| [n1870](../Objects.level.bin对象实现清单.html#Dawn%3An1870) | BstNode_2504654883 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 310631 + 32 bytes |
| [n1895](../Objects.level.bin对象实现清单.html#Dawn%3An1895) | BstNode_1293287590 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 313308 + 32 bytes |
| [n1934](../Objects.level.bin对象实现清单.html#Dawn%3An1934) | BstNode_656801881 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 317881 + 31 bytes |
| [n1937](../Objects.level.bin对象实现清单.html#Dawn%3An1937) | BstNode_656801889 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 318373 + 31 bytes |
| [n1953](../Objects.level.bin对象实现清单.html#Dawn%3An1953) | BstNode_1293287578 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 320579 + 32 bytes |
| [n2140](../Objects.level.bin对象实现清单.html#Dawn%3An2140) | BstNode_1293287738 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 350362 + 32 bytes |
| [n2287](../Objects.level.bin对象实现清单.html#Dawn%3An2287) | BstNode_656801888 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 379011 + 31 bytes |
| [n2294](../Objects.level.bin对象实现清单.html#Dawn%3An2294) | BstNode_656801887 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 380046 + 31 bytes |
| [n2319](../Objects.level.bin对象实现清单.html#Dawn%3An2319) | BstNode_3122856177 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 384390 + 32 bytes |
| [n2322](../Objects.level.bin对象实现清单.html#Dawn%3An2322) | BstNode_3122856296 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 384624 + 32 bytes |
| [n2459](../Objects.level.bin对象实现清单.html#Dawn%3An2459) | BstNode_1293287639 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 409382 + 32 bytes |
| [n2581](../Objects.level.bin对象实现清单.html#Dawn%3An2581) | BstNode_219 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 430350 + 25 bytes |
| [n2744](../Objects.level.bin对象实现清单.html#Dawn%3An2744) | BstNode_3122855972 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 453810 + 32 bytes |
| [n2769](../Objects.level.bin对象实现清单.html#Dawn%3An2769) | BstNode_2446917735 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 456299 + 32 bytes |
| [n2821](../Objects.level.bin对象实现清单.html#Dawn%3An2821) | BstNode_2279669818 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 462522 + 32 bytes |
| [n2849](../Objects.level.bin对象实现清单.html#Dawn%3An2849) | BstNode_1842806920 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 466698 + 32 bytes |
| [n444](../Objects.level.bin对象实现清单.html#DuskMid%3An444) | BstNode_2783838217 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 98774 + 32 bytes |
| [n12](../Objects.level.bin对象实现清单.html#HubReveal%3An12) | BstNode_1167523864 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 30877 + 32 bytes |
| [n456](../Objects.level.bin对象实现清单.html#Night%3An456) | BstNode_1958 | 20%（2/10），运行待验 | 1 / 1 | Night · 92585 + 26 bytes |
| [n666](../Objects.level.bin对象实现清单.html#Night%3An666) | BstNode_1964 | 20%（2/10），运行待验 | 1 / 2 | Night · 121931 + 26 bytes |
| [n777](../Objects.level.bin对象实现清单.html#Night%3An777) | BstNode_34604481 | 20%（2/10），运行待验 | 1 / 2 | Night · 139541 + 30 bytes |
| [n965](../Objects.level.bin对象实现清单.html#Night%3An965) | BstNode_1962 | 20%（2/10），运行待验 | 1 / 1 | Night · 167585 + 26 bytes |
| [n1000](../Objects.level.bin对象实现清单.html#Night%3An1000) | BstNode_2482 | 20%（2/10），运行待验 | 1 / 3 | Night · 173565 + 26 bytes |
| [n1572](../Objects.level.bin对象实现清单.html#Night%3An1572) | BstNode_34604477 | 20%（2/10），运行待验 | 1 / 2 | Night · 246457 + 30 bytes |
| [n1763](../Objects.level.bin对象实现清单.html#Night%3An1763) | BstNode_1956 | 20%（2/10），运行待验 | 1 / 1 | Night · 274872 + 26 bytes |
| [n2226](../Objects.level.bin对象实现清单.html#Night%3An2226) | BstNode_1960 | 20%（2/10），运行待验 | 1 / 1 | Night · 350803 + 26 bytes |
| [n273](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An273) | BstNode_656801809 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 84203 + 31 bytes |
| [n338](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An338) | BstNode_656801811 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 99180 + 31 bytes |
| [n814](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An814) | BstNode_656801812 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 202527 + 31 bytes |
| [n88](../Objects.level.bin对象实现清单.html#Prairie_Village%3An88) | BstNode_235 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 44847 + 25 bytes |
| [n1104](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1104) | BstNode_2783838218 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 212436 + 32 bytes |
| [n2256](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2256) | BstNode_286 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 391706 + 25 bytes |
| [n2606](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2606) | BstNode_289 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 441427 + 25 bytes |
| [n593](../Objects.level.bin对象实现清单.html#RainForest%3An593) | BstNode_34603164 | 20%（2/10），运行待验 | 1 / 3 | RainForest · 136841 + 30 bytes |
| [n1388](../Objects.level.bin对象实现清单.html#RainMid%3An1388) | BstNode_2783838329 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 279820 + 32 bytes |
