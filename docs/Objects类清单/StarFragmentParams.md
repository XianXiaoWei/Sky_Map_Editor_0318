# StarFragmentParams 单独类功能实现清单

功能分类：光点、碎片与灵魂。

此类职责：**碎片飞行、跟随、携带与人数条件**。

类清单进度 30%（3/10），17 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：StarFragmentParams 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 11 项。
- [ ] 碎片飞行、跟随、携带与人数条件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（17 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 11 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=StarFragmentParams) · [原字段、进度与全部实例 JSON](StarFragmentParams.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n35](../Objects.level.bin对象实现清单.html#CarryLand%3An35) | BstNode_3707306017 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 13429 + 48 bytes |
| [n44](../Objects.level.bin对象实现清单.html#CarryLand%3An44) | BstNode_3707306006 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 14966 + 48 bytes |
| [n104](../Objects.level.bin对象实现清单.html#CarryLand%3An104) | BstNode_3707306046 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 26156 + 48 bytes |
| [n29](../Objects.level.bin对象实现清单.html#CarryLand2%3An29) | BstNode_3707306006 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 17810 + 55 bytes |
| [n109](../Objects.level.bin对象实现清单.html#CarryLand2%3An109) | BstNode_3707306046 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 31244 + 55 bytes |
| [n192](../Objects.level.bin对象实现清单.html#CarryLand2%3An192) | BstNode_3707306017 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 45144 + 55 bytes |
| [n1050](../Objects.level.bin对象实现清单.html#Dawn%3An1050) | BstNode_3707305989 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 193704 + 55 bytes |
| [n891](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An891) | BstNode_3707305989 | 20%（2/10），运行待验 | 1 / 4 | Prairie_ButterflyFields · 194253 + 55 bytes |
| [n1277](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1277) | BstNode_3122856007 | 20%（2/10），运行待验 | 1 / 3 | Prairie_ButterflyFields · 276984 + 55 bytes |
| [n152](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An152) | BstNode_3122856007 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Cave · 58781 + 55 bytes |
| [n667](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An667) | BstNode_3707305989 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 180303 + 55 bytes |
| [n1041](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1041) | BstNode_1475018831 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 265208 + 55 bytes |
| [n471](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An471) | BstNode_34603341 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 124992 + 53 bytes |
| [n484](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An484) | BstNode_34603509 | 20%（2/10），运行待验 | 1 / 5 | Prairie_NestAndKeeper · 127896 + 53 bytes |
| [n869](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An869) | BstNode_34603510 | 20%（2/10），运行待验 | 1 / 4 | Prairie_NestAndKeeper · 215520 + 53 bytes |
| [n1123](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1123) | BstNode_3707305989 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 214563 + 55 bytes |
| [n1488](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1488) | BstNode_1528234047 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 268967 + 55 bytes |
