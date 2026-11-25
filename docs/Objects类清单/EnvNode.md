# EnvNode 单独类功能实现清单

功能分类：云、风场与环境。

此类职责：**空间环境参数与混合**。

类清单进度 40%（4/10），134 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：EnvNode 的原默认值、继承初始化及 47 个序列化字段变体；原注册字段 47 项。
- [ ] 空间环境参数与混合（部分完成）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 47 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [x] 明确范围的原核心子链已独立核验：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=EnvNode) · [原字段、进度与全部实例 JSON](EnvNode.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n213](../Objects.level.bin对象实现清单.html#CandleSpace%3An213) | BstNode_2753888259 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 51902 + 457 bytes |
| [n276](../Objects.level.bin对象实现清单.html#CandleSpace%3An276) | BstNode_1550 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 62433 + 451 bytes |
| [n198](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An198) | BstNode_757399670 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 49913 + 432 bytes |
| [n220](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An220) | BstNode_273 | 20%（2/10），运行待验 | 0 / 0 | CandleSpaceEnd · 56624 + 426 bytes |
| [n533](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An533) | BstNode_2345992193 | 20%（2/10），运行待验 | 0 / 1 | CandleSpaceEnd · 111009 + 433 bytes |
| [n93](../Objects.level.bin对象实现清单.html#CarryLand%3An93) | BstNode_2345992193 | 20%（2/10），运行待验 | 0 / 0 | CarryLand · 23083 + 433 bytes |
| [n98](../Objects.level.bin对象实现清单.html#CarryLand2%3An98) | BstNode_2345992193 | 20%（2/10），运行待验 | 0 / 0 | CarryLand2 · 29185 + 457 bytes |
| [n27](../Objects.level.bin对象实现清单.html#CarryLand3%3An27) | BstNode_2345992193 | 20%（2/10），运行待验 | 0 / 0 | CarryLand3 · 9009 + 457 bytes |
| [n458](../Objects.level.bin对象实现清单.html#Dawn%3An458) | BstNode_234 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 102418 + 450 bytes |
| [n563](../Objects.level.bin对象实现清单.html#Dawn%3An563) | BstNode_2279670086 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 119569 + 457 bytes |
| [n822](../Objects.level.bin对象实现清单.html#Dawn%3An822) | BstNode_2279669770 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 163260 + 457 bytes |
| [n1081](../Objects.level.bin对象实现清单.html#Dawn%3An1081) | BstNode_3122856085 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 198221 + 457 bytes |
| [n1230](../Objects.level.bin对象实现清单.html#Dawn%3An1230) | BstNode_811 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 219459 + 450 bytes |
| [n1330](../Objects.level.bin对象实现清单.html#Dawn%3An1330) | BstNode_3122856086 | 20%（2/10），运行待验 | 0 / 3 | Dawn · 238951 + 457 bytes |
| [n1703](../Objects.level.bin对象实现清单.html#Dawn%3An1703) | BstNode_3122856090 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 289732 + 457 bytes |
| [n2175](../Objects.level.bin对象实现清单.html#Dawn%3An2175) | BstNode_2279669821 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 358184 + 457 bytes |
| [n2693](../Objects.level.bin对象实现清单.html#Dawn%3An2693) | BstNode_2279669903 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 445760 + 457 bytes |
| [n2695](../Objects.level.bin对象实现清单.html#Dawn%3An2695) | BstNode_3122856063 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 446379 + 457 bytes |
| [n2717](../Objects.level.bin对象实现清单.html#Dawn%3An2717) | BstNode_683 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 450709 + 450 bytes |
| [n2735](../Objects.level.bin对象实现清单.html#Dawn%3An2735) | BstNode_3122856055 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 452318 + 457 bytes |
| [n75](../Objects.level.bin对象实现清单.html#DayEnd%3An75) | BstNode_714 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 37527 + 450 bytes |
| [n139](../Objects.level.bin对象实现清单.html#DayEnd%3An139) | BstNode_865 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 52674 + 450 bytes |
| [n254](../Objects.level.bin对象实现清单.html#DayEnd%3An254) | BstNode_840695885 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 73372 + 456 bytes |
| [n815](../Objects.level.bin对象实现清单.html#DayEnd%3An815) | BstNode_805 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 178328 + 450 bytes |
| [n1000](../Objects.level.bin对象实现清单.html#DayEnd%3An1000) | BstNode_542 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 211533 + 450 bytes |
| [n1036](../Objects.level.bin对象实现清单.html#DayEnd%3An1036) | BstNode_527 | 20%（2/10），运行待验 | 0 / 1 | DayEnd · 218565 + 450 bytes |
| [n1101](../Objects.level.bin对象实现清单.html#DayEnd%3An1101) | BstNode_669 | 20%（2/10），运行待验 | 0 / 0 | DayEnd · 228737 + 450 bytes |
| [n354](../Objects.level.bin对象实现清单.html#DayHubCave%3An354) | BstNode_790 | 20%（2/10），运行待验 | 0 / 0 | DayHubCave · 88222 + 426 bytes |
| [n551](../Objects.level.bin对象实现清单.html#DayHubCave%3An551) | BstNode_2345992672 | 20%（2/10），运行待验 | 0 / 0 | DayHubCave · 128516 + 433 bytes |
| [n155](../Objects.level.bin对象实现清单.html#Dusk%3An155) | BstNode_2345992259 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 51747 + 332 bytes |
| [n354](../Objects.level.bin对象实现清单.html#Dusk%3An354) | BstNode_2345992292 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 87934 + 332 bytes |
| [n438](../Objects.level.bin对象实现清单.html#Dusk%3An438) | BstNode_2345992605 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 104012 + 332 bytes |
| [n959](../Objects.level.bin对象实现清单.html#Dusk%3An959) | BstNode_228 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 195982 + 325 bytes |
| [n988](../Objects.level.bin对象实现清单.html#Dusk%3An988) | BstNode_2345992636 | 20%（2/10），运行待验 | 0 / 2 | Dusk · 202069 + 332 bytes |
| [n236](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An236) | BstNode_2345992504 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 78630 + 425 bytes |
| [n271](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An271) | BstNode_135 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 87202 + 418 bytes |
| [n301](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An301) | BstNode_2345992881 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 96343 + 425 bytes |
| [n350](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An350) | BstNode_145 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 108430 + 418 bytes |
| [n370](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An370) | BstNode_2279669771 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 112706 + 425 bytes |
| [n643](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An643) | BstNode_1049165829 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 172807 + 425 bytes |
| [n815](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An815) | BstNode_2279669945 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 212982 + 425 bytes |
| [n818](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An818) | BstNode_2279669946 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 213940 + 425 bytes |
| [n910](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An910) | BstNode_2279669841 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 234679 + 425 bytes |
| [n912](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An912) | BstNode_2279669782 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 235176 + 425 bytes |
| [n915](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An915) | BstNode_1049165831 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 235685 + 425 bytes |
| [n918](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An918) | BstNode_882 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 236475 + 418 bytes |
| [n1309](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1309) | BstNode_1049165828 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 325711 + 425 bytes |
| [n133](../Objects.level.bin对象实现清单.html#DuskMid%3An133) | BstNode_2345992618 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 43287 + 433 bytes |
| [n176](../Objects.level.bin对象实现清单.html#DuskMid%3An176) | BstNode_135 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 50256 + 426 bytes |
| [n212](../Objects.level.bin对象实现清单.html#DuskMid%3An212) | BstNode_145 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 58403 + 426 bytes |
| [n326](../Objects.level.bin对象实现清单.html#DuskMid%3An326) | BstNode_882 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 78454 + 426 bytes |
| [n343](../Objects.level.bin对象实现清单.html#DuskMid%3An343) | BstNode_2345992619 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 81275 + 433 bytes |
| [n694](../Objects.level.bin对象实现清单.html#DuskMid%3An694) | BstNode_2345992202 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 147575 + 433 bytes |
| [n696](../Objects.level.bin对象实现清单.html#DuskMid%3An696) | BstNode_2345992235 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 148399 + 433 bytes |
| [n701](../Objects.level.bin对象实现清单.html#DuskMid%3An701) | BstNode_2345992237 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 149540 + 433 bytes |
| [n702](../Objects.level.bin对象实现清单.html#DuskMid%3An702) | BstNode_2345992475 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 149973 + 433 bytes |
| [n801](../Objects.level.bin对象实现清单.html#DuskMid%3An801) | BstNode_2345992236 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 171207 + 433 bytes |
| [n67](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An67) | BstNode_228 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 29532 + 426 bytes |
| [n143](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An143) | BstNode_2345992259 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 46018 + 433 bytes |
| [n392](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An392) | BstNode_2345992605 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 102003 + 433 bytes |
| [n928](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An928) | BstNode_2345992636 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 228274 + 433 bytes |
| [n723](../Objects.level.bin对象实现清单.html#HubReveal%3An723) | BstNode_790 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 150683 + 450 bytes |
| [n849](../Objects.level.bin对象实现清单.html#HubReveal%3An849) | BstNode_2535 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 171762 + 451 bytes |
| [n1176](../Objects.level.bin对象实现清单.html#HubReveal%3An1176) | BstNode_752 | 20%（2/10），运行待验 | 0 / 0 | HubReveal · 229213 + 450 bytes |
| [n208](../Objects.level.bin对象实现清单.html#Night%3An208) | BstNode_980 | 20%（2/10），运行待验 | 0 / 0 | Night · 53990 + 325 bytes |
| [n490](../Objects.level.bin对象实现清单.html#Night%3An490) | BstNode_962 | 20%（2/10），运行待验 | 0 / 1 | Night · 96393 + 325 bytes |
| [n1323](../Objects.level.bin对象实现清单.html#Night%3An1323) | BstNode_714 | 20%（2/10），运行待验 | 0 / 0 | Night · 217093 + 325 bytes |
| [n1429](../Objects.level.bin对象实现清单.html#Night%3An1429) | BstNode_959 | 20%（2/10），运行待验 | 0 / 4 | Night · 230546 + 325 bytes |
| [n2134](../Objects.level.bin对象实现清单.html#Night%3An2134) | BstNode_44 | 20%（2/10），运行待验 | 0 / 0 | Night · 339067 + 324 bytes |
| [n7](../Objects.level.bin对象实现清单.html#NightEnd%3An7) | BstNode_44 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 20928 + 425 bytes |
| [n401](../Objects.level.bin对象实现清单.html#NightEnd%3An401) | BstNode_252 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 88425 + 426 bytes |
| [n664](../Objects.level.bin对象实现清单.html#NightEnd%3An664) | BstNode_205 | 20%（2/10），运行待验 | 0 / 0 | NightEnd · 132071 + 426 bytes |
| [n172](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An172) | BstNode_1049165825 | 20%（2/10），运行待验 | 0 / 0 | Prairie_ButterflyFields · 59140 + 457 bytes |
| [n1093](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1093) | BstNode_133 | 20%（2/10），运行待验 | 0 / 1 | Prairie_ButterflyFields · 237454 + 450 bytes |
| [n134](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An134) | BstNode_1293287777 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 56231 + 457 bytes |
| [n634](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An634) | BstNode_2504654996 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 171418 + 457 bytes |
| [n662](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An662) | BstNode_2504654897 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 179075 + 457 bytes |
| [n684](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An684) | BstNode_2535 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 184886 + 451 bytes |
| [n810](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An810) | BstNode_3122856069 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 211190 + 457 bytes |
| [n843](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An843) | BstNode_2753888282 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Cave · 219833 + 457 bytes |
| [n1320](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1320) | BstNode_1842807046 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 327153 + 457 bytes |
| [n1438](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1438) | BstNode_1293287779 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 360426 + 457 bytes |
| [n6](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An6) | BstNode_510 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 23172 + 450 bytes |
| [n603](../Objects.level.bin对象实现清单.html#Prairie_Village%3An603) | BstNode_2345992268 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 127029 + 457 bytes |
| [n1300](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1300) | BstNode_133 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 240344 + 450 bytes |
| [n1793](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1793) | BstNode_2504654897 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 319709 + 457 bytes |
| [n2313](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2313) | BstNode_1842806889 | 20%（2/10），运行待验 | 0 / 2 | Prairie_Village · 400517 + 457 bytes |
| [n2609](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2609) | BstNode_1049165887 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 441540 + 457 bytes |
| [n2985](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2985) | BstNode_2279669812 | 20%（2/10），运行待验 | 0 / 0 | Prairie_Village · 507330 + 457 bytes |
| [n453](../Objects.level.bin对象实现清单.html#Rain%3An453) | BstNode_371 | 20%（2/10），运行待验 | 0 / 0 | Rain · 130323 + 426 bytes |
| [n733](../Objects.level.bin对象实现清单.html#Rain%3An733) | BstNode_46 | 20%（2/10），运行待验 | 0 / 3 | Rain · 195280 + 425 bytes |
| [n1112](../Objects.level.bin对象实现清单.html#Rain%3An1112) | BstNode_682 | 20%（2/10），运行待验 | 0 / 0 | Rain · 278366 + 426 bytes |
| [n1637](../Objects.level.bin对象实现清单.html#Rain%3An1637) | BstNode_16 | 20%（2/10），运行待验 | 0 / 0 | Rain · 393359 + 425 bytes |
| [n1648](../Objects.level.bin对象实现清单.html#Rain%3An1648) | BstNode_840696024 | 20%（2/10），运行待验 | 0 / 1 | Rain · 395957 + 432 bytes |
| [n1712](../Objects.level.bin对象实现清单.html#Rain%3An1712) | BstNode_840696235 | 20%（2/10），运行待验 | 0 / 1 | Rain · 411726 + 432 bytes |
| [n149](../Objects.level.bin对象实现清单.html#RainEnd%3An149) | BstNode_1044 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 64507 + 451 bytes |
| [n151](../Objects.level.bin对象实现清单.html#RainEnd%3An151) | BstNode_1049166098 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 65349 + 457 bytes |
| [n532](../Objects.level.bin对象实现清单.html#RainEnd%3An532) | BstNode_81 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 157622 + 449 bytes |
| [n1181](../Objects.level.bin对象实现清单.html#RainEnd%3An1181) | BstNode_1393 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 310039 + 451 bytes |
| [n1203](../Objects.level.bin对象实现清单.html#RainEnd%3An1203) | BstNode_278 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 315620 + 450 bytes |
| [n1352](../Objects.level.bin对象实现清单.html#RainEnd%3An1352) | BstNode_885 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 353115 + 450 bytes |
| [n1438](../Objects.level.bin对象实现清单.html#RainEnd%3An1438) | BstNode_688 | 20%（2/10），运行待验 | 0 / 1 | RainEnd · 373925 + 450 bytes |
| [n425](../Objects.level.bin对象实现清单.html#RainForest%3An425) | BstNode_318 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 96681 + 426 bytes |
| [n673](../Objects.level.bin对象实现清单.html#RainForest%3An673) | BstNode_371 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 154445 + 426 bytes |
| [n683](../Objects.level.bin对象实现清单.html#RainMid%3An683) | BstNode_284 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 155303 + 325 bytes |
| [n912](../Objects.level.bin对象实现清单.html#RainMid%3An912) | BstNode_1049165920 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 194948 + 332 bytes |
| [n1658](../Objects.level.bin对象实现清单.html#RainMid%3An1658) | BstNode_1393 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 332909 + 326 bytes |
| [n2072](../Objects.level.bin对象实现清单.html#RainMid%3An2072) | BstNode_1049165921 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 399183 + 332 bytes |
| [n233](../Objects.level.bin对象实现清单.html#SkyHub2%3An233) | BstNode_2279669792 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 75809 + 457 bytes |
| [n808](../Objects.level.bin对象实现清单.html#SkyHub2%3An808) | BstNode_2446917644 | 20%（2/10），运行待验 | 0 / 1 | SkyHub2 · 182143 + 457 bytes |
| [n1513](../Objects.level.bin对象实现清单.html#Storm%3An1513) | BstNode_2529558582 | 20%（2/10），运行待验 | 0 / 1 | Storm · 288735 + 332 bytes |
| [n122](../Objects.level.bin对象实现清单.html#StormEnd%3An122) | BstNode_2529558719 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 42121 + 457 bytes |
| [n400](../Objects.level.bin对象实现清单.html#StormEnd%3An400) | BstNode_2529559313 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 93201 + 457 bytes |
| [n600](../Objects.level.bin对象实现清单.html#StormEnd%3An600) | BstNode_2446917720 | 20%（2/10），运行待验 | 0 / 0 | StormEnd · 125705 + 457 bytes |
| [n12](../Objects.level.bin对象实现清单.html#Sunset%3An12) | BstNode_1049166110 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 28261 + 457 bytes |
| [n333](../Objects.level.bin对象实现清单.html#Sunset%3An333) | BstNode_1049166098 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 91367 + 457 bytes |
| [n675](../Objects.level.bin对象实现清单.html#Sunset%3An675) | BstNode_220 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 147920 + 450 bytes |
| [n1133](../Objects.level.bin对象实现清单.html#Sunset%3An1133) | BstNode_1049166155 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 218617 + 457 bytes |
| [n1399](../Objects.level.bin对象实现清单.html#Sunset%3An1399) | BstNode_216 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 261499 + 450 bytes |
| [n1433](../Objects.level.bin对象实现清单.html#Sunset%3An1433) | BstNode_215 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 266899 + 450 bytes |
| [n116](../Objects.level.bin对象实现清单.html#SunsetEnd%3An116) | BstNode_228 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 47178 + 450 bytes |
| [n528](../Objects.level.bin对象实现清单.html#SunsetEnd%3An528) | BstNode_1167524386 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 116807 + 457 bytes |
| [n865](../Objects.level.bin对象实现清单.html#SunsetEnd%3An865) | BstNode_840695900 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 170550 + 456 bytes |
| [n1600](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1600) | BstNode_58 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 298453 + 449 bytes |
| [n1620](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1620) | BstNode_2279669800 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 303077 + 457 bytes |
| [n281](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An281) | BstNode_2279669966 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd2 · 81145 + 457 bytes |
| [n333](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An333) | BstNode_2033 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 90832 + 451 bytes |
| [n611](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An611) | BstNode_58 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd2 · 154988 + 449 bytes |
| [n744](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An744) | BstNode_2279669983 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd2 · 182830 + 457 bytes |
| [n860](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An860) | BstNode_840695900 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd2 · 204266 + 456 bytes |
| [n366](../Objects.level.bin对象实现清单.html#SunsetRace%3An366) | BstNode_1167524386 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 93049 + 457 bytes |
| [n826](../Objects.level.bin对象实现清单.html#SunsetRace%3An826) | BstNode_1167524387 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 184892 + 457 bytes |
| [n1037](../Objects.level.bin对象实现清单.html#SunsetRace%3An1037) | BstNode_2279669911 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 217021 + 457 bytes |
| [n1039](../Objects.level.bin对象实现清单.html#SunsetRace%3An1039) | BstNode_840695846 | 20%（2/10），运行待验 | 0 / 2 | SunsetRace · 217585 + 456 bytes |
