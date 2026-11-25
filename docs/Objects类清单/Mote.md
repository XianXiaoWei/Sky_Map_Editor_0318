# Mote 单独类功能实现清单

功能分类：光点、碎片与灵魂。

此类职责：**光点实例与初始状态**。

类清单进度 30%（3/10），50 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Mote 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 3 项。
- [ ] 光点实例与初始状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：MoteParams（50 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Mote) · [原字段、进度与全部实例 JSON](Mote.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n112](../Objects.level.bin对象实现清单.html#SunsetEnd%3An112) | BstNode_1167524047 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 46780 + 92 bytes |
| [n242](../Objects.level.bin对象实现清单.html#SunsetEnd%3An242) | BstNode_1167524133 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 73211 + 92 bytes |
| [n271](../Objects.level.bin对象实现清单.html#SunsetEnd%3An271) | BstNode_1167524017 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 79209 + 92 bytes |
| [n298](../Objects.level.bin对象实现清单.html#SunsetEnd%3An298) | BstNode_1167524125 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 81657 + 92 bytes |
| [n533](../Objects.level.bin对象实现清单.html#SunsetEnd%3An533) | BstNode_1167524087 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 117646 + 92 bytes |
| [n552](../Objects.level.bin对象实现清单.html#SunsetEnd%3An552) | BstNode_1167524115 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 120522 + 92 bytes |
| [n652](../Objects.level.bin对象实现清单.html#SunsetEnd%3An652) | BstNode_1167524023 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 134545 + 92 bytes |
| [n667](../Objects.level.bin对象实现清单.html#SunsetEnd%3An667) | BstNode_1167524029 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 137156 + 92 bytes |
| [n672](../Objects.level.bin对象实现清单.html#SunsetEnd%3An672) | BstNode_1167524053 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 138035 + 92 bytes |
| [n688](../Objects.level.bin对象实现清单.html#SunsetEnd%3An688) | BstNode_1167524109 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 140953 + 92 bytes |
| [n1025](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1025) | BstNode_1167524295 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 198210 + 92 bytes |
| [n1732](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1732) | BstNode_1167524041 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 324375 + 92 bytes |
| [n1769](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1769) | BstNode_1167524097 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 332660 + 92 bytes |
| [n1818](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1818) | BstNode_1167524259 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 343908 + 92 bytes |
| [n33](../Objects.level.bin对象实现清单.html#SunsetRace%3An33) | BstNode_1167524490 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 27639 + 92 bytes |
| [n132](../Objects.level.bin对象实现清单.html#SunsetRace%3An132) | BstNode_1167524271 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 46071 + 92 bytes |
| [n160](../Objects.level.bin对象实现清单.html#SunsetRace%3An160) | BstNode_1167524195 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 50931 + 92 bytes |
| [n173](../Objects.level.bin对象实现清单.html#SunsetRace%3An173) | BstNode_1167524289 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 53315 + 92 bytes |
| [n209](../Objects.level.bin对象实现清单.html#SunsetRace%3An209) | BstNode_1167523911 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 59532 + 92 bytes |
| [n390](../Objects.level.bin对象实现清单.html#SunsetRace%3An390) | BstNode_1167523869 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 100247 + 92 bytes |
| [n463](../Objects.level.bin对象实现清单.html#SunsetRace%3An463) | BstNode_1167524103 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 114767 + 92 bytes |
| [n650](../Objects.level.bin对象实现清单.html#SunsetRace%3An650) | BstNode_1167524247 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 152540 + 92 bytes |
| [n667](../Objects.level.bin对象实现清单.html#SunsetRace%3An667) | BstNode_1167524031 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 155827 + 92 bytes |
| [n701](../Objects.level.bin对象实现清单.html#SunsetRace%3An701) | BstNode_1167524265 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 160513 + 92 bytes |
| [n823](../Objects.level.bin对象实现清单.html#SunsetRace%3An823) | BstNode_1167524478 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 184317 + 92 bytes |
| [n824](../Objects.level.bin对象实现清单.html#SunsetRace%3An824) | BstNode_1167524213 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 184409 + 92 bytes |
| [n828](../Objects.level.bin对象实现清单.html#SunsetRace%3An828) | BstNode_1167524295 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 185467 + 92 bytes |
| [n833](../Objects.level.bin对象实现清单.html#SunsetRace%3An833) | BstNode_1167524189 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 186300 + 92 bytes |
| [n840](../Objects.level.bin对象实现清单.html#SunsetRace%3An840) | BstNode_1167524207 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 187735 + 92 bytes |
| [n848](../Objects.level.bin对象实现清单.html#SunsetRace%3An848) | BstNode_1167524225 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 188283 + 92 bytes |
| [n852](../Objects.level.bin对象实现清单.html#SunsetRace%3An852) | BstNode_1167524235 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 188719 + 92 bytes |
| [n856](../Objects.level.bin对象实现清单.html#SunsetRace%3An856) | BstNode_1167524046 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 188987 + 92 bytes |
| [n860](../Objects.level.bin对象实现清单.html#SunsetRace%3An860) | BstNode_1167524484 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 189653 + 92 bytes |
| [n873](../Objects.level.bin对象实现清单.html#SunsetRace%3An873) | BstNode_1167524025 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 191533 + 92 bytes |
| [n884](../Objects.level.bin对象实现清单.html#SunsetRace%3An884) | BstNode_1167524014 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 193252 + 92 bytes |
| [n887](../Objects.level.bin对象实现清单.html#SunsetRace%3An887) | BstNode_1167524301 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 193821 + 92 bytes |
| [n920](../Objects.level.bin对象实现清单.html#SunsetRace%3An920) | BstNode_1167524495 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 199445 + 92 bytes |
| [n929](../Objects.level.bin对象实现清单.html#SunsetRace%3An929) | BstNode_1167524201 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 200622 + 92 bytes |
| [n936](../Objects.level.bin对象实现清单.html#SunsetRace%3An936) | BstNode_1167524501 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 201692 + 92 bytes |
| [n939](../Objects.level.bin对象实现清单.html#SunsetRace%3An939) | BstNode_1167524040 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 201921 + 92 bytes |
| [n946](../Objects.level.bin对象实现清单.html#SunsetRace%3An946) | BstNode_1167524183 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 202488 + 92 bytes |
| [n963](../Objects.level.bin对象实现清单.html#SunsetRace%3An963) | BstNode_1167524253 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 205466 + 92 bytes |
| [n968](../Objects.level.bin对象实现清单.html#SunsetRace%3An968) | BstNode_1167524111 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 205968 + 92 bytes |
| [n986](../Objects.level.bin对象实现清单.html#SunsetRace%3An986) | BstNode_1167524283 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 208488 + 92 bytes |
| [n1001](../Objects.level.bin对象实现清单.html#SunsetRace%3An1001) | BstNode_1167523945 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 210964 + 92 bytes |
| [n1157](../Objects.level.bin对象实现清单.html#SunsetRace%3An1157) | BstNode_1167524109 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 236752 + 92 bytes |
| [n1259](../Objects.level.bin对象实现清单.html#SunsetRace%3An1259) | BstNode_1167524241 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 257032 + 92 bytes |
| [n1266](../Objects.level.bin对象实现清单.html#SunsetRace%3An1266) | BstNode_1167524277 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 258249 + 92 bytes |
| [n1472](../Objects.level.bin对象实现清单.html#SunsetRace%3An1472) | BstNode_1167524076 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 299724 + 92 bytes |
| [n1607](../Objects.level.bin对象实现清单.html#SunsetRace%3An1607) | BstNode_1167524259 | 20%（2/10），运行待验 | 1 / 1 | SunsetRace · 326843 + 92 bytes |
