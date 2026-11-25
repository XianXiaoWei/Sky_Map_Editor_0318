# SetMixChannelLowpassFreq 单独类功能实现清单

功能分类：声音、音乐与混音。

此类职责：**混音通道低通频率过渡**。

类清单进度 30%（3/10），23 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：SetMixChannelLowpassFreq 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 混音通道低通频率过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetMixChannelLowpassFreq) · [原字段、进度与全部实例 JSON](SetMixChannelLowpassFreq.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n492](../Objects.level.bin对象实现清单.html#Dusk%3An492) | BstNode_2783838229 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 114779 + 36 bytes |
| [n845](../Objects.level.bin对象实现清单.html#Dusk%3An845) | BstNode_2783838221 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 176988 + 36 bytes |
| [n954](../Objects.level.bin对象实现清单.html#Dusk%3An954) | BstNode_2783838219 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 194998 + 36 bytes |
| [n974](../Objects.level.bin对象实现清单.html#Dusk%3An974) | BstNode_2783838228 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 199377 + 36 bytes |
| [n1002](../Objects.level.bin对象实现清单.html#Dusk%3An1002) | BstNode_2783838227 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 205642 + 36 bytes |
| [n1011](../Objects.level.bin对象实现清单.html#Dusk%3An1011) | BstNode_2783838220 | 20%（2/10），运行待验 | 0 / 1 | Dusk · 207090 + 36 bytes |
| [n459](../Objects.level.bin对象实现清单.html#NightEnd%3An459) | BstNode_209 | 20%（2/10），运行待验 | 0 / 1 | NightEnd · 99647 + 29 bytes |
| [n74](../Objects.level.bin对象实现清单.html#Storm%3An74) | BstNode_1288 | 20%（2/10），运行待验 | 0 / 1 | Storm · 36878 + 30 bytes |
| [n78](../Objects.level.bin对象实现清单.html#Storm%3An78) | BstNode_2783838218 | 20%（2/10），运行待验 | 0 / 1 | Storm · 37806 + 36 bytes |
| [n1336](../Objects.level.bin对象实现清单.html#Storm%3An1336) | BstNode_1289 | 20%（2/10），运行待验 | 0 / 2 | Storm · 258934 + 30 bytes |
| [n1657](../Objects.level.bin对象实现清单.html#Storm%3An1657) | BstNode_2783838213 | 20%（2/10），运行待验 | 0 / 1 | Storm · 315759 + 36 bytes |
| [n94](../Objects.level.bin对象实现清单.html#Sunset%3An94) | BstNode_2783838223 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 42842 + 36 bytes |
| [n415](../Objects.level.bin对象实现清单.html#Sunset%3An415) | BstNode_2783838224 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 103362 + 36 bytes |
| [n452](../Objects.level.bin对象实现清单.html#Sunset%3An452) | BstNode_2783838225 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 110347 + 36 bytes |
| [n636](../Objects.level.bin对象实现清单.html#Sunset%3An636) | BstNode_2783838222 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 141291 + 36 bytes |
| [n1028](../Objects.level.bin对象实现清单.html#Sunset%3An1028) | BstNode_2783838226 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 201740 + 36 bytes |
| [n1395](../Objects.level.bin对象实现清单.html#Sunset%3An1395) | BstNode_2783838221 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 261184 + 36 bytes |
| [n475](../Objects.level.bin对象实现清单.html#SunsetEnd%3An475) | BstNode_2783838224 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 108218 + 36 bytes |
| [n507](../Objects.level.bin对象实现清单.html#SunsetEnd%3An507) | BstNode_2783838225 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 114005 + 36 bytes |
| [n530](../Objects.level.bin对象实现清单.html#SunsetEnd%3An530) | BstNode_2783838229 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 117382 + 36 bytes |
| [n758](../Objects.level.bin对象实现清单.html#SunsetEnd%3An758) | BstNode_2783838230 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 152450 + 36 bytes |
| [n779](../Objects.level.bin对象实现清单.html#SunsetEnd%3An779) | BstNode_2783838222 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 155780 + 36 bytes |
| [n1539](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1539) | BstNode_2783838231 | 20%（2/10），运行待验 | 0 / 1 | SunsetEnd · 288822 + 36 bytes |
