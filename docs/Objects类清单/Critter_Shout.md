# Critter_Shout 单独类功能实现清单

功能分类：生物、群体与 AI。

此类职责：**生物集合喊叫音效与视觉**。

类清单进度 40%（4/10），15 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：Critter_Shout 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 生物集合喊叫音效与视觉（部分完成）：原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。
- [ ] 依赖调用与事件：Clump（15 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。
- [x] 明确范围的原核心子链已独立核验：原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Critter_Shout) · [原字段、进度与全部实例 JSON](Critter_Shout.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n81](../Objects.level.bin对象实现清单.html#Prairie_Village%3An81) | BstNode_1032 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 43912 + 24 bytes |
| [n578](../Objects.level.bin对象实现清单.html#Prairie_Village%3An578) | BstNode_1046 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 123583 + 24 bytes |
| [n625](../Objects.level.bin对象实现清单.html#Prairie_Village%3An625) | BstNode_1018 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 131543 + 24 bytes |
| [n733](../Objects.level.bin对象实现清单.html#Prairie_Village%3An733) | BstNode_1015 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 150062 + 24 bytes |
| [n860](../Objects.level.bin对象实现清单.html#Prairie_Village%3An860) | BstNode_596 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 171714 + 23 bytes |
| [n1275](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1275) | BstNode_1031 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 236524 + 24 bytes |
| [n1302](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1302) | BstNode_1937 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 241185 + 24 bytes |
| [n1477](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1477) | BstNode_1936 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 267185 + 24 bytes |
| [n1889](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1889) | BstNode_994 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 337235 + 23 bytes |
| [n2213](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2213) | BstNode_2106 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 385742 + 24 bytes |
| [n2254](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2254) | BstNode_1016 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 391658 + 24 bytes |
| [n2255](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2255) | BstNode_1019 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 391682 + 24 bytes |
| [n2708](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2708) | BstNode_1017 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 458774 + 24 bytes |
| [n2792](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2792) | BstNode_1045 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 473874 + 24 bytes |
| [n2825](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2825) | BstNode_997 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Village · 479507 + 23 bytes |
