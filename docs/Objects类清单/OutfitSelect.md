# OutfitSelect 单独类功能实现清单

功能分类：动画、回放与装扮。

此类职责：**衣柜、区域、商店与购买事件**。

类清单进度 30%（3/10），12 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：OutfitSelect 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 衣柜、区域、商店与购买事件：节点及 115 条 OutfitDefs/七槽资源已清点；账户解锁、原衣柜 UI、资源/配色/配件和换装事件待恢复。
- [ ] 依赖调用与事件：Clump（6 条引用）、Marker（12 条引用）
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

节点及 115 条 OutfitDefs/七槽资源已清点；账户解锁、原衣柜 UI、资源/配色/配件和换装事件待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=OutfitSelect) · [原字段、进度与全部实例 JSON](OutfitSelect.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n46](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An46) | BstNode_2446917670 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 23423 + 52 bytes |
| [n66](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An66) | BstNode_2446917682 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 26069 + 55 bytes |
| [n143](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An143) | BstNode_2446917688 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 37587 + 53 bytes |
| [n280](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An280) | BstNode_2446917868 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 69466 + 53 bytes |
| [n402](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An402) | BstNode_2446917694 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 91904 + 54 bytes |
| [n461](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An461) | BstNode_2446917676 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 99802 + 53 bytes |
| [n482](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An482) | BstNode_2446917700 | 20%（2/10），运行待验 | 1 / 0 | CandleSpaceEnd · 103594 + 54 bytes |
| [n849](../Objects.level.bin对象实现清单.html#SkyHub2%3An849) | BstNode_1167523853 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 188381 + 39 bytes |
| [n1292](../Objects.level.bin对象实现清单.html#SkyHub2%3An1292) | BstNode_1524 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 264775 + 33 bytes |
| [n1312](../Objects.level.bin对象实现清单.html#SkyHub2%3An1312) | BstNode_1522 | 20%（2/10），运行待验 | 1 / 3 | SkyHub2 · 266943 + 33 bytes |
| [n1387](../Objects.level.bin对象实现清单.html#SkyHub2%3An1387) | BstNode_1520 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 275386 + 33 bytes |
| [n1478](../Objects.level.bin对象实现清单.html#SkyHub2%3An1478) | BstNode_406 | 20%（2/10），运行待验 | 1 / 2 | SkyHub2 · 286405 + 32 bytes |
