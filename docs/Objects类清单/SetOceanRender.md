# SetOceanRender 单独类功能实现清单

功能分类：水、雾与天气。

此类职责：**海洋绘制开关**。

类清单进度 30%（3/10），15 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SetOceanRender 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 海洋绘制开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetOceanRender) · [原字段、进度与全部实例 JSON](SetOceanRender.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n162](../Objects.level.bin对象实现清单.html#CandleSpace%3An162) | BstNode_2446917641 | 20%（2/10），运行待验 | 0 / 0 | CandleSpace · 44363 + 25 bytes |
| [n585](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An585) | BstNode_2446917641 | 20%（2/10），运行待验 | 0 / 0 | CandleSpaceEnd · 115501 + 25 bytes |
| [n1444](../Objects.level.bin对象实现清单.html#Dawn%3An1444) | BstNode_3122857188 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 255039 + 25 bytes |
| [n2490](../Objects.level.bin对象实现清单.html#Dawn%3An2490) | BstNode_995 | 20%（2/10），运行待验 | 0 / 0 | Dawn · 414906 + 18 bytes |
| [n676](../Objects.level.bin对象实现清单.html#DayHubCave%3An676) | BstNode_2345992200 | 20%（2/10），运行待验 | 0 / 0 | DayHubCave · 149852 + 25 bytes |
| [n28](../Objects.level.bin对象实现清单.html#Dusk%3An28) | BstNode_2345992211 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 28324 + 25 bytes |
| [n21](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An21) | BstNode_2345992211 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 19991 + 25 bytes |
| [n76](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An76) | BstNode_34603192 | 20%（2/10），运行待验 | 0 / 0 | Prairie_NestAndKeeper · 39960 + 23 bytes |
| [n1260](../Objects.level.bin对象实现清单.html#Rain%3An1260) | BstNode_2345993075 | 20%（2/10），运行待验 | 0 / 0 | Rain · 310206 + 25 bytes |
| [n600](../Objects.level.bin对象实现清单.html#RainForest%3An600) | BstNode_2345993075 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 138020 + 25 bytes |
| [n1135](../Objects.level.bin对象实现清单.html#RainMid%3An1135) | BstNode_1581 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 234956 + 19 bytes |
| [n2035](../Objects.level.bin对象实现清单.html#SkyHub2%3An2035) | BstNode_1049165888 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 383270 + 25 bytes |
| [n982](../Objects.level.bin对象实现清单.html#Sunset%3An982) | BstNode_175 | 20%（2/10），运行待验 | 0 / 0 | Sunset · 195472 + 18 bytes |
| [n374](../Objects.level.bin对象实现清单.html#SunsetRace%3An374) | BstNode_175 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 95440 + 18 bytes |
| [n23](../Objects.level.bin对象实现清单.html#TitleWater%3An23) | BstNode_98 | 20%（2/10），运行待验 | 0 / 0 | TitleWater · 19482 + 17 bytes |
