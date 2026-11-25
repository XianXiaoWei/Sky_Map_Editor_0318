# PlayAnimation 单独类功能实现清单

功能分类：动画、回放与装扮。

此类职责：**对象动画序列、速度与状态**。

类清单进度 40%（4/10），187 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：PlayAnimation 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 8 项。
- [ ] 对象动画序列、速度与状态（部分完成）：原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。
- [ ] 依赖调用与事件（部分完成）：Clump（187 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。
- [x] 明确范围的原核心子链已独立核验：原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。
- [ ] Windows 真机与原游戏验收

原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=PlayAnimation) · [原字段、进度与全部实例 JSON](PlayAnimation.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n9](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An9) | BstNode_2504654943 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 18923 + 59 bytes |
| [n17](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An17) | BstNode_2504654889 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 20047 + 62 bytes |
| [n124](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An124) | BstNode_2504654958 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 34187 + 64 bytes |
| [n134](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An134) | BstNode_2504654899 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 35410 + 63 bytes |
| [n152](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An152) | BstNode_2504654873 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 38273 + 63 bytes |
| [n243](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An243) | BstNode_2504654902 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 62614 + 61 bytes |
| [n264](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An264) | BstNode_2504654941 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 65909 + 63 bytes |
| [n489](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An489) | BstNode_2504654926 | 20%（2/10），运行待验 | 1 / 2 | CandleSpaceEnd · 104094 + 65 bytes |
| [n4](../Objects.level.bin对象实现清单.html#Dawn%3An4) | BstNode_1293287912 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 33396 + 50 bytes |
| [n20](../Objects.level.bin对象实现清单.html#Dawn%3An20) | BstNode_354 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 36659 + 42 bytes |
| [n77](../Objects.level.bin对象实现清单.html#Dawn%3An77) | BstNode_1293287838 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 45705 + 49 bytes |
| [n80](../Objects.level.bin对象实现清单.html#Dawn%3An80) | BstNode_21 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 46068 + 44 bytes |
| [n98](../Objects.level.bin对象实现清单.html#Dawn%3An98) | BstNode_1293287602 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 48929 + 52 bytes |
| [n103](../Objects.level.bin对象实现清单.html#Dawn%3An103) | BstNode_228 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 49324 + 42 bytes |
| [n128](../Objects.level.bin对象实现清单.html#Dawn%3An128) | BstNode_1842806872 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 54671 + 50 bytes |
| [n164](../Objects.level.bin对象实现清单.html#Dawn%3An164) | BstNode_1079 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 59005 + 44 bytes |
| [n170](../Objects.level.bin对象实现清单.html#Dawn%3An170) | BstNode_3122855981 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 60152 + 52 bytes |
| [n207](../Objects.level.bin对象实现清单.html#Dawn%3An207) | BstNode_1842806905 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 64287 + 49 bytes |
| [n233](../Objects.level.bin对象实现清单.html#Dawn%3An233) | BstNode_79 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 70894 + 41 bytes |
| [n261](../Objects.level.bin对象实现清单.html#Dawn%3An261) | BstNode_1293287895 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 76466 + 49 bytes |
| [n295](../Objects.level.bin对象实现清单.html#Dawn%3An295) | BstNode_1842806822 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 79626 + 49 bytes |
| [n306](../Objects.level.bin对象实现清单.html#Dawn%3An306) | BstNode_1293287573 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 81112 + 49 bytes |
| [n315](../Objects.level.bin对象实现清单.html#Dawn%3An315) | BstNode_1293287901 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 82207 + 52 bytes |
| [n342](../Objects.level.bin对象实现清单.html#Dawn%3An342) | BstNode_1293287899 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 85928 + 49 bytes |
| [n364](../Objects.level.bin对象实现清单.html#Dawn%3An364) | BstNode_1293287609 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 88805 + 49 bytes |
| [n415](../Objects.level.bin对象实现清单.html#Dawn%3An415) | BstNode_57 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 96060 + 44 bytes |
| [n577](../Objects.level.bin对象实现清单.html#Dawn%3An577) | BstNode_938 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 122681 + 37 bytes |
| [n595](../Objects.level.bin对象实现清单.html#Dawn%3An595) | BstNode_813 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 124587 + 44 bytes |
| [n724](../Objects.level.bin对象实现清单.html#Dawn%3An724) | BstNode_226 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 148197 + 42 bytes |
| [n725](../Objects.level.bin对象实现清单.html#Dawn%3An725) | BstNode_3122855975 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 148239 + 49 bytes |
| [n742](../Objects.level.bin对象实现清单.html#Dawn%3An742) | BstNode_757 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 151552 + 42 bytes |
| [n753](../Objects.level.bin对象实现清单.html#Dawn%3An753) | BstNode_75 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 152930 + 44 bytes |
| [n765](../Objects.level.bin对象实现清单.html#Dawn%3An765) | BstNode_1293287572 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 155202 + 49 bytes |
| [n840](../Objects.level.bin对象实现清单.html#Dawn%3An840) | BstNode_81 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 166442 + 42 bytes |
| [n843](../Objects.level.bin对象实现清单.html#Dawn%3An843) | BstNode_3122856175 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 167266 + 50 bytes |
| [n888](../Objects.level.bin对象实现清单.html#Dawn%3An888) | BstNode_1293287842 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 173979 + 49 bytes |
| [n920](../Objects.level.bin对象实现清单.html#Dawn%3An920) | BstNode_2446917692 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 177278 + 49 bytes |
| [n937](../Objects.level.bin对象实现清单.html#Dawn%3An937) | BstNode_1293287601 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 178918 + 50 bytes |
| [n974](../Objects.level.bin对象实现清单.html#Dawn%3An974) | BstNode_56 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 184560 + 41 bytes |
| [n990](../Objects.level.bin对象实现清单.html#Dawn%3An990) | BstNode_3122856233 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 186898 + 49 bytes |
| [n1071](../Objects.level.bin对象实现清单.html#Dawn%3An1071) | BstNode_1293287894 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 196667 + 49 bytes |
| [n1109](../Objects.level.bin对象实现清单.html#Dawn%3An1109) | BstNode_1842806907 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 202561 + 49 bytes |
| [n1122](../Objects.level.bin对象实现清单.html#Dawn%3An1122) | BstNode_1842806841 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 203810 + 50 bytes |
| [n1138](../Objects.level.bin对象实现清单.html#Dawn%3An1138) | BstNode_1293287571 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 205212 + 49 bytes |
| [n1329](../Objects.level.bin对象实现清单.html#Dawn%3An1329) | BstNode_2504654977 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 238893 + 58 bytes |
| [n1368](../Objects.level.bin对象实现清单.html#Dawn%3An1368) | BstNode_3122856142 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 242805 + 49 bytes |
| [n1459](../Objects.level.bin对象实现清单.html#Dawn%3An1459) | BstNode_3122856003 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 256505 + 49 bytes |
| [n1510](../Objects.level.bin对象实现清单.html#Dawn%3An1510) | BstNode_1293287553 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 264703 + 52 bytes |
| [n1531](../Objects.level.bin对象实现清单.html#Dawn%3An1531) | BstNode_1842806908 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 267391 + 49 bytes |
| [n1532](../Objects.level.bin对象实现清单.html#Dawn%3An1532) | BstNode_1293287857 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 267440 + 49 bytes |
| [n1610](../Objects.level.bin对象实现清单.html#Dawn%3An1610) | BstNode_1293287911 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 277095 + 49 bytes |
| [n1629](../Objects.level.bin对象实现清单.html#Dawn%3An1629) | BstNode_1293287915 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 279514 + 49 bytes |
| [n1756](../Objects.level.bin对象实现清单.html#Dawn%3An1756) | BstNode_239 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 298296 + 42 bytes |
| [n1828](../Objects.level.bin对象实现清单.html#Dawn%3An1828) | BstNode_1293287647 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 306380 + 49 bytes |
| [n1880](../Objects.level.bin对象实现清单.html#Dawn%3An1880) | BstNode_1293287543 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 312215 + 49 bytes |
| [n1971](../Objects.level.bin对象实现清单.html#Dawn%3An1971) | BstNode_1293287574 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 323125 + 49 bytes |
| [n2003](../Objects.level.bin对象实现清单.html#Dawn%3An2003) | BstNode_2446917691 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 328131 + 49 bytes |
| [n2048](../Objects.level.bin对象实现清单.html#Dawn%3An2048) | BstNode_1293287767 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 335706 + 52 bytes |
| [n2050](../Objects.level.bin对象实现清单.html#Dawn%3An2050) | BstNode_1293287850 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 335880 + 49 bytes |
| [n2114](../Objects.level.bin对象实现清单.html#Dawn%3An2114) | BstNode_1293287855 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 345987 + 49 bytes |
| [n2128](../Objects.level.bin对象实现清单.html#Dawn%3An2128) | BstNode_1293287844 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 348681 + 50 bytes |
| [n2136](../Objects.level.bin对象实现清单.html#Dawn%3An2136) | BstNode_1293287570 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 349779 + 49 bytes |
| [n2167](../Objects.level.bin对象实现清单.html#Dawn%3An2167) | BstNode_342 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 355681 + 42 bytes |
| [n2188](../Objects.level.bin对象实现清单.html#Dawn%3An2188) | BstNode_1293287645 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 360125 + 49 bytes |
| [n2249](../Objects.level.bin对象实现清单.html#Dawn%3An2249) | BstNode_3122855977 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 371170 + 49 bytes |
| [n2339](../Objects.level.bin对象实现清单.html#Dawn%3An2339) | BstNode_1842806906 | 20%（2/10），运行待验 | 1 / 0 | Dawn · 388865 + 49 bytes |
| [n2405](../Objects.level.bin对象实现清单.html#Dawn%3An2405) | BstNode_3122856008 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 400479 + 49 bytes |
| [n2406](../Objects.level.bin对象实现清单.html#Dawn%3An2406) | BstNode_3122855982 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 400528 + 50 bytes |
| [n2411](../Objects.level.bin对象实现清单.html#Dawn%3An2411) | BstNode_1293287549 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 400879 + 49 bytes |
| [n2415](../Objects.level.bin对象实现清单.html#Dawn%3An2415) | BstNode_1293287575 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 401659 + 49 bytes |
| [n2424](../Objects.level.bin对象实现清单.html#Dawn%3An2424) | BstNode_1293287544 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 402687 + 49 bytes |
| [n2433](../Objects.level.bin对象实现清单.html#Dawn%3An2433) | BstNode_1842806909 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 404141 + 50 bytes |
| [n2471](../Objects.level.bin对象实现清单.html#Dawn%3An2471) | BstNode_1293287769 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 411602 + 49 bytes |
| [n2502](../Objects.level.bin对象实现清单.html#Dawn%3An2502) | BstNode_1293287910 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 417308 + 49 bytes |
| [n2534](../Objects.level.bin对象实现清单.html#Dawn%3An2534) | BstNode_865 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 423255 + 38 bytes |
| [n2582](../Objects.level.bin对象实现清单.html#Dawn%3An2582) | BstNode_2446917697 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 430375 + 50 bytes |
| [n2644](../Objects.level.bin对象实现清单.html#Dawn%3An2644) | BstNode_25 | 20%（2/10），运行待验 | 1 / 1 | Dawn · 438646 + 42 bytes |
| [n2672](../Objects.level.bin对象实现清单.html#Dawn%3An2672) | BstNode_1021 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 442946 + 43 bytes |
| [n2677](../Objects.level.bin对象实现清单.html#Dawn%3An2677) | BstNode_1293287846 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 443727 + 50 bytes |
| [n2690](../Objects.level.bin对象实现清单.html#Dawn%3An2690) | BstNode_766 | 20%（2/10），运行待验 | 1 / 3 | Dawn · 445480 + 38 bytes |
| [n2728](../Objects.level.bin对象实现清单.html#Dawn%3An2728) | BstNode_58 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 451860 + 42 bytes |
| [n2790](../Objects.level.bin对象实现清单.html#Dawn%3An2790) | BstNode_1293287858 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 458470 + 52 bytes |
| [n2824](../Objects.level.bin对象实现清单.html#Dawn%3An2824) | BstNode_80 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 463302 + 41 bytes |
| [n2840](../Objects.level.bin对象实现清单.html#Dawn%3An2840) | BstNode_1293287545 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 465419 + 50 bytes |
| [n2903](../Objects.level.bin对象实现清单.html#Dawn%3An2903) | BstNode_1293287896 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 475876 + 50 bytes |
| [n2904](../Objects.level.bin对象实现清单.html#Dawn%3An2904) | BstNode_3122855976 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 475926 + 49 bytes |
| [n2946](../Objects.level.bin对象实现清单.html#Dawn%3An2946) | BstNode_1293287917 | 20%（2/10），运行待验 | 1 / 2 | Dawn · 481339 + 52 bytes |
| [n229](../Objects.level.bin对象实现清单.html#DayEnd%3An229) | BstNode_494 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 68995 + 51 bytes |
| [n261](../Objects.level.bin对象实现清单.html#DayEnd%3An261) | BstNode_2504654870 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 75225 + 60 bytes |
| [n277](../Objects.level.bin对象实现清单.html#DayEnd%3An277) | BstNode_557 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 77839 + 55 bytes |
| [n311](../Objects.level.bin对象实现清单.html#DayEnd%3An311) | BstNode_554 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 82958 + 51 bytes |
| [n444](../Objects.level.bin对象实现清单.html#DayEnd%3An444) | BstNode_556 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 107907 + 50 bytes |
| [n564](../Objects.level.bin对象实现清单.html#DayEnd%3An564) | BstNode_603 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 130944 + 42 bytes |
| [n859](../Objects.level.bin对象实现清单.html#DayEnd%3An859) | BstNode_2504654869 | 20%（2/10），运行待验 | 1 / 2 | DayEnd · 185572 + 55 bytes |
| [n86](../Objects.level.bin对象实现清单.html#DayHubCave%3An86) | BstNode_3501195352 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 37908 + 44 bytes |
| [n109](../Objects.level.bin对象实现清单.html#DayHubCave%3An109) | BstNode_3501195324 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 42645 + 44 bytes |
| [n120](../Objects.level.bin对象实现清单.html#DayHubCave%3An120) | BstNode_512 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 43955 + 41 bytes |
| [n125](../Objects.level.bin对象实现清单.html#DayHubCave%3An125) | BstNode_3501195319 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 44864 + 45 bytes |
| [n162](../Objects.level.bin对象实现清单.html#DayHubCave%3An162) | BstNode_3501195356 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 51627 + 44 bytes |
| [n190](../Objects.level.bin对象实现清单.html#DayHubCave%3An190) | BstNode_3501195296 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 56398 + 45 bytes |
| [n360](../Objects.level.bin对象实现清单.html#DayHubCave%3An360) | BstNode_3501195298 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 89240 + 45 bytes |
| [n397](../Objects.level.bin对象实现清单.html#DayHubCave%3An397) | BstNode_273 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 96562 + 44 bytes |
| [n418](../Objects.level.bin对象实现清单.html#DayHubCave%3An418) | BstNode_3501195316 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 100840 + 45 bytes |
| [n535](../Objects.level.bin对象实现清单.html#DayHubCave%3An535) | BstNode_313 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 126211 + 41 bytes |
| [n592](../Objects.level.bin对象实现清单.html#DayHubCave%3An592) | BstNode_3501195348 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 137021 + 44 bytes |
| [n607](../Objects.level.bin对象实现清单.html#DayHubCave%3An607) | BstNode_3501195312 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 139779 + 45 bytes |
| [n649](../Objects.level.bin对象实现清单.html#DayHubCave%3An649) | BstNode_3501195304 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 145479 + 45 bytes |
| [n657](../Objects.level.bin对象实现清单.html#DayHubCave%3An657) | BstNode_3501195332 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 146519 + 44 bytes |
| [n733](../Objects.level.bin对象实现清单.html#DayHubCave%3An733) | BstNode_3501195344 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 161223 + 44 bytes |
| [n769](../Objects.level.bin对象实现清单.html#DayHubCave%3An769) | BstNode_3501195336 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 167302 + 44 bytes |
| [n784](../Objects.level.bin对象实现清单.html#DayHubCave%3An784) | BstNode_3501195340 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 169690 + 44 bytes |
| [n800](../Objects.level.bin对象实现清单.html#DayHubCave%3An800) | BstNode_3501195308 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 172557 + 45 bytes |
| [n921](../Objects.level.bin对象实现清单.html#DayHubCave%3An921) | BstNode_3501195327 | 20%（2/10），运行待验 | 1 / 1 | DayHubCave · 192613 + 44 bytes |
| [n951](../Objects.level.bin对象实现清单.html#DayHubCave%3An951) | BstNode_499 | 20%（2/10），运行待验 | 1 / 0 | DayHubCave · 196550 + 44 bytes |
| [n260](../Objects.level.bin对象实现清单.html#Dusk%3An260) | BstNode_2504654895 | 20%（2/10），运行待验 | 1 / 2 | Dusk · 71817 + 61 bytes |
| [n286](../Objects.level.bin对象实现清单.html#DuskMid%3An286) | BstNode_2504654863 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 71372 + 61 bytes |
| [n387](../Objects.level.bin对象实现清单.html#DuskMid%3An387) | BstNode_2446917653 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 88593 + 65 bytes |
| [n506](../Objects.level.bin对象实现清单.html#DuskMid%3An506) | BstNode_2504654865 | 20%（2/10），运行待验 | 1 / 2 | DuskMid · 111741 + 62 bytes |
| [n7](../Objects.level.bin对象实现清单.html#HubReveal%3An7) | BstNode_2529558544 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 30478 + 49 bytes |
| [n451](../Objects.level.bin对象实现清单.html#HubReveal%3An451) | BstNode_2529558596 | 20%（2/10），运行待验 | 1 / 3 | HubReveal · 107487 + 49 bytes |
| [n539](../Objects.level.bin对象实现清单.html#HubReveal%3An539) | BstNode_2529558539 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 122501 + 50 bytes |
| [n691](../Objects.level.bin对象实现清单.html#HubReveal%3An691) | BstNode_2529558540 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 145458 + 52 bytes |
| [n1159](../Objects.level.bin对象实现清单.html#HubReveal%3An1159) | BstNode_2529558541 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 225999 + 49 bytes |
| [n1190](../Objects.level.bin对象实现清单.html#HubReveal%3An1190) | BstNode_2504654854 | 20%（2/10），运行待验 | 1 / 2 | HubReveal · 232322 + 66 bytes |
| [n43](../Objects.level.bin对象实现清单.html#NightEnd%3An43) | BstNode_2504654860 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 26873 + 70 bytes |
| [n57](../Objects.level.bin对象实现清单.html#NightEnd%3An57) | BstNode_2504654867 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 29996 + 67 bytes |
| [n100](../Objects.level.bin对象实现清单.html#NightEnd%3An100) | BstNode_2279670070 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 38492 + 67 bytes |
| [n129](../Objects.level.bin对象实现清单.html#NightEnd%3An129) | BstNode_2504654865 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 41481 + 71 bytes |
| [n203](../Objects.level.bin对象实现清单.html#NightEnd%3An203) | BstNode_2504654864 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 55570 + 76 bytes |
| [n226](../Objects.level.bin对象实现清单.html#NightEnd%3An226) | BstNode_2279670071 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 58984 + 73 bytes |
| [n273](../Objects.level.bin对象实现清单.html#NightEnd%3An273) | BstNode_2504654866 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 66841 + 71 bytes |
| [n276](../Objects.level.bin对象实现清单.html#NightEnd%3An276) | BstNode_2279670067 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 66972 + 68 bytes |
| [n378](../Objects.level.bin对象实现清单.html#NightEnd%3An378) | BstNode_2504654870 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 84016 + 73 bytes |
| [n402](../Objects.level.bin对象实现清单.html#NightEnd%3An402) | BstNode_2504654869 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 88851 + 68 bytes |
| [n449](../Objects.level.bin对象实现清单.html#NightEnd%3An449) | BstNode_2504654871 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 98985 + 68 bytes |
| [n450](../Objects.level.bin对象实现清单.html#NightEnd%3An450) | BstNode_2279670066 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 99053 + 69 bytes |
| [n495](../Objects.level.bin对象实现清单.html#NightEnd%3An495) | BstNode_2504654863 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 105953 + 71 bytes |
| [n613](../Objects.level.bin对象实现清单.html#NightEnd%3An613) | BstNode_2504654862 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 124116 + 69 bytes |
| [n638](../Objects.level.bin对象实现清单.html#NightEnd%3An638) | BstNode_2279670069 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 128352 + 68 bytes |
| [n639](../Objects.level.bin对象实现清单.html#NightEnd%3An639) | BstNode_2279670073 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 128420 + 68 bytes |
| [n669](../Objects.level.bin对象实现清单.html#NightEnd%3An669) | BstNode_2279670072 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 132790 + 73 bytes |
| [n672](../Objects.level.bin对象实现清单.html#NightEnd%3An672) | BstNode_2504654861 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 132958 + 76 bytes |
| [n738](../Objects.level.bin对象实现清单.html#NightEnd%3An738) | BstNode_2504654868 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 143816 + 73 bytes |
| [n766](../Objects.level.bin对象实现清单.html#NightEnd%3An766) | BstNode_2504654872 | 20%（2/10），运行待验 | 1 / 3 | NightEnd · 147401 + 68 bytes |
| [n1320](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1320) | BstNode_1738 | 20%（2/10），运行待验 | 1 / 3 | Prairie_ButterflyFields · 284928 + 56 bytes |
| [n1328](../Objects.level.bin对象实现清单.html#Prairie_ButterflyFields%3An1328) | BstNode_1725 | 20%（2/10），运行待验 | 1 / 3 | Prairie_ButterflyFields · 286363 + 53 bytes |
| [n251](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An251) | BstNode_3122856096 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 81996 + 65 bytes |
| [n293](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An293) | BstNode_1293287727 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 91008 + 58 bytes |
| [n609](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An609) | BstNode_2504654972 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 165234 + 58 bytes |
| [n1393](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1393) | BstNode_2504654854 | 20%（2/10），运行待验 | 1 / 4 | Prairie_Cave · 347779 + 66 bytes |
| [n151](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An151) | BstNode_757399555 | 20%（2/10），运行待验 | 1 / 2 | Prairie_NestAndKeeper · 55023 + 63 bytes |
| [n195](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An195) | BstNode_757399554 | 20%（2/10），运行待验 | 1 / 2 | Prairie_NestAndKeeper · 68053 + 62 bytes |
| [n458](../Objects.level.bin对象实现清单.html#Prairie_NestAndKeeper%3An458) | BstNode_656801803 | 20%（2/10），运行待验 | 1 / 3 | Prairie_NestAndKeeper · 123724 + 59 bytes |
| [n39](../Objects.level.bin对象实现清单.html#Prairie_Village%3An39) | BstNode_1167523912 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 37619 + 55 bytes |
| [n450](../Objects.level.bin对象实现清单.html#Prairie_Village%3An450) | BstNode_2821 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 104317 + 49 bytes |
| [n746](../Objects.level.bin对象实现清单.html#Prairie_Village%3An746) | BstNode_1482555552 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 152396 + 48 bytes |
| [n1033](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1033) | BstNode_656801828 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 201283 + 68 bytes |
| [n1166](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1166) | BstNode_1842806795 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 220326 + 62 bytes |
| [n1198](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1198) | BstNode_1167523982 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 224380 + 55 bytes |
| [n1236](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1236) | BstNode_656801810 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 230138 + 58 bytes |
| [n1324](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1324) | BstNode_2504655069 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 244397 + 58 bytes |
| [n1349](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1349) | BstNode_757399558 | 20%（2/10），运行待验 | 1 / 5 | Prairie_Village · 248056 + 59 bytes |
| [n1363](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1363) | BstNode_2504654868 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 250267 + 65 bytes |
| [n1370](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1370) | BstNode_1842806790 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 251822 + 60 bytes |
| [n1428](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1428) | BstNode_1842806812 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 260520 + 60 bytes |
| [n1532](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1532) | BstNode_656801842 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 274819 + 68 bytes |
| [n1728](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1728) | BstNode_1482555521 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 306832 + 51 bytes |
| [n1909](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1909) | BstNode_2504654863 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 340720 + 68 bytes |
| [n2351](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2351) | BstNode_1482555551 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 405860 + 51 bytes |
| [n2493](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2493) | BstNode_1482555515 | 20%（2/10），运行待验 | 1 / 2 | Prairie_Village · 426185 + 48 bytes |
| [n3012](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3012) | BstNode_656801841 | 20%（2/10），运行待验 | 1 / 3 | Prairie_Village · 511649 + 70 bytes |
| [n3014](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3014) | BstNode_1167523915 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 511791 + 55 bytes |
| [n305](../Objects.level.bin对象实现清单.html#Rain%3An305) | BstNode_2345993147 | 20%（2/10），运行待验 | 1 / 2 | Rain · 96385 + 49 bytes |
| [n609](../Objects.level.bin对象实现清单.html#Rain%3An609) | BstNode_2345993145 | 20%（2/10），运行待验 | 1 / 2 | Rain · 166872 + 52 bytes |
| [n1013](../Objects.level.bin对象实现清单.html#Rain%3An1013) | BstNode_2345993146 | 20%（2/10），运行待验 | 1 / 2 | Rain · 256755 + 52 bytes |
| [n1110](../Objects.level.bin对象实现清单.html#Rain%3An1110) | BstNode_2345993156 | 20%（2/10），运行待验 | 1 / 2 | Rain · 277930 + 52 bytes |
| [n1481](../Objects.level.bin对象实现清单.html#Rain%3An1481) | BstNode_2345993144 | 20%（2/10），运行待验 | 1 / 2 | Rain · 358763 + 50 bytes |
| [n787](../Objects.level.bin对象实现清单.html#RainEnd%3An787) | BstNode_516 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 217176 + 60 bytes |
| [n856](../Objects.level.bin对象实现清单.html#RainEnd%3An856) | BstNode_474 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 233638 + 56 bytes |
| [n1557](../Objects.level.bin对象实现清单.html#RainEnd%3An1557) | BstNode_918 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 396119 + 59 bytes |
| [n1617](../Objects.level.bin对象实现清单.html#RainEnd%3An1617) | BstNode_850 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 408210 + 55 bytes |
| [n239](../Objects.level.bin对象实现清单.html#SkyHub2%3An239) | BstNode_313 | 20%（2/10），运行待验 | 1 / 1 | SkyHub2 · 77387 + 41 bytes |
| [n1350](../Objects.level.bin对象实现清单.html#SkyHub2%3An1350) | BstNode_273 | 20%（2/10），运行待验 | 1 / 0 | SkyHub2 · 272164 + 44 bytes |
| [n174](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An174) | BstNode_656801867 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 56939 + 61 bytes |
| [n472](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An472) | BstNode_656801916 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 119545 + 64 bytes |
| [n513](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An513) | BstNode_656801800 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 131372 + 54 bytes |
| [n727](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An727) | BstNode_656801799 | 20%（2/10），运行待验 | 1 / 2 | SunsetEnd2 · 179651 + 54 bytes |
