# Enable / IfEnabled 与 Clump 连续调用链

本轮恢复对象组启用功能：ClumpBarn 创建 → 原 TGCL 数组分配、字段装载和延迟引用修复 → EventBarn 触发登记、加载和逐帧调度 → Enable / IfEnabled → 原 Object GetEnabled / SetEnabled 方法查找与反射包装 → 嵌套 Clump / FloatAdd / FloatMult → 释放、卸载和重建。已有 ObjectFactory 主链继续使用此前独立证据；本轮多对象 runner 直接进入各 Barn 创建入口，不重复声称核验工厂完整注册。

报告：[logic-chain-oracle.json](logic-chain-oracle.json)。164 组输入，331 个加载后及逐帧对象快照，比较 47,879,740 bytes，零差异。41 组完成局部连续链和生命周期；6 组原断言；117 次未实现类服务边界。后两者分别计数。Fixture 为 `tests/fixtures/logic-chain-native.json.gz`，测试逐项重放，另独立检查数值结果、停止分支、同帧顺序、缺失服务和反射默认行为。

真实语料清点 1,287 个 Enable、36 个 IfEnabled。本次选取 82 个 Enable 和全部 36 个 IfEnabled 的调用片段，保留源文件 SHA256、原节点/字段/成员顺序、Float 保存值和 autoStart，按局部对象表重映射引用。Enable 每关卡至多三个可容纳的样本；最多 48 个节点。为观察真实根的行为，装载后由 harness 发出一次 SetEnabled(true)，没有修改其保存的 autoStart。

这些片段仍依赖未恢复目标类，因此不能计为完整类、完整实例或完整场景。未实现端点使用保留类名、引用位置的服务对象指针占位；不加载其字段、不执行其构造，也不赋予通用 enabled 字节。执行到该类的 metadata 服务时终止并记录独立边界。117 次边界不是原程序断言。仅一个真实片段的所选执行路径未触及边界，仍不能代替完整依赖闭合。语料根的静态依赖闭合数量为零；核心子链清单比例不是游戏完成比例。

| 原函数 | 地址 | 本轮行为 |
| --- | --- | --- |
| Clump placement | `0x10022c2d0` | 32-byte Object；classId、data/count/Heap 写入，保留占用标志和 padding |
| Clump SetEnabled | `0x10022b7f0` | uint32 顺序遍历，每个回调后重新读取 data/count |
| Clump AllocateClumpData | `0x10022b840` | 先断言 Heap；相同数量保留数组；不同数量释放旧数组，16-byte 对齐分配并清零，不复制成员 |
| Clump 数组析构 | `0x10022bd60` | Heap 非空时连 null data 也调用释放；清空 data/count，保留 Heap |
| ClumpBarn Initialize | `0x10022bdc0` | 1,280 个内嵌 32-byte 节点，清占用标志并从尾部构建空闲链 |
| ClumpBarn CreateClump | `0x10022bf80` | 先弹出空闲节点，设置 classId、占用和真实 Barn Heap 回链 |
| ClumpBarn counted CreateClump | `0x10022c000` | 创建后按数量分配和清零数组 |
| ClumpBarn ReleaseClump | `0x10022c0c0` | null / 重复释放由占用标志挡住；释放数组后返回空闲链 |
| ClumpBarn OnLevelUnload | `0x10022bee0` | 按节点顺序释放所有占用项，最后 clear Heap |
| Enable placement / Update | `0x100316c40` / `0x1003162f0` | 72-byte Event；原 Object cast、反射 SetEnabled、Event cast、killEvents、完成标志及 Start |
| IfEnabled placement / Update | `0x100718210` / `0x100718320` | 88-byte Event；OR 查询所有成员，匹配输出启用，独立 checkOnce |
| ObjectFactory SetEnabled / GetEnabled | `0x1004d1f60` / `0x1004d2050` | null / 缺失方法默认、AsClass 回退、原 receiver cast / ApplyWrapper 调用 |
| 原方法查找 | `0x1004d2330` | 大小写敏感 lower_bound 和最近父类；保留两次 parent getter 调用 |
| Event GetEnabled | `0x10032e2e0` | 读取 `event+0x23` 原字节；Object GetEnabled 对输出归一化 |
| Event Set / Get 反射包装 | `0x10032fd60` / `0x10032fe80` | 原 argument-count 分支、receiver adjustment、bool 转换和成员函数调用 |
| Clump Set / Allocate 反射包装 | `0x10022c720` / `0x10022c840` | 原包装函数连接对象组传播和 TGCL 数组构造 |
| Event Resume | `0x10032f0f0` | 先 Start，再清 `+0x24` 持续调度标志 |

