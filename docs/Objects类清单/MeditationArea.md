# MeditationArea 单独类功能实现清单

功能分类：任务、先祖与场景机制。

此类职责：**冥想区域、目标、相机与确认**。

类清单进度 30%（3/10），45 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：MeditationArea 的原默认值、继承初始化及 22 个序列化字段变体；原注册字段 22 项。
- [ ] 冥想区域、目标、相机与确认：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（42 条引用）、LevelMesh（7 条引用）、CameraKeyFrame（17 条引用）、Float（4 条引用）、Beamo（2 条引用）、Marker（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 22 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=MeditationArea) · [原字段、进度与全部实例 JSON](MeditationArea.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n260](../Objects.level.bin对象实现清单.html#CandleSpace%3An260) | BstNode_2446917708 | 20%（2/10），运行待验 | 2 / 2 | CandleSpace · 58813 + 150 bytes |
| [n365](../Objects.level.bin对象实现清单.html#CandleSpace%3An365) | BstNode_2529558617 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 76960 + 150 bytes |
| [n455](../Objects.level.bin对象实现清单.html#CandleSpace%3An455) | BstNode_3156082705 | 20%（2/10），运行待验 | 4 / 1 | CandleSpace · 89186 + 150 bytes |
| [n640](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An640) | BstNode_2446917633 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 125694 + 150 bytes |
| [n52](../Objects.level.bin对象实现清单.html#CarryLand%3An52) | BstNode_3707306048 | 20%（2/10），运行待验 | 0 / 1 | CarryLand · 15612 + 150 bytes |
| [n57](../Objects.level.bin对象实现清单.html#CarryLand%3An57) | BstNode_3707306008 | 20%（2/10），运行待验 | 0 / 1 | CarryLand · 16994 + 150 bytes |
| [n76](../Objects.level.bin对象实现清单.html#CarryLand%3An76) | BstNode_3707306019 | 20%（2/10），运行待验 | 0 / 1 | CarryLand · 20292 + 150 bytes |
| [n33](../Objects.level.bin对象实现清单.html#CarryLand2%3An33) | BstNode_3707306019 | 20%（2/10），运行待验 | 0 / 1 | CarryLand2 · 18235 + 150 bytes |
| [n62](../Objects.level.bin对象实现清单.html#CarryLand2%3An62) | BstNode_3707306008 | 20%（2/10），运行待验 | 0 / 1 | CarryLand2 · 22660 + 150 bytes |
| [n185](../Objects.level.bin对象实现清单.html#CarryLand2%3An185) | BstNode_3707306048 | 20%（2/10），运行待验 | 0 / 1 | CarryLand2 · 43825 + 150 bytes |
| [n271](../Objects.level.bin对象实现清单.html#Dawn%3An271) | BstNode_34603010 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 77133 + 148 bytes |
| [n291](../Objects.level.bin对象实现清单.html#Dawn%3An291) | BstNode_1628 | 20%（2/10），运行待验 | 5 / 4 | Dawn · 79137 + 144 bytes |
| [n1204](../Objects.level.bin对象实现清单.html#Dawn%3An1204) | BstNode_2446917659 | 20%（2/10），运行待验 | 3 / 0 | Dawn · 214703 + 150 bytes |
| [n228](../Objects.level.bin对象实现清单.html#DayEnd%3An228) | BstNode_504 | 20%（2/10），运行待验 | 3 / 2 | DayEnd · 68852 + 143 bytes |
| [n791](../Objects.level.bin对象实现清单.html#DuskMid%3An791) | BstNode_2345992530 | 20%（2/10），运行待验 | 4 / 0 | DuskMid · 168919 + 149 bytes |
| [n375](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An375) | BstNode_1293287425 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 99209 + 150 bytes |
| [n1157](../Objects.level.bin对象实现清单.html#HubReveal%3An1157) | BstNode_769 | 20%（2/10），运行待验 | 1 / 0 | HubReveal · 225833 + 143 bytes |
| [n79](../Objects.level.bin对象实现清单.html#Night%3An79) | BstNode_881 | 20%（2/10），运行待验 | 2 / 2 | Night · 34751 + 142 bytes |
| [n854](../Objects.level.bin对象实现清单.html#Night%3An854) | BstNode_914 | 20%（2/10），运行待验 | 2 / 2 | Night · 150338 + 142 bytes |
| [n1114](../Objects.level.bin对象实现清单.html#Night%3An1114) | BstNode_982 | 20%（2/10），运行待验 | 2 / 3 | Night · 185725 + 142 bytes |
| [n1247](../Objects.level.bin对象实现清单.html#Night%3An1247) | BstNode_34604351 | 20%（2/10），运行待验 | 4 / 0 | Night · 206414 + 147 bytes |
| [n1753](../Objects.level.bin对象实现清单.html#Night%3An1753) | BstNode_729 | 20%（2/10），运行待验 | 2 / 3 | Night · 273754 + 142 bytes |
| [n1813](../Objects.level.bin对象实现清单.html#Night%3An1813) | BstNode_994 | 20%（2/10），运行待验 | 2 / 2 | Night · 282528 + 142 bytes |
| [n17](../Objects.level.bin对象实现清单.html#NightEnd%3An17) | BstNode_34603116 | 20%（2/10），运行待验 | 3 / 1 | NightEnd · 22587 + 167 bytes |
| [n534](../Objects.level.bin对象实现清单.html#NightEnd%3An534) | BstNode_34603058 | 20%（2/10），运行待验 | 5 / 1 | NightEnd · 109913 + 148 bytes |
| [n595](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An595) | BstNode_2529558664 | 20%（2/10），运行待验 | 3 / 3 | Prairie_ButterflyFields · 147984 + 150 bytes |
| [n936](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An936) | BstNode_1293287425 | 20%（2/10），运行待验 | 1 / 3 | Prairie_ButterflyFields · 201042 + 150 bytes |
| [n1225](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1225) | BstNode_1293287546 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Cave · 304801 + 150 bytes |
| [n496](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An496) | BstNode_1293287425 | 20%（2/10），运行待验 | 0 / 3 | Prairie_NestAndKeeper · 128932 + 150 bytes |
| [n832](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An832) | BstNode_1528233991 | 20%（2/10），运行待验 | 1 / 0 | Prairie_NestAndKeeper · 207431 + 150 bytes |
| [n1461](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1461) | BstNode_34603032 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 264761 + 148 bytes |
| [n1511](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1511) | BstNode_1293287425 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 271994 + 150 bytes |
| [n374](../Objects.level.bin对象实现清单.html#RainEnd%3An374) | BstNode_256 | 20%（2/10），运行待验 | 4 / 3 | RainEnd · 118649 + 143 bytes |
| [n418](../Objects.level.bin对象实现清单.html#SunsetEnd%3An418) | BstNode_264 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd · 101401 + 143 bytes |
| [n658](../Objects.level.bin对象实现清单.html#SunsetEnd%3An658) | BstNode_105 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd · 134942 + 143 bytes |
| [n536](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An536) | BstNode_931 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd2 · 137504 + 143 bytes |
| [n751](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An751) | BstNode_1049165926 | 20%（2/10），运行待验 | 3 / 2 | SunsetEnd2 · 184084 + 150 bytes |
| [n114](../Objects.level.bin对象实现清单.html#SunsetRace%3An114) | BstNode_1167523865 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 43038 + 150 bytes |
| [n159](../Objects.level.bin对象实现清单.html#SunsetRace%3An159) | BstNode_1167523955 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 50781 + 150 bytes |
| [n475](../Objects.level.bin对象实现清单.html#SunsetRace%3An475) | BstNode_1167523871 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 117297 + 150 bytes |
| [n593](../Objects.level.bin对象实现清单.html#SunsetRace%3An593) | BstNode_1167523944 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 141577 + 150 bytes |
| [n788](../Objects.level.bin对象实现清单.html#SunsetRace%3An788) | BstNode_1167523922 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 177354 + 150 bytes |
| [n879](../Objects.level.bin对象实现清单.html#SunsetRace%3An879) | BstNode_1167523867 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 192710 + 150 bytes |
| [n1391](../Objects.level.bin对象实现清单.html#SunsetRace%3An1391) | BstNode_1167523862 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 285205 + 150 bytes |
| [n1433](../Objects.level.bin对象实现清单.html#SunsetRace%3An1433) | BstNode_1167523908 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 293182 + 150 bytes |
