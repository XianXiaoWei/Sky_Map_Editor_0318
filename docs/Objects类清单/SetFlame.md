# SetFlame 单独类功能实现清单

功能分类：收集物、蜡烛与解锁。

此类职责：**火焰集合点燃状态与计时**。

类清单进度 40%（4/10），43 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：SetFlame 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 火焰集合点燃状态与计时（部分完成）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 依赖调用与事件：Clump（43 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetFlame) · [原字段、进度与全部实例 JSON](SetFlame.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n315](../Objects.level.bin对象实现清单.html#CandleSpace%3An315) | BstNode_2446917739 | 20%（2/10），运行待验 | 1 / 2 | CandleSpace · 69721 + 37 bytes |
| [n2345](../Objects.level.bin对象实现清单.html#Dawn%3An2345) | BstNode_206 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 389662 + 30 bytes |
| [n2687](../Objects.level.bin对象实现清单.html#Dawn%3An2687) | BstNode_816 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 445289 + 30 bytes |
| [n2882](../Objects.level.bin对象实现清单.html#Dawn%3An2882) | BstNode_909 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 472951 + 30 bytes |
| [n38](../Objects.level.bin对象实现清单.html#DayEnd%3An38) | BstNode_841 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 29479 + 30 bytes |
| [n940](../Objects.level.bin对象实现清单.html#DayEnd%3An940) | BstNode_455 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 201429 + 30 bytes |
| [n1105](../Objects.level.bin对象实现清单.html#DayEnd%3An1105) | BstNode_840 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 229867 + 30 bytes |
| [n1161](../Objects.level.bin对象实现清单.html#DayEnd%3An1161) | BstNode_838 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 239694 + 30 bytes |
| [n1164](../Objects.level.bin对象实现清单.html#DayEnd%3An1164) | BstNode_839 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 240238 + 30 bytes |
| [n1507](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1507) | BstNode_34603842 | 20%（2/10），运行待验 | 1 / 2 | DuskGraveyard · 373293 + 35 bytes |
| [n44](../Objects.level.bin对象实现清单.html#Night%3An44) | BstNode_34603363 | 20%（2/10），运行待验 | 1 / 2 | Night · 30212 + 35 bytes |
| [n100](../Objects.level.bin对象实现清单.html#Night%3An100) | BstNode_34604445 | 20%（2/10），运行待验 | 1 / 1 | Night · 36964 + 35 bytes |
| [n204](../Objects.level.bin对象实现清单.html#Night%3An204) | BstNode_34603358 | 20%（2/10），运行待验 | 1 / 2 | Night · 53460 + 35 bytes |
| [n377](../Objects.level.bin对象实现清单.html#Night%3An377) | BstNode_34603359 | 20%（2/10），运行待验 | 1 / 2 | Night · 79422 + 35 bytes |
| [n961](../Objects.level.bin对象实现清单.html#Night%3An961) | BstNode_34603364 | 20%（2/10），运行待验 | 1 / 2 | Night · 167313 + 35 bytes |
| [n1048](../Objects.level.bin对象实现清单.html#Night%3An1048) | BstNode_34604443 | 20%（2/10），运行待验 | 1 / 1 | Night · 178702 + 35 bytes |
| [n1145](../Objects.level.bin对象实现清单.html#Night%3An1145) | BstNode_34603361 | 20%（2/10），运行待验 | 1 / 2 | Night · 192599 + 35 bytes |
| [n1373](../Objects.level.bin对象实现清单.html#Night%3An1373) | BstNode_34603362 | 20%（2/10），运行待验 | 1 / 2 | Night · 224178 + 35 bytes |
| [n1515](../Objects.level.bin对象实现清单.html#Night%3An1515) | BstNode_34603356 | 20%（2/10），运行待验 | 1 / 2 | Night · 240324 + 35 bytes |
| [n2232](../Objects.level.bin对象实现清单.html#Night%3An2232) | BstNode_34604553 | 20%（2/10），运行待验 | 1 / 1 | Night · 352152 + 35 bytes |
| [n2343](../Objects.level.bin对象实现清单.html#Night%3An2343) | BstNode_34603360 | 20%（2/10），运行待验 | 1 / 2 | Night · 368170 + 35 bytes |
| [n2633](../Objects.level.bin对象实现清单.html#Night%3An2633) | BstNode_34603357 | 20%（2/10），运行待验 | 1 / 2 | Night · 410646 + 35 bytes |
| [n2822](../Objects.level.bin对象实现清单.html#Night%3An2822) | BstNode_34603345 | 20%（2/10），运行待验 | 1 / 2 | Night · 438309 + 35 bytes |
| [n3006](../Objects.level.bin对象实现清单.html#Night%3An3006) | BstNode_34603352 | 20%（2/10），运行待验 | 1 / 2 | Night · 467487 + 35 bytes |
| [n12](../Objects.level.bin对象实现清单.html#Prairie_Village%3An12) | BstNode_34603053 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 33036 + 35 bytes |
| [n601](../Objects.level.bin对象实现清单.html#Prairie_Village%3An601) | BstNode_1167523922 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 126831 + 37 bytes |
| [n1015](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1015) | BstNode_34603150 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 198085 + 35 bytes |
| [n1130](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1130) | BstNode_34604443 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 215540 + 35 bytes |
| [n2228](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2228) | BstNode_34603141 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 387152 + 35 bytes |
| [n1159](../Objects.level.bin对象实现清单.html#Rain%3An1159) | BstNode_2345992317 | 20%（2/10），运行待验 | 1 / 1 | Rain · 291225 + 37 bytes |
| [n1312](../Objects.level.bin对象实现清单.html#Rain%3An1312) | BstNode_2345992986 | 20%（2/10），运行待验 | 1 / 1 | Rain · 321126 + 37 bytes |
| [n1364](../Objects.level.bin对象实现清单.html#Rain%3An1364) | BstNode_1417 | 20%（2/10），运行待验 | 1 / 2 | Rain · 331658 + 31 bytes |
| [n1412](../Objects.level.bin对象实现清单.html#Rain%3An1412) | BstNode_2345992979 | 20%（2/10），运行待验 | 1 / 2 | Rain · 343278 + 37 bytes |
| [n1767](../Objects.level.bin对象实现清单.html#Rain%3An1767) | BstNode_2345992319 | 20%（2/10），运行待验 | 1 / 1 | Rain · 425866 + 37 bytes |
| [n31](../Objects.level.bin对象实现清单.html#RainEnd%3An31) | BstNode_840696218 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 35577 + 36 bytes |
| [n730](../Objects.level.bin对象实现清单.html#RainEnd%3An730) | BstNode_2345992824 | 20%（2/10），运行待验 | 1 / 1 | RainEnd · 205811 + 37 bytes |
| [n1244](../Objects.level.bin对象实现清单.html#RainEnd%3An1244) | BstNode_488 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 327039 + 30 bytes |
| [n1380](../Objects.level.bin对象实现清单.html#RainEnd%3An1380) | BstNode_34603024 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 361528 + 35 bytes |
| [n788](../Objects.level.bin对象实现清单.html#RainForest%3An788) | BstNode_2345992986 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 181435 + 37 bytes |
| [n272](../Objects.level.bin对象实现清单.html#RainMid%3An272) | BstNode_2345992707 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 79472 + 37 bytes |
| [n676](../Objects.level.bin对象实现清单.html#RainMid%3An676) | BstNode_2345992955 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 154183 + 37 bytes |
| [n1910](../Objects.level.bin对象实现清单.html#RainMid%3An1910) | BstNode_2345993093 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 372009 + 37 bytes |
| [n2033](../Objects.level.bin对象实现清单.html#RainMid%3An2033) | BstNode_34603483 | 20%（2/10），运行待验 | 1 / 2 | RainMid · 390906 + 35 bytes |
