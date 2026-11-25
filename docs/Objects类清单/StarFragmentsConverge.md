# StarFragmentsConverge 单独类功能实现清单

功能分类：光点、碎片与灵魂。

此类职责：**碎片汇聚、传送与完成事件**。

类清单进度 30%（3/10），9 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：StarFragmentsConverge 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 碎片汇聚、传送与完成事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（12 条引用）、CameraKeyFrame（7 条引用）、WorldQuest（9 条引用）、LevelMesh（9 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=StarFragmentsConverge) · [原字段、进度与全部实例 JSON](StarFragmentsConverge.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n2238](../Objects.level.bin对象实现清单.html#Dawn%3An2238) | BstNode_3707305986 | 20%（2/10），运行待验 | 5 / 2 | Dawn · 369564 + 45 bytes |
| [n885](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An885) | BstNode_3707305986 | 20%（2/10），运行待验 | 4 / 1 | Prairie_ButterflyFields · 193320 + 45 bytes |
| [n949](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An949) | BstNode_1167523854 | 20%（2/10），运行待验 | 4 / 1 | Prairie_ButterflyFields · 203528 + 45 bytes |
| [n515](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An515) | BstNode_1475018773 | 20%（2/10），运行待验 | 3 / 2 | Prairie_Cave · 144010 + 45 bytes |
| [n1025](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1025) | BstNode_3707305986 | 20%（2/10），运行待验 | 3 / 1 | Prairie_Cave · 260424 + 45 bytes |
| [n452](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An452) | BstNode_34603045 | 20%（2/10），运行待验 | 5 / 1 | Prairie_NestAndKeeper · 122629 + 43 bytes |
| [n489](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An489) | BstNode_34603021 | 20%（2/10），运行待验 | 5 / 1 | Prairie_NestAndKeeper · 128370 + 43 bytes |
| [n1180](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1180) | BstNode_3707305986 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 221986 + 45 bytes |
| [n2577](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2577) | BstNode_1528234034 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 437153 + 45 bytes |
