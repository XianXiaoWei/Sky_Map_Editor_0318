# CheckpointState 单独类功能实现清单

功能分类：地图加载、出生与检查点。

此类职责：**恢复时启用的对象集合**。

类清单进度 30%（3/10），17 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：CheckpointState 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 1 项。
- [ ] 恢复时启用的对象集合：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（17 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=CheckpointState) · [原字段、进度与全部实例 JSON](CheckpointState.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n1037](../Objects.level.bin对象实现清单.html#Dawn%3An1037) | BstNode_416 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 192748 + 20 bytes |
| [n984](../Objects.level.bin对象实现清单.html#DayEnd%3An984) | BstNode_2446917677 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 208074 + 27 bytes |
| [n366](../Objects.level.bin对象实现清单.html#DayHubCave%3An366) | BstNode_2345992696 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 90133 + 27 bytes |
| [n559](../Objects.level.bin对象实现清单.html#Dusk%3An559) | BstNode_2345992655 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 127426 + 27 bytes |
| [n1300](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1300) | BstNode_2446917647 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 324083 + 27 bytes |
| [n747](../Objects.level.bin对象实现清单.html#DuskMid%3An747) | BstNode_2345992544 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 160383 + 27 bytes |
| [n484](../Objects.level.bin对象实现清单.html#HubReveal%3An484) | BstNode_914 | 20%（2/10），运行待验 | 1 / 1 | HubReveal · 112495 + 20 bytes |
| [n1923](../Objects.level.bin对象实现清单.html#Night%3An1923) | BstNode_1340 | 20%（2/10），运行待验 | 1 / 0 | Night · 297777 + 21 bytes |
| [n640](../Objects.level.bin对象实现清单.html#NightEnd%3An640) | BstNode_34603026 | 20%（2/10），运行待验 | 1 / 0 | NightEnd · 128488 + 25 bytes |
| [n880](../Objects.level.bin对象实现清单.html#Prairie_Village%3An880) | BstNode_914 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 174183 + 20 bytes |
| [n1038](../Objects.level.bin对象实现清单.html#Rain%3An1038) | BstNode_2411 | 20%（2/10），运行待验 | 1 / 0 | Rain · 262030 + 21 bytes |
| [n330](../Objects.level.bin对象实现清单.html#RainEnd%3An330) | BstNode_2345992937 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 108941 + 27 bytes |
| [n349](../Objects.level.bin对象实现清单.html#RainForest%3An349) | BstNode_2411 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 86383 + 21 bytes |
| [n922](../Objects.level.bin对象实现清单.html#Storm%3An922) | BstNode_2529560044 | 20%（2/10），运行待验 | 1 / 0 | Storm · 187861 + 27 bytes |
| [n439](../Objects.level.bin对象实现清单.html#Sunset%3An439) | BstNode_3156082692 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 107889 + 27 bytes |
| [n562](../Objects.level.bin对象实现清单.html#SunsetEnd%3An562) | BstNode_2446917650 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 122463 + 27 bytes |
| [n550](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An550) | BstNode_2446917650 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 141267 + 27 bytes |