原可执行文件 SHA256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。以上函数从原镜像执行未翻译的完整机器码；原引用修复 `0x10040d2aa..0x10040d311` 仍是明确区间，不是完整关卡 loader。共享 EventBarn、ValueBarn、TGCL 和数值函数沿用已有实现，在本轮多对象 runner 中共同执行。

## 已核对的功能规则

- Clump 不提供聚合 GetEnabled。通用 Object 查找不到该方法时返回 true；null 对象也返回 true。SetEnabled(null) 无操作。Enable 自身对 null 成员的 Object cast 先触发 `Clump.h:71` 断言。
- IfEnabled 的 OR 判断仍查询全部输入，命中不会截断后续查询。triggerOnDisabled 反转单个输入；空输入不匹配；checkOnce 独立 Start，匹配加 checkOnce 会调用两次。
- Enable 的 killEvents 不删除对象。它先按 enable 字段发请求，再执行 Resume（Start 后清 active）。已经被本次 Update 捕获的槽位仍可能调度；以当前 pending 字节决定是否继续数值执行。
- 若 Enable 在未启用目标被访问后才请求启用，数值变化到下一帧才出现。独立例子结果为 `0,0,1,2,3,4`；先启用后访问目标则为 `0,1,2,3,4,5`。
- 已执行目标随后被停止，当前帧的数值变化保留，后续帧不再变化：`0,1,1,1,1,1`。启用后立即 killEvents 则不会执行加法。
- 本轮在明确准备的 Clump 字段 metadata 下，空数组仍触发原 `Meta.h:1035` 检查，保留失败快照；不能据此把完整关卡默认缓存准备或空数组加载规则认定为完成。

## 保留的依赖

metadata 注册、类/指针 cast、标量转换、schema/default-cache 准备、Heap / pool 内部和方法缓存 flag=true 的 `0x1004d2d70` 仍是明确服务。方法查找恢复完整分支结构；原机器码比较只使用 flag=false。未替换成另一套缓存算法。

Marker、Delay、Timeline、SetInputState、区域、UI、音频、Avatar 与资源目标等依赖仍在机器报告中逐类列出，次数表示包含该依赖的根图数量。下一轮应沿这些真实调用边恢复目标类，让对象组能够驱动场景功能。Windows 真机和原游戏完整场景验收尚未完成。

## 界面入口

顶部工作模式现在将 `bin 编辑`、`meshes 编辑`、`Avatar 模式` 放在同一排，快捷键为 1 / 2 / 3。Avatar 打开独立预览控制面板，当前提供交互球移动、跳跃、飞行和碰撞预览，角色/动画仍待恢复。离开模式停止预览，恢复编辑工具；保存 Avatar 面板时处理已有全部编辑。

[界面检查](workspace-modes-smoke.json) 验证按钮实际位置、模式切换、预览启用/跟随、控制状态及快捷键，无 renderer 错误。[界面截图](workspace-modes.png)。这不增加 Avatar 原类的完成计数。

复现命令：

```bash
npx tsx tools/logic-chain-oracle.ts
npx tsx --test tests/logic-chain-runtime.test.ts
xvfb-run -a node tools/workspace-modes-smoke.mjs
```

筛选 oracle 可用 `SKY_LOGIC_FILTER=ordering`，筛选运行不会覆盖正式报告和 fixture。
