# BenchChat 单独类功能实现清单

功能分类：网络、账户与社交流程。

此类职责：**长椅座位与聊天频道**。

类清单进度 30%（3/10），18 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：BenchChat 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 长椅座位与聊天频道：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（18 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=BenchChat) · [原字段、进度与全部实例 JSON](BenchChat.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n456](../Objects.level.bin对象实现清单.html#DayEnd%3An456) | BstNode_2446917715 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 110556 + 29 bytes |
| [n566](../Objects.level.bin对象实现清单.html#DayEnd%3An566) | BstNode_2446917716 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 131127 + 29 bytes |
| [n396](../Objects.level.bin对象实现清单.html#Dusk%3An396) | BstNode_2446917747 | 20%（2/10），运行待验 | 1 / 1 | Dusk · 95735 + 29 bytes |
| [n888](../Objects.level.bin对象实现清单.html#HubReveal%3An888) | BstNode_2446917747 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 178077 + 29 bytes |
| [n536](../Objects.level.bin对象实现清单.html#Night%3An536) | BstNode_34604462 | 20%（2/10），运行待验 | 1 / 1 | Night · 103124 + 27 bytes |
| [n2181](../Objects.level.bin对象实现清单.html#Night%3An2181) | BstNode_2446917747 | 20%（2/10），运行待验 | 1 / 1 | Night · 345525 + 29 bytes |
| [n897](../Objects.level.bin对象实现清单.html#Prairie_Village%3An897) | BstNode_1167524003 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 177669 + 29 bytes |
| [n943](../Objects.level.bin对象实现清单.html#Prairie_Village%3An943) | BstNode_1167523929 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 185341 + 29 bytes |
| [n1071](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1071) | BstNode_1167523989 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 208178 + 29 bytes |
| [n2307](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2307) | BstNode_1482555547 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 400109 + 29 bytes |
| [n2667](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2667) | BstNode_2345992499 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 451278 + 29 bytes |
| [n2846](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2846) | BstNode_1482555526 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 483094 + 29 bytes |
| [n3042](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3042) | BstNode_1167523946 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 516210 + 29 bytes |
| [n444](../Objects.level.bin对象实现清单.html#RainForest%3An444) | BstNode_2446917747 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 100413 + 29 bytes |
| [n256](../Objects.level.bin对象实现清单.html#RainMid%3An256) | BstNode_34603114 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 75858 + 27 bytes |
| [n1231](../Objects.level.bin对象实现清单.html#SkyHub2%3An1231) | BstNode_3156082697 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 256012 + 29 bytes |
| [n259](../Objects.level.bin对象实现清单.html#Sunset%3An259) | BstNode_2446917751 | 20%（2/10），运行待验 | 1 / 2 | Sunset · 76012 + 29 bytes |
| [n756](../Objects.level.bin对象实现清单.html#Sunset%3An756) | BstNode_2446917747 | 20%（2/10），运行待验 | 1 / 1 | Sunset · 161311 + 29 bytes |
