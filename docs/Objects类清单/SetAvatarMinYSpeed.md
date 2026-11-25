# SetAvatarMinYSpeed 单独类功能实现清单

功能分类：碰撞、受力与移动限制。

此类职责：**玩家最小竖直速度与起飞**。

类清单进度 30%（3/10），13 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SetAvatarMinYSpeed 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 玩家最小竖直速度与起飞：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetAvatarMinYSpeed) · [原字段、进度与全部实例 JSON](SetAvatarMinYSpeed.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n552](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An552) | BstNode_2529558579 | 20%（2/10），运行待验 | 0 / 0 | CandleSpaceEnd · 112778 + 30 bytes |
| [n663](../Objects.level.bin对象实现清单.html#Night%3An663) | BstNode_1255 | 20%（2/10），运行待验 | 0 / 2 | Night · 121390 + 24 bytes |
| [n867](../Objects.level.bin对象实现清单.html#Night%3An867) | BstNode_1282 | 20%（2/10），运行待验 | 0 / 2 | Night · 153277 + 24 bytes |
| [n1661](../Objects.level.bin对象实现清单.html#Night%3An1661) | BstNode_1623 | 20%（2/10），运行待验 | 0 / 1 | Night · 260779 + 24 bytes |
| [n1965](../Objects.level.bin对象实现清单.html#Night%3An1965) | BstNode_442 | 20%（2/10），运行待验 | 0 / 1 | Night · 305399 + 23 bytes |
| [n1967](../Objects.level.bin对象实现清单.html#Night%3An1967) | BstNode_1368 | 20%（2/10），运行待验 | 0 / 2 | Night · 305806 + 24 bytes |
| [n2312](../Objects.level.bin对象实现清单.html#Night%3An2312) | BstNode_1409 | 20%（2/10），运行待验 | 0 / 2 | Night · 363685 + 24 bytes |
| [n2395](../Objects.level.bin对象实现清单.html#Night%3An2395) | BstNode_1390 | 20%（2/10），运行待验 | 0 / 2 | Night · 375740 + 24 bytes |
| [n2706](../Objects.level.bin对象实现清单.html#Night%3An2706) | BstNode_1244 | 20%（2/10），运行待验 | 0 / 2 | Night · 421717 + 24 bytes |
| [n2707](../Objects.level.bin对象实现清单.html#Night%3An2707) | BstNode_1304 | 20%（2/10），运行待验 | 0 / 2 | Night · 421741 + 24 bytes |
| [n2708](../Objects.level.bin对象实现清单.html#Night%3An2708) | BstNode_1642 | 20%（2/10），运行待验 | 0 / 1 | Night · 421765 + 24 bytes |
| [n537](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An537) | BstNode_34603123 | 20%（2/10），运行待验 | 0 / 2 | Prairie_NestAndKeeper · 136694 + 28 bytes |
| [n629](../Objects.level.bin对象实现清单.html#StormEnd%3An629) | BstNode_3156082781 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 130179 + 30 bytes |
