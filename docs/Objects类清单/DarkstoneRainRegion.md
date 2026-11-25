# DarkstoneRainRegion 单独类功能实现清单

功能分类：水、雾与天气。

此类职责：**区域降落物、收集物与能量消耗**。

类清单进度 30%（3/10），11 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：DarkstoneRainRegion 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 区域降落物、收集物与能量消耗：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（10 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=DarkstoneRainRegion) · [原字段、进度与全部实例 JSON](DarkstoneRainRegion.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n1153](../Objects.level.bin对象实现清单.html#Storm%3An1153) | BstNode_2529559962 | 20%（2/10），运行待验 | 1 / 0 | Storm · 228730 + 45 bytes |
| [n73](../Objects.level.bin对象实现清单.html#StormEnd%3An73) | BstNode_3156082731 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 33637 + 45 bytes |
| [n91](../Objects.level.bin对象实现清单.html#StormEnd%3An91) | BstNode_1040 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 36990 + 39 bytes |
| [n97](../Objects.level.bin对象实现清单.html#StormEnd%3An97) | BstNode_2345992929 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 38586 + 45 bytes |
| [n330](../Objects.level.bin对象实现清单.html#StormEnd%3An330) | BstNode_3156082699 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 80245 + 45 bytes |
| [n438](../Objects.level.bin对象实现清单.html#StormEnd%3An438) | BstNode_2345992948 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 102286 + 45 bytes |
| [n691](../Objects.level.bin对象实现清单.html#StormEnd%3An691) | BstNode_2446917638 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 139803 + 45 bytes |
| [n745](../Objects.level.bin对象实现清单.html#StormEnd%3An745) | BstNode_3156082719 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 147328 + 45 bytes |
| [n754](../Objects.level.bin对象实现清单.html#StormEnd%3An754) | BstNode_3156082767 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 148322 + 45 bytes |
| [n788](../Objects.level.bin对象实现清单.html#StormEnd%3An788) | BstNode_3156082743 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 153254 + 45 bytes |
| [n798](../Objects.level.bin对象实现清单.html#StormEnd%3An798) | BstNode_3156082755 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 154949 + 45 bytes |
