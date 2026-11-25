# SwapMoteParams 单独类功能实现清单

功能分类：光点、碎片与灵魂。

此类职责：**光点参数在区域与阶段间切换**。

类清单进度 30%（3/10），14 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SwapMoteParams 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 光点参数在区域与阶段间切换：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（14 条引用）、MoteParams（14 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SwapMoteParams) · [原字段、进度与全部实例 JSON](SwapMoteParams.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n171](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An171) | BstNode_858 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 59110 + 30 bytes |
| [n258](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An258) | BstNode_973 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 80325 + 30 bytes |
| [n295](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An295) | BstNode_944 | 20%（2/10），运行待验 | 2 / 3 | Prairie_ButterflyFields · 88513 + 30 bytes |
| [n361](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An361) | BstNode_1118 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 103470 + 31 bytes |
| [n380](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An380) | BstNode_1392 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 107004 + 31 bytes |
| [n1009](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1009) | BstNode_2033 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 218037 + 31 bytes |
| [n1068](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1068) | BstNode_1534 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 232184 + 31 bytes |
| [n1091](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1091) | BstNode_907 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 237352 + 30 bytes |
| [n1178](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1178) | BstNode_1076 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 255537 + 31 bytes |
| [n1259](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1259) | BstNode_1235 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 272999 + 31 bytes |
| [n1281](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1281) | BstNode_1292 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 277658 + 31 bytes |
| [n1334](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1334) | BstNode_985 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 287463 + 30 bytes |
| [n1364](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1364) | BstNode_1033 | 20%（2/10），运行待验 | 2 / 2 | Prairie_ButterflyFields · 292849 + 31 bytes |
| [n1446](../Objects.level.bin对象实现清单.html#Rain%3An1446) | BstNode_1548 | 20%（2/10），运行待验 | 2 / 2 | Rain · 352506 + 31 bytes |
