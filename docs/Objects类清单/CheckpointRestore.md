# CheckpointRestore 单独类功能实现清单

功能分类：地图加载、出生与检查点。

此类职责：**恢复检查点与重载控制**。

类清单进度 30%（3/10），24 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：CheckpointRestore 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 恢复检查点与重载控制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=CheckpointRestore) · [原字段、进度与全部实例 JSON](CheckpointRestore.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n2783](../Objects.level.bin对象实现清单.html#Dawn%3An2783) | BstNode_2446917715 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 458065 + 25 bytes |
| [n1034](../Objects.level.bin对象实现清单.html#DayEnd%3An1034) | BstNode_1167523889 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 218156 + 25 bytes |
| [n449](../Objects.level.bin对象实现清单.html#DayHubCave%3An449) | BstNode_2345992692 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 108097 + 25 bytes |
| [n1001](../Objects.level.bin对象实现清单.html#Dusk%3An1001) | BstNode_2345992296 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 205618 + 24 bytes |
| [n122](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An122) | BstNode_2345992556 | 20%（2/10），运行待验 | 0 / 1 | DuskGraveyard · 53326 + 25 bytes |
| [n395](../Objects.level.bin对象实现清单.html#DuskMid%3An395) | BstNode_2345992374 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 89591 + 25 bytes |
| [n597](../Objects.level.bin对象实现清单.html#HubReveal%3An597) | BstNode_3315269634 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 130890 + 25 bytes |
| [n1671](../Objects.level.bin对象实现清单.html#Night%3An1671) | BstNode_34603450 | 20%（2/10），运行待验 | 0 / 0 | Night · 262847 + 23 bytes |
| [n120](../Objects.level.bin对象实现清单.html#NightEnd%3An120) | BstNode_2446917642 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 41173 + 25 bytes |
| [n450](../Objects.level.bin对象实现清单.html#NightEntrance%3An450) | BstNode_2345992363 | 20%（2/10），运行待验 | 0 / 1 | NightEntrance · 84243 + 25 bytes |
| [n566](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An566) | BstNode_1167523876 | 20%（2/10），运行待验 | 0 / 1 | Prairie_ButterflyFields · 144709 + 25 bytes |
| [n797](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An797) | BstNode_1167523876 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 199829 + 25 bytes |
| [n629](../Objects.level.bin对象实现清单.html#Prairie_Village%3An629) | BstNode_1167523876 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 131893 + 25 bytes |
| [n2](../Objects.level.bin对象实现清单.html#Rain%3An2) | BstNode_2345992921 | 20%（2/10），运行待验 | 0 / 1 | Rain · 28635 + 25 bytes |
| [n276](../Objects.level.bin对象实现清单.html#RainEnd%3An276) | BstNode_2345992573 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 95361 + 25 bytes |
| [n1](../Objects.level.bin对象实现清单.html#RainForest%3An1) | BstNode_2345992921 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 21357 + 25 bytes |
| [n935](../Objects.level.bin对象实现清单.html#RainMid%3An935) | BstNode_2345992382 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 198179 + 25 bytes |
| [n1362](../Objects.level.bin对象实现清单.html#SkyHub2%3An1362) | BstNode_3315269634 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 272867 + 25 bytes |
| [n672](../Objects.level.bin对象实现清单.html#Storm%3An672) | BstNode_2529559995 | 20%（2/10），运行待验 | 0 / 3 | Storm · 143016 + 25 bytes |
| [n220](../Objects.level.bin对象实现清单.html#StormEnd%3An220) | BstNode_2345992677 | 20%（2/10），运行待验 | 0 / 1 | StormEnd · 57998 + 25 bytes |
| [n1600](../Objects.level.bin对象实现清单.html#Sunset%3An1600) | BstNode_1167523857 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 294773 + 25 bytes |
| [n866](../Objects.level.bin对象实现清单.html#SunsetEnd%3An866) | BstNode_1167524291 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 171006 + 25 bytes |
| [n277](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An277) | BstNode_1167524291 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd2 · 80211 + 25 bytes |
| [n1519](../Objects.level.bin对象实现清单.html#SunsetRace%3An1519) | BstNode_1167524091 | 20%（2/10），运行待验 | 0 / 1 | SunsetRace · 310589 + 25 bytes |
