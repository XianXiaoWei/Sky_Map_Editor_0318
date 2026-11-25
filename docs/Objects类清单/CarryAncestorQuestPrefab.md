# CarryAncestorQuestPrefab 单独类功能实现清单

功能分类：任务、先祖与场景机制。

此类职责：**先祖携带任务预制体**。

类清单进度 30%（3/10），10 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：CarryAncestorQuestPrefab 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 2 项。
- [ ] 先祖携带任务预制体：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（22 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=CarryAncestorQuestPrefab) · [原字段、进度与全部实例 JSON](CarryAncestorQuestPrefab.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n162](../Objects.level.bin对象实现清单.html#CarryLand2%3An162) | BstNode_3707306201 | 20%（2/10），运行待验 | 2 / 0 | CarryLand2 · 39256 + 104 bytes |
| [n437](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An437) | BstNode_1167523977 | 20%（2/10），运行待验 | 2 / 0 | Prairie_ButterflyFields · 117272 + 129 bytes |
| [n556](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An556) | BstNode_1842806836 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Cave · 152180 + 124 bytes |
| [n754](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An754) | BstNode_1528234013 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Cave · 199937 + 124 bytes |
| [n416](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An416) | BstNode_1528233985 | 20%（2/10），运行待验 | 2 / 0 | Prairie_NestAndKeeper · 116528 + 132 bytes |
| [n447](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An447) | BstNode_1528234013 | 20%（2/10），运行待验 | 2 / 0 | Prairie_NestAndKeeper · 121911 + 129 bytes |
| [n984](../Objects.level.bin对象实现清单.html#Prairie_Village%3An984) | BstNode_1528234013 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 192554 + 128 bytes |
| [n1369](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1369) | BstNode_1528234011 | 20%（2/10），运行待验 | 3 / 0 | Prairie_Village · 251698 + 124 bytes |
| [n2206](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2206) | BstNode_1842806901 | 20%（2/10），运行待验 | 3 / 0 | Prairie_Village · 384056 + 124 bytes |
| [n2378](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2378) | BstNode_1528234132 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 410222 + 125 bytes |
