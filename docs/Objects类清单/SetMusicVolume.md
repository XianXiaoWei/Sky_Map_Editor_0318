# SetMusicVolume 单独类功能实现清单

功能分类：声音、音乐与混音。

此类职责：**音乐音量过渡**。

类清单进度 30%（3/10），52 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SetMusicVolume 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 音乐音量过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetMusicVolume) · [原字段、进度与全部实例 JSON](SetMusicVolume.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n283](../Objects.level.bin对象实现清单.html#CandleSpace%3An283) | BstNode_1462 | 20%（2/10），运行待验 | 0 / 2 | CandleSpace · 64348 + 26 bytes |
| [n756](../Objects.level.bin对象实现清单.html#Dawn%3An756) | BstNode_1293287655 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 153676 + 32 bytes |
| [n918](../Objects.level.bin对象实现清单.html#Dawn%3An918) | BstNode_3122856361 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 177213 + 32 bytes |
| [n1249](../Objects.level.bin对象实现清单.html#Dawn%3An1249) | BstNode_3122856358 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 223687 + 32 bytes |
| [n1867](../Objects.level.bin对象实现清单.html#Dawn%3An1867) | BstNode_1293287450 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 310330 + 32 bytes |
| [n2444](../Objects.level.bin对象实现清单.html#Dawn%3An2444) | BstNode_3122856355 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 405967 + 32 bytes |
| [n2561](../Objects.level.bin对象实现清单.html#Dawn%3An2561) | BstNode_3122856360 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 427739 + 32 bytes |
| [n51](../Objects.level.bin对象实现清单.html#DayHubCave%3An51) | BstNode_1700134950 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 31030 + 32 bytes |
| [n577](../Objects.level.bin对象实现清单.html#DayHubCave%3An577) | BstNode_1700134949 | 20%（2/10），运行待验 | 0 / 1 | DayHubCave · 134243 + 32 bytes |
| [n426](../Objects.level.bin对象实现清单.html#DuskMid%3An426) | BstNode_1700135135 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 94451 + 32 bytes |
| [n1080](../Objects.level.bin对象实现清单.html#DuskMid%3An1080) | BstNode_1700135134 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 225650 + 32 bytes |
| [n60](../Objects.level.bin对象实现清单.html#HubReveal%3An60) | BstNode_1700134916 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 39015 + 32 bytes |
| [n314](../Objects.level.bin对象实现清单.html#HubReveal%3An314) | BstNode_1700134920 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 83631 + 32 bytes |
| [n712](../Objects.level.bin对象实现清单.html#HubReveal%3An712) | BstNode_1700134917 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 148385 + 32 bytes |
| [n783](../Objects.level.bin对象实现清单.html#HubReveal%3An783) | BstNode_1700134921 | 20%（2/10），运行待验 | 0 / 1 | HubReveal · 160518 + 32 bytes |
| [n551](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An551) | BstNode_1700134958 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 151170 + 32 bytes |
| [n822](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An822) | BstNode_1700134957 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Cave · 214915 + 32 bytes |
| [n1427](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1427) | BstNode_3122855968 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Village · 260488 + 32 bytes |
| [n837](../Objects.level.bin对象实现清单.html#Rain%3An837) | BstNode_1700135136 | 20%（2/10），运行待验 | 0 / 2 | Rain · 218322 + 32 bytes |
| [n1072](../Objects.level.bin对象实现清单.html#Rain%3An1072) | BstNode_1700135138 | 20%（2/10），运行待验 | 0 / 1 | Rain · 270925 + 32 bytes |
| [n1435](../Objects.level.bin对象实现清单.html#RainEnd%3An1435) | BstNode_1700134919 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 373732 + 32 bytes |
| [n1571](../Objects.level.bin对象实现清单.html#RainEnd%3An1571) | BstNode_1700134920 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 398929 + 32 bytes |
| [n279](../Objects.level.bin对象实现清单.html#RainForest%3An279) | BstNode_34603147 | 20%（2/10），运行待验 | 0 / 2 | RainForest · 75511 + 30 bytes |
| [n525](../Objects.level.bin对象实现清单.html#RainForest%3An525) | BstNode_1700135135 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 120907 + 32 bytes |
| [n1079](../Objects.level.bin对象实现清单.html#RainForest%3An1079) | BstNode_1700135142 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 242912 + 32 bytes |
| [n1122](../Objects.level.bin对象实现清单.html#RainForest%3An1122) | BstNode_1700135141 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 252215 + 32 bytes |
| [n1165](../Objects.level.bin对象实现清单.html#RainForest%3An1165) | BstNode_34603149 | 20%（2/10），运行待验 | 0 / 2 | RainForest · 260058 + 30 bytes |
| [n1206](../Objects.level.bin对象实现清单.html#RainForest%3An1206) | BstNode_1700135134 | 20%（2/10），运行待验 | 0 / 1 | RainForest · 266536 + 32 bytes |
| [n50](../Objects.level.bin对象实现清单.html#RainMid%3An50) | BstNode_1700135081 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 35964 + 32 bytes |
| [n909](../Objects.level.bin对象实现清单.html#RainMid%3An909) | BstNode_1700135074 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 194376 + 32 bytes |
| [n1467](../Objects.level.bin对象实现清单.html#RainMid%3An1467) | BstNode_1700135082 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 293596 + 32 bytes |
| [n1541](../Objects.level.bin对象实现清单.html#RainMid%3An1541) | BstNode_1700135070 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 308348 + 32 bytes |
| [n1589](../Objects.level.bin对象实现清单.html#RainMid%3An1589) | BstNode_1700135079 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 319338 + 32 bytes |
| [n1942](../Objects.level.bin对象实现清单.html#RainMid%3An1942) | BstNode_1700135075 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 377815 + 32 bytes |
| [n2112](../Objects.level.bin对象实现清单.html#RainMid%3An2112) | BstNode_1700135078 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 408163 + 32 bytes |
| [n2141](../Objects.level.bin对象实现清单.html#RainMid%3An2141) | BstNode_1700135071 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 414604 + 32 bytes |
| [n642](../Objects.level.bin对象实现清单.html#SkyHub2%3An642) | BstNode_1700134968 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 152477 + 32 bytes |
| [n1173](../Objects.level.bin对象实现清单.html#SkyHub2%3An1173) | BstNode_1700134966 | 20%（2/10），运行待验 | 0 / 3 | SkyHub2 · 245922 + 32 bytes |
| [n656](../Objects.level.bin对象实现清单.html#Sunset%3An656) | BstNode_1167524225 | 20%（2/10），运行待验 | 0 / 2 | Sunset · 144798 + 32 bytes |
| [n851](../Objects.level.bin对象实现清单.html#Sunset%3An851) | BstNode_1700135135 | 20%（2/10），运行待验 | 0 / 3 | Sunset · 176423 + 32 bytes |
| [n1057](../Objects.level.bin对象实现清单.html#Sunset%3An1057) | BstNode_1167524234 | 20%（2/10），运行待验 | 0 / 2 | Sunset · 207444 + 32 bytes |
| [n1725](../Objects.level.bin对象实现清单.html#Sunset%3An1725) | BstNode_1700135134 | 20%（2/10），运行待验 | 0 / 3 | Sunset · 317031 + 32 bytes |
| [n233](../Objects.level.bin对象实现清单.html#SunsetEnd%3An233) | BstNode_1700134931 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 71973 + 32 bytes |
| [n617](../Objects.level.bin对象实现清单.html#SunsetEnd%3An617) | BstNode_1700134930 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 129982 + 32 bytes |
| [n837](../Objects.level.bin对象实现清单.html#SunsetEnd%3An837) | BstNode_1167524247 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 166482 + 32 bytes |
| [n909](../Objects.level.bin对象实现清单.html#SunsetEnd%3An909) | BstNode_1700135135 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 176481 + 32 bytes |
| [n992](../Objects.level.bin对象实现清单.html#SunsetEnd%3An992) | BstNode_1700134926 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 190787 + 32 bytes |
| [n1112](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1112) | BstNode_1700134927 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 210322 + 32 bytes |
| [n1120](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1120) | BstNode_1167524210 | 20%（2/10），运行待验 | 0 / 3 | SunsetEnd · 211333 + 32 bytes |
| [n1124](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1124) | BstNode_1700134918 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 211708 + 32 bytes |
| [n1514](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1514) | BstNode_1700134919 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 283676 + 32 bytes |
| [n1808](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1808) | BstNode_1700135134 | 20%（2/10），运行待验 | 0 / 2 | SunsetEnd · 341952 + 32 bytes |
