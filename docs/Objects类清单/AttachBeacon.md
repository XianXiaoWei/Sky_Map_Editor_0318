# AttachBeacon 单独类功能实现清单

功能分类：轨道、导航与引导。

此类职责：**空间信标、颜色与强度过渡**。

类清单进度 30%（3/10），14 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：AttachBeacon 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 空间信标、颜色与强度过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（14 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=AttachBeacon) · [原字段、进度与全部实例 JSON](AttachBeacon.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n339](../Objects.level.bin对象实现清单.html#Dawn%3An339) | BstNode_3122856088 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 85683 + 64 bytes |
| [n1470](../Objects.level.bin对象实现清单.html#Dawn%3An1470) | BstNode_1354 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 258833 + 58 bytes |
| [n1640](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1640) | BstNode_2345992466 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 406524 + 64 bytes |
| [n103](../Objects.level.bin对象实现清单.html#RainEnd%3An103) | BstNode_840696125 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 52740 + 63 bytes |
| [n437](../Objects.level.bin对象实现清单.html#RainEnd%3An437) | BstNode_584 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 135578 + 57 bytes |
| [n169](../Objects.level.bin对象实现清单.html#RainMid%3An169) | BstNode_1049165948 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 59172 + 64 bytes |
| [n464](../Objects.level.bin对象实现清单.html#Storm%3An464) | BstNode_34 | 20%（2/10），运行待验 | 1 / 2 | Storm · 106032 + 56 bytes |
| [n242](../Objects.level.bin对象实现清单.html#StormEnd%3An242) | BstNode_34 | 20%（2/10），运行待验 | 1 / 2 | StormEnd · 62569 + 56 bytes |
| [n1764](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1764) | BstNode_840696528 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd · 331511 + 63 bytes |
| [n139](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An139) | BstNode_2279669882 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 50963 + 64 bytes |
| [n189](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An189) | BstNode_2279669946 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 59422 + 64 bytes |
| [n692](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An692) | BstNode_2279669981 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 173164 + 64 bytes |
| [n864](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An864) | BstNode_840696528 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd2 · 206480 + 63 bytes |
| [n1394](../Objects.level.bin对象实现清单.html#SunsetRace%3An1394) | BstNode_840695934 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 285498 + 63 bytes |
