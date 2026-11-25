# NotOnRegion 单独类功能实现清单

功能分类：区域、喊叫与空间触发。

此类职责：**区域外事件触发**。

类清单进度 30%（3/10），16 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：NotOnRegion 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 区域外事件触发：节点与引用已清点；原反向区域条件和启用/事件规则待恢复。
- [ ] 依赖调用与事件：Clump（32 条引用）
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

节点与引用已清点；原反向区域条件和启用/事件规则待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=NotOnRegion) · [原字段、进度与全部实例 JSON](NotOnRegion.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n1579](../Objects.level.bin对象实现清单.html#Dawn%3An1579) | BstNode_1293287646 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 272709 + 35 bytes |
| [n690](../Objects.level.bin对象实现清单.html#DayHubCave%3An690) | BstNode_2345992691 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 152494 + 35 bytes |
| [n363](../Objects.level.bin对象实现清单.html#Dusk%3An363) | BstNode_2345992295 | 20%（2/10），运行待验 | 2 / 0 | Dusk · 89786 + 35 bytes |
| [n551](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An551) | BstNode_2345992555 | 20%（2/10），运行待验 | 2 / 0 | DuskGraveyard · 153281 + 35 bytes |
| [n824](../Objects.level.bin对象实现清单.html#DuskMid%3An824) | BstNode_2345992373 | 20%（2/10），运行待验 | 2 / 0 | DuskMid · 176656 + 35 bytes |
| [n1287](../Objects.level.bin对象实现清单.html#HubReveal%3An1287) | BstNode_2529558693 | 20%（2/10），运行待验 | 2 / 3 | HubReveal · 248015 + 35 bytes |
| [n230](../Objects.level.bin对象实现清单.html#NightEntrance%3An230) | BstNode_2345992362 | 20%（2/10），运行待验 | 2 / 0 | NightEntrance · 50722 + 35 bytes |
| [n1187](../Objects.level.bin对象实现清单.html#Rain%3An1187) | BstNode_2783838298 | 20%（2/10），运行待验 | 2 / 1 | Rain · 295024 + 35 bytes |
| [n1202](../Objects.level.bin对象实现清单.html#Rain%3An1202) | BstNode_2783838289 | 20%（2/10），运行待验 | 2 / 1 | Rain · 297242 + 35 bytes |
| [n1269](../Objects.level.bin对象实现清单.html#Rain%3An1269) | BstNode_2783838279 | 20%（2/10），运行待验 | 2 / 1 | Rain · 311648 + 35 bytes |
| [n1816](../Objects.level.bin对象实现清单.html#Rain%3An1816) | BstNode_2345992297 | 20%（2/10），运行待验 | 2 / 0 | Rain · 438710 + 35 bytes |
| [n701](../Objects.level.bin对象实现清单.html#RainEnd%3An701) | BstNode_2345992572 | 20%（2/10），运行待验 | 2 / 0 | RainEnd · 198440 + 35 bytes |
| [n972](../Objects.level.bin对象实现清单.html#RainForest%3An972) | BstNode_2345992923 | 20%（2/10），运行待验 | 2 / 0 | RainForest · 224159 + 35 bytes |
| [n1542](../Objects.level.bin对象实现清单.html#RainMid%3An1542) | BstNode_2345992381 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 308380 + 35 bytes |
| [n1268](../Objects.level.bin对象实现清单.html#Storm%3An1268) | BstNode_2529559996 | 20%（2/10），运行待验 | 2 / 1 | Storm · 249940 + 35 bytes |
| [n736](../Objects.level.bin对象实现清单.html#StormEnd%3An736) | BstNode_2345992676 | 20%（2/10），运行待验 | 2 / 0 | StormEnd · 146670 + 35 bytes |
