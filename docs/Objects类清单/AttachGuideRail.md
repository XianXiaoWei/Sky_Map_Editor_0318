# AttachGuideRail 单独类功能实现清单

功能分类：轨道、导航与引导。

此类职责：**附加轨道引导与运动限制**。

类清单进度 30%（3/10），20 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：AttachGuideRail 的原默认值、继承初始化及 13 个序列化字段变体；原注册字段 12 项。
- [ ] 附加轨道引导与运动限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Rail（20 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=AttachGuideRail) · [原字段、进度与全部实例 JSON](AttachGuideRail.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n1196](../Objects.level.bin对象实现清单.html#Dawn%3An1196) | BstNode_3156082736 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 212221 + 54 bytes |
| [n1602](../Objects.level.bin对象实现清单.html#Dawn%3An1602) | BstNode_3156082714 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 276283 + 54 bytes |
| [n1609](../Objects.level.bin对象实现清单.html#Dawn%3An1609) | BstNode_3156082712 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 277041 + 54 bytes |
| [n1243](../Objects.level.bin对象实现清单.html#DayEnd%3An1243) | BstNode_615 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 258605 + 47 bytes |
| [n528](../Objects.level.bin对象实现清单.html#Dusk%3An528) | BstNode_2345992279 | 20%（2/10），运行待验 | 1 / 1 | Dusk · 123318 + 54 bytes |
| [n787](../Objects.level.bin对象实现清单.html#HubReveal%3An787) | BstNode_239 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 160892 + 47 bytes |
| [n490](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An490) | BstNode_1167523906 | 20%（2/10），运行待验 | 1 / 3 | Prairie_ButterflyFields · 127983 + 54 bytes |
| [n69](../Objects.level.bin对象实现清单.html#Prairie_Village%3An69) | BstNode_3156082724 | 20%（2/10），运行待验 | 1 / 6 | Prairie_Village · 42198 + 54 bytes |
| [n436](../Objects.level.bin对象实现清单.html#Prairie_Village%3An436) | BstNode_1167524122 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 102751 + 54 bytes |
| [n470](../Objects.level.bin对象实现清单.html#Prairie_Village%3An470) | BstNode_1167524120 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 108578 + 54 bytes |
| [n2170](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2170) | BstNode_1167524121 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 378948 + 54 bytes |
| [n90](../Objects.level.bin对象实现清单.html#RainEnd%3An90) | BstNode_773 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 50056 + 47 bytes |
| [n556](../Objects.level.bin对象实现清单.html#SkyHub2%3An556) | BstNode_1167524090 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 136641 + 54 bytes |
| [n1131](../Objects.level.bin对象实现清单.html#SkyHub2%3An1131) | BstNode_1167524331 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 239311 + 54 bytes |
| [n1183](../Objects.level.bin对象实现清单.html#SkyHub2%3An1183) | BstNode_1167524329 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 247715 + 54 bytes |
| [n2254](../Objects.level.bin对象实现清单.html#SkyHub2%3An2254) | BstNode_1167523942 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 424972 + 54 bytes |
| [n2367](../Objects.level.bin对象实现清单.html#SkyHub2%3An2367) | BstNode_1167524332 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 446106 + 54 bytes |
| [n137](../Objects.level.bin对象实现清单.html#Sunset%3An137) | BstNode_68 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 50595 + 46 bytes |
| [n41](../Objects.level.bin对象实现清单.html#SunsetEnd%3An41) | BstNode_2345992211 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 32947 + 54 bytes |
| [n38](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An38) | BstNode_2345992211 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 29323 + 54 bytes |
