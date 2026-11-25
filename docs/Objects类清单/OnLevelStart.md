# OnLevelStart 单独类功能实现清单

功能分类：地图加载、出生与检查点。

此类职责：**地图启动事件**。

类清单进度 30%（3/10），21 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：OnLevelStart 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 地图启动事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（21 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=OnLevelStart) · [原字段、进度与全部实例 JSON](OnLevelStart.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n194](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An194) | BstNode_3156082692 | 20%（2/10），运行待验 | 1 / 0 | CandleSpaceEnd · 49156 + 30 bytes |
| [n34](../Objects.level.bin对象实现清单.html#CarryLand%3An34) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | CarryLand · 13407 + 22 bytes |
| [n38](../Objects.level.bin对象实现清单.html#CarryLand2%3An38) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | CarryLand2 · 18847 + 22 bytes |
| [n31](../Objects.level.bin对象实现清单.html#CarryLand3%3An31) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | CarryLand3 · 9791 + 22 bytes |
| [n626](../Objects.level.bin对象实现清单.html#Dawn%3An626) | BstNode_1234 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 129518 + 24 bytes |
| [n2894](../Objects.level.bin对象实现清单.html#Dawn%3An2894) | BstNode_1842806870 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 475216 + 30 bytes |
| [n765](../Objects.level.bin对象实现清单.html#DayHubCave%3An765) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 166645 + 22 bytes |
| [n1013](../Objects.level.bin对象实现清单.html#Dusk%3An1013) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 207283 + 22 bytes |
| [n1516](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1516) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 375786 + 22 bytes |
| [n915](../Objects.level.bin对象实现清单.html#DuskMid%3An915) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 195822 + 22 bytes |
| [n109](../Objects.level.bin对象实现清单.html#HubReveal%3An109) | BstNode_1626 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 48086 + 24 bytes |
| [n2911](../Objects.level.bin对象实现清单.html#Night%3An2911) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | Night · 452337 + 22 bytes |
| [n606](../Objects.level.bin对象实现清单.html#NightEnd%3An606) | BstNode_34603095 | 20%（2/10），运行待验 | 1 / 1 | NightEnd · 122482 + 28 bytes |
| [n361](../Objects.level.bin对象实现清单.html#NightEntrance%3An361) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | NightEntrance · 69831 + 22 bytes |
| [n2839](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2839) | BstNode_1611 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 482035 + 24 bytes |
| [n700](../Objects.level.bin对象实现清单.html#RainEnd%3An700) | BstNode_69 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 198418 + 22 bytes |
| [n1098](../Objects.level.bin对象实现清单.html#RainForest%3An1098) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 247050 + 22 bytes |
| [n2251](../Objects.level.bin对象实现清单.html#SkyHub2%3An2251) | BstNode_10 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 424168 + 22 bytes |
| [n895](../Objects.level.bin对象实现清单.html#Sunset%3An895) | BstNode_1049166103 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 183054 + 30 bytes |
| [n1182](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1182) | BstNode_11 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 221363 + 22 bytes |
| [n188](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An188) | BstNode_11 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 59400 + 22 bytes |
