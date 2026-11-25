# ChangeLevelWithFade 单独类功能实现清单

功能分类：地图加载、出生与检查点。

此类职责：**带淡入淡出的地图切换**。

类清单进度 30%（3/10），28 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：ChangeLevelWithFade 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 带淡入淡出的地图切换：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
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

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=ChangeLevelWithFade) · [原字段、进度与全部实例 JSON](ChangeLevelWithFade.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n8](../Objects.level.bin对象实现清单.html#CandleSpace%3An8) | BstNode_3156082711 | 20%（2/10），运行待验 | 0 / 1 | CandleSpace · 25307 + 47 bytes |
| [n27](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An27) | BstNode_2529558609 | 20%（2/10），运行待验 | 0 / 2 | CandleSpaceEnd · 21260 + 44 bytes |
| [n241](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An241) | BstNode_2529558705 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 62519 + 44 bytes |
| [n461](../Objects.level.bin对象实现清单.html#Dawn%3An461) | BstNode_2529558567 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 103331 + 51 bytes |
| [n617](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An617) | BstNode_424 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 167369 + 38 bytes |
| [n718](../Objects.level.bin对象实现清单.html#DuskMid%3An718) | BstNode_424 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 153929 + 38 bytes |
| [n1022](../Objects.level.bin对象实现清单.html#DuskMid%3An1022) | BstNode_168 | 20%（2/10），运行待验 | 0 / 1 | DuskMid · 216794 + 46 bytes |
| [n1273](../Objects.level.bin对象实现清单.html#Night%3An1273) | BstNode_34604353 | 20%（2/10），运行待验 | 0 / 1 | Night · 209782 + 46 bytes |
| [n289](../Objects.level.bin对象实现清单.html#NightEnd%3An289) | BstNode_1167523841 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 68673 + 47 bytes |
| [n346](../Objects.level.bin对象实现清单.html#NightEnd%3An346) | BstNode_34603072 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 77802 + 45 bytes |
| [n555](../Objects.level.bin对象实现清单.html#NightEnd%3An555) | BstNode_222 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 113245 + 39 bytes |
| [n228](../Objects.level.bin对象实现清单.html#NightEntrance%3An228) | BstNode_302 | 20%（2/10），运行待验 | 0 / 1 | NightEntrance · 50528 + 38 bytes |
| [n488](../Objects.level.bin对象实现清单.html#NightEntrance%3An488) | BstNode_424 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 89995 + 38 bytes |
| [n1184](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1184) | BstNode_1293287696 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 297865 + 50 bytes |
| [n575](../Objects.level.bin对象实现清单.html#RainMid%3An575) | BstNode_778 | 20%（2/10），运行待验 | 0 / 1 | RainMid · 133621 + 40 bytes |
| [n153](../Objects.level.bin对象实现清单.html#SkyHub2%3An153) | BstNode_1167523883 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 61705 + 45 bytes |
| [n338](../Objects.level.bin对象实现清单.html#SkyHub2%3An338) | BstNode_2446917703 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 97831 + 45 bytes |
| [n663](../Objects.level.bin对象实现清单.html#SkyHub2%3An663) | BstNode_2446917704 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 155887 + 45 bytes |
| [n1263](../Objects.level.bin对象实现清单.html#SkyHub2%3An1263) | BstNode_2446917702 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 261700 + 44 bytes |
| [n1692](../Objects.level.bin对象实现清单.html#SkyHub2%3An1692) | BstNode_2529558772 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 322577 + 49 bytes |
| [n1757](../Objects.level.bin对象实现清单.html#SkyHub2%3An1757) | BstNode_2529558771 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 332420 + 44 bytes |
| [n1764](../Objects.level.bin对象实现清单.html#SkyHub2%3An1764) | BstNode_2529558775 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 333779 + 46 bytes |
| [n1854](../Objects.level.bin对象实现清单.html#SkyHub2%3An1854) | BstNode_2529558774 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 350075 + 44 bytes |
| [n2234](../Objects.level.bin对象实现清单.html#SkyHub2%3An2234) | BstNode_1167524141 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 421397 + 45 bytes |
| [n491](../Objects.level.bin对象实现清单.html#Storm%3An491) | BstNode_2529559022 | 20%（2/10），运行待验 | 0 / 1 | Storm · 111125 + 48 bytes |
| [n479](../Objects.level.bin对象实现清单.html#StormEnd%3An479) | BstNode_2529559368 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 108820 + 54 bytes |
| [n501](../Objects.level.bin对象实现清单.html#StormEnd%3An501) | BstNode_2529558654 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 112926 + 54 bytes |
| [n978](../Objects.level.bin对象实现清单.html#SunsetRace%3An978) | BstNode_1049165981 | 20%（2/10），运行待验 | 0 / 1 | SunsetRace · 207204 + 52 bytes |
