# Water 单独类功能实现清单

功能分类：水、雾与天气。

此类职责：**水面空间与阴影配置**。

类清单进度 30%（3/10），38 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Water 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 2 项。
- [ ] 水面空间与阴影配置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Water) · [原字段、进度与全部实例 JSON](Water.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n365](../Objects.level.bin对象实现清单.html#Dawn%3An365) | BstNode_2279669986 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 88854 + 88 bytes |
| [n1103](../Objects.level.bin对象实现清单.html#Dusk%3An1103) | BstNode_885 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 225387 + 81 bytes |
| [n281](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An281) | BstNode_885 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 90729 + 81 bytes |
| [n417](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An417) | BstNode_2345992326 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 122546 + 88 bytes |
| [n807](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An807) | BstNode_2345992208 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 211585 + 88 bytes |
| [n116](../Objects.level.bin对象实现清单.html#DuskMid%3An116) | BstNode_2345992422 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 40009 + 88 bytes |
| [n202](../Objects.level.bin对象实现清单.html#DuskMid%3An202) | BstNode_2345992421 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 56383 + 88 bytes |
| [n535](../Objects.level.bin对象实现清单.html#DuskMid%3An535) | BstNode_2345992468 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 118140 + 88 bytes |
| [n741](../Objects.level.bin对象实现清单.html#DuskMid%3An741) | BstNode_2345992340 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 159123 + 88 bytes |
| [n794](../Objects.level.bin对象实现清单.html#DuskMid%3An794) | BstNode_2345992469 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 169620 + 88 bytes |
| [n432](../Objects.level.bin对象实现清单.html#HubReveal%3An432) | BstNode_544 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 103677 + 81 bytes |
| [n485](../Objects.level.bin对象实现清单.html#Night%3An485) | BstNode_34603591 | 20%（2/10），运行待验 | 0 / 0 | Night · 95920 + 86 bytes |
| [n460](../Objects.level.bin对象实现清单.html#NightEntrance%3An460) | BstNode_233 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 85494 + 81 bytes |
| [n173](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An173) | BstNode_1482555503 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 62482 + 88 bytes |
| [n209](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An209) | BstNode_2753888413 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 71001 + 88 bytes |
| [n459](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An459) | BstNode_2753888429 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 130534 + 88 bytes |
| [n1432](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1432) | BstNode_2753888433 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 358619 + 88 bytes |
| [n542](../Objects.level.bin对象实现清单.html#Prairie_Village%3An542) | BstNode_1803 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 118533 + 82 bytes |
| [n146](../Objects.level.bin对象实现清单.html#Rain%3An146) | BstNode_211 | 20%（2/10），运行待验 | 0 / 0 | Rain · 61290 + 81 bytes |
| [n582](../Objects.level.bin对象实现清单.html#Rain%3An582) | BstNode_1164 | 20%（2/10），运行待验 | 0 / 0 | Rain · 160394 + 82 bytes |
| [n1350](../Objects.level.bin对象实现清单.html#Rain%3An1350) | BstNode_1165 | 20%（2/10），运行待验 | 0 / 0 | Rain · 329287 + 82 bytes |
| [n191](../Objects.level.bin对象实现清单.html#RainEnd%3An191) | BstNode_1138 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 75398 + 82 bytes |
| [n362](../Objects.level.bin对象实现清单.html#RainEnd%3An362) | BstNode_743 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 115650 + 81 bytes |
| [n931](../Objects.level.bin对象实现清单.html#RainEnd%3An931) | BstNode_676 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 249559 + 81 bytes |
| [n1071](../Objects.level.bin对象实现清单.html#RainEnd%3An1071) | BstNode_803 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 285120 + 81 bytes |
| [n1140](../Objects.level.bin对象实现清单.html#RainEnd%3An1140) | BstNode_105 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 301148 + 81 bytes |
| [n506](../Objects.level.bin对象实现清单.html#RainForest%3An506) | BstNode_2345992699 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 116291 + 88 bytes |
| [n726](../Objects.level.bin对象实现清单.html#RainForest%3An726) | BstNode_2345992760 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 167522 + 88 bytes |
| [n835](../Objects.level.bin对象实现清单.html#RainMid%3An835) | BstNode_882 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 182226 + 81 bytes |
| [n989](../Objects.level.bin对象实现清单.html#RainMid%3An989) | BstNode_2345992764 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 206762 + 88 bytes |
| [n1661](../Objects.level.bin对象实现清单.html#RainMid%3An1661) | BstNode_2345992760 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 333748 + 88 bytes |
| [n692](../Objects.level.bin对象实现清单.html#SkyHub2%3An692) | BstNode_2753888322 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 160924 + 88 bytes |
| [n1917](../Objects.level.bin对象实现清单.html#SkyHub2%3An1917) | BstNode_1167525152 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 363972 + 88 bytes |
| [n778](../Objects.level.bin对象实现清单.html#Storm%3An778) | BstNode_2529559698 | 20%（2/10），运行待验 | 0 / 0 | Storm · 162090 + 88 bytes |
| [n949](../Objects.level.bin对象实现清单.html#Storm%3An949) | BstNode_2529559085 | 20%（2/10），运行待验 | 0 / 0 | Storm · 191639 + 88 bytes |
| [n1062](../Objects.level.bin对象实现清单.html#Storm%3An1062) | BstNode_2529559659 | 20%（2/10），运行待验 | 0 / 0 | Storm · 211187 + 88 bytes |
| [n1549](../Objects.level.bin对象实现清单.html#Storm%3An1549) | BstNode_2529559735 | 20%（2/10），运行待验 | 0 / 0 | Storm · 296238 + 88 bytes |
| [n899](../Objects.level.bin对象实现清单.html#StormEnd%3An899) | BstNode_2529558663 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 172618 + 88 bytes |
