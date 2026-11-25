# SetFloat 单独类功能实现清单

功能分类：数值变量与运算。

此类职责：**浮点目标值与时间过渡**。

类清单进度 40%（4/10），4 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：SetFloat 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 浮点目标值与时间过渡（部分完成）：原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Float（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=SetFloat) · [原字段、进度与全部实例 JSON](SetFloat.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n43](../Objects.level.bin对象实现清单.html#DayHubCave%3An43) | BstNode_2345992695 | 20%（2/10），运行待验 | 1 / 2 | DayHubCave · 30007 + 40 bytes |
| [n979](../Objects.level.bin对象实现清单.html#Rain%3An979) | BstNode_2345992294 | 20%（2/10），运行待验 | 1 / 1 | Rain · 251635 + 40 bytes |
| [n1353](../Objects.level.bin对象实现清单.html#Rain%3An1353) | BstNode_2345992295 | 20%（2/10），运行待验 | 1 / 1 | Rain · 329490 + 40 bytes |
| [n1591](../Objects.level.bin对象实现清单.html#RainEnd%3An1591) | BstNode_2345992961 | 20%（2/10），运行待验 | 1 / 2 | RainEnd · 401745 + 40 bytes |
