# SetTutorialMode 单独类功能实现清单

功能分类：教程、平台门控与统计。

此类职责：**教程状态设置**。

类清单进度 30%（3/10），24 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SetTutorialMode 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 教程状态设置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetTutorialMode) · [原字段、进度与全部实例 JSON](SetTutorialMode.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n13](../Objects.level.bin对象实现清单.html#CandleSpace%3An13) | BstNode_2645622814 | 20%（2/10），运行待验 | 0 / 1 | CandleSpace · 25534 + 28 bytes |
| [n111](../Objects.level.bin对象实现清单.html#CandleSpace%3An111) | BstNode_2529558723 | 20%（2/10），运行待验 | 0 / 1 | CandleSpace · 37588 + 28 bytes |
| [n429](../Objects.level.bin对象实现清单.html#CandleSpace%3An429) | BstNode_2529558725 | 20%（2/10），运行待验 | 0 / 1 | CandleSpace · 86918 + 28 bytes |
| [n465](../Objects.level.bin对象实现清单.html#CandleSpace%3An465) | BstNode_2645622812 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 90129 + 28 bytes |
| [n656](../Objects.level.bin对象实现清单.html#Dawn%3An656) | BstNode_2645622793 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 136121 + 28 bytes |
| [n766](../Objects.level.bin对象实现清单.html#Dawn%3An766) | BstNode_2645622794 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 155251 + 28 bytes |
| [n916](../Objects.level.bin对象实现清单.html#Dawn%3An916) | BstNode_2279670026 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 177140 + 28 bytes |
| [n1241](../Objects.level.bin对象实现清单.html#Dawn%3An1241) | BstNode_2645622798 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 222162 + 28 bytes |
| [n1622](../Objects.level.bin对象实现清单.html#Dawn%3An1622) | BstNode_2645622827 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 278159 + 28 bytes |
| [n2263](../Objects.level.bin对象实现清单.html#Dawn%3An2263) | BstNode_2645622828 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 374330 + 28 bytes |
| [n2267](../Objects.level.bin对象实现清单.html#Dawn%3An2267) | BstNode_2645622808 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 374955 + 28 bytes |
| [n2705](../Objects.level.bin对象实现清单.html#Dawn%3An2705) | BstNode_2645622836 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 448640 + 28 bytes |
| [n447](../Objects.level.bin对象实现清单.html#HubReveal%3An447) | BstNode_2645622794 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 106292 + 28 bytes |
| [n528](../Objects.level.bin对象实现清单.html#HubReveal%3An528) | BstNode_2446917636 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 120099 + 28 bytes |
| [n873](../Objects.level.bin对象实现清单.html#HubReveal%3An873) | BstNode_2529558701 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 175705 + 28 bytes |
| [n893](../Objects.level.bin对象实现清单.html#HubReveal%3An893) | BstNode_2645622803 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 179089 + 28 bytes |
| [n1219](../Objects.level.bin对象实现清单.html#HubReveal%3An1219) | BstNode_2645622795 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 236585 + 28 bytes |
| [n1229](../Objects.level.bin对象实现清单.html#HubReveal%3An1229) | BstNode_2645622796 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 238690 + 28 bytes |
| [n1492](../Objects.level.bin对象实现清单.html#HubReveal%3An1492) | BstNode_2645622798 | 20%（2/10），运行待验 | 0 / 2 | HubReveal · 279126 + 28 bytes |
| [n757](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An757) | BstNode_2645622795 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 200340 + 28 bytes |
| [n305](../Objects.level.bin对象实现清单.html#SkyHub2%3An305) | BstNode_1167523949 | 20%（2/10），运行待验 | 0 / 2 | SkyHub2 · 91163 + 28 bytes |
| [n1315](../Objects.level.bin对象实现清单.html#SkyHub2%3An1315) | BstNode_1167524370 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 267631 + 28 bytes |
| [n1327](../Objects.level.bin对象实现清单.html#SkyHub2%3An1327) | BstNode_1167524466 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 269435 + 28 bytes |
| [n173](../Objects.level.bin对象实现清单.html#TitleWater%3An173) | BstNode_2645622791 | 20%（2/10），运行待验 | 0 / 0 | TitleWater · 40572 + 28 bytes |
