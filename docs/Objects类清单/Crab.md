# Crab 单独类功能实现清单

功能分类：生物、群体与 AI。

此类职责：**螃蟹实例**。

类清单进度 40%（4/10），140 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：Crab 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 3 项。
- [ ] 螃蟹实例（部分完成）：原 Load／CrabAi.Initialize、自己的 CrabIdle／GoSit2／UISit 初始化、保存字段与独立骨骼动作预览已有核验。原评分／比较／评分恢复／运动读取408组、群体转向105组、Begin／Seek／End132组均与原机器码零差异。完整 CrabAi.SelectState 新增87组、12,116,664字节、2,531次调用零差异；完整 CrabAi.Update 新增139组、19,358,808字节、827次调用零差异，覆盖各状态目标、探针引导、实际群体转向、连续帧缓存、速度与转向输出，组合入口连接实际选择／比较／评分／更新。数学、metadata和场景查询依赖仍为明确服务；完整 Crab.Update、原地面／世界碰撞、真实 Model 构造／克隆、动画／交互 owner、动态提交和卸载尚未完成。手动动作预览与AI子链核验不作为完整生物验收，完整运行类仍未增加。 本轮CrabBarn归属分配49组、完整Barn.Update18组原对照零差异：指定owner优先、无指定owner按玩家轮转、零玩家除法故障、流收发分支与回调后128字节交互历史／计数复制保持原顺序。本次完整NetState／Receive／Send与实际Barn.Update组合176组、46,303,232字节、853次有序服务调用原对照零差异。保留私有目标引用转换、120字节scratch未写字段、所有权跳过、捕获发送名单、实时解码计数、重叠写回和每蟹计时器；接收计数没有默认输入，必须由解码器输出。真实网络owner、Crab外层运动／碰撞及Model／动画／GPU生命周期仍待接。 本次完整包字段编解码、实际BinaryStream位／字节／整数／量化／布尔／向量与PlayerId上下文和NetPlayerBarn映射已恢复，并接实际Barn收发；432组、113,345,280字节、489次metadata／流查找调用原对照零差异。真实缓冲中的包字节、读回字段、对齐／游标／有效位、越界与NaN断言均核验；上下文2失败读取的原私有字节须显式提供。真实传输／场景、外层运动碰撞、Model／动画／GPU和切图生命周期仍待接。
- [ ] 依赖调用与事件：CrabParams（140 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原 Load／CrabAi.Initialize、自己的 CrabIdle／GoSit2／UISit 初始化、保存字段与独立骨骼动作预览已有核验。原评分／比较／评分恢复／运动读取408组、群体转向105组、Begin／Seek／End132组均与原机器码零差异。完整 CrabAi.SelectState 新增87组、12,116,664字节、2,531次调用零差异；完整 CrabAi.Update 新增139组、19,358,808字节、827次调用零差异，覆盖各状态目标、探针引导、实际群体转向、连续帧缓存、速度与转向输出，组合入口连接实际选择／比较／评分／更新。数学、metadata和场景查询依赖仍为明确服务；完整 Crab.Update、原地面／世界碰撞、真实 Model 构造／克隆、动画／交互 owner、动态提交和卸载尚未完成。手动动作预览与AI子链核验不作为完整生物验收，完整运行类仍未增加。 本轮CrabBarn归属分配49组、完整Barn.Update18组原对照零差异：指定owner优先、无指定owner按玩家轮转、零玩家除法故障、流收发分支与回调后128字节交互历史／计数复制保持原顺序。本次完整NetState／Receive／Send与实际Barn.Update组合176组、46,303,232字节、853次有序服务调用原对照零差异。保留私有目标引用转换、120字节scratch未写字段、所有权跳过、捕获发送名单、实时解码计数、重叠写回和每蟹计时器；接收计数没有默认输入，必须由解码器输出。真实网络owner、Crab外层运动／碰撞及Model／动画／GPU生命周期仍待接。 本次完整包字段编解码、实际BinaryStream位／字节／整数／量化／布尔／向量与PlayerId上下文和NetPlayerBarn映射已恢复，并接实际Barn收发；432组、113,345,280字节、489次metadata／流查找调用原对照零差异。真实缓冲中的包字节、读回字段、对齐／游标／有效位、越界与NaN断言均核验；上下文2失败读取的原私有字节须显式提供。真实传输／场景、外层运动碰撞、Model／动画／GPU和切图生命周期仍待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 Load／CrabAi.Initialize、自己的 CrabIdle／GoSit2／UISit 初始化、保存字段与独立骨骼动作预览已有核验。原评分／比较／评分恢复／运动读取408组、群体转向105组、Begin／Seek／End132组均与原机器码零差异。完整 CrabAi.SelectState 新增87组、12,116,664字节、2,531次调用零差异；完整 CrabAi.Update 新增139组、19,358,808字节、827次调用零差异，覆盖各状态目标、探针引导、实际群体转向、连续帧缓存、速度与转向输出，组合入口连接实际选择／比较／评分／更新。数学、metadata和场景查询依赖仍为明确服务；完整 Crab.Update、原地面／世界碰撞、真实 Model 构造／克隆、动画／交互 owner、动态提交和卸载尚未完成。手动动作预览与AI子链核验不作为完整生物验收，完整运行类仍未增加。 本轮CrabBarn归属分配49组、完整Barn.Update18组原对照零差异：指定owner优先、无指定owner按玩家轮转、零玩家除法故障、流收发分支与回调后128字节交互历史／计数复制保持原顺序。本次完整NetState／Receive／Send与实际Barn.Update组合176组、46,303,232字节、853次有序服务调用原对照零差异。保留私有目标引用转换、120字节scratch未写字段、所有权跳过、捕获发送名单、实时解码计数、重叠写回和每蟹计时器；接收计数没有默认输入，必须由解码器输出。真实网络owner、Crab外层运动／碰撞及Model／动画／GPU生命周期仍待接。 本次完整包字段编解码、实际BinaryStream位／字节／整数／量化／布尔／向量与PlayerId上下文和NetPlayerBarn映射已恢复，并接实际Barn收发；432组、113,345,280字节、489次metadata／流查找调用原对照零差异。真实缓冲中的包字节、读回字段、对齐／游标／有效位、越界与NaN断言均核验；上下文2失败读取的原私有字节须显式提供。真实传输／场景、外层运动碰撞、Model／动画／GPU和切图生命周期仍待接。
- [x] 明确范围的原核心子链已独立核验：原 Load／CrabAi.Initialize、自己的 CrabIdle／GoSit2／UISit 初始化、保存字段与独立骨骼动作预览已有核验。原评分／比较／评分恢复／运动读取408组、群体转向105组、Begin／Seek／End132组均与原机器码零差异。完整 CrabAi.SelectState 新增87组、12,116,664字节、2,531次调用零差异；完整 CrabAi.Update 新增139组、19,358,808字节、827次调用零差异，覆盖各状态目标、探针引导、实际群体转向、连续帧缓存、速度与转向输出，组合入口连接实际选择／比较／评分／更新。数学、metadata和场景查询依赖仍为明确服务；完整 Crab.Update、原地面／世界碰撞、真实 Model 构造／克隆、动画／交互 owner、动态提交和卸载尚未完成。手动动作预览与AI子链核验不作为完整生物验收，完整运行类仍未增加。 本轮CrabBarn归属分配49组、完整Barn.Update18组原对照零差异：指定owner优先、无指定owner按玩家轮转、零玩家除法故障、流收发分支与回调后128字节交互历史／计数复制保持原顺序。本次完整NetState／Receive／Send与实际Barn.Update组合176组、46,303,232字节、853次有序服务调用原对照零差异。保留私有目标引用转换、120字节scratch未写字段、所有权跳过、捕获发送名单、实时解码计数、重叠写回和每蟹计时器；接收计数没有默认输入，必须由解码器输出。真实网络owner、Crab外层运动／碰撞及Model／动画／GPU生命周期仍待接。 本次完整包字段编解码、实际BinaryStream位／字节／整数／量化／布尔／向量与PlayerId上下文和NetPlayerBarn映射已恢复，并接实际Barn收发；432组、113,345,280字节、489次metadata／流查找调用原对照零差异。真实缓冲中的包字节、读回字段、对齐／游标／有效位、越界与NaN断言均核验；上下文2失败读取的原私有字节须显式提供。真实传输／场景、外层运动碰撞、Model／动画／GPU和切图生命周期仍待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原 Load／CrabAi.Initialize、自己的 CrabIdle／GoSit2／UISit 初始化、保存字段与独立骨骼动作预览已有核验。原评分／比较／评分恢复／运动读取408组、群体转向105组、Begin／Seek／End132组均与原机器码零差异。完整 CrabAi.SelectState 新增87组、12,116,664字节、2,531次调用零差异；完整 CrabAi.Update 新增139组、19,358,808字节、827次调用零差异，覆盖各状态目标、探针引导、实际群体转向、连续帧缓存、速度与转向输出，组合入口连接实际选择／比较／评分／更新。数学、metadata和场景查询依赖仍为明确服务；完整 Crab.Update、原地面／世界碰撞、真实 Model 构造／克隆、动画／交互 owner、动态提交和卸载尚未完成。手动动作预览与AI子链核验不作为完整生物验收，完整运行类仍未增加。 本轮CrabBarn归属分配49组、完整Barn.Update18组原对照零差异：指定owner优先、无指定owner按玩家轮转、零玩家除法故障、流收发分支与回调后128字节交互历史／计数复制保持原顺序。本次完整NetState／Receive／Send与实际Barn.Update组合176组、46,303,232字节、853次有序服务调用原对照零差异。保留私有目标引用转换、120字节scratch未写字段、所有权跳过、捕获发送名单、实时解码计数、重叠写回和每蟹计时器；接收计数没有默认输入，必须由解码器输出。真实网络owner、Crab外层运动／碰撞及Model／动画／GPU生命周期仍待接。 本次完整包字段编解码、实际BinaryStream位／字节／整数／量化／布尔／向量与PlayerId上下文和NetPlayerBarn映射已恢复，并接实际Barn收发；432组、113,345,280字节、489次metadata／流查找调用原对照零差异。真实缓冲中的包字节、读回字段、对齐／游标／有效位、越界与NaN断言均核验；上下文2失败读取的原私有字节须显式提供。真实传输／场景、外层运动碰撞、Model／动画／GPU和切图生命周期仍待接。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Crab) · [原字段、进度与全部实例 JSON](Crab.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n0](../Objects.level.bin对象实现清单.html#Dusk%3An0) | BstNode_206 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 23787 + 85 bytes |
| [n282](../Objects.level.bin对象实现清单.html#Dusk%3An282) | BstNode_214 | 20%（2/10），运行待验 | 1 / 0 | Dusk · 75180 + 85 bytes |
| [n10](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An10) | BstNode_274 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 25646 + 85 bytes |
| [n1301](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1301) | BstNode_196 | 20%（2/10），运行待验 | 1 / 0 | DuskGraveyard · 324110 + 85 bytes |
| [n1](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1) | BstNode_206 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 15281 + 85 bytes |
| [n6](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An6) | BstNode_2529558544 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 16663 + 92 bytes |
| [n18](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An18) | BstNode_2529558621 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 19416 + 92 bytes |
| [n20](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An20) | BstNode_2529558609 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 19899 + 92 bytes |
| [n24](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An24) | BstNode_2529558635 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 20529 + 92 bytes |
| [n27](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An27) | BstNode_2529558547 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 21208 + 92 bytes |
| [n34](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An34) | BstNode_2529558623 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 22106 + 92 bytes |
| [n36](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An36) | BstNode_2529558640 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 22364 + 92 bytes |
| [n42](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An42) | BstNode_2529558571 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 24171 + 92 bytes |
| [n51](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An51) | BstNode_2529558611 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 26136 + 92 bytes |
| [n52](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An52) | BstNode_2529558591 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 26228 + 92 bytes |
| [n59](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An59) | BstNode_2529558572 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 27268 + 92 bytes |
| [n66](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An66) | BstNode_2529558541 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 29440 + 92 bytes |
| [n68](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An68) | BstNode_2529558606 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 29958 + 92 bytes |
| [n73](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An73) | BstNode_2529558646 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 31230 + 92 bytes |
| [n78](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An78) | BstNode_2529558618 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 32338 + 92 bytes |
| [n81](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An81) | BstNode_2529558662 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 32711 + 92 bytes |
| [n91](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An91) | BstNode_2529558564 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 34470 + 92 bytes |
| [n92](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An92) | BstNode_2529558630 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 34562 + 92 bytes |
| [n97](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An97) | BstNode_2529558550 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 35993 + 92 bytes |
| [n101](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An101) | BstNode_2529558540 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 36808 + 92 bytes |
| [n111](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An111) | BstNode_2529558532 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 39305 + 92 bytes |
| [n119](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An119) | BstNode_2529558556 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 41290 + 92 bytes |
| [n141](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An141) | BstNode_2529558565 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 45822 + 92 bytes |
| [n188](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An188) | BstNode_2529558629 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 58289 + 92 bytes |
| [n192](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An192) | BstNode_2529558652 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 59100 + 92 bytes |
| [n194](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An194) | BstNode_2529558656 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 59264 + 92 bytes |
| [n205](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An205) | BstNode_2529558631 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 61776 + 92 bytes |
| [n234](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An234) | BstNode_2529558554 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 68181 + 92 bytes |
| [n236](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An236) | BstNode_2529558581 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 68332 + 92 bytes |
| [n238](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An238) | BstNode_2529558590 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 68586 + 92 bytes |
| [n255](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An255) | BstNode_2529558578 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 72393 + 92 bytes |
| [n256](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An256) | BstNode_2529558542 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 72485 + 92 bytes |
| [n263](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An263) | BstNode_2529558622 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 73930 + 92 bytes |
| [n265](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An265) | BstNode_2529558620 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 74188 + 92 bytes |
| [n266](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An266) | BstNode_2529558636 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 74280 + 92 bytes |
| [n296](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An296) | BstNode_2529558625 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 81063 + 92 bytes |
| [n303](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An303) | BstNode_2529558559 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 81937 + 92 bytes |
| [n310](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An310) | BstNode_2529558579 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 83675 + 92 bytes |
| [n318](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An318) | BstNode_2529558619 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 85573 + 92 bytes |
| [n325](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An325) | BstNode_2529558649 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 87015 + 92 bytes |
| [n326](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An326) | BstNode_2529558628 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 87107 + 92 bytes |
| [n328](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An328) | BstNode_2529558585 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 87590 + 92 bytes |
| [n348](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An348) | BstNode_2529558584 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 92500 + 92 bytes |
| [n383](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An383) | BstNode_2529558634 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 100413 + 92 bytes |
| [n386](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An386) | BstNode_2529558531 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 101287 + 92 bytes |
| [n403](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An403) | BstNode_2529558558 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 103834 + 92 bytes |
| [n404](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An404) | BstNode_2529558586 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 103926 + 92 bytes |
| [n409](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An409) | BstNode_2529558613 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 105306 + 92 bytes |
| [n422](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An422) | BstNode_2529558543 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 108652 + 92 bytes |
| [n426](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An426) | BstNode_2529558605 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 109713 + 92 bytes |
| [n431](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An431) | BstNode_2529558602 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 110296 + 92 bytes |
| [n460](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An460) | BstNode_2529558627 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 116591 + 92 bytes |
| [n468](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An468) | BstNode_2529558566 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 118307 + 92 bytes |
| [n477](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An477) | BstNode_2529558592 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 121511 + 92 bytes |
| [n483](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An483) | BstNode_2529558659 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 123030 + 92 bytes |
| [n490](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An490) | BstNode_214 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 124823 + 85 bytes |
| [n499](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An499) | BstNode_2529558638 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 127324 + 92 bytes |
| [n506](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An506) | BstNode_2529558653 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 129033 + 92 bytes |
| [n521](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An521) | BstNode_2529558533 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 133238 + 92 bytes |
| [n524](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An524) | BstNode_2529558624 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 133883 + 92 bytes |
| [n529](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An529) | BstNode_2529558645 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 135289 + 92 bytes |
| [n531](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An531) | BstNode_2529558654 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 135543 + 92 bytes |
| [n535](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An535) | BstNode_2529558601 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 136306 + 92 bytes |
| [n548](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An548) | BstNode_2529558661 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 139160 + 92 bytes |
| [n549](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An549) | BstNode_2529558576 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 139252 + 92 bytes |
| [n551](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An551) | BstNode_2529558644 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 139502 + 92 bytes |
| [n555](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An555) | BstNode_2529558549 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 140225 + 92 bytes |
| [n561](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An561) | BstNode_2529558617 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 141544 + 92 bytes |
| [n570](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An570) | BstNode_2529558626 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 143733 + 92 bytes |
| [n577](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An577) | BstNode_2529558583 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 145478 + 92 bytes |
| [n599](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An599) | BstNode_2529558603 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 149885 + 92 bytes |
| [n601](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An601) | BstNode_2529558567 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 150006 + 92 bytes |
| [n614](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An614) | BstNode_2529558563 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 152913 + 92 bytes |
| [n618](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An618) | BstNode_2529558561 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 153913 + 92 bytes |
| [n630](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An630) | BstNode_2529558588 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 157192 + 92 bytes |
| [n656](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An656) | BstNode_2529558632 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 164940 + 92 bytes |
| [n661](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An661) | BstNode_2529558648 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 166354 + 92 bytes |
| [n664](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An664) | BstNode_2529558569 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 166986 + 92 bytes |
| [n675](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An675) | BstNode_2529558551 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 169547 + 92 bytes |
| [n694](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An694) | BstNode_2529558642 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 174086 + 92 bytes |
| [n698](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An698) | BstNode_2529558587 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 175089 + 92 bytes |
| [n713](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An713) | BstNode_2529558643 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 177545 + 92 bytes |
| [n720](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An720) | BstNode_2529558607 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 179276 + 92 bytes |
| [n727](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An727) | BstNode_2529558595 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 180768 + 92 bytes |
| [n736](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An736) | BstNode_2529558596 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 183257 + 92 bytes |
| [n740](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An740) | BstNode_2529558663 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 184162 + 92 bytes |
| [n763](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An763) | BstNode_2529558650 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 190383 + 92 bytes |
| [n788](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An788) | BstNode_2529558574 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 195928 + 92 bytes |
| [n805](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An805) | BstNode_2529558546 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 199661 + 92 bytes |
| [n824](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An824) | BstNode_2529558637 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 204650 + 92 bytes |
| [n835](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An835) | BstNode_2529558600 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 206868 + 92 bytes |
| [n840](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An840) | BstNode_2529558597 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 207722 + 92 bytes |
| [n862](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An862) | BstNode_2529558614 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 213108 + 92 bytes |
| [n872](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An872) | BstNode_2529558552 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 216007 + 92 bytes |
| [n879](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An879) | BstNode_2529558536 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 217366 + 92 bytes |
| [n907](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An907) | BstNode_2529558660 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 224023 + 92 bytes |
| [n915](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An915) | BstNode_2529558616 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 225813 + 92 bytes |
| [n923](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An923) | BstNode_2529558539 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 227406 + 92 bytes |
| [n939](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An939) | BstNode_2529558615 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 231031 + 92 bytes |
| [n943](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An943) | BstNode_2529558555 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 231494 + 92 bytes |
| [n948](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An948) | BstNode_2529558545 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 232377 + 92 bytes |
| [n965](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An965) | BstNode_2529558582 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 235663 + 92 bytes |
| [n970](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An970) | BstNode_2529558553 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 237422 + 92 bytes |
| [n978](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An978) | BstNode_2529558594 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 239640 + 92 bytes |
| [n980](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An980) | BstNode_2529558580 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 239898 + 92 bytes |
| [n981](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An981) | BstNode_2529558538 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 239990 + 92 bytes |
| [n984](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An984) | BstNode_2529558557 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 240371 + 92 bytes |
| [n985](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An985) | BstNode_2529558562 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 240463 + 92 bytes |
| [n986](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An986) | BstNode_2529558577 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 240555 + 92 bytes |
| [n990](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An990) | BstNode_2529558655 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 241645 + 92 bytes |
| [n991](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An991) | BstNode_2529558610 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 241737 + 92 bytes |
| [n992](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An992) | BstNode_2529558560 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 241829 + 92 bytes |
| [n993](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An993) | BstNode_2529558612 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 241921 + 92 bytes |
| [n999](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An999) | BstNode_2529558633 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 242660 + 92 bytes |
| [n1000](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1000) | BstNode_2529558657 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 242752 + 92 bytes |
| [n1001](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1001) | BstNode_2529558641 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 242844 + 92 bytes |
| [n1004](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1004) | BstNode_2529558647 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 243743 + 92 bytes |
| [n1018](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1018) | BstNode_2529558608 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 248068 + 92 bytes |
| [n1022](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1022) | BstNode_2529558570 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 248889 + 92 bytes |
| [n1025](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1025) | BstNode_2529558598 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 249219 + 92 bytes |
| [n1028](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1028) | BstNode_2529558639 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 249626 + 92 bytes |
| [n1030](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1030) | BstNode_2529558548 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 249836 + 92 bytes |
| [n1034](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1034) | BstNode_2529558658 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 250453 + 92 bytes |
| [n1036](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1036) | BstNode_2529558651 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 250837 + 92 bytes |
| [n1065](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1065) | BstNode_2529558575 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 258437 + 92 bytes |
| [n1072](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1072) | BstNode_2529558573 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 259818 + 92 bytes |
| [n1078](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An1078) | BstNode_2529558599 | 20%（2/10），运行待验 | 1 / 0 | Dusk_CrabField · 260724 + 92 bytes |
| [n1162](../Objects.level.bin对象实现清单.html#RainEnd%3An1162) | BstNode_2060386399 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 305635 + 92 bytes |
| [n1605](../Objects.level.bin对象实现清单.html#RainEnd%3An1605) | BstNode_2060386405 | 20%（2/10），运行待验 | 1 / 0 | RainEnd · 405067 + 92 bytes |
| [n133](../Objects.level.bin对象实现清单.html#Storm%3An133) | BstNode_2529559754 | 20%（2/10），运行待验 | 1 / 0 | Storm · 46931 + 92 bytes |
| [n418](../Objects.level.bin对象实现清单.html#Storm%3An418) | BstNode_2529559753 | 20%（2/10），运行待验 | 1 / 0 | Storm · 98368 + 92 bytes |
| [n525](../Objects.level.bin对象实现清单.html#Storm%3An525) | BstNode_214 | 20%（2/10），运行待验 | 1 / 0 | Storm · 117142 + 85 bytes |
| [n1235](../Objects.level.bin对象实现清单.html#Storm%3An1235) | BstNode_2529559701 | 20%（2/10），运行待验 | 1 / 0 | Storm · 244376 + 92 bytes |
| [n1262](../Objects.level.bin对象实现清单.html#Storm%3An1262) | BstNode_2529559752 | 20%（2/10），运行待验 | 1 / 0 | Storm · 249049 + 92 bytes |
| [n1567](../Objects.level.bin对象实现清单.html#Storm%3An1567) | BstNode_2529560140 | 20%（2/10），运行待验 | 1 / 0 | Storm · 298925 + 92 bytes |
