# KillBox 单独类功能实现清单

功能分类：碰撞、受力与移动限制。

此类职责：**空间死亡区域**。

类清单进度 30%（3/10），146 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造：KillBox 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 1 项。
- [ ] 空间死亡区域：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
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

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=KillBox) · [原字段、进度与全部实例 JSON](KillBox.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n12](../Objects.level.bin对象实现清单.html#Dusk%3An12) | BstNode_2345992671 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 26160 + 87 bytes |
| [n62](../Objects.level.bin对象实现清单.html#Dusk%3An62) | BstNode_2345992674 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 34587 + 87 bytes |
| [n95](../Objects.level.bin对象实现清单.html#Dusk%3An95) | BstNode_2345992668 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 39945 + 87 bytes |
| [n532](../Objects.level.bin对象实现清单.html#Dusk%3An532) | BstNode_2345992669 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 123845 + 87 bytes |
| [n734](../Objects.level.bin对象实现清单.html#Dusk%3An734) | BstNode_2345992673 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 154669 + 87 bytes |
| [n886](../Objects.level.bin对象实现清单.html#Dusk%3An886) | BstNode_2345992672 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 184219 + 87 bytes |
| [n990](../Objects.level.bin对象实现清单.html#Dusk%3An990) | BstNode_2345992670 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 202785 + 87 bytes |
| [n1042](../Objects.level.bin对象实现清单.html#Dusk%3An1042) | BstNode_2345992667 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 212684 + 87 bytes |
| [n1100](../Objects.level.bin对象实现清单.html#Dusk%3An1100) | BstNode_45 | 20%（2/10），运行待验 | 0 / 0 | Dusk · 225118 + 79 bytes |
| [n4](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An4) | BstNode_2345992921 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 24443 + 87 bytes |
| [n73](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An73) | BstNode_2279669773 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 42626 + 87 bytes |
| [n309](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An309) | BstNode_2279669765 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 99422 + 87 bytes |
| [n411](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An411) | BstNode_2279669919 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 121568 + 87 bytes |
| [n1052](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1052) | BstNode_2279669779 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 274883 + 87 bytes |
| [n1085](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1085) | BstNode_2279669780 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 281710 + 87 bytes |
| [n1097](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1097) | BstNode_2279669775 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 283958 + 87 bytes |
| [n1197](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1197) | BstNode_2345992922 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 304764 + 87 bytes |
| [n1282](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1282) | BstNode_2345992256 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 320709 + 87 bytes |
| [n1362](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1362) | BstNode_2279669766 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 336405 + 87 bytes |
| [n1596](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1596) | BstNode_2345992255 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 395060 + 87 bytes |
| [n1601](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1601) | BstNode_2279669918 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 396126 + 87 bytes |
| [n1619](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1619) | BstNode_45 | 20%（2/10），运行待验 | 0 / 0 | DuskGraveyard · 400772 + 79 bytes |
| [n63](../Objects.level.bin对象实现清单.html#DuskMid%3An63) | BstNode_2279669773 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 31595 + 87 bytes |
| [n544](../Objects.level.bin对象实现清单.html#DuskMid%3An544) | BstNode_2279669779 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 119055 + 87 bytes |
| [n564](../Objects.level.bin对象实现清单.html#DuskMid%3An564) | BstNode_2279669775 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 122407 + 87 bytes |
| [n795](../Objects.level.bin对象实现清单.html#DuskMid%3An795) | BstNode_130 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 169708 + 80 bytes |
| [n964](../Objects.level.bin对象实现清单.html#DuskMid%3An964) | BstNode_129 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 205181 + 80 bytes |
| [n1105](../Objects.level.bin对象实现清单.html#DuskMid%3An1105) | BstNode_2279669780 | 20%（2/10），运行待验 | 0 / 0 | DuskMid · 229215 + 87 bytes |
| [n10](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An10) | BstNode_2345992671 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 17786 + 87 bytes |
| [n89](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An89) | BstNode_2345992668 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 34235 + 87 bytes |
| [n406](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An406) | BstNode_2345992674 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 104409 + 87 bytes |
| [n465](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An465) | BstNode_2345992673 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 117534 + 87 bytes |
| [n505](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An505) | BstNode_45 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 128954 + 79 bytes |
| [n556](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An556) | BstNode_2345992669 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 140317 + 87 bytes |
| [n747](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An747) | BstNode_2345992672 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 185609 + 87 bytes |
| [n929](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An929) | BstNode_2345992670 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 228707 + 87 bytes |
| [n976](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An976) | BstNode_2345992667 | 20%（2/10），运行待验 | 0 / 0 | Dusk_CrabField · 239387 + 87 bytes |
| [n29](../Objects.level.bin对象实现清单.html#NightEntrance%3An29) | BstNode_174 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 19449 + 80 bytes |
| [n92](../Objects.level.bin对象实现清单.html#NightEntrance%3An92) | BstNode_323 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 30950 + 80 bytes |
| [n415](../Objects.level.bin对象实现清单.html#NightEntrance%3An415) | BstNode_304 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 78184 + 80 bytes |
| [n444](../Objects.level.bin对象实现清单.html#NightEntrance%3An444) | BstNode_170 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 83706 + 80 bytes |
| [n504](../Objects.level.bin对象实现清单.html#NightEntrance%3An504) | BstNode_188 | 20%（2/10），运行待验 | 0 / 0 | NightEntrance · 91724 + 80 bytes |
| [n505](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An505) | BstNode_1482555416 | 20%（2/10），运行待验 | 0 / 1 | Prairie_Cave · 141066 + 87 bytes |
| [n133](../Objects.level.bin对象实现清单.html#Rain%3An133) | BstNode_2345992785 | 20%（2/10），运行待验 | 0 / 0 | Rain · 58293 + 87 bytes |
| [n323](../Objects.level.bin对象实现清单.html#Rain%3An323) | BstNode_2345992801 | 20%（2/10），运行待验 | 0 / 0 | Rain · 99940 + 87 bytes |
| [n636](../Objects.level.bin对象实现清单.html#Rain%3An636) | BstNode_2345992807 | 20%（2/10），运行待验 | 0 / 0 | Rain · 173073 + 87 bytes |
| [n994](../Objects.level.bin对象实现清单.html#Rain%3An994) | BstNode_2345992804 | 20%（2/10），运行待验 | 0 / 0 | Rain · 253082 + 87 bytes |
| [n1255](../Objects.level.bin对象实现清单.html#Rain%3An1255) | BstNode_2345992783 | 20%（2/10），运行待验 | 0 / 0 | Rain · 309112 + 87 bytes |
| [n1326](../Objects.level.bin对象实现清单.html#Rain%3An1326) | BstNode_2345992803 | 20%（2/10），运行待验 | 0 / 0 | Rain · 323169 + 87 bytes |
| [n1572](../Objects.level.bin对象实现清单.html#Rain%3An1572) | BstNode_2345992802 | 20%（2/10），运行待验 | 0 / 0 | Rain · 378624 + 87 bytes |
| [n1644](../Objects.level.bin对象实现清单.html#Rain%3An1644) | BstNode_2345992800 | 20%（2/10），运行待验 | 0 / 0 | Rain · 394910 + 87 bytes |
| [n270](../Objects.level.bin对象实现清单.html#RainEnd%3An270) | BstNode_2345992801 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 93633 + 87 bytes |
| [n339](../Objects.level.bin对象实现清单.html#RainEnd%3An339) | BstNode_2345992803 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 110661 + 87 bytes |
| [n867](../Objects.level.bin对象实现清单.html#RainEnd%3An867) | BstNode_2345992804 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 236575 + 87 bytes |
| [n1170](../Objects.level.bin对象实现清单.html#RainEnd%3An1170) | BstNode_2345992800 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 307828 + 87 bytes |
| [n1230](../Objects.level.bin对象实现清单.html#RainEnd%3An1230) | BstNode_2345992802 | 20%（2/10），运行待验 | 0 / 0 | RainEnd · 323747 + 87 bytes |
| [n134](../Objects.level.bin对象实现清单.html#RainForest%3An134) | BstNode_2345992785 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 48098 + 87 bytes |
| [n244](../Objects.level.bin对象实现清单.html#RainForest%3An244) | BstNode_2345992694 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 69977 + 87 bytes |
| [n246](../Objects.level.bin对象实现清单.html#RainForest%3An246) | BstNode_2345992806 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 70483 + 87 bytes |
| [n311](../Objects.level.bin对象实现清单.html#RainForest%3An311) | BstNode_2345992782 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 80801 + 87 bytes |
| [n408](../Objects.level.bin对象实现清单.html#RainForest%3An408) | BstNode_2345992805 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 94459 + 87 bytes |
| [n569](../Objects.level.bin对象实现清单.html#RainForest%3An569) | BstNode_2345992801 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 131581 + 87 bytes |
| [n615](../Objects.level.bin对象实现清单.html#RainForest%3An615) | BstNode_2345992616 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 141815 + 87 bytes |
| [n650](../Objects.level.bin对象实现清单.html#RainForest%3An650) | BstNode_2345992784 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 149661 + 87 bytes |
| [n689](../Objects.level.bin对象实现清单.html#RainForest%3An689) | BstNode_2345992783 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 158105 + 87 bytes |
| [n999](../Objects.level.bin对象实现清单.html#RainForest%3An999) | BstNode_2345992781 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 230659 + 87 bytes |
| [n1006](../Objects.level.bin对象实现清单.html#RainForest%3An1006) | BstNode_2345992780 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 231589 + 87 bytes |
| [n1031](../Objects.level.bin对象实现清单.html#RainForest%3An1031) | BstNode_2345992807 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 235116 + 87 bytes |
| [n1055](../Objects.level.bin对象实现清单.html#RainForest%3An1055) | BstNode_2345992800 | 20%（2/10），运行待验 | 0 / 0 | RainForest · 238529 + 87 bytes |
| [n20](../Objects.level.bin对象实现清单.html#RainMid%3An20) | BstNode_2345992678 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 29996 + 87 bytes |
| [n228](../Objects.level.bin对象实现清单.html#RainMid%3An228) | BstNode_2345992677 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 71562 + 87 bytes |
| [n364](../Objects.level.bin对象实现清单.html#RainMid%3An364) | BstNode_2345992683 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 94967 + 87 bytes |
| [n710](../Objects.level.bin对象实现清单.html#RainMid%3An710) | BstNode_2345992670 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 160667 + 87 bytes |
| [n755](../Objects.level.bin对象实现清单.html#RainMid%3An755) | BstNode_2345992682 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 167568 + 87 bytes |
| [n809](../Objects.level.bin对象实现清单.html#RainMid%3An809) | BstNode_2345992680 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 178537 + 87 bytes |
| [n980](../Objects.level.bin对象实现清单.html#RainMid%3An980) | BstNode_2345992672 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 204490 + 87 bytes |
| [n1184](../Objects.level.bin对象实现清单.html#RainMid%3An1184) | BstNode_2345992684 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 243124 + 87 bytes |
| [n1643](../Objects.level.bin对象实现清单.html#RainMid%3An1643) | BstNode_2345992685 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 330258 + 87 bytes |
| [n1706](../Objects.level.bin对象实现清单.html#RainMid%3An1706) | BstNode_2345992681 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 340276 + 87 bytes |
| [n1716](../Objects.level.bin对象实现清单.html#RainMid%3An1716) | BstNode_2345992686 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 341902 + 87 bytes |
| [n1745](../Objects.level.bin对象实现清单.html#RainMid%3An1745) | BstNode_2345992674 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 346370 + 87 bytes |
| [n1760](../Objects.level.bin对象实现清单.html#RainMid%3An1760) | BstNode_2345992679 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 349093 + 87 bytes |
| [n1801](../Objects.level.bin对象实现清单.html#RainMid%3An1801) | BstNode_2345992676 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 356115 + 87 bytes |
| [n2179](../Objects.level.bin对象实现清单.html#RainMid%3An2179) | BstNode_2345992675 | 20%（2/10），运行待验 | 0 / 0 | RainMid · 421977 + 87 bytes |
| [n56](../Objects.level.bin对象实现清单.html#SkyHub2%3An56) | BstNode_1049166005 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 42763 + 87 bytes |
| [n74](../Objects.level.bin对象实现清单.html#SkyHub2%3An74) | BstNode_1049165898 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 46542 + 87 bytes |
| [n115](../Objects.level.bin对象实现清单.html#SkyHub2%3An115) | BstNode_1049165994 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 53919 + 87 bytes |
| [n623](../Objects.level.bin对象实现清单.html#SkyHub2%3An623) | BstNode_1049166006 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 148935 + 87 bytes |
| [n716](../Objects.level.bin对象实现清单.html#SkyHub2%3An716) | BstNode_1049165995 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 164920 + 87 bytes |
| [n742](../Objects.level.bin对象实现清单.html#SkyHub2%3An742) | BstNode_1049166001 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 169284 + 87 bytes |
| [n909](../Objects.level.bin对象实现清单.html#SkyHub2%3An909) | BstNode_1049166004 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 198851 + 87 bytes |
| [n945](../Objects.level.bin对象实现清单.html#SkyHub2%3An945) | BstNode_1049165998 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 205303 + 87 bytes |
| [n990](../Objects.level.bin对象实现清单.html#SkyHub2%3An990) | BstNode_1049166002 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 212522 + 87 bytes |
| [n1168](../Objects.level.bin对象实现清单.html#SkyHub2%3An1168) | BstNode_1049165897 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 245115 + 87 bytes |
| [n1176](../Objects.level.bin对象实现清单.html#SkyHub2%3An1176) | BstNode_1049165896 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 246531 + 87 bytes |
| [n1191](../Objects.level.bin对象实现清单.html#SkyHub2%3An1191) | BstNode_1049166003 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 249483 + 87 bytes |
| [n1222](../Objects.level.bin对象实现清单.html#SkyHub2%3An1222) | BstNode_1049165999 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 254495 + 87 bytes |
| [n1232](../Objects.level.bin对象实现清单.html#SkyHub2%3An1232) | BstNode_1049165996 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 256041 + 87 bytes |
| [n1238](../Objects.level.bin对象实现清单.html#SkyHub2%3An1238) | BstNode_1049166007 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 257536 + 87 bytes |
| [n1451](../Objects.level.bin对象实现清单.html#SkyHub2%3An1451) | BstNode_1049165900 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 283844 + 87 bytes |
| [n1550](../Objects.level.bin对象实现清单.html#SkyHub2%3An1550) | BstNode_1049165997 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 298725 + 87 bytes |
| [n1705](../Objects.level.bin对象实现清单.html#SkyHub2%3An1705) | BstNode_1167523914 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 324060 + 87 bytes |
| [n1901](../Objects.level.bin对象实现清单.html#SkyHub2%3An1901) | BstNode_1049166000 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 358956 + 87 bytes |
| [n2213](../Objects.level.bin对象实现清单.html#SkyHub2%3An2213) | BstNode_1049165907 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 418317 + 87 bytes |
| [n2214](../Objects.level.bin对象实现清单.html#SkyHub2%3An2214) | BstNode_1167523916 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 418404 + 87 bytes |
| [n2299](../Objects.level.bin对象实现清单.html#SkyHub2%3An2299) | BstNode_1167523915 | 20%（2/10），运行待验 | 0 / 0 | SkyHub2 · 433225 + 87 bytes |
| [n11](../Objects.level.bin对象实现清单.html#Sunset%3An11) | BstNode_1167523864 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 28174 + 87 bytes |
| [n138](../Objects.level.bin对象实现清单.html#Sunset%3An138) | BstNode_1167523851 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 50641 + 87 bytes |
| [n221](../Objects.level.bin对象实现清单.html#Sunset%3An221) | BstNode_1049166176 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 68424 + 87 bytes |
| [n342](../Objects.level.bin对象实现清单.html#Sunset%3An342) | BstNode_840695844 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 93201 + 86 bytes |
| [n344](../Objects.level.bin对象实现清单.html#Sunset%3An344) | BstNode_840695853 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 93328 + 86 bytes |
| [n365](../Objects.level.bin对象实现清单.html#Sunset%3An365) | BstNode_840695854 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 96899 + 86 bytes |
| [n431](../Objects.level.bin对象实现清单.html#Sunset%3An431) | BstNode_1167523863 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 106720 + 87 bytes |
| [n722](../Objects.level.bin对象实现清单.html#Sunset%3An722) | BstNode_1049166175 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 156149 + 87 bytes |
| [n816](../Objects.level.bin对象实现清单.html#Sunset%3An816) | BstNode_1049165883 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 170634 + 87 bytes |
| [n844](../Objects.level.bin对象实现清单.html#Sunset%3An844) | BstNode_1049165884 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 175442 + 87 bytes |
| [n849](../Objects.level.bin对象实现清单.html#Sunset%3An849) | BstNode_1049166172 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 176211 + 87 bytes |
| [n967](../Objects.level.bin对象实现清单.html#Sunset%3An967) | BstNode_1049166174 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 193775 + 87 bytes |
| [n1267](../Objects.level.bin对象实现清单.html#Sunset%3An1267) | BstNode_1167523990 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 240249 + 87 bytes |
| [n1457](../Objects.level.bin对象实现清单.html#Sunset%3An1457) | BstNode_1049165848 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 271149 + 87 bytes |
| [n1565](../Objects.level.bin对象实现清单.html#Sunset%3An1565) | BstNode_1167523865 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 289363 + 87 bytes |
| [n1584](../Objects.level.bin对象实现清单.html#Sunset%3An1584) | BstNode_1167523989 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 292650 + 87 bytes |
| [n1597](../Objects.level.bin对象实现清单.html#Sunset%3An1597) | BstNode_1167523987 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 294436 + 87 bytes |
| [n1648](../Objects.level.bin对象实现清单.html#Sunset%3An1648) | BstNode_1049165888 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 303572 + 87 bytes |
| [n1680](../Objects.level.bin对象实现清单.html#Sunset%3An1680) | BstNode_1167523984 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 309028 + 87 bytes |
| [n1695](../Objects.level.bin对象实现清单.html#Sunset%3An1695) | BstNode_1167523860 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 311999 + 87 bytes |
| [n1720](../Objects.level.bin对象实现清单.html#Sunset%3An1720) | BstNode_1049166120 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 316162 + 87 bytes |
| [n1722](../Objects.level.bin对象实现清单.html#Sunset%3An1722) | BstNode_1167523985 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 316321 + 87 bytes |
| [n1745](../Objects.level.bin对象实现清单.html#Sunset%3An1745) | BstNode_1049166173 | 20%（2/10），运行待验 | 0 / 1 | Sunset · 320638 + 87 bytes |
| [n505](../Objects.level.bin对象实现清单.html#SunsetEnd%3An505) | BstNode_1482555952 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 113755 + 87 bytes |
| [n675](../Objects.level.bin对象实现清单.html#SunsetEnd%3An675) | BstNode_1167524492 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 138265 + 87 bytes |
| [n811](../Objects.level.bin对象实现清单.html#SunsetEnd%3An811) | BstNode_2279669874 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 161508 + 87 bytes |
| [n1417](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1417) | BstNode_1482555959 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 266920 + 87 bytes |
| [n1605](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1605) | BstNode_840695983 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 299484 + 86 bytes |
| [n1679](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1679) | BstNode_840695984 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 313698 + 86 bytes |
| [n1765](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1765) | BstNode_840696057 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 331574 + 86 bytes |
| [n1814](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1814) | BstNode_840695818 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 342737 + 86 bytes |
| [n1820](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1820) | BstNode_1167524161 | 20%（2/10），运行待验 | 0 / 0 | SunsetEnd · 344138 + 87 bytes |
| [n72](../Objects.level.bin对象实现清单.html#SunsetRace%3An72) | BstNode_1167524423 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 35728 + 87 bytes |
| [n179](../Objects.level.bin对象实现清单.html#SunsetRace%3An179) | BstNode_1167523979 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 54179 + 87 bytes |
| [n357](../Objects.level.bin对象实现清单.html#SunsetRace%3An357) | BstNode_1167524142 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 90822 + 87 bytes |
| [n432](../Objects.level.bin对象实现清单.html#SunsetRace%3An432) | BstNode_1167523939 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 109694 + 87 bytes |
| [n648](../Objects.level.bin对象实现清单.html#SunsetRace%3An648) | BstNode_1049165864 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 151960 + 87 bytes |
| [n886](../Objects.level.bin对象实现清单.html#SunsetRace%3An886) | BstNode_1167523997 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 193734 + 87 bytes |
| [n1295](../Objects.level.bin对象实现清单.html#SunsetRace%3An1295) | BstNode_1167523894 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 265249 + 87 bytes |
| [n1498](../Objects.level.bin对象实现清单.html#SunsetRace%3An1498) | BstNode_1167523879 | 20%（2/10），运行待验 | 0 / 0 | SunsetRace · 305212 + 87 bytes |
