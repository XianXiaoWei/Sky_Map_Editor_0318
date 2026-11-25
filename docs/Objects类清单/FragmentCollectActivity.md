# FragmentCollectActivity 单独类功能实现清单

功能分类：任务、先祖与场景机制。

此类职责：**碎片数量与收集活动**。

类清单进度 30%（3/10），15 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：FragmentCollectActivity 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 5 项。
- [ ] 碎片数量与收集活动：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（15 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=FragmentCollectActivity) · [原字段、进度与全部实例 JSON](FragmentCollectActivity.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n22](../Objects.level.bin对象实现清单.html#CarryLand%3An22) | BstNode_3707306016 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 11898 + 31 bytes |
| [n27](../Objects.level.bin对象实现清单.html#CarryLand%3An27) | BstNode_3707306045 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 12760 + 31 bytes |
| [n66](../Objects.level.bin对象实现清单.html#CarryLand%3An66) | BstNode_3707306004 | 20%（2/10），运行待验 | 1 / 1 | CarryLand · 18556 + 31 bytes |
| [n28](../Objects.level.bin对象实现清单.html#CarryLand2%3An28) | BstNode_3707306045 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 17771 + 39 bytes |
| [n71](../Objects.level.bin对象实现清单.html#CarryLand2%3An71) | BstNode_3707306004 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 24560 + 39 bytes |
| [n148](../Objects.level.bin对象实现清单.html#CarryLand2%3An148) | BstNode_3707306016 | 20%（2/10），运行待验 | 1 / 1 | CarryLand2 · 37032 + 39 bytes |
| [n876](../Objects.level.bin对象实现清单.html#Dawn%3An876) | BstNode_3707305987 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 172064 + 43 bytes |
| [n268](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An268) | BstNode_3122856005 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 83022 + 43 bytes |
| [n1180](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1180) | BstNode_3707305987 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 255721 + 43 bytes |
| [n423](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An423) | BstNode_3122856005 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 121276 + 43 bytes |
| [n1610](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1610) | BstNode_3707305987 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 408671 + 43 bytes |
| [n28](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An28) | BstNode_3122856004 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 29027 + 43 bytes |
| [n201](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An201) | BstNode_34603010 | 20%（2/10），运行待验 | 1 / 1 | Prairie_NestAndKeeper · 69585 + 41 bytes |
| [n927](../Objects.level.bin对象实现清单.html#Prairie_Village%3An927) | BstNode_1528234040 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 183060 + 43 bytes |
| [n1342](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1342) | BstNode_3707305987 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 246824 + 43 bytes |
