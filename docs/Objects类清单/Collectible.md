# Collectible 单独类功能实现清单

功能分类：收集物、蜡烛与解锁。

此类职责：**收集物类型、名称与空间**。

类清单进度 30%（3/10），53 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Collectible 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 3 项。
- [ ] 收集物类型、名称与空间：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Collectible) · [原字段、进度与全部实例 JSON](Collectible.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n277](../Objects.level.bin对象实现清单.html#CandleSpace%3An277) | BstNode_2529559024 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 62884 + 98 bytes |
| [n1746](../Objects.level.bin对象实现清单.html#Dawn%3An1746) | BstNode_2446917786 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 296775 + 97 bytes |
| [n693](../Objects.level.bin对象实现清单.html#DayEnd%3An693) | BstNode_2446917786 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 155871 + 97 bytes |
| [n77](../Objects.level.bin对象实现清单.html#DayHubCave%3An77) | BstNode_2446917684 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 36400 + 103 bytes |
| [n846](../Objects.level.bin对象实现清单.html#DayHubCave%3An846) | BstNode_2470641668 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 180792 + 99 bytes |
| [n237](../Objects.level.bin对象实现清单.html#Dusk%3An237) | BstNode_1844 | 20%（2/10），运行待验 | 0 / 2 | Dusk · 67630 + 91 bytes |
| [n927](../Objects.level.bin对象实现清单.html#Dusk%3An927) | BstNode_2345992306 | 20%（2/10），运行待验 | 0 / 2 | Dusk · 190659 + 100 bytes |
| [n183](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An183) | BstNode_2345992762 | 20%（2/10），运行待验 | 0 / 2 | DuskGraveyard · 67686 + 39 bytes |
| [n400](../Objects.level.bin对象实现清单.html#DuskMid%3An400) | BstNode_1622 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 90574 + 34 bytes |
| [n454](../Objects.level.bin对象实现清单.html#DuskMid%3An454) | BstNode_2345992381 | 20%（2/10），运行待验 | 0 / 2 | DuskMid · 101075 + 36 bytes |
| [n40](../Objects.level.bin对象实现清单.html#HubReveal%3An40) | BstNode_2504654915 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 34551 + 97 bytes |
| [n134](../Objects.level.bin对象实现清单.html#HubReveal%3An134) | BstNode_1101 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 52803 + 92 bytes |
| [n152](../Objects.level.bin对象实现清单.html#HubReveal%3An152) | BstNode_3156082758 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 55442 + 99 bytes |
| [n663](../Objects.level.bin对象实现清单.html#HubReveal%3An663) | BstNode_2529558572 | 20%（2/10），运行待验 | 0 / 4 | HubReveal · 140782 + 97 bytes |
| [n1164](../Objects.level.bin对象实现清单.html#HubReveal%3An1164) | BstNode_2529558609 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 227005 + 97 bytes |
| [n1289](../Objects.level.bin对象实现清单.html#HubReveal%3An1289) | BstNode_2504654917 | 20%（2/10），运行待验 | 0 / 3 | HubReveal · 248435 + 97 bytes |
| [n124](../Objects.level.bin对象实现清单.html#Night%3An124) | BstNode_34604517 | 20%（2/10），运行待验 | 0 / 2 | Night · 41084 + 99 bytes |
| [n147](../Objects.level.bin对象实现清单.html#Night%3An147) | BstNode_34603997 | 20%（2/10），运行待验 | 0 / 2 | Night · 44261 + 97 bytes |
| [n2157](../Objects.level.bin对象实现清单.html#Night%3An2157) | BstNode_2345992306 | 20%（2/10），运行待验 | 0 / 2 | Night · 342325 + 99 bytes |
| [n2365](../Objects.level.bin对象实现清单.html#Night%3An2365) | BstNode_34604067 | 20%（2/10），运行待验 | 0 / 1 | Night · 371367 + 97 bytes |
| [n2785](../Objects.level.bin对象实现清单.html#Night%3An2785) | BstNode_34603579 | 20%（2/10），运行待验 | 0 / 2 | Night · 432908 + 96 bytes |
| [n336](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An336) | BstNode_1706 | 20%（2/10），运行待验 | 0 / 2 | Prairie_ButterflyFields · 98088 + 97 bytes |
| [n419](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An419) | BstNode_2446917684 | 20%（2/10），运行待验 | 0 / 1 | Prairie_ButterflyFields · 113880 + 103 bytes |
| [n262](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An262) | BstNode_3122856047 | 20%（2/10），运行待验 | 0 / 4 | Prairie_Cave · 84487 + 98 bytes |
| [n298](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An298) | BstNode_1101 | 20%（2/10），运行待验 | 0 / 3 | Prairie_Cave · 91853 + 92 bytes |
| [n1065](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1065) | BstNode_1293287551 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 269564 + 98 bytes |
| [n488](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An488) | BstNode_34603016 | 20%（2/10），运行待验 | 0 / 2 | Prairie_NestAndKeeper · 128274 + 96 bytes |
| [n878](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An878) | BstNode_34603536 | 20%（2/10），运行待验 | 0 / 1 | Prairie_NestAndKeeper · 217401 + 99 bytes |
| [n1479](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1479) | BstNode_2504655004 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 267235 + 98 bytes |
| [n1525](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1525) | BstNode_3122855955 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 273485 + 103 bytes |
| [n2190](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2190) | BstNode_1293287597 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 382452 + 98 bytes |
| [n2250](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2250) | BstNode_3122855974 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 390934 + 99 bytes |
| [n1608](../Objects.level.bin对象实现清单.html#Rain%3An1608) | BstNode_1499 | 20%（2/10），运行待验 | 0 / 0 | Rain · 386205 + 91 bytes |
| [n1705](../Objects.level.bin对象实现清单.html#Rain%3An1705) | BstNode_2345992871 | 20%（2/10），运行待验 | 0 / 3 | Rain · 409761 + 98 bytes |
| [n1455](../Objects.level.bin对象实现清单.html#RainEnd%3An1455) | BstNode_1534 | 20%（2/10），运行待验 | 0 / 2 | RainEnd · 377254 + 93 bytes |
| [n418](../Objects.level.bin对象实现清单.html#RainForest%3An418) | BstNode_34603146 | 20%（2/10），运行待验 | 0 / 3 | RainForest · 95565 + 96 bytes |
| [n460](../Objects.level.bin对象实现清单.html#RainForest%3An460) | BstNode_1622 | 20%（2/10），运行待验 | 0 / 2 | RainForest · 104121 + 91 bytes |
| [n639](../Objects.level.bin对象实现清单.html#RainForest%3An639) | BstNode_1534 | 20%（2/10），运行待验 | 0 / 2 | RainForest · 146345 + 92 bytes |
| [n19](../Objects.level.bin对象实现清单.html#RainMid%3An19) | BstNode_2060386407 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 29897 + 99 bytes |
| [n194](../Objects.level.bin对象实现清单.html#RainMid%3An194) | BstNode_1665 | 20%（2/10），运行待验 | 0 / 3 | RainMid · 65077 + 93 bytes |
| [n326](../Objects.level.bin对象实现清单.html#RainMid%3An326) | BstNode_2345992665 | 20%（2/10），运行待验 | 0 / 2 | RainMid · 88398 + 99 bytes |
| [n866](../Objects.level.bin对象实现清单.html#RainMid%3An866) | BstNode_1851 | 20%（2/10），运行待验 | 0 / 3 | RainMid · 187478 + 96 bytes |
| [n1847](../Objects.level.bin对象实现清单.html#RainMid%3An1847) | BstNode_1759 | 20%（2/10），运行待验 | 0 / 3 | RainMid · 362640 + 91 bytes |
| [n955](../Objects.level.bin对象实现清单.html#SkyHub2%3An955) | BstNode_1167524167 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 206368 + 102 bytes |
| [n1015](../Objects.level.bin对象实现清单.html#SkyHub2%3An1015) | BstNode_2446917934 | 20%（2/10），运行待验 | 0 / 4 | SkyHub2 · 218542 + 99 bytes |
| [n1423](../Objects.level.bin对象实现清单.html#SkyHub2%3An1423) | BstNode_2446917925 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 280682 + 98 bytes |
| [n25](../Objects.level.bin对象实现清单.html#Sunset%3An25) | BstNode_1167524233 | 20%（2/10），运行待验 | 0 / 2 | Sunset · 30283 + 103 bytes |
| [n776](../Objects.level.bin对象实现清单.html#Sunset%3An776) | BstNode_1622 | 20%（2/10），运行待验 | 0 / 3 | Sunset · 164774 + 93 bytes |
| [n37](../Objects.level.bin对象实现清单.html#SunsetEnd%3An37) | BstNode_1167524490 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 31912 + 102 bytes |
| [n91](../Objects.level.bin对象实现清单.html#SunsetEnd%3An91) | BstNode_1167524176 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 43082 + 99 bytes |
| [n878](../Objects.level.bin对象实现清单.html#SunsetEnd%3An878) | BstNode_2446917668 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 172816 + 98 bytes |
| [n1135](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1135) | BstNode_1622 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 212822 + 92 bytes |
| [n1164](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1164) | BstNode_1167524448 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 217720 + 102 bytes |
