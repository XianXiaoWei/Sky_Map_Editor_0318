# AddFloatToStatUsingName 单独类功能实现清单

功能分类：数值变量与运算。

此类职责：**命名统计值增加浮点输入**。

类清单进度 30%（3/10），21 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：AddFloatToStatUsingName 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 命名统计值增加浮点输入：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=AddFloatToStatUsingName) · [原字段、进度与全部实例 JSON](AddFloatToStatUsingName.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n77](../Objects.level.bin对象实现清单.html#DayEnd%3An77) | BstNode_2060386344 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 38367 + 55 bytes |
| [n739](../Objects.level.bin对象实现清单.html#DayHubCave%3An739) | BstNode_2060386308 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 161976 + 50 bytes |
| [n945](../Objects.level.bin对象实现清单.html#Dusk%3An945) | BstNode_2060386307 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 192821 + 53 bytes |
| [n1658](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1658) | BstNode_2060386306 | 20%（2/10），运行待验 | 0 / 1 | DuskGraveyard · 410093 + 58 bytes |
| [n324](../Objects.level.bin对象实现清单.html#DuskMid%3An324) | BstNode_2060386308 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 78274 + 57 bytes |
| [n595](../Objects.level.bin对象实现清单.html#DuskMid%3An595) | BstNode_2060386314 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 127666 + 51 bytes |
| [n761](../Objects.level.bin对象实现清单.html#Night%3An761) | BstNode_2060386318 | 20%（2/10），运行待验 | 0 / 1 | Night · 137335 + 53 bytes |
| [n2569](../Objects.level.bin对象实现清单.html#Night%3An2569) | BstNode_2060386314 | 20%（2/10），运行待验 | 0 / 1 | Night · 401914 + 54 bytes |
| [n2939](../Objects.level.bin对象实现清单.html#Night%3An2939) | BstNode_2060386310 | 20%（2/10），运行待验 | 0 / 1 | Night · 456277 + 55 bytes |
| [n3075](../Objects.level.bin对象实现清单.html#Night%3An3075) | BstNode_2060386305 | 20%（2/10），运行待验 | 0 / 1 | Night · 478595 + 52 bytes |
| [n1182](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1182) | BstNode_2060386379 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 222168 + 54 bytes |
| [n1606](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1606) | BstNode_2060386374 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 288701 + 55 bytes |
| [n3017](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3017) | BstNode_2060386384 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 512654 + 59 bytes |
| [n605](../Objects.level.bin对象实现清单.html#Rain%3An605) | BstNode_2060386369 | 20%（2/10），运行待验 | 0 / 1 | Rain · 165623 + 52 bytes |
| [n544](../Objects.level.bin对象实现清单.html#RainForest%3An544) | BstNode_2060386372 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 125038 + 51 bytes |
| [n1474](../Objects.level.bin对象实现清单.html#RainMid%3An1474) | BstNode_2060386435 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 294923 + 52 bytes |
| [n2165](../Objects.level.bin对象实现清单.html#RainMid%3An2165) | BstNode_2060386441 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 419939 + 56 bytes |
| [n1288](../Objects.level.bin对象实现清单.html#Sunset%3An1288) | BstNode_2060386306 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 244667 + 57 bytes |
| [n1574](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1574) | BstNode_2060386307 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 294046 + 59 bytes |
| [n552](../Objects.level.bin对象实现清单.html#SunsetRace%3An552) | BstNode_2060386307 | 20%（2/10），运行待验 | 0 / 1 | SunsetRace · 135013 + 54 bytes |
| [n569](../Objects.level.bin对象实现清单.html#SunsetRace%3An569) | BstNode_2060386311 | 20%（2/10），运行待验 | 0 / 1 | SunsetRace · 137394 + 57 bytes |
