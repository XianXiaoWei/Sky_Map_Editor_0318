# WorldQuest 单独类功能实现清单

功能分类：任务、先祖与场景机制。

此类职责：**世界任务、活动、加入与奖励状态**。

类清单进度 30%（3/10），15 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：WorldQuest 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 15 项。
- [ ] 世界任务、活动、加入与奖励状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：FragmentCollectActivity（15 条引用）、MeditationArea（15 条引用）、Clump（23 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 15 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=WorldQuest) · [原字段、进度与全部实例 JSON](WorldQuest.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n32](../Objects.level.bin对象实现清单.html#CarryLand%3An32) | BstNode_3707305987 | 20%（2/10），运行待验 | 2 / 0 | CarryLand · 13178 + 80 bytes |
| [n45](../Objects.level.bin对象实现清单.html#CarryLand%3An45) | BstNode_3707306041 | 20%（2/10），运行待验 | 2 / 0 | CarryLand · 15014 + 80 bytes |
| [n48](../Objects.level.bin对象实现清单.html#CarryLand%3An48) | BstNode_3707306015 | 20%（2/10），运行待验 | 2 / 0 | CarryLand · 15315 + 80 bytes |
| [n34](../Objects.level.bin对象实现清单.html#CarryLand2%3An34) | BstNode_3707305987 | 20%（2/10），运行待验 | 2 / 0 | CarryLand2 · 18385 + 80 bytes |
| [n35](../Objects.level.bin对象实现清单.html#CarryLand2%3An35) | BstNode_3707306041 | 20%（2/10），运行待验 | 2 / 0 | CarryLand2 · 18465 + 80 bytes |
| [n198](../Objects.level.bin对象实现清单.html#CarryLand2%3An198) | BstNode_3707306015 | 20%（2/10），运行待验 | 2 / 0 | CarryLand2 · 46143 + 80 bytes |
| [n880](../Objects.level.bin对象实现清单.html#Dawn%3An880) | BstNode_34603011 | 20%（2/10），运行待验 | 5 / 2 | Dawn · 172585 + 89 bytes |
| [n427](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An427) | BstNode_3122855986 | 20%（2/10），运行待验 | 4 / 1 | Prairie_ButterflyFields · 115896 + 97 bytes |
| [n558](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An558) | BstNode_3707305985 | 20%（2/10），运行待验 | 4 / 1 | Prairie_ButterflyFields · 143102 + 98 bytes |
| [n747](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An747) | BstNode_3122855986 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Cave · 198357 + 93 bytes |
| [n932](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An932) | BstNode_3707305985 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Cave · 239868 + 94 bytes |
| [n512](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An512) | BstNode_3122855986 | 20%（2/10），运行待验 | 5 / 1 | Prairie_NestAndKeeper · 131943 + 92 bytes |
| [n524](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An524) | BstNode_34603017 | 20%（2/10），运行待验 | 5 / 1 | Prairie_NestAndKeeper · 134660 + 91 bytes |
| [n617](../Objects.level.bin对象实现清单.html#Prairie_Village%3An617) | BstNode_3707305985 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 130178 + 96 bytes |
| [n1331](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1331) | BstNode_1528234044 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 244944 + 97 bytes |
