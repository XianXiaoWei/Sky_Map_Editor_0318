# BirdFlock 单独类功能实现清单

功能分类：生物、群体与 AI。

此类职责：**鸟群发射、轨道、距离与预填充**。

类清单进度 40%（4/10），58 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：BirdFlock 的原默认值、继承初始化及 12 个序列化字段变体；原注册字段 12 项。
- [ ] 鸟群发射、轨道、距离与预填充（部分完成）：原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。
- [ ] 依赖调用与事件：Rail（57 条引用）、Float（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=BirdFlock) · [原字段、进度与全部实例 JSON](BirdFlock.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n19](../Objects.level.bin对象实现清单.html#Dawn%3An19) | BstNode_3156082711 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 36588 + 71 bytes |
| [n184](../Objects.level.bin对象实现清单.html#Dawn%3An184) | BstNode_3122856953 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 61621 + 71 bytes |
| [n192](../Objects.level.bin对象实现清单.html#Dawn%3An192) | BstNode_2504654864 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 62705 + 71 bytes |
| [n778](../Objects.level.bin对象实现清单.html#Dawn%3An778) | BstNode_2504654857 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 156584 + 71 bytes |
| [n1205](../Objects.level.bin对象实现清单.html#Dawn%3An1205) | BstNode_2504654932 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 214853 + 71 bytes |
| [n2047](../Objects.level.bin对象实现清单.html#Dawn%3An2047) | BstNode_34603046 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 335637 + 69 bytes |
| [n2312](../Objects.level.bin对象实现清单.html#Dawn%3An2312) | BstNode_2504654891 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 383313 + 71 bytes |
| [n2580](../Objects.level.bin对象实现清单.html#Dawn%3An2580) | BstNode_2504654854 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 430279 + 71 bytes |
| [n2846](../Objects.level.bin对象实现清单.html#Dawn%3An2846) | BstNode_2446917885 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 466431 + 71 bytes |
| [n2898](../Objects.level.bin对象实现清单.html#Dawn%3An2898) | BstNode_2446917884 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 475504 + 71 bytes |
| [n505](../Objects.level.bin对象实现清单.html#DayEnd%3An505) | BstNode_2446917695 | 20%（2/10），运行待验 | 1 / 1 | DayEnd · 121205 + 71 bytes |
| [n588](../Objects.level.bin对象实现清单.html#Dusk%3An588) | BstNode_2446917668 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 132695 + 71 bytes |
| [n606](../Objects.level.bin对象实现清单.html#Dusk%3An606) | BstNode_2446917698 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 134715 + 71 bytes |
| [n652](../Objects.level.bin对象实现清单.html#Dusk%3An652) | BstNode_2446917682 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 141477 + 71 bytes |
| [n816](../Objects.level.bin对象实现清单.html#Dusk%3An816) | BstNode_2446917666 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 171752 + 71 bytes |
| [n911](../Objects.level.bin对象实现清单.html#Dusk%3An911) | BstNode_2446917690 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 187973 + 71 bytes |
| [n357](../Objects.level.bin对象实现清单.html#HubReveal%3An357) | BstNode_2504654883 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 90712 + 71 bytes |
| [n437](../Objects.level.bin对象实现清单.html#HubReveal%3An437) | BstNode_2446917878 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 105001 + 71 bytes |
| [n1005](../Objects.level.bin对象实现清单.html#HubReveal%3An1005) | BstNode_2446917808 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 197893 + 71 bytes |
| [n270](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An270) | BstNode_2529558652 | 20%（2/10），运行待验 | 0 / 3 | Prairie_ButterflyFields · 83106 + 71 bytes |
| [n575](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An575) | BstNode_1167523904 | 20%（2/10），运行待验 | 1 / 1 | Prairie_ButterflyFields · 145598 + 71 bytes |
| [n85](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An85) | BstNode_34603426 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 41042 + 69 bytes |
| [n301](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An301) | BstNode_34603411 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 91873 + 69 bytes |
| [n896](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An896) | BstNode_34603405 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 221106 + 69 bytes |
| [n348](../Objects.level.bin对象实现清单.html#Prairie_Village%3An348) | BstNode_2446917840 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 85982 + 71 bytes |
| [n474](../Objects.level.bin对象实现清单.html#Prairie_Village%3An474) | BstNode_2446917817 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 109215 + 71 bytes |
| [n745](../Objects.level.bin对象实现清单.html#Prairie_Village%3An745) | BstNode_2446917818 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 152325 + 71 bytes |
| [n792](../Objects.level.bin对象实现清单.html#Prairie_Village%3An792) | BstNode_2446917824 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 159130 + 71 bytes |
| [n1534](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1534) | BstNode_1842806837 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 275278 + 71 bytes |
| [n2097](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2097) | BstNode_2446917839 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 369489 + 71 bytes |
| [n2200](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2200) | BstNode_2446917825 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 383650 + 71 bytes |
| [n2685](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2685) | BstNode_2446917841 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 454790 + 71 bytes |
| [n1007](../Objects.level.bin对象实现清单.html#Rain%3An1007) | BstNode_2446917702 | 20%（2/10），运行待验 | 1 / 0 | Rain · 255230 + 71 bytes |
| [n250](../Objects.level.bin对象实现清单.html#RainEnd%3An250) | BstNode_2446917713 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 87646 + 71 bytes |
| [n739](../Objects.level.bin对象实现清单.html#RainEnd%3An739) | BstNode_2446917712 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 207912 + 71 bytes |
| [n849](../Objects.level.bin对象实现清单.html#RainEnd%3An849) | BstNode_2446917687 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 231818 + 71 bytes |
| [n1088](../Objects.level.bin对象实现清单.html#RainEnd%3An1088) | BstNode_2446917711 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 289202 + 71 bytes |
| [n1562](../Objects.level.bin对象实现清单.html#RainEnd%3An1562) | BstNode_2446917685 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 397597 + 71 bytes |
| [n1586](../Objects.level.bin对象实现清单.html#RainEnd%3An1586) | BstNode_2446917686 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 401437 + 71 bytes |
| [n1589](../Objects.level.bin对象实现清单.html#RainEnd%3An1589) | BstNode_2446917656 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 401651 + 71 bytes |
| [n278](../Objects.level.bin对象实现清单.html#RainForest%3An278) | BstNode_2345992294 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 75440 + 71 bytes |
| [n361](../Objects.level.bin对象实现清单.html#RainForest%3An361) | BstNode_2345992292 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 88586 + 71 bytes |
| [n60](../Objects.level.bin对象实现清单.html#RainMid%3An60) | BstNode_1049165922 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 38131 + 71 bytes |
| [n613](../Objects.level.bin对象实现清单.html#RainMid%3An613) | BstNode_1049165923 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 141883 + 71 bytes |
| [n1390](../Objects.level.bin对象实现清单.html#RainMid%3An1390) | BstNode_1049165926 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 279924 + 71 bytes |
| [n2028](../Objects.level.bin对象实现清单.html#RainMid%3An2028) | BstNode_1049165927 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 390511 + 71 bytes |
| [n1224](../Objects.level.bin对象实现清单.html#Storm%3An1224) | BstNode_2529559571 | 20%（2/10），运行待验 | 1 / 0 | Storm · 242385 + 71 bytes |
| [n506](../Objects.level.bin对象实现清单.html#StormEnd%3An506) | BstNode_2446917662 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 113668 + 71 bytes |
| [n559](../Objects.level.bin对象实现清单.html#StormEnd%3An559) | BstNode_2446917647 | 20%（2/10），运行待验 | 1 / 1 | StormEnd · 121914 + 71 bytes |
| [n921](../Objects.level.bin对象实现清单.html#Sunset%3An921) | BstNode_3156082702 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 187206 + 71 bytes |
| [n963](../Objects.level.bin对象实现清单.html#Sunset%3An963) | BstNode_3156082698 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 193498 + 71 bytes |
| [n1116](../Objects.level.bin对象实现清单.html#Sunset%3An1116) | BstNode_3156082696 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 216349 + 71 bytes |
| [n1119](../Objects.level.bin对象实现清单.html#Sunset%3An1119) | BstNode_3156082697 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 216617 + 71 bytes |
| [n1397](../Objects.level.bin对象实现清单.html#Sunset%3An1397) | BstNode_3156082701 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 261324 + 71 bytes |
| [n67](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An67) | BstNode_656801859 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 35325 + 70 bytes |
| [n255](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An255) | BstNode_656801868 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 74703 + 70 bytes |
| [n790](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An790) | BstNode_2446917641 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 191290 + 71 bytes |
| [n839](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An839) | BstNode_2446917651 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 200751 + 71 bytes |
