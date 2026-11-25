# OnTapPlayAnim 单独类功能实现清单

功能分类：动画、回放与装扮。

此类职责：**点击动作动画、延迟与进度事件**。

类清单进度 30%（3/10），26 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：OnTapPlayAnim 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 14 项。
- [ ] 点击动作动画、延迟与进度事件：26 个节点及动作字段已清点；原交互/解锁条件、动画序列和动作 UI 事件待恢复。
- [ ] 依赖调用与事件：Clump（52 条引用）、Float（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 14 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

26 个节点及动作字段已清点；原交互/解锁条件、动画序列和动作 UI 事件待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=OnTapPlayAnim) · [原字段、进度与全部实例 JSON](OnTapPlayAnim.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n13](../Objects.level.bin对象实现清单.html#DayEnd%3An13) | BstNode_2446917659 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 25390 + 71 bytes |
| [n808](../Objects.level.bin对象实现清单.html#DayEnd%3An808) | BstNode_2446917707 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 177391 + 71 bytes |
| [n292](../Objects.level.bin对象实现清单.html#DayHubCave%3An292) | BstNode_34603263 | 20%（2/10），运行待验 | 3 / 2 | DayHubCave · 75168 + 63 bytes |
| [n154](../Objects.level.bin对象实现清单.html#Dusk%3An154) | BstNode_2446917748 | 20%（2/10），运行待验 | 2 / 1 | Dusk · 51668 + 79 bytes |
| [n203](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An203) | BstNode_34603827 | 20%（2/10），运行待验 | 1 / 1 | DuskGraveyard · 72041 + 77 bytes |
| [n994](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An994) | BstNode_34603838 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 261289 + 75 bytes |
| [n634](../Objects.level.bin对象实现清单.html#HubReveal%3An634) | BstNode_2512 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 136527 + 83 bytes |
| [n726](../Objects.level.bin对象实现清单.html#HubReveal%3An726) | BstNode_2446917748 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 151703 + 79 bytes |
| [n896](../Objects.level.bin对象实现清单.html#Night%3An896) | BstNode_34603252 | 20%（2/10），运行待验 | 2 / 1 | Night · 156832 + 64 bytes |
| [n944](../Objects.level.bin对象实现清单.html#Night%3An944) | BstNode_34604044 | 20%（2/10），运行待验 | 3 / 2 | Night · 165294 + 64 bytes |
| [n1546](../Objects.level.bin对象实现清单.html#Night%3An1546) | BstNode_2446917748 | 20%（2/10），运行待验 | 2 / 1 | Night · 244205 + 79 bytes |
| [n2073](../Objects.level.bin对象实现清单.html#Night%3An2073) | BstNode_2197 | 20%（2/10），运行待验 | 2 / 2 | Night · 329145 + 83 bytes |
| [n2575](../Objects.level.bin对象实现清单.html#Night%3An2575) | BstNode_34604544 | 20%（2/10），运行待验 | 2 / 2 | Night · 403193 + 67 bytes |
| [n2600](../Objects.level.bin对象实现清单.html#Night%3An2600) | BstNode_34603263 | 20%（2/10），运行待验 | 3 / 2 | Night · 405966 + 63 bytes |
| [n2810](../Objects.level.bin对象实现清单.html#Night%3An2810) | BstNode_34604458 | 20%（2/10），运行待验 | 2 / 1 | Night · 436319 + 77 bytes |
| [n551](../Objects.level.bin对象实现清单.html#Prairie_Village%3An551) | BstNode_1482555543 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 120140 + 79 bytes |
| [n862](../Objects.level.bin对象实现清单.html#Prairie_Village%3An862) | BstNode_2345992495 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 171868 + 79 bytes |
| [n1694](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1694) | BstNode_34604044 | 20%（2/10），运行待验 | 3 / 2 | Prairie_Village · 299746 + 68 bytes |
| [n2122](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2122) | BstNode_1167524008 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 373276 + 79 bytes |
| [n2645](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2645) | BstNode_1482555534 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 447974 + 79 bytes |
| [n166](../Objects.level.bin对象实现清单.html#RainForest%3An166) | BstNode_2446917748 | 20%（2/10），运行待验 | 2 / 1 | RainForest · 54294 + 79 bytes |
| [n98](../Objects.level.bin对象实现清单.html#RainMid%3An98) | BstNode_34603110 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 45404 + 77 bytes |
| [n84](../Objects.level.bin对象实现清单.html#SkyHub2%3An84) | BstNode_3156082709 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 48252 + 79 bytes |
| [n1091](../Objects.level.bin对象实现清单.html#SkyHub2%3An1091) | BstNode_1167524268 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 231415 + 79 bytes |
| [n237](../Objects.level.bin对象实现清单.html#Sunset%3An237) | BstNode_2446917748 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 71839 + 79 bytes |
| [n791](../Objects.level.bin对象实现清单.html#Sunset%3An791) | BstNode_2446917758 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 167461 + 79 bytes |
