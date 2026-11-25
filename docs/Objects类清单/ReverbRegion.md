# ReverbRegion 单独类功能实现清单

功能分类：声音、音乐与混音。

此类职责：**区域混响与参数过渡**。

类清单进度 30%（3/10），33 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：ReverbRegion 的原默认值、继承初始化及 28 个序列化字段变体；原注册字段 28 项。
- [ ] 区域混响与参数过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（33 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 28 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=ReverbRegion) · [原字段、进度与全部实例 JSON](ReverbRegion.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n1331](../Objects.level.bin对象实现清单.html#Dawn%3An1331) | BstNode_1165 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 239408 + 90 bytes |
| [n2304](../Objects.level.bin对象实现清单.html#Dawn%3An2304) | BstNode_1160 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 381979 + 90 bytes |
| [n27](../Objects.level.bin对象实现清单.html#DayEnd%3An27) | BstNode_93 | 20%（2/10），运行待验 | 1 / 0 | DayEnd · 27195 + 88 bytes |
| [n157](../Objects.level.bin对象实现清单.html#Dusk%3An157) | BstNode_2783838215 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 52129 + 96 bytes |
| [n422](../Objects.level.bin对象实现清单.html#Dusk%3An422) | BstNode_2783838214 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 100009 + 96 bytes |
| [n408](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An408) | BstNode_2783838211 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 121353 + 96 bytes |
| [n761](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An761) | BstNode_2783838214 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 198897 + 96 bytes |
| [n1694](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1694) | BstNode_2783838213 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 418795 + 96 bytes |
| [n409](../Objects.level.bin对象实现清单.html#DuskMid%3An409) | BstNode_2783838214 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 91936 + 96 bytes |
| [n674](../Objects.level.bin对象实现清单.html#DuskMid%3An674) | BstNode_2783838216 | 20%（2/10），运行待验 | 1 / 0 | DuskMid · 142454 + 96 bytes |
| [n164](../Objects.level.bin对象实现清单.html#HubReveal%3An164) | BstNode_1237 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 57063 + 90 bytes |
| [n1385](../Objects.level.bin对象实现清单.html#Night%3An1385) | BstNode_1948 | 20%（2/10），运行待验 | 1 / 0 | Night · 225417 + 90 bytes |
| [n3033](../Objects.level.bin对象实现清单.html#Night%3An3033) | BstNode_1953 | 20%（2/10），运行待验 | 1 / 0 | Night · 471641 + 90 bytes |
| [n444](../Objects.level.bin对象实现清单.html#NightEnd%3An444) | BstNode_185 | 20%（2/10），运行待验 | 1 / 0 | NightEnd · 98110 + 89 bytes |
| [n526](../Objects.level.bin对象实现清单.html#NightEntrance%3An526) | BstNode_2783838213 | 20%（2/10），运行待验 | 1 / 0 | NightEntrance · 95156 + 96 bytes |
| [n443](../Objects.level.bin对象实现清单.html#Prairie_Village%3An443) | BstNode_2783838264 | 20%（2/10），运行待验 | 1 / 0 | Prairie_Village · 103388 + 96 bytes |
| [n371](../Objects.level.bin对象实现清单.html#Rain%3An371) | BstNode_1468 | 20%（2/10），运行待验 | 1 / 0 | Rain · 110707 + 90 bytes |
| [n262](../Objects.level.bin对象实现清单.html#RainEnd%3An262) | BstNode_609 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 91302 + 89 bytes |
| [n488](../Objects.level.bin对象实现清单.html#RainForest%3An488) | BstNode_1468 | 20%（2/10），运行待验 | 1 / 0 | RainForest · 110871 + 90 bytes |
| [n446](../Objects.level.bin对象实现清单.html#RainMid%3An446) | BstNode_1341 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 110003 + 90 bytes |
| [n1444](../Objects.level.bin对象实现清单.html#RainMid%3An1444) | BstNode_1622 | 20%（2/10），运行待验 | 1 / 0 | RainMid · 290263 + 90 bytes |
| [n372](../Objects.level.bin对象实现清单.html#SkyHub2%3An372) | BstNode_2783838247 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 103376 + 96 bytes |
| [n606](../Objects.level.bin对象实现清单.html#SkyHub2%3An606) | BstNode_2783838245 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 145885 + 96 bytes |
| [n809](../Objects.level.bin对象实现清单.html#SkyHub2%3An809) | BstNode_1482555422 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 182600 + 96 bytes |
| [n1190](../Objects.level.bin对象实现清单.html#SkyHub2%3An1190) | BstNode_2783838248 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 249387 + 96 bytes |
| [n1235](../Objects.level.bin对象实现清单.html#SkyHub2%3An1235) | BstNode_2783838246 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 256658 + 96 bytes |
| [n397](../Objects.level.bin对象实现清单.html#Storm%3An397) | BstNode_1278 | 20%（2/10），运行待验 | 1 / 0 | Storm · 95046 + 90 bytes |
| [n1744](../Objects.level.bin对象实现清单.html#Sunset%3An1744) | BstNode_2783838213 | 20%（2/10），运行待验 | 1 / 0 | Sunset · 320542 + 96 bytes |
| [n7](../Objects.level.bin对象实现清单.html#SunsetEnd%3An7) | BstNode_1717 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 27346 + 90 bytes |
| [n77](../Objects.level.bin对象实现清单.html#SunsetEnd%3An77) | BstNode_2783838218 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 41235 + 96 bytes |
| [n834](../Objects.level.bin对象实现清单.html#SunsetEnd%3An834) | BstNode_1986 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd · 166142 + 90 bytes |
| [n9](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An9) | BstNode_1717 | 20%（2/10），运行待验 | 1 / 0 | SunsetEnd2 · 23125 + 90 bytes |
| [n926](../Objects.level.bin对象实现清单.html#SunsetRace%3An926) | BstNode_2783838211 | 20%（2/10），运行待验 | 1 / 0 | SunsetRace · 200298 + 96 bytes |
