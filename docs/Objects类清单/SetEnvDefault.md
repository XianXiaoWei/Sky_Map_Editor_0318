# SetEnvDefault 单独类功能实现清单

功能分类：云、风场与环境。

此类职责：**设置默认环境参数**。

类清单进度 40%（4/10），29 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：SetEnvDefault 的原默认值、继承初始化及 38 个序列化字段变体；原注册字段 37 项。
- [ ] 设置默认环境参数（部分完成）：公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 37 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetEnvDefault) · [原字段、进度与全部实例 JSON](SetEnvDefault.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n413](../Objects.level.bin对象实现清单.html#CandleSpace%3An413) | BstNode_2446917640 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 84987 + 325 bytes |
| [n153](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An153) | BstNode_2446917640 | 20%（2/10），运行待验 | 0 / 0 | CandleSpaceEnd · 38336 + 301 bytes |
| [n187](../Objects.level.bin对象实现清单.html#Dawn%3An187) | BstNode_3122856965 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 62122 + 325 bytes |
| [n833](../Objects.level.bin对象实现清单.html#Dawn%3An833) | BstNode_2 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 165792 + 316 bytes |
| [n862](../Objects.level.bin对象实现清单.html#DayEnd%3An862) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 186164 + 316 bytes |
| [n574](../Objects.level.bin对象实现清单.html#DayHubCave%3An574) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | DayHubCave · 133824 + 292 bytes |
| [n844](../Objects.level.bin对象实现清单.html#Dusk%3An844) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 176672 + 316 bytes |
| [n1653](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1653) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 409211 + 284 bytes |
| [n1053](../Objects.level.bin对象实现清单.html#DuskMid%3An1053) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 220963 + 292 bytes |
| [n1035](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1035) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 250545 + 292 bytes |
| [n749](../Objects.level.bin对象实现清单.html#HubReveal%3An749) | BstNode_5270 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 155341 + 319 bytes |
| [n2101](../Objects.level.bin对象实现清单.html#Night%3An2101) | BstNode_34603505 | 20%（2/10），运行待验 | 0 / 0 | Night · 333743 + 198 bytes |
| [n405](../Objects.level.bin对象实现清单.html#NightEnd%3An405) | BstNode_34603091 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 89403 + 299 bytes |
| [n50](../Objects.level.bin对象实现清单.html#NightEntrance%3An50) | BstNode_2345992268 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 23126 + 200 bytes |
| [n792](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An792) | BstNode_5270 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 179330 + 319 bytes |
| [n177](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An177) | BstNode_5270 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 62920 + 319 bytes |
| [n1701](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1701) | BstNode_5270 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 301730 + 319 bytes |
| [n598](../Objects.level.bin对象实现清单.html#Rain%3An598) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | Rain · 164481 + 292 bytes |
| [n521](../Objects.level.bin对象实现清单.html#RainEnd%3An521) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 155448 + 316 bytes |
| [n965](../Objects.level.bin对象实现清单.html#RainForest%3An965) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 222459 + 292 bytes |
| [n2116](../Objects.level.bin对象实现清单.html#RainMid%3An2116) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 409524 + 316 bytes |
| [n751](../Objects.level.bin对象实现清单.html#SkyHub2%3An751) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 169866 + 316 bytes |
| [n1330](../Objects.level.bin对象实现清单.html#Storm%3An1330) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | Storm · 258235 + 191 bytes |
| [n827](../Objects.level.bin对象实现清单.html#StormEnd%3An827) | BstNode_2 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 159443 + 316 bytes |
| [n1500](../Objects.level.bin对象实现清单.html#Sunset%3An1500) | BstNode_1 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 278708 + 316 bytes |
| [n550](../Objects.level.bin对象实现清单.html#SunsetEnd%3An550) | BstNode_3 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 120094 + 316 bytes |
| [n537](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An537) | BstNode_3 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 137647 + 316 bytes |
| [n1361](../Objects.level.bin对象实现清单.html#SunsetRace%3An1361) | BstNode_1 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 278100 + 316 bytes |
| [n117](../Objects.level.bin对象实现清单.html#TitleWater%3An117) | BstNode_42 | 20%（2/10），运行待验 | 0 / 0 | TitleWater · 31592 + 317 bytes |
