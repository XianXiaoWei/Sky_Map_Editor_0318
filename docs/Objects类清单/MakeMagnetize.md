# MakeMagnetize 单独类功能实现清单

功能分类：碰撞、受力与移动限制。

此类职责：**标记区域吸附与反重力**。

类清单进度 30%（3/10），21 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：MakeMagnetize 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 标记区域吸附与反重力：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（21 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=MakeMagnetize) · [原字段、进度与全部实例 JSON](MakeMagnetize.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n437](../Objects.level.bin对象实现清单.html#Night%3An437) | BstNode_34603095 | 20%（2/10），运行待验 | 1 / 0 | Night · 88924 + 27 bytes |
| [n447](../Objects.level.bin对象实现清单.html#Night%3An447) | BstNode_492 | 20%（2/10），运行待验 | 1 / 1 | Night · 90941 + 22 bytes |
| [n566](../Objects.level.bin对象实现清单.html#Night%3An566) | BstNode_555 | 20%（2/10），运行待验 | 1 / 1 | Night · 106182 + 22 bytes |
| [n619](../Objects.level.bin对象实现清单.html#Night%3An619) | BstNode_938 | 20%（2/10），运行待验 | 1 / 0 | Night · 115018 + 22 bytes |
| [n637](../Objects.level.bin对象实现清单.html#Night%3An637) | BstNode_1312 | 20%（2/10），运行待验 | 1 / 0 | Night · 118506 + 23 bytes |
| [n679](../Objects.level.bin对象实现清单.html#Night%3An679) | BstNode_34603394 | 20%（2/10），运行待验 | 1 / 0 | Night · 124393 + 27 bytes |
| [n816](../Objects.level.bin对象实现清单.html#Night%3An816) | BstNode_1324 | 20%（2/10），运行待验 | 1 / 0 | Night · 144426 + 23 bytes |
| [n889](../Objects.level.bin对象实现清单.html#Night%3An889) | BstNode_34603081 | 20%（2/10），运行待验 | 1 / 0 | Night · 156107 + 27 bytes |
| [n1078](../Objects.level.bin对象实现清单.html#Night%3An1078) | BstNode_839 | 20%（2/10），运行待验 | 1 / 2 | Night · 182050 + 22 bytes |
| [n1100](../Objects.level.bin对象实现清单.html#Night%3An1100) | BstNode_34603085 | 20%（2/10），运行待验 | 1 / 0 | Night · 183914 + 27 bytes |
| [n1161](../Objects.level.bin对象实现清单.html#Night%3An1161) | BstNode_804 | 20%（2/10），运行待验 | 1 / 2 | Night · 194879 + 22 bytes |
| [n1344](../Objects.level.bin对象实现清单.html#Night%3An1344) | BstNode_530 | 20%（2/10），运行待验 | 1 / 1 | Night · 220567 + 22 bytes |
| [n1479](../Objects.level.bin对象实现清单.html#Night%3An1479) | BstNode_858 | 20%（2/10），运行待验 | 1 / 2 | Night · 235955 + 22 bytes |
| [n1701](../Objects.level.bin对象实现清单.html#Night%3An1701) | BstNode_695 | 20%（2/10），运行待验 | 1 / 1 | Night · 266171 + 22 bytes |
| [n1751](../Objects.level.bin对象实现清单.html#Night%3An1751) | BstNode_848 | 20%（2/10），运行待验 | 1 / 2 | Night · 273343 + 22 bytes |
| [n1995](../Objects.level.bin对象实现清单.html#Night%3An1995) | BstNode_34603096 | 20%（2/10），运行待验 | 1 / 0 | Night · 313841 + 27 bytes |
| [n2176](../Objects.level.bin对象实现清单.html#Night%3An2176) | BstNode_34604396 | 20%（2/10），运行待验 | 1 / 0 | Night · 345179 + 27 bytes |
| [n2219](../Objects.level.bin对象实现清单.html#Night%3An2219) | BstNode_493 | 20%（2/10），运行待验 | 1 / 1 | Night · 350351 + 22 bytes |
| [n2285](../Objects.level.bin对象实现清单.html#Night%3An2285) | BstNode_780 | 20%（2/10），运行待验 | 1 / 0 | Night · 360285 + 22 bytes |
| [n2313](../Objects.level.bin对象实现清单.html#Night%3An2313) | BstNode_34603088 | 20%（2/10），运行待验 | 1 / 0 | Night · 363709 + 27 bytes |
| [n2325](../Objects.level.bin对象实现清单.html#Night%3An2325) | BstNode_588 | 20%（2/10），运行待验 | 1 / 1 | Night · 365086 + 22 bytes |
