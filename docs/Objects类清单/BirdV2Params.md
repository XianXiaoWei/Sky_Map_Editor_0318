# BirdV2Params 单独类功能实现清单

功能分类：生物、群体与 AI。

此类职责：**鸟类运动、引导与效果参数**。

类清单进度 30%（3/10），46 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：BirdV2Params 的原默认值、继承初始化及 21 个序列化字段变体；原注册字段 21 项。
- [ ] 鸟类运动、引导与效果参数：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 依赖调用与事件：LevelMesh（46 条引用）、Marker（35 条引用）、Clump（48 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 21 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 明确范围的原核心子链已独立核验（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=BirdV2Params) · [原字段、进度与全部实例 JSON](BirdV2Params.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n907](../Objects.level.bin对象实现清单.html#Dawn%3An907) | BstNode_1842806892 | 20%（2/10），运行待验 | 1 / 7 | Dawn · 176403 + 83 bytes |
| [n1180](../Objects.level.bin对象实现清单.html#Dawn%3An1180) | BstNode_1842806826 | 20%（2/10），运行待验 | 1 / 10 | Dawn · 209456 + 83 bytes |
| [n2952](../Objects.level.bin对象实现清单.html#Dawn%3An2952) | BstNode_1473 | 20%（2/10），运行待验 | 1 / 31 | Dawn · 482106 + 77 bytes |
| [n221](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An221) | BstNode_1413 | 20%（2/10），运行待验 | 1 / 1 | DuskGraveyard · 76048 + 73 bytes |
| [n264](../Objects.level.bin对象实现清单.html#HubReveal%3An264) | BstNode_301 | 20%（2/10），运行待验 | 2 / 12 | HubReveal · 73747 + 72 bytes |
| [n353](../Objects.level.bin对象实现清单.html#HubReveal%3An353) | BstNode_666 | 20%（2/10），运行待验 | 2 / 10 | HubReveal · 90060 + 72 bytes |
| [n708](../Objects.level.bin对象实现清单.html#HubReveal%3An708) | BstNode_479 | 20%（2/10），运行待验 | 2 / 12 | HubReveal · 147473 + 72 bytes |
| [n71](../Objects.level.bin对象实现清单.html#Prairie_Village%3An71) | BstNode_1541 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 42485 + 77 bytes |
| [n142](../Objects.level.bin对象实现清单.html#Prairie_Village%3An142) | BstNode_342 | 20%（2/10），运行待验 | 5 / 2 | Prairie_Village · 53798 + 76 bytes |
| [n386](../Objects.level.bin对象实现清单.html#Prairie_Village%3An386) | BstNode_580 | 20%（2/10），运行待验 | 2 / 9 | Prairie_Village · 92596 + 76 bytes |
| [n461](../Objects.level.bin对象实现清单.html#Prairie_Village%3An461) | BstNode_2783838247 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 106792 + 83 bytes |
| [n588](../Objects.level.bin对象实现清单.html#Prairie_Village%3An588) | BstNode_345 | 20%（2/10），运行待验 | 5 / 2 | Prairie_Village · 125197 + 76 bytes |
| [n608](../Objects.level.bin对象实现清单.html#Prairie_Village%3An608) | BstNode_666 | 20%（2/10），运行待验 | 2 / 9 | Prairie_Village · 128547 + 76 bytes |
| [n812](../Objects.level.bin对象实现清单.html#Prairie_Village%3An812) | BstNode_1562 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 163068 + 77 bytes |
| [n864](../Objects.level.bin对象实现清单.html#Prairie_Village%3An864) | BstNode_2783838255 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Village · 172051 + 83 bytes |
| [n1265](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1265) | BstNode_2783838250 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 235064 + 83 bytes |
| [n1455](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1455) | BstNode_2783838243 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Village · 263359 + 83 bytes |
| [n1484](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1484) | BstNode_2783838249 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 268382 + 83 bytes |
| [n1638](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1638) | BstNode_1413 | 20%（2/10），运行待验 | 1 / 6 | Prairie_Village · 292192 + 77 bytes |
| [n1671](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1671) | BstNode_2783838256 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Village · 296730 + 83 bytes |
| [n1803](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1803) | BstNode_2783838248 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 321219 + 83 bytes |
| [n1964](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1964) | BstNode_1600 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Village · 350705 + 77 bytes |
| [n2159](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2159) | BstNode_2366 | 20%（2/10），运行待验 | 2 / 9 | Prairie_Village · 377644 + 77 bytes |
| [n2176](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2176) | BstNode_2783838239 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 380089 + 83 bytes |
| [n2181](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2181) | BstNode_2783838245 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Village · 380828 + 83 bytes |
| [n2188](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2188) | BstNode_2783838257 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Village · 382337 + 83 bytes |
| [n2242](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2242) | BstNode_341 | 20%（2/10），运行待验 | 5 / 2 | Prairie_Village · 388701 + 76 bytes |
| [n2381](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2381) | BstNode_1545 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 410484 + 77 bytes |
| [n2490](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2490) | BstNode_2783838240 | 20%（2/10），运行待验 | 4 / 1 | Prairie_Village · 426001 + 83 bytes |
| [n2511](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2511) | BstNode_2783838254 | 20%（2/10），运行待验 | 5 / 1 | Prairie_Village · 428195 + 83 bytes |
| [n2897](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2897) | BstNode_2100 | 20%（2/10），运行待验 | 2 / 9 | Prairie_Village · 492650 + 77 bytes |
| [n682](../Objects.level.bin对象实现清单.html#Rain%3An682) | BstNode_1778 | 20%（2/10），运行待验 | 1 / 1 | Rain · 183571 + 73 bytes |
| [n1513](../Objects.level.bin对象实现清单.html#RainEnd%3An1513) | BstNode_1604 | 20%（2/10），运行待验 | 1 / 13 | RainEnd · 387677 + 73 bytes |
| [n391](../Objects.level.bin对象实现清单.html#RainForest%3An391) | BstNode_1778 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 92512 + 73 bytes |
| [n1018](../Objects.level.bin对象实现清单.html#RainForest%3An1018) | BstNode_1604 | 20%（2/10），运行待验 | 1 / 1 | RainForest · 232631 + 73 bytes |
| [n55](../Objects.level.bin对象实现清单.html#RainMid%3An55) | BstNode_34603234 | 20%（2/10），运行待验 | 1 / 1 | RainMid · 36672 + 77 bytes |
| [n1267](../Objects.level.bin对象实现清单.html#RainMid%3An1267) | BstNode_1778 | 20%（2/10），运行待验 | 1 / 3 | RainMid · 258245 + 73 bytes |
| [n235](../Objects.level.bin对象实现清单.html#Sunset%3An235) | BstNode_1413 | 20%（2/10），运行待验 | 2 / 4 | Sunset · 71600 + 77 bytes |
| [n1142](../Objects.level.bin对象实现清单.html#Sunset%3An1142) | BstNode_82 | 20%（2/10），运行待验 | 2 / 2 | Sunset · 220192 + 75 bytes |
| [n288](../Objects.level.bin对象实现清单.html#SunsetEnd%3An288) | BstNode_1413 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd · 80796 + 77 bytes |
| [n1067](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1067) | BstNode_82 | 20%（2/10），运行待验 | 2 / 1 | SunsetEnd · 204462 + 75 bytes |
| [n94](../Objects.level.bin对象实现清单.html#SunsetRace%3An94) | BstNode_1167524129 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 40254 + 83 bytes |
| [n799](../Objects.level.bin对象实现清单.html#SunsetRace%3An799) | BstNode_666 | 20%（2/10），运行待验 | 2 / 5 | SunsetRace · 179698 + 76 bytes |
| [n1050](../Objects.level.bin对象实现清单.html#SunsetRace%3An1050) | BstNode_1167524161 | 20%（2/10），运行待验 | 2 / 3 | SunsetRace · 220083 + 83 bytes |
| [n1342](../Objects.level.bin对象实现清单.html#SunsetRace%3An1342) | BstNode_840695845 | 20%（2/10），运行待验 | 2 / 5 | SunsetRace · 274986 + 82 bytes |
| [n41](../Objects.level.bin对象实现清单.html#TitleWater%3An41) | BstNode_251 | 20%（2/10），运行待验 | 2 / 15 | TitleWater · 22136 + 76 bytes |
