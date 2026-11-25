# Npc_Teleport 单独类功能实现清单

功能分类：NPC 行为与社交。

此类职责：**NPC 定位**。

类清单进度 30%（3/10），13 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：Npc_Teleport 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] NPC 定位：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（13 条引用）、Marker（13 条引用）
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Npc_Teleport) · [原字段、进度与全部实例 JSON](Npc_Teleport.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n227](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An227) | BstNode_2504654954 | 20%（2/10），运行待验 | 2 / 5 | Prairie_Cave · 75540 + 32 bytes |
| [n900](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An900) | BstNode_2504654889 | 20%（2/10），运行待验 | 2 / 4 | Prairie_Cave · 233182 + 32 bytes |
| [n1762](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1762) | BstNode_2504654884 | 20%（2/10），运行待验 | 2 / 5 | Prairie_Cave · 452382 + 32 bytes |
| [n37](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An37) | BstNode_2504655000 | 20%（2/10），运行待验 | 2 / 3 | Prairie_NestAndKeeper · 31452 + 32 bytes |
| [n898](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An898) | BstNode_2504654998 | 20%（2/10），运行待验 | 2 / 3 | Prairie_NestAndKeeper · 221257 + 32 bytes |
| [n829](../Objects.level.bin对象实现清单.html#Prairie_Village%3An829) | BstNode_2504654857 | 20%（2/10），运行待验 | 2 / 3 | Prairie_Village · 165950 + 32 bytes |
| [n915](../Objects.level.bin对象实现清单.html#Prairie_Village%3An915) | BstNode_1528234060 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 180415 + 32 bytes |
| [n1006](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1006) | BstNode_2504654989 | 20%（2/10），运行待验 | 2 / 3 | Prairie_Village · 196045 + 32 bytes |
| [n1188](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1188) | BstNode_2504655086 | 20%（2/10），运行待验 | 2 / 3 | Prairie_Village · 222803 + 32 bytes |
| [n1365](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1365) | BstNode_1842806912 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 250356 + 32 bytes |
| [n2765](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2765) | BstNode_2504655076 | 20%（2/10），运行待验 | 2 / 3 | Prairie_Village · 468342 + 32 bytes |
| [n253](../Objects.level.bin对象实现清单.html#SkyHub2%3An253) | BstNode_2529558764 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 80370 + 32 bytes |
| [n2074](../Objects.level.bin对象实现清单.html#SkyHub2%3An2074) | BstNode_1167523849 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 390149 + 32 bytes |
