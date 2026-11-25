# TransformObject 单独类功能实现清单

功能分类：场景基础与对象变换。

此类职责：**对象变换目标、过渡与完成事件**。

类清单进度 40%（4/10），317 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：TransformObject 的原默认值、继承初始化及 22 个序列化字段变体；原注册字段 21 项。
- [ ] 对象变换目标、过渡与完成事件（部分完成）：原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Marker（216 条引用）、Clump（344 条引用）、LevelMesh（91 条引用）、Timeline（3 条引用）、Float（45 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 21 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=TransformObject) · [原字段、进度与全部实例 JSON](TransformObject.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n80](../Objects.level.bin对象实现清单.html#CandleSpace%3An80) | BstNode_2446917736 | 20%（2/10），运行待验 | 2 / 3 | CandleSpace · 32775 + 72 bytes |
| [n327](../Objects.level.bin对象实现清单.html#CandleSpace%3An327) | BstNode_3156082726 | 20%（2/10），运行待验 | 2 / 2 | CandleSpace · 71293 + 72 bytes |
| [n351](../Objects.level.bin对象实现清单.html#CandleSpace%3An351) | BstNode_2446917714 | 20%（2/10），运行待验 | 3 / 1 | CandleSpace · 75032 + 72 bytes |
| [n28](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An28) | BstNode_2446917698 | 20%（2/10），运行待验 | 2 / 1 | CandleSpaceEnd · 21304 + 72 bytes |
| [n184](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An184) | BstNode_2446917708 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 44395 + 72 bytes |
| [n252](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An252) | BstNode_2446917764 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 63916 + 72 bytes |
| [n260](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An260) | BstNode_757399588 | 20%（2/10），运行待验 | 3 / 4 | CandleSpaceEnd · 64920 + 71 bytes |
| [n283](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An283) | BstNode_757399591 | 20%（2/10），运行待验 | 3 / 4 | CandleSpaceEnd · 70044 + 71 bytes |
| [n340](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An340) | BstNode_757399592 | 20%（2/10），运行待验 | 3 / 4 | CandleSpaceEnd · 82245 + 71 bytes |
| [n370](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An370) | BstNode_2446917710 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 86532 + 72 bytes |
| [n422](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An422) | BstNode_2446917692 | 20%（2/10），运行待验 | 2 / 1 | CandleSpaceEnd · 94165 + 72 bytes |
| [n463](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An463) | BstNode_2446917731 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 99927 + 72 bytes |
| [n464](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An464) | BstNode_2446917705 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 99999 + 72 bytes |
| [n578](../Objects.level.bin对象实现清单.html#CandleSpaceEnd%3An578) | BstNode_2446917728 | 20%（2/10），运行待验 | 2 / 2 | CandleSpaceEnd · 115006 + 72 bytes |
| [n156](../Objects.level.bin对象实现清单.html#Dawn%3An156) | BstNode_2126 | 20%（2/10），运行待验 | 2 / 1 | Dawn · 58512 + 66 bytes |
| [n280](../Objects.level.bin对象实现清单.html#Dawn%3An280) | BstNode_1293287706 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 77953 + 85 bytes |
| [n322](../Objects.level.bin对象实现清单.html#Dawn%3An322) | BstNode_1293287761 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 83516 + 72 bytes |
| [n499](../Objects.level.bin对象实现清单.html#Dawn%3An499) | BstNode_1842806916 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 109784 + 72 bytes |
| [n666](../Objects.level.bin对象实现清单.html#Dawn%3An666) | BstNode_3122856084 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 138264 + 72 bytes |
| [n697](../Objects.level.bin对象实现清单.html#Dawn%3An697) | BstNode_1842806793 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 142612 + 72 bytes |
| [n1060](../Objects.level.bin对象实现清单.html#Dawn%3An1060) | BstNode_1293287709 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 194420 + 72 bytes |
| [n1192](../Objects.level.bin对象实现清单.html#Dawn%3An1192) | BstNode_292 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 211605 + 65 bytes |
| [n1289](../Objects.level.bin对象实现清单.html#Dawn%3An1289) | BstNode_1293287704 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 231844 + 72 bytes |
| [n1376](../Objects.level.bin对象实现清单.html#Dawn%3An1376) | BstNode_3122856210 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 243659 + 81 bytes |
| [n1445](../Objects.level.bin对象实现清单.html#Dawn%3An1445) | BstNode_315 | 20%（2/10），运行待验 | 3 / 2 | Dawn · 255064 + 74 bytes |
| [n1498](../Objects.level.bin对象实现清单.html#Dawn%3An1498) | BstNode_1293287685 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 263227 + 72 bytes |
| [n1506](../Objects.level.bin对象实现清单.html#Dawn%3An1506) | BstNode_3122856642 | 20%（2/10），运行待验 | 3 / 1 | Dawn · 264310 + 82 bytes |
| [n1544](../Objects.level.bin对象实现清单.html#Dawn%3An1544) | BstNode_3122856220 | 20%（2/10），运行待验 | 3 / 1 | Dawn · 269034 + 72 bytes |
| [n1759](../Objects.level.bin对象实现清单.html#Dawn%3An1759) | BstNode_3122856267 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 298399 + 85 bytes |
| [n1778](../Objects.level.bin对象实现清单.html#Dawn%3An1778) | BstNode_2753888293 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 300404 + 72 bytes |
| [n2092](../Objects.level.bin对象实现清单.html#Dawn%3An2092) | BstNode_1293287597 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 343033 + 72 bytes |
| [n2161](../Objects.level.bin对象实现清单.html#Dawn%3An2161) | BstNode_1293287749 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 354317 + 85 bytes |
| [n2182](../Objects.level.bin对象实现清单.html#Dawn%3An2182) | BstNode_1293287703 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 359635 + 72 bytes |
| [n2258](../Objects.level.bin对象实现清单.html#Dawn%3An2258) | BstNode_3122857187 | 20%（2/10），运行待验 | 3 / 1 | Dawn · 372683 + 82 bytes |
| [n2467](../Objects.level.bin对象实现清单.html#Dawn%3An2467) | BstNode_1293287747 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 410357 + 72 bytes |
| [n2637](../Objects.level.bin对象实现清单.html#Dawn%3An2637) | BstNode_3122856268 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 437889 + 72 bytes |
| [n2658](../Objects.level.bin对象实现清单.html#Dawn%3An2658) | BstNode_1842806847 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 440390 + 72 bytes |
| [n2814](../Objects.level.bin对象实现清单.html#Dawn%3An2814) | BstNode_259 | 20%（2/10），运行待验 | 2 / 2 | Dawn · 461682 + 74 bytes |
| [n2817](../Objects.level.bin对象实现清单.html#Dawn%3An2817) | BstNode_1293287760 | 20%（2/10），运行待验 | 2 / 0 | Dawn · 462219 + 72 bytes |
| [n211](../Objects.level.bin对象实现清单.html#DayEnd%3An211) | BstNode_153 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 65654 + 74 bytes |
| [n318](../Objects.level.bin对象实现清单.html#DayEnd%3An318) | BstNode_155 | 20%（2/10），运行待验 | 2 / 1 | DayEnd · 84419 + 74 bytes |
| [n527](../Objects.level.bin对象实现清单.html#DayEnd%3An527) | BstNode_938 | 20%（2/10），运行待验 | 2 / 2 | DayEnd · 124439 + 65 bytes |
| [n842](../Objects.level.bin对象实现清单.html#DayEnd%3An842) | BstNode_3156082708 | 20%（2/10），运行待验 | 2 / 2 | DayEnd · 182325 + 72 bytes |
| [n1117](../Objects.level.bin对象实现清单.html#DayEnd%3An1117) | BstNode_698 | 20%（2/10），运行待验 | 2 / 2 | DayEnd · 232074 + 65 bytes |
| [n44](../Objects.level.bin对象实现清单.html#DayHubCave%3An44) | BstNode_2345992724 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 30047 + 72 bytes |
| [n149](../Objects.level.bin对象实现清单.html#DayHubCave%3An149) | BstNode_2345992617 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 49942 + 72 bytes |
| [n209](../Objects.level.bin对象实现清单.html#DayHubCave%3An209) | BstNode_2345992674 | 20%（2/10），运行待验 | 2 / 2 | DayHubCave · 59634 + 72 bytes |
| [n261](../Objects.level.bin对象实现清单.html#DayHubCave%3An261) | BstNode_2345992655 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 68039 + 72 bytes |
| [n270](../Objects.level.bin对象实现清单.html#DayHubCave%3An270) | BstNode_2345992262 | 20%（2/10），运行待验 | 2 / 1 | DayHubCave · 69705 + 72 bytes |
| [n488](../Objects.level.bin对象实现清单.html#DayHubCave%3An488) | BstNode_2345992628 | 20%（2/10），运行待验 | 2 / 2 | DayHubCave · 115806 + 72 bytes |
| [n546](../Objects.level.bin对象实现清单.html#DayHubCave%3An546) | BstNode_2345992658 | 20%（2/10），运行待验 | 2 / 2 | DayHubCave · 128051 + 72 bytes |
| [n634](../Objects.level.bin对象实现清单.html#DayHubCave%3An634) | BstNode_2345992722 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 143480 + 72 bytes |
| [n639](../Objects.level.bin对象实现清单.html#DayHubCave%3An639) | BstNode_2345992723 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 144335 + 72 bytes |
| [n645](../Objects.level.bin对象实现清单.html#DayHubCave%3An645) | BstNode_2345992725 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 144757 + 72 bytes |
| [n653](../Objects.level.bin对象实现清单.html#DayHubCave%3An653) | BstNode_2345992653 | 20%（2/10），运行待验 | 2 / 2 | DayHubCave · 145913 + 72 bytes |
| [n665](../Objects.level.bin对象实现清单.html#DayHubCave%3An665) | BstNode_2345992720 | 20%（2/10），运行待验 | 2 / 2 | DayHubCave · 147334 + 72 bytes |
| [n731](../Objects.level.bin对象实现清单.html#DayHubCave%3An731) | BstNode_2345992657 | 20%（2/10），运行待验 | 2 / 2 | DayHubCave · 161120 + 72 bytes |
| [n773](../Objects.level.bin对象实现清单.html#DayHubCave%3An773) | BstNode_2345992654 | 20%（2/10），运行待验 | 2 / 2 | DayHubCave · 167816 + 72 bytes |
| [n788](../Objects.level.bin对象实现清单.html#DayHubCave%3An788) | BstNode_2345992253 | 20%（2/10），运行待验 | 2 / 3 | DayHubCave · 170470 + 84 bytes |
| [n885](../Objects.level.bin对象实现清单.html#DayHubCave%3An885) | BstNode_2345992638 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 186553 + 72 bytes |
| [n918](../Objects.level.bin对象实现清单.html#DayHubCave%3An918) | BstNode_2345992656 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 192410 + 72 bytes |
| [n944](../Objects.level.bin对象实现清单.html#DayHubCave%3An944) | BstNode_2345992637 | 20%（2/10），运行待验 | 2 / 2 | DayHubCave · 195724 + 72 bytes |
| [n952](../Objects.level.bin对象实现清单.html#DayHubCave%3An952) | BstNode_2345992627 | 20%（2/10），运行待验 | 2 / 0 | DayHubCave · 196594 + 72 bytes |
| [n169](../Objects.level.bin对象实现清单.html#Dusk%3An169) | BstNode_34603734 | 20%（2/10），运行待验 | 2 / 1 | Dusk · 54757 + 70 bytes |
| [n88](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An88) | BstNode_34603837 | 20%（2/10），运行待验 | 2 / 1 | DuskGraveyard · 46032 + 70 bytes |
| [n260](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An260) | BstNode_34603833 | 20%（2/10），运行待验 | 3 / 2 | DuskGraveyard · 84109 + 83 bytes |
| [n486](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An486) | BstNode_34603854 | 20%（2/10），运行待验 | 2 / 2 | DuskGraveyard · 138133 + 70 bytes |
| [n723](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An723) | BstNode_34603860 | 20%（2/10），运行待验 | 3 / 2 | DuskGraveyard · 190316 + 70 bytes |
| [n1255](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1255) | BstNode_34603855 | 20%（2/10），运行待验 | 3 / 2 | DuskGraveyard · 316387 + 70 bytes |
| [n1424](../Objects.level.bin对象实现清单.html#DuskGraveyard%3An1424) | BstNode_34603828 | 20%（2/10），运行待验 | 3 / 2 | DuskGraveyard · 350145 + 70 bytes |
| [n61](../Objects.level.bin对象实现清单.html#DuskMid%3An61) | BstNode_2345992521 | 20%（2/10），运行待验 | 2 / 2 | DuskMid · 31436 + 72 bytes |
| [n158](../Objects.level.bin对象实现清单.html#DuskMid%3An158) | BstNode_2345992511 | 20%（2/10），运行待验 | 2 / 0 | DuskMid · 47777 + 72 bytes |
| [n208](../Objects.level.bin对象实现清单.html#DuskMid%3An208) | BstNode_2345992520 | 20%（2/10），运行待验 | 2 / 2 | DuskMid · 57781 + 72 bytes |
| [n233](../Objects.level.bin对象实现清单.html#DuskMid%3An233) | BstNode_2345992598 | 20%（2/10），运行待验 | 2 / 0 | DuskMid · 62185 + 72 bytes |
| [n302](../Objects.level.bin对象实现清单.html#DuskMid%3An302) | BstNode_2345992634 | 20%（2/10），运行待验 | 2 / 2 | DuskMid · 74121 + 72 bytes |
| [n880](../Objects.level.bin对象实现清单.html#DuskMid%3An880) | BstNode_2345992636 | 20%（2/10），运行待验 | 2 / 1 | DuskMid · 188998 + 72 bytes |
| [n1099](../Objects.level.bin对象实现清单.html#DuskMid%3An1099) | BstNode_2345992551 | 20%（2/10），运行待验 | 2 / 0 | DuskMid · 228288 + 72 bytes |
| [n76](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An76) | BstNode_1293287782 | 20%（2/10），运行待验 | 2 / 2 | Dusk_CrabField · 32104 + 85 bytes |
| [n221](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An221) | BstNode_1293287811 | 20%（2/10），运行待验 | 2 / 2 | Dusk_CrabField · 65657 + 85 bytes |
| [n905](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An905) | BstNode_3122856642 | 20%（2/10），运行待验 | 3 / 0 | Dusk_CrabField · 223550 + 82 bytes |
| [n945](../Objects.level.bin对象实现清单.html#Dusk_CrabField%3An945) | BstNode_1293287803 | 20%（2/10），运行待验 | 2 / 2 | Dusk_CrabField · 232087 + 85 bytes |
| [n184](../Objects.level.bin对象实现清单.html#HubReveal%3An184) | BstNode_2504654913 | 20%（2/10），运行待验 | 2 / 3 | HubReveal · 61333 + 72 bytes |
| [n189](../Objects.level.bin对象实现清单.html#HubReveal%3An189) | BstNode_1167523896 | 20%（2/10），运行待验 | 2 / 2 | HubReveal · 62269 + 72 bytes |
| [n480](../Objects.level.bin对象实现清单.html#HubReveal%3An480) | BstNode_1549 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 111588 + 66 bytes |
| [n637](../Objects.level.bin对象实现清单.html#HubReveal%3An637) | BstNode_1502 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 137061 + 66 bytes |
| [n883](../Objects.level.bin对象实现清单.html#HubReveal%3An883) | BstNode_2501 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 177306 + 66 bytes |
| [n892](../Objects.level.bin对象实现清单.html#HubReveal%3An892) | BstNode_2500 | 20%（2/10），运行待验 | 2 / 0 | HubReveal · 179023 + 66 bytes |
| [n894](../Objects.level.bin对象实现清单.html#HubReveal%3An894) | BstNode_1167523895 | 20%（2/10），运行待验 | 2 / 2 | HubReveal · 179117 + 72 bytes |
| [n1125](../Objects.level.bin对象实现清单.html#HubReveal%3An1125) | BstNode_1577 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 219554 + 66 bytes |
| [n1352](../Objects.level.bin对象实现清单.html#HubReveal%3An1352) | BstNode_918 | 20%（2/10），运行待验 | 2 / 2 | HubReveal · 257397 + 65 bytes |
| [n1481](../Objects.level.bin对象实现清单.html#HubReveal%3An1481) | BstNode_1509 | 20%（2/10），运行待验 | 2 / 1 | HubReveal · 278242 + 66 bytes |
| [n47](../Objects.level.bin对象实现清单.html#Night%3An47) | BstNode_2420 | 20%（2/10），运行待验 | 2 / 2 | Night · 30747 + 66 bytes |
| [n81](../Objects.level.bin对象实现清单.html#Night%3An81) | BstNode_34604366 | 20%（2/10），运行待验 | 3 / 0 | Night · 34978 + 70 bytes |
| [n137](../Objects.level.bin对象实现清单.html#Night%3An137) | BstNode_568 | 20%（2/10），运行待验 | 2 / 1 | Night · 43308 + 65 bytes |
| [n139](../Objects.level.bin对象实现清单.html#Night%3An139) | BstNode_1158 | 20%（2/10），运行待验 | 2 / 1 | Night · 43525 + 66 bytes |
| [n195](../Objects.level.bin对象实现清单.html#Night%3An195) | BstNode_623 | 20%（2/10），运行待验 | 2 / 1 | Night · 50913 + 65 bytes |
| [n219](../Objects.level.bin对象实现清单.html#Night%3An219) | BstNode_2421 | 20%（2/10），运行待验 | 2 / 2 | Night · 55131 + 66 bytes |
| [n322](../Objects.level.bin对象实现清单.html#Night%3An322) | BstNode_34604573 | 20%（2/10），运行待验 | 2 / 1 | Night · 70192 + 70 bytes |
| [n335](../Objects.level.bin对象实现清单.html#Night%3An335) | BstNode_240 | 20%（2/10），运行待验 | 2 / 1 | Night · 71198 + 65 bytes |
| [n348](../Objects.level.bin对象实现清单.html#Night%3An348) | BstNode_34604435 | 20%（2/10），运行待验 | 2 / 2 | Night · 73950 + 82 bytes |
| [n564](../Objects.level.bin对象实现清单.html#Night%3An564) | BstNode_34604442 | 20%（2/10），运行待验 | 2 / 0 | Night · 106075 + 70 bytes |
| [n606](../Objects.level.bin对象实现清单.html#Night%3An606) | BstNode_34603212 | 20%（2/10），运行待验 | 2 / 2 | Night · 112741 + 70 bytes |
| [n636](../Objects.level.bin对象实现清单.html#Night%3An636) | BstNode_34604367 | 20%（2/10），运行待验 | 3 / 0 | Night · 118436 + 70 bytes |
| [n819](../Objects.level.bin对象实现清单.html#Night%3An819) | BstNode_34604016 | 20%（2/10），运行待验 | 2 / 2 | Night · 144936 + 70 bytes |
| [n912](../Objects.level.bin对象实现清单.html#Night%3An912) | BstNode_2423 | 20%（2/10），运行待验 | 2 / 2 | Night · 160108 + 66 bytes |
| [n952](../Objects.level.bin对象实现清单.html#Night%3An952) | BstNode_426 | 20%（2/10），运行待验 | 2 / 2 | Night · 166441 + 77 bytes |
| [n982](../Objects.level.bin对象实现清单.html#Night%3An982) | BstNode_34603980 | 20%（2/10），运行待验 | 2 / 3 | Night · 170876 + 70 bytes |
| [n1212](../Objects.level.bin对象实现清单.html#Night%3An1212) | BstNode_2419 | 20%（2/10），运行待验 | 2 / 2 | Night · 200843 + 66 bytes |
| [n1305](../Objects.level.bin对象实现清单.html#Night%3An1305) | BstNode_204 | 20%（2/10），运行待验 | 2 / 2 | Night · 214299 + 65 bytes |
| [n1514](../Objects.level.bin对象实现清单.html#Night%3An1514) | BstNode_831 | 20%（2/10），运行待验 | 2 / 1 | Night · 240259 + 65 bytes |
| [n1521](../Objects.level.bin对象实现清单.html#Night%3An1521) | BstNode_34603351 | 20%（2/10），运行待验 | 2 / 2 | Night · 240790 + 82 bytes |
| [n1523](../Objects.level.bin对象实现清单.html#Night%3An1523) | BstNode_671 | 20%（2/10），运行待验 | 2 / 1 | Night · 240988 + 65 bytes |
| [n1536](../Objects.level.bin对象实现清单.html#Night%3An1536) | BstNode_34604049 | 20%（2/10），运行待验 | 3 / 0 | Night · 242938 + 70 bytes |
| [n1563](../Objects.level.bin对象实现清单.html#Night%3An1563) | BstNode_432 | 20%（2/10），运行待验 | 2 / 2 | Night · 245883 + 77 bytes |
| [n1606](../Objects.level.bin对象实现清单.html#Night%3An1606) | BstNode_880 | 20%（2/10），运行待验 | 2 / 2 | Night · 252542 + 65 bytes |
| [n1640](../Objects.level.bin对象实现清单.html#Night%3An1640) | BstNode_772 | 20%（2/10），运行待验 | 2 / 1 | Night · 257218 + 65 bytes |
| [n1810](../Objects.level.bin对象实现清单.html#Night%3An1810) | BstNode_799 | 20%（2/10），运行待验 | 2 / 1 | Night · 282356 + 65 bytes |
| [n1833](../Objects.level.bin对象实现清单.html#Night%3An1833) | BstNode_356 | 20%（2/10），运行待验 | 2 / 1 | Night · 285755 + 65 bytes |
| [n1841](../Objects.level.bin对象实现清单.html#Night%3An1841) | BstNode_373 | 20%（2/10），运行待验 | 2 / 1 | Night · 286898 + 65 bytes |
| [n1854](../Objects.level.bin对象实现清单.html#Night%3An1854) | BstNode_34604368 | 20%（2/10），运行待验 | 3 / 0 | Night · 288064 + 70 bytes |
| [n1991](../Objects.level.bin对象实现清单.html#Night%3An1991) | BstNode_2425 | 20%（2/10），运行待验 | 2 / 2 | Night · 313067 + 66 bytes |
| [n2010](../Objects.level.bin对象实现清单.html#Night%3An2010) | BstNode_2424 | 20%（2/10），运行待验 | 2 / 2 | Night · 316932 + 66 bytes |
| [n2043](../Objects.level.bin对象实现清单.html#Night%3An2043) | BstNode_2422 | 20%（2/10），运行待验 | 2 / 2 | Night · 324680 + 66 bytes |
| [n2214](../Objects.level.bin对象实现清单.html#Night%3An2214) | BstNode_467 | 20%（2/10），运行待验 | 2 / 1 | Night · 349581 + 65 bytes |
| [n2222](../Objects.level.bin对象实现清单.html#Night%3An2222) | BstNode_543 | 20%（2/10），运行待验 | 2 / 1 | Night · 350497 + 65 bytes |
| [n2472](../Objects.level.bin对象实现清单.html#Night%3An2472) | BstNode_2228 | 20%（2/10），运行待验 | 2 / 1 | Night · 388793 + 66 bytes |
| [n2476](../Objects.level.bin对象实现清单.html#Night%3An2476) | BstNode_391 | 20%（2/10），运行待验 | 2 / 1 | Night · 389143 + 65 bytes |
| [n2544](../Objects.level.bin对象实现清单.html#Night%3An2544) | BstNode_2186 | 20%（2/10），运行待验 | 2 / 2 | Night · 398501 + 78 bytes |
| [n2576](../Objects.level.bin对象实现清单.html#Night%3An2576) | BstNode_409 | 20%（2/10），运行待验 | 2 / 1 | Night · 403260 + 65 bytes |
| [n2582](../Objects.level.bin对象实现清单.html#Night%3An2582) | BstNode_34604018 | 20%（2/10），运行待验 | 2 / 2 | Night · 404314 + 70 bytes |
| [n2612](../Objects.level.bin对象实现清单.html#Night%3An2612) | BstNode_34604577 | 20%（2/10），运行待验 | 2 / 1 | Night · 407354 + 70 bytes |
| [n2613](../Objects.level.bin对象实现清单.html#Night%3An2613) | BstNode_34604559 | 20%（2/10），运行待验 | 2 / 1 | Night · 407424 + 70 bytes |
| [n2654](../Objects.level.bin对象实现清单.html#Night%3An2654) | BstNode_34604441 | 20%（2/10），运行待验 | 2 / 2 | Night · 414122 + 70 bytes |
| [n2665](../Objects.level.bin对象实现清单.html#Night%3An2665) | BstNode_34603371 | 20%（2/10），运行待验 | 2 / 3 | Night · 415122 + 82 bytes |
| [n2750](../Objects.level.bin对象实现清单.html#Night%3An2750) | BstNode_243 | 20%（2/10），运行待验 | 2 / 2 | Night · 427323 + 77 bytes |
| [n2867](../Objects.level.bin对象实现清单.html#Night%3An2867) | BstNode_435 | 20%（2/10），运行待验 | 2 / 2 | Night · 445476 + 77 bytes |
| [n3034](../Objects.level.bin对象实现清单.html#Night%3An3034) | BstNode_2244 | 20%（2/10），运行待验 | 2 / 1 | Night · 471731 + 66 bytes |
| [n3071](../Objects.level.bin对象实现清单.html#Night%3An3071) | BstNode_2223 | 20%（2/10），运行待验 | 2 / 1 | Night · 478245 + 66 bytes |
| [n3092](../Objects.level.bin对象实现清单.html#Night%3An3092) | BstNode_2216 | 20%（2/10），运行待验 | 2 / 1 | Night · 482327 + 66 bytes |
| [n3093](../Objects.level.bin对象实现清单.html#Night%3An3093) | BstNode_34604365 | 20%（2/10），运行待验 | 2 / 2 | Night · 482393 + 70 bytes |
| [n99](../Objects.level.bin对象实现清单.html#NightEnd%3An99) | BstNode_2529558534 | 20%（2/10），运行待验 | 2 / 2 | NightEnd · 38420 + 72 bytes |
| [n750](../Objects.level.bin对象实现清单.html#NightEnd%3An750) | BstNode_283 | 20%（2/10），运行待验 | 2 / 1 | NightEnd · 145039 + 65 bytes |
| [n14](../Objects.level.bin对象实现清单.html#NightEntrance%3An14) | BstNode_1293287467 | 20%（2/10），运行待验 | 3 / 1 | NightEntrance · 17386 + 85 bytes |
| [n113](../Objects.level.bin对象实现清单.html#NightEntrance%3An113) | BstNode_283 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 34037 + 65 bytes |
| [n126](../Objects.level.bin对象实现清单.html#NightEntrance%3An126) | BstNode_225 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 36058 + 65 bytes |
| [n144](../Objects.level.bin对象实现清单.html#NightEntrance%3An144) | BstNode_232 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 38837 + 65 bytes |
| [n152](../Objects.level.bin对象实现清单.html#NightEntrance%3An152) | BstNode_290 | 20%（2/10），运行待验 | 2 / 0 | NightEntrance · 40009 + 65 bytes |
| [n155](../Objects.level.bin对象实现清单.html#NightEntrance%3An155) | BstNode_281 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 40292 + 65 bytes |
| [n179](../Objects.level.bin对象实现清单.html#NightEntrance%3An179) | BstNode_289 | 20%（2/10），运行待验 | 2 / 0 | NightEntrance · 43558 + 65 bytes |
| [n216](../Objects.level.bin对象实现清单.html#NightEntrance%3An216) | BstNode_243 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 48859 + 65 bytes |
| [n272](../Objects.level.bin对象实现清单.html#NightEntrance%3An272) | BstNode_268 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 58066 + 65 bytes |
| [n314](../Objects.level.bin对象实现清单.html#NightEntrance%3An314) | BstNode_230 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 63730 + 65 bytes |
| [n392](../Objects.level.bin对象实现清单.html#NightEntrance%3An392) | BstNode_259 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 74428 + 65 bytes |
| [n400](../Objects.level.bin对象实现清单.html#NightEntrance%3An400) | BstNode_272 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 75290 + 65 bytes |
| [n408](../Objects.level.bin对象实现清单.html#NightEntrance%3An408) | BstNode_252 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 77290 + 65 bytes |
| [n445](../Objects.level.bin对象实现清单.html#NightEntrance%3An445) | BstNode_241 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 83786 + 65 bytes |
| [n446](../Objects.level.bin对象实现清单.html#NightEntrance%3An446) | BstNode_254 | 20%（2/10），运行待验 | 2 / 1 | NightEntrance · 83851 + 65 bytes |
| [n512](../Objects.level.bin对象实现清单.html#NightEntrance%3An512) | BstNode_1293287457 | 20%（2/10），运行待验 | 3 / 1 | NightEntrance · 92691 + 85 bytes |
| [n118](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An118) | BstNode_3122856100 | 20%（2/10），运行待验 | 2 / 4 | Prairie_Cave · 52778 + 72 bytes |
| [n1071](../Objects.level.bin对象实现清单.html#Prairie_Cave%3An1071) | BstNode_2504654953 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Cave · 270891 + 72 bytes |
| [n210](../Objects.level.bin对象实现清单.html#Prairie_Village%3An210) | BstNode_980 | 20%（2/10），运行待验 | 2 / 4 | Prairie_Village · 64734 + 65 bytes |
| [n592](../Objects.level.bin对象实现清单.html#Prairie_Village%3An592) | BstNode_1167523917 | 20%（2/10），运行待验 | 3 / 0 | Prairie_Village · 125801 + 72 bytes |
| [n1049](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1049) | BstNode_2345992290 | 20%（2/10），运行待验 | 3 / 1 | Prairie_Village · 203720 + 85 bytes |
| [n1103](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1103) | BstNode_2824 | 20%（2/10），运行待验 | 3 / 2 | Prairie_Village · 212370 + 66 bytes |
| [n1326](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1326) | BstNode_656801861 | 20%（2/10），运行待验 | 2 / 4 | Prairie_Village · 244515 + 71 bytes |
| [n1610](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1610) | BstNode_2345992246 | 20%（2/10），运行待验 | 3 / 1 | Prairie_Village · 289039 + 85 bytes |
| [n1755](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1755) | BstNode_2345992376 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 311952 + 85 bytes |
| [n1865](../Objects.level.bin对象实现清单.html#Prairie_Village%3An1865) | BstNode_2345992306 | 20%（2/10），运行待验 | 3 / 1 | Prairie_Village · 332574 + 85 bytes |
| [n2434](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2434) | BstNode_529 | 20%（2/10），运行待验 | 2 / 4 | Prairie_Village · 418882 + 65 bytes |
| [n2514](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2514) | BstNode_685 | 20%（2/10），运行待验 | 2 / 5 | Prairie_Village · 428758 + 65 bytes |
| [n2521](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2521) | BstNode_2404 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 429410 + 66 bytes |
| [n2768](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2768) | BstNode_2345992368 | 20%（2/10），运行待验 | 2 / 2 | Prairie_Village · 468569 + 85 bytes |
| [n2880](../Objects.level.bin对象实现清单.html#Prairie_Village%3An2880) | BstNode_2434 | 20%（2/10），运行待验 | 3 / 1 | Prairie_Village · 489997 + 66 bytes |
| [n3080](../Objects.level.bin对象实现清单.html#Prairie_Village%3An3080) | BstNode_2345992244 | 20%（2/10），运行待验 | 3 / 1 | Prairie_Village · 522825 + 85 bytes |
| [n15](../Objects.level.bin对象实现清单.html#Rain%3An15) | BstNode_1557 | 20%（2/10），运行待验 | 2 / 2 | Rain · 32194 + 66 bytes |
| [n81](../Objects.level.bin对象实现清单.html#Rain%3An81) | BstNode_1293287782 | 20%（2/10），运行待验 | 2 / 3 | Rain · 47037 + 85 bytes |
| [n120](../Objects.level.bin对象实现清单.html#Rain%3An120) | BstNode_1293287546 | 20%（2/10），运行待验 | 3 / 3 | Rain · 55308 + 85 bytes |
| [n312](../Objects.level.bin对象实现清单.html#Rain%3An312) | BstNode_2345992551 | 20%（2/10），运行待验 | 3 / 0 | Rain · 98174 + 72 bytes |
| [n448](../Objects.level.bin对象实现清单.html#Rain%3An448) | BstNode_1293287501 | 20%（2/10），运行待验 | 3 / 1 | Rain · 129550 + 84 bytes |
| [n625](../Objects.level.bin对象实现清单.html#Rain%3An625) | BstNode_2345992469 | 20%（2/10），运行待验 | 3 / 0 | Rain · 169796 + 84 bytes |
| [n693](../Objects.level.bin对象实现清单.html#Rain%3An693) | BstNode_2345992454 | 20%（2/10），运行待验 | 3 / 1 | Rain · 185830 + 72 bytes |
| [n893](../Objects.level.bin对象实现清单.html#Rain%3An893) | BstNode_1293287803 | 20%（2/10），运行待验 | 3 / 3 | Rain · 230945 + 85 bytes |
| [n899](../Objects.level.bin对象实现清单.html#Rain%3An899) | BstNode_1293287523 | 20%（2/10），运行待验 | 2 / 3 | Rain · 232591 + 85 bytes |
| [n969](../Objects.level.bin对象实现清单.html#Rain%3An969) | BstNode_1293287811 | 20%（2/10），运行待验 | 3 / 3 | Rain · 249713 + 85 bytes |
| [n1004](../Objects.level.bin对象实现清单.html#Rain%3An1004) | BstNode_1293287543 | 20%（2/10），运行待验 | 3 / 3 | Rain · 255013 + 85 bytes |
| [n1356](../Objects.level.bin对象实现清单.html#Rain%3An1356) | BstNode_1293287533 | 20%（2/10），运行待验 | 3 / 3 | Rain · 330585 + 85 bytes |
| [n1372](../Objects.level.bin对象实现清单.html#Rain%3An1372) | BstNode_1293287534 | 20%（2/10），运行待验 | 3 / 3 | Rain · 333703 + 85 bytes |
| [n1376](../Objects.level.bin对象实现清单.html#Rain%3An1376) | BstNode_1293287531 | 20%（2/10），运行待验 | 2 / 3 | Rain · 334700 + 85 bytes |
| [n1718](../Objects.level.bin对象实现清单.html#Rain%3An1718) | BstNode_2345992473 | 20%（2/10），运行待验 | 3 / 0 | Rain · 413041 + 72 bytes |
| [n1777](../Objects.level.bin对象实现清单.html#Rain%3An1777) | BstNode_2345992448 | 20%（2/10），运行待验 | 3 / 0 | Rain · 429129 + 84 bytes |
| [n81](../Objects.level.bin对象实现清单.html#RainEnd%3An81) | BstNode_840695921 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 47958 + 71 bytes |
| [n91](../Objects.level.bin对象实现清单.html#RainEnd%3An91) | BstNode_2345992890 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 50103 + 72 bytes |
| [n95](../Objects.level.bin对象实现清单.html#RainEnd%3An95) | BstNode_2345992886 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 51106 + 72 bytes |
| [n121](../Objects.level.bin对象实现清单.html#RainEnd%3An121) | BstNode_227 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 56565 + 65 bytes |
| [n173](../Objects.level.bin对象实现清单.html#RainEnd%3An173) | BstNode_840696231 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 71484 + 71 bytes |
| [n199](../Objects.level.bin对象实现清单.html#RainEnd%3An199) | BstNode_2345992887 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 76835 + 72 bytes |
| [n209](../Objects.level.bin对象实现清单.html#RainEnd%3An209) | BstNode_214 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 78768 + 65 bytes |
| [n332](../Objects.level.bin对象实现清单.html#RainEnd%3An332) | BstNode_746 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 108999 + 65 bytes |
| [n381](../Objects.level.bin对象实现清单.html#RainEnd%3An381) | BstNode_2345992641 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 120579 + 85 bytes |
| [n413](../Objects.level.bin对象实现清单.html#RainEnd%3An413) | BstNode_2345992760 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 129000 + 72 bytes |
| [n463](../Objects.level.bin对象实现清单.html#RainEnd%3An463) | BstNode_840696220 | 20%（2/10），运行待验 | 2 / 0 | RainEnd · 141636 + 71 bytes |
| [n491](../Objects.level.bin对象实现清单.html#RainEnd%3An491) | BstNode_2345992891 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 148226 + 72 bytes |
| [n505](../Objects.level.bin对象实现清单.html#RainEnd%3An505) | BstNode_2345992775 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 151577 + 72 bytes |
| [n617](../Objects.level.bin对象实现清单.html#RainEnd%3An617) | BstNode_8 | 20%（2/10），运行待验 | 3 / 2 | RainEnd · 179086 + 63 bytes |
| [n661](../Objects.level.bin对象实现清单.html#RainEnd%3An661) | BstNode_840696088 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 189045 + 71 bytes |
| [n667](../Objects.level.bin对象实现清单.html#RainEnd%3An667) | BstNode_840696215 | 20%（2/10），运行待验 | 2 / 3 | RainEnd · 190438 + 71 bytes |
| [n737](../Objects.level.bin对象实现清单.html#RainEnd%3An737) | BstNode_840696089 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 207691 + 71 bytes |
| [n771](../Objects.level.bin对象实现清单.html#RainEnd%3An771) | BstNode_2645622837 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 214246 + 72 bytes |
| [n793](../Objects.level.bin对象实现清单.html#RainEnd%3An793) | BstNode_2345992889 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 218226 + 72 bytes |
| [n801](../Objects.level.bin对象实现清单.html#RainEnd%3An801) | BstNode_2345992888 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 220438 + 72 bytes |
| [n812](../Objects.level.bin对象实现清单.html#RainEnd%3An812) | BstNode_840695919 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 223861 + 71 bytes |
| [n848](../Objects.level.bin对象实现清单.html#RainEnd%3An848) | BstNode_840696090 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 231747 + 71 bytes |
| [n873](../Objects.level.bin对象实现清单.html#RainEnd%3An873) | BstNode_747 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 237741 + 65 bytes |
| [n900](../Objects.level.bin对象实现清单.html#RainEnd%3An900) | BstNode_251 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 243442 + 65 bytes |
| [n920](../Objects.level.bin对象实现清单.html#RainEnd%3An920) | BstNode_840695989 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 247170 + 71 bytes |
| [n922](../Objects.level.bin对象实现清单.html#RainEnd%3An922) | BstNode_840696152 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 247625 + 71 bytes |
| [n947](../Objects.level.bin对象实现清单.html#RainEnd%3An947) | BstNode_2345992893 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 253789 + 72 bytes |
| [n959](../Objects.level.bin对象实现清单.html#RainEnd%3An959) | BstNode_229 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 255515 + 65 bytes |
| [n980](../Objects.level.bin对象实现清单.html#RainEnd%3An980) | BstNode_840696140 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 260686 + 71 bytes |
| [n1042](../Objects.level.bin对象实现清单.html#RainEnd%3An1042) | BstNode_840695964 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 277708 + 71 bytes |
| [n1124](../Objects.level.bin对象实现清单.html#RainEnd%3An1124) | BstNode_2345992661 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 297292 + 72 bytes |
| [n1158](../Objects.level.bin对象实现清单.html#RainEnd%3An1158) | BstNode_840696087 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 305237 + 71 bytes |
| [n1192](../Objects.level.bin对象实现清单.html#RainEnd%3An1192) | BstNode_840696154 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 313728 + 71 bytes |
| [n1245](../Objects.level.bin对象实现清单.html#RainEnd%3An1245) | BstNode_840696230 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 327069 + 71 bytes |
| [n1257](../Objects.level.bin对象实现清单.html#RainEnd%3An1257) | BstNode_2345992822 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 330373 + 72 bytes |
| [n1271](../Objects.level.bin对象实现清单.html#RainEnd%3An1271) | BstNode_840696159 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 334166 + 71 bytes |
| [n1329](../Objects.level.bin对象实现清单.html#RainEnd%3An1329) | BstNode_840696166 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 347705 + 71 bytes |
| [n1375](../Objects.level.bin对象实现清单.html#RainEnd%3An1375) | BstNode_840695959 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 360487 + 71 bytes |
| [n1376](../Objects.level.bin对象实现清单.html#RainEnd%3An1376) | BstNode_2345992870 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 360558 + 72 bytes |
| [n1404](../Objects.level.bin对象实现清单.html#RainEnd%3An1404) | BstNode_2345992639 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 367121 + 72 bytes |
| [n1440](../Objects.level.bin对象实现清单.html#RainEnd%3An1440) | BstNode_213 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 374442 + 65 bytes |
| [n1466](../Objects.level.bin对象实现清单.html#RainEnd%3An1466) | BstNode_2345992653 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 379922 + 87 bytes |
| [n1471](../Objects.level.bin对象实现清单.html#RainEnd%3An1471) | BstNode_253 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 380771 + 65 bytes |
| [n1488](../Objects.level.bin对象实现清单.html#RainEnd%3An1488) | BstNode_2345992645 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 384243 + 72 bytes |
| [n1510](../Objects.level.bin对象实现清单.html#RainEnd%3An1510) | BstNode_840695930 | 20%（2/10），运行待验 | 2 / 1 | RainEnd · 387495 + 71 bytes |
| [n1539](../Objects.level.bin对象实现清单.html#RainEnd%3An1539) | BstNode_2345992759 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 391843 + 87 bytes |
| [n1596](../Objects.level.bin对象实现清单.html#RainEnd%3An1596) | BstNode_2345992758 | 20%（2/10），运行待验 | 3 / 0 | RainEnd · 402839 + 72 bytes |
| [n1666](../Objects.level.bin对象实现清单.html#RainEnd%3An1666) | BstNode_2345992894 | 20%（2/10），运行待验 | 2 / 2 | RainEnd · 418540 + 72 bytes |
| [n77](../Objects.level.bin对象实现清单.html#RainMid%3An77) | BstNode_728 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 40724 + 65 bytes |
| [n97](../Objects.level.bin对象实现清单.html#RainMid%3An97) | BstNode_2345993261 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 45332 + 72 bytes |
| [n103](../Objects.level.bin对象实现清单.html#RainMid%3An103) | BstNode_2345993260 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 46516 + 72 bytes |
| [n122](../Objects.level.bin对象实现清单.html#RainMid%3An122) | BstNode_1272 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 50395 + 66 bytes |
| [n157](../Objects.level.bin对象实现清单.html#RainMid%3An157) | BstNode_2345993273 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 56137 + 72 bytes |
| [n167](../Objects.level.bin对象实现清单.html#RainMid%3An167) | BstNode_2345993233 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 59028 + 72 bytes |
| [n223](../Objects.level.bin对象实现清单.html#RainMid%3An223) | BstNode_1271 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 69862 + 66 bytes |
| [n287](../Objects.level.bin对象实现清单.html#RainMid%3An287) | BstNode_1279 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 81191 + 66 bytes |
| [n337](../Objects.level.bin对象实现清单.html#RainMid%3An337) | BstNode_2345993240 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 89788 + 72 bytes |
| [n374](../Objects.level.bin对象实现清单.html#RainMid%3An374) | BstNode_2345993235 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 96860 + 72 bytes |
| [n551](../Objects.level.bin对象实现清单.html#RainMid%3An551) | BstNode_337 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 128740 + 65 bytes |
| [n644](../Objects.level.bin对象实现清单.html#RainMid%3An644) | BstNode_2345993259 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 147907 + 72 bytes |
| [n653](../Objects.level.bin对象实现清单.html#RainMid%3An653) | BstNode_1282 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 149782 + 66 bytes |
| [n657](../Objects.level.bin对象实现清单.html#RainMid%3An657) | BstNode_1275 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 150492 + 66 bytes |
| [n726](../Objects.level.bin对象实现清单.html#RainMid%3An726) | BstNode_2345993016 | 20%（2/10），运行待验 | 3 / 3 | RainMid · 163124 + 72 bytes |
| [n884](../Objects.level.bin对象实现清单.html#RainMid%3An884) | BstNode_2345993232 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 190008 + 72 bytes |
| [n1021](../Objects.level.bin对象实现清单.html#RainMid%3An1021) | BstNode_2345993241 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 212644 + 72 bytes |
| [n1094](../Objects.level.bin对象实现清单.html#RainMid%3An1094) | BstNode_1277 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 226240 + 66 bytes |
| [n1145](../Objects.level.bin对象实现清单.html#RainMid%3An1145) | BstNode_1299 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 235977 + 66 bytes |
| [n1253](../Objects.level.bin对象实现清单.html#RainMid%3An1253) | BstNode_1261 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 255893 + 66 bytes |
| [n1254](../Objects.level.bin对象实现清单.html#RainMid%3An1254) | BstNode_1283 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 255959 + 66 bytes |
| [n1378](../Objects.level.bin对象实现清单.html#RainMid%3An1378) | BstNode_2345993262 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 278047 + 72 bytes |
| [n1379](../Objects.level.bin对象实现清单.html#RainMid%3An1379) | BstNode_110 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 278119 + 65 bytes |
| [n1458](../Objects.level.bin对象实现清单.html#RainMid%3An1458) | BstNode_2345993271 | 20%（2/10），运行待验 | 2 / 0 | RainMid · 292226 + 72 bytes |
| [n1493](../Objects.level.bin对象实现清单.html#RainMid%3An1493) | BstNode_1298 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 299548 + 66 bytes |
| [n1724](../Objects.level.bin对象实现清单.html#RainMid%3An1724) | BstNode_1288 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 343276 + 66 bytes |
| [n1755](../Objects.level.bin对象实现清单.html#RainMid%3An1755) | BstNode_1285 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 348794 + 66 bytes |
| [n1809](../Objects.level.bin对象实现清单.html#RainMid%3An1809) | BstNode_2345993243 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 357662 + 72 bytes |
| [n1818](../Objects.level.bin对象实现清单.html#RainMid%3An1818) | BstNode_2345993082 | 20%（2/10），运行待验 | 3 / 3 | RainMid · 359000 + 72 bytes |
| [n1853](../Objects.level.bin对象实现清单.html#RainMid%3An1853) | BstNode_736 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 363571 + 65 bytes |
| [n1860](../Objects.level.bin对象实现清单.html#RainMid%3An1860) | BstNode_2345993242 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 364614 + 72 bytes |
| [n1865](../Objects.level.bin对象实现清单.html#RainMid%3An1865) | BstNode_1281 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 365403 + 66 bytes |
| [n1882](../Objects.level.bin对象实现清单.html#RainMid%3An1882) | BstNode_2345993231 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 368199 + 72 bytes |
| [n1923](../Objects.level.bin对象实现清单.html#RainMid%3An1923) | BstNode_2345993239 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 374449 + 72 bytes |
| [n1956](../Objects.level.bin对象实现清单.html#RainMid%3An1956) | BstNode_735 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 379867 + 65 bytes |
| [n2102](../Objects.level.bin对象实现清单.html#RainMid%3An2102) | BstNode_2345993234 | 20%（2/10），运行待验 | 2 / 2 | RainMid · 405990 + 72 bytes |
| [n2155](../Objects.level.bin对象实现清单.html#RainMid%3An2155) | BstNode_1806 | 20%（2/10），运行待验 | 2 / 1 | RainMid · 418222 + 66 bytes |
| [n303](../Objects.level.bin对象实现清单.html#SkyHub2%3An303) | BstNode_1167524262 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 91019 + 72 bytes |
| [n424](../Objects.level.bin对象实现清单.html#SkyHub2%3An424) | BstNode_1167524263 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 113882 + 72 bytes |
| [n461](../Objects.level.bin对象实现清单.html#SkyHub2%3An461) | BstNode_1293287467 | 20%（2/10），运行待验 | 3 / 2 | SkyHub2 · 121858 + 85 bytes |
| [n828](../Objects.level.bin对象实现清单.html#SkyHub2%3An828) | BstNode_2345992290 | 20%（2/10），运行待验 | 3 / 1 | SkyHub2 · 185794 + 85 bytes |
| [n847](../Objects.level.bin对象实现清单.html#SkyHub2%3An847) | BstNode_1293287457 | 20%（2/10），运行待验 | 3 / 2 | SkyHub2 · 188247 + 85 bytes |
| [n861](../Objects.level.bin对象实现清单.html#SkyHub2%3An861) | BstNode_1049165965 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 190366 + 72 bytes |
| [n999](../Objects.level.bin对象实现清单.html#SkyHub2%3An999) | BstNode_1682898970 | 20%（2/10），运行待验 | 2 / 3 | SkyHub2 · 214774 + 72 bytes |
| [n1475](../Objects.level.bin对象实现清单.html#SkyHub2%3An1475) | BstNode_1682898969 | 20%（2/10），运行待验 | 2 / 3 | SkyHub2 · 286270 + 72 bytes |
| [n1609](../Objects.level.bin对象实现清单.html#SkyHub2%3An1609) | BstNode_2345992306 | 20%（2/10），运行待验 | 3 / 1 | SkyHub2 · 309282 + 85 bytes |
| [n1756](../Objects.level.bin对象实现清单.html#SkyHub2%3An1756) | BstNode_1167524252 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 332348 + 72 bytes |
| [n1967](../Objects.level.bin对象实现清单.html#SkyHub2%3An1967) | BstNode_1167524260 | 20%（2/10），运行待验 | 2 / 2 | SkyHub2 · 373498 + 72 bytes |
| [n2053](../Objects.level.bin对象实现清单.html#SkyHub2%3An2053) | BstNode_1049165966 | 20%（2/10），运行待验 | 2 / 0 | SkyHub2 · 386317 + 72 bytes |
| [n2322](../Objects.level.bin对象实现清单.html#SkyHub2%3An2322) | BstNode_34603022 | 20%（2/10），运行待验 | 2 / 1 | SkyHub2 · 436903 + 70 bytes |
| [n756](../Objects.level.bin对象实现清单.html#Storm%3An756) | BstNode_1293287476 | 20%（2/10），运行待验 | 2 / 2 | Storm · 158669 + 85 bytes |
| [n804](../Objects.level.bin对象实现清单.html#Storm%3An804) | BstNode_895 | 20%（2/10），运行待验 | 2 / 2 | Storm · 166296 + 65 bytes |
| [n1014](../Objects.level.bin对象实现清单.html#Storm%3An1014) | BstNode_2529560118 | 20%（2/10），运行待验 | 2 / 2 | Storm · 202662 + 85 bytes |
| [n433](../Objects.level.bin对象实现清单.html#StormEnd%3An433) | BstNode_3156082694 | 20%（2/10），运行待验 | 3 / 1 | StormEnd · 101326 + 72 bytes |
| [n512](../Objects.level.bin对象实现清单.html#StormEnd%3An512) | BstNode_3156082693 | 20%（2/10），运行待验 | 3 / 1 | StormEnd · 114446 + 72 bytes |
| [n710](../Objects.level.bin对象实现清单.html#StormEnd%3An710) | BstNode_2446917636 | 20%（2/10），运行待验 | 3 / 1 | StormEnd · 143438 + 72 bytes |
| [n737](../Objects.level.bin对象实现清单.html#StormEnd%3An737) | BstNode_2529558626 | 20%（2/10），运行待验 | 2 / 0 | StormEnd · 146705 + 72 bytes |
| [n738](../Objects.level.bin对象实现清单.html#StormEnd%3An738) | BstNode_2446917637 | 20%（2/10），运行待验 | 3 / 1 | StormEnd · 146777 + 72 bytes |
| [n565](../Objects.level.bin对象实现清单.html#Sunset%3An565) | BstNode_2529558593 | 20%（2/10），运行待验 | 3 / 2 | Sunset · 128209 + 82 bytes |
| [n878](../Objects.level.bin对象实现清单.html#Sunset%3An878) | BstNode_1985 | 20%（2/10），运行待验 | 3 / 2 | Sunset · 179648 + 66 bytes |
| [n968](../Objects.level.bin对象实现清单.html#Sunset%3An968) | BstNode_2529558592 | 20%（2/10），运行待验 | 3 / 2 | Sunset · 193862 + 72 bytes |
| [n1062](../Objects.level.bin对象实现清单.html#Sunset%3An1062) | BstNode_2529558604 | 20%（2/10），运行待验 | 3 / 2 | Sunset · 207876 + 82 bytes |
| [n1126](../Objects.level.bin对象实现清单.html#Sunset%3An1126) | BstNode_2529558603 | 20%（2/10），运行待验 | 3 / 2 | Sunset · 217873 + 72 bytes |
| [n1290](../Objects.level.bin对象实现清单.html#Sunset%3An1290) | BstNode_34603036 | 20%（2/10），运行待验 | 2 / 1 | Sunset · 244796 + 70 bytes |
| [n1420](../Objects.level.bin对象实现清单.html#Sunset%3An1420) | BstNode_1982 | 20%（2/10），运行待验 | 3 / 2 | Sunset · 264692 + 66 bytes |
| [n583](../Objects.level.bin对象实现清单.html#SunsetEnd%3An583) | BstNode_2003 | 20%（2/10），运行待验 | 2 / 2 | SunsetEnd · 125193 + 66 bytes |
| [n745](../Objects.level.bin对象实现清单.html#SunsetEnd%3An745) | BstNode_1167523878 | 20%（2/10），运行待验 | 2 / 3 | SunsetEnd · 151478 + 72 bytes |
| [n1460](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1460) | BstNode_1167523987 | 20%（2/10），运行待验 | 2 / 3 | SunsetEnd · 273513 + 72 bytes |
| [n1598](../Objects.level.bin对象实现清单.html#SunsetEnd%3An1598) | BstNode_2002 | 20%（2/10），运行待验 | 2 / 2 | SunsetEnd · 298221 + 66 bytes |
| [n102](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An102) | BstNode_1167524010 | 20%（2/10），运行待验 | 2 / 3 | SunsetEnd2 · 42475 + 72 bytes |
| [n312](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An312) | BstNode_656801890 | 20%（2/10），运行待验 | 2 / 2 | SunsetEnd2 · 86627 + 71 bytes |
| [n382](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An382) | BstNode_2279669980 | 20%（2/10），运行待验 | 2 / 2 | SunsetEnd2 · 101333 + 72 bytes |
| [n745](../Objects.level.bin对象实现清单.html#SunsetEnd2%3An745) | BstNode_1167524007 | 20%（2/10），运行待验 | 2 / 3 | SunsetEnd2 · 183287 + 72 bytes |
| [n207](../Objects.level.bin对象实现清单.html#SunsetRace%3An207) | BstNode_1167524052 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 59318 + 72 bytes |
| [n412](../Objects.level.bin对象实现清单.html#SunsetRace%3An412) | BstNode_1167524059 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 105178 + 84 bytes |
| [n512](../Objects.level.bin对象实现清单.html#SunsetRace%3An512) | BstNode_1167524019 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 126746 + 72 bytes |
| [n586](../Objects.level.bin对象实现清单.html#SunsetRace%3An586) | BstNode_1167524007 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 140304 + 72 bytes |
| [n714](../Objects.level.bin对象实现清单.html#SunsetRace%3An714) | BstNode_1167524010 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 163387 + 72 bytes |
| [n1576](../Objects.level.bin对象实现清单.html#SunsetRace%3An1576) | BstNode_1167524054 | 20%（2/10），运行待验 | 2 / 2 | SunsetRace · 321428 + 84 bytes |
