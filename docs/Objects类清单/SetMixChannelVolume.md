# SetMixChannelVolume 单独类功能实现清单

功能分类：声音、音乐与混音。

此类职责：**混音通道音量过渡**。

类清单进度 30%（3/10），23 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SetMixChannelVolume 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 混音通道音量过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetMixChannelVolume) · [原字段、进度与全部实例 JSON](SetMixChannelVolume.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n705](../Objects.level.bin对象实现清单.html#Dawn%3An705) | BstNode_438 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 143504 + 29 bytes |
| [n1136](../Objects.level.bin对象实现清单.html#Dawn%3An1136) | BstNode_441 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 205132 + 29 bytes |
| [n1254](../Objects.level.bin对象实现清单.html#Dawn%3An1254) | BstNode_3122856179 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 224620 + 36 bytes |
| [n2207](../Objects.level.bin对象实现清单.html#Dawn%3An2207) | BstNode_1842806787 | 20%（2/10），运行待验 | 0 / 2 | Dawn · 363797 + 36 bytes |
| [n1208](../Objects.level.bin对象实现清单.html#DayEnd%3An1208) | BstNode_812 | 20%（2/10），运行待验 | 0 / 2 | DayEnd · 250742 + 29 bytes |
| [n130](../Objects.level.bin对象实现清单.html#Dusk%3An130) | BstNode_2783838230 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 45660 + 36 bytes |
| [n279](../Objects.level.bin对象实现清单.html#Dusk%3An279) | BstNode_2783838232 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 75059 + 36 bytes |
| [n186](../Objects.level.bin对象实现清单.html#NightEnd%3An186) | BstNode_212 | 20%（2/10），运行待验 | 0 / 0 | NightEnd · 53373 + 29 bytes |
| [n193](../Objects.level.bin对象实现清单.html#NightEnd%3An193) | BstNode_211 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 54328 + 29 bytes |
| [n484](../Objects.level.bin对象实现清单.html#NightEnd%3An484) | BstNode_2783838210 | 20%（2/10），运行待验 | 0 / 2 | NightEnd · 103508 + 36 bytes |
| [n580](../Objects.level.bin对象实现清单.html#NightEnd%3An580) | BstNode_213 | 20%（2/10），运行待验 | 0 / 2 | NightEnd · 117531 + 29 bytes |
| [n740](../Objects.level.bin对象实现清单.html#NightEnd%3An740) | BstNode_2783838211 | 20%（2/10），运行待验 | 0 / 2 | NightEnd · 143942 + 36 bytes |
| [n917](../Objects.level.bin对象实现清单.html#Rain%3An917) | BstNode_1458 | 20%（2/10），运行待验 | 0 / 4 | Rain · 236403 + 30 bytes |
| [n1262](../Objects.level.bin对象实现清单.html#Rain%3An1262) | BstNode_1454 | 20%（2/10），运行待验 | 0 / 4 | Rain · 310393 + 30 bytes |
| [n431](../Objects.level.bin对象实现清单.html#Storm%3An431) | BstNode_1284 | 20%（2/10），运行待验 | 0 / 1 | Storm · 100079 + 30 bytes |
| [n1009](../Objects.level.bin对象实现清单.html#Storm%3An1009) | BstNode_2783838219 | 20%（2/10），运行待验 | 0 / 1 | Storm · 202000 + 36 bytes |
| [n1251](../Objects.level.bin对象实现清单.html#Storm%3An1251) | BstNode_2783838214 | 20%（2/10），运行待验 | 0 / 1 | Storm · 247351 + 36 bytes |
| [n1299](../Objects.level.bin对象实现清单.html#Storm%3An1299) | BstNode_1281 | 20%（2/10），运行待验 | 0 / 1 | Storm · 254004 + 30 bytes |
| [n52](../Objects.level.bin对象实现清单.html#StormEnd%3An52) | BstNode_2783838218 | 20%（2/10），运行待验 | 0 / 1 | StormEnd · 30864 + 36 bytes |
| [n525](../Objects.level.bin对象实现清单.html#StormEnd%3An525) | BstNode_2783838211 | 20%（2/10），运行待验 | 0 / 1 | StormEnd · 116668 + 36 bytes |
| [n586](../Objects.level.bin对象实现清单.html#StormEnd%3An586) | BstNode_2783838219 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 124097 + 36 bytes |
| [n828](../Objects.level.bin对象实现清单.html#StormEnd%3An828) | BstNode_2783838221 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 159759 + 36 bytes |
| [n980](../Objects.level.bin对象实现清单.html#StormEnd%3An980) | BstNode_2783838220 | 20%（2/10），运行待验 | 0 / 2 | StormEnd · 188135 + 36 bytes |
