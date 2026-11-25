# StrobeObject 单独类功能实现清单

功能分类：场景基础与对象变换。

此类职责：**对象闪烁、时长与结束状态**。

类清单进度 30%（3/10），12 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：StrobeObject 的原默认值、继承初始化及 19 个序列化字段变体；原注册字段 18 项。
- [ ] 对象闪烁、时长与结束状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（22 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 18 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=StrobeObject) · [原字段、进度与全部实例 JSON](StrobeObject.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n101](../Objects.level.bin对象实现清单.html#Dawn%3An101) | BstNode_1786 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 49138 + 110 bytes |
| [n438](../Objects.level.bin对象实现清单.html#Dawn%3An438) | BstNode_963 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 98693 + 98 bytes |
| [n737](../Objects.level.bin对象实现清单.html#Dawn%3An737) | BstNode_1790 | 20%（2/10），运行待验 | 0 / 1 | Dawn · 150850 + 111 bytes |
| [n865](../Objects.level.bin对象实现清单.html#Dawn%3An865) | BstNode_2504654904 | 20%（2/10），运行待验 | 3 / 2 | Dawn · 170575 + 116 bytes |
| [n1638](../Objects.level.bin对象实现清单.html#Dawn%3An1638) | BstNode_2504654898 | 20%（2/10），运行待验 | 3 / 2 | Dawn · 280662 + 116 bytes |
| [n2763](../Objects.level.bin对象实现清单.html#Dawn%3An2763) | BstNode_2504654906 | 20%（2/10），运行待验 | 3 / 2 | Dawn · 455538 + 116 bytes |
| [n148](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An148) | BstNode_34603521 | 20%（2/10），运行待验 | 2 / 2 | Prairie_NestAndKeeper · 54414 + 114 bytes |
| [n343](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An343) | BstNode_34603291 | 20%（2/10），运行待验 | 2 / 2 | Prairie_NestAndKeeper · 99887 + 114 bytes |
| [n912](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An912) | BstNode_2279670078 | 20%（2/10），运行待验 | 2 / 2 | Prairie_NestAndKeeper · 224245 + 116 bytes |
| [n180](../Objects.level.bin对象实现清单.html#SkyHub2%3An180) | BstNode_1049165988 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 65346 + 116 bytes |
| [n369](../Objects.level.bin对象实现清单.html#SkyHub2%3An369) | BstNode_1049165985 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 102766 + 116 bytes |
| [n758](../Objects.level.bin对象实现清单.html#SkyHub2%3An758) | BstNode_1049165986 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 171593 + 116 bytes |
