# PlaySound3D 单独类功能实现清单

功能分类：声音、音乐与混音。

此类职责：**空间声音播放**。

类清单进度 30%（3/10），27 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：PlaySound3D 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 空间声音播放：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（27 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=PlaySound3D) · [原字段、进度与全部实例 JSON](PlaySound3D.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n179](../Objects.level.bin对象实现清单.html#Dawn%3An179) | BstNode_1293287737 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 61131 + 57 bytes |
| [n333](../Objects.level.bin对象实现清单.html#Dawn%3An333) | BstNode_1293287916 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 85289 + 57 bytes |
| [n347](../Objects.level.bin对象实现清单.html#Dawn%3An347) | BstNode_3122856381 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 86381 + 49 bytes |
| [n664](../Objects.level.bin对象实现清单.html#Dawn%3An664) | BstNode_1293287550 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 137820 + 57 bytes |
| [n801](../Objects.level.bin对象实现清单.html#Dawn%3An801) | BstNode_3122856374 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 160252 + 49 bytes |
| [n879](../Objects.level.bin对象实现清单.html#Dawn%3An879) | BstNode_1293287847 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 172528 + 57 bytes |
| [n1308](../Objects.level.bin对象实现清单.html#Dawn%3An1308) | BstNode_3122856382 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 235324 + 49 bytes |
| [n1448](../Objects.level.bin对象实现清单.html#Dawn%3An1448) | BstNode_3122855978 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 255297 + 57 bytes |
| [n1562](../Objects.level.bin对象实现清单.html#Dawn%3An1562) | BstNode_3122856839 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 271192 + 54 bytes |
| [n1628](../Objects.level.bin对象实现清单.html#Dawn%3An1628) | BstNode_320 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 279463 + 51 bytes |
| [n1720](../Objects.level.bin对象实现清单.html#Dawn%3An1720) | BstNode_1293287459 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 292094 + 54 bytes |
| [n1845](../Objects.level.bin对象实现清单.html#Dawn%3An1845) | BstNode_1293287455 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 307639 + 57 bytes |
| [n2498](../Objects.level.bin对象实现清单.html#Dawn%3An2498) | BstNode_1293287900 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 416065 + 57 bytes |
| [n2633](../Objects.level.bin对象实现清单.html#Dawn%3An2633) | BstNode_1293287454 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 437594 + 57 bytes |
| [n2944](../Objects.level.bin对象实现清单.html#Dawn%3An2944) | BstNode_3122856342 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 481201 + 55 bytes |
| [n499](../Objects.level.bin对象实现清单.html#NightEnd%3An499) | BstNode_1293287776 | 20%（2/10），运行待验 | 1 / 2 | NightEnd · 106348 + 58 bytes |
| [n3](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An3) | BstNode_1167523935 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 24617 + 56 bytes |
| [n126](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An126) | BstNode_3122856039 | 20%（2/10），运行待验 | 1 / 2 | Prairie_ButterflyFields · 50818 + 56 bytes |
| [n801](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An801) | BstNode_3122856039 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Cave · 209372 + 56 bytes |
| [n1220](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1220) | BstNode_34603017 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Cave · 304129 + 54 bytes |
| [n445](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An445) | BstNode_3122856039 | 20%（2/10），运行待验 | 1 / 2 | Prairie_NestAndKeeper · 121816 + 56 bytes |
| [n461](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An461) | BstNode_34603069 | 20%（2/10），运行待验 | 1 / 2 | Prairie_NestAndKeeper · 123919 + 54 bytes |
| [n668](../Objects.level.bin对象实现清单.html#SkyHub2%3An668) | BstNode_1682898980 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 156293 + 59 bytes |
| [n1043](../Objects.level.bin对象实现清单.html#SkyHub2%3An1043) | BstNode_1682898982 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 221925 + 59 bytes |
| [n2395](../Objects.level.bin对象实现清单.html#SkyHub2%3An2395) | BstNode_1682898983 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 452393 + 53 bytes |
| [n2415](../Objects.level.bin对象实现清单.html#SkyHub2%3An2415) | BstNode_1682898981 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 455769 + 58 bytes |
| [n270](../Objects.level.bin对象实现清单.html#Storm%3An270) | BstNode_1293287776 | 20%（2/10），运行待验 | 1 / 1 | Storm · 70692 + 58 bytes |
