# AvatarChargeEnergy 单独类功能实现清单

功能分类：玩家状态与输入。

此类职责：**按速率与时长补充玩家能量**。

类清单进度 30%（3/10），22 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：AvatarChargeEnergy 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 按速率与时长补充玩家能量：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=AvatarChargeEnergy) · [原字段、进度与全部实例 JSON](AvatarChargeEnergy.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n81](../Objects.level.bin对象实现清单.html#CandleSpace%3An81) | BstNode_456 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 32847 + 31 bytes |
| [n147](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An147) | BstNode_2529558583 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 37867 + 38 bytes |
| [n2716](../Objects.level.bin对象实现清单.html#Dawn%3An2716) | BstNode_2529558570 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 450671 + 38 bytes |
| [n839](../Objects.level.bin对象实现清单.html#Dusk%3An839) | BstNode_34603724 | 20%（2/10），运行待验 | 0 / 2 | Dusk · 176236 + 35 bytes |
| [n777](../Objects.level.bin对象实现清单.html#DuskMid%3An777) | BstNode_2345992802 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 166050 + 38 bytes |
| [n829](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An829) | BstNode_2529558896 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 205876 + 38 bytes |
| [n4](../Objects.level.bin对象实现清单.html#Night%3An4) | BstNode_1307 | 20%（2/10），运行待验 | 0 / 2 | Night · 24786 + 32 bytes |
| [n328](../Objects.level.bin对象实现清单.html#Night%3An328) | BstNode_34603091 | 20%（2/10），运行待验 | 0 / 2 | Night · 70613 + 36 bytes |
| [n542](../Objects.level.bin对象实现清单.html#Night%3An542) | BstNode_1262 | 20%（2/10），运行待验 | 0 / 2 | Night · 103537 + 32 bytes |
| [n766](../Objects.level.bin对象实现清单.html#Night%3An766) | BstNode_1935 | 20%（2/10），运行待验 | 0 / 1 | Night · 137591 + 32 bytes |
| [n1241](../Objects.level.bin对象实现清单.html#Night%3An1241) | BstNode_1412 | 20%（2/10），运行待验 | 0 / 2 | Night · 206047 + 32 bytes |
| [n1281](../Objects.level.bin对象实现清单.html#Night%3An1281) | BstNode_1371 | 20%（2/10），运行待验 | 0 / 2 | Night · 210620 + 32 bytes |
| [n2092](../Objects.level.bin对象实现清单.html#Night%3An2092) | BstNode_34603098 | 20%（2/10），运行待验 | 0 / 1 | Night · 332167 + 36 bytes |
| [n2425](../Objects.level.bin对象实现清单.html#Night%3An2425) | BstNode_1393 | 20%（2/10），运行待验 | 0 / 2 | Night · 380937 + 32 bytes |
| [n2530](../Objects.level.bin对象实现清单.html#Night%3An2530) | BstNode_1288 | 20%（2/10），运行待验 | 0 / 2 | Night · 397044 + 32 bytes |
| [n2630](../Objects.level.bin对象实现清单.html#Night%3An2630) | BstNode_1634 | 20%（2/10），运行待验 | 0 / 1 | Night · 410429 + 32 bytes |
| [n2719](../Objects.level.bin对象实现清单.html#Night%3An2719) | BstNode_776 | 20%（2/10），运行待验 | 0 / 2 | Night · 423587 + 31 bytes |
| [n3052](../Objects.level.bin对象实现清单.html#Night%3An3052) | BstNode_748 | 20%（2/10），运行待验 | 0 / 1 | Night · 474739 + 31 bytes |
| [n529](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An529) | BstNode_34603390 | 20%（2/10），运行待验 | 0 / 2 | Prairie_NestAndKeeper · 135045 + 36 bytes |
| [n1253](../Objects.level.bin对象实现清单.html#Rain%3An1253) | BstNode_632 | 20%（2/10），运行待验 | 0 / 2 | Rain · 309048 + 31 bytes |
| [n848](../Objects.level.bin对象实现清单.html#Sunset%3An848) | BstNode_2529558614 | 20%（2/10），运行待验 | 0 / 2 | Sunset · 176173 + 38 bytes |
| [n1314](../Objects.level.bin对象实现清单.html#Sunset%3An1314) | BstNode_34603069 | 20%（2/10），运行待验 | 0 / 2 | Sunset · 248972 + 36 bytes |
