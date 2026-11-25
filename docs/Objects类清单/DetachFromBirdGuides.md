# DetachFromBirdGuides 单独类功能实现清单

功能分类：生物、群体与 AI。

此类职责：**解除鸟类引导**。

类清单进度 40%（4/10），4 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：DetachFromBirdGuides 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 解除鸟类引导（部分完成）：原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。
- [ ] 依赖调用与事件（部分完成）：BirdV2（4 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。
- [x] 明确范围的原核心子链已独立核验：原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=DetachFromBirdGuides) · [原字段、进度与全部实例 JSON](DetachFromBirdGuides.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n783](../Objects.level.bin对象实现清单.html#Prairie_Village%3An783) | BstNode_544 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 157948 + 21 bytes |
| [n2279](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2279) | BstNode_554 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 395465 + 21 bytes |
| [n2448](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2448) | BstNode_550 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 421510 + 21 bytes |
| [n2778](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2778) | BstNode_547 | 20%（2/10），运行待验 | 1 / 1 | Prairie_Village · 471182 + 21 bytes |
