# BirdV2AiParams 单独类功能实现清单

功能分类：生物、群体与 AI。

此类职责：**鸟类追踪、群体、目标与到达参数**。

类清单进度 30%（3/10），33 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：BirdV2AiParams 的原默认值、继承初始化及 26 个序列化字段变体；原注册字段 26 项。
- [ ] 鸟类追踪、群体、目标与到达参数：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 依赖调用与事件：Clump（45 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 26 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 明确范围的原核心子链已独立核验（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=BirdV2AiParams) · [原字段、进度与全部实例 JSON](BirdV2AiParams.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n389](../Objects.level.bin对象实现清单.html#Dawn%3An389) | BstNode_840696156 | 20%（2/10），运行待验 | 2 / 10 | Dawn · 92565 + 123 bytes |
| [n881](../Objects.level.bin对象实现清单.html#Dawn%3An881) | BstNode_2000 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 172674 + 118 bytes |
| [n1008](../Objects.level.bin对象实现清单.html#Dawn%3An1008) | BstNode_1475 | 20%（2/10），运行待验 | 2 / 21 | Dawn · 190091 + 118 bytes |
| [n2110](../Objects.level.bin对象实现清单.html#Dawn%3An2110) | BstNode_1842806837 | 20%（2/10），运行待验 | 2 / 7 | Dawn · 345237 + 124 bytes |
| [n2740](../Objects.level.bin对象实现清单.html#Dawn%3An2740) | BstNode_1842806876 | 20%（2/10），运行待验 | 2 / 10 | Dawn · 452985 + 124 bytes |
| [n565](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An565) | BstNode_690 | 20%（2/10），运行待验 | 1 / 1 | DuskGraveyard · 155362 + 117 bytes |
| [n341](../Objects.level.bin对象实现清单.html#HubReveal%3An341) | BstNode_949 | 20%（2/10），运行待验 | 2 / 12 | HubReveal · 87805 + 117 bytes |
| [n733](../Objects.level.bin对象实现清单.html#HubReveal%3An733) | BstNode_432 | 20%（2/10），运行待验 | 2 / 12 | HubReveal · 152704 + 117 bytes |
| [n1350](../Objects.level.bin对象实现清单.html#HubReveal%3An1350) | BstNode_1003 | 20%（2/10），运行待验 | 2 / 10 | HubReveal · 257249 + 118 bytes |
| [n208](../Objects.level.bin对象实现清单.html#Prairie_Village%3An208) | BstNode_2303 | 20%（2/10），运行待验 | 1 / 9 | Prairie_Village · 64489 + 118 bytes |
| [n1102](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1102) | BstNode_2140 | 20%（2/10），运行待验 | 1 / 9 | Prairie_Village · 212252 + 118 bytes |
| [n1483](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1483) | BstNode_690 | 20%（2/10），运行待验 | 1 / 6 | Prairie_Village · 268265 + 117 bytes |
| [n1591](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1591) | BstNode_1601 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 286537 + 118 bytes |
| [n2050](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2050) | BstNode_1563 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 364196 + 118 bytes |
| [n2217](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2217) | BstNode_1533 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 385889 + 118 bytes |
| [n2238](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2238) | BstNode_1547 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 387683 + 118 bytes |
| [n2757](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2757) | BstNode_223 | 20%（2/10），运行待验 | 1 / 9 | Prairie_Village · 467175 + 117 bytes |
| [n2919](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2919) | BstNode_638 | 20%（2/10），运行待验 | 1 / 9 | Prairie_Village · 496248 + 117 bytes |
| [n219](../Objects.level.bin对象实现清单.html#Rain%3An219) | BstNode_1783 | 20%（2/10），运行待验 | 1 / 1 | Rain · 77570 + 118 bytes |
| [n1572](../Objects.level.bin对象实现清单.html#RainEnd%3An1572) | BstNode_1602 | 20%（2/10），运行待验 | 1 / 13 | RainEnd · 398961 + 118 bytes |
| [n231](../Objects.level.bin对象实现清单.html#RainForest%3An231) | BstNode_1783 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 67224 + 118 bytes |
| [n1212](../Objects.level.bin对象实现清单.html#RainForest%3An1212) | BstNode_1602 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 267563 + 118 bytes |
| [n235](../Objects.level.bin对象实现清单.html#RainMid%3An235) | BstNode_1783 | 20%（2/10），运行待验 | 2 / 3 | RainMid · 72156 + 118 bytes |
| [n692](../Objects.level.bin对象实现清单.html#RainMid%3An692) | BstNode_34603203 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 157091 + 122 bytes |
| [n603](../Objects.level.bin对象实现清单.html#Sunset%3An603) | BstNode_690 | 20%（2/10），运行待验 | 2 / 4 | Sunset · 134449 + 117 bytes |
| [n830](../Objects.level.bin对象实现清单.html#Sunset%3An830) | BstNode_83 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 173683 + 116 bytes |
| [n1031](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1031) | BstNode_690 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 198911 + 117 bytes |
| [n1041](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1041) | BstNode_83 | 20%（2/10），运行待验 | 1 / 1 | SunsetEnd · 200104 + 116 bytes |
| [n473](../Objects.level.bin对象实现清单.html#SunsetRace%3An473) | BstNode_840695850 | 20%（2/10），运行待验 | 1 / 5 | SunsetRace · 117013 + 123 bytes |
| [n663](../Objects.level.bin对象实现清单.html#SunsetRace%3An663) | BstNode_1003 | 20%（2/10），运行待验 | 1 / 5 | SunsetRace · 155204 + 118 bytes |
| [n932](../Objects.level.bin对象实现清单.html#SunsetRace%3An932) | BstNode_1167524152 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 201177 + 124 bytes |
| [n1085](../Objects.level.bin对象实现清单.html#SunsetRace%3An1085) | BstNode_1167524128 | 20%（2/10），运行待验 | 2 / 3 | SunsetRace · 225740 + 124 bytes |
| [n103](../Objects.level.bin对象实现清单.html#TitleWater%3An103) | BstNode_44 | 20%（2/10），运行待验 | 1 / 15 | TitleWater · 29428 + 116 bytes |
