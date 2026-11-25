# SoulTrap 单独类功能实现清单

功能分类：光点、碎片与灵魂。

此类职责：**灵魂捕获物、几何与销毁事件**。

类清单进度 40%（4/10），49 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SoulTrap 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 9 项。
- [ ] 灵魂捕获物、几何与销毁事件（部分完成）：原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。
- [ ] 依赖调用与事件：Clump（58 条引用）、Collectible（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。
- [x] 明确范围的原核心子链已独立核验：原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SoulTrap) · [原字段、进度与全部实例 JSON](SoulTrap.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n21](../Objects.level.bin对象实现清单.html#CarryLand2%3An21) | BstNode_3707306203 | 20%（2/10），运行待验 | 1 / 2 | CarryLand2 · 16540 + 50 bytes |
| [n681](../Objects.level.bin对象实现清单.html#Dusk%3An681) | BstNode_2060386314 | 20%（2/10），运行待验 | 1 / 1 | Dusk · 146373 + 50 bytes |
| [n704](../Objects.level.bin对象实现清单.html#Dusk%3An704) | BstNode_2060386312 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 149448 + 50 bytes |
| [n983](../Objects.level.bin对象实现清单.html#Dusk%3An983) | BstNode_2060386334 | 20%（2/10），运行待验 | 1 / 1 | Dusk · 200721 + 50 bytes |
| [n1071](../Objects.level.bin对象实现清单.html#Dusk%3An1071) | BstNode_2060386360 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 219192 + 50 bytes |
| [n153](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An153) | BstNode_2060386326 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 59889 + 50 bytes |
| [n1182](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1182) | BstNode_2060386312 | 20%（2/10），运行待验 | 1 / 1 | DuskGraveyard · 301839 + 50 bytes |
| [n1326](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1326) | BstNode_2060386313 | 20%（2/10），运行待验 | 1 / 1 | DuskGraveyard · 328884 + 50 bytes |
| [n1544](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1544) | BstNode_2060386310 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 381184 + 50 bytes |
| [n159](../Objects.level.bin对象实现清单.html#DuskMid%3An159) | BstNode_2060386365 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 47849 + 50 bytes |
| [n635](../Objects.level.bin对象实现清单.html#DuskMid%3An635) | BstNode_2060386315 | 20%（2/10），运行待验 | 1 / 1 | DuskMid · 136567 + 50 bytes |
| [n679](../Objects.level.bin对象实现清单.html#DuskMid%3An679) | BstNode_2060386323 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 142831 + 50 bytes |
| [n1005](../Objects.level.bin对象实现清单.html#DuskMid%3An1005) | BstNode_2060386317 | 20%（2/10），运行待验 | 1 / 1 | DuskMid · 214073 + 50 bytes |
| [n476](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An476) | BstNode_1167523896 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Cave · 134078 + 50 bytes |
| [n1000](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1000) | BstNode_3156082747 | 20%（2/10），运行待验 | 3 / 2 | Prairie_Cave · 254514 + 50 bytes |
| [n343](../Objects.level.bin对象实现清单.html#Prairie_Village%3An343) | BstNode_34603160 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 85479 + 48 bytes |
| [n1383](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1383) | BstNode_1528234068 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 253035 + 50 bytes |
| [n1497](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1497) | BstNode_1528234062 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 269587 + 50 bytes |
| [n1197](../Objects.level.bin对象实现清单.html#Rain%3An1197) | BstNode_34603098 | 20%（2/10），运行待验 | 2 / 0 | Rain · 296718 + 48 bytes |
| [n1234](../Objects.level.bin对象实现清单.html#Rain%3An1234) | BstNode_2060386413 | 20%（2/10），运行待验 | 1 / 1 | Rain · 303824 + 50 bytes |
| [n1478](../Objects.level.bin对象实现清单.html#Rain%3An1478) | BstNode_2060386370 | 20%（2/10），运行待验 | 1 / 0 | Rain · 358300 + 50 bytes |
| [n1603](../Objects.level.bin对象实现清单.html#Rain%3An1603) | BstNode_34603140 | 20%（2/10），运行待验 | 3 / 0 | Rain · 385647 + 48 bytes |
| [n1665](../Objects.level.bin对象实现清单.html#Rain%3An1665) | BstNode_2060386411 | 20%（2/10），运行待验 | 1 / 1 | Rain · 399585 + 50 bytes |
| [n203](../Objects.level.bin对象实现清单.html#RainEnd%3An203) | BstNode_2060386350 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 77963 + 50 bytes |
| [n1260](../Objects.level.bin对象实现清单.html#RainEnd%3An1260) | BstNode_2060386400 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 331213 + 50 bytes |
| [n1276](../Objects.level.bin对象实现清单.html#RainEnd%3An1276) | BstNode_2060386362 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 335442 + 50 bytes |
| [n1297](../Objects.level.bin对象实现清单.html#RainEnd%3An1297) | BstNode_2060386327 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 340155 + 50 bytes |
| [n265](../Objects.level.bin对象实现清单.html#RainForest%3An265) | BstNode_2060386403 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 73097 + 50 bytes |
| [n677](../Objects.level.bin对象实现清单.html#RainForest%3An677) | BstNode_2060386510 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 155831 + 50 bytes |
| [n717](../Objects.level.bin对象实现清单.html#RainForest%3An717) | BstNode_2060386399 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 166002 + 50 bytes |
| [n1139](../Objects.level.bin对象实现清单.html#RainForest%3An1139) | BstNode_2060386387 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 255858 + 50 bytes |
| [n383](../Objects.level.bin对象实现清单.html#RainMid%3An383) | BstNode_2446917729 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 98059 + 50 bytes |
| [n409](../Objects.level.bin对象实现清单.html#RainMid%3An409) | BstNode_2060386482 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 103136 + 50 bytes |
| [n520](../Objects.level.bin对象实现清单.html#RainMid%3An520) | BstNode_2345992367 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 122596 + 50 bytes |
| [n592](../Objects.level.bin对象实现清单.html#RainMid%3An592) | BstNode_2060386512 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 138146 + 50 bytes |
| [n608](../Objects.level.bin对象实现清单.html#RainMid%3An608) | BstNode_2446917741 | 20%（2/10），运行待验 | 3 / 1 | RainMid · 141120 + 50 bytes |
| [n716](../Objects.level.bin对象实现清单.html#RainMid%3An716) | BstNode_2060386567 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 161850 + 50 bytes |
| [n913](../Objects.level.bin对象实现清单.html#RainMid%3An913) | BstNode_2060386532 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 195280 + 50 bytes |
| [n922](../Objects.level.bin对象实现清单.html#RainMid%3An922) | BstNode_34603372 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 196324 + 48 bytes |
| [n1257](../Objects.level.bin对象实现清单.html#RainMid%3An1257) | BstNode_2446917735 | 20%（2/10），运行待验 | 3 / 0 | RainMid · 256268 + 50 bytes |
| [n1504](../Objects.level.bin对象实现清单.html#RainMid%3An1504) | BstNode_34603313 | 20%（2/10），运行待验 | 3 / 0 | RainMid · 301658 + 48 bytes |
| [n1722](../Objects.level.bin对象实现清单.html#RainMid%3An1722) | BstNode_2345992997 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 343122 + 50 bytes |
| [n1945](../Objects.level.bin对象实现清单.html#RainMid%3An1945) | BstNode_34603287 | 20%（2/10），运行待验 | 3 / 0 | RainMid · 378334 + 48 bytes |
| [n2027](../Objects.level.bin对象实现清单.html#RainMid%3An2027) | BstNode_2446917731 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 390461 + 50 bytes |
| [n2089](../Objects.level.bin对象实现清单.html#RainMid%3An2089) | BstNode_2060386515 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 403051 + 50 bytes |
| [n984](../Objects.level.bin对象实现清单.html#SkyHub2%3An984) | BstNode_2060386361 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 211542 + 50 bytes |
| [n1101](../Objects.level.bin对象实现清单.html#SkyHub2%3An1101) | BstNode_2060386424 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 234179 + 50 bytes |
| [n2390](../Objects.level.bin对象实现清单.html#SkyHub2%3An2390) | BstNode_2060386413 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 451693 + 50 bytes |
| [n1471](../Objects.level.bin对象实现清单.html#Storm%3An1471) | BstNode_2345992657 | 20%（2/10），运行待验 | 1 / 0 | Storm · 282179 + 50 bytes |
