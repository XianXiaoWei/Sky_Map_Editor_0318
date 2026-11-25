# CandleGate 单独类功能实现清单

功能分类：收集物、蜡烛与解锁。

此类职责：**蜡烛放置与门控事件**。

类清单进度 30%（3/10），23 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：CandleGate 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 蜡烛放置与门控事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（42 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=CandleGate) · [原字段、进度与全部实例 JSON](CandleGate.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n382](../Objects.level.bin对象实现清单.html#CandleSpace%3An382) | BstNode_2529558726 | 20%（2/10），运行待验 | 1 / 2 | CandleSpace · 80154 + 45 bytes |
| [n1965](../Objects.level.bin对象实现清单.html#Dawn%3An1965) | BstNode_3122856752 | 20%（2/10），运行待验 | 2 / 3 | Dawn · 322025 + 45 bytes |
| [n1051](../Objects.level.bin对象实现清单.html#DayEnd%3An1051) | BstNode_2446917698 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 220887 + 45 bytes |
| [n1173](../Objects.level.bin对象实现清单.html#DayEnd%3An1173) | BstNode_2446917712 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 242586 + 45 bytes |
| [n761](../Objects.level.bin对象实现清单.html#Dusk%3An761) | BstNode_34603729 | 20%（2/10），运行待验 | 1 / 1 | Dusk · 161000 + 43 bytes |
| [n1142](../Objects.level.bin对象实现清单.html#Dusk%3An1142) | BstNode_2446917746 | 20%（2/10），运行待验 | 2 / 1 | Dusk · 233605 + 45 bytes |
| [n538](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An538) | BstNode_34603864 | 20%（2/10），运行待验 | 1 / 1 | DuskGraveyard · 150102 + 43 bytes |
| [n1488](../Objects.level.bin对象实现清单.html#HubReveal%3An1488) | BstNode_2446917746 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 278610 + 45 bytes |
| [n400](../Objects.level.bin对象实现清单.html#Night%3An400) | BstNode_34604461 | 20%（2/10），运行待验 | 2 / 1 | Night · 82590 + 43 bytes |
| [n1204](../Objects.level.bin对象实现清单.html#Night%3An1204) | BstNode_2446917746 | 20%（2/10），运行待验 | 2 / 1 | Night · 200138 + 45 bytes |
| [n281](../Objects.level.bin对象实现清单.html#Prairie_Village%3An281) | BstNode_1167524004 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 75404 + 45 bytes |
| [n508](../Objects.level.bin对象实现清单.html#Prairie_Village%3An508) | BstNode_1482555546 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 114275 + 45 bytes |
| [n827](../Objects.level.bin对象实现清单.html#Prairie_Village%3An827) | BstNode_1167523927 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 165744 + 45 bytes |
| [n1776](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1776) | BstNode_1482555532 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 317016 + 45 bytes |
| [n2537](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2537) | BstNode_1167523990 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 431790 + 45 bytes |
| [n2841](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2841) | BstNode_2345992498 | 20%（2/10），运行待验 | 2 / 1 | Prairie_Village · 482450 + 45 bytes |
| [n2986](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2986) | BstNode_1167523947 | 20%（2/10），运行待验 | 2 / 0 | Prairie_Village · 507787 + 45 bytes |
| [n1036](../Objects.level.bin对象实现清单.html#RainForest%3An1036) | BstNode_2446917746 | 20%（2/10），运行待验 | 2 / 1 | RainForest · 236222 + 45 bytes |
| [n1935](../Objects.level.bin对象实现清单.html#RainMid%3An1935) | BstNode_34603113 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 376002 + 43 bytes |
| [n1133](../Objects.level.bin对象实现清单.html#SkyHub2%3An1133) | BstNode_3156082704 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 239756 + 45 bytes |
| [n831](../Objects.level.bin对象实现清单.html#Sunset%3An831) | BstNode_2446917746 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 173799 + 45 bytes |
| [n923](../Objects.level.bin对象实现清单.html#Sunset%3An923) | BstNode_2446917755 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 187326 + 45 bytes |
| [n1360](../Objects.level.bin对象实现清单.html#Sunset%3An1360) | BstNode_34603026 | 20%（2/10），运行待验 | 1 / 1 | Sunset · 255717 + 43 bytes |
