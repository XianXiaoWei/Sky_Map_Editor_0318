# IfInRegion 单独类功能实现清单

功能分类：区域、喊叫与空间触发。

此类职责：**区域内或区域外条件触发**。

类清单进度 30%（3/10），30 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：IfInRegion 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 区域内或区域外条件触发：节点与引用已清点；原区域条件、Marker/Clump 消费和分支执行待恢复。
- [ ] 依赖调用与事件：Clump（60 条引用）
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

节点与引用已清点；原区域条件、Marker/Clump 消费和分支执行待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=IfInRegion) · [原字段、进度与全部实例 JSON](IfInRegion.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n875](../Objects.level.bin对象实现清单.html#Dawn%3An875) | BstNode_1293287802 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 172029 + 35 bytes |
| [n1013](../Objects.level.bin对象实现清单.html#Dawn%3An1013) | BstNode_2446917734 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 190774 + 35 bytes |
| [n1502](../Objects.level.bin对象实现清单.html#Dawn%3An1502) | BstNode_2446917733 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 263901 + 35 bytes |
| [n2577](../Objects.level.bin对象实现清单.html#Dawn%3An2577) | BstNode_1293287803 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 429943 + 35 bytes |
| [n434](../Objects.level.bin对象实现清单.html#DayHubCave%3An434) | BstNode_3156082790 | 20%（2/10），运行待验 | 2 / 1 | DayHubCave · 103947 + 35 bytes |
| [n232](../Objects.level.bin对象实现清单.html#Dusk%3An232) | BstNode_34603725 | 20%（2/10），运行待验 | 2 / 2 | Dusk · 67157 + 33 bytes |
| [n820](../Objects.level.bin对象实现清单.html#Dusk%3An820) | BstNode_34603736 | 20%（2/10），运行待验 | 2 / 2 | Dusk · 172483 + 33 bytes |
| [n1123](../Objects.level.bin对象实现清单.html#Dusk%3An1123) | BstNode_34603728 | 20%（2/10），运行待验 | 2 / 2 | Dusk · 229705 + 33 bytes |
| [n141](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An141) | BstNode_34603846 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 58296 + 33 bytes |
| [n317](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An317) | BstNode_34603839 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 100794 + 33 bytes |
| [n577](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An577) | BstNode_34603836 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 157787 + 33 bytes |
| [n680](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An680) | BstNode_34603849 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 181396 + 33 bytes |
| [n1409](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1409) | BstNode_34603845 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 347038 + 33 bytes |
| [n265](../Objects.level.bin对象实现清单.html#HubReveal%3An265) | BstNode_2446917942 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 73819 + 35 bytes |
| [n759](../Objects.level.bin对象实现清单.html#HubReveal%3An759) | BstNode_3156082771 | 20%（2/10），运行待验 | 2 / 2 | HubReveal · 157109 + 35 bytes |
| [n1292](../Objects.level.bin对象实现清单.html#HubReveal%3An1292) | BstNode_2446917772 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 248706 + 35 bytes |
| [n699](../Objects.level.bin对象实现清单.html#Night%3An699) | BstNode_2783838245 | 20%（2/10），运行待验 | 2 / 2 | Night · 126603 + 35 bytes |
| [n1360](../Objects.level.bin对象实现清单.html#Night%3An1360) | BstNode_34603298 | 20%（2/10），运行待验 | 2 / 1 | Night · 222339 + 33 bytes |
| [n1599](../Objects.level.bin对象实现清单.html#Night%3An1599) | BstNode_34603301 | 20%（2/10），运行待验 | 2 / 1 | Night · 251689 + 33 bytes |
| [n140](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An140) | BstNode_2783838234 | 20%（2/10），运行待验 | 2 / 3 | Prairie_ButterflyFields · 52665 + 35 bytes |
| [n1296](../Objects.level.bin对象实现清单.html#Rain%3An1296) | BstNode_34603088 | 20%（2/10），运行待验 | 2 / 2 | Rain · 317681 + 33 bytes |
| [n705](../Objects.level.bin对象实现清单.html#RainMid%3An705) | BstNode_2783838360 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 160039 + 35 bytes |
| [n1230](../Objects.level.bin对象实现清单.html#RainMid%3An1230) | BstNode_2783838361 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 252569 + 35 bytes |
| [n1792](../Objects.level.bin对象实现清单.html#RainMid%3An1792) | BstNode_2783838359 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 354796 + 35 bytes |
| [n713](../Objects.level.bin对象实现清单.html#SkyHub2%3An713) | BstNode_1167524055 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 164429 + 35 bytes |
| [n1538](../Objects.level.bin对象实现清单.html#SkyHub2%3An1538) | BstNode_1167523903 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 296383 + 35 bytes |
| [n1924](../Objects.level.bin对象实现清单.html#SkyHub2%3An1924) | BstNode_1167524149 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 365654 + 35 bytes |
| [n188](../Objects.level.bin对象实现清单.html#Sunset%3An188) | BstNode_34603019 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 59715 + 33 bytes |
| [n1345](../Objects.level.bin对象实现清单.html#Sunset%3An1345) | BstNode_34603043 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 254388 + 33 bytes |
| [n1352](../Objects.level.bin对象实现清单.html#Sunset%3An1352) | BstNode_34603071 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 254934 + 33 bytes |
