# Objects.level.bin 按单独类功能分类的实现清单

覆盖 33 张地图、49,824 个对象、280 种顶层对象类，以及嵌套/仅声明类型，总计 283 个实际声明类型。全部完整解析、引用有效、无修改回写逐字节一致。

主结构为功能分组 → 单独类 → 该类全部实例；地图仅作原始来源信息。每类都有单独功能描述和实施项，音频与混音独立分组。每类使用下面相同 10 项检查。进度只计已验证项；部分完成单列。字段解析、原函数子链和完整运行分开验收。**清单比例不是完整类行为或游戏还原比例**；目前完整类运行验收为 0 类。按类平均检查项进度为 31.27%，不按对象数量加权。

优先 Windows 原材质 Vulkan 的原游戏渲染方法、卡顿与换图优化，再继续 Objects.level.bin；沿 Model/LOD/Visibility/RenderList 及环境依赖推进。先逆向原加载、创建、注册、更新和销毁整体调用链，再按原依赖从基础类向功能类推进。引用到未实现的玩法、交互、UI、贴图、音频、shader、BstBaked 或 Avatar 功能时一同恢复。最终目标为原游戏逻辑 100% 还原；五个 BstBaked 段仍以各 9/10 为真机验收前阶段目标，最后一项为真机与原游戏校验。

全部类与对象：[实现总清单](Objects.level.bin全部实现清单.md) · [全部对象详情](Objects.level.bin对象实现清单.html)。

交互清单：[搜索、筛选和展开每类详情](Objects.level.bin类进度.html)；机器可读清单：[Objects.level.bin类进度.json](Objects.level.bin类进度.json)。按领域的旧清单见 [Objects与Avatar清单](Objects与Avatar清单.md)，其分母不同。

1. 实际类声明、实例与引用清点
2. 全地图解析和无修改逐字节回写
3. 此类原字段注册证据已提取
4. 完整原构造与缺字段默认值
5. 完整加载、注册与启用传播
6. 明确范围的原核心子链已独立核验
7. 完整类行为、事件及依赖调用
8. 实际场景、绘制或游戏 UI 接入
9. 切图、注销、销毁及状态恢复
10. Windows 真机与原游戏验收

核心子链项只对明确的原输出范围计分；完整类行为仍由第 7 项验收。原字段项表示该类注册证据已提取，继承/默认值另验。地图节点、嵌套实例、只有声明的类型分别计数；未把其余 RTTI 类型充作当前文件实例。

## 场景基础与对象变换

容器、空间标记、对象层级及变换控制。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [Clump](Objects类清单/Clump.md) | 对象引用容器 | 9627 | 40%（4/10） | 3 | 环境范围的 Marker 成员和计时控制已核验；嵌套启用传播、事件顺序与通用 Clump 生命周期待恢复。 本轮共享TGCL字段子链含24个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Clump的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |
| [MakeFloaty](Objects类清单/MakeFloaty.md) | 对象浮动、旋转与错峰动画 | 10 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Marker](Objects类清单/Marker.md) | 位置、旋转、缩放与启用的空间标记 | 6538 | 40%（4/10） | 5 | 原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 |
| [Parent](Objects类清单/Parent.md) | 对象父子跟随与关节挂接 | 270 | 40%（4/10） | 4 | 已有Parent普通分配/placement与live enabled接口。本轮补ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除：639组含270原对象对应540次准备创建/释放，21297516字节零差异。保留未写enabled/跟随指针、name描述符、dirty、非active目标匹配与实时allocator/节点回调读序；同一OriginalParentEndpoint创建/释放/复用核验。元数据、字符串池和node解除仍为显式服务；真实jointName内容、TGCL/cache/实际Barn启动、依赖排序/关节/跟随更新与完整类尚未闭合。 |
| [RiseWhenStoodOn](Objects类清单/RiseWhenStoodOn.md) | 站立交互引发网格升起 | 4 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [RotateObject](Objects类清单/RotateObject.md) | 对象旋转范围与速度控制 | 8 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [StrobeObject](Objects类清单/StrobeObject.md) | 对象闪烁、时长与结束状态 | 12 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [TransformObject](Objects类清单/TransformObject.md) | 对象变换目标、过渡与完成事件 | 317 | 40%（4/10） | 4 | 原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |
| [Tweener](Objects类清单/Tweener.md) | 属性与变换补间控制 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 轨道、导航与引导

曲线数据、路径跟随和轨道附着。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AddPoi](Objects类清单/AddPoi.md) | 标记定义的关注点与权重 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AttachBeacon](Objects类清单/AttachBeacon.md) | 空间信标、颜色与强度过渡 | 14 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AttachGuideRail](Objects类清单/AttachGuideRail.md) | 附加轨道引导与运动限制 | 20 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Boundary](Objects类清单/Boundary.md) | 轨道定义的场景边界 | 34 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [MoveObjectAlongRail](Objects类清单/MoveObjectAlongRail.md) | 对象沿轨道运动 | 232 | 40%（4/10） | 5 | 已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。 |
| [Rail](Objects类清单/Rail.md) | 轨道曲线、循环与更新 | 402 | 40%（4/10） | 2 | 402 条轨道的缓存、正常输入样条、最近点和弧长子链已核验；退化查询、自动失效和 macOS 数学库仍有缺口。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。 |
| [TrackAvatarOnRail](Objects类清单/TrackAvatarOnRail.md) | 按玩家位置跟踪轨道对象 | 7 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Waypoint](Objects类清单/Waypoint.md) | 导航点与范围 | 9 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 地图加载、出生与检查点

地图切换、入口选择、加载事件及恢复。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AvatarSetPos](Objects类清单/AvatarSetPos.md) | 玩家定位、相对标记与出生入口 | 59 | 40%（4/10） | 3 | 59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。 |
| [ChangeLevelWithFade](Objects类清单/ChangeLevelWithFade.md) | 带淡入淡出的地图切换 | 28 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Checkpoint](Objects类清单/Checkpoint.md) | 检查点记录与恢复区域 | 126 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CheckpointRestore](Objects类清单/CheckpointRestore.md) | 恢复检查点与重载控制 | 24 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CheckpointState](Objects类清单/CheckpointState.md) | 恢复时启用的对象集合 | 17 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [HasReachedLevel](Objects类清单/HasReachedLevel.md) | 已到达地图条件事件 | 11 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [IsLatestCheckpoint](Objects类清单/IsLatestCheckpoint.md) | 检查最新检查点与事件 | 8 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [LevelLink](Objects类清单/LevelLink.md) | 地图连接、锚点与加载事件 | 64 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [LevelParameters](Objects类清单/LevelParameters.md) | 地图与烘焙生成全局参数 | 33 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnLevelStart](Objects类清单/OnLevelStart.md) | 地图启动事件 | 21 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnLevelUp](Objects类清单/OnLevelUp.md) | 等级变化事件 | 5 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ResumeEnable](Objects类清单/ResumeEnable.md) | 恢复时启用对象 | 5 | 40%（4/10） | 4 | 原64-byte placement与Update接上Clump OnResumeEnabled→ObjectFactory TryResume→原方法查找/反射wrapper；Clump/Enable恢复方法及无方法的普通SetEnabled回退一起恢复。联合906组、4313快照、398249100字节原机器码0差异，包含全部5个实际ResumeEnable根配置；嵌套Clump、Marker启用、Enable保存false/killEvents后续调度、Delay重启、原null/required/receiver断言通过。25个原断言、1个长度错误服务与227次缺失类服务边界分列。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker变换/场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 |
| [ResumeGate](Objects类清单/ResumeGate.md) | 恢复流程门控 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [StreamLevelLink](Objects类清单/StreamLevelLink.md) | 带轨道、门槛和场景引导的地图连接 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 摄像机与镜头

相机引导、关键帧、切换与震动。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [CameraGuide](Objects类清单/CameraGuide.md) | 空间摄像机引导与画面构图 | 395 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CameraKeyFrame](Objects类清单/CameraKeyFrame.md) | 镜头关键帧、视场角与运动参数 | 987 | 40%（4/10） | 4 | 原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。 |
| [PauseCameraConfig](Objects类清单/PauseCameraConfig.md) | 摄像机配置保持、淡入和暂停 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetCameraKeyFrameShake](Objects类清单/SetCameraKeyFrameShake.md) | 关键帧震动参数与过渡 | 10 | 40%（4/10） | 2 | 原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。先推进计时，再逐个反射解析并写入关键帧idle/moving/speed；保留未夹紧的淡出与成员变更后的重读，结束使用大于等于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机震动采样/绘制及完整运行仍待恢复。 |
| [SetCameraShake](Objects类清单/SetCameraShake.md) | 摄像机震动强度与时长 | 10 | 40%（4/10） | 2 | 原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。原Whisker速度/幅度/权重写入，先输出后推进计时；结束使用严格大于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机/避障及完整运行仍待恢复。 本轮新增完整Whisker震动/基底辅助函数核验：162组、1,296帧、2,126,416字节零差异，含10条真实speed/force输入；原三轴哈希噪声、事件权重幂次混合/衰减及射线/擦身音效请求参数已核对。Avatar已接位置震动，暂停/停止/重启保留基准镜头；物理、Wind、射线和音效为服务，原连续相机、避障和关键帧震动未闭合。 |
| [SnapToCam](Objects类清单/SnapToCam.md) | 摄像机切换、注视与过渡 | 732 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 模型、材质与绘制

模型资源、烘焙、材质与绘制状态。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [Beamo](Objects类清单/Beamo.md) | 密度模型、LOD、材质与烘焙参数 | 6598 | 40%（4/10） | 5 | 原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 |
| [BeamoDecal](Objects类清单/BeamoDecal.md) | 模型贴花、距离与材质绑定 | 552 | 40%（4/10） | 5 | 原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 |
| [DropOcclusion](Objects类清单/DropOcclusion.md) | 遮挡对象、强度和淡入淡出 | 64 | 30%（3/10） | 1 | 已有共享 Visibility 数值内核；此类原对象/Clump 提交与启用/销毁依赖待恢复。 |
| [LevelMaterial](Objects类清单/LevelMaterial.md) | 原材质、shader、参数与物理材质绑定 | 309 | 40%（4/10） | 4 | 原构造、16槽分配、首个GUID匹配、MaterialDef查找与交织参数生成、默认shader名和刷新传播已核验；原场景加载/完整GPU上传/物理材质/销毁仍待恢复。 本轮共享TGCL字段子链含16个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 |
| [LevelMesh](Objects类清单/LevelMesh.md) | 场景模型、资源、烘焙及几何生成参数 | 4133 | 40%（4/10） | 5 | 已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。 |
| [LevelMeshShaderParam](Objects类清单/LevelMeshShaderParam.md) | 模型 shader 参数声明 | 0 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [LevelShaderParam](Objects类清单/LevelShaderParam.md) | shader 参数声明 | 0 | 40%（4/10） | 3 | 原 LevelMaterial 内嵌16项参数构造、默认名字/类型/数值或纹理赋值及长短字符串已核验；独立装载、完整GPU上传/默认资源和销毁仍待恢复。 |
| [SetAvatarRender](Objects类清单/SetAvatarRender.md) | 本地与远端玩家绘制开关 | 13 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetMeshShaderParam](Objects类清单/SetMeshShaderParam.md) | 模型 uniform 值与过渡 | 359 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetRender](Objects类清单/SetRender.md) | 模型绘制开关 | 10 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 地形生成

地形密度、分组、预制体及烘焙来源。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [TerrainBlob](Objects类清单/TerrainBlob.md) | 地形密度形状、噪声与侵蚀参数 | 7174 | 40%（4/10） | 4 | 原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。 |
| [TerrainBlobGroup](Objects类清单/TerrainBlobGroup.md) | 地形对象集合、网格生成与细分配置 | 109 | 30%（3/10） | 2 | 已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。 |
| [TerrainBlobPrefab](Objects类清单/TerrainBlobPrefab.md) | 地形预制资源、变换与生成顺序 | 316 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 云、风场与环境

环境参数、云对象、风场和空间混合。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [CloudBob](Objects类清单/CloudBob.md) | 云对象运动及缓冲偏移 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CloudCard](Objects类清单/CloudCard.md) | 云卡模型、烘焙与透明度 | 356 | 40%（4/10） | 3 | 世界球、连接组、排序和动态顶点等明确子链已核验；自动对象注册、真实照明/遮挡/风场和完整绘制待恢复。 |
| [EnvNode](Objects类清单/EnvNode.md) | 空间环境参数与混合 | 134 | 40%（4/10） | 4 | 原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。 |
| [SetEnvDefault](Objects类清单/SetEnvDefault.md) | 设置默认环境参数 | 29 | 40%（4/10） | 2 | 公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。 |
| [SetEnvHull](Objects类清单/SetEnvHull.md) | 设置区域环境参数 | 4 | 40%（4/10） | 2 | 原存储转换和 Clump 环境范围子链已核验；自动激活/事件及动态生命周期待恢复。 |
| [SetWind](Objects类清单/SetWind.md) | 全局或区域风场设置 | 4 | 30%（3/10） | 0 | 节点和 Wind 引用已清点；全局阵风核心不能代替 SetWind 类的原事件/启用行为。 |
| [Wind](Objects类清单/Wind.md) | 区域、轨道与附加标记的风场 | 120 | 40%（4/10） | 2 | 范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。 |

## 水、雾与天气

水面、体积雾、降雨与空间天气。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [DarkstoneRainRegion](Objects类清单/DarkstoneRainRegion.md) | 区域降落物、收集物与能量消耗 | 11 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [FogVolumeSphere](Objects类清单/FogVolumeSphere.md) | 球形体积雾与可见性参数 | 78 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [RainCurtainParams](Objects类清单/RainCurtainParams.md) | 雨幕标记、雨滴密度和尺寸 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetOceanRender](Objects类清单/SetOceanRender.md) | 海洋绘制开关 | 15 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetRainParams](Objects类清单/SetRainParams.md) | 降雨强度、速度与过渡 | 13 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Water](Objects类清单/Water.md) | 水面空间与阴影配置 | 38 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 数值变量与运算

Float 输入、输出、插值与条件表达式。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AddFloatToStatUsingName](Objects类清单/AddFloatToStatUsingName.md) | 命名统计值增加浮点输入 | 21 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Float](Objects类清单/Float.md) | 浮点值对象 | 184 | 40%（4/10） | 3 | 原24-byte Float构造保留值/回链/padding，184个实际保存值及运算别名已核验。本轮ObjectFactory→ValueBarn/EventBarn创建→字段/局部引用修复→触发登记→原OnLevelLoad/Update接入FloatMult/FloatAdd/SetFloat：全部14/31/4个真实配置子图；基础2278组、40个命名原函数及1个区间、0差异，2435个快照。完整metadata/default缓存、堆内部、对象名字、多功能类和场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |
| [FloatAdd](Objects类清单/FloatAdd.md) | 增量、限制范围及逐帧输出 | 31 | 40%（4/10） | 4 | 完整增量执行与EventBarn同帧收尾已有核验。本轮补原96-byte placement构造、字段装载/引用修复、触发登记与OnLevelLoad/Update连接，全部31个真实配置保留保存值/autoStart/节点顺序；184组自动子链覆盖空amountFloat/output回退、别名反馈、先max后min、单次与逐帧执行。基础2278组、40个命名原函数及1个区间、0差异。metadata/default缓存、堆内部、对象名字、多功能类与实际场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |
| [FloatDistanceFade](Objects类清单/FloatDistanceFade.md) | 按位置或摄像机距离映射浮点值 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [FloatMult](Objects类清单/FloatMult.md) | 两项浮点输入相乘 | 14 | 40%（4/10） | 4 | 原乘法、单NaN和别名运算已核验；本轮接通ObjectFactory→触发槽/唯一ID/每类索引→字段装载/引用修复→原OnLevelLoad/Update→乘法→释放。全部14个真实FloatMult子图保留值、autoStart和节点顺序，使用局部重映射引用表；151组新增触发/自动链输入中132组执行成功、19组原断言快照，622个逐帧状态、0差异。基础总报告2278组、40个命名原函数及1个区间。停用/恢复与非空类型树清理已核验；完整metadata/默认缓存、堆内部、对象名字及实际关卡生命周期待闭合，双NaN仍依赖明确服务。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |
| [FloatSplit](Objects类清单/FloatSplit.md) | 按连续区间映射输入到多个浮点输出 | 2 | 40%（4/10） | 5 | 原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |
| [OnFloat](Objects类清单/OnFloat.md) | 浮点条件组合与事件 | 94 | 40%（4/10） | 5 | 原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |
| [SetDroppableCountFloat](Objects类清单/SetDroppableCountFloat.md) | 可掉落数量到浮点输出 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetFloat](Objects类清单/SetFloat.md) | 浮点目标值与时间过渡 | 4 | 40%（4/10） | 4 | 原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |

## 事件调度与逻辑条件

时间序列、启用传播与条件分支。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [Branch](Objects类清单/Branch.md) | 事件分支与触发规则 | 3 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DebugLogline](Objects类清单/DebugLogline.md) | 日志文本事件 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Delay](Objects类清单/Delay.md) | 时间、帧或节拍延迟事件 | 284 | 40%（4/10） | 4 | 完整80-byte placement、OnEnable/OnResume及Update已恢复并接ClumpBarn/ValueBarn/EventBarn→TGCL字段/引用→继承反射→数值事件→释放重建联合核验。486组、2119快照、160615784字节0差异，含283/284个真实Delay根图片段；另1个超过核验器48节点容量。时间/帧、错开发送、beat门控、停止和重新启用、原Clump断言已核验。真实片段至多6帧，长延迟可能未到输出时间；9个原断言与244次缺失类服务边界分列。音乐beat、Game/Time初始状态、metadata/default缓存准备、堆/池、实际场景反馈及Windows/原游戏仍待闭合，完整类和实例保持0。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。 |
| [Enable](Objects类清单/Enable.md) | 对象集合启用、禁用及事件终止 | 1287 | 40%（4/10） | 3 |  本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Enable的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。 |
| [EventSeries](Objects类清单/EventSeries.md) | 事件序列状态与重置计时 | 11 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [FireTriggerAtRandom](Objects类清单/FireTriggerAtRandom.md) | 随机间隔及事件选择 | 9 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [IfEnabled](Objects类清单/IfEnabled.md) | 对象集合启用状态条件 | 36 | 40%（4/10） | 4 | 完整 OR 条件逐一查询、反向条件、事件逐一启用和 checkOnce 已核验；真实 Get/SetEnabled 元数据链与对象生命周期待闭合，大于65535项的原回绕保留为未支持范围。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 |
| [IfTweakVar](Objects类清单/IfTweakVar.md) | 原调试变量条件分支 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnChangeAnd](Objects类清单/OnChangeAnd.md) | 集合状态与 AND 条件变化 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnEventSeries](Objects类清单/OnEventSeries.md) | 序列数量与触发规则 | 4 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ScheduledEvent](Objects类清单/ScheduledEvent.md) | 命名计划事件与对象集合 | 28 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetGlobalEventParameter](Objects类清单/SetGlobalEventParameter.md) | 全局事件参数设置 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Timeline](Objects类清单/Timeline.md) | 时间轴对象和时间节点调度 | 293 | 30%（3/10） | 1 | 293 个节点已清点；原时间推进、循环、暂停和事件派发顺序待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 |
| [TimelineNode](Objects类清单/TimelineNode.md) | 时间轴时间与目标对象声明 | 0 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 区域、喊叫与空间触发

位置、进入离开、人数和空间条件事件。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [Critter_OnRegion](Objects类清单/Critter_OnRegion.md) | 生物集合进入区域条件 | 4 | 40%（4/10） | 2 | 原父构造和缺省／保存字段已恢复并检查 4 个真实实例；区域碰撞、成员创建／释放、CritterV2 消息和完整 Update 仍待接。 |
| [IfInRegion](Objects类清单/IfInRegion.md) | 区域内或区域外条件触发 | 30 | 30%（3/10） | 0 | 节点与引用已清点；原区域条件、Marker/Clump 消费和分支执行待恢复。 |
| [IsOutfitInRegion](Objects类清单/IsOutfitInRegion.md) | 区域内装扮与玩家条件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [NotOnRegion](Objects类清单/NotOnRegion.md) | 区域外事件触发 | 16 | 30%（3/10） | 0 | 节点与引用已清点；原反向区域条件和启用/事件规则待恢复。 |
| [OnAvatarEnergy](Objects类清单/OnAvatarEnergy.md) | 玩家能量与区域条件事件 | 10 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnAvatarOnGround](Objects类清单/OnAvatarOnGround.md) | 玩家落地、速度与区域条件事件 | 9 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnMoteCarry](Objects类清单/OnMoteCarry.md) | 光点携带开始或结束事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnRegion](Objects类清单/OnRegion.md) | 进入离开、逐帧和人数条件区域触发 | 381 | 40%（4/10） | 5 | 381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。 |
| [OnShout](Objects类清单/OnShout.md) | 指定标记区域内喊叫事件 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnTapCount](Objects类清单/OnTapCount.md) | 区域内点击次数事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 碰撞、受力与移动限制

碰撞几何、受力和运动区域。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [BoomCone](Objects类清单/BoomCone.md) | 锥形冲量、时长与继承速度 | 2 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [EnableCollision](Objects类清单/EnableCollision.md) | 碰撞几何开关 | 4 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ForwardAcceleration](Objects类清单/ForwardAcceleration.md) | 区域方向与地面空中加速度 | 3 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [KillBox](Objects类清单/KillBox.md) | 空间死亡区域 | 146 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [MakeMagnetize](Objects类清单/MakeMagnetize.md) | 标记区域吸附与反重力 | 21 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [PlatformingRegion](Objects类清单/PlatformingRegion.md) | 平台运动区域 | 7 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetAvatarMinYSpeed](Objects类清单/SetAvatarMinYSpeed.md) | 玩家最小竖直速度与起飞 | 13 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetForce](Objects类清单/SetForce.md) | 标记区域内受力与速度限制 | 3 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 玩家状态与输入

能量、姿态、飞行、输入和玩家控制。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AvatarAirtimeEffectFloat](Objects类清单/AvatarAirtimeEffectFloat.md) | 玩家滞空效果的浮点输出 | 3 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarBreakHandHold](Objects类清单/AvatarBreakHandHold.md) | 玩家牵手关系解除 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarChargeEnergy](Objects类清单/AvatarChargeEnergy.md) | 按速率与时长补充玩家能量 | 22 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarForceEnableFlightMode](Objects类清单/AvatarForceEnableFlightMode.md) | 强制启用飞行模式 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarGrindToPos](Objects类清单/AvatarGrindToPos.md) | 玩家轨道式定位与停止 | 46 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarHijack](Objects类清单/AvatarHijack.md) | 玩家控制接管与恢复 | 8 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarSetCandleState](Objects类清单/AvatarSetCandleState.md) | 玩家蜡烛状态 | 4 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarSetEnergy](Objects类清单/AvatarSetEnergy.md) | 玩家能量设定或增量 | 7 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarSetEnergyCapacity](Objects类清单/AvatarSetEnergyCapacity.md) | 玩家能量容量与时间过渡 | 8 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarSetInnerGlow](Objects类清单/AvatarSetInnerGlow.md) | 玩家内发光强度与过渡 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarSetStance](Objects类清单/AvatarSetStance.md) | 站立、坐下、睡眠与朝向姿态 | 11 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AvatarSetZeroG](Objects类清单/AvatarSetZeroG.md) | 玩家零重力与能量状态 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DisableCliffJump](Objects类清单/DisableCliffJump.md) | 悬崖跳跃限制 | 2 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DisableDpad](Objects类清单/DisableDpad.md) | 方向输入限制 | 2 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DisableJump](Objects类清单/DisableJump.md) | 跳跃限制 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DisableRise](Objects类清单/DisableRise.md) | 上升动作限制 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DisableStep](Objects类清单/DisableStep.md) | 步行动作限制 | 2 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DoShout](Objects类清单/DoShout.md) | 在指定位置发起喊叫效果 | 59 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetBlockUpdraftWind](Objects类清单/SetBlockUpdraftWind.md) | 上升风场作用限制 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetFlightParams](Objects类清单/SetFlightParams.md) | 飞行巡航角与升力配置 | 4 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetGlide](Objects类清单/SetGlide.md) | 滑翔与飞行能力开关 | 7 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetInputState](Objects类清单/SetInputState.md) | 玩家与摄像机输入开关 | 38 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [StopGrinding](Objects类清单/StopGrinding.md) | 停止轨道运动并关联动画 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 动画、回放与装扮

动画播放、动作、回放及衣柜事件。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [CloseOutfitShop](Objects类清单/CloseOutfitShop.md) | 关闭装扮商店 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnOutfitShopPurchase](Objects类清单/OnOutfitShopPurchase.md) | 装扮购买事件 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnTapPlayAnim](Objects类清单/OnTapPlayAnim.md) | 点击动作动画、延迟与进度事件 | 26 | 30%（3/10） | 0 | 26 个节点及动作字段已清点；原交互/解锁条件、动画序列和动作 UI 事件待恢复。 |
| [OnUnlockOutfit](Objects类清单/OnUnlockOutfit.md) | 装扮解锁后启用对象 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OutfitSelect](Objects类清单/OutfitSelect.md) | 衣柜、区域、商店与购买事件 | 12 | 30%（3/10） | 0 | 节点及 115 条 OutfitDefs/七槽资源已清点；账户解锁、原衣柜 UI、资源/配色/配件和换装事件待恢复。 |
| [PlayAnimation](Objects类清单/PlayAnimation.md) | 对象动画序列、速度与状态 | 187 | 40%（4/10） | 5 | 原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。 |
| [PlayAvatarAnimSeq](Objects类清单/PlayAvatarAnimSeq.md) | 本地或远端玩家动画序列 | 42 | 30%（3/10） | 0 | 42 个节点及动画包资源已清点；animpack 轨道、骨架、序列/混合、玩家状态与动作 UI 待恢复。 |
| [Replay](Objects类清单/Replay.md) | 玩家回放及 NPC 显示控制 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Replay_HandHold](Objects类清单/Replay_HandHold.md) | 回放玩家与 NPC 牵手 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Replay_PlayAnim](Objects类清单/Replay_PlayAnim.md) | 回放玩家动画 | 4 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## NPC 行为与社交

NPC 状态、运动、动画、互动和回调。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [Npc](Objects类清单/Npc.md) | NPC 模型、动画、装扮与玩家状态 | 67 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_BreakHandHold](Objects类清单/Npc_BreakHandHold.md) | NPC 解除牵手 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_Chat](Objects类清单/Npc_Chat.md) | NPC 聊天消息 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_DisableGiftGiving](Objects类清单/Npc_DisableGiftGiving.md) | NPC 赠礼功能限制 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_DisableRelationshipMenu](Objects类清单/Npc_DisableRelationshipMenu.md) | NPC 关系菜单限制 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_GetAttention](Objects类清单/Npc_GetAttention.md) | NPC 请求关注 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_GiveCandle](Objects类清单/Npc_GiveCandle.md) | NPC 赠送蜡烛与接受事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_HandHold](Objects类清单/Npc_HandHold.md) | NPC 发起牵手 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_Hug](Objects类清单/Npc_Hug.md) | NPC 发起拥抱 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_OnHandHold](Objects类清单/Npc_OnHandHold.md) | NPC 牵手事件 | 3 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_OnHug](Objects类清单/Npc_OnHug.md) | NPC 拥抱事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_OnNicknamed](Objects类清单/Npc_OnNicknamed.md) | NPC 命名事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_OnRecieveGift](Objects类清单/Npc_OnRecieveGift.md) | NPC 收礼事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_PlayAnim](Objects类清单/Npc_PlayAnim.md) | NPC 动画播放与速度 | 54 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_Prompt](Objects类清单/Npc_Prompt.md) | NPC 交互图标与激活事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_Reflect](Objects类清单/Npc_Reflect.md) | NPC 状态向本地玩家的映射 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_SetScale](Objects类清单/Npc_SetScale.md) | NPC 身高、缩放与时间过渡 | 9 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_TakeOutFlame](Objects类清单/Npc_TakeOutFlame.md) | NPC 取出或收起火焰 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_Teleport](Objects类清单/Npc_Teleport.md) | NPC 定位 | 13 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_Turn](Objects类清单/Npc_Turn.md) | NPC 朝向过渡与完成事件 | 7 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Npc_WalkTo](Objects类清单/Npc_WalkTo.md) | NPC 移动目标与完成事件 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 生物、群体与 AI

鸟、螃蟹、暗生物、伙伴与参数。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AwakenDarkCreatures](Objects类清单/AwakenDarkCreatures.md) | 唤醒暗生物集合 | 9 | 40%（4/10） | 2 | 原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。 |
| [BirdFlock](Objects类清单/BirdFlock.md) | 鸟群发射、轨道、距离与预填充 | 58 | 40%（4/10） | 2 | 原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。 |
| [BirdV2](Objects类清单/BirdV2.md) | 鸟类实例与 AI 参数 | 184 | 40%（4/10） | 2 | 原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。 |
| [BirdV2AiParams](Objects类清单/BirdV2AiParams.md) | 鸟类追踪、群体、目标与到达参数 | 33 | 30%（3/10） | 3 | 原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 |
| [BirdV2Params](Objects类清单/BirdV2Params.md) | 鸟类运动、引导与效果参数 | 46 | 30%（3/10） | 3 | 原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 |
| [BirdV2ParamSwap](Objects类清单/BirdV2ParamSwap.md) | 替换鸟类实例参数 | 15 | 40%（4/10） | 2 | 原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。 |
| [Buddy](Objects类清单/Buddy.md) | 伙伴实例 | 1 | 40%（4/10） | 2 | 原父构造、共享 BuddyParams 五项动作初始化、普通 Load 与空 Unload 已独立核验；保留 8 项 BuddyBarn 注册顺序、玩家 ID、Marker／Model／OBB、随机状态和发现位掩码（含 32 项移位结果）。真实 Update、碰撞、联网、音效及动画 Model 生命周期仍待接；DayHubCave 保存禁用实例的独立引用已核验。 |
| [BuddyParams](Objects类清单/BuddyParams.md) | 伙伴发现、休息与动画状态参数 | 1 | 40%（4/10） | 2 | 原父构造、缺省值及动作前缀初始化已核验，保留 Idle／Walk／Run／EnterBored／ExitBored 的各自资源请求与回调读取。发现点、行为参数与 meshType 保留共享引用；真实动画资源 owner、Buddy 更新和联网仍待接。 |
| [Crab](Objects类清单/Crab.md) | 螃蟹实例 | 140 | 40%（4/10） | 2 | 原 Load／CrabAi.Initialize、自己的 CrabIdle／GoSit2／UISit 初始化、保存字段与独立骨骼动作预览已有核验。原评分／比较／评分恢复／运动读取408组、群体转向105组、Begin／Seek／End132组均与原机器码零差异。完整 CrabAi.SelectState 新增87组、12,116,664字节、2,531次调用零差异；完整 CrabAi.Update 新增139组、19,358,808字节、827次调用零差异，覆盖各状态目标、探针引导、实际群体转向、连续帧缓存、速度与转向输出，组合入口连接实际选择／比较／评分／更新。数学、metadata和场景查询依赖仍为明确服务；完整 Crab.Update、原地面／世界碰撞、真实 Model 构造／克隆、动画／交互 owner、动态提交和卸载尚未完成。手动动作预览与AI子链核验不作为完整生物验收，完整运行类仍未增加。 本轮CrabBarn归属分配49组、完整Barn.Update18组原对照零差异：指定owner优先、无指定owner按玩家轮转、零玩家除法故障、流收发分支与回调后128字节交互历史／计数复制保持原顺序。本次完整NetState／Receive／Send与实际Barn.Update组合176组、46,303,232字节、853次有序服务调用原对照零差异。保留私有目标引用转换、120字节scratch未写字段、所有权跳过、捕获发送名单、实时解码计数、重叠写回和每蟹计时器；接收计数没有默认输入，必须由解码器输出。真实网络owner、Crab外层运动／碰撞及Model／动画／GPU生命周期仍待接。 本次完整包字段编解码、实际BinaryStream位／字节／整数／量化／布尔／向量与PlayerId上下文和NetPlayerBarn映射已恢复，并接实际Barn收发；432组、113,345,280字节、489次metadata／流查找调用原对照零差异。真实缓冲中的包字节、读回字段、对齐／游标／有效位、越界与NaN断言均核验；上下文2失败读取的原私有字节须显式提供。真实传输／场景、外层运动碰撞、Model／动画／GPU和切图生命周期仍待接。 |
| [CrabParams](Objects类清单/CrabParams.md) | 螃蟹追逐、逃跑与状态参数 | 7 | 30%（3/10） | 3 | 原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 |
| [Critter_Shout](Objects类清单/Critter_Shout.md) | 生物集合喊叫音效与视觉 | 15 | 40%（4/10） | 2 | 原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。 |
| [DarkCreature](Objects类清单/DarkCreature.md) | 暗生物实例 | 13 | 40%（4/10） | 2 | 原构造／保存字段／池分配及巡逻／冷却轨道切换已核验；完整普通 Load 86 组原对照零差异，含自身模型、五项纹理、骨骼、风场、Marker 和晚期轨道断言。Model／动画／Rail 几何／资源 owner、攻击碰撞、AI、音效和动态绘制仍待接。 本轮完整警戒转换62组、返回／冷却状态64组原对照零差异；包含24组实际Motion.Seek＋SwitchRail组合，保留检测前警戒快照、检测回调后重读、十秒转换计时、头骨位置、速度缩放、冷却切轨和晚期重置。本次完整玩家／鸟目标检测与实际警戒调用者组合179组、35,741,516字节、2,854次有序服务调用原对照零差异；保留六个近锚点、能量／启用门控、严格距离／视锥筛选、原候选顺序、射线遮挡、当前目标警戒和64鸟槽边界。原atan2f／cosf显式记录重放；真实Avatar／世界／射线owner、完整外层Update、其他状态／攻击／动画／碰撞和资源owner仍待接。 本次原外层Update前半段0x10026ddb0..0x10026e7da已恢复，止于Model.SetTransform与回调owner写入，包含状态分支、上下边界更新、速度平滑、真实速度／位置积分、朝向基与缩放矩阵。完整出现辅助函数和原Motion.FollowRail已恢复并接实际Seek／SwitchRail；587组、80,561,452字节、5,656次调用原对照零差异，包含真正组合入口、阈值／NaN／有向零、私有W、目标有效性、回调重读与连续帧。该阶段仅为部分外层Update；追击／攻击内部、后半段探照／音效／交互、真实Model／动画／GPU及场景生命周期仍待接，完整生物验收仍为0。 本阶段完整Chase／Attack／Hit及实际固定AvatarBarn索引／active读取已恢复，接已验证的外层移动前半段，585组、315,046,180字节、13,024次调用原对照零差异。涵盖水平追击阻尼、锁定音效／动作、计时后攻击、目标预测与脱离方向、重复版本检查、严格命中阈值、64鸟槽与16玩家槽、当地玩家反馈、实际命中函数组合、特效／音效请求、显式私有up.W、owner／模板／调色板回调重读及连续帧。原Hit函数已恢复，但Bird.Hit及真实动画／音效／交互／粒子资源owner仍为明确服务。完整外层Update后半段、真实场景Model／动画／GPU和自主视口／切图／卸载验收仍未完成，完整生物验收仍为0。 本阶段眼部／探照0x10026e7da..0x10026f41e连成原顺序更新链，504组、68,136,704字节、12,965次调用原对照零差异，涵盖巡视／警戒扫动／锁定朝向、四元数插值、眼部变换、地面射线、玩家／鸟落点、平滑、半径10→2.5、两次环境颜色查询、检测Marker及效果到期；后续交互／声音、真实资源／世界／渲染owner和视口／切图验收仍待接。 |
| [DarkCreatureParams](Objects类清单/DarkCreatureParams.md) | 暗生物巡逻轨道与计时参数 | 13 | 30%（3/10） | 3 | 原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 |
| [DetachFromBirdGuides](Objects类清单/DetachFromBirdGuides.md) | 解除鸟类引导 | 4 | 40%（4/10） | 4 | 原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。 |
| [ReleaseBirds](Objects类清单/ReleaseBirds.md) | 释放鸟类集合 | 3 | 40%（4/10） | 4 | 原 OnEnabled 与所依赖的 Avatar 断言子函数已有独立原对照，保留 secondary forced FadeSequence(0.3,0)、实时模型／Clump重读、原平方距离严格阈值和统计递增。与 Detach 共133组、61,560,380字节零差异，接共享 EventBarn；三份实际保存配置仍因各鸟真实 Model／动画 owner 尚未装载而明确不可运行，Avatar／统计／淡出服务和完整下游生命周期继续待接。 |
| [SetBirdGuidesEnabled](Objects类清单/SetBirdGuidesEnabled.md) | 鸟类引导开关 | 4 | 40%（4/10） | 2 | 原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。 |
| [SetDarkCreaturesNetworked](Objects类清单/SetDarkCreaturesNetworked.md) | 暗生物网络同步配置 | 3 | 40%（4/10） | 2 | 原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。 |

## 收集物、蜡烛与解锁

拾取、蜡烛、收集状态、货币与奖励。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AccountAddCurrency](Objects类清单/AccountAddCurrency.md) | 账户货币增加与反馈 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CandleGate](Objects类清单/CandleGate.md) | 蜡烛放置与门控事件 | 23 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CandleObject](Objects类清单/CandleObject.md) | 蜡烛实例、寿命、点燃与蜡量 | 1077 | 40%（4/10） | 4 | 原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。 |
| [CollectCollectible](Objects类清单/CollectCollectible.md) | 触发收集指定收集物 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Collectible](Objects类清单/Collectible.md) | 收集物类型、名称与空间 | 53 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CollectibleDisplay](Objects类清单/CollectibleDisplay.md) | 按地图收集状态显示对象 | 9 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DropUnlock](Objects类清单/DropUnlock.md) | 命名掉落解锁 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Flame](Objects类清单/Flame.md) | 火焰实例、点燃、按钮与熄灭 | 290 | 40%（4/10） | 4 | 原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。 |
| [LockAllCollectible](Objects类清单/LockAllCollectible.md) | 锁定收集物状态 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnCollected](Objects类清单/OnCollected.md) | 收集与使用状态条件事件 | 7 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnFlame](Objects类清单/OnFlame.md) | 火焰集合、消耗、点燃与熄灭事件 | 154 | 40%（4/10） | 2 | 原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。 |
| [OnUnlocked](Objects类清单/OnUnlocked.md) | 解锁、未确认与未解锁事件 | 37 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Pickup](Objects类清单/Pickup.md) | 拾取物、货币与拾取反馈 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [RedeemReward](Objects类清单/RedeemReward.md) | 奖励兑换结果事件 | 4 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ReserveCurrency](Objects类清单/ReserveCurrency.md) | 预留指定货币数量 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ResetAllStormKeyProgress](Objects类清单/ResetAllStormKeyProgress.md) | 风暴钥匙进度重置 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetFlame](Objects类清单/SetFlame.md) | 火焰集合点燃状态与计时 | 43 | 40%（4/10） | 2 | 原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。 |
| [Star](Objects类清单/Star.md) | 星体收集、解锁与能量容量 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [StormKeyUnlock](Objects类清单/StormKeyUnlock.md) | 风暴钥匙解锁结果 | 5 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Unlock](Objects类清单/Unlock.md) | 命名解锁与确认事件 | 27 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 光点、碎片与灵魂

发射、携带、聚集、捕获与灵魂提交。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [Mote](Objects类清单/Mote.md) | 光点实例与初始状态 | 50 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [MoteParams](Objects类清单/MoteParams.md) | 光点运动、携带、死亡与轨道参数 | 117 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SoulDeposit](Objects类清单/SoulDeposit.md) | 灵魂提交类型、摄像机与事件 | 9 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SoulTrap](Objects类清单/SoulTrap.md) | 灵魂捕获物、几何与销毁事件 | 49 | 40%（4/10） | 1 | 原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。 |
| [SpawnMotes](Objects类清单/SpawnMotes.md) | 发射光点数量、速度与时长 | 76 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SpinMotes](Objects类清单/SpinMotes.md) | 区域光点旋转、捕获与死亡 | 4 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [StarFragment](Objects类清单/StarFragment.md) | 星体碎片实例与收集事件 | 86 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [StarFragmentParams](Objects类清单/StarFragmentParams.md) | 碎片飞行、跟随、携带与人数条件 | 17 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [StarFragmentsConverge](Objects类清单/StarFragmentsConverge.md) | 碎片汇聚、传送与完成事件 | 9 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SwapMoteParams](Objects类清单/SwapMoteParams.md) | 光点参数在区域与阶段间切换 | 14 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 任务、先祖与场景机制

任务活动、奖励、机关和剧情控制。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AchievementShrine](Objects类清单/AchievementShrine.md) | 成就机关、奖励与相机反馈 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AncestorEngine](Objects类清单/AncestorEngine.md) | 充能机关、区域与激活计时 | 51 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AncientSpirit](Objects类清单/AncientSpirit.md) | 先祖交互、动画、收集与剧情 | 42 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CarryAncestorQuestPrefab](Objects类清单/CarryAncestorQuestPrefab.md) | 先祖携带任务预制体 | 10 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [CarryCreatureQuestPrefab](Objects类清单/CarryCreatureQuestPrefab.md) | 生物携带任务预制体 | 3 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ClockBell](Objects类清单/ClockBell.md) | 钟与网格控制 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ClockTower](Objects类清单/ClockTower.md) | 钟塔与钟组控制 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DailyQuestsGiver](Objects类清单/DailyQuestsGiver.md) | 每日任务 NPC 与区域 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DeathMarch](Objects类清单/DeathMarch.md) | 剧情区域、时间轴与场景对象调度 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [FragmentCollectActivity](Objects类清单/FragmentCollectActivity.md) | 碎片数量与收集活动 | 15 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [MeditationArea](Objects类清单/MeditationArea.md) | 冥想区域、目标、相机与确认 | 45 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SpiritSoulsDisplayLord](Objects类清单/SpiritSoulsDisplayLord.md) | 灵魂进度、标记与显示事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Turret](Objects类清单/Turret.md) | 机关眼部、光束与转动参数 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [WorldQuest](Objects类清单/WorldQuest.md) | 世界任务、活动、加入与奖励状态 | 15 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [WorldQuestTable](Objects类清单/WorldQuestTable.md) | 任务桌、菜单与地图连接 | 23 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [WorldQuestWorldAreaGateEffect](Objects类清单/WorldQuestWorldAreaGateEffect.md) | 世界任务区域门效果 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 竞赛与计分

队伍、收集物分配、终点与退出。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AncestorRace](Objects类清单/AncestorRace.md) | 先祖竞赛、队伍区域与目标 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [AncestorRaceGoal](Objects类清单/AncestorRaceGoal.md) | 竞赛终点、队伍得分与完成事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DistributeRaceCollectibles](Objects类清单/DistributeRaceCollectibles.md) | 队伍竞赛收集物分配 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DistributeSpiritCollectibles](Objects类清单/DistributeSpiritCollectibles.md) | 灵魂收集物分配与完成事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ExitRace](Objects类清单/ExitRace.md) | 退出竞赛 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ScoreRaceCollectibles](Objects类清单/ScoreRaceCollectibles.md) | 竞赛收集物计分 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 粒子、灯光与场景效果

发射器、光效、花草及破坏反馈。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [Blaze](Objects类清单/Blaze.md) | 燃烧对象、网格和灰烬参数 | 17 | 40%（4/10） | 2 | 原池创建／启用／变换／Reset／SetActive／释放和普通 Load 已独立核验；使用保存模型时保留原克隆、重复缩放与透明度，生成分支保留贴图引用和 Flame 配置。实际 Model／资源／音效 owner、Blaze.Update 与动态绘制仍待接；本语料未发现直接 Darkshroom 引用，不计为黑暗植物实现。 |
| [Emitter](Objects类清单/Emitter.md) | 粒子发射、附着、吸引与受力 | 351 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [FireWorkShow](Objects类清单/FireWorkShow.md) | 烟花源标记与演出 | 6 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [FlowerPatch](Objects类清单/FlowerPatch.md) | 花草密度、尺寸、噪声与材质 | 582 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [LensFlair](Objects类清单/LensFlair.md) | 镜头光效颜色、强度与样式 | 44 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnBlaze](Objects类清单/OnBlaze.md) | 燃烧状态与激活事件 | 5 | 40%（4/10） | 2 | 原启用／Update 与共享 EventBarn 状态接入已核验；重绑保留既有事件状态与激活边沿锁存。五个真实事件仍需真实 Blaze／Flame 装载和完整下游生命周期。 |
| [OnBoomDestroy](Objects类清单/OnBoomDestroy.md) | 冲量破坏阈值、动画与网格反馈 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [PointLight](Objects类清单/PointLight.md) | 点光源空间实例 | 521 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetEmitterFlowRail](Objects类清单/SetEmitterFlowRail.md) | 发射器沿轨道流向设置 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [StarFallShower](Objects类清单/StarFallShower.md) | 流星发射、颜色、轨道与范围 | 3 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 声音、音乐与混音

声音实例、播放、淡出、参数与混响。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [FadeSound](Objects类清单/FadeSound.md) | 声音集合音量过渡与停止 | 10 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnMusicOutro](Objects类清单/OnMusicOutro.md) | 音乐尾段事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [PlayMusic](Objects类清单/PlayMusic.md) | 音乐切换、音量与淡入淡出 | 92 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [PlaySound2D](Objects类清单/PlaySound2D.md) | 二维声音播放 | 109 | 40%（4/10） | 2 | 完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。 |
| [PlaySound3D](Objects类清单/PlaySound3D.md) | 空间声音播放 | 27 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ReverbRegion](Objects类清单/ReverbRegion.md) | 区域混响与参数过渡 | 33 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetMixChannelLowpassFreq](Objects类清单/SetMixChannelLowpassFreq.md) | 混音通道低通频率过渡 | 23 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetMixChannelVolume](Objects类清单/SetMixChannelVolume.md) | 混音通道音量过渡 | 23 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetMusicVolume](Objects类清单/SetMusicVolume.md) | 音乐音量过渡 | 52 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetSoundParameter](Objects类清单/SetSoundParameter.md) | 全局、音乐或发射器声音参数 | 11 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SoundEmitter](Objects类清单/SoundEmitter.md) | 声音实例、距离、方向与自动播放 | 371 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 按钮、文字与菜单

世界按钮、HUD、提示、菜单与显示。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [DialogHint](Objects类清单/DialogHint.md) | 区域提示、文本、优先级与串联 | 102 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [DisplayText](Objects类清单/DisplayText.md) | 文字、颜色、位置与淡入淡出 | 30 | 30%（3/10） | 0 | 30 个节点和字段已清点；字体、定位、投影、图层、计时及淡入淡出待恢复。 |
| [DisplayTitleCard](Objects类清单/DisplayTitleCard.md) | 标题卡主副标题与显示规则 | 10 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [FriendDisplayLord](Objects类清单/FriendDisplayLord.md) | 好友位置、蜡烛与场景显示 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [InviteDisplayLord](Objects类清单/InviteDisplayLord.md) | 邀请状态及场景显示控制 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [InviteDisplayRig](Objects类清单/InviteDisplayRig.md) | 邀请空位、待确认与已确认视图 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnBubbleButton](Objects类清单/OnBubbleButton.md) | 世界气泡按钮距离、图标与点击事件 | 4 | 30%（3/10） | 0 | 实际节点和字段已清点；原交互对象/距离选择、图标、摄像机或玩家输入和事件待恢复。 |
| [OnButtonClick](Objects类清单/OnButtonClick.md) | 按钮点击事件 | 1 | 30%（3/10） | 0 | 实际节点和字段已清点；原按钮绑定、点击条件和事件链待恢复。 |
| [OnConfirmMenu](Objects类清单/OnConfirmMenu.md) | 确认菜单、图标与确认取消事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OpenConstellationTable](Objects类清单/OpenConstellationTable.md) | 星座桌菜单与关闭事件 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ShowHUDTimed](Objects类清单/ShowHUDTimed.md) | HUD 纹理、图层、时长与过渡 | 73 | 30%（3/10） | 0 | 73 个节点和字段已清点；原纹理、持续时间、图层、淡入淡出和摄像机/玩家事件待恢复。 |
| [UIInterestMask](Objects类清单/UIInterestMask.md) | 界面关注区域标记 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 网络、账户与社交流程

匹配、连接、账户就绪及社交状态。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [BenchChat](Objects类清单/BenchChat.md) | 长椅座位与聊天频道 | 18 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [MatchHint](Objects类清单/MatchHint.md) | 匹配人数、距离与拆分规则 | 20 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [NetDisconnect](Objects类清单/NetDisconnect.md) | 网络断开事件 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [NetFlag](Objects类清单/NetFlag.md) | 网络标志声明，实际行为待恢复 | 34 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [NetSetMatchmakingDisabled](Objects类清单/NetSetMatchmakingDisabled.md) | 网络匹配开关 | 6 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnAccountReady](Objects类清单/OnAccountReady.md) | 账户就绪、超时与回调 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnForgeGift](Objects类清单/OnForgeGift.md) | 赠礼条件后启用对象 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnGameReady](Objects类清单/OnGameReady.md) | 游戏就绪事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnJoinPreviousGame](Objects类清单/OnJoinPreviousGame.md) | 重返上一游戏与失败事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnOfferGift](Objects类清单/OnOfferGift.md) | 赠礼发起事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [RefreshGiftMessages](Objects类清单/RefreshGiftMessages.md) | 刷新赠礼消息 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 教程、平台门控与统计

教程、版本条件、调查和统计事件。

| 类 | 单独类功能 | 对象数 | 已验证清单进度 | 部分项 | 当前范围及缺口 |
| --- | --- | ---: | --- | ---: | --- |
| [AgeGate](Objects类清单/AgeGate.md) | 年龄验证与完成事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [FeatureFlag](Objects类清单/FeatureFlag.md) | 命名功能旗标与存在性分支 | 3 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnBetaMode](Objects类清单/OnBetaMode.md) | 测试版模式条件事件 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnDemoMode](Objects类清单/OnDemoMode.md) | 演示模式条件事件 | 10 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [OnLatestVersion](Objects类清单/OnLatestVersion.md) | 最新版本条件事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SendAnalyticsEvent](Objects类清单/SendAnalyticsEvent.md) | 命名统计事件 | 3 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetShopTableTutorial](Objects类清单/SetShopTableTutorial.md) | 任务桌商店教程配置 | 2 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [SetTutorialMode](Objects类清单/SetTutorialMode.md) | 教程状态设置 | 24 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [ShowMOTD](Objects类清单/ShowMOTD.md) | 公告显示与关闭事件 | 1 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [Survey](Objects类清单/Survey.md) | 问卷入口 | 34 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [TitleGate](Objects类清单/TitleGate.md) | 标题流程门控 | 1 | 20%（2/10） | 1 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |
| [TutorialNode](Objects类清单/TutorialNode.md) | 教程步骤、目标、拖动与行走事件 | 25 | 30%（3/10） | 0 | 已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。 |

## 每类执行清单

<details>
<summary>AccountAddCurrency · 30%（3/10）</summary>

账户货币增加与反馈。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AccountAddCurrency 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 账户货币增加与反馈：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：HubReveal（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100c75d20`。

</details>

<details>
<summary>AchievementShrine · 30%（3/10）</summary>

成就机关、奖励与相机反馈。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AchievementShrine 的原默认值、继承初始化及 29 个序列化字段变体；原注册字段 28 项。
- [ ] 成就机关、奖励与相机反馈：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：CameraKeyFrame（5 条引用）、LevelMesh（4 条引用）、Clump（10 条引用）、Marker（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 28 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：28；文件声明字段变体：29。 RTTI：`0x100c77c40`。

</details>

<details>
<summary>AddFloatToStatUsingName · 30%（3/10）</summary>

命名统计值增加浮点输入。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AddFloatToStatUsingName 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 命名统计值增加浮点输入：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、Night（节点 4 / 嵌套 0）、Prairie_Village（节点 3 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetRace（节点 2 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c76d40`。

</details>

<details>
<summary>AddPoi · 30%（3/10）</summary>

标记定义的关注点与权重。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AddPoi 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 标记定义的关注点与权重：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cdfed0`。

</details>

<details>
<summary>AgeGate · 30%（3/10）</summary>

年龄验证与完成事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AgeGate 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 年龄验证与完成事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：TitleWater（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c72750`。

</details>

<details>
<summary>AncestorEngine · 30%（3/10）</summary>

充能机关、区域与激活计时。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AncestorEngine 的原默认值、继承初始化及 32 个序列化字段变体；原注册字段 31 项。
- [ ] 充能机关、区域与激活计时：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（205 条引用）、Float（73 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 31 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 3 / 嵌套 0）、DayHubCave（节点 8 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、Dusk_CrabField（节点 2 / 嵌套 0）、NightEntrance（节点 2 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、RainEnd（节点 8 / 嵌套 0）、RainMid（节点 6 / 嵌套 0）、SkyHub2（节点 8 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、Sunset（节点 4 / 嵌套 0）。

原注册字段：31；文件声明字段变体：32。 RTTI：`0x100c7b5d0`。

</details>

<details>
<summary>AncestorRace · 30%（3/10）</summary>

先祖竞赛、队伍区域与目标。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AncestorRace 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 先祖竞赛、队伍区域与目标：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（6 条引用）、AncestorRaceGoal（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SunsetEnd（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100c7c3c0`。

</details>

<details>
<summary>AncestorRaceGoal · 30%（3/10）</summary>

竞赛终点、队伍得分与完成事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AncestorRaceGoal 的原默认值、继承初始化及 17 个序列化字段变体；原注册字段 16 项。
- [ ] 竞赛终点、队伍得分与完成事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（13 条引用）、Marker（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 16 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SunsetEnd（节点 1 / 嵌套 0）。

原注册字段：16；文件声明字段变体：17。 RTTI：`0x100c7c2b0`。

</details>

<details>
<summary>AncientSpirit · 30%（3/10）</summary>

先祖交互、动画、收集与剧情。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AncientSpirit 的原默认值、继承初始化及 44 个序列化字段变体；原注册字段 43 项。
- [ ] 先祖交互、动画、收集与剧情：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（105 条引用）、Marker（158 条引用）、Collectible（42 条引用）、Npc（42 条引用）、Timeline（25 条引用）、LevelMesh（40 条引用）、CameraKeyFrame（99 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 43 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Night（节点 4 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 3 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 5 / 嵌套 0）。

原注册字段：43；文件声明字段变体：44。 RTTI：`0x100c7db30`。

</details>

<details>
<summary>AttachBeacon · 30%（3/10）</summary>

空间信标、颜色与强度过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AttachBeacon 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 空间信标、颜色与强度过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（14 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：7；文件声明字段变体：8。 RTTI：`0x100ce2460`。

</details>

<details>
<summary>AttachGuideRail · 30%（3/10）</summary>

附加轨道引导与运动限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AttachGuideRail 的原默认值、继承初始化及 13 个序列化字段变体；原注册字段 12 项。
- [ ] 附加轨道引导与运动限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Rail（20 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 3 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、SkyHub2（节点 5 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：12；文件声明字段变体：13。 RTTI：`0x100c80040`。

</details>

<details>
<summary>AvatarAirtimeEffectFloat · 30%（3/10）</summary>

玩家滞空效果的浮点输出。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarAirtimeEffectFloat 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 玩家滞空效果的浮点输出：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（2 条引用）、Float（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100ce9b50`。

</details>

<details>
<summary>AvatarBreakHandHold · 30%（3/10）</summary>

玩家牵手关系解除。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarBreakHandHold 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 玩家牵手关系解除：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：NightEnd（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c858a0`。

</details>

<details>
<summary>AvatarChargeEnergy · 30%（3/10）</summary>

按速率与时长补充玩家能量。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarChargeEnergy 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 按速率与时长补充玩家能量：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、Night（节点 12 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100c825c0`。

</details>

<details>
<summary>AvatarForceEnableFlightMode · 20%（2/10）</summary>

强制启用飞行模式。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarForceEnableFlightMode 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 强制启用飞行模式：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayEnd（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100c84980`。

</details>

<details>
<summary>AvatarGrindToPos · 30%（3/10）</summary>

玩家轨道式定位与停止。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarGrindToPos 的原默认值、继承初始化及 16 个序列化字段变体；原注册字段 15 项。
- [ ] 玩家轨道式定位与停止：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（57 条引用）、Npc（7 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 15 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 11 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 17 / 嵌套 0）、StormEnd（节点 4 / 嵌套 0）、TitleWater（节点 3 / 嵌套 0）。

原注册字段：15；文件声明字段变体：16。 RTTI：`0x100c85c60`。

</details>

<details>
<summary>AvatarHijack · 30%（3/10）</summary>

玩家控制接管与恢复。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarHijack 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 玩家控制接管与恢复：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpaceEnd（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c86040`。

</details>

<details>
<summary>AvatarSetCandleState · 30%（3/10）</summary>

玩家蜡烛状态。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarSetCandleState 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 玩家蜡烛状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 2 / 嵌套 0）、Rain（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c82ba0`。

</details>

<details>
<summary>AvatarSetEnergy · 30%（3/10）</summary>

玩家能量设定或增量。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarSetEnergy 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 玩家能量设定或增量：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 4 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c827d0`。

</details>

<details>
<summary>AvatarSetEnergyCapacity · 30%（3/10）</summary>

玩家能量容量与时间过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarSetEnergyCapacity 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 玩家能量容量与时间过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 4 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、StormEnd（节点 2 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c829b0`。

</details>

<details>
<summary>AvatarSetInnerGlow · 30%（3/10）</summary>

玩家内发光强度与过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarSetInnerGlow 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 玩家内发光强度与过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 4 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100c85a80`。

</details>

<details>
<summary>AvatarSetPos · 40%（4/10）</summary>

玩家定位、相对标记与出生入口。

59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarSetPos 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 玩家定位、相对标记与出生入口（部分完成）：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 依赖调用与事件（部分完成）：Marker（59 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：59 个候选及入向引用已清点。AvatarSetPos 原 Update→本地选择→位置写入→Euler→Event Start 接原两个底层物理 setter、Euler→forward、就绪门控与完整 Whisker 初始化/重置局部链：487组、8,317,116字节、零差异，含59条真实flag/Marker快照。运行向量/e4/tick/BSS、矩阵、碰撞材质通道0x50、随机源、牵手/leader及libm仍为明确服务输入。面板接入原状态写入、静态角色和独立Avatar相机；默认入口、完整物理/账户/Avatar生命周期、动画、原连续相机和最终投影仍待恢复。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 3 / 嵌套 0）、CarryLand（节点 1 / 嵌套 0）、CarryLand2（节点 1 / 嵌套 0）、CarryLand3（节点 1 / 嵌套 0）、Dawn（节点 4 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Night（节点 3 / 嵌套 0）、NightEnd（节点 3 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 2 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetEnd2（节点 2 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 3 / 嵌套 0）。

原注册字段：7；文件声明字段变体：8。 RTTI：`0x100c84f40`。

实现：[avatar-set-pos.ts](../src/core/avatar-set-pos.ts)、[avatar-preview.ts](../src/core/avatar-preview.ts)、[avatar-camera.ts](../src/core/avatar-camera.ts)、[avatar-camera-controller.ts](../src/renderer/avatar-camera-controller.ts)、[avatar-preview.ts](../src/main/avatar-preview.ts)、[avatar-preview-controller.ts](../src/renderer/avatar-preview-controller.ts)、[avatar-physical-state.ts](../src/core/avatar-physical-state.ts)、[marker-transform-runtime.ts](../src/core/marker-transform-runtime.ts)。

证据：[avatar-set-pos-oracle.json](avatar-set-pos-oracle.json)、[avatar-camera-oracle.json](avatar-camera-oracle.json)、[avatar-mode-smoke.json](avatar-mode-smoke.json)、[Avatar出生定位与独立相机逆向.md](Avatar出生定位与独立相机逆向.md)、[avatar-physical-oracle.json](avatar-physical-oracle.json)、[avatar-physical-native.json](avatar-physical-native.json)、[Marker空间变换与对象反射逆向.md](Marker空间变换与对象反射逆向.md)、[marker-transform-oracle.json](marker-transform-oracle.json)。

</details>

<details>
<summary>AvatarSetStance · 30%（3/10）</summary>

站立、坐下、睡眠与朝向姿态。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarSetStance 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 站立、坐下、睡眠与朝向姿态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 6 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Night（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100c84d60`。

</details>

<details>
<summary>AvatarSetZeroG · 30%（3/10）</summary>

玩家零重力与能量状态。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：AvatarSetZeroG 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 玩家零重力与能量状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：StormEnd（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c856c0`。

</details>

<details>
<summary>AwakenDarkCreatures · 40%（4/10）</summary>

唤醒暗生物集合。

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：AwakenDarkCreatures 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 唤醒暗生物集合（部分完成）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 依赖调用与事件：Clump（9 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DuskGraveyard（节点 2 / 嵌套 0）、DuskMid（节点 3 / 嵌套 0）、Storm（节点 4 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c9e1b0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[nature-event-runtime.ts](../src/core/nature-event-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[nature-event-audit.json](nature-event-audit.json)、[nature-event-verification.json](nature-event-verification.json)、[nature-event-oracle.json](nature-event-oracle.json)。

</details>

<details>
<summary>Beamo · 40%（4/10）</summary>

密度模型、LOD、材质与烘焙参数。

原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Beamo 的原默认值、继承初始化及 13 个序列化字段变体；原注册字段 13 项。
- [ ] 密度模型、LOD、材质与烘焙参数（部分完成）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 13 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [x] 明确范围的原核心子链已独立核验：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 31 / 嵌套 0）、CandleSpaceEnd（节点 12 / 嵌套 0）、CarryLand（节点 49 / 嵌套 0）、CarryLand2（节点 120 / 嵌套 0）、CarryLand3（节点 10 / 嵌套 0）、Dawn（节点 180 / 嵌套 0）、DayEnd（节点 291 / 嵌套 0）、DayHubCave（节点 162 / 嵌套 0）、Dusk（节点 384 / 嵌套 0）、DuskGraveyard（节点 260 / 嵌套 0）、DuskMid（节点 181 / 嵌套 0）、Dusk_CrabField（节点 416 / 嵌套 0）、HubReveal（节点 148 / 嵌套 0）、Night（节点 333 / 嵌套 0）、NightEnd（节点 72 / 嵌套 0）、NightEntrance（节点 150 / 嵌套 0）、Prairie_ButterflyFields（节点 101 / 嵌套 0）、Prairie_Cave（节点 313 / 嵌套 0）、Prairie_NestAndKeeper（节点 112 / 嵌套 0）、Prairie_Village（节点 292 / 嵌套 0）、Rain（节点 170 / 嵌套 0）、RainEnd（节点 100 / 嵌套 0）、RainForest（节点 136 / 嵌套 0）、RainMid（节点 410 / 嵌套 0）、SkyHub2（节点 180 / 嵌套 0）、Storm（节点 497 / 嵌套 0）、StormEnd（节点 226 / 嵌套 0）、Sunset（节点 295 / 嵌套 0）、SunsetEnd（节点 407 / 嵌套 0）、SunsetEnd2（节点 174 / 嵌套 0）、SunsetRace（节点 384 / 嵌套 0）、TitleWater（节点 2 / 嵌套 0）。

原注册字段：13；文件声明字段变体：13。 RTTI：`0x100c88240`。

实现：[baked-lookup.ts](../src/core/baked-lookup.ts)、[baking.ts](../src/core/baking.ts)、[beamo-runtime.ts](../src/core/beamo-runtime.ts)、[beamo-baked-runtime.ts](../src/core/beamo-baked-runtime.ts)、[beamo-bake-adapter.ts](../src/core/beamo-bake-adapter.ts)、[model-material-index.ts](../src/core/model-material-index.ts)、[beamo-geometry-runtime.ts](../src/core/beamo-geometry-runtime.ts)、[beamo-geometry-adapter.ts](../src/core/beamo-geometry-adapter.ts)、[beamo-upload-barn-runtime.ts](../src/core/beamo-upload-barn-runtime.ts)、[beamo-spatial-runtime.ts](../src/core/beamo-spatial-runtime.ts)、[beamo-material-groups-runtime.ts](../src/core/beamo-material-groups-runtime.ts)、[collision-geo-runtime.ts](../src/core/collision-geo-runtime.ts)、[beamo-render-runtime.ts](../src/core/beamo-render-runtime.ts)、[vertex-render-runtime.ts](../src/core/vertex-render-runtime.ts)、[render-pipeline-runtime.ts](../src/core/render-pipeline-runtime.ts)、[model-render-state.ts](../src/core/model-render-state.ts)、[beamo-draw.ts](../src/core/beamo-draw.ts)、[vulkan-baked.ts](../src/main/vulkan-baked.ts)、[vulkan-viewport.ts](../src/renderer/vulkan-viewport.ts)、[render-list-runtime.ts](../src/core/render-list-runtime.ts)、[model-submit-runtime.ts](../src/core/model-submit-runtime.ts)。

证据：[模型烘焙绑定逆向.md](模型烘焙绑定逆向.md)、[Beamo原创建与烘焙关联.md](Beamo原创建与烘焙关联.md)、[beamo-bake-bindings.json](beamo-bake-bindings.json)、[beamo-environment-map-smoke.json](beamo-environment-map-smoke.json)、[Beamo全LOD上传与基础类推进.md](Beamo全LOD上传与基础类推进.md)、[beamo-upload-oracle.json](beamo-upload-oracle.json)、[beamo-upload-barn-oracle.json](beamo-upload-barn-oracle.json)、[beamo-upload-native.json.gz](../tests/fixtures/beamo-upload-native.json.gz)、[beamo-upload-barn-native.json.gz](../tests/fixtures/beamo-upload-barn-native.json.gz)、[Beamo包围盒材质分组与Parent池推进.md](Beamo包围盒材质分组与Parent池推进.md)、[beamo-spatial-native.json](beamo-spatial-native.json)、[beamo-spatial-oracle.json](beamo-spatial-oracle.json)、[beamo-material-groups-oracle.json](beamo-material-groups-oracle.json)、[collision-geo-remove-oracle.json](collision-geo-remove-oracle.json)、[beamo-spatial-native.json.gz](../tests/fixtures/beamo-spatial-native.json.gz)、[beamo-material-groups-native.json.gz](../tests/fixtures/beamo-material-groups-native.json.gz)、[collision-geo-remove-native.json.gz](../tests/fixtures/collision-geo-remove-native.json.gz)、[beamo-render-native.json](beamo-render-native.json)、[beamo-render-oracle.json](beamo-render-oracle.json)、[beamo-render-native.json.gz](../tests/fixtures/beamo-render-native.json.gz)、[共享渲染与Avatar滑移推进.md](共享渲染与Avatar滑移推进.md)、[render-pipeline-native.json](render-pipeline-native.json)、[render-pipeline-oracle.json](render-pipeline-oracle.json)、[render-pipeline-native.json.gz](../tests/fixtures/render-pipeline-native.json.gz)、[Objects共享渲染管线生命周期推进.md](Objects共享渲染管线生命周期推进.md)、[render-pipeline-runtime.test.ts](../tests/render-pipeline-runtime.test.ts)、[Beamo原材质绘制与SkyHub2效果.md](Beamo原材质绘制与SkyHub2效果.md)、[model-render-state.json](model-render-state.json)、[model-render-state-gpu-check.json](model-render-state-gpu-check.json)、[beamo-draw-verification.json](beamo-draw-verification.json)、[model-material-SkyHub2-smoke.json](model-material-SkyHub2-smoke.json)、[beamo-draw.test.ts](../tests/beamo-draw.test.ts)、[model-render-state.test.ts](../tests/model-render-state.test.ts)、[render-list-native.json](render-list-native.json)、[RenderList原注册提交与生命周期推进.md](RenderList原注册提交与生命周期推进.md)、[beamo-runtime-oracle.json](beamo-runtime-oracle.json)、[beamo-record-oracle.json](beamo-record-oracle.json)、[beamo-bake-oracle.json](beamo-bake-oracle.json)、[beamo-unload-oracle.json](beamo-unload-oracle.json)、[render-list-oracle.json](render-list-oracle.json)。

</details>

<details>
<summary>BeamoDecal · 40%（4/10）</summary>

模型贴花、距离与材质绑定。

原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：BeamoDecal 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 5 项。
- [ ] 模型贴花、距离与材质绑定（部分完成）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [x] 明确范围的原核心子链已独立核验：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原创建/记录/独立烘焙接受/全LOD上传/包围盒/材质分组已有核验；本轮进一步补完Barn.Load整个材质/renderable循环与Scene 23种RenderList查找、共享VertexRender两个完整正常初始化入口和真实ResourceRef内核。180组（147准备＋33图7150对象、309材质、252绘制组）/569675792字节零差异；同地址上传→分组→初始化/纹理绑定→引用清理组合通过。完整ResourceManager IO、GPU程序/参数/stream绑定、RenderList注册/context和实际绘制/Visibility/skirts/原启动生命周期尚未闭合；完整类/实例0。 本轮进一步恢复共享RenderPipeline初始化/顶点绑定/释放、GpuBuffer read-ID/Reset、VertexData十四缓冲Reset与Renderable Reset七个正常原内核，并接入同地址Beamo/Decal材质加载入口。222组（189准备＋33图7150对象、309材质、252绘制组）/709077336字节零差异；实时计数/句柄/table变更、映射detach、layout/read-ID断言、重复free与保留字段已核验；同一Mesh记录从两LOD上传→分组→管线/材质绑定→VertexData/Renderable释放组合通过。反射表/UBO/堆/GPU资源/RenderList注销仍为明确准备服务；实际shader反射、资源IO、完整Barn卸载/Visibility/绘制/原场景未闭合，完整类/实例0。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 13 / 嵌套 0）、Dusk（节点 9 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Dusk_CrabField（节点 11 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 199 / 嵌套 0）、Prairie_ButterflyFields（节点 12 / 嵌套 0）、Prairie_Cave（节点 12 / 嵌套 0）、Prairie_NestAndKeeper（节点 10 / 嵌套 0）、Prairie_Village（节点 30 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、SkyHub2（节点 9 / 嵌套 0）、Storm（节点 7 / 嵌套 0）、Sunset（节点 48 / 嵌套 0）、SunsetEnd（节点 133 / 嵌套 0）、SunsetEnd2（节点 29 / 嵌套 0）、SunsetRace（节点 25 / 嵌套 0）。

原注册字段：5；文件声明字段变体：5。 RTTI：`0x100c88370`。

实现：[baking.ts](../src/core/baking.ts)、[beamo-runtime.ts](../src/core/beamo-runtime.ts)、[beamo-baked-runtime.ts](../src/core/beamo-baked-runtime.ts)、[beamo-bake-adapter.ts](../src/core/beamo-bake-adapter.ts)、[model-material-index.ts](../src/core/model-material-index.ts)、[beamo-geometry-runtime.ts](../src/core/beamo-geometry-runtime.ts)、[beamo-geometry-adapter.ts](../src/core/beamo-geometry-adapter.ts)、[beamo-upload-barn-runtime.ts](../src/core/beamo-upload-barn-runtime.ts)、[beamo-spatial-runtime.ts](../src/core/beamo-spatial-runtime.ts)、[beamo-material-groups-runtime.ts](../src/core/beamo-material-groups-runtime.ts)、[collision-geo-runtime.ts](../src/core/collision-geo-runtime.ts)、[beamo-render-runtime.ts](../src/core/beamo-render-runtime.ts)、[vertex-render-runtime.ts](../src/core/vertex-render-runtime.ts)、[render-pipeline-runtime.ts](../src/core/render-pipeline-runtime.ts)、[model-render-state.ts](../src/core/model-render-state.ts)、[beamo-draw.ts](../src/core/beamo-draw.ts)、[vulkan-baked.ts](../src/main/vulkan-baked.ts)、[vulkan-viewport.ts](../src/renderer/vulkan-viewport.ts)、[render-list-runtime.ts](../src/core/render-list-runtime.ts)、[model-submit-runtime.ts](../src/core/model-submit-runtime.ts)。

证据：[meshes-object-links.json](meshes-object-links.json)、[Beamo原创建与烘焙关联.md](Beamo原创建与烘焙关联.md)、[beamo-bake-bindings.json](beamo-bake-bindings.json)、[beamo-environment-map-smoke.json](beamo-environment-map-smoke.json)、[Beamo全LOD上传与基础类推进.md](Beamo全LOD上传与基础类推进.md)、[beamo-upload-oracle.json](beamo-upload-oracle.json)、[beamo-upload-barn-oracle.json](beamo-upload-barn-oracle.json)、[beamo-upload-native.json.gz](../tests/fixtures/beamo-upload-native.json.gz)、[beamo-upload-barn-native.json.gz](../tests/fixtures/beamo-upload-barn-native.json.gz)、[Beamo包围盒材质分组与Parent池推进.md](Beamo包围盒材质分组与Parent池推进.md)、[beamo-spatial-native.json](beamo-spatial-native.json)、[beamo-spatial-oracle.json](beamo-spatial-oracle.json)、[beamo-material-groups-oracle.json](beamo-material-groups-oracle.json)、[collision-geo-remove-oracle.json](collision-geo-remove-oracle.json)、[beamo-spatial-native.json.gz](../tests/fixtures/beamo-spatial-native.json.gz)、[beamo-material-groups-native.json.gz](../tests/fixtures/beamo-material-groups-native.json.gz)、[collision-geo-remove-native.json.gz](../tests/fixtures/collision-geo-remove-native.json.gz)、[beamo-render-native.json](beamo-render-native.json)、[beamo-render-oracle.json](beamo-render-oracle.json)、[beamo-render-native.json.gz](../tests/fixtures/beamo-render-native.json.gz)、[共享渲染与Avatar滑移推进.md](共享渲染与Avatar滑移推进.md)、[render-pipeline-native.json](render-pipeline-native.json)、[render-pipeline-oracle.json](render-pipeline-oracle.json)、[render-pipeline-native.json.gz](../tests/fixtures/render-pipeline-native.json.gz)、[Objects共享渲染管线生命周期推进.md](Objects共享渲染管线生命周期推进.md)、[render-pipeline-runtime.test.ts](../tests/render-pipeline-runtime.test.ts)、[Beamo原材质绘制与SkyHub2效果.md](Beamo原材质绘制与SkyHub2效果.md)、[model-render-state.json](model-render-state.json)、[model-render-state-gpu-check.json](model-render-state-gpu-check.json)、[beamo-draw-verification.json](beamo-draw-verification.json)、[model-material-SkyHub2-smoke.json](model-material-SkyHub2-smoke.json)、[beamo-draw.test.ts](../tests/beamo-draw.test.ts)、[model-render-state.test.ts](../tests/model-render-state.test.ts)、[render-list-native.json](render-list-native.json)、[RenderList原注册提交与生命周期推进.md](RenderList原注册提交与生命周期推进.md)、[beamo-runtime-oracle.json](beamo-runtime-oracle.json)、[beamo-record-oracle.json](beamo-record-oracle.json)、[beamo-bake-oracle.json](beamo-bake-oracle.json)、[beamo-unload-oracle.json](beamo-unload-oracle.json)、[render-list-oracle.json](render-list-oracle.json)。

</details>

<details>
<summary>BenchChat · 30%（3/10）</summary>

长椅座位与聊天频道。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：BenchChat 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 长椅座位与聊天频道：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（18 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayEnd（节点 2 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 2 / 嵌套 0）、Prairie_Village（节点 7 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c939e0`。

</details>

<details>
<summary>BirdFlock · 40%（4/10）</summary>

鸟群发射、轨道、距离与预填充。

原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：BirdFlock 的原默认值、继承初始化及 12 个序列化字段变体；原注册字段 12 项。
- [ ] 鸟群发射、轨道、距离与预填充（部分完成）：原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。
- [ ] 依赖调用与事件：Rail（57 条引用）、Float（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造、共享保存字段、池式创建／启用，以及 BirdFlock.Unload、BirdFlocks.Update／Unload 管理链已独立核验。管理更新保留六个原float32视锥平面、-1边界、10,240候选／总实例上限和20-byte实例打包；卸载保留真实Heap.Free／Reset与ModelInstances计数子函数、版本引用重读和失败前写入。108组、227,378,448字节原对照零差异。单群BirdFlock.Update、实际模型装载／GPU owner、轨道缓存、运动和引导交互继续待接，管理器尚不作为地图自主鸟群运行，不计完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 10 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、Dusk（节点 5 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 3 / 嵌套 0）、Prairie_Village（节点 8 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 7 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 4 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 2 / 嵌套 0）、Sunset（节点 5 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）。

原注册字段：12；文件声明字段变体：12。 RTTI：`0x100c889e0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[bird-flock-runtime.ts](../src/core/bird-flock-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[bird-flock-native.json](bird-flock-native.json)、[bird-flock-oracle.json](bird-flock-oracle.json)、[自然动画与鸟群引导续接.md](自然动画与鸟群引导续接.md)。

</details>

<details>
<summary>BirdV2 · 40%（4/10）</summary>

鸟类实例与 AI 参数。

原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：BirdV2 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 4 项。
- [ ] 鸟类实例与 AI 参数（部分完成）：原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。
- [ ] 依赖调用与事件：BirdV2AiParams（184 条引用）、BirdV2Params（184 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。
- [x] 明确范围的原核心子链已独立核验：原 Load／Unload、普通 AI 初始化、命名动作／独立蒙皮预览、目标选择、普通 Update、加速度→转向→飞行→位移朝向→原 Model 变换提交已有分段与组合原对照。实际目标／引导／漫游／群体／避让、轨道选择／跟随，以及对象跟随状态机已接入统一每帧组合。对象跟随新增 283 组独立对照和 67 组整帧对照，共 350 组、47,064,624 字节、13,555 次有序调用零差异；保留目标重置／释放、计时接近／减速／绕行、直接 Seek 重载、Critter 请求和最多 10 帧连续调用。原轨道、Avatar／世界位置与 OBB 投影、碰撞／邻域、Critter 视觉音频效果、方向插值／倾斜滤波、Model／动画／GPU owner、联网和完整生命周期仍待接。当前为明确边界的原内核组合，尚未接主视口自主 AI，不计完整生物。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 48 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、HubReveal（节点 34 / 嵌套 0）、Prairie_Village（节点 45 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 13 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 4 / 嵌套 0）、Sunset（节点 4 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetRace（节点 15 / 嵌套 0）、TitleWater（节点 15 / 嵌套 0）。

原注册字段：4；文件声明字段变体：4。 RTTI：`0x100c8a680`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[bird-load-runtime.ts](../src/core/bird-load-runtime.ts)、[creature-ai-initialize-runtime.ts](../src/core/creature-ai-initialize-runtime.ts)、[resource-model-animation-preview.ts](../src/core/resource-model-animation-preview.ts)、[model-animation-preview.ts](../src/renderer/model-animation-preview.ts)、[bird-natural-animation-runtime.ts](../src/core/bird-natural-animation-runtime.ts)、[bird-update-runtime.ts](../src/core/bird-update-runtime.ts)、[bird-target-runtime.ts](../src/core/bird-target-runtime.ts)、[bird-flight-runtime.ts](../src/core/bird-flight-runtime.ts)、[bird-acceleration-runtime.ts](../src/core/bird-acceleration-runtime.ts)、[bird-motion-runtime.ts](../src/core/bird-motion-runtime.ts)、[bird-force-runtime.ts](../src/core/bird-force-runtime.ts)、[creature-force-runtime.ts](../src/core/creature-force-runtime.ts)、[creature-flocking-runtime.ts](../src/core/creature-flocking-runtime.ts)、[bird-rail-runtime.ts](../src/core/bird-rail-runtime.ts)、[creature-rail-runtime.ts](../src/core/creature-rail-runtime.ts)、[bird-follow-runtime.ts](../src/core/bird-follow-runtime.ts)、[creature-follow-runtime.ts](../src/core/creature-follow-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[黑暗植物与生物加载续接.md](黑暗植物与生物加载续接.md)、[creature-plant-load-native.json](creature-plant-load-native.json)、[bird-load-oracle.json](bird-load-oracle.json)、[自然动画与鸟群引导续接.md](自然动画与鸟群引导续接.md)、[bird-natural-animation-native.json](bird-natural-animation-native.json)、[bird-natural-animation-oracle.json](bird-natural-animation-oracle.json)、[creature-objects-defaults.json](creature-objects-defaults.json)、[creature-objects-default-oracle.json](creature-objects-default-oracle.json)、[生物类续接.md](生物类续接.md)、[bird-update-native.json](bird-update-native.json)、[bird-update-oracle.json](bird-update-oracle.json)、[bird-target-native.json](bird-target-native.json)、[bird-target-oracle.json](bird-target-oracle.json)、[bird-flight-native.json](bird-flight-native.json)、[bird-flight-oracle.json](bird-flight-oracle.json)、[bird-acceleration-native.json](bird-acceleration-native.json)、[bird-acceleration-oracle.json](bird-acceleration-oracle.json)、[bird-motion-native.json](bird-motion-native.json)、[bird-motion-oracle.json](bird-motion-oracle.json)、[bird-motion-flight-oracle.json](bird-motion-flight-oracle.json)、[bird-steering-motion-oracle.json](bird-steering-motion-oracle.json)、[bird-force-native.json](bird-force-native.json)、[bird-force-oracle.json](bird-force-oracle.json)、[creature-force-oracle.json](creature-force-oracle.json)、[bird-rail-native.json](bird-rail-native.json)、[bird-rail-oracle.json](bird-rail-oracle.json)、[bird-rail-chain-oracle.json](bird-rail-chain-oracle.json)、[bird-follow-native.json](bird-follow-native.json)、[bird-follow-oracle.json](bird-follow-oracle.json)、[bird-follow-chain-oracle.json](bird-follow-chain-oracle.json)。

</details>

<details>
<summary>BirdV2AiParams · 30%（3/10）</summary>

鸟类追踪、群体、目标与到达参数。

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：BirdV2AiParams 的原默认值、继承初始化及 26 个序列化字段变体；原注册字段 26 项。
- [ ] 鸟类追踪、群体、目标与到达参数：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 依赖调用与事件：Clump（45 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 26 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 明确范围的原核心子链已独立核验（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 5 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Prairie_Village（节点 9 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetRace（节点 4 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：26；文件声明字段变体：26。 RTTI：`0x100c8a2d0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)。

</details>

<details>
<summary>BirdV2Params · 30%（3/10）</summary>

鸟类运动、引导与效果参数。

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：BirdV2Params 的原默认值、继承初始化及 21 个序列化字段变体；原注册字段 21 项。
- [ ] 鸟类运动、引导与效果参数：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 依赖调用与事件：LevelMesh（46 条引用）、Marker（35 条引用）、Clump（48 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 21 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 明确范围的原核心子链已独立核验（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 3 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Prairie_Village（节点 24 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetRace（节点 4 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：21；文件声明字段变体：21。 RTTI：`0x100c8a1b0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)。

</details>

<details>
<summary>BirdV2ParamSwap · 40%（4/10）</summary>

替换鸟类实例参数。

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：BirdV2ParamSwap 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 替换鸟类实例参数（部分完成）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 依赖调用与事件：BirdV2（15 条引用）、BirdV2Params（15 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_Village（节点 15 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c8ad70`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[nature-event-runtime.ts](../src/core/nature-event-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[nature-event-audit.json](nature-event-audit.json)、[nature-event-verification.json](nature-event-verification.json)、[nature-event-oracle.json](nature-event-oracle.json)。

</details>

<details>
<summary>Blaze · 40%（4/10）</summary>

燃烧对象、网格和灰烬参数。

原池创建／启用／变换／Reset／SetActive／释放和普通 Load 已独立核验；使用保存模型时保留原克隆、重复缩放与透明度，生成分支保留贴图引用和 Flame 配置。实际 Model／资源／音效 owner、Blaze.Update 与动态绘制仍待接；本语料未发现直接 Darkshroom 引用，不计为黑暗植物实现。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Blaze 的原默认值、继承初始化及 17 个序列化字段变体；原注册字段 17 项。
- [ ] 燃烧对象、网格和灰烬参数（部分完成）：原池创建／启用／变换／Reset／SetActive／释放和普通 Load 已独立核验；使用保存模型时保留原克隆、重复缩放与透明度，生成分支保留贴图引用和 Flame 配置。实际 Model／资源／音效 owner、Blaze.Update 与动态绘制仍待接；本语料未发现直接 Darkshroom 引用，不计为黑暗植物实现。
- [ ] 依赖调用与事件：Clump（15 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 17 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原池创建／启用／变换／Reset／SetActive／释放和普通 Load 已独立核验；使用保存模型时保留原克隆、重复缩放与透明度，生成分支保留贴图引用和 Flame 配置。实际 Model／资源／音效 owner、Blaze.Update 与动态绘制仍待接；本语料未发现直接 Darkshroom 引用，不计为黑暗植物实现。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原池创建／启用／变换／Reset／SetActive／释放和普通 Load 已独立核验；使用保存模型时保留原克隆、重复缩放与透明度，生成分支保留贴图引用和 Flame 配置。实际 Model／资源／音效 owner、Blaze.Update 与动态绘制仍待接；本语料未发现直接 Darkshroom 引用，不计为黑暗植物实现。
- [x] 明确范围的原核心子链已独立核验：原池创建／启用／变换／Reset／SetActive／释放和普通 Load 已独立核验；使用保存模型时保留原克隆、重复缩放与透明度，生成分支保留贴图引用和 Flame 配置。实际 Model／资源／音效 owner、Blaze.Update 与动态绘制仍待接；本语料未发现直接 Darkshroom 引用，不计为黑暗植物实现。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Night（节点 11 / 嵌套 0）、Rain（节点 6 / 嵌套 0）。

原注册字段：17；文件声明字段变体：17。 RTTI：`0x100c8ba40`。

实现：[blaze-runtime.ts](../src/core/blaze-runtime.ts)、[blaze-load-runtime.ts](../src/core/blaze-load-runtime.ts)、[environment-object-state.ts](../src/core/environment-object-state.ts)。

证据：[黑暗植物与生物加载续接.md](黑暗植物与生物加载续接.md)、[creature-plant-load-native.json](creature-plant-load-native.json)、[blaze-oracle.json](blaze-oracle.json)、[blaze-load-oracle.json](blaze-load-oracle.json)。

</details>

<details>
<summary>BoomCone · 20%（2/10）</summary>

锥形冲量、时长与继承速度。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：BoomCone 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 0 项。
- [ ] 锥形冲量、时长与继承速度：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dusk（节点 2 / 嵌套 0）。

原注册字段：0；文件声明字段变体：4。 RTTI：`0x100cacef0`。

</details>

<details>
<summary>Boundary · 30%（3/10）</summary>

轨道定义的场景边界。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Boundary 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 2 项。
- [ ] 轨道定义的场景边界：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（34 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 8 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 2 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：2。 RTTI：`0x100caca30`。

</details>

<details>
<summary>Branch · 30%（3/10）</summary>

事件分支与触发规则。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Branch 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 事件分支与触发规则：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100c8d070`。

</details>

<details>
<summary>Buddy · 40%（4/10）</summary>

伙伴实例。

原父构造、共享 BuddyParams 五项动作初始化、普通 Load 与空 Unload 已独立核验；保留 8 项 BuddyBarn 注册顺序、玩家 ID、Marker／Model／OBB、随机状态和发现位掩码（含 32 项移位结果）。真实 Update、碰撞、联网、音效及动画 Model 生命周期仍待接；DayHubCave 保存禁用实例的独立引用已核验。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Buddy 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 3 项。
- [ ] 伙伴实例（部分完成）：原父构造、共享 BuddyParams 五项动作初始化、普通 Load 与空 Unload 已独立核验；保留 8 项 BuddyBarn 注册顺序、玩家 ID、Marker／Model／OBB、随机状态和发现位掩码（含 32 项移位结果）。真实 Update、碰撞、联网、音效及动画 Model 生命周期仍待接；DayHubCave 保存禁用实例的独立引用已核验。
- [ ] 依赖调用与事件：BuddyParams（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原父构造、共享 BuddyParams 五项动作初始化、普通 Load 与空 Unload 已独立核验；保留 8 项 BuddyBarn 注册顺序、玩家 ID、Marker／Model／OBB、随机状态和发现位掩码（含 32 项移位结果）。真实 Update、碰撞、联网、音效及动画 Model 生命周期仍待接；DayHubCave 保存禁用实例的独立引用已核验。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原父构造、共享 BuddyParams 五项动作初始化、普通 Load 与空 Unload 已独立核验；保留 8 项 BuddyBarn 注册顺序、玩家 ID、Marker／Model／OBB、随机状态和发现位掩码（含 32 项移位结果）。真实 Update、碰撞、联网、音效及动画 Model 生命周期仍待接；DayHubCave 保存禁用实例的独立引用已核验。
- [x] 明确范围的原核心子链已独立核验：原父构造、共享 BuddyParams 五项动作初始化、普通 Load 与空 Unload 已独立核验；保留 8 项 BuddyBarn 注册顺序、玩家 ID、Marker／Model／OBB、随机状态和发现位掩码（含 32 项移位结果）。真实 Update、碰撞、联网、音效及动画 Model 生命周期仍待接；DayHubCave 保存禁用实例的独立引用已核验。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayHubCave（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：3。 RTTI：`0x100c8e2d0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[buddy-runtime.ts](../src/core/buddy-runtime.ts)。

证据：[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-objects-defaults.json](creature-objects-defaults.json)、[creature-objects-default-oracle.json](creature-objects-default-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[生物类续接.md](生物类续接.md)、[buddy-native.json](buddy-native.json)、[buddy-oracle.json](buddy-oracle.json)。

</details>

<details>
<summary>BuddyParams · 40%（4/10）</summary>

伙伴发现、休息与动画状态参数。

原父构造、缺省值及动作前缀初始化已核验，保留 Idle／Walk／Run／EnterBored／ExitBored 的各自资源请求与回调读取。发现点、行为参数与 meshType 保留共享引用；真实动画资源 owner、Buddy 更新和联网仍待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：BuddyParams 的原默认值、继承初始化及 13 个序列化字段变体；原注册字段 13 项。
- [ ] 伙伴发现、休息与动画状态参数（部分完成）：原父构造、缺省值及动作前缀初始化已核验，保留 Idle／Walk／Run／EnterBored／ExitBored 的各自资源请求与回调读取。发现点、行为参数与 meshType 保留共享引用；真实动画资源 owner、Buddy 更新和联网仍待接。
- [ ] 依赖调用与事件：LevelMesh（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 13 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原父构造、缺省值及动作前缀初始化已核验，保留 Idle／Walk／Run／EnterBored／ExitBored 的各自资源请求与回调读取。发现点、行为参数与 meshType 保留共享引用；真实动画资源 owner、Buddy 更新和联网仍待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原父构造、缺省值及动作前缀初始化已核验，保留 Idle／Walk／Run／EnterBored／ExitBored 的各自资源请求与回调读取。发现点、行为参数与 meshType 保留共享引用；真实动画资源 owner、Buddy 更新和联网仍待接。
- [x] 明确范围的原核心子链已独立核验：原父构造、缺省值及动作前缀初始化已核验，保留 Idle／Walk／Run／EnterBored／ExitBored 的各自资源请求与回调读取。发现点、行为参数与 meshType 保留共享引用；真实动画资源 owner、Buddy 更新和联网仍待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayHubCave（节点 1 / 嵌套 0）。

原注册字段：13；文件声明字段变体：13。 RTTI：`0x100c8e1c0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[buddy-runtime.ts](../src/core/buddy-runtime.ts)。

证据：[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-objects-defaults.json](creature-objects-defaults.json)、[creature-objects-default-oracle.json](creature-objects-default-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[生物类续接.md](生物类续接.md)、[buddy-native.json](buddy-native.json)、[buddy-oracle.json](buddy-oracle.json)。

</details>

<details>
<summary>CameraGuide · 30%（3/10）</summary>

空间摄像机引导与画面构图。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CameraGuide 的原默认值、继承初始化及 23 个序列化字段变体；原注册字段 23 项。
- [ ] 空间摄像机引导与画面构图：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（351 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 23 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、CandleSpaceEnd（节点 8 / 嵌套 0）、CarryLand2（节点 1 / 嵌套 0）、Dawn（节点 32 / 嵌套 0）、DayEnd（节点 13 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 6 / 嵌套 0）、DuskGraveyard（节点 30 / 嵌套 0）、DuskMid（节点 6 / 嵌套 0）、Dusk_CrabField（节点 5 / 嵌套 0）、HubReveal（节点 18 / 嵌套 0）、Night（节点 40 / 嵌套 0）、NightEntrance（节点 2 / 嵌套 0）、Prairie_ButterflyFields（节点 12 / 嵌套 0）、Prairie_Cave（节点 31 / 嵌套 0）、Prairie_NestAndKeeper（节点 22 / 嵌套 0）、Prairie_Village（节点 30 / 嵌套 0）、Rain（节点 11 / 嵌套 0）、RainEnd（节点 7 / 嵌套 0）、RainForest（节点 18 / 嵌套 0）、RainMid（节点 34 / 嵌套 0）、SkyHub2（节点 27 / 嵌套 0）、Storm（节点 12 / 嵌套 0）、StormEnd（节点 2 / 嵌套 0）、Sunset（节点 12 / 嵌套 0）、SunsetEnd（节点 6 / 嵌套 0）、SunsetEnd2（节点 2 / 嵌套 0）、SunsetRace（节点 4 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：23；文件声明字段变体：23。 RTTI：`0x100c8f360`。

</details>

<details>
<summary>CameraKeyFrame · 40%（4/10）</summary>

镜头关键帧、视场角与运动参数。

原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：CameraKeyFrame 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 9 项。
- [ ] 镜头关键帧、视场角与运动参数（部分完成）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [x] 明确范围的原核心子链已独立核验：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 19 / 嵌套 0）、CandleSpaceEnd（节点 59 / 嵌套 0）、Dawn（节点 118 / 嵌套 0）、DayEnd（节点 51 / 嵌套 0）、DayHubCave（节点 10 / 嵌套 0）、Dusk（节点 45 / 嵌套 0）、DuskGraveyard（节点 11 / 嵌套 0）、DuskMid（节点 50 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 72 / 嵌套 0）、Night（节点 49 / 嵌套 0）、NightEnd（节点 25 / 嵌套 0）、NightEntrance（节点 7 / 嵌套 0）、Prairie_ButterflyFields（节点 28 / 嵌套 0）、Prairie_Cave（节点 32 / 嵌套 0）、Prairie_NestAndKeeper（节点 33 / 嵌套 0）、Prairie_Village（节点 87 / 嵌套 0）、Rain（节点 31 / 嵌套 0）、RainEnd（节点 37 / 嵌套 0）、RainForest（节点 14 / 嵌套 0）、RainMid（节点 39 / 嵌套 0）、SkyHub2（节点 68 / 嵌套 0）、Storm（节点 7 / 嵌套 0）、StormEnd（节点 8 / 嵌套 0）、Sunset（节点 14 / 嵌套 0）、SunsetEnd（节点 28 / 嵌套 0）、SunsetEnd2（节点 34 / 嵌套 0）、SunsetRace（节点 7 / 嵌套 0）、TitleWater（节点 3 / 嵌套 0）。

原注册字段：9；文件声明字段变体：9。 RTTI：`0x100c8f8e0`。

实现：[scene-foundation-runtime.ts](../src/core/scene-foundation-runtime.ts)。

证据：[Beamo全LOD上传与基础类推进.md](Beamo全LOD上传与基础类推进.md)、[scene-foundation-native.json](scene-foundation-native.json)、[scene-foundation-oracle.json](scene-foundation-oracle.json)、[scene-foundation-native.json.gz](../tests/fixtures/scene-foundation-native.json.gz)。

</details>

<details>
<summary>CandleGate · 30%（3/10）</summary>

蜡烛放置与门控事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CandleGate 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 蜡烛放置与门控事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（42 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DayEnd（节点 2 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 2 / 嵌套 0）、Prairie_Village（节点 7 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Sunset（节点 3 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100c91570`。

</details>

<details>
<summary>CandleObject · 40%（4/10）</summary>

蜡烛实例、寿命、点燃与蜡量。

原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：CandleObject 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 9 项。
- [ ] 蜡烛实例、寿命、点燃与蜡量（部分完成）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 25 / 嵌套 0）、CandleSpaceEnd（节点 2 / 嵌套 0）、Dawn（节点 8 / 嵌套 0）、DayEnd（节点 38 / 嵌套 0）、DayHubCave（节点 106 / 嵌套 0）、Dusk（节点 20 / 嵌套 0）、DuskGraveyard（节点 3 / 嵌套 0）、DuskMid（节点 26 / 嵌套 0）、Dusk_CrabField（节点 16 / 嵌套 0）、HubReveal（节点 25 / 嵌套 0）、Night（节点 111 / 嵌套 0）、NightEnd（节点 5 / 嵌套 0）、NightEntrance（节点 60 / 嵌套 0）、Prairie_ButterflyFields（节点 69 / 嵌套 0）、Prairie_Cave（节点 60 / 嵌套 0）、Prairie_NestAndKeeper（节点 43 / 嵌套 0）、Prairie_Village（节点 65 / 嵌套 0）、Rain（节点 12 / 嵌套 0）、RainEnd（节点 20 / 嵌套 0）、RainForest（节点 22 / 嵌套 0）、RainMid（节点 10 / 嵌套 0）、SkyHub2（节点 138 / 嵌套 0）、Sunset（节点 107 / 嵌套 0）、SunsetEnd（节点 64 / 嵌套 0）、SunsetEnd2（节点 8 / 嵌套 0）、SunsetRace（节点 14 / 嵌套 0）。

原注册字段：9；文件声明字段变体：9。 RTTI：`0x100c90da0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[object-item-construction-runtime.ts](../src/core/object-item-construction-runtime.ts)、[object-effects-runtime.ts](../src/core/object-effects-runtime.ts)、[candle-runtime.ts](../src/core/candle-runtime.ts)、[candle-render-runtime.ts](../src/core/candle-render-runtime.ts)、[flame-motion-light-runtime.ts](../src/core/flame-motion-light-runtime.ts)、[flame-sprite-runtime.ts](../src/core/flame-sprite-runtime.ts)、[viewport-candle-effects.ts](../src/main/viewport-candle-effects.ts)、[vulkan-viewport-cloud.ts](../src/main/vulkan-viewport-cloud.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[object-item-construction.json](object-item-construction.json)、[object-item-construction-oracle.json](object-item-construction-oracle.json)、[object-effects-oracle.json](object-effects-oracle.json)、[Flame火焰绘制续接.md](Flame火焰绘制续接.md)、[candle-load-oracle.json](candle-load-oracle.json)、[flame-sprite-native.json](flame-sprite-native.json)、[flame-sprite-oracle.json](flame-sprite-oracle.json)、[flame-candle-map-gpu-check.json](flame-candle-map-gpu-check.json)。

</details>

<details>
<summary>CarryAncestorQuestPrefab · 30%（3/10）</summary>

先祖携带任务预制体。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CarryAncestorQuestPrefab 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 2 项。
- [ ] 先祖携带任务预制体：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（22 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand2（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）。

原注册字段：2；文件声明字段变体：8。 RTTI：`0x100cfc580`。

</details>

<details>
<summary>CarryCreatureQuestPrefab · 20%（2/10）</summary>

生物携带任务预制体。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CarryCreatureQuestPrefab 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 0 项。
- [ ] 生物携带任务预制体：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand2（节点 1 / 嵌套 0）、CarryLand3（节点 1 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：5。 RTTI：`0x100cfc470`。

</details>

<details>
<summary>ChangeLevelWithFade · 30%（3/10）</summary>

带淡入淡出的地图切换。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ChangeLevelWithFade 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 带淡入淡出的地图切换：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 2 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 3 / 嵌套 0）、NightEntrance（节点 2 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 9 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 2 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100c926e0`。

</details>

<details>
<summary>Checkpoint · 30%（3/10）</summary>

检查点记录与恢复区域。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Checkpoint 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 检查点记录与恢复区域：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（126 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 23 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 5 / 嵌套 0）、DuskGraveyard（节点 5 / 嵌套 0）、DuskMid（节点 6 / 嵌套 0）、HubReveal（节点 4 / 嵌套 0）、Night（节点 9 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_Village（节点 9 / 嵌套 0）、Rain（节点 7 / 嵌套 0）、RainEnd（节点 6 / 嵌套 0）、RainForest（节点 6 / 嵌套 0）、RainMid（节点 10 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、Storm（节点 9 / 嵌套 0）、Sunset（节点 6 / 嵌套 0）、SunsetEnd（节点 8 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c93ed0`。

</details>

<details>
<summary>CheckpointRestore · 30%（3/10）</summary>

恢复检查点与重载控制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CheckpointRestore 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 恢复检查点与重载控制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 1 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c94260`。

</details>

<details>
<summary>CheckpointState · 30%（3/10）</summary>

恢复时启用的对象集合。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CheckpointState 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 1 项。
- [ ] 恢复时启用的对象集合：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（17 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 1 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：1。 RTTI：`0x100c94000`。

</details>

<details>
<summary>ClockBell · 30%（3/10）</summary>

钟与网格控制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ClockBell 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 钟与网格控制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：LevelMesh（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c95680`。

</details>

<details>
<summary>ClockTower · 30%（3/10）</summary>

钟塔与钟组控制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ClockTower 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 钟塔与钟组控制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：ClockBell（7 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：7；文件声明字段变体：8。 RTTI：`0x100c95790`。

</details>

<details>
<summary>CloseOutfitShop · 20%（2/10）</summary>

关闭装扮商店。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CloseOutfitShop 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 关闭装扮商店：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100ce35c0`。

</details>

<details>
<summary>CloudBob · 30%（3/10）</summary>

云对象运动及缓冲偏移。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CloudBob 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 云对象运动及缓冲偏移：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_Village（节点 2 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cdeab0`。

</details>

<details>
<summary>CloudCard · 40%（4/10）</summary>

云卡模型、烘焙与透明度。

世界球、连接组、排序和动态顶点等明确子链已核验；自动对象注册、真实照明/遮挡/风场和完整绘制待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CloudCard 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 4 项。
- [ ] 云卡模型、烘焙与透明度（部分完成）：世界球、连接组、排序和动态顶点等明确子链已核验；自动对象注册、真实照明/遮挡/风场和完整绘制待恢复。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：世界球、连接组、排序和动态顶点等明确子链已核验；自动对象注册、真实照明/遮挡/风场和完整绘制待恢复。
- [x] 明确范围的原核心子链已独立核验：世界球、连接组、排序和动态顶点等明确子链已核验；自动对象注册、真实照明/遮挡/风场和完整绘制待恢复。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：世界球、连接组、排序和动态顶点等明确子链已核验；自动对象注册、真实照明/遮挡/风场和完整绘制待恢复。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：世界球、连接组、排序和动态顶点等明确子链已核验；自动对象注册、真实照明/遮挡/风场和完整绘制待恢复。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 78 / 嵌套 0）、DayEnd（节点 24 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Prairie_ButterflyFields（节点 18 / 嵌套 0）、Prairie_Cave（节点 7 / 嵌套 0）、Prairie_NestAndKeeper（节点 19 / 嵌套 0）、Prairie_Village（节点 13 / 嵌套 0）、SkyHub2（节点 7 / 嵌套 0）、Storm（节点 36 / 嵌套 0）、StormEnd（节点 71 / 嵌套 0）、Sunset（节点 26 / 嵌套 0）、SunsetEnd（节点 41 / 嵌套 0）、SunsetRace（节点 14 / 嵌套 0）。

原注册字段：4；文件声明字段变体：4。 RTTI：`0x100c96410`。

实现：[cloud-card-level.ts](../src/core/cloud-card-level.ts)、[cloud-card-dynamic.ts](../src/core/cloud-card-dynamic.ts)、[cloud-card-visibility.ts](../src/core/cloud-card-visibility.ts)。

证据：[实体云与Tex3D逆向进展.md](实体云与Tex3D逆向进展.md)、[云卡动态与材质渐变逆向进展.md](云卡动态与材质渐变逆向进展.md)、[cloud-card-layout-oracle.json](cloud-card-layout-oracle.json)、[cloud-card-sort-oracle.json](cloud-card-sort-oracle.json)、[cloud-card-dynamic-oracle.json](cloud-card-dynamic-oracle.json)。

</details>

<details>
<summary>Clump · 40%（4/10）</summary>

对象引用容器。

环境范围的 Marker 成员和计时控制已核验；嵌套启用传播、事件顺序与通用 Clump 生命周期待恢复。 本轮共享TGCL字段子链含24个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Clump的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Clump 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 1 项。
- [ ] 对象引用容器（部分完成）：环境范围的 Marker 成员和计时控制已核验；嵌套启用传播、事件顺序与通用 Clump 生命周期待恢复。 本轮共享TGCL字段子链含24个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Clump的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：LevelMesh（5797 条引用）、Enable（1707 条引用）、Timeline（433 条引用）、TransformObject（336 条引用）、OnFlame（90 条引用）、DisplayTitleCard（8 条引用）、CandleObject（1211 条引用）、Delay（333 条引用）、AvatarSetInnerGlow（12 条引用）、SetTutorialMode（28 条引用）、DialogHint（145 条引用）、HasReachedLevel（11 条引用）、Marker（5690 条引用）、SnapToCam（1017 条引用）、Emitter（678 条引用）、TerrainBlob（9949 条引用）、SetMeshShaderParam（545 条引用）、Beamo（3693 条引用）、Unlock（25 条引用）、IsLatestCheckpoint（8 条引用）、SetRender（22 条引用）、MeditationArea（47 条引用）、Parent（181 条引用）、SetInputState（115 条引用）、DropOcclusion（83 条引用）、CameraGuide（223 条引用）、SoundEmitter（401 条引用）、RedeemReward（4 条引用）、OnRegion（101 条引用）、ShowHUDTimed（91 条引用）、NetFlag（52 条引用）、CollectibleDisplay（31 条引用）、Clump（936 条引用）、AvatarChargeEnergy（33 条引用）、PlayAvatarAnimSeq（48 条引用）、AvatarSetStance（14 条引用）、SetMusicVolume（67 条引用）、PlaySound2D（139 条引用）、SetFlame（50 条引用）、FriendDisplayLord（1 条引用）、InviteDisplayLord（1 条引用）、RefreshGiftMessages（1 条引用）、Pickup（1 条引用）、AvatarGrindToPos（45 条引用）、OnCollected（7 条引用）、CameraKeyFrame（1340 条引用）、OnUnlocked（38 条引用）、Npc（111 条引用）、OnForgeGift（2 条引用）、ReserveCurrency（1 条引用）、CandleGate（25 条引用）、ResumeGate（2 条引用）、FeatureFlag（2 条引用）、AncientSpirit（64 条引用）、SetRainParams（15 条引用）、Rail（192 条引用）、ChangeLevelWithFade（19 条引用）、EnvNode（47 条引用）、PointLight（129 条引用）、OutfitSelect（17 条引用）、PlayAnimation（231 条引用）、DisplayText（24 条引用）、Survey（20 条引用）、LensFlair（40 条引用）、MoveObjectAlongRail（246 条引用）、PlayMusic（94 条引用）、LockAllCollectible（1 条引用）、AvatarHijack（17 条引用）、AvatarSetPos（52 条引用）、ResetAllStormKeyProgress（1 条引用）、LevelMaterial（79 条引用）、Float（131 条引用）、SpiritSoulsDisplayLord（1 条引用）、TerrainBlobPrefab（382 条引用）、StarFragment（98 条引用）、SoulTrap（15 条引用）、BirdV2（152 条引用）、Flame（422 条引用）、BeamoDecal（260 条引用）、CloudCard（199 条引用）、Checkpoint（158 条引用）、DoShout（68 条引用）、PlaySound3D（32 条引用）、SetCameraShake（15 条引用）、AvatarSetCandleState（4 条引用）、SetCameraKeyFrameShake（16 条引用）、EventSeries（25 条引用）、TutorialNode（36 条引用）、IfInRegion（42 条引用）、StrobeObject（16 条引用）、Npc_PlayAnim（78 条引用）、AvatarSetEnergy（9 条引用）、AvatarSetEnergyCapacity（11 条引用）、Collectible（45 条引用）、DisableDpad（4 条引用）、SetMixChannelVolume（24 条引用）、TerrainBlobGroup（7 条引用）、LevelParameters（2 条引用）、SetEnvDefault（3 条引用）、FragmentCollectActivity（1 条引用）、StarFragmentParams（2 条引用）、WorldQuest（1 条引用）、StarFragmentsConverge（11 条引用）、DisableJump（1 条引用）、WorldQuestTable（5 条引用）、FloatAdd（34 条引用）、DebugLogline（2 条引用）、IfTweakVar（2 条引用）、BirdFlock（37 条引用）、LevelLink（16 条引用）、AttachBeacon（15 条引用）、AttachGuideRail（24 条引用）、Wind（42 条引用）、SpawnMotes（138 条引用）、MoteParams（116 条引用）、DisableStep（2 条引用）、StarFallShower（3 条引用）、CollectCollectible（6 条引用）、SetEmitterFlowRail（1 条引用）、FireTriggerAtRandom（9 条引用）、NetSetMatchmakingDisabled（4 条引用）、CheckpointRestore（26 条引用）、NetDisconnect（1 条引用）、AncestorEngine（75 条引用）、DisableCliffJump（1 条引用）、Branch（3 条引用）、SetGlide（7 条引用）、OnShout（3 条引用）、FlowerPatch（171 条引用）、OnTapPlayAnim（35 条引用）、BenchChat（17 条引用）、Boundary（14 条引用）、AvatarForceEnableFlightMode（2 条引用）、SoulDeposit（10 条引用）、StormKeyUnlock（5 条引用）、Npc_WalkTo（2 条引用）、Npc_HandHold（5 条引用）、Npc_Turn（7 条引用）、AddFloatToStatUsingName（23 条引用）、FloatMult（13 条引用）、OnFloat（110 条引用）、SetSoundParameter（9 条引用）、FloatSplit（4 条引用）、FadeSound（13 条引用）、SetFloat（4 条引用）、Buddy（1 条引用）、SetMixChannelLowpassFreq（24 条引用）、SetForce（9 条引用）、RotateObject（5 条引用）、OnAvatarOnGround（7 条引用）、SendAnalyticsEvent（4 条引用）、BoomCone（2 条引用）、AwakenDarkCreatures（12 条引用）、DarkCreature（16 条引用）、StopGrinding（4 条引用）、IfEnabled（48 条引用）、Water（17 条引用）、SetDarkCreaturesNetworked（3 条引用）、NotOnRegion（6 条引用）、OnAvatarEnergy（14 条引用）、OnUnlockOutfit（1 条引用）、Replay（7 条引用）、Npc_SetScale（19 条引用）、Replay_PlayAnim（4 条引用）、CheckpointState（2 条引用）、MatchHint（3 条引用）、AccountAddCurrency（1 条引用）、OnButtonClick（1 条引用）、OnDemoMode（4 条引用）、SetWind（5 条引用）、IsOutfitInRegion（1 条引用）、SetAvatarMinYSpeed（20 条引用）、Blaze（43 条引用）、MakeMagnetize（14 条引用）、MakeFloaty（7 条引用）、Star（3 条引用）、ResumeEnable（5 条引用）、Tweener（9 条引用）、OnLevelStart（1 条引用）、SetDroppableCountFloat（2 条引用）、AvatarBreakHandHold（2 条引用）、DisableRise（1 条引用）、SwapMoteParams（28 条引用）、StreamLevelLink（2 条引用）、FogVolumeSphere（11 条引用）、OnMoteCarry（1 条引用）、KillBox（24 条引用）、Npc_Teleport（27 条引用）、SetAvatarRender（24 条引用）、CarryAncestorQuestPrefab（2 条引用）、SpinMotes（9 条引用）、Critter_Shout（21 条引用）、BirdV2ParamSwap（18 条引用）、SetBirdGuidesEnabled（4 条引用）、BirdV2Params（6 条引用）、DetachFromBirdGuides（4 条引用）、EnableCollision（8 条引用）、Critter_OnRegion（3 条引用）、BirdV2AiParams（3 条引用）、CloudBob（5 条引用）、Npc_TakeOutFlame（1 条引用）、Replay_HandHold（1 条引用）、SetFlightParams（4 条引用）、ReleaseBirds（3 条引用）、Npc_GetAttention（6 条引用）、AchievementShrine（2 条引用）、SetShopTableTutorial（2 条引用）、OnOutfitShopPurchase（2 条引用）、Npc_BreakHandHold（1 条引用）、OnOfferGift（1 条引用）、OnBetaMode（2 条引用）、OpenConstellationTable（2 条引用）、OnBubbleButton（6 条引用）、FireWorkShow（10 条引用）、CloseOutfitShop（1 条引用）、Npc_OnHandHold（3 条引用）、Npc_DisableGiftGiving（2 条引用）、Npc_DisableRelationshipMenu（1 条引用）、Npc_OnNicknamed（1 条引用）、DailyQuestsGiver（2 条引用）、UIInterestMask（4 条引用）、Npc_Chat（2 条引用）、OnConfirmMenu（2 条引用）、ReverbRegion（1 条引用）、Npc_OnRecieveGift（1 条引用）、Npc_GiveCandle（1 条引用）、AddPoi（2 条引用）、DeathMarch（4 条引用）、Npc_Prompt（1 条引用）、DarkstoneRainRegion（11 条引用）、Npc_Reflect（1 条引用）、AvatarSetZeroG（1 条引用）、OnEventSeries（2 条引用）、OnMusicOutro（1 条引用）、Mote（50 条引用）、ScoreRaceCollectibles（1 条引用）、AncestorRace（2 条引用）、ExitRace（1 条引用）、DistributeRaceCollectibles（1 条引用）、DistributeSpiritCollectibles（2 条引用）、AncestorRaceGoal（1 条引用）、SetGlobalEventParameter（2 条引用）、ShowMOTD（2 条引用）、AgeGate（1 条引用）、OnLatestVersion（1 条引用）、OnJoinPreviousGame（1 条引用）、OnAccountReady（1 条引用）、TitleGate（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：环境范围的 Marker 成员和计时控制已核验；嵌套启用传播、事件顺序与通用 Clump 生命周期待恢复。 本轮共享TGCL字段子链含24个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Clump的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：环境范围的 Marker 成员和计时控制已核验；嵌套启用传播、事件顺序与通用 Clump 生命周期待恢复。 本轮共享TGCL字段子链含24个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Clump的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：环境范围的 Marker 成员和计时控制已核验；嵌套启用传播、事件顺序与通用 Clump 生命周期待恢复。 本轮共享TGCL字段子链含24个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Clump的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：环境范围的 Marker 成员和计时控制已核验；嵌套启用传播、事件顺序与通用 Clump 生命周期待恢复。 本轮共享TGCL字段子链含24个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Clump的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 154 / 嵌套 0）、CandleSpaceEnd（节点 253 / 嵌套 0）、CarryLand（节点 8 / 嵌套 0）、CarryLand2（节点 20 / 嵌套 0）、CarryLand3（节点 5 / 嵌套 0）、Dawn（节点 1053 / 嵌套 0）、DayEnd（节点 265 / 嵌套 0）、DayHubCave（节点 246 / 嵌套 0）、Dusk（节点 197 / 嵌套 0）、DuskGraveyard（节点 179 / 嵌套 0）、DuskMid（节点 207 / 嵌套 0）、Dusk_CrabField（节点 38 / 嵌套 0）、HubReveal（节点 417 / 嵌套 0）、Night（节点 981 / 嵌套 0）、NightEnd（节点 370 / 嵌套 0）、NightEntrance（节点 116 / 嵌套 0）、Prairie_ButterflyFields（节点 233 / 嵌套 0）、Prairie_Cave（节点 208 / 嵌套 0）、Prairie_NestAndKeeper（节点 153 / 嵌套 0）、Prairie_Village（节点 840 / 嵌套 0）、Rain（节点 371 / 嵌套 0）、RainEnd（节点 396 / 嵌套 0）、RainForest（节点 183 / 嵌套 0）、RainMid（节点 462 / 嵌套 0）、SkyHub2（节点 711 / 嵌套 0）、Storm（节点 340 / 嵌套 0）、StormEnd（节点 289 / 嵌套 0）、Sunset（节点 253 / 嵌套 0）、SunsetEnd（节点 294 / 嵌套 0）、SunsetEnd2（节点 152 / 嵌套 0）、SunsetRace（节点 176 / 嵌套 0）、TitleWater（节点 57 / 嵌套 0）、WorldEmpty（节点 0 / 嵌套 0）。

原注册字段：1；文件声明字段变体：1。 RTTI：`0x100c969f0`。

实现：[environment-regions.ts](../src/core/environment-regions.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[native-string-runtime.ts](../src/core/native-string-runtime.ts)、[clump-runtime.ts](../src/core/clump-runtime.ts)、[object-enabled-runtime.ts](../src/core/object-enabled-runtime.ts)、[logic-event-runtime.ts](../src/core/logic-event-runtime.ts)、[object-resume-runtime.ts](../src/core/object-resume-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[environment-clump-oracle.json](environment-clump-oracle.json)、[烘焙与环境逆向进展.md](烘焙与环境逆向进展.md)、[tgcl-field-oracle.json](tgcl-field-oracle.json)、[TGCL字段装载与引用修复逆向.md](TGCL字段装载与引用修复逆向.md)、[Enable与IfEnabled对象组调用链逆向.md](Enable与IfEnabled对象组调用链逆向.md)、[logic-chain-oracle.json](logic-chain-oracle.json)、[Marker启用与ResumeEnable恢复调用链逆向.md](Marker启用与ResumeEnable恢复调用链逆向.md)、[marker-resume-native.json](marker-resume-native.json)、[Objects对象组启用延迟与条件地图播放.md](Objects对象组启用延迟与条件地图播放.md)、[object-logic-preview-oracle.json](object-logic-preview-oracle.json)、[object-logic-preview-availability.json](object-logic-preview-availability.json)、[object-logic-preview-smoke.json](object-logic-preview-smoke.json)、[object-logic-preview-verification.json](object-logic-preview-verification.json)、[object-logic-preview-native.json.gz](../tests/fixtures/object-logic-preview-native.json.gz)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)。

</details>

<details>
<summary>CollectCollectible · 30%（3/10）</summary>

触发收集指定收集物。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CollectCollectible 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 触发收集指定收集物：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Collectible（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c98230`。

</details>

<details>
<summary>Collectible · 30%（3/10）</summary>

收集物类型、名称与空间。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Collectible 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 3 项。
- [ ] 收集物类型、名称与空间：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、HubReveal（节点 6 / 嵌套 0）、Night（节点 5 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 3 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 3 / 嵌套 0）、RainMid（节点 5 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 5 / 嵌套 0）。

原注册字段：3；文件声明字段变体：3。 RTTI：`0x100c98410`。

</details>

<details>
<summary>CollectibleDisplay · 30%（3/10）</summary>

按地图收集状态显示对象。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：CollectibleDisplay 的原默认值、继承初始化及 12 个序列化字段变体；原注册字段 11 项。
- [ ] 按地图收集状态显示对象：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（9 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 11 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、SkyHub2（节点 8 / 嵌套 0）。

原注册字段：11；文件声明字段变体：12。 RTTI：`0x100c98730`。

</details>

<details>
<summary>Crab · 40%（4/10）</summary>

螃蟹实例。

原 Load／CrabAi.Initialize、自己的 CrabIdle／GoSit2／UISit 初始化、保存字段与独立骨骼动作预览已有核验。原评分／比较／评分恢复／运动读取408组、群体转向105组、Begin／Seek／End132组均与原机器码零差异。完整 CrabAi.SelectState 新增87组、12,116,664字节、2,531次调用零差异；完整 CrabAi.Update 新增139组、19,358,808字节、827次调用零差异，覆盖各状态目标、探针引导、实际群体转向、连续帧缓存、速度与转向输出，组合入口连接实际选择／比较／评分／更新。数学、metadata和场景查询依赖仍为明确服务；完整 Crab.Update、原地面／世界碰撞、真实 Model 构造／克隆、动画／交互 owner、动态提交和卸载尚未完成。手动动作预览与AI子链核验不作为完整生物验收，完整运行类仍未增加。 本轮CrabBarn归属分配49组、完整Barn.Update18组原对照零差异：指定owner优先、无指定owner按玩家轮转、零玩家除法故障、流收发分支与回调后128字节交互历史／计数复制保持原顺序。本次完整NetState／Receive／Send与实际Barn.Update组合176组、46,303,232字节、853次有序服务调用原对照零差异。保留私有目标引用转换、120字节scratch未写字段、所有权跳过、捕获发送名单、实时解码计数、重叠写回和每蟹计时器；接收计数没有默认输入，必须由解码器输出。真实网络owner、Crab外层运动／碰撞及Model／动画／GPU生命周期仍待接。 本次完整包字段编解码、实际BinaryStream位／字节／整数／量化／布尔／向量与PlayerId上下文和NetPlayerBarn映射已恢复，并接实际Barn收发；432组、113,345,280字节、489次metadata／流查找调用原对照零差异。真实缓冲中的包字节、读回字段、对齐／游标／有效位、越界与NaN断言均核验；上下文2失败读取的原私有字节须显式提供。真实传输／场景、外层运动碰撞、Model／动画／GPU和切图生命周期仍待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Crab 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 3 项。
- [ ] 螃蟹实例（部分完成）：原 Load／CrabAi.Initialize、自己的 CrabIdle／GoSit2／UISit 初始化、保存字段与独立骨骼动作预览已有核验。原评分／比较／评分恢复／运动读取408组、群体转向105组、Begin／Seek／End132组均与原机器码零差异。完整 CrabAi.SelectState 新增87组、12,116,664字节、2,531次调用零差异；完整 CrabAi.Update 新增139组、19,358,808字节、827次调用零差异，覆盖各状态目标、探针引导、实际群体转向、连续帧缓存、速度与转向输出，组合入口连接实际选择／比较／评分／更新。数学、metadata和场景查询依赖仍为明确服务；完整 Crab.Update、原地面／世界碰撞、真实 Model 构造／克隆、动画／交互 owner、动态提交和卸载尚未完成。手动动作预览与AI子链核验不作为完整生物验收，完整运行类仍未增加。 本轮CrabBarn归属分配49组、完整Barn.Update18组原对照零差异：指定owner优先、无指定owner按玩家轮转、零玩家除法故障、流收发分支与回调后128字节交互历史／计数复制保持原顺序。本次完整NetState／Receive／Send与实际Barn.Update组合176组、46,303,232字节、853次有序服务调用原对照零差异。保留私有目标引用转换、120字节scratch未写字段、所有权跳过、捕获发送名单、实时解码计数、重叠写回和每蟹计时器；接收计数没有默认输入，必须由解码器输出。真实网络owner、Crab外层运动／碰撞及Model／动画／GPU生命周期仍待接。 本次完整包字段编解码、实际BinaryStream位／字节／整数／量化／布尔／向量与PlayerId上下文和NetPlayerBarn映射已恢复，并接实际Barn收发；432组、113,345,280字节、489次metadata／流查找调用原对照零差异。真实缓冲中的包字节、读回字段、对齐／游标／有效位、越界与NaN断言均核验；上下文2失败读取的原私有字节须显式提供。真实传输／场景、外层运动碰撞、Model／动画／GPU和切图生命周期仍待接。
- [ ] 依赖调用与事件：CrabParams（140 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、Dusk_CrabField（节点 128 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、Storm（节点 6 / 嵌套 0）。

原注册字段：3；文件声明字段变体：3。 RTTI：`0x100c9b260`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[crab-load-runtime.ts](../src/core/crab-load-runtime.ts)、[creature-ai-initialize-runtime.ts](../src/core/creature-ai-initialize-runtime.ts)、[resource-model-animation-preview.ts](../src/core/resource-model-animation-preview.ts)、[model-animation-preview.ts](../src/renderer/model-animation-preview.ts)、[creature-steering-runtime.ts](../src/core/creature-steering-runtime.ts)、[crab-behavior-runtime.ts](../src/core/crab-behavior-runtime.ts)、[creature-motion-state-runtime.ts](../src/core/creature-motion-state-runtime.ts)、[creature-flocking-runtime.ts](../src/core/creature-flocking-runtime.ts)、[crab-state-runtime.ts](../src/core/crab-state-runtime.ts)、[crab-ai-update-runtime.ts](../src/core/crab-ai-update-runtime.ts)、[crab-barn-runtime.ts](../src/core/crab-barn-runtime.ts)、[crab-network-runtime.ts](../src/core/crab-network-runtime.ts)、[binary-stream-runtime.ts](../src/core/binary-stream-runtime.ts)、[crab-codec-runtime.ts](../src/core/crab-codec-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[黑暗植物与生物加载续接.md](黑暗植物与生物加载续接.md)、[creature-plant-load-native.json](creature-plant-load-native.json)、[crab-load-oracle.json](crab-load-oracle.json)、[自然动画与鸟群引导续接.md](自然动画与鸟群引导续接.md)、[creature-steering-native.json](creature-steering-native.json)、[creature-steering-oracle.json](creature-steering-oracle.json)、[crab-behavior-native.json](crab-behavior-native.json)、[crab-behavior-oracle.json](crab-behavior-oracle.json)、[creature-flocking-oracle.json](creature-flocking-oracle.json)、[螃蟹行为与群体转向续接.md](螃蟹行为与群体转向续接.md)、[crab-state-oracle.json](crab-state-oracle.json)、[crab-ai-update-oracle.json](crab-ai-update-oracle.json)、[crab-ai-verification.json](crab-ai-verification.json)、[creature-lifecycle-native.json](creature-lifecycle-native.json)、[creature-lifecycle-oracle.json](creature-lifecycle-oracle.json)、[crab-network-native.json](crab-network-native.json)、[crab-network-oracle.json](crab-network-oracle.json)、[crab-network-runtime.test.ts](../tests/crab-network-runtime.test.ts)、[crab-network-native.json.gz](../tests/fixtures/crab-network-native.json.gz)、[crab-codec-native.json](crab-codec-native.json)、[crab-codec-oracle.json](crab-codec-oracle.json)、[crab-codec-runtime.test.ts](../tests/crab-codec-runtime.test.ts)、[crab-codec-native.json.gz](../tests/fixtures/crab-codec-native.json.gz)、[螃蟹真实包编解码与打包门槛.md](螃蟹真实包编解码与打包门槛.md)。

</details>

<details>
<summary>CrabParams · 30%（3/10）</summary>

螃蟹追逐、逃跑与状态参数。

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：CrabParams 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 15 项。
- [ ] 螃蟹追逐、逃跑与状态参数：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 依赖调用与事件：LevelMesh（7 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 15 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 明确范围的原核心子链已独立核验（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）。

原注册字段：15；文件声明字段变体：15。 RTTI：`0x100c9b140`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)。

</details>

<details>
<summary>Critter_OnRegion · 40%（4/10）</summary>

生物集合进入区域条件。

原父构造和缺省／保存字段已恢复并检查 4 个真实实例；区域碰撞、成员创建／释放、CritterV2 消息和完整 Update 仍待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Critter_OnRegion 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 9 项。
- [ ] 生物集合进入区域条件（部分完成）：原父构造和缺省／保存字段已恢复并检查 4 个真实实例；区域碰撞、成员创建／释放、CritterV2 消息和完整 Update 仍待接。
- [ ] 依赖调用与事件：Clump（12 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原父构造和缺省／保存字段已恢复并检查 4 个真实实例；区域碰撞、成员创建／释放、CritterV2 消息和完整 Update 仍待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原父构造和缺省／保存字段已恢复并检查 4 个真实实例；区域碰撞、成员创建／释放、CritterV2 消息和完整 Update 仍待接。
- [x] 明确范围的原核心子链已独立核验：原父构造和缺省／保存字段已恢复并检查 4 个真实实例；区域碰撞、成员创建／释放、CritterV2 消息和完整 Update 仍待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DuskGraveyard（节点 1 / 嵌套 0）、Prairie_Village（节点 3 / 嵌套 0）。

原注册字段：9；文件声明字段变体：11。 RTTI：`0x100c9caf0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)。

证据：[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-objects-defaults.json](creature-objects-defaults.json)、[creature-objects-default-oracle.json](creature-objects-default-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[生物类续接.md](生物类续接.md)。

</details>

<details>
<summary>Critter_Shout · 40%（4/10）</summary>

生物集合喊叫音效与视觉。

原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Critter_Shout 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 生物集合喊叫音效与视觉（部分完成）：原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。
- [ ] 依赖调用与事件：Clump（15 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。
- [x] 明确范围的原核心子链已独立核验：原父构造、缺省标志和完整普通 OnEnabled 已核验；捕获初始数量，回调后重读 Clump、玩家 owner 和两项字节标志，保留断言与 Event.Start。实际 15 个保存事件明确阻止执行并显示 CritterV2 视觉／音频 owner 未接入，不以空服务代替效果。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_Village（节点 15 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c9ce20`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[nature-event-runtime.ts](../src/core/nature-event-runtime.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)。

证据：[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-objects-defaults.json](creature-objects-defaults.json)、[creature-objects-default-oracle.json](creature-objects-default-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[生物类续接.md](生物类续接.md)、[nature-events-native.json](nature-events-native.json)、[nature-event-oracle.json](nature-event-oracle.json)。

</details>

<details>
<summary>DailyQuestsGiver · 30%（3/10）</summary>

每日任务 NPC 与区域。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DailyQuestsGiver 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 每日任务 NPC 与区域：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（1 条引用）、Marker（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c9d5a0`。

</details>

<details>
<summary>DarkCreature · 40%（4/10）</summary>

暗生物实例。

原构造／保存字段／池分配及巡逻／冷却轨道切换已核验；完整普通 Load 86 组原对照零差异，含自身模型、五项纹理、骨骼、风场、Marker 和晚期轨道断言。Model／动画／Rail 几何／资源 owner、攻击碰撞、AI、音效和动态绘制仍待接。 本轮完整警戒转换62组、返回／冷却状态64组原对照零差异；包含24组实际Motion.Seek＋SwitchRail组合，保留检测前警戒快照、检测回调后重读、十秒转换计时、头骨位置、速度缩放、冷却切轨和晚期重置。本次完整玩家／鸟目标检测与实际警戒调用者组合179组、35,741,516字节、2,854次有序服务调用原对照零差异；保留六个近锚点、能量／启用门控、严格距离／视锥筛选、原候选顺序、射线遮挡、当前目标警戒和64鸟槽边界。原atan2f／cosf显式记录重放；真实Avatar／世界／射线owner、完整外层Update、其他状态／攻击／动画／碰撞和资源owner仍待接。 本次原外层Update前半段0x10026ddb0..0x10026e7da已恢复，止于Model.SetTransform与回调owner写入，包含状态分支、上下边界更新、速度平滑、真实速度／位置积分、朝向基与缩放矩阵。完整出现辅助函数和原Motion.FollowRail已恢复并接实际Seek／SwitchRail；587组、80,561,452字节、5,656次调用原对照零差异，包含真正组合入口、阈值／NaN／有向零、私有W、目标有效性、回调重读与连续帧。该阶段仅为部分外层Update；追击／攻击内部、后半段探照／音效／交互、真实Model／动画／GPU及场景生命周期仍待接，完整生物验收仍为0。 本阶段完整Chase／Attack／Hit及实际固定AvatarBarn索引／active读取已恢复，接已验证的外层移动前半段，585组、315,046,180字节、13,024次调用原对照零差异。涵盖水平追击阻尼、锁定音效／动作、计时后攻击、目标预测与脱离方向、重复版本检查、严格命中阈值、64鸟槽与16玩家槽、当地玩家反馈、实际命中函数组合、特效／音效请求、显式私有up.W、owner／模板／调色板回调重读及连续帧。原Hit函数已恢复，但Bird.Hit及真实动画／音效／交互／粒子资源owner仍为明确服务。完整外层Update后半段、真实场景Model／动画／GPU和自主视口／切图／卸载验收仍未完成，完整生物验收仍为0。 本阶段眼部／探照0x10026e7da..0x10026f41e连成原顺序更新链，504组、68,136,704字节、12,965次调用原对照零差异，涵盖巡视／警戒扫动／锁定朝向、四元数插值、眼部变换、地面射线、玩家／鸟落点、平滑、半径10→2.5、两次环境颜色查询、检测Marker及效果到期；后续交互／声音、真实资源／世界／渲染owner和视口／切图验收仍待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：DarkCreature 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 2 项。
- [ ] 暗生物实例（部分完成）：原构造／保存字段／池分配及巡逻／冷却轨道切换已核验；完整普通 Load 86 组原对照零差异，含自身模型、五项纹理、骨骼、风场、Marker 和晚期轨道断言。Model／动画／Rail 几何／资源 owner、攻击碰撞、AI、音效和动态绘制仍待接。 本轮完整警戒转换62组、返回／冷却状态64组原对照零差异；包含24组实际Motion.Seek＋SwitchRail组合，保留检测前警戒快照、检测回调后重读、十秒转换计时、头骨位置、速度缩放、冷却切轨和晚期重置。本次完整玩家／鸟目标检测与实际警戒调用者组合179组、35,741,516字节、2,854次有序服务调用原对照零差异；保留六个近锚点、能量／启用门控、严格距离／视锥筛选、原候选顺序、射线遮挡、当前目标警戒和64鸟槽边界。原atan2f／cosf显式记录重放；真实Avatar／世界／射线owner、完整外层Update、其他状态／攻击／动画／碰撞和资源owner仍待接。 本次原外层Update前半段0x10026ddb0..0x10026e7da已恢复，止于Model.SetTransform与回调owner写入，包含状态分支、上下边界更新、速度平滑、真实速度／位置积分、朝向基与缩放矩阵。完整出现辅助函数和原Motion.FollowRail已恢复并接实际Seek／SwitchRail；587组、80,561,452字节、5,656次调用原对照零差异，包含真正组合入口、阈值／NaN／有向零、私有W、目标有效性、回调重读与连续帧。该阶段仅为部分外层Update；追击／攻击内部、后半段探照／音效／交互、真实Model／动画／GPU及场景生命周期仍待接，完整生物验收仍为0。 本阶段完整Chase／Attack／Hit及实际固定AvatarBarn索引／active读取已恢复，接已验证的外层移动前半段，585组、315,046,180字节、13,024次调用原对照零差异。涵盖水平追击阻尼、锁定音效／动作、计时后攻击、目标预测与脱离方向、重复版本检查、严格命中阈值、64鸟槽与16玩家槽、当地玩家反馈、实际命中函数组合、特效／音效请求、显式私有up.W、owner／模板／调色板回调重读及连续帧。原Hit函数已恢复，但Bird.Hit及真实动画／音效／交互／粒子资源owner仍为明确服务。完整外层Update后半段、真实场景Model／动画／GPU和自主视口／切图／卸载验收仍未完成，完整生物验收仍为0。 本阶段眼部／探照0x10026e7da..0x10026f41e连成原顺序更新链，504组、68,136,704字节、12,965次调用原对照零差异，涵盖巡视／警戒扫动／锁定朝向、四元数插值、眼部变换、地面射线、玩家／鸟落点、平滑、半径10→2.5、两次环境颜色查询、检测Marker及效果到期；后续交互／声音、真实资源／世界／渲染owner和视口／切图验收仍待接。
- [ ] 依赖调用与事件：DarkCreatureParams（13 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原构造／保存字段／池分配及巡逻／冷却轨道切换已核验；完整普通 Load 86 组原对照零差异，含自身模型、五项纹理、骨骼、风场、Marker 和晚期轨道断言。Model／动画／Rail 几何／资源 owner、攻击碰撞、AI、音效和动态绘制仍待接。 本轮完整警戒转换62组、返回／冷却状态64组原对照零差异；包含24组实际Motion.Seek＋SwitchRail组合，保留检测前警戒快照、检测回调后重读、十秒转换计时、头骨位置、速度缩放、冷却切轨和晚期重置。本次完整玩家／鸟目标检测与实际警戒调用者组合179组、35,741,516字节、2,854次有序服务调用原对照零差异；保留六个近锚点、能量／启用门控、严格距离／视锥筛选、原候选顺序、射线遮挡、当前目标警戒和64鸟槽边界。原atan2f／cosf显式记录重放；真实Avatar／世界／射线owner、完整外层Update、其他状态／攻击／动画／碰撞和资源owner仍待接。 本次原外层Update前半段0x10026ddb0..0x10026e7da已恢复，止于Model.SetTransform与回调owner写入，包含状态分支、上下边界更新、速度平滑、真实速度／位置积分、朝向基与缩放矩阵。完整出现辅助函数和原Motion.FollowRail已恢复并接实际Seek／SwitchRail；587组、80,561,452字节、5,656次调用原对照零差异，包含真正组合入口、阈值／NaN／有向零、私有W、目标有效性、回调重读与连续帧。该阶段仅为部分外层Update；追击／攻击内部、后半段探照／音效／交互、真实Model／动画／GPU及场景生命周期仍待接，完整生物验收仍为0。 本阶段完整Chase／Attack／Hit及实际固定AvatarBarn索引／active读取已恢复，接已验证的外层移动前半段，585组、315,046,180字节、13,024次调用原对照零差异。涵盖水平追击阻尼、锁定音效／动作、计时后攻击、目标预测与脱离方向、重复版本检查、严格命中阈值、64鸟槽与16玩家槽、当地玩家反馈、实际命中函数组合、特效／音效请求、显式私有up.W、owner／模板／调色板回调重读及连续帧。原Hit函数已恢复，但Bird.Hit及真实动画／音效／交互／粒子资源owner仍为明确服务。完整外层Update后半段、真实场景Model／动画／GPU和自主视口／切图／卸载验收仍未完成，完整生物验收仍为0。 本阶段眼部／探照0x10026e7da..0x10026f41e连成原顺序更新链，504组、68,136,704字节、12,965次调用原对照零差异，涵盖巡视／警戒扫动／锁定朝向、四元数插值、眼部变换、地面射线、玩家／鸟落点、平滑、半径10→2.5、两次环境颜色查询、检测Marker及效果到期；后续交互／声音、真实资源／世界／渲染owner和视口／切图验收仍待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原构造／保存字段／池分配及巡逻／冷却轨道切换已核验；完整普通 Load 86 组原对照零差异，含自身模型、五项纹理、骨骼、风场、Marker 和晚期轨道断言。Model／动画／Rail 几何／资源 owner、攻击碰撞、AI、音效和动态绘制仍待接。 本轮完整警戒转换62组、返回／冷却状态64组原对照零差异；包含24组实际Motion.Seek＋SwitchRail组合，保留检测前警戒快照、检测回调后重读、十秒转换计时、头骨位置、速度缩放、冷却切轨和晚期重置。本次完整玩家／鸟目标检测与实际警戒调用者组合179组、35,741,516字节、2,854次有序服务调用原对照零差异；保留六个近锚点、能量／启用门控、严格距离／视锥筛选、原候选顺序、射线遮挡、当前目标警戒和64鸟槽边界。原atan2f／cosf显式记录重放；真实Avatar／世界／射线owner、完整外层Update、其他状态／攻击／动画／碰撞和资源owner仍待接。 本次原外层Update前半段0x10026ddb0..0x10026e7da已恢复，止于Model.SetTransform与回调owner写入，包含状态分支、上下边界更新、速度平滑、真实速度／位置积分、朝向基与缩放矩阵。完整出现辅助函数和原Motion.FollowRail已恢复并接实际Seek／SwitchRail；587组、80,561,452字节、5,656次调用原对照零差异，包含真正组合入口、阈值／NaN／有向零、私有W、目标有效性、回调重读与连续帧。该阶段仅为部分外层Update；追击／攻击内部、后半段探照／音效／交互、真实Model／动画／GPU及场景生命周期仍待接，完整生物验收仍为0。 本阶段完整Chase／Attack／Hit及实际固定AvatarBarn索引／active读取已恢复，接已验证的外层移动前半段，585组、315,046,180字节、13,024次调用原对照零差异。涵盖水平追击阻尼、锁定音效／动作、计时后攻击、目标预测与脱离方向、重复版本检查、严格命中阈值、64鸟槽与16玩家槽、当地玩家反馈、实际命中函数组合、特效／音效请求、显式私有up.W、owner／模板／调色板回调重读及连续帧。原Hit函数已恢复，但Bird.Hit及真实动画／音效／交互／粒子资源owner仍为明确服务。完整外层Update后半段、真实场景Model／动画／GPU和自主视口／切图／卸载验收仍未完成，完整生物验收仍为0。 本阶段眼部／探照0x10026e7da..0x10026f41e连成原顺序更新链，504组、68,136,704字节、12,965次调用原对照零差异，涵盖巡视／警戒扫动／锁定朝向、四元数插值、眼部变换、地面射线、玩家／鸟落点、平滑、半径10→2.5、两次环境颜色查询、检测Marker及效果到期；后续交互／声音、真实资源／世界／渲染owner和视口／切图验收仍待接。
- [x] 明确范围的原核心子链已独立核验：原构造／保存字段／池分配及巡逻／冷却轨道切换已核验；完整普通 Load 86 组原对照零差异，含自身模型、五项纹理、骨骼、风场、Marker 和晚期轨道断言。Model／动画／Rail 几何／资源 owner、攻击碰撞、AI、音效和动态绘制仍待接。 本轮完整警戒转换62组、返回／冷却状态64组原对照零差异；包含24组实际Motion.Seek＋SwitchRail组合，保留检测前警戒快照、检测回调后重读、十秒转换计时、头骨位置、速度缩放、冷却切轨和晚期重置。本次完整玩家／鸟目标检测与实际警戒调用者组合179组、35,741,516字节、2,854次有序服务调用原对照零差异；保留六个近锚点、能量／启用门控、严格距离／视锥筛选、原候选顺序、射线遮挡、当前目标警戒和64鸟槽边界。原atan2f／cosf显式记录重放；真实Avatar／世界／射线owner、完整外层Update、其他状态／攻击／动画／碰撞和资源owner仍待接。 本次原外层Update前半段0x10026ddb0..0x10026e7da已恢复，止于Model.SetTransform与回调owner写入，包含状态分支、上下边界更新、速度平滑、真实速度／位置积分、朝向基与缩放矩阵。完整出现辅助函数和原Motion.FollowRail已恢复并接实际Seek／SwitchRail；587组、80,561,452字节、5,656次调用原对照零差异，包含真正组合入口、阈值／NaN／有向零、私有W、目标有效性、回调重读与连续帧。该阶段仅为部分外层Update；追击／攻击内部、后半段探照／音效／交互、真实Model／动画／GPU及场景生命周期仍待接，完整生物验收仍为0。 本阶段完整Chase／Attack／Hit及实际固定AvatarBarn索引／active读取已恢复，接已验证的外层移动前半段，585组、315,046,180字节、13,024次调用原对照零差异。涵盖水平追击阻尼、锁定音效／动作、计时后攻击、目标预测与脱离方向、重复版本检查、严格命中阈值、64鸟槽与16玩家槽、当地玩家反馈、实际命中函数组合、特效／音效请求、显式私有up.W、owner／模板／调色板回调重读及连续帧。原Hit函数已恢复，但Bird.Hit及真实动画／音效／交互／粒子资源owner仍为明确服务。完整外层Update后半段、真实场景Model／动画／GPU和自主视口／切图／卸载验收仍未完成，完整生物验收仍为0。 本阶段眼部／探照0x10026e7da..0x10026f41e连成原顺序更新链，504组、68,136,704字节、12,965次调用原对照零差异，涵盖巡视／警戒扫动／锁定朝向、四元数插值、眼部变换、地面射线、玩家／鸟落点、平滑、半径10→2.5、两次环境颜色查询、检测Marker及效果到期；后续交互／声音、真实资源／世界／渲染owner和视口／切图验收仍待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DuskGraveyard（节点 6 / 嵌套 0）、DuskMid（节点 3 / 嵌套 0）、Storm（节点 4 / 嵌套 0）。

原注册字段：2；文件声明字段变体：2。 RTTI：`0x100c9e090`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[dark-creature-rail-runtime.ts](../src/core/dark-creature-rail-runtime.ts)、[dark-creature-load-runtime.ts](../src/core/dark-creature-load-runtime.ts)、[dark-creature-state-runtime.ts](../src/core/dark-creature-state-runtime.ts)、[creature-motion-runtime.ts](../src/core/creature-motion-runtime.ts)、[dark-creature-detect-runtime.ts](../src/core/dark-creature-detect-runtime.ts)、[dark-creature-motion-runtime.ts](../src/core/dark-creature-motion-runtime.ts)、[dark-creature-appear-runtime.ts](../src/core/dark-creature-appear-runtime.ts)、[creature-motion-rail-runtime.ts](../src/core/creature-motion-rail-runtime.ts)、[dark-creature-combat-runtime.ts](../src/core/dark-creature-combat-runtime.ts)、[dark-creature-look-runtime.ts](../src/core/dark-creature-look-runtime.ts)、[dark-creature-spotlight-runtime.ts](../src/core/dark-creature-spotlight-runtime.ts)、[dark-creature-visual-runtime.ts](../src/core/dark-creature-visual-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[黑暗植物与生物加载续接.md](黑暗植物与生物加载续接.md)、[creature-plant-load-native.json](creature-plant-load-native.json)、[dark-creature-rail-oracle.json](dark-creature-rail-oracle.json)、[creature-objects-defaults.json](creature-objects-defaults.json)、[creature-objects-default-oracle.json](creature-objects-default-oracle.json)、[生物类续接.md](生物类续接.md)、[dark-creature-load-oracle.json](dark-creature-load-oracle.json)、[creature-lifecycle-native.json](creature-lifecycle-native.json)、[creature-lifecycle-oracle.json](creature-lifecycle-oracle.json)、[dark-creature-detect-native.json](dark-creature-detect-native.json)、[dark-creature-detect-oracle.json](dark-creature-detect-oracle.json)、[dark-creature-detect-runtime.test.ts](../tests/dark-creature-detect-runtime.test.ts)、[dark-creature-detect-native.json.gz](../tests/fixtures/dark-creature-detect-native.json.gz)、[dark-creature-motion-native.json](dark-creature-motion-native.json)、[dark-creature-motion-oracle.json](dark-creature-motion-oracle.json)、[dark-creature-motion-runtime.test.ts](../tests/dark-creature-motion-runtime.test.ts)、[dark-creature-motion-native.json.gz](../tests/fixtures/dark-creature-motion-native.json.gz)、[冥龙移动前半段与打包门槛.md](冥龙移动前半段与打包门槛.md)、[dark-creature-combat-native.json](dark-creature-combat-native.json)、[dark-creature-combat-oracle.json](dark-creature-combat-oracle.json)、[dark-creature-combat-runtime.test.ts](../tests/dark-creature-combat-runtime.test.ts)、[dark-creature-combat-native.json.gz](../tests/fixtures/dark-creature-combat-native.json.gz)、[冥龙追击攻击命中与打包门槛.md](冥龙追击攻击命中与打包门槛.md)、[dark-creature-spotlight-native.json](dark-creature-spotlight-native.json)、[dark-creature-spotlight-oracle.json](dark-creature-spotlight-oracle.json)、[冥龙探照光圈与鱼群轨道控制续接.md](冥龙探照光圈与鱼群轨道控制续接.md)。

</details>

<details>
<summary>DarkCreatureParams · 30%（3/10）</summary>

暗生物巡逻轨道与计时参数。

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：DarkCreatureParams 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 7 项。
- [ ] 暗生物巡逻轨道与计时参数：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 依赖调用与事件：Rail（26 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 明确范围的原核心子链已独立核验（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DuskGraveyard（节点 6 / 嵌套 0）、DuskMid（节点 3 / 嵌套 0）、Storm（节点 4 / 嵌套 0）。

原注册字段：7；文件声明字段变体：7。 RTTI：`0x100c9df70`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)。

</details>

<details>
<summary>DarkstoneRainRegion · 30%（3/10）</summary>

区域降落物、收集物与能量消耗。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DarkstoneRainRegion 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 区域降落物、收集物与能量消耗：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（10 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Storm（节点 1 / 嵌套 0）、StormEnd（节点 10 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100c9feb0`。

</details>

<details>
<summary>DeathMarch · 30%（3/10）</summary>

剧情区域、时间轴与场景对象调度。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DeathMarch 的原默认值、继承初始化及 21 个序列化字段变体；原注册字段 20 项。
- [ ] 剧情区域、时间轴与场景对象调度：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：EnvNode（2 条引用）、Wind（2 条引用）、Clump（13 条引用）、Marker（11 条引用）、MoveObjectAlongRail（1 条引用）、Timeline（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 20 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）。

原注册字段：20；文件声明字段变体：21。 RTTI：`0x100c82120`。

</details>

<details>
<summary>DebugLogline · 30%（3/10）</summary>

日志文本事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DebugLogline 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 日志文本事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 2 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100ce2640`。

</details>

<details>
<summary>Delay · 40%（4/10）</summary>

时间、帧或节拍延迟事件。

完整80-byte placement、OnEnable/OnResume及Update已恢复并接ClumpBarn/ValueBarn/EventBarn→TGCL字段/引用→继承反射→数值事件→释放重建联合核验。486组、2119快照、160615784字节0差异，含283/284个真实Delay根图片段；另1个超过核验器48节点容量。时间/帧、错开发送、beat门控、停止和重新启用、原Clump断言已核验。真实片段至多6帧，长延迟可能未到输出时间；9个原断言与244次缺失类服务边界分列。音乐beat、Game/Time初始状态、metadata/default缓存准备、堆/池、实际场景反馈及Windows/原游戏仍待闭合，完整类和实例保持0。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Delay 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 时间、帧或节拍延迟事件（部分完成）：完整80-byte placement、OnEnable/OnResume及Update已恢复并接ClumpBarn/ValueBarn/EventBarn→TGCL字段/引用→继承反射→数值事件→释放重建联合核验。486组、2119快照、160615784字节0差异，含283/284个真实Delay根图片段；另1个超过核验器48节点容量。时间/帧、错开发送、beat门控、停止和重新启用、原Clump断言已核验。真实片段至多6帧，长延迟可能未到输出时间；9个原断言与244次缺失类服务边界分列。音乐beat、Game/Time初始状态、metadata/default缓存准备、堆/池、实际场景反馈及Windows/原游戏仍待闭合，完整类和实例保持0。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 依赖调用与事件（部分完成）：Clump（284 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：完整80-byte placement、OnEnable/OnResume及Update已恢复并接ClumpBarn/ValueBarn/EventBarn→TGCL字段/引用→继承反射→数值事件→释放重建联合核验。486组、2119快照、160615784字节0差异，含283/284个真实Delay根图片段；另1个超过核验器48节点容量。时间/帧、错开发送、beat门控、停止和重新启用、原Clump断言已核验。真实片段至多6帧，长延迟可能未到输出时间；9个原断言与244次缺失类服务边界分列。音乐beat、Game/Time初始状态、metadata/default缓存准备、堆/池、实际场景反馈及Windows/原游戏仍待闭合，完整类和实例保持0。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：完整80-byte placement、OnEnable/OnResume及Update已恢复并接ClumpBarn/ValueBarn/EventBarn→TGCL字段/引用→继承反射→数值事件→释放重建联合核验。486组、2119快照、160615784字节0差异，含283/284个真实Delay根图片段；另1个超过核验器48节点容量。时间/帧、错开发送、beat门控、停止和重新启用、原Clump断言已核验。真实片段至多6帧，长延迟可能未到输出时间；9个原断言与244次缺失类服务边界分列。音乐beat、Game/Time初始状态、metadata/default缓存准备、堆/池、实际场景反馈及Windows/原游戏仍待闭合，完整类和实例保持0。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [x] 明确范围的原核心子链已独立核验：完整80-byte placement、OnEnable/OnResume及Update已恢复并接ClumpBarn/ValueBarn/EventBarn→TGCL字段/引用→继承反射→数值事件→释放重建联合核验。486组、2119快照、160615784字节0差异，含283/284个真实Delay根图片段；另1个超过核验器48节点容量。时间/帧、错开发送、beat门控、停止和重新启用、原Clump断言已核验。真实片段至多6帧，长延迟可能未到输出时间；9个原断言与244次缺失类服务边界分列。音乐beat、Game/Time初始状态、metadata/default缓存准备、堆/池、实际场景反馈及Windows/原游戏仍待闭合，完整类和实例保持0。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：完整80-byte placement、OnEnable/OnResume及Update已恢复并接ClumpBarn/ValueBarn/EventBarn→TGCL字段/引用→继承反射→数值事件→释放重建联合核验。486组、2119快照、160615784字节0差异，含283/284个真实Delay根图片段；另1个超过核验器48节点容量。时间/帧、错开发送、beat门控、停止和重新启用、原Clump断言已核验。真实片段至多6帧，长延迟可能未到输出时间；9个原断言与244次缺失类服务边界分列。音乐beat、Game/Time初始状态、metadata/default缓存准备、堆/池、实际场景反馈及Windows/原游戏仍待闭合，完整类和实例保持0。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：完整80-byte placement、OnEnable/OnResume及Update已恢复并接ClumpBarn/ValueBarn/EventBarn→TGCL字段/引用→继承反射→数值事件→释放重建联合核验。486组、2119快照、160615784字节0差异，含283/284个真实Delay根图片段；另1个超过核验器48节点容量。时间/帧、错开发送、beat门控、停止和重新启用、原Clump断言已核验。真实片段至多6帧，长延迟可能未到输出时间；9个原断言与244次缺失类服务边界分列。音乐beat、Game/Time初始状态、metadata/default缓存准备、堆/池、实际场景反馈及Windows/原游戏仍待闭合，完整类和实例保持0。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 9 / 嵌套 0）、CandleSpaceEnd（节点 6 / 嵌套 0）、Dawn（节点 14 / 嵌套 0）、DayEnd（节点 5 / 嵌套 0）、DayHubCave（节点 4 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 4 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、HubReveal（节点 15 / 嵌套 0）、Night（节点 78 / 嵌套 0）、NightEnd（节点 5 / 嵌套 0）、Prairie_ButterflyFields（节点 4 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_Village（节点 15 / 嵌套 0）、Rain（节点 18 / 嵌套 0）、RainEnd（节点 6 / 嵌套 0）、RainForest（节点 12 / 嵌套 0）、RainMid（节点 25 / 嵌套 0）、SkyHub2（节点 25 / 嵌套 0）、Storm（节点 8 / 嵌套 0）、StormEnd（节点 3 / 嵌套 0）、Sunset（节点 4 / 嵌套 0）、SunsetEnd（节点 10 / 嵌套 0）、SunsetEnd2（节点 2 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 5 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100ca56d0`。

实现：[delay-event-runtime.ts](../src/core/delay-event-runtime.ts)、[logic-event-runtime.ts](../src/core/logic-event-runtime.ts)、[clump-runtime.ts](../src/core/clump-runtime.ts)、[object-enabled-runtime.ts](../src/core/object-enabled-runtime.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)、[on-region-runtime.ts](../src/core/on-region-runtime.ts)、[animation-sequence-registry.ts](../src/core/animation-sequence-registry.ts)、[environment-object-state.ts](../src/core/environment-object-state.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)。

证据：[Delay创建装载与对象组调度逆向.md](Delay创建装载与对象组调度逆向.md)、[delay-event-native.json](delay-event-native.json)、[logic-chain-oracle.json](logic-chain-oracle.json)、[Objects对象组启用延迟与条件地图播放.md](Objects对象组启用延迟与条件地图播放.md)、[object-logic-preview-oracle.json](object-logic-preview-oracle.json)、[object-logic-preview-availability.json](object-logic-preview-availability.json)、[object-logic-preview-smoke.json](object-logic-preview-smoke.json)、[object-logic-preview-verification.json](object-logic-preview-verification.json)、[object-logic-preview-native.json.gz](../tests/fixtures/object-logic-preview-native.json.gz)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[on-region-native.json](on-region-native.json)、[on-region-oracle.json](on-region-oracle.json)、[scene-event-defaults.json](scene-event-defaults.json)、[resource-animation-sequence-oracle.json](resource-animation-sequence-oracle.json)、[fish-group-scene-events.json](fish-group-scene-events.json)、[鱼群区域事件与原序列表续接.md](鱼群区域事件与原序列表续接.md)。

</details>

<details>
<summary>DetachFromBirdGuides · 40%（4/10）</summary>

解除鸟类引导。

原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：DetachFromBirdGuides 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 解除鸟类引导（部分完成）：原 OnEnabled、16槽 Avatar访问／active和版本化 Guide.Get／Set 子函数已独立核验。保留 active→虚 enabled门控、四个实时guide引用、stale／null匹配、版本／dirty／timeout写入。与 Release 共133组、61,560,380字节零差异，接共享 EventBarn；四份保存配置的无活跃引导分支可调度，活跃分支须附加真实 AvatarBarn／启用服务。附加保留既有starts和事件状态，完整玩家／鸟引导owner与原游戏验收仍待接。
- [ ] 依赖调用与事件（部分完成）：BirdV2（4 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Prairie_Village（节点 4 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c8af50`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[bird-guide-runtime.ts](../src/core/bird-guide-runtime.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[bird-guide-native.json](bird-guide-native.json)、[自然动画与鸟群引导续接.md](自然动画与鸟群引导续接.md)、[bird-guide-oracle.json](bird-guide-oracle.json)。

</details>

<details>
<summary>DialogHint · 30%（3/10）</summary>

区域提示、文本、优先级与串联。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DialogHint 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 8 项。
- [ ] 区域提示、文本、优先级与串联：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（113 条引用）、DialogHint（34 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 6 / 嵌套 0）、CandleSpaceEnd（节点 3 / 嵌套 0）、Dawn（节点 23 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、HubReveal（节点 13 / 嵌套 0）、NightEnd（节点 4 / 嵌套 0）、Prairie_ButterflyFields（节点 3 / 嵌套 0）、Prairie_Cave（节点 3 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、SkyHub2（节点 31 / 嵌套 0）、Storm（节点 3 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、TitleWater（节点 2 / 嵌套 0）。

原注册字段：8；文件声明字段变体：9。 RTTI：`0x100ca5d80`。

</details>

<details>
<summary>DisableCliffJump · 20%（2/10）</summary>

悬崖跳跃限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DisableCliffJump 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 悬崖跳跃限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100cfd730`。

</details>

<details>
<summary>DisableDpad · 20%（2/10）</summary>

方向输入限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DisableDpad 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 方向输入限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100cfd190`。

</details>

<details>
<summary>DisableJump · 20%（2/10）</summary>

跳跃限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DisableJump 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 跳跃限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100cfcdd0`。

</details>

<details>
<summary>DisableRise · 20%（2/10）</summary>

上升动作限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DisableRise 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 上升动作限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：NightEnd（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100cfd370`。

</details>

<details>
<summary>DisableStep · 20%（2/10）</summary>

步行动作限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DisableStep 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 步行动作限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100cfcfb0`。

</details>

<details>
<summary>DisplayText · 30%（3/10）</summary>

文字、颜色、位置与淡入淡出。

30 个节点和字段已清点；字体、定位、投影、图层、计时及淡入淡出待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DisplayText 的原默认值、继承初始化及 21 个序列化字段变体；原注册字段 20 项。
- [ ] 文字、颜色、位置与淡入淡出：30 个节点和字段已清点；字体、定位、投影、图层、计时及淡入淡出待恢复。
- [ ] 依赖调用与事件：Float（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 20 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 3 / 嵌套 0）、CarryLand（节点 3 / 嵌套 0）、CarryLand2（节点 4 / 嵌套 0）、Dawn（节点 10 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 3 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）。

原注册字段：20；文件声明字段变体：21。 RTTI：`0x100ca6aa0`。

</details>

<details>
<summary>DisplayTitleCard · 30%（3/10）</summary>

标题卡主副标题与显示规则。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DisplayTitleCard 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 标题卡主副标题与显示规则：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100ca6be0`。

</details>

<details>
<summary>DistributeRaceCollectibles · 30%（3/10）</summary>

队伍竞赛收集物分配。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DistributeRaceCollectibles 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 队伍竞赛收集物分配：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（2 条引用）、Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SunsetEnd（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c7c7e0`。

</details>

<details>
<summary>DistributeSpiritCollectibles · 30%（3/10）</summary>

灵魂收集物分配与完成事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DistributeSpiritCollectibles 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 灵魂收集物分配与完成事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（5 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SunsetEnd（节点 1 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100c7c600`。

</details>

<details>
<summary>DoShout · 30%（3/10）</summary>

在指定位置发起喊叫效果。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DoShout 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 在指定位置发起喊叫效果：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（59 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 40 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 8 / 嵌套 0）、Prairie_NestAndKeeper（节点 3 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd88e0`。

</details>

<details>
<summary>DropOcclusion · 30%（3/10）</summary>

遮挡对象、强度和淡入淡出。

已有共享 Visibility 数值内核；此类原对象/Clump 提交与启用/销毁依赖待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DropOcclusion 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 10 项。
- [ ] 遮挡对象、强度和淡入淡出：已有共享 Visibility 数值内核；此类原对象/Clump 提交与启用/销毁依赖待恢复。
- [ ] 依赖调用与事件：Clump（64 条引用）、Float（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 10 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验（部分完成，未计分）：已有共享 Visibility 数值内核；此类原对象/Clump 提交与启用/销毁依赖待恢复。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 6 / 嵌套 0）、Dawn（节点 12 / 嵌套 0）、DayEnd（节点 5 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 2 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 3 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、RainEnd（节点 13 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、SkyHub2（节点 6 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：10；文件声明字段变体：11。 RTTI：`0x100ca7050`。

证据：[遮挡数据逆向.md](遮挡数据逆向.md)。

</details>

<details>
<summary>DropUnlock · 30%（3/10）</summary>

命名掉落解锁。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：DropUnlock 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 命名掉落解锁：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 2 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c98050`。

</details>

<details>
<summary>Emitter · 30%（3/10）</summary>

粒子发射、附着、吸引与受力。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Emitter 的原默认值、继承初始化及 19 个序列化字段变体；原注册字段 19 项。
- [ ] 粒子发射、附着、吸引与受力：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（10 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 19 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、CandleSpaceEnd（节点 7 / 嵌套 0）、CarryLand2（节点 1 / 嵌套 0）、Dawn（节点 47 / 嵌套 0）、DayEnd（节点 5 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 3 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、HubReveal（节点 17 / 嵌套 0）、Night（节点 17 / 嵌套 0）、NightEnd（节点 60 / 嵌套 0）、NightEntrance（节点 4 / 嵌套 0）、Prairie_Cave（节点 29 / 嵌套 0）、Prairie_Village（节点 12 / 嵌套 0）、Rain（节点 15 / 嵌套 0）、RainEnd（节点 9 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、SkyHub2（节点 18 / 嵌套 0）、Storm（节点 14 / 嵌套 0）、StormEnd（节点 3 / 嵌套 0）、Sunset（节点 4 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 76 / 嵌套 0）、TitleWater（节点 2 / 嵌套 0）。

原注册字段：19；文件声明字段变体：19。 RTTI：`0x100ca7b00`。

</details>

<details>
<summary>Enable · 40%（4/10）</summary>

对象集合启用、禁用及事件终止。

 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Enable的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Enable 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 对象集合启用、禁用及事件终止（部分完成）： 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Enable的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 依赖调用与事件（部分完成）：Clump（1287 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）： 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Enable的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [x] 明确范围的原核心子链已独立核验： 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Enable的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）： 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Enable的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）： 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮恢复Enable的原OnResumeEnabled正常路径及原反射wrapper，接ResumeEnable→TryResume；906组、4313快照、398249100字节原机器码0差异，未提供恢复方法的目标才回退SetEnabled。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 18 / 嵌套 0）、CandleSpaceEnd（节点 38 / 嵌套 0）、Dawn（节点 218 / 嵌套 0）、DayEnd（节点 27 / 嵌套 0）、DayHubCave（节点 12 / 嵌套 0）、Dusk（节点 15 / 嵌套 0）、DuskGraveyard（节点 14 / 嵌套 0）、DuskMid（节点 7 / 嵌套 0）、HubReveal（节点 63 / 嵌套 0）、Night（节点 111 / 嵌套 0）、NightEnd（节点 149 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 14 / 嵌套 0）、Prairie_Cave（节点 26 / 嵌套 0）、Prairie_NestAndKeeper（节点 8 / 嵌套 0）、Prairie_Village（节点 158 / 嵌套 0）、Rain（节点 56 / 嵌套 0）、RainEnd（节点 66 / 嵌套 0）、RainForest（节点 15 / 嵌套 0）、RainMid（节点 38 / 嵌套 0）、SkyHub2（节点 88 / 嵌套 0）、Storm（节点 25 / 嵌套 0）、StormEnd（节点 36 / 嵌套 0）、Sunset（节点 17 / 嵌套 0）、SunsetEnd（节点 21 / 嵌套 0）、SunsetEnd2（节点 25 / 嵌套 0）、SunsetRace（节点 15 / 嵌套 0）、TitleWater（节点 6 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100ca87f0`。

实现：[clump-runtime.ts](../src/core/clump-runtime.ts)、[object-enabled-runtime.ts](../src/core/object-enabled-runtime.ts)、[logic-event-runtime.ts](../src/core/logic-event-runtime.ts)、[object-resume-runtime.ts](../src/core/object-resume-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)、[on-region-runtime.ts](../src/core/on-region-runtime.ts)、[animation-sequence-registry.ts](../src/core/animation-sequence-registry.ts)、[environment-object-state.ts](../src/core/environment-object-state.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)。

证据：[Enable与IfEnabled对象组调用链逆向.md](Enable与IfEnabled对象组调用链逆向.md)、[logic-chain-oracle.json](logic-chain-oracle.json)、[Marker启用与ResumeEnable恢复调用链逆向.md](Marker启用与ResumeEnable恢复调用链逆向.md)、[marker-resume-native.json](marker-resume-native.json)、[Objects对象组启用延迟与条件地图播放.md](Objects对象组启用延迟与条件地图播放.md)、[object-logic-preview-oracle.json](object-logic-preview-oracle.json)、[object-logic-preview-availability.json](object-logic-preview-availability.json)、[object-logic-preview-smoke.json](object-logic-preview-smoke.json)、[object-logic-preview-verification.json](object-logic-preview-verification.json)、[object-logic-preview-native.json.gz](../tests/fixtures/object-logic-preview-native.json.gz)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[on-region-native.json](on-region-native.json)、[on-region-oracle.json](on-region-oracle.json)、[scene-event-defaults.json](scene-event-defaults.json)、[resource-animation-sequence-oracle.json](resource-animation-sequence-oracle.json)、[fish-group-scene-events.json](fish-group-scene-events.json)、[鱼群区域事件与原序列表续接.md](鱼群区域事件与原序列表续接.md)。

</details>

<details>
<summary>EnableCollision · 30%（3/10）</summary>

碰撞几何开关。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：EnableCollision 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 碰撞几何开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_Village（节点 4 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100ca8ce0`。

</details>

<details>
<summary>EnvNode · 40%（4/10）</summary>

空间环境参数与混合。

原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：EnvNode 的原默认值、继承初始化及 47 个序列化字段变体；原注册字段 47 项。
- [ ] 空间环境参数与混合（部分完成）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 47 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [x] 明确范围的原核心子链已独立核验：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原存储转换、空间/计时、更新合成、队列加载和整个1040-byte普通构造有原输出核验；缺enabled字段使用原tag true，无注册默认环境保留初始化/上次输出；太阳派生有独立原程序证据。天空/模型/云共享显式环境owner，暂停采样和切图重置已核验。完整 ObjectFactory/defaults cache、原启动事件、probe/前景雾/cheapFog lookup、Ambience生命周期及原游戏真机仍待闭合。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、CandleSpaceEnd（节点 3 / 嵌套 0）、CarryLand（节点 1 / 嵌套 0）、CarryLand2（节点 1 / 嵌套 0）、CarryLand3（节点 1 / 嵌套 0）、Dawn（节点 12 / 嵌套 0）、DayEnd（节点 7 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、Dusk（节点 5 / 嵌套 0）、DuskGraveyard（节点 13 / 嵌套 0）、DuskMid（节点 10 / 嵌套 0）、Dusk_CrabField（节点 4 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Night（节点 5 / 嵌套 0）、NightEnd（节点 3 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 8 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 6 / 嵌套 0）、Rain（节点 6 / 嵌套 0）、RainEnd（节点 7 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 4 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 3 / 嵌套 0）、Sunset（节点 6 / 嵌套 0）、SunsetEnd（节点 5 / 嵌套 0）、SunsetEnd2（节点 5 / 嵌套 0）、SunsetRace（节点 4 / 嵌套 0）。

原注册字段：47；文件声明字段变体：47。 RTTI：`0x100cac120`。

实现：[environment-storage.ts](../src/core/environment-storage.ts)、[environment-runtime.ts](../src/core/environment-runtime.ts)、[environment-level.ts](../src/core/environment-level.ts)、[env-node-runtime.ts](../src/core/env-node-runtime.ts)、[ambience-sun-runtime.ts](../src/core/ambience-sun-runtime.ts)、[viewport-environment.ts](../src/main/viewport-environment.ts)。

证据：[environment-oracle.json](environment-oracle.json)、[environment-load-oracle.json](environment-load-oracle.json)、[烘焙与环境逆向进展.md](烘焙与环境逆向进展.md)、[环境原构造与共享状态.md](环境原构造与共享状态.md)、[env-node-constructor-oracle.json](env-node-constructor-oracle.json)、[ambience-sun-oracle.json](ambience-sun-oracle.json)、[env-node-gpu-check.json](env-node-gpu-check.json)、[beamo-environment-map-smoke.json](beamo-environment-map-smoke.json)、[env-vars-native.json](../tests/fixtures/env-vars-native.json)。

</details>

<details>
<summary>EventSeries · 30%（3/10）</summary>

事件序列状态与重置计时。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：EventSeries 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 事件序列状态与重置计时：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 6 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd5080`。

</details>

<details>
<summary>ExitRace · 20%（2/10）</summary>

退出竞赛。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ExitRace 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 退出竞赛：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SunsetEnd（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100c7cba0`。

</details>

<details>
<summary>FadeSound · 30%（3/10）</summary>

声音集合音量过渡与停止。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FadeSound 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 声音集合音量过渡与停止：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（10 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayHubCave（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）、SunsetRace（节点 5 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100cfa710`。

</details>

<details>
<summary>FeatureFlag · 30%（3/10）</summary>

命名功能旗标与存在性分支。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FeatureFlag 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 命名功能旗标与存在性分支：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100c72b10`。

</details>

<details>
<summary>FireTriggerAtRandom · 30%（3/10）</summary>

随机间隔及事件选择。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FireTriggerAtRandom 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 随机间隔及事件选择：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（9 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cada10`。

</details>

<details>
<summary>FireWorkShow · 30%（3/10）</summary>

烟花源标记与演出。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FireWorkShow 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 烟花源标记与演出：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 2 / 嵌套 0）、SunsetEnd（节点 4 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cddf70`。

</details>

<details>
<summary>Flame · 40%（4/10）</summary>

火焰实例、点燃、按钮与熄灭。

原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Flame 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 11 项。
- [ ] 火焰实例、点燃、按钮与熄灭（部分完成）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 11 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原普通构造、保存字段和共享 Candle／Flame 记录已恢复；原 CandleBarn.Load／Update／Render／点燃及 Flame.Load／Unload、运动／亮度更新前段已有原对照。新增主 FlameBarn 图元子段、SpriteRenderer.Add／Reset 和单个相机朝向图元的完整 Render：123 组、16,168,644 字节原对照零差异，包含重叠输入、容量断言和原 24 字节顶点。主火焰原 GLSL 已进入共享不透明深度的透明颜色／log-depth 合成；Dawn、SkyHub2、Rain 实际图元像素验证通过。调用方白色无遮挡颜色、风场、时钟、数学 rsqrt、视锥／距离排序及 GPU／资源 owner 仍为明确编辑器服务。完整 FlameBarn、Flame 交互／传播后段、辉光／粒子／音效、奖励／网络和完整原资源生命周期未闭合，不计完整类。
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 7 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 6 / 嵌套 0）、DuskGraveyard（节点 10 / 嵌套 0）、DuskMid（节点 8 / 嵌套 0）、Dusk_CrabField（节点 5 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 76 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_Village（节点 11 / 嵌套 0）、Rain（节点 17 / 嵌套 0）、RainEnd（节点 8 / 嵌套 0）、RainForest（节点 11 / 嵌套 0）、RainMid（节点 31 / 嵌套 0）、Storm（节点 26 / 嵌套 0）、StormEnd（节点 26 / 嵌套 0）、SunsetEnd（节点 42 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：11；文件声明字段变体：11。 RTTI：`0x100caf4c0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[object-item-construction-runtime.ts](../src/core/object-item-construction-runtime.ts)、[flame-runtime.ts](../src/core/flame-runtime.ts)、[candle-runtime.ts](../src/core/candle-runtime.ts)、[candle-render-runtime.ts](../src/core/candle-render-runtime.ts)、[flame-motion-light-runtime.ts](../src/core/flame-motion-light-runtime.ts)、[flame-sprite-runtime.ts](../src/core/flame-sprite-runtime.ts)、[viewport-candle-effects.ts](../src/main/viewport-candle-effects.ts)、[vulkan-viewport-cloud.ts](../src/main/vulkan-viewport-cloud.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[object-item-construction.json](object-item-construction.json)、[object-item-construction-oracle.json](object-item-construction-oracle.json)、[Flame火焰绘制续接.md](Flame火焰绘制续接.md)、[candle-load-oracle.json](candle-load-oracle.json)、[flame-sprite-native.json](flame-sprite-native.json)、[flame-sprite-oracle.json](flame-sprite-oracle.json)、[flame-candle-map-gpu-check.json](flame-candle-map-gpu-check.json)。

</details>

<details>
<summary>Float · 40%（4/10）</summary>

浮点值对象。

原24-byte Float构造保留值/回链/padding，184个实际保存值及运算别名已核验。本轮ObjectFactory→ValueBarn/EventBarn创建→字段/局部引用修复→触发登记→原OnLevelLoad/Update接入FloatMult/FloatAdd/SetFloat：全部14/31/4个真实配置子图；基础2278组、40个命名原函数及1个区间、0差异，2435个快照。完整metadata/default缓存、堆内部、对象名字、多功能类和场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Float 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 1 项。
- [ ] 浮点值对象（部分完成）：原24-byte Float构造保留值/回链/padding，184个实际保存值及运算别名已核验。本轮ObjectFactory→ValueBarn/EventBarn创建→字段/局部引用修复→触发登记→原OnLevelLoad/Update接入FloatMult/FloatAdd/SetFloat：全部14/31/4个真实配置子图；基础2278组、40个命名原函数及1个区间、0差异，2435个快照。完整metadata/default缓存、堆内部、对象名字、多功能类和场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原24-byte Float构造保留值/回链/padding，184个实际保存值及运算别名已核验。本轮ObjectFactory→ValueBarn/EventBarn创建→字段/局部引用修复→触发登记→原OnLevelLoad/Update接入FloatMult/FloatAdd/SetFloat：全部14/31/4个真实配置子图；基础2278组、40个命名原函数及1个区间、0差异，2435个快照。完整metadata/default缓存、堆内部、对象名字、多功能类和场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原24-byte Float构造保留值/回链/padding，184个实际保存值及运算别名已核验。本轮ObjectFactory→ValueBarn/EventBarn创建→字段/局部引用修复→触发登记→原OnLevelLoad/Update接入FloatMult/FloatAdd/SetFloat：全部14/31/4个真实配置子图；基础2278组、40个命名原函数及1个区间、0差异，2435个快照。完整metadata/default缓存、堆内部、对象名字、多功能类和场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：原24-byte Float构造保留值/回链/padding，184个实际保存值及运算别名已核验。本轮ObjectFactory→ValueBarn/EventBarn创建→字段/局部引用修复→触发登记→原OnLevelLoad/Update接入FloatMult/FloatAdd/SetFloat：全部14/31/4个真实配置子图；基础2278组、40个命名原函数及1个区间、0差异，2435个快照。完整metadata/default缓存、堆内部、对象名字、多功能类和场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原24-byte Float构造保留值/回链/padding，184个实际保存值及运算别名已核验。本轮ObjectFactory→ValueBarn/EventBarn创建→字段/局部引用修复→触发登记→原OnLevelLoad/Update接入FloatMult/FloatAdd/SetFloat：全部14/31/4个真实配置子图；基础2278组、40个命名原函数及1个区间、0差异，2435个快照。完整metadata/default缓存、堆内部、对象名字、多功能类和场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 4 / 嵌套 0）、CandleSpaceEnd（节点 6 / 嵌套 0）、Dawn（节点 14 / 嵌套 0）、DayHubCave（节点 25 / 嵌套 0）、Dusk（节点 5 / 嵌套 0）、Dusk_CrabField（节点 2 / 嵌套 0）、Night（节点 27 / 嵌套 0）、NightEnd（节点 5 / 嵌套 0）、NightEntrance（节点 2 / 嵌套 0）、Prairie_Village（节点 26 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、RainEnd（节点 12 / 嵌套 0）、RainForest（节点 4 / 嵌套 0）、RainMid（节点 9 / 嵌套 0）、SkyHub2（节点 16 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、Sunset（节点 11 / 嵌套 0）、SunsetEnd（节点 5 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）、SunsetRace（节点 3 / 嵌套 0）。

原注册字段：1；文件声明字段变体：1。 RTTI：`0x100d0bc50`。

实现：[object-foundation-runtime.ts](../src/core/object-foundation-runtime.ts)、[value-barn-runtime.ts](../src/core/value-barn-runtime.ts)、[object-numeric-runtime.ts](../src/core/object-numeric-runtime.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[native-string-runtime.ts](../src/core/native-string-runtime.ts)、[object-field-load-runtime.ts](../src/core/object-field-load-runtime.ts)、[native-event-barn-runtime.ts](../src/core/native-event-barn-runtime.ts)、[native-tree-runtime.ts](../src/core/native-tree-runtime.ts)、[native-event-barn-view.ts](../src/core/native-event-barn-view.ts)、[float-mult-event-runtime.ts](../src/core/float-mult-event-runtime.ts)、[event-foundation-runtime.ts](../src/core/event-foundation-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)、[numeric-event-runtime.ts](../src/core/numeric-event-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[Objects原调用主链与依赖推进.md](Objects原调用主链与依赖推进.md)、[关卡加载与资源整体架构.md](关卡加载与资源整体架构.md)、[tgcl-field-oracle.json](tgcl-field-oracle.json)、[TGCL字段装载与引用修复逆向.md](TGCL字段装载与引用修复逆向.md)、[对象创建字段装载与事件槽连接逆向.md](对象创建字段装载与事件槽连接逆向.md)、[object-foundation-oracle.json](object-foundation-oracle.json)、[FloatMult触发登记与自动调度逆向.md](FloatMult触发登记与自动调度逆向.md)、[native-tree-oracle.json](native-tree-oracle.json)、[FloatAdd与SetFloat创建装载自动调度逆向.md](FloatAdd与SetFloat创建装载自动调度逆向.md)、[numeric-event-chain-evidence.json](numeric-event-chain-evidence.json)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)。

</details>

<details>
<summary>FloatAdd · 40%（4/10）</summary>

增量、限制范围及逐帧输出。

完整增量执行与EventBarn同帧收尾已有核验。本轮补原96-byte placement构造、字段装载/引用修复、触发登记与OnLevelLoad/Update连接，全部31个真实配置保留保存值/autoStart/节点顺序；184组自动子链覆盖空amountFloat/output回退、别名反馈、先max后min、单次与逐帧执行。基础2278组、40个命名原函数及1个区间、0差异。metadata/default缓存、堆内部、对象名字、多功能类与实际场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：FloatAdd 的原默认值、继承初始化及 10 个序列化字段变体；原注册字段 9 项。
- [ ] 增量、限制范围及逐帧输出（部分完成）：完整增量执行与EventBarn同帧收尾已有核验。本轮补原96-byte placement构造、字段装载/引用修复、触发登记与OnLevelLoad/Update连接，全部31个真实配置保留保存值/autoStart/节点顺序；184组自动子链覆盖空amountFloat/output回退、别名反馈、先max后min、单次与逐帧执行。基础2278组、40个命名原函数及1个区间、0差异。metadata/default缓存、堆内部、对象名字、多功能类与实际场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Float（45 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：完整增量执行与EventBarn同帧收尾已有核验。本轮补原96-byte placement构造、字段装载/引用修复、触发登记与OnLevelLoad/Update连接，全部31个真实配置保留保存值/autoStart/节点顺序；184组自动子链覆盖空amountFloat/output回退、别名反馈、先max后min、单次与逐帧执行。基础2278组、40个命名原函数及1个区间、0差异。metadata/default缓存、堆内部、对象名字、多功能类与实际场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：完整增量执行与EventBarn同帧收尾已有核验。本轮补原96-byte placement构造、字段装载/引用修复、触发登记与OnLevelLoad/Update连接，全部31个真实配置保留保存值/autoStart/节点顺序；184组自动子链覆盖空amountFloat/output回退、别名反馈、先max后min、单次与逐帧执行。基础2278组、40个命名原函数及1个区间、0差异。metadata/default缓存、堆内部、对象名字、多功能类与实际场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：完整增量执行与EventBarn同帧收尾已有核验。本轮补原96-byte placement构造、字段装载/引用修复、触发登记与OnLevelLoad/Update连接，全部31个真实配置保留保存值/autoStart/节点顺序；184组自动子链覆盖空amountFloat/output回退、别名反馈、先max后min、单次与逐帧执行。基础2278组、40个命名原函数及1个区间、0差异。metadata/default缓存、堆内部、对象名字、多功能类与实际场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：完整增量执行与EventBarn同帧收尾已有核验。本轮补原96-byte placement构造、字段装载/引用修复、触发登记与OnLevelLoad/Update连接，全部31个真实配置保留保存值/autoStart/节点顺序；184组自动子链覆盖空amountFloat/output回退、别名反馈、先max后min、单次与逐帧执行。基础2278组、40个命名原函数及1个区间、0差异。metadata/default缓存、堆内部、对象名字、多功能类与实际场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：完整增量执行与EventBarn同帧收尾已有核验。本轮补原96-byte placement构造、字段装载/引用修复、触发登记与OnLevelLoad/Update连接，全部31个真实配置保留保存值/autoStart/节点顺序；184组自动子链覆盖空amountFloat/output回退、别名反馈、先max后min、单次与逐帧执行。基础2278组、40个命名原函数及1个区间、0差异。metadata/default缓存、堆内部、对象名字、多功能类与实际场景生命周期仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 5 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、Night（节点 7 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_Village（节点 9 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：9；文件声明字段变体：10。 RTTI：`0x100d0cdb0`。

实现：[object-numeric-runtime.ts](../src/core/object-numeric-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)、[event-derived-drivers.ts](../src/core/event-derived-drivers.ts)、[event-foundation-runtime.ts](../src/core/event-foundation-runtime.ts)、[native-event-barn-runtime.ts](../src/core/native-event-barn-runtime.ts)、[native-event-barn-view.ts](../src/core/native-event-barn-view.ts)、[object-field-load-runtime.ts](../src/core/object-field-load-runtime.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[numeric-event-runtime.ts](../src/core/numeric-event-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[数值类事件与依赖音效逆向.md](数值类事件与依赖音效逆向.md)、[object-runtime-native.json](object-runtime-native.json)、[对象启用与EventBarn调度逆向.md](对象启用与EventBarn调度逆向.md)、[FloatAdd与SetFloat创建装载自动调度逆向.md](FloatAdd与SetFloat创建装载自动调度逆向.md)、[numeric-event-chain-evidence.json](numeric-event-chain-evidence.json)、[object-foundation-oracle.json](object-foundation-oracle.json)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[object-batch-oracle.json](object-batch-oracle.json)、[event-barn-oracle.json](event-barn-oracle.json)。

</details>

<details>
<summary>FloatDistanceFade · 30%（3/10）</summary>

按位置或摄像机距离映射浮点值。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FloatDistanceFade 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 按位置或摄像机距离映射浮点值：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（2 条引用）、Float（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：RainMid（节点 2 / 嵌套 0）。

原注册字段：7；文件声明字段变体：8。 RTTI：`0x100d0cf90`。

</details>

<details>
<summary>FloatMult · 40%（4/10）</summary>

两项浮点输入相乘。

原乘法、单NaN和别名运算已核验；本轮接通ObjectFactory→触发槽/唯一ID/每类索引→字段装载/引用修复→原OnLevelLoad/Update→乘法→释放。全部14个真实FloatMult子图保留值、autoStart和节点顺序，使用局部重映射引用表；151组新增触发/自动链输入中132组执行成功、19组原断言快照，622个逐帧状态、0差异。基础总报告2278组、40个命名原函数及1个区间。停用/恢复与非空类型树清理已核验；完整metadata/默认缓存、堆内部、对象名字及实际关卡生命周期待闭合，双NaN仍依赖明确服务。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：FloatMult 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 两项浮点输入相乘（部分完成）：原乘法、单NaN和别名运算已核验；本轮接通ObjectFactory→触发槽/唯一ID/每类索引→字段装载/引用修复→原OnLevelLoad/Update→乘法→释放。全部14个真实FloatMult子图保留值、autoStart和节点顺序，使用局部重映射引用表；151组新增触发/自动链输入中132组执行成功、19组原断言快照，622个逐帧状态、0差异。基础总报告2278组、40个命名原函数及1个区间。停用/恢复与非空类型树清理已核验；完整metadata/默认缓存、堆内部、对象名字及实际关卡生命周期待闭合，双NaN仍依赖明确服务。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Float（42 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原乘法、单NaN和别名运算已核验；本轮接通ObjectFactory→触发槽/唯一ID/每类索引→字段装载/引用修复→原OnLevelLoad/Update→乘法→释放。全部14个真实FloatMult子图保留值、autoStart和节点顺序，使用局部重映射引用表；151组新增触发/自动链输入中132组执行成功、19组原断言快照，622个逐帧状态、0差异。基础总报告2278组、40个命名原函数及1个区间。停用/恢复与非空类型树清理已核验；完整metadata/默认缓存、堆内部、对象名字及实际关卡生命周期待闭合，双NaN仍依赖明确服务。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原乘法、单NaN和别名运算已核验；本轮接通ObjectFactory→触发槽/唯一ID/每类索引→字段装载/引用修复→原OnLevelLoad/Update→乘法→释放。全部14个真实FloatMult子图保留值、autoStart和节点顺序，使用局部重映射引用表；151组新增触发/自动链输入中132组执行成功、19组原断言快照，622个逐帧状态、0差异。基础总报告2278组、40个命名原函数及1个区间。停用/恢复与非空类型树清理已核验；完整metadata/默认缓存、堆内部、对象名字及实际关卡生命周期待闭合，双NaN仍依赖明确服务。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：原乘法、单NaN和别名运算已核验；本轮接通ObjectFactory→触发槽/唯一ID/每类索引→字段装载/引用修复→原OnLevelLoad/Update→乘法→释放。全部14个真实FloatMult子图保留值、autoStart和节点顺序，使用局部重映射引用表；151组新增触发/自动链输入中132组执行成功、19组原断言快照，622个逐帧状态、0差异。基础总报告2278组、40个命名原函数及1个区间。停用/恢复与非空类型树清理已核验；完整metadata/默认缓存、堆内部、对象名字及实际关卡生命周期待闭合，双NaN仍依赖明确服务。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原乘法、单NaN和别名运算已核验；本轮接通ObjectFactory→触发槽/唯一ID/每类索引→字段装载/引用修复→原OnLevelLoad/Update→乘法→释放。全部14个真实FloatMult子图保留值、autoStart和节点顺序，使用局部重映射引用表；151组新增触发/自动链输入中132组执行成功、19组原断言快照，622个逐帧状态、0差异。基础总报告2278组、40个命名原函数及1个区间。停用/恢复与非空类型树清理已核验；完整metadata/默认缓存、堆内部、对象名字及实际关卡生命周期待闭合，双NaN仍依赖明确服务。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原乘法、单NaN和别名运算已核验；本轮接通ObjectFactory→触发槽/唯一ID/每类索引→字段装载/引用修复→原OnLevelLoad/Update→乘法→释放。全部14个真实FloatMult子图保留值、autoStart和节点顺序，使用局部重映射引用表；151组新增触发/自动链输入中132组执行成功、19组原断言快照，622个逐帧状态、0差异。基础总报告2278组、40个命名原函数及1个区间。停用/恢复与非空类型树清理已核验；完整metadata/默认缓存、堆内部、对象名字及实际关卡生命周期待闭合，双NaN仍依赖明确服务。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、Night（节点 2 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100d0cbd0`。

实现：[object-numeric-runtime.ts](../src/core/object-numeric-runtime.ts)、[event-foundation-runtime.ts](../src/core/event-foundation-runtime.ts)、[native-event-barn-runtime.ts](../src/core/native-event-barn-runtime.ts)、[object-field-load-runtime.ts](../src/core/object-field-load-runtime.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[native-tree-runtime.ts](../src/core/native-tree-runtime.ts)、[native-event-barn-view.ts](../src/core/native-event-barn-view.ts)、[float-mult-event-runtime.ts](../src/core/float-mult-event-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[数值类事件与依赖音效逆向.md](数值类事件与依赖音效逆向.md)、[object-runtime-native.json](object-runtime-native.json)、[对象创建字段装载与事件槽连接逆向.md](对象创建字段装载与事件槽连接逆向.md)、[object-foundation-oracle.json](object-foundation-oracle.json)、[FloatMult触发登记与自动调度逆向.md](FloatMult触发登记与自动调度逆向.md)、[native-tree-oracle.json](native-tree-oracle.json)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[object-numeric-oracle.json](object-numeric-oracle.json)。

</details>

<details>
<summary>FloatSplit · 40%（4/10）</summary>

按连续区间映射输入到多个浮点输出。

原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：FloatSplit 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 按连续区间映射输入到多个浮点输出（部分完成）：原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Float（2 条引用）、Clump（2 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原72-byte placement、保存字段/引用装载、EventBarn连续更新与释放重建已接联合链。全部2个真实配置纳入758组/3092快照原机器码0差异；非空分段输出持续运行、空输出不读取input、保存别名输入和动态count/cast断言已核验，并接OnFloat→Delay→FloatAdd反馈。metadata/default准备、原cast/堆池、完整场景和原游戏验收仍待闭合。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

地图：DayHubCave（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100d0c270`。

实现：[object-numeric-runtime.ts](../src/core/object-numeric-runtime.ts)、[float-condition-event-runtime.ts](../src/core/float-condition-event-runtime.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[数值类事件与依赖音效逆向.md](数值类事件与依赖音效逆向.md)、[object-runtime-native.json](object-runtime-native.json)、[FloatSplit与OnFloat条件事件调用链逆向.md](FloatSplit与OnFloat条件事件调用链逆向.md)、[float-condition-native.json](float-condition-native.json)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[object-numeric-oracle.json](object-numeric-oracle.json)、[logic-chain-oracle.json](logic-chain-oracle.json)。

</details>

<details>
<summary>FlowerPatch · 30%（3/10）</summary>

花草密度、尺寸、噪声与材质。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FlowerPatch 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 15 项。
- [ ] 花草密度、尺寸、噪声与材质：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 15 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 54 / 嵌套 0）、DayEnd（节点 21 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、HubReveal（节点 57 / 嵌套 0）、Night（节点 17 / 嵌套 0）、Prairie_ButterflyFields（节点 66 / 嵌套 0）、Prairie_Cave（节点 22 / 嵌套 0）、Prairie_NestAndKeeper（节点 50 / 嵌套 0）、Prairie_Village（节点 136 / 嵌套 0）、Rain（节点 59 / 嵌套 0）、RainEnd（节点 4 / 嵌套 0）、SkyHub2（节点 68 / 嵌套 0）、SunsetRace（节点 17 / 嵌套 0）、TitleWater（节点 10 / 嵌套 0）。

原注册字段：15；文件声明字段变体：15。 RTTI：`0x100cb0600`。

</details>

<details>
<summary>FogVolumeSphere · 30%（3/10）</summary>

球形体积雾与可见性参数。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FogVolumeSphere 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 8 项。
- [ ] 球形体积雾与可见性参数：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：PointLight（28 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 12 / 嵌套 0）、DayEnd（节点 6 / 嵌套 0）、DuskGraveyard（节点 3 / 嵌套 0）、HubReveal（节点 4 / 嵌套 0）、Prairie_ButterflyFields（节点 4 / 嵌套 0）、Prairie_Cave（节点 14 / 嵌套 0）、Rain（节点 12 / 嵌套 0）、RainEnd（节点 3 / 嵌套 0）、RainForest（节点 5 / 嵌套 0）、SunsetEnd2（节点 3 / 嵌套 0）、SunsetRace（节点 12 / 嵌套 0）。

原注册字段：8；文件声明字段变体：8。 RTTI：`0x100cb1200`。

</details>

<details>
<summary>ForwardAcceleration · 30%（3/10）</summary>

区域方向与地面空中加速度。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ForwardAcceleration 的原默认值、继承初始化及 10 个序列化字段变体；原注册字段 9 项。
- [ ] 区域方向与地面空中加速度：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_Cave（节点 1 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）。

原注册字段：9；文件声明字段变体：10。 RTTI：`0x100cdf730`。

</details>

<details>
<summary>FragmentCollectActivity · 30%（3/10）</summary>

碎片数量与收集活动。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FragmentCollectActivity 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 5 项。
- [ ] 碎片数量与收集活动：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（15 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand（节点 3 / 嵌套 0）、CarryLand2（节点 3 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）。

原注册字段：5；文件声明字段变体：5。 RTTI：`0x100c781c0`。

</details>

<details>
<summary>FriendDisplayLord · 30%（3/10）</summary>

好友位置、蜡烛与场景显示。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：FriendDisplayLord 的原默认值、继承初始化及 26 个序列化字段变体；原注册字段 25 项。
- [ ] 好友位置、蜡烛与场景显示：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（12 条引用）、Marker（12 条引用）、LevelMesh（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 25 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）。

原注册字段：25；文件声明字段变体：26。 RTTI：`0x100cb2f00`。

</details>

<details>
<summary>HasReachedLevel · 30%（3/10）</summary>

已到达地图条件事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：HasReachedLevel 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 已到达地图条件事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（11 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、SkyHub2（节点 9 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c92bb0`。

</details>

<details>
<summary>IfEnabled · 40%（4/10）</summary>

对象集合启用状态条件。

完整 OR 条件逐一查询、反向条件、事件逐一启用和 checkOnce 已核验；真实 Get/SetEnabled 元数据链与对象生命周期待闭合，大于65535项的原回绕保留为未支持范围。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：IfEnabled 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 对象集合启用状态条件（部分完成）：完整 OR 条件逐一查询、反向条件、事件逐一启用和 checkOnce 已核验；真实 Get/SetEnabled 元数据链与对象生命周期待闭合，大于65535项的原回绕保留为未支持范围。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Clump（72 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：完整 OR 条件逐一查询、反向条件、事件逐一启用和 checkOnce 已核验；真实 Get/SetEnabled 元数据链与对象生命周期待闭合，大于65535项的原回绕保留为未支持范围。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：完整 OR 条件逐一查询、反向条件、事件逐一启用和 checkOnce 已核验；真实 Get/SetEnabled 元数据链与对象生命周期待闭合，大于65535项的原回绕保留为未支持范围。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：完整 OR 条件逐一查询、反向条件、事件逐一启用和 checkOnce 已核验；真实 Get/SetEnabled 元数据链与对象生命周期待闭合，大于65535项的原回绕保留为未支持范围。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：完整 OR 条件逐一查询、反向条件、事件逐一启用和 checkOnce 已核验；真实 Get/SetEnabled 元数据链与对象生命周期待闭合，大于65535项的原回绕保留为未支持范围。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：完整 OR 条件逐一查询、反向条件、事件逐一启用和 checkOnce 已核验；真实 Get/SetEnabled 元数据链与对象生命周期待闭合，大于65535项的原回绕保留为未支持范围。 本轮新增ClumpBarn→TGCL数组装载/引用修复→Enable/IfEnabled→原GetEnabled/SetEnabled继承反射→嵌套Clump→FloatAdd/FloatMult→卸载复位连续核验：164组、331快照、0差异。118个真实配置片段（82 Enable、全部36 IfEnabled）保留节点/成员顺序及字段值；原6组断言与117次未实现类服务边界分列，未将缺失类伪造启用状态。Clump无聚合GetEnabled；killEvents按原Start后清active字节。metadata/default缓存、方法缓存flag=true内部、未实现目标类、完整场景/Avatar与Windows验收仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

地图：DuskGraveyard（节点 1 / 嵌套 0）、Prairie_Village（节点 14 / 嵌套 0）、SkyHub2（节点 5 / 嵌套 0）、SunsetEnd（节点 12 / 嵌套 0）、TitleWater（节点 4 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100d0c630`。

实现：[object-flow-runtime.ts](../src/core/object-flow-runtime.ts)、[clump-runtime.ts](../src/core/clump-runtime.ts)、[object-enabled-runtime.ts](../src/core/object-enabled-runtime.ts)、[logic-event-runtime.ts](../src/core/logic-event-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[数值类事件与依赖音效逆向.md](数值类事件与依赖音效逆向.md)、[object-runtime-native.json](object-runtime-native.json)、[Enable与IfEnabled对象组调用链逆向.md](Enable与IfEnabled对象组调用链逆向.md)、[logic-chain-oracle.json](logic-chain-oracle.json)、[Objects对象组启用延迟与条件地图播放.md](Objects对象组启用延迟与条件地图播放.md)、[object-logic-preview-oracle.json](object-logic-preview-oracle.json)、[object-logic-preview-availability.json](object-logic-preview-availability.json)、[object-logic-preview-smoke.json](object-logic-preview-smoke.json)、[object-logic-preview-verification.json](object-logic-preview-verification.json)、[object-logic-preview-native.json.gz](../tests/fixtures/object-logic-preview-native.json.gz)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[object-batch-oracle.json](object-batch-oracle.json)。

</details>

<details>
<summary>IfInRegion · 30%（3/10）</summary>

区域内或区域外条件触发。

节点与引用已清点；原区域条件、Marker/Clump 消费和分支执行待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：IfInRegion 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 区域内或区域外条件触发：节点与引用已清点；原区域条件、Marker/Clump 消费和分支执行待恢复。
- [ ] 依赖调用与事件：Clump（60 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 4 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 3 / 嵌套 0）、DuskGraveyard（节点 5 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Night（节点 3 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、Sunset（节点 3 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cd7b90`。

</details>

<details>
<summary>IfTweakVar · 30%（3/10）</summary>

原调试变量条件分支。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：IfTweakVar 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 原调试变量条件分支：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 2 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cd6250`。

</details>

<details>
<summary>InviteDisplayLord · 30%（3/10）</summary>

邀请状态及场景显示控制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：InviteDisplayLord 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 邀请状态及场景显示控制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：FriendDisplayLord（1 条引用）、Clump（1 条引用）、InviteDisplayRig（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cb3310`。

</details>

<details>
<summary>InviteDisplayRig · 30%（3/10）</summary>

邀请空位、待确认与已确认视图。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：InviteDisplayRig 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 邀请空位、待确认与已确认视图：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（3 条引用）、Marker（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cb3130`。

</details>

<details>
<summary>IsLatestCheckpoint · 30%（3/10）</summary>

检查最新检查点与事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：IsLatestCheckpoint 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 检查最新检查点与事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（8 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、SkyHub2（节点 7 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100c92d90`。

</details>

<details>
<summary>IsOutfitInRegion · 30%（3/10）</summary>

区域内装扮与玩家条件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：IsOutfitInRegion 的原默认值、继承初始化及 10 个序列化字段变体；原注册字段 9 项。
- [ ] 区域内装扮与玩家条件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：HubReveal（节点 1 / 嵌套 0）。

原注册字段：9；文件声明字段变体：10。 RTTI：`0x100cd7d70`。

</details>

<details>
<summary>KillBox · 30%（3/10）</summary>

空间死亡区域。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：KillBox 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 1 项。
- [ ] 空间死亡区域：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dusk（节点 9 / 嵌套 0）、DuskGraveyard（节点 13 / 嵌套 0）、DuskMid（节点 6 / 嵌套 0）、Dusk_CrabField（节点 9 / 嵌套 0）、NightEntrance（节点 5 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Rain（节点 8 / 嵌套 0）、RainEnd（节点 5 / 嵌套 0）、RainForest（节点 13 / 嵌套 0）、RainMid（节点 15 / 嵌套 0）、SkyHub2（节点 22 / 嵌套 0）、Sunset（节点 23 / 嵌套 0）、SunsetEnd（节点 9 / 嵌套 0）、SunsetRace（节点 8 / 嵌套 0）。

原注册字段：1；文件声明字段变体：1。 RTTI：`0x100cc0730`。

</details>

<details>
<summary>LensFlair · 30%（3/10）</summary>

镜头光效颜色、强度与样式。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：LensFlair 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 8 项。
- [ ] 镜头光效颜色、强度与样式：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 4 / 嵌套 0）、CandleSpaceEnd（节点 8 / 嵌套 0）、Dawn（节点 3 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、SkyHub2（节点 8 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：8；文件声明字段变体：8。 RTTI：`0x100cbf740`。

</details>

<details>
<summary>LevelLink · 30%（3/10）</summary>

地图连接、锚点与加载事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：LevelLink 的原默认值、继承初始化及 12 个序列化字段变体；原注册字段 12 项。
- [ ] 地图连接、锚点与加载事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（71 条引用）、Beamo（5 条引用）、Clump（15 条引用）、LevelMesh（5 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 3 / 嵌套 0）、DayEnd（节点 2 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、Dusk（节点 3 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Dusk_CrabField（节点 5 / 嵌套 0）、HubReveal（节点 6 / 嵌套 0）、Prairie_ButterflyFields（节点 5 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 5 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 7 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 3 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetEnd2（节点 3 / 嵌套 0）、SunsetRace（节点 2 / 嵌套 0）。

原注册字段：12；文件声明字段变体：12。 RTTI：`0x100cc0de0`。

</details>

<details>
<summary>LevelMaterial · 40%（4/10）</summary>

原材质、shader、参数与物理材质绑定。

原构造、16槽分配、首个GUID匹配、MaterialDef查找与交织参数生成、默认shader名和刷新传播已核验；原场景加载/完整GPU上传/物理材质/销毁仍待恢复。 本轮共享TGCL字段子链含16个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：LevelMaterial 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 9 项。
- [ ] 原材质、shader、参数与物理材质绑定（部分完成）：原构造、16槽分配、首个GUID匹配、MaterialDef查找与交织参数生成、默认shader名和刷新传播已核验；原场景加载/完整GPU上传/物理材质/销毁仍待恢复。 本轮共享TGCL字段子链含16个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原构造、16槽分配、首个GUID匹配、MaterialDef查找与交织参数生成、默认shader名和刷新传播已核验；原场景加载/完整GPU上传/物理材质/销毁仍待恢复。 本轮共享TGCL字段子链含16个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原构造、16槽分配、首个GUID匹配、MaterialDef查找与交织参数生成、默认shader名和刷新传播已核验；原场景加载/完整GPU上传/物理材质/销毁仍待恢复。 本轮共享TGCL字段子链含16个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。
- [x] 明确范围的原核心子链已独立核验：原构造、16槽分配、首个GUID匹配、MaterialDef查找与交织参数生成、默认shader名和刷新传播已核验；原场景加载/完整GPU上传/物理材质/销毁仍待恢复。 本轮共享TGCL字段子链含16个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原构造、16槽分配、首个GUID匹配、MaterialDef查找与交织参数生成、默认shader名和刷新传播已核验；原场景加载/完整GPU上传/物理材质/销毁仍待恢复。 本轮共享TGCL字段子链含16个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原构造、16槽分配、首个GUID匹配、MaterialDef查找与交织参数生成、默认shader名和刷新传播已核验；原场景加载/完整GPU上传/物理材质/销毁仍待恢复。 本轮共享TGCL字段子链含16个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 9 / 嵌套 0）、CandleSpaceEnd（节点 16 / 嵌套 0）、CarryLand（节点 1 / 嵌套 0）、CarryLand2（节点 4 / 嵌套 0）、CarryLand3（节点 1 / 嵌套 0）、Dawn（节点 11 / 嵌套 0）、DayEnd（节点 6 / 嵌套 0）、DayHubCave（节点 13 / 嵌套 0）、Dusk（节点 9 / 嵌套 0）、DuskGraveyard（节点 11 / 嵌套 0）、DuskMid（节点 8 / 嵌套 0）、Dusk_CrabField（节点 10 / 嵌套 0）、HubReveal（节点 15 / 嵌套 0）、Night（节点 7 / 嵌套 0）、NightEnd（节点 9 / 嵌套 0）、NightEntrance（节点 6 / 嵌套 0）、Prairie_ButterflyFields（节点 9 / 嵌套 0）、Prairie_Cave（节点 14 / 嵌套 0）、Prairie_NestAndKeeper（节点 11 / 嵌套 0）、Prairie_Village（节点 14 / 嵌套 0）、Rain（节点 12 / 嵌套 0）、RainEnd（节点 9 / 嵌套 0）、RainForest（节点 12 / 嵌套 0）、RainMid（节点 13 / 嵌套 0）、SkyHub2（节点 6 / 嵌套 0）、Storm（节点 8 / 嵌套 0）、StormEnd（节点 7 / 嵌套 0）、Sunset（节点 14 / 嵌套 0）、SunsetEnd（节点 13 / 嵌套 0）、SunsetEnd2（节点 13 / 嵌套 0）、SunsetRace（节点 14 / 嵌套 0）、TitleWater（节点 4 / 嵌套 0）。

原注册字段：9；文件声明字段变体：9。 RTTI：`0x100cc3170`。

实现：[level-material-runtime.ts](../src/core/level-material-runtime.ts)、[model-material-index.ts](../src/core/model-material-index.ts)、[materials.ts](../src/core/materials.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[native-string-runtime.ts](../src/core/native-string-runtime.ts)、[model-render-state.ts](../src/core/model-render-state.ts)、[beamo-draw.ts](../src/core/beamo-draw.ts)、[vulkan-baked.ts](../src/main/vulkan-baked.ts)、[vulkan-viewport.ts](../src/renderer/vulkan-viewport.ts)。

证据：[模型材质底层统一清单.md](模型材质底层统一清单.md)、[Objects原调用主链与依赖推进.md](Objects原调用主链与依赖推进.md)、[tgcl-field-oracle.json](tgcl-field-oracle.json)、[TGCL字段装载与引用修复逆向.md](TGCL字段装载与引用修复逆向.md)、[Beamo原材质绘制与SkyHub2效果.md](Beamo原材质绘制与SkyHub2效果.md)、[model-render-state.json](model-render-state.json)、[model-render-state-gpu-check.json](model-render-state-gpu-check.json)、[beamo-draw-verification.json](beamo-draw-verification.json)、[model-material-SkyHub2-smoke.json](model-material-SkyHub2-smoke.json)、[beamo-draw.test.ts](../tests/beamo-draw.test.ts)、[model-render-state.test.ts](../tests/model-render-state.test.ts)、[level-material-oracle.json](level-material-oracle.json)。

</details>

<details>
<summary>LevelMesh · 40%（4/10）</summary>

场景模型、资源、烘焙及几何生成参数。

已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：LevelMesh 的原默认值、继承初始化及 59 个序列化字段变体；原注册字段 59 项。
- [ ] 场景模型、资源、烘焙及几何生成参数（部分完成）：已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 59 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [x] 明确范围的原核心子链已独立核验：已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：已有资源名/GUID 烘焙关联、LOD 读取和属性检查；完整原加载绑定、类运行、Motion 及原材质绘制待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。 本轮原2656-byte正常构造、Get/SetTransform、Get/SetEnabled、local/world OBB、GUID和原反射wrapper及Model普通/延迟变换/启用转发已核验16699组、138058444字节0差异，包含全部4133真实保存矩阵/GUID。TransformObject→LevelMesh→Model连接887组、8322完整快照、636011224字节0差异；317真实根配置中250跑完有限序列、12未接入类、52音效与3Timeline阻断。真实端点采用保存矩阵与prepared加载前null Model，192合成Model分支样本单列；不能代替实际原资源/baked绑定、动画/提交/绘制/物理/卸载和完整场景/Avatar验收。完整类/实例仍0。 本轮完整MeshInstance初始化/模型资源消费者/GUID查找对照12069组、100345752字节0差异，覆盖1152资源/1231LOD与10653序列化烘焙记录快照。第二包围盒已保留；兼容/诊断/重复初始化、原LOD/缺Mesh断言和引用服务顺序核验。ResourceRef/资源管理器/流库与双NaN为明确服务；实际LevelMesh Model指针创建绑定和完整生命周期仍待恢复。 ResourceRef正常构造/观察/析构/cleanup本轮接回原链表：独立109组/2075快照/8525948字节、完整模型连接12069组/101369448比较字节0差异，仍含全部1231LOD与10653GUID快照。资源内嵌handle、回调前后重新读取、重复观察、头尾摘除、正常释放保留observed和原断言挂链状态核验；ResourceManager与资源虚回调内部/异常及实际Model创建/GPU仍待闭合。 ResourceManager原名字equal_range/精确类型选择/ID getter本轮接回：独立29组/7885查询/1206824字节、注册表→ResourceRef→模型消费者12069组/101625444比较字节0差异；覆盖1152 Mesh名/33关卡名及全部1231LOD/10653GUID快照。同名多类型按树顺序精确class身份匹配，null/fallback/回调修改保留原行为；树注册/bootstrap、metadata虚转换与实际加载、完整Model构造/LevelMesh绑定仍待闭合。 ModelBarn两个完整正常创建wrapper新增2410组/2685560004字节0差异；全1152资源名在两分支参数快照，1024槽/0x3e0 stride、constructor前计数提交、固定字符串/未初始化unbaked dword与ABI向量传递核验。完整constructor为捕获/明确失败服务，完整Model创建仍0；LOD查询原查找/观察/读数量/释放连接1168组/9726868字节0差异。实际LevelMesh +0x228绑定、RenderBuffer/Mesh/GPU/动画依赖继续闭合。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 无烘焙消费者新增1436组/11958208字节、Vertex两个数据构造/转发/内嵌AutoLister登记186组/419快照/3438712字节0差异。ready零门控、padding/标签/自身指针、矩阵alias和锁回调/链表head重读已核验；全局/锁/libc为服务，实际GPU/完整Model创建/LevelMesh绑定仍待闭合。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20编辑器不透明模型HDR补原Mesh GLSL的正view distance*0.1 RGBDepth，5/10/20单位和辅助层保留底层depth的Vulkan检查通过；LevelMesh地图启用继续遵守保存render字段。雕像关闭/还原截图使用light0及真实网格线，不能计完整原材质/Model/GPU或场景验收。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。 新共享RenderPipeline初始化/顶点绑定/释放和VertexData/Renderable Reset已在Beamo材质链通过原机对照；这些是Model依赖的共享正常内核证据，尚不代表LevelMesh→完整Model加载/卸载已接通。 本批编辑器主视口接入Beamo/BeamoDecal LOD0原上传字节和LevelMaterial真实shader/贴图，SkyHub2已有182个实例合并6批、171个LevelMesh批次；189个原LOD0快照逐字节及SHA重放保留。新增六种原RenderList描述符状态与独立透明颜色/log-depth附件，14项Vulkan遮挡/混合/深度/背面/resize/clear检查通过；透明远近排序是编辑器适配。共享材质重绑复用不变几何，场景提交刷新材质索引；完整更新后才绘制，并以已显示帧的几何/材质纹理哈希核验。完整Model/Barn/GPU所有权、原平均probe、外部weight volumes、自动LOD/Visibility、动画/卸载和原场景仍未闭合，完整原类/实例0。 本轮进一步恢复共享 RenderList 8 个完整原注册/注销/队列/图元计数/格式上下文入口，默认接已有 VertexRender 初始化/Renderable 释放，并提供 Model 同存储原队列接口。248 组明确准备 ABI 输入、798 操作快照、26,291,400 字节零差异；该证据不代表真实地图实例或主视口已采用完整原队列。Scene/Barn 分配、每帧 count 所有者、完整排序/绘制、GPU格式刷新和完整Model/资源绑定仍未闭合，完整类/实例0。 本轮原命名动作→clock→采样→骨骼矩阵→蒙皮接入独立模型动作预览，每实例自己的请求与几何；动态packed顶点通过Vulkan增量更新保留材质／贴图，暂停／停止还原／切图清理。连续法线使用显式编辑器数学服务，外部／镜像／additive与原分层、根位移、音效、AI和真实Model生命周期仍待接，不提高完整生物计数。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 60 / 嵌套 0）、CandleSpaceEnd（节点 103 / 嵌套 0）、CarryLand（节点 11 / 嵌套 0）、CarryLand2（节点 31 / 嵌套 0）、Dawn（节点 243 / 嵌套 0）、DayEnd（节点 70 / 嵌套 0）、DayHubCave（节点 93 / 嵌套 0）、Dusk（节点 133 / 嵌套 0）、DuskGraveyard（节点 312 / 嵌套 0）、DuskMid（节点 151 / 嵌套 0）、Dusk_CrabField（节点 132 / 嵌套 0）、HubReveal（节点 58 / 嵌套 0）、Night（节点 365 / 嵌套 0）、NightEnd（节点 88 / 嵌套 0）、NightEntrance（节点 29 / 嵌套 0）、Prairie_ButterflyFields（节点 14 / 嵌套 0）、Prairie_Cave（节点 38 / 嵌套 0）、Prairie_NestAndKeeper（节点 69 / 嵌套 0）、Prairie_Village（节点 178 / 嵌套 0）、Rain（节点 191 / 嵌套 0）、RainEnd（节点 296 / 嵌套 0）、RainForest（节点 124 / 嵌套 0）、RainMid（节点 307 / 嵌套 0）、SkyHub2（节点 284 / 嵌套 0）、Storm（节点 196 / 嵌套 0）、StormEnd（节点 187 / 嵌套 0）、Sunset（节点 68 / 嵌套 0）、SunsetEnd（节点 148 / 嵌套 0）、SunsetEnd2（节点 82 / 嵌套 0）、SunsetRace（节点 67 / 嵌套 0）、TitleWater（节点 5 / 嵌套 0）。

原注册字段：59；文件声明字段变体：59。 RTTI：`0x100cc27a0`。

实现：[resources.ts](../src/core/resources.ts)、[baking.ts](../src/core/baking.ts)、[baked-lookup.ts](../src/core/baked-lookup.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[native-string-runtime.ts](../src/core/native-string-runtime.ts)、[level-mesh-runtime.ts](../src/core/level-mesh-runtime.ts)、[object-transform-runtime.ts](../src/core/object-transform-runtime.ts)、[transform-object-runtime.ts](../src/core/transform-object-runtime.ts)、[model-baked-runtime.ts](../src/core/model-baked-runtime.ts)、[resource-ref-runtime.ts](../src/core/resource-ref-runtime.ts)、[resource-manager-runtime.ts](../src/core/resource-manager-runtime.ts)、[model-barn-runtime.ts](../src/core/model-barn-runtime.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)、[vertex-data-runtime.ts](../src/core/vertex-data-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[vulkan-renderer.cpp](../native/vulkan-renderer.cpp)、[diagnostic.frag](../native/shaders/diagnostic.frag)、[render-pipeline-runtime.ts](../src/core/render-pipeline-runtime.ts)、[model-render-state.ts](../src/core/model-render-state.ts)、[beamo-draw.ts](../src/core/beamo-draw.ts)、[vulkan-baked.ts](../src/main/vulkan-baked.ts)、[vulkan-viewport.ts](../src/renderer/vulkan-viewport.ts)、[render-list-runtime.ts](../src/core/render-list-runtime.ts)、[vertex-render-runtime.ts](../src/core/vertex-render-runtime.ts)、[model-submit-runtime.ts](../src/core/model-submit-runtime.ts)、[resource-model-animation-preview.ts](../src/core/resource-model-animation-preview.ts)、[model-animation-preview.ts](../src/renderer/model-animation-preview.ts)、[on-region-runtime.ts](../src/core/on-region-runtime.ts)、[animation-sequence-registry.ts](../src/core/animation-sequence-registry.ts)、[environment-object-state.ts](../src/core/environment-object-state.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)。

证据：[模型烘焙绑定逆向.md](模型烘焙绑定逆向.md)、[meshes-object-links.json](meshes-object-links.json)、[tgcl-field-oracle.json](tgcl-field-oracle.json)、[TGCL字段装载与引用修复逆向.md](TGCL字段装载与引用修复逆向.md)、[LevelMesh变换与Model状态连接逆向.md](LevelMesh变换与Model状态连接逆向.md)、[level-mesh-native.json](level-mesh-native.json)、[level-mesh-oracle.json](level-mesh-oracle.json)、[transform-object-level-mesh-oracle.json](transform-object-level-mesh-oracle.json)、[MeshInstance包围数据与BstBaked资源消费逆向.md](MeshInstance包围数据与BstBaked资源消费逆向.md)、[model-baked-native.json](model-baked-native.json)、[model-baked-oracle.json](model-baked-oracle.json)、[ResourceRef链表与模型资源消费连接逆向.md](ResourceRef链表与模型资源消费连接逆向.md)、[resource-ref-native.json](resource-ref-native.json)、[resource-ref-oracle.json](resource-ref-oracle.json)、[model-baked-ref-oracle.json](model-baked-ref-oracle.json)、[ResourceManager注册表查找与模型消费者逆向.md](ResourceManager注册表查找与模型消费者逆向.md)、[resource-lookup-native.json](resource-lookup-native.json)、[resource-lookup-oracle.json](resource-lookup-oracle.json)、[model-baked-registry-oracle.json](model-baked-registry-oracle.json)、[ModelBarn槽分配参数与LOD查询逆向.md](ModelBarn槽分配参数与LOD查询逆向.md)、[model-barn-native.json](model-barn-native.json)、[model-barn-oracle.json](model-barn-oracle.json)、[model-lod-oracle.json](model-lod-oracle.json)、[Objects对象变换地图播放.md](Objects对象变换地图播放.md)、[transform-preview-availability.json](transform-preview-availability.json)、[transform-object-preview-smoke.json](transform-object-preview-smoke.json)、[Vertex数据构造与无烘焙模型消费者逆向.md](Vertex数据构造与无烘焙模型消费者逆向.md)、[vertex-data-native.json](vertex-data-native.json)、[model-unbaked-oracle.json](model-unbaked-oracle.json)、[vertex-data-oracle.json](vertex-data-oracle.json)、[Objects对象组启用延迟与条件地图播放.md](Objects对象组启用延迟与条件地图播放.md)、[object-logic-preview-oracle.json](object-logic-preview-oracle.json)、[object-logic-preview-availability.json](object-logic-preview-availability.json)、[object-logic-preview-smoke.json](object-logic-preview-smoke.json)、[object-logic-preview-verification.json](object-logic-preview-verification.json)、[object-logic-preview-native.json.gz](../tests/fixtures/object-logic-preview-native.json.gz)、[object-preview-depth-check.json](object-preview-depth-check.json)、[object-logic-preview-disabled.png](object-logic-preview-disabled.png)、[object-logic-preview-restored.png](object-logic-preview-restored.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[render-pipeline-native.json](render-pipeline-native.json)、[render-pipeline-oracle.json](render-pipeline-oracle.json)、[Beamo原材质绘制与SkyHub2效果.md](Beamo原材质绘制与SkyHub2效果.md)、[model-render-state.json](model-render-state.json)、[model-render-state-gpu-check.json](model-render-state-gpu-check.json)、[beamo-draw-verification.json](beamo-draw-verification.json)、[model-material-SkyHub2-smoke.json](model-material-SkyHub2-smoke.json)、[beamo-draw.test.ts](../tests/beamo-draw.test.ts)、[model-render-state.test.ts](../tests/model-render-state.test.ts)、[render-list-native.json](render-list-native.json)、[RenderList原注册提交与生命周期推进.md](RenderList原注册提交与生命周期推进.md)、[自然动画与鸟群引导续接.md](自然动画与鸟群引导续接.md)、[on-region-native.json](on-region-native.json)、[on-region-oracle.json](on-region-oracle.json)、[scene-event-defaults.json](scene-event-defaults.json)、[resource-animation-sequence-oracle.json](resource-animation-sequence-oracle.json)、[fish-group-scene-events.json](fish-group-scene-events.json)、[鱼群区域事件与原序列表续接.md](鱼群区域事件与原序列表续接.md)、[render-list-oracle.json](render-list-oracle.json)。

</details>

<details>
<summary>LevelMeshShaderParam · 30%（3/10）</summary>

模型 shader 参数声明。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：LevelMeshShaderParam 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 4 项。
- [ ] 模型 shader 参数声明：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 0 / 嵌套 0）、CandleSpaceEnd（节点 0 / 嵌套 0）、CarryLand（节点 0 / 嵌套 0）、CarryLand2（节点 0 / 嵌套 0）、Dawn（节点 0 / 嵌套 0）、DayEnd（节点 0 / 嵌套 0）、DayHubCave（节点 0 / 嵌套 0）、Dusk（节点 0 / 嵌套 0）、DuskGraveyard（节点 0 / 嵌套 0）、DuskMid（节点 0 / 嵌套 0）、Dusk_CrabField（节点 0 / 嵌套 0）、HubReveal（节点 0 / 嵌套 0）、Night（节点 0 / 嵌套 0）、NightEnd（节点 0 / 嵌套 0）、NightEntrance（节点 0 / 嵌套 0）、Prairie_ButterflyFields（节点 0 / 嵌套 0）、Prairie_Cave（节点 0 / 嵌套 0）、Prairie_NestAndKeeper（节点 0 / 嵌套 0）、Prairie_Village（节点 0 / 嵌套 0）、Rain（节点 0 / 嵌套 0）、RainEnd（节点 0 / 嵌套 0）、RainForest（节点 0 / 嵌套 0）、RainMid（节点 0 / 嵌套 0）、SkyHub2（节点 0 / 嵌套 0）、Storm（节点 0 / 嵌套 0）、StormEnd（节点 0 / 嵌套 0）、Sunset（节点 0 / 嵌套 0）、SunsetEnd（节点 0 / 嵌套 0）、SunsetEnd2（节点 0 / 嵌套 0）、SunsetRace（节点 0 / 嵌套 0）、TitleWater（节点 0 / 嵌套 0）。

原注册字段：4；文件声明字段变体：4。 RTTI：`0x100cc2690`。

</details>

<details>
<summary>LevelParameters · 30%（3/10）</summary>

地图与烘焙生成全局参数。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：LevelParameters 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 11 项。
- [ ] 地图与烘焙生成全局参数：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（8 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 11 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、CarryLand（节点 1 / 嵌套 0）、CarryLand2（节点 1 / 嵌套 0）、CarryLand3（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）、WorldEmpty（节点 1 / 嵌套 0）。

原注册字段：11；文件声明字段变体：11。 RTTI：`0x100cc0510`。

</details>

<details>
<summary>LevelShaderParam · 40%（4/10）</summary>

shader 参数声明。

原 LevelMaterial 内嵌16项参数构造、默认名字/类型/数值或纹理赋值及长短字符串已核验；独立装载、完整GPU上传/默认资源和销毁仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：LevelShaderParam 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 4 项。
- [ ] shader 参数声明（部分完成）：原 LevelMaterial 内嵌16项参数构造、默认名字/类型/数值或纹理赋值及长短字符串已核验；独立装载、完整GPU上传/默认资源和销毁仍待恢复。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原 LevelMaterial 内嵌16项参数构造、默认名字/类型/数值或纹理赋值及长短字符串已核验；独立装载、完整GPU上传/默认资源和销毁仍待恢复。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 LevelMaterial 内嵌16项参数构造、默认名字/类型/数值或纹理赋值及长短字符串已核验；独立装载、完整GPU上传/默认资源和销毁仍待恢复。
- [x] 明确范围的原核心子链已独立核验：原 LevelMaterial 内嵌16项参数构造、默认名字/类型/数值或纹理赋值及长短字符串已核验；独立装载、完整GPU上传/默认资源和销毁仍待恢复。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原 LevelMaterial 内嵌16项参数构造、默认名字/类型/数值或纹理赋值及长短字符串已核验；独立装载、完整GPU上传/默认资源和销毁仍待恢复。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 0 / 嵌套 0）、CandleSpaceEnd（节点 0 / 嵌套 0）、CarryLand（节点 0 / 嵌套 0）、CarryLand2（节点 0 / 嵌套 0）、CarryLand3（节点 0 / 嵌套 0）、Dawn（节点 0 / 嵌套 0）、DayEnd（节点 0 / 嵌套 0）、DayHubCave（节点 0 / 嵌套 0）、Dusk（节点 0 / 嵌套 0）、DuskGraveyard（节点 0 / 嵌套 0）、DuskMid（节点 0 / 嵌套 0）、Dusk_CrabField（节点 0 / 嵌套 0）、HubReveal（节点 0 / 嵌套 0）、Night（节点 0 / 嵌套 0）、NightEnd（节点 0 / 嵌套 0）、NightEntrance（节点 0 / 嵌套 0）、Prairie_ButterflyFields（节点 0 / 嵌套 0）、Prairie_Cave（节点 0 / 嵌套 0）、Prairie_NestAndKeeper（节点 0 / 嵌套 0）、Prairie_Village（节点 0 / 嵌套 0）、Rain（节点 0 / 嵌套 0）、RainEnd（节点 0 / 嵌套 0）、RainForest（节点 0 / 嵌套 0）、RainMid（节点 0 / 嵌套 0）、SkyHub2（节点 0 / 嵌套 0）、Storm（节点 0 / 嵌套 0）、StormEnd（节点 0 / 嵌套 0）、Sunset（节点 0 / 嵌套 0）、SunsetEnd（节点 0 / 嵌套 0）、SunsetEnd2（节点 0 / 嵌套 0）、SunsetRace（节点 0 / 嵌套 0）、TitleWater（节点 0 / 嵌套 0）。

原注册字段：4；文件声明字段变体：4。 RTTI：`0x100cc3050`。

实现：[level-material-runtime.ts](../src/core/level-material-runtime.ts)。

证据：[模型材质底层统一清单.md](模型材质底层统一清单.md)、[level-material-oracle.json](level-material-oracle.json)。

</details>

<details>
<summary>LockAllCollectible · 20%（2/10）</summary>

锁定收集物状态。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：LockAllCollectible 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 锁定收集物状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpaceEnd（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100c98af0`。

</details>

<details>
<summary>MakeFloaty · 30%（3/10）</summary>

对象浮动、旋转与错峰动画。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：MakeFloaty 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 8 项。
- [ ] 对象浮动、旋转与错峰动画：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（7 条引用）、Clump（10 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、Night（节点 5 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）。

原注册字段：8；文件声明字段变体：9。 RTTI：`0x100d073a0`。

</details>

<details>
<summary>MakeMagnetize · 30%（3/10）</summary>

标记区域吸附与反重力。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：MakeMagnetize 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 标记区域吸附与反重力：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（21 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Night（节点 21 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cc48a0`。

</details>

<details>
<summary>Marker · 40%（4/10）</summary>

位置、旋转、缩放与启用的空间标记。

原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Marker 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 4 项。
- [ ] 位置、旋转、缩放与启用的空间标记（部分完成）：原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。
- [x] 明确范围的原核心子链已独立核验：原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原80-byte placement、MarkerBarn创建/位图/编号/释放/正常卸载、原SetEnabled/GetEnabled及反射wrapper接上TGCL→Enable/IfEnabled/Delay/OnFloat连续链。联合906组、4313快照、398249100字节原机器码0差异，含904个Marker装载样本、273个不同真实Marker节点；首次空槽、重复/null释放、复用编号、编号回绕、32位位图跨组和真实1024槽耗尽断言通过。缺失enabled使用原注册true默认缓存，保存字段逐字节保留。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。 本轮恢复GetTransform/SetTransform、本地/世界OBB、ObjectFactory矩阵/extent反射及原wrapper：13784组、6440572字节0差异，含全部6538真实Marker各一组取变换和回写、40组池创建→反射启用/变换→释放复用。NaN全16分量写前断言、四种quat分支、非单位quat、负/零缩放、shear、阈值、signed zero、Buffer别名和this-adjustment通过；Rail/Avatar出生定位共用此字节内核。非有限算术/MXCSR、派生虚方法、TransformObject完整依赖及完整场景运行仍待恢复。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 100 / 嵌套 0）、CandleSpaceEnd（节点 150 / 嵌套 0）、CarryLand（节点 7 / 嵌套 0）、CarryLand2（节点 25 / 嵌套 0）、CarryLand3（节点 1 / 嵌套 0）、Dawn（节点 494 / 嵌套 0）、DayEnd（节点 110 / 嵌套 0）、DayHubCave（节点 98 / 嵌套 0）、Dusk（节点 135 / 嵌套 0）、DuskGraveyard（节点 384 / 嵌套 0）、DuskMid（节点 207 / 嵌套 0）、Dusk_CrabField（节点 26 / 嵌套 0）、HubReveal（节点 224 / 嵌套 0）、Night（节点 462 / 嵌套 0）、NightEnd（节点 25 / 嵌套 0）、NightEntrance（节点 89 / 嵌套 0）、Prairie_ButterflyFields（节点 230 / 嵌套 0）、Prairie_Cave（节点 123 / 嵌套 0）、Prairie_NestAndKeeper（节点 124 / 嵌套 0）、Prairie_Village（节点 565 / 嵌套 0）、Rain（节点 218 / 嵌套 0）、RainEnd（节点 185 / 嵌套 0）、RainForest（节点 232 / 嵌套 0）、RainMid（节点 408 / 嵌套 0）、SkyHub2（节点 346 / 嵌套 0）、Storm（节点 242 / 嵌套 0）、StormEnd（节点 140 / 嵌套 0）、Sunset（节点 432 / 嵌套 0）、SunsetEnd（节点 316 / 嵌套 0）、SunsetEnd2（节点 107 / 嵌套 0）、SunsetRace（节点 300 / 嵌套 0）、TitleWater（节点 33 / 嵌套 0）。

原注册字段：4；文件声明字段变体：4。 RTTI：`0x100cc6220`。

实现：[environment-regions.ts](../src/core/environment-regions.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[native-string-runtime.ts](../src/core/native-string-runtime.ts)、[marker-runtime.ts](../src/core/marker-runtime.ts)、[object-enabled-runtime.ts](../src/core/object-enabled-runtime.ts)、[marker-transform-runtime.ts](../src/core/marker-transform-runtime.ts)、[object-transform-runtime.ts](../src/core/object-transform-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[烘焙与环境逆向进展.md](烘焙与环境逆向进展.md)、[tgcl-field-oracle.json](tgcl-field-oracle.json)、[TGCL字段装载与引用修复逆向.md](TGCL字段装载与引用修复逆向.md)、[Marker启用与ResumeEnable恢复调用链逆向.md](Marker启用与ResumeEnable恢复调用链逆向.md)、[marker-resume-native.json](marker-resume-native.json)、[logic-chain-oracle.json](logic-chain-oracle.json)、[Marker空间变换与对象反射逆向.md](Marker空间变换与对象反射逆向.md)、[marker-transform-native.json](marker-transform-native.json)、[marker-transform-oracle.json](marker-transform-oracle.json)、[Objects对象组启用延迟与条件地图播放.md](Objects对象组启用延迟与条件地图播放.md)、[object-logic-preview-oracle.json](object-logic-preview-oracle.json)、[object-logic-preview-availability.json](object-logic-preview-availability.json)、[object-logic-preview-smoke.json](object-logic-preview-smoke.json)、[object-logic-preview-verification.json](object-logic-preview-verification.json)、[object-logic-preview-native.json.gz](../tests/fixtures/object-logic-preview-native.json.gz)。

</details>

<details>
<summary>MatchHint · 30%（3/10）</summary>

匹配人数、距离与拆分规则。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：MatchHint 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 匹配人数、距离与拆分规则：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c78820`。

</details>

<details>
<summary>MeditationArea · 30%（3/10）</summary>

冥想区域、目标、相机与确认。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：MeditationArea 的原默认值、继承初始化及 22 个序列化字段变体；原注册字段 22 项。
- [ ] 冥想区域、目标、相机与确认：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（42 条引用）、LevelMesh（7 条引用）、CameraKeyFrame（17 条引用）、Float（4 条引用）、Beamo（2 条引用）、Marker（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 22 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 3 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、CarryLand（节点 3 / 嵌套 0）、CarryLand2（节点 3 / 嵌套 0）、Dawn（节点 3 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 6 / 嵌套 0）、NightEnd（节点 2 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetEnd2（节点 2 / 嵌套 0）、SunsetRace（节点 8 / 嵌套 0）。

原注册字段：22；文件声明字段变体：22。 RTTI：`0x100cc70f0`。

</details>

<details>
<summary>Mote · 30%（3/10）</summary>

光点实例与初始状态。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Mote 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 3 项。
- [ ] 光点实例与初始状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：MoteParams（50 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SunsetEnd（节点 14 / 嵌套 0）、SunsetRace（节点 36 / 嵌套 0）。

原注册字段：3；文件声明字段变体：3。 RTTI：`0x100ccb1e0`。

</details>

<details>
<summary>MoteParams · 30%（3/10）</summary>

光点运动、携带、死亡与轨道参数。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：MoteParams 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 15 项。
- [ ] 光点运动、携带、死亡与轨道参数：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（149 条引用）、Clump（21 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 15 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、DayEnd（节点 2 / 嵌套 0）、DayHubCave（节点 7 / 嵌套 0）、HubReveal（节点 5 / 嵌套 0）、Prairie_ButterflyFields（节点 28 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 8 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 4 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 14 / 嵌套 0）、SunsetRace（节点 36 / 嵌套 0）。

原注册字段：15；文件声明字段变体：15。 RTTI：`0x100ccb0c0`。

</details>

<details>
<summary>MoveObjectAlongRail · 40%（4/10）</summary>

对象沿轨道运动。

已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：MoveObjectAlongRail 的原默认值、继承初始化及 30 个序列化字段变体；原注册字段 29 项。
- [ ] 对象沿轨道运动（部分完成）：已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。
- [ ] 依赖调用与事件（部分完成）：Rail（232 条引用）、Clump（286 条引用）、Float（10 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 29 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。
- [x] 明确范围的原核心子链已独立核验：已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：已恢复原248-byte placement、Load/Enable/Finish/Unload完整函数；193组、63873040字节及4904次有序服务调用零差异。包含5组真实鱼群配置/6个Marker缓存/32细分弧长表与原最近点、距离查询组合。网络登记16上限、autoStart断言、空/重复释放、96/32-byte记录padding、4分量缩放与XYZ归一化、私有scale W、原清零相位Z/W及回调字段重读保留。准备对象空间已接保存/default字段；nullptr对象缺省原转换未支持，不能擅改为null。完整1435指令Update、轨道动态生命周期、真实Model装载、共享EventBarn运动、骨骼混合/绘制和Windows场景验收仍待接，完整类与生物保持0。 本阶段Update控制前段0x100484a90..0x100484fc0有338组、110,994,208字节、1,820次调用原对照零差异；完整共用SafeSlerp另920组、136,224字节、3,072次数学调用零差异。包含联网／计时／玩家跟随／缓动／进度平滑及空列表结束；有对象的移动／姿态循环、完整Update及真实场景仍待接。
- [ ] Windows 真机与原游戏验收

地图：CandleSpaceEnd（节点 5 / 嵌套 0）、CarryLand2（节点 1 / 嵌套 0）、Dawn（节点 17 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、HubReveal（节点 9 / 嵌套 0）、Night（节点 17 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 35 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、Storm（节点 91 / 嵌套 0）、StormEnd（节点 7 / 嵌套 0）、Sunset（节点 9 / 嵌套 0）、SunsetEnd（节点 12 / 嵌套 0）、SunsetRace（节点 15 / 嵌套 0）、TitleWater（节点 3 / 嵌套 0）。

原注册字段：29；文件声明字段变体：30。 RTTI：`0x100ccca60`。

实现：[move-object-along-rail-runtime.ts](../src/core/move-object-along-rail-runtime.ts)、[scene-event-construction.ts](../src/core/scene-event-construction.ts)、[environment-object-state.ts](../src/core/environment-object-state.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)、[move-object-along-rail-update-runtime.ts](../src/core/move-object-along-rail-update-runtime.ts)、[vector-safe-slerp-runtime.ts](../src/core/vector-safe-slerp-runtime.ts)。

证据：[fish-group-map-audit.json](fish-group-map-audit.json)、[move-object-along-rail-native.json](move-object-along-rail-native.json)、[move-object-along-rail-defaults.json](move-object-along-rail-defaults.json)、[move-object-along-rail-oracle.json](move-object-along-rail-oracle.json)、[fish-group-rail-lifecycle-inputs.json](../tests/fixtures/fish-group-rail-lifecycle-inputs.json)、[鱼群轨道生命周期续接.md](鱼群轨道生命周期续接.md)、[move-object-along-rail-control-oracle.json](move-object-along-rail-control-oracle.json)、[vector-safe-slerp-oracle.json](vector-safe-slerp-oracle.json)、[冥龙探照光圈与鱼群轨道控制续接.md](冥龙探照光圈与鱼群轨道控制续接.md)。

</details>

<details>
<summary>NetDisconnect · 20%（2/10）</summary>

网络断开事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：NetDisconnect 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 网络断开事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100ccd110`。

</details>

<details>
<summary>NetFlag · 20%（2/10）</summary>

网络标志声明，实际行为待恢复。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：NetFlag 的原默认值、继承初始化及 0 个序列化字段变体；原注册字段 0 项。
- [ ] 网络标志声明，实际行为待恢复：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 4 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Night（节点 6 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、Sunset（节点 3 / 嵌套 0）、SunsetEnd（节点 4 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：0。 RTTI：`0x100ccd4e0`。

</details>

<details>
<summary>NetSetMatchmakingDisabled · 20%（2/10）</summary>

网络匹配开关。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：NetSetMatchmakingDisabled 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 网络匹配开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100ccd300`。

</details>

<details>
<summary>NotOnRegion · 30%（3/10）</summary>

区域外事件触发。

节点与引用已清点；原反向区域条件和启用/事件规则待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：NotOnRegion 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 区域外事件触发：节点与引用已清点；原反向区域条件和启用/事件规则待恢复。
- [ ] 依赖调用与事件：Clump（32 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Rain（节点 4 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cd79b0`。

</details>

<details>
<summary>Npc · 30%（3/10）</summary>

NPC 模型、动画、装扮与玩家状态。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc 的原默认值、继承初始化及 23 个序列化字段变体；原注册字段 23 项。
- [ ] NPC 模型、动画、装扮与玩家状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 23 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DayEnd（节点 4 / 嵌套 0）、DayHubCave（节点 4 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 5 / 嵌套 0）、Night（节点 5 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 3 / 嵌套 0）、Prairie_NestAndKeeper（节点 3 / 嵌套 0）、Prairie_Village（节点 7 / 嵌套 0）、Rain（节点 4 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 3 / 嵌套 0）、RainMid（节点 4 / 嵌套 0）、SkyHub2（节点 5 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 5 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：23；文件声明字段变体：23。 RTTI：`0x100cd0150`。

</details>

<details>
<summary>Npc_BreakHandHold · 30%（3/10）</summary>

NPC 解除牵手。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_BreakHandHold 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] NPC 解除牵手：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cd14f0`。

</details>

<details>
<summary>Npc_Chat · 30%（3/10）</summary>

NPC 聊天消息。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_Chat 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] NPC 聊天消息：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 2 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd2210`。

</details>

<details>
<summary>Npc_DisableGiftGiving · 30%（3/10）</summary>

NPC 赠礼功能限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_DisableGiftGiving 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] NPC 赠礼功能限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cd1130`。

</details>

<details>
<summary>Npc_DisableRelationshipMenu · 30%（3/10）</summary>

NPC 关系菜单限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_DisableRelationshipMenu 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] NPC 关系菜单限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cd0d70`。

</details>

<details>
<summary>Npc_GetAttention · 30%（3/10）</summary>

NPC 请求关注。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_GetAttention 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] NPC 请求关注：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 2 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cd2030`。

</details>

<details>
<summary>Npc_GiveCandle · 30%（3/10）</summary>

NPC 赠送蜡烛与接受事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_GiveCandle 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] NPC 赠送蜡烛与接受事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（1 条引用）、Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd09b0`。

</details>

<details>
<summary>Npc_HandHold · 30%（3/10）</summary>

NPC 发起牵手。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_HandHold 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] NPC 发起牵手：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：DayEnd（节点 2 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cd16d0`。

</details>

<details>
<summary>Npc_Hug · 30%（3/10）</summary>

NPC 发起拥抱。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_Hug 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] NPC 发起拥抱：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：StormEnd（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd1c70`。

</details>

<details>
<summary>Npc_OnHandHold · 30%（3/10）</summary>

NPC 牵手事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_OnHandHold 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] NPC 牵手事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 3 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cd18b0`。

</details>

<details>
<summary>Npc_OnHug · 30%（3/10）</summary>

NPC 拥抱事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_OnHug 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] NPC 拥抱事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：StormEnd（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cd1e50`。

</details>

<details>
<summary>Npc_OnNicknamed · 30%（3/10）</summary>

NPC 命名事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_OnNicknamed 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] NPC 命名事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）、Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd0f50`。

</details>

<details>
<summary>Npc_OnRecieveGift · 30%（3/10）</summary>

NPC 收礼事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_OnRecieveGift 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] NPC 收礼事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）、Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cd23f0`。

</details>

<details>
<summary>Npc_PlayAnim · 30%（3/10）</summary>

NPC 动画播放与速度。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_PlayAnim 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] NPC 动画播放与速度：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（54 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 1 / 嵌套 0）、DayEnd（节点 2 / 嵌套 0）、DayHubCave（节点 4 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 5 / 嵌套 0）、Night（节点 1 / 嵌套 0）、Prairie_Cave（节点 6 / 嵌套 0）、Prairie_NestAndKeeper（节点 5 / 嵌套 0）、Prairie_Village（节点 9 / 嵌套 0）、Rain（节点 4 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 7 / 嵌套 0）、StormEnd（节点 4 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cd0410`。

</details>

<details>
<summary>Npc_Prompt · 30%（3/10）</summary>

NPC 交互图标与激活事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_Prompt 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] NPC 交互图标与激活事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）、Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：StormEnd（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c833c0`。

</details>

<details>
<summary>Npc_Reflect · 30%（3/10）</summary>

NPC 状态向本地玩家的映射。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_Reflect 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] NPC 状态向本地玩家的映射：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd28c0`。

</details>

<details>
<summary>Npc_SetScale · 30%（3/10）</summary>

NPC 身高、缩放与时间过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_SetScale 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] NPC 身高、缩放与时间过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（9 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：HubReveal（节点 1 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 4 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100cd07d0`。

</details>

<details>
<summary>Npc_TakeOutFlame · 30%（3/10）</summary>

NPC 取出或收起火焰。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_TakeOutFlame 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] NPC 取出或收起火焰：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Rain（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cd05f0`。

</details>

<details>
<summary>Npc_Teleport · 30%（3/10）</summary>

NPC 定位。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_Teleport 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] NPC 定位：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（13 条引用）、Marker（13 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_Cave（节点 3 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 6 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd0b90`。

</details>

<details>
<summary>Npc_Turn · 30%（3/10）</summary>

NPC 朝向过渡与完成事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_Turn 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] NPC 朝向过渡与完成事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（10 条引用）、Marker（7 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayEnd（节点 3 / 嵌套 0）、SkyHub2（节点 4 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100cd1310`。

</details>

<details>
<summary>Npc_WalkTo · 30%（3/10）</summary>

NPC 移动目标与完成事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Npc_WalkTo 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] NPC 移动目标与完成事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）、Marker（2 条引用）、Npc（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayEnd（节点 2 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100cd25d0`。

</details>

<details>
<summary>OnAccountReady · 30%（3/10）</summary>

账户就绪、超时与回调。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnAccountReady 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 账户就绪、超时与回调：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：TitleWater（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c72370`。

</details>

<details>
<summary>OnAvatarEnergy · 30%（3/10）</summary>

玩家能量与区域条件事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnAvatarEnergy 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 玩家能量与区域条件事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（20 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：HubReveal（节点 2 / 嵌套 0）、Rain（节点 4 / 嵌套 0）、RainForest（节点 4 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cd44e0`。

</details>

<details>
<summary>OnAvatarOnGround · 30%（3/10）</summary>

玩家落地、速度与区域条件事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnAvatarOnGround 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 玩家落地、速度与区域条件事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（17 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dusk（节点 1 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cd4300`。

</details>

<details>
<summary>OnBetaMode · 30%（3/10）</summary>

测试版模式条件事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnBetaMode 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 测试版模式条件事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_ButterflyFields（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cd6070`。

</details>

<details>
<summary>OnBlaze · 40%（4/10）</summary>

燃烧状态与激活事件。

原启用／Update 与共享 EventBarn 状态接入已核验；重绑保留既有事件状态与激活边沿锁存。五个真实事件仍需真实 Blaze／Flame 装载和完整下游生命周期。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：OnBlaze 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 燃烧状态与激活事件（部分完成）：原启用／Update 与共享 EventBarn 状态接入已核验；重绑保留既有事件状态与激活边沿锁存。五个真实事件仍需真实 Blaze／Flame 装载和完整下游生命周期。
- [ ] 依赖调用与事件：Blaze（5 条引用）、Clump（5 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原启用／Update 与共享 EventBarn 状态接入已核验；重绑保留既有事件状态与激活边沿锁存。五个真实事件仍需真实 Blaze／Flame 装载和完整下游生命周期。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原启用／Update 与共享 EventBarn 状态接入已核验；重绑保留既有事件状态与激活边沿锁存。五个真实事件仍需真实 Blaze／Flame 装载和完整下游生命周期。
- [x] 明确范围的原核心子链已独立核验：原启用／Update 与共享 EventBarn 状态接入已核验；重绑保留既有事件状态与激活边沿锁存。五个真实事件仍需真实 Blaze／Flame 装载和完整下游生命周期。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Night（节点 4 / 嵌套 0）、Rain（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100c8bdd0`。

实现：[blaze-runtime.ts](../src/core/blaze-runtime.ts)、[environment-event-runtime.ts](../src/core/environment-event-runtime.ts)。

证据：[黑暗植物与生物加载续接.md](黑暗植物与生物加载续接.md)、[creature-plant-load-native.json](creature-plant-load-native.json)、[blaze-oracle.json](blaze-oracle.json)。

</details>

<details>
<summary>OnBoomDestroy · 30%（3/10）</summary>

冲量破坏阈值、动画与网格反馈。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnBoomDestroy 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 冲量破坏阈值、动画与网格反馈：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DuskGraveyard（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cd8310`。

</details>

<details>
<summary>OnBubbleButton · 30%（3/10）</summary>

世界气泡按钮距离、图标与点击事件。

实际节点和字段已清点；原交互对象/距离选择、图标、摄像机或玩家输入和事件待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnBubbleButton 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 世界气泡按钮距离、图标与点击事件：实际节点和字段已清点；原交互对象/距离选择、图标、摄像机或玩家输入和事件待恢复。
- [ ] 依赖调用与事件：Marker（3 条引用）、Clump（4 条引用）、Emitter（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 3 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100c8da10`。

</details>

<details>
<summary>OnButtonClick · 30%（3/10）</summary>

按钮点击事件。

实际节点和字段已清点；原按钮绑定、点击条件和事件链待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnButtonClick 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 按钮点击事件：实际节点和字段已清点；原按钮绑定、点击条件和事件链待恢复。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：HubReveal（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cdec90`。

</details>

<details>
<summary>OnChangeAnd · 30%（3/10）</summary>

集合状态与 AND 条件变化。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnChangeAnd 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 集合状态与 AND 条件变化：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：RainMid（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100d0c810`。

</details>

<details>
<summary>OnCollected · 30%（3/10）</summary>

收集与使用状态条件事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnCollected 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 收集与使用状态条件事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Collectible（7 条引用）、Clump（8 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100c98910`。

</details>

<details>
<summary>OnConfirmMenu · 30%（3/10）</summary>

确认菜单、图标与确认取消事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnConfirmMenu 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 确认菜单、图标与确认取消事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100cdf080`。

</details>

<details>
<summary>OnDemoMode · 30%（3/10）</summary>

演示模式条件事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnDemoMode 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 演示模式条件事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（10 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：DayEnd（节点 3 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cd5e90`。

</details>

<details>
<summary>OnEventSeries · 30%（3/10）</summary>

序列数量与触发规则。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnEventSeries 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 序列数量与触发规则：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（8 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 3 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100cd5280`。

</details>

<details>
<summary>OnFlame · 40%（4/10）</summary>

火焰集合、消耗、点燃与熄灭事件。

原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：OnFlame 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 8 项。
- [ ] 火焰集合、消耗、点燃与熄灭事件（部分完成）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 依赖调用与事件：Clump（308 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、Dawn（节点 4 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、DayHubCave（节点 10 / 嵌套 0）、Dusk（节点 4 / 嵌套 0）、DuskGraveyard（节点 3 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Night（节点 69 / 嵌套 0）、Prairie_ButterflyFields（节点 18 / 嵌套 0）、Prairie_Village（节点 18 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、Sunset（节点 5 / 嵌套 0）、SunsetEnd（节点 4 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：8；文件声明字段变体：9。 RTTI：`0x100caf7b0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[object-item-construction-runtime.ts](../src/core/object-item-construction-runtime.ts)、[nature-event-runtime.ts](../src/core/nature-event-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[object-item-construction.json](object-item-construction.json)、[object-item-construction-oracle.json](object-item-construction-oracle.json)、[nature-event-audit.json](nature-event-audit.json)、[nature-event-verification.json](nature-event-verification.json)、[nature-event-oracle.json](nature-event-oracle.json)。

</details>

<details>
<summary>OnFloat · 40%（4/10）</summary>

浮点条件组合与事件。

原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：OnFloat 的原默认值、继承初始化及 19 个序列化字段变体；原注册字段 18 项。
- [ ] 浮点条件组合与事件（部分完成）：原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Clump（115 条引用）、Float（98 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 18 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [x] 明确范围的原核心子链已独立核验：原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原192-byte构造、正常析构/Update/递归Evaluate已接创建→TGCL字段/引用→EventBarn调度→原Clump反射输出→释放重建。联合758组、3092快照、247072924字节0差异，包含全部94个真实OnFloat配置、2个FloatSplit配置及497个真实根图片段。五种比较、严格epsilon、双条件求值/嵌套/原字节not、真/假对象组、endOnTrigger/checkOnce、短长调试串及释放顺序均有受控核验。12个原断言、1个长度错误服务与297次缺失类服务边界分列。真实片段至多6帧；metadata/default准备、cast/堆池内部、调试流与异常unwind、实际场景/资源/UI/Avatar和Windows/原游戏验收仍待闭合，完整类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] Windows 真机与原游戏验收

地图：CandleSpaceEnd（节点 6 / 嵌套 0）、DayHubCave（节点 5 / 嵌套 0）、Night（节点 36 / 嵌套 0）、NightEnd（节点 3 / 嵌套 0）、Prairie_Village（节点 14 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainMid（节点 27 / 嵌套 0）、Storm（节点 1 / 嵌套 0）。

原注册字段：18；文件声明字段变体：19。 RTTI：`0x100d0d3d0`。

实现：[float-condition-event-runtime.ts](../src/core/float-condition-event-runtime.ts)、[clump-runtime.ts](../src/core/clump-runtime.ts)、[object-enabled-runtime.ts](../src/core/object-enabled-runtime.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)、[native-string-runtime.ts](../src/core/native-string-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[FloatSplit与OnFloat条件事件调用链逆向.md](FloatSplit与OnFloat条件事件调用链逆向.md)、[float-condition-native.json](float-condition-native.json)、[logic-chain-oracle.json](logic-chain-oracle.json)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)。

</details>

<details>
<summary>OnForgeGift · 30%（3/10）</summary>

赠礼条件后启用对象。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnForgeGift 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 赠礼条件后启用对象：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c26f00`。

</details>

<details>
<summary>OnGameReady · 30%（3/10）</summary>

游戏就绪事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnGameReady 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 游戏就绪事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：TitleWater（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cd5ad0`。

</details>

<details>
<summary>OnJoinPreviousGame · 30%（3/10）</summary>

重返上一游戏与失败事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnJoinPreviousGame 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 重返上一游戏与失败事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：TitleWater（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c72cf0`。

</details>

<details>
<summary>OnLatestVersion · 30%（3/10）</summary>

最新版本条件事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnLatestVersion 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 最新版本条件事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：TitleWater（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c72570`。

</details>

<details>
<summary>OnLevelStart · 30%（3/10）</summary>

地图启动事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnLevelStart 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 地图启动事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（21 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpaceEnd（节点 1 / 嵌套 0）、CarryLand（节点 1 / 嵌套 0）、CarryLand2（节点 1 / 嵌套 0）、CarryLand3（节点 1 / 嵌套 0）、Dawn（节点 2 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cd58d0`。

</details>

<details>
<summary>OnLevelUp · 30%（3/10）</summary>

等级变化事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnLevelUp 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 等级变化事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（5 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：DayEnd（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c75f60`。

</details>

<details>
<summary>OnMoteCarry · 30%（3/10）</summary>

光点携带开始或结束事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnMoteCarry 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 光点携带开始或结束事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：MoteParams（1 条引用）、Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_ButterflyFields（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100ccbd10`。

</details>

<details>
<summary>OnMusicOutro · 30%（3/10）</summary>

音乐尾段事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnMusicOutro 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 音乐尾段事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Sunset（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100ce8fa0`。

</details>

<details>
<summary>OnOfferGift · 30%（3/10）</summary>

赠礼发起事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnOfferGift 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 赠礼发起事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cdfcf0`。

</details>

<details>
<summary>OnOutfitShopPurchase · 30%（3/10）</summary>

装扮购买事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnOutfitShopPurchase 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 装扮购买事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）、OutfitSelect（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 2 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100ce34b0`。

</details>

<details>
<summary>OnRegion · 40%（4/10）</summary>

进入离开、逐帧和人数条件区域触发。

381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：OnRegion 的原默认值、继承初始化及 14 个序列化字段变体；原注册字段 13 项。
- [ ] 进入离开、逐帧和人数条件区域触发（部分完成）：381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 依赖调用与事件（部分完成）：Clump（763 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 13 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [x] 明确范围的原核心子链已独立核验：381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：381 个节点及 useCameraPos 字段已清点；空间判断、enter/exit、fireOnce/everyFrame、人数/local/remote 和事件链待恢复。 5条CharFishGroupAnim鱼群区域链的保存字段与引用已审计：本地玩家进入、fireOnce、4秒Delay重新启用及Disturb播放目标。此项是地图关系审计，原区域判断和EventBarn场景组合仍待接。 2026-11-25鱼群事件续接：OnRegion完整构造/Enable/Update、PlayAnimation placement及容差区域布尔入口373组、128043024字节、30273次边界调用原对照零差异。完整原静态序列初始化器直接执行，提取1201个序列和1966个步骤，保留FishGroup原索引488/489及资源限制；Disturb是惊动后转回游动的两动作序列。三图五组真实鱼群图已在共享准备内存/原EventBarn中触发、通过4秒Delay重新启用并创建真实资源动作请求；Avatar输入与Model/Animation分配为显式准备服务，原Model资源生命周期、轨道移动、动画更新/骨骼混合、画面和Windows真机仍待验收，完整生物保持0。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 3 / 嵌套 0）、CandleSpaceEnd（节点 3 / 嵌套 0）、Dawn（节点 46 / 嵌套 0）、DayEnd（节点 19 / 嵌套 0）、DayHubCave（节点 21 / 嵌套 0）、Dusk（节点 10 / 嵌套 0）、DuskGraveyard（节点 8 / 嵌套 0）、DuskMid（节点 7 / 嵌套 0）、HubReveal（节点 34 / 嵌套 0）、Night（节点 21 / 嵌套 0）、NightEnd（节点 10 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 4 / 嵌套 0）、Prairie_Cave（节点 7 / 嵌套 0）、Prairie_NestAndKeeper（节点 4 / 嵌套 0）、Prairie_Village（节点 10 / 嵌套 0）、Rain（节点 20 / 嵌套 0）、RainEnd（节点 6 / 嵌套 0）、RainForest（节点 14 / 嵌套 0）、RainMid（节点 19 / 嵌套 0）、SkyHub2（节点 28 / 嵌套 0）、Storm（节点 21 / 嵌套 0）、StormEnd（节点 7 / 嵌套 0）、Sunset（节点 21 / 嵌套 0）、SunsetEnd（节点 24 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）、SunsetRace（节点 8 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：13；文件声明字段变体：14。 RTTI：`0x100cd77a0`。

实现：[on-region-runtime.ts](../src/core/on-region-runtime.ts)、[animation-sequence-registry.ts](../src/core/animation-sequence-registry.ts)、[environment-object-state.ts](../src/core/environment-object-state.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)。

证据：[Objects与Avatar进度.json](Objects与Avatar进度.json)、[fish-group-map-audit.json](fish-group-map-audit.json)、[鱼群触发链与FishV2更新续接.md](鱼群触发链与FishV2更新续接.md)、[on-region-native.json](on-region-native.json)、[on-region-oracle.json](on-region-oracle.json)、[scene-event-defaults.json](scene-event-defaults.json)、[resource-animation-sequence-oracle.json](resource-animation-sequence-oracle.json)、[fish-group-scene-events.json](fish-group-scene-events.json)、[鱼群区域事件与原序列表续接.md](鱼群区域事件与原序列表续接.md)。

</details>

<details>
<summary>OnShout · 30%（3/10）</summary>

指定标记区域内喊叫事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnShout 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 指定标记区域内喊叫事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（12 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100cd86e0`。

</details>

<details>
<summary>OnTapCount · 30%（3/10）</summary>

区域内点击次数事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnTapCount 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 区域内点击次数事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Night（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cde8d0`。

</details>

<details>
<summary>OnTapPlayAnim · 30%（3/10）</summary>

点击动作动画、延迟与进度事件。

26 个节点及动作字段已清点；原交互/解锁条件、动画序列和动作 UI 事件待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnTapPlayAnim 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 14 项。
- [ ] 点击动作动画、延迟与进度事件：26 个节点及动作字段已清点；原交互/解锁条件、动画序列和动作 UI 事件待恢复。
- [ ] 依赖调用与事件：Clump（52 条引用）、Float（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 14 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayEnd（节点 2 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Night（节点 7 / 嵌套 0）、Prairie_Village（节点 5 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）。

原注册字段：14；文件声明字段变体：15。 RTTI：`0x100cd9360`。

</details>

<details>
<summary>OnUnlocked · 30%（3/10）</summary>

解锁、未确认与未解锁事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnUnlocked 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 解锁、未确认与未解锁事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（59 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 5 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、SkyHub2（节点 21 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、TitleWater（节点 2 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100c97980`。

</details>

<details>
<summary>OnUnlockOutfit · 30%（3/10）</summary>

装扮解锁后启用对象。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OnUnlockOutfit 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 装扮解锁后启用对象：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：HubReveal（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100ce3840`。

</details>

<details>
<summary>OpenConstellationTable · 30%（3/10）</summary>

星座桌菜单与关闭事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OpenConstellationTable 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 星座桌菜单与关闭事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 2 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100ce1b00`。

</details>

<details>
<summary>OutfitSelect · 30%（3/10）</summary>

衣柜、区域、商店与购买事件。

节点及 115 条 OutfitDefs/七槽资源已清点；账户解锁、原衣柜 UI、资源/配色/配件和换装事件待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：OutfitSelect 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 衣柜、区域、商店与购买事件：节点及 115 条 OutfitDefs/七槽资源已清点；账户解锁、原衣柜 UI、资源/配色/配件和换装事件待恢复。
- [ ] 依赖调用与事件：Clump（6 条引用）、Marker（12 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpaceEnd（节点 7 / 嵌套 0）、SkyHub2（节点 5 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100ce33a0`。

证据：[Objects与Avatar进度.json](Objects与Avatar进度.json)。

</details>

<details>
<summary>Parent · 40%（4/10）</summary>

对象父子跟随与关节挂接。

已有Parent普通分配/placement与live enabled接口。本轮补ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除：639组含270原对象对应540次准备创建/释放，21297516字节零差异。保留未写enabled/跟随指针、name描述符、dirty、非active目标匹配与实时allocator/节点回调读序；同一OriginalParentEndpoint创建/释放/复用核验。元数据、字符串池和node解除仍为显式服务；真实jointName内容、TGCL/cache/实际Barn启动、依赖排序/关节/跟随更新与完整类尚未闭合。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Parent 的原默认值、继承初始化及 13 个序列化字段变体；原注册字段 13 项。
- [ ] 对象父子跟随与关节挂接（部分完成）：已有Parent普通分配/placement与live enabled接口。本轮补ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除：639组含270原对象对应540次准备创建/释放，21297516字节零差异。保留未写enabled/跟随指针、name描述符、dirty、非active目标匹配与实时allocator/节点回调读序；同一OriginalParentEndpoint创建/释放/复用核验。元数据、字符串池和node解除仍为显式服务；真实jointName内容、TGCL/cache/实际Barn启动、依赖排序/关节/跟随更新与完整类尚未闭合。
- [ ] 依赖调用与事件（部分完成）：Clump（270 条引用）、LevelMesh（127 条引用）、Marker（104 条引用）、BirdV2（10 条引用）、Buddy（1 条引用）、DarkCreature（3 条引用）、Flame（5 条引用）、Npc（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 13 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：已有Parent普通分配/placement与live enabled接口。本轮补ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除：639组含270原对象对应540次准备创建/释放，21297516字节零差异。保留未写enabled/跟随指针、name描述符、dirty、非active目标匹配与实时allocator/节点回调读序；同一OriginalParentEndpoint创建/释放/复用核验。元数据、字符串池和node解除仍为显式服务；真实jointName内容、TGCL/cache/实际Barn启动、依赖排序/关节/跟随更新与完整类尚未闭合。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：已有Parent普通分配/placement与live enabled接口。本轮补ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除：639组含270原对象对应540次准备创建/释放，21297516字节零差异。保留未写enabled/跟随指针、name描述符、dirty、非active目标匹配与实时allocator/节点回调读序；同一OriginalParentEndpoint创建/释放/复用核验。元数据、字符串池和node解除仍为显式服务；真实jointName内容、TGCL/cache/实际Barn启动、依赖排序/关节/跟随更新与完整类尚未闭合。
- [x] 明确范围的原核心子链已独立核验：已有Parent普通分配/placement与live enabled接口。本轮补ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除：639组含270原对象对应540次准备创建/释放，21297516字节零差异。保留未写enabled/跟随指针、name描述符、dirty、非active目标匹配与实时allocator/节点回调读序；同一OriginalParentEndpoint创建/释放/复用核验。元数据、字符串池和node解除仍为显式服务；真实jointName内容、TGCL/cache/实际Barn启动、依赖排序/关节/跟随更新与完整类尚未闭合。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：已有Parent普通分配/placement与live enabled接口。本轮补ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除：639组含270原对象对应540次准备创建/释放，21297516字节零差异。保留未写enabled/跟随指针、name描述符、dirty、非active目标匹配与实时allocator/节点回调读序；同一OriginalParentEndpoint创建/释放/复用核验。元数据、字符串池和node解除仍为显式服务；真实jointName内容、TGCL/cache/实际Barn启动、依赖排序/关节/跟随更新与完整类尚未闭合。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：已有Parent普通分配/placement与live enabled接口。本轮补ParentBarn全部128槽Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除：639组含270原对象对应540次准备创建/释放，21297516字节零差异。保留未写enabled/跟随指针、name描述符、dirty、非active目标匹配与实时allocator/节点回调读序；同一OriginalParentEndpoint创建/释放/复用核验。元数据、字符串池和node解除仍为显式服务；真实jointName内容、TGCL/cache/实际Barn启动、依赖排序/关节/跟随更新与完整类尚未闭合。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 5 / 嵌套 0）、CandleSpaceEnd（节点 10 / 嵌套 0）、Dawn（节点 22 / 嵌套 0）、DayEnd（节点 5 / 嵌套 0）、DayHubCave（节点 12 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、DuskMid（节点 6 / 嵌套 0）、Dusk_CrabField（节点 2 / 嵌套 0）、HubReveal（节点 4 / 嵌套 0）、Night（节点 56 / 嵌套 0）、NightEntrance（节点 2 / 嵌套 0）、Prairie_ButterflyFields（节点 3 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 34 / 嵌套 0）、Rain（节点 9 / 嵌套 0）、RainEnd（节点 46 / 嵌套 0）、RainMid（节点 9 / 嵌套 0）、SkyHub2（节点 15 / 嵌套 0）、Storm（节点 3 / 嵌套 0）、StormEnd（节点 2 / 嵌套 0）、Sunset（节点 10 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetEnd2（节点 2 / 嵌套 0）、SunsetRace（节点 6 / 嵌套 0）。

原注册字段：13；文件声明字段变体：13。 RTTI：`0x100ce42a0`。

实现：[scene-foundation-runtime.ts](../src/core/scene-foundation-runtime.ts)、[parent-barn-runtime.ts](../src/core/parent-barn-runtime.ts)。

证据：[Beamo全LOD上传与基础类推进.md](Beamo全LOD上传与基础类推进.md)、[scene-foundation-native.json](scene-foundation-native.json)、[scene-foundation-oracle.json](scene-foundation-oracle.json)、[scene-foundation-native.json.gz](../tests/fixtures/scene-foundation-native.json.gz)、[Beamo包围盒材质分组与Parent池推进.md](Beamo包围盒材质分组与Parent池推进.md)、[beamo-spatial-native.json](beamo-spatial-native.json)、[parent-barn-oracle.json](parent-barn-oracle.json)、[parent-barn-native.json.gz](../tests/fixtures/parent-barn-native.json.gz)。

</details>

<details>
<summary>PauseCameraConfig · 30%（3/10）</summary>

摄像机配置保持、淡入和暂停。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：PauseCameraConfig 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 摄像机配置保持、淡入和暂停：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dusk（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100ce64c0`。

</details>

<details>
<summary>Pickup · 30%（3/10）</summary>

拾取物、货币与拾取反馈。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Pickup 的原默认值、继承初始化及 10 个序列化字段变体；原注册字段 9 项。
- [ ] 拾取物、货币与拾取反馈：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：CandleObject（1 条引用）、Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）。

原注册字段：9；文件声明字段变体：10。 RTTI：`0x100c271f0`。

</details>

<details>
<summary>PlatformingRegion · 30%（3/10）</summary>

平台运动区域。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：PlatformingRegion 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 2 项。
- [ ] 平台运动区域：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand（节点 1 / 嵌套 0）、Prairie_Cave（节点 6 / 嵌套 0）。

原注册字段：2；文件声明字段变体：2。 RTTI：`0x100d082e0`。

</details>

<details>
<summary>PlayAnimation · 40%（4/10）</summary>

对象动画序列、速度与状态。

原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：PlayAnimation 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 8 项。
- [ ] 对象动画序列、速度与状态（部分完成）：原 PlayAnimation.Update、完整原序列注册表与三图五处鱼群 EventBarn/OnRegion/Delay 请求调度已核验。共用 Animation.Update 的主动画、次级动作、叠加、Transform 世界缓存和最终矩阵/事件提交现已组成同一控制器连续帧更新：99 个资源、3564 组、16632 帧零差异。五处真实 Disturb→Swim 请求另通过 300 帧原程序对照，保留动作结束压缩、Swim 后的延时无 pack fallback 和零延时负零权重。原 Model 资源生命周期、MoveObjectAlongRail 逐帧移动、场景画面和 Windows 真机仍待验收，完整生物保持 0。
- [ ] 依赖调用与事件（部分完成）：Clump（187 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpaceEnd（节点 8 / 嵌套 0）、Dawn（节点 79 / 嵌套 0）、DayEnd（节点 7 / 嵌套 0）、DayHubCave（节点 20 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskMid（节点 3 / 嵌套 0）、HubReveal（节点 6 / 嵌套 0）、NightEnd（节点 20 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 4 / 嵌套 0）、Prairie_NestAndKeeper（节点 3 / 嵌套 0）、Prairie_Village（节点 19 / 嵌套 0）、Rain（节点 5 / 嵌套 0）、RainEnd（节点 4 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）。

原注册字段：8；文件声明字段变体：9。 RTTI：`0x100ce6a70`。

实现：[play-animation-runtime.ts](../src/core/play-animation-runtime.ts)、[resource-animation-control.ts](../src/core/resource-animation-control.ts)、[resource-animation-primary.ts](../src/core/resource-animation-primary.ts)、[resource-animation-secondary.ts](../src/core/resource-animation-secondary.ts)、[resource-animation-additive.ts](../src/core/resource-animation-additive.ts)、[resource-animation-lifecycle.ts](../src/core/resource-animation-lifecycle.ts)、[on-region-runtime.ts](../src/core/on-region-runtime.ts)、[animation-sequence-registry.ts](../src/core/animation-sequence-registry.ts)、[environment-object-state.ts](../src/core/environment-object-state.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)、[resource-animation-update.ts](../src/core/resource-animation-update.ts)、[transform-node-runtime.ts](../src/core/transform-node-runtime.ts)、[resource-animation-clock.ts](../src/core/resource-animation-clock.ts)。

证据：[resource-animation-controller-verification.json](resource-animation-controller-verification.json)、[生物骨骼动画续接.md](生物骨骼动画续接.md)、[fish-group-map-audit.json](fish-group-map-audit.json)、[鱼群触发链与FishV2更新续接.md](鱼群触发链与FishV2更新续接.md)、[on-region-native.json](on-region-native.json)、[on-region-oracle.json](on-region-oracle.json)、[scene-event-defaults.json](scene-event-defaults.json)、[resource-animation-sequence-oracle.json](resource-animation-sequence-oracle.json)、[fish-group-scene-events.json](fish-group-scene-events.json)、[鱼群区域事件与原序列表续接.md](鱼群区域事件与原序列表续接.md)、[resource-animation-update-native.json](resource-animation-update-native.json)、[resource-animation-update-oracle.json](resource-animation-update-oracle.json)、[fish-group-animation-update-oracle.json](fish-group-animation-update-oracle.json)、[生物共用动画整链续接.md](生物共用动画整链续接.md)、[play-animation-oracle.json](play-animation-oracle.json)。

</details>

<details>
<summary>PlayAvatarAnimSeq · 30%（3/10）</summary>

本地或远端玩家动画序列。

42 个节点及动画包资源已清点；animpack 轨道、骨架、序列/混合、玩家状态与动作 UI 待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：PlayAvatarAnimSeq 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 本地或远端玩家动画序列：42 个节点及动画包资源已清点；animpack 轨道、骨架、序列/混合、玩家状态与动作 UI 待恢复。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、Dawn（节点 14 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、NightEnd（节点 3 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 7 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetEnd2（节点 2 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100ce6e10`。

</details>

<details>
<summary>PlayMusic · 30%（3/10）</summary>

音乐切换、音量与淡入淡出。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：PlayMusic 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 音乐切换、音量与淡入淡出：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 2 / 嵌套 0）、CarryLand（节点 1 / 嵌套 0）、CarryLand2（节点 1 / 嵌套 0）、CarryLand3（节点 1 / 嵌套 0）、Dawn（节点 17 / 嵌套 0）、DayEnd（节点 2 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 5 / 嵌套 0）、Night（节点 5 / 嵌套 0）、NightEnd（节点 3 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 4 / 嵌套 0）、Prairie_NestAndKeeper（节点 3 / 嵌套 0）、Prairie_Village（节点 10 / 嵌套 0）、Rain（节点 4 / 嵌套 0）、RainEnd（节点 3 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Storm（节点 2 / 嵌套 0）、StormEnd（节点 5 / 嵌套 0）、Sunset（节点 3 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 3 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100ce8dc0`。

</details>

<details>
<summary>PlaySound2D · 40%（4/10）</summary>

二维声音播放。

完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：PlaySound2D 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 二维声音播放（部分完成）：完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 3 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：完整更新/恢复启用体已接 EventBarn 连续核验，含109个实际音效名及参数/句柄过期/完成/停止；SoundManager/FMOD、预加载、真实 GameTime 与完整播放生命周期待闭合。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、CandleSpaceEnd（节点 13 / 嵌套 0）、Dawn（节点 16 / 嵌套 0）、DayEnd（节点 7 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 4 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、Night（节点 3 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 5 / 嵌套 0）、Prairie_NestAndKeeper（节点 4 / 嵌套 0）、Prairie_Village（节点 13 / 嵌套 0）、Rain（节点 6 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、RainForest（节点 3 / 嵌套 0）、RainMid（节点 4 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 2 / 嵌套 0）、Sunset（节点 4 / 嵌套 0）、SunsetEnd（节点 5 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 2 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100ce9360`。

实现：[sound-event-runtime.ts](../src/core/sound-event-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)、[event-derived-drivers.ts](../src/core/event-derived-drivers.ts)。

证据：[数值类事件与依赖音效逆向.md](数值类事件与依赖音效逆向.md)、[object-runtime-native.json](object-runtime-native.json)、[对象启用与EventBarn调度逆向.md](对象启用与EventBarn调度逆向.md)、[sound-event-oracle.json](sound-event-oracle.json)、[event-barn-oracle.json](event-barn-oracle.json)。

</details>

<details>
<summary>PlaySound3D · 30%（3/10）</summary>

空间声音播放。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：PlaySound3D 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 空间声音播放：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（27 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 15 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、SkyHub2（节点 4 / 嵌套 0）、Storm（节点 1 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100ce9490`。

</details>

<details>
<summary>PointLight · 30%（3/10）</summary>

点光源空间实例。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：PointLight 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 1 项。
- [ ] 点光源空间实例：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 5 / 嵌套 0）、CandleSpaceEnd（节点 3 / 嵌套 0）、Dawn（节点 8 / 嵌套 0）、DayEnd（节点 23 / 嵌套 0）、DayHubCave（节点 12 / 嵌套 0）、Dusk（节点 5 / 嵌套 0）、DuskGraveyard（节点 20 / 嵌套 0）、DuskMid（节点 27 / 嵌套 0）、Dusk_CrabField（节点 19 / 嵌套 0）、HubReveal（节点 16 / 嵌套 0）、Night（节点 75 / 嵌套 0）、NightEnd（节点 11 / 嵌套 0）、NightEntrance（节点 9 / 嵌套 0）、Prairie_ButterflyFields（节点 16 / 嵌套 0）、Prairie_Cave（节点 33 / 嵌套 0）、Prairie_NestAndKeeper（节点 3 / 嵌套 0）、Prairie_Village（节点 15 / 嵌套 0）、Rain（节点 28 / 嵌套 0）、RainEnd（节点 34 / 嵌套 0）、RainForest（节点 23 / 嵌套 0）、RainMid（节点 15 / 嵌套 0）、SkyHub2（节点 14 / 嵌套 0）、Storm（节点 27 / 嵌套 0）、StormEnd（节点 36 / 嵌套 0）、Sunset（节点 18 / 嵌套 0）、SunsetEnd（节点 2 / 嵌套 0）、SunsetEnd2（节点 18 / 嵌套 0）、SunsetRace（节点 6 / 嵌套 0）。

原注册字段：1；文件声明字段变体：1。 RTTI：`0x100cea510`。

</details>

<details>
<summary>Rail · 40%（4/10）</summary>

轨道曲线、循环与更新。

402 条轨道的缓存、正常输入样条、最近点和弧长子链已核验；退化查询、自动失效和 macOS 数学库仍有缺口。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Rail 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 6 项。
- [ ] 轨道曲线、循环与更新（部分完成）：402 条轨道的缓存、正常输入样条、最近点和弧长子链已核验；退化查询、自动失效和 macOS 数学库仍有缺口。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 依赖调用与事件：Marker（3213 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：402 条轨道的缓存、正常输入样条、最近点和弧长子链已核验；退化查询、自动失效和 macOS 数学库仍有缺口。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [x] 明确范围的原核心子链已独立核验：402 条轨道的缓存、正常输入样条、最近点和弧长子链已核验；退化查询、自动失效和 macOS 数学库仍有缺口。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：402 条轨道的缓存、正常输入样条、最近点和弧长子链已核验；退化查询、自动失效和 macOS 数学库仍有缺口。 Marker矩阵输入现共用已核验的原字节内核；全部6538保存Marker的GetTransform/SetTransform经13784组、6440572字节0差异，原矩阵逆/额外乘积服务及完整场景行为仍独立保留。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 7 / 嵌套 0）、CarryLand2（节点 2 / 嵌套 0）、Dawn（节点 41 / 嵌套 0）、DayEnd（节点 4 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、Dusk（节点 7 / 嵌套 0）、DuskGraveyard（节点 19 / 嵌套 0）、DuskMid（节点 8 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 16 / 嵌套 0）、Night（节点 8 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 26 / 嵌套 0）、Prairie_Cave（节点 8 / 嵌套 0）、Prairie_NestAndKeeper（节点 8 / 嵌套 0）、Prairie_Village（节点 50 / 嵌套 0）、Rain（节点 6 / 嵌套 0）、RainEnd（节点 11 / 嵌套 0）、RainForest（节点 10 / 嵌套 0）、RainMid（节点 20 / 嵌套 0）、SkyHub2（节点 18 / 嵌套 0）、Storm（节点 25 / 嵌套 0）、StormEnd（节点 11 / 嵌套 0）、Sunset（节点 37 / 嵌套 0）、SunsetEnd（节点 20 / 嵌套 0）、SunsetEnd2（节点 9 / 嵌套 0）、SunsetRace（节点 21 / 嵌套 0）、TitleWater（节点 4 / 嵌套 0）。

原注册字段：6；文件声明字段变体：6。 RTTI：`0x100cec5d0`。

实现：[rail.ts](../src/core/rail.ts)、[rail-arc.ts](../src/core/rail-arc.ts)、[rail-level.ts](../src/core/rail-level.ts)、[marker-transform-runtime.ts](../src/core/marker-transform-runtime.ts)。

证据：[Rail轨道逆向.md](Rail轨道逆向.md)、[Marker空间变换与对象反射逆向.md](Marker空间变换与对象反射逆向.md)、[marker-transform-oracle.json](marker-transform-oracle.json)、[rail-cache-oracle.json](rail-cache-oracle.json)、[rail-oracle.json](rail-oracle.json)、[rail-arc-oracle.json](rail-arc-oracle.json)。

</details>

<details>
<summary>RainCurtainParams · 30%（3/10）</summary>

雨幕标记、雨滴密度和尺寸。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：RainCurtainParams 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 4 项。
- [ ] 雨幕标记、雨滴密度和尺寸：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Rain（节点 2 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）。

原注册字段：4；文件声明字段变体：4。 RTTI：`0x100cecda0`。

</details>

<details>
<summary>RedeemReward · 30%（3/10）</summary>

奖励兑换结果事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：RedeemReward 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 奖励兑换结果事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100c26d20`。

</details>

<details>
<summary>RefreshGiftMessages · 20%（2/10）</summary>

刷新赠礼消息。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：RefreshGiftMessages 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 刷新赠礼消息：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100c72ed0`。

</details>

<details>
<summary>ReleaseBirds · 40%（4/10）</summary>

释放鸟类集合。

原 OnEnabled 与所依赖的 Avatar 断言子函数已有独立原对照，保留 secondary forced FadeSequence(0.3,0)、实时模型／Clump重读、原平方距离严格阈值和统计递增。与 Detach 共133组、61,560,380字节零差异，接共享 EventBarn；三份实际保存配置仍因各鸟真实 Model／动画 owner 尚未装载而明确不可运行，Avatar／统计／淡出服务和完整下游生命周期继续待接。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：ReleaseBirds 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 释放鸟类集合（部分完成）：原 OnEnabled 与所依赖的 Avatar 断言子函数已有独立原对照，保留 secondary forced FadeSequence(0.3,0)、实时模型／Clump重读、原平方距离严格阈值和统计递增。与 Detach 共133组、61,560,380字节零差异，接共享 EventBarn；三份实际保存配置仍因各鸟真实 Model／动画 owner 尚未装载而明确不可运行，Avatar／统计／淡出服务和完整下游生命周期继续待接。
- [ ] 依赖调用与事件（部分完成）：Clump（3 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原 OnEnabled 与所依赖的 Avatar 断言子函数已有独立原对照，保留 secondary forced FadeSequence(0.3,0)、实时模型／Clump重读、原平方距离严格阈值和统计递增。与 Detach 共133组、61,560,380字节零差异，接共享 EventBarn；三份实际保存配置仍因各鸟真实 Model／动画 owner 尚未装载而明确不可运行，Avatar／统计／淡出服务和完整下游生命周期继续待接。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 OnEnabled 与所依赖的 Avatar 断言子函数已有独立原对照，保留 secondary forced FadeSequence(0.3,0)、实时模型／Clump重读、原平方距离严格阈值和统计递增。与 Detach 共133组、61,560,380字节零差异，接共享 EventBarn；三份实际保存配置仍因各鸟真实 Model／动画 owner 尚未装载而明确不可运行，Avatar／统计／淡出服务和完整下游生命周期继续待接。
- [x] 明确范围的原核心子链已独立核验：原 OnEnabled 与所依赖的 Avatar 断言子函数已有独立原对照，保留 secondary forced FadeSequence(0.3,0)、实时模型／Clump重读、原平方距离严格阈值和统计递增。与 Detach 共133组、61,560,380字节零差异，接共享 EventBarn；三份实际保存配置仍因各鸟真实 Model／动画 owner 尚未装载而明确不可运行，Avatar／统计／淡出服务和完整下游生命周期继续待接。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原 OnEnabled 与所依赖的 Avatar 断言子函数已有独立原对照，保留 secondary forced FadeSequence(0.3,0)、实时模型／Clump重读、原平方距离严格阈值和统计递增。与 Detach 共133组、61,560,380字节零差异，接共享 EventBarn；三份实际保存配置仍因各鸟真实 Model／动画 owner 尚未装载而明确不可运行，Avatar／统计／淡出服务和完整下游生命周期继续待接。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原 OnEnabled 与所依赖的 Avatar 断言子函数已有独立原对照，保留 secondary forced FadeSequence(0.3,0)、实时模型／Clump重读、原平方距离严格阈值和统计递增。与 Detach 共133组、61,560,380字节零差异，接共享 EventBarn；三份实际保存配置仍因各鸟真实 Model／动画 owner 尚未装载而明确不可运行，Avatar／统计／淡出服务和完整下游生命周期继续待接。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：RainMid（节点 3 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c8b130`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[bird-guide-runtime.ts](../src/core/bird-guide-runtime.ts)、[environment-event-owner.ts](../src/core/environment-event-owner.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[bird-guide-native.json](bird-guide-native.json)、[自然动画与鸟群引导续接.md](自然动画与鸟群引导续接.md)、[bird-guide-oracle.json](bird-guide-oracle.json)。

</details>

<details>
<summary>Replay · 30%（3/10）</summary>

玩家回放及 NPC 显示控制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Replay 的原默认值、继承初始化及 12 个序列化字段变体；原注册字段 11 项。
- [ ] 玩家回放及 NPC 显示控制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 11 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：HubReveal（节点 4 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）。

原注册字段：11；文件声明字段变体：12。 RTTI：`0x100cefc60`。

</details>

<details>
<summary>Replay_HandHold · 30%（3/10）</summary>

回放玩家与 NPC 牵手。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Replay_HandHold 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 回放玩家与 NPC 牵手：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Npc（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Rain（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100ceff60`。

</details>

<details>
<summary>Replay_PlayAnim · 30%（3/10）</summary>

回放玩家动画。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Replay_PlayAnim 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 回放玩家动画：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：HubReveal（节点 4 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cefd80`。

</details>

<details>
<summary>ReserveCurrency · 30%（3/10）</summary>

预留指定货币数量。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ReserveCurrency 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 预留指定货币数量：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cf5610`。

</details>

<details>
<summary>ResetAllStormKeyProgress · 20%（2/10）</summary>

风暴钥匙进度重置。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ResetAllStormKeyProgress 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 风暴钥匙进度重置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpaceEnd（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100c97e70`。

</details>

<details>
<summary>ResumeEnable · 40%（4/10）</summary>

恢复时启用对象。

原64-byte placement与Update接上Clump OnResumeEnabled→ObjectFactory TryResume→原方法查找/反射wrapper；Clump/Enable恢复方法及无方法的普通SetEnabled回退一起恢复。联合906组、4313快照、398249100字节原机器码0差异，包含全部5个实际ResumeEnable根配置；嵌套Clump、Marker启用、Enable保存false/killEvents后续调度、Delay重启、原null/required/receiver断言通过。25个原断言、1个长度错误服务与227次缺失类服务边界分列。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker变换/场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：ResumeEnable 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 恢复时启用对象（部分完成）：原64-byte placement与Update接上Clump OnResumeEnabled→ObjectFactory TryResume→原方法查找/反射wrapper；Clump/Enable恢复方法及无方法的普通SetEnabled回退一起恢复。联合906组、4313快照、398249100字节原机器码0差异，包含全部5个实际ResumeEnable根配置；嵌套Clump、Marker启用、Enable保存false/killEvents后续调度、Delay重启、原null/required/receiver断言通过。25个原断言、1个长度错误服务与227次缺失类服务边界分列。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker变换/场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。
- [ ] 依赖调用与事件（部分完成）：Clump（5 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 1 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原64-byte placement与Update接上Clump OnResumeEnabled→ObjectFactory TryResume→原方法查找/反射wrapper；Clump/Enable恢复方法及无方法的普通SetEnabled回退一起恢复。联合906组、4313快照、398249100字节原机器码0差异，包含全部5个实际ResumeEnable根配置；嵌套Clump、Marker启用、Enable保存false/killEvents后续调度、Delay重启、原null/required/receiver断言通过。25个原断言、1个长度错误服务与227次缺失类服务边界分列。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker变换/场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原64-byte placement与Update接上Clump OnResumeEnabled→ObjectFactory TryResume→原方法查找/反射wrapper；Clump/Enable恢复方法及无方法的普通SetEnabled回退一起恢复。联合906组、4313快照、398249100字节原机器码0差异，包含全部5个实际ResumeEnable根配置；嵌套Clump、Marker启用、Enable保存false/killEvents后续调度、Delay重启、原null/required/receiver断言通过。25个原断言、1个长度错误服务与227次缺失类服务边界分列。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker变换/场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。
- [x] 明确范围的原核心子链已独立核验：原64-byte placement与Update接上Clump OnResumeEnabled→ObjectFactory TryResume→原方法查找/反射wrapper；Clump/Enable恢复方法及无方法的普通SetEnabled回退一起恢复。联合906组、4313快照、398249100字节原机器码0差异，包含全部5个实际ResumeEnable根配置；嵌套Clump、Marker启用、Enable保存false/killEvents后续调度、Delay重启、原null/required/receiver断言通过。25个原断言、1个长度错误服务与227次缺失类服务边界分列。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker变换/场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原64-byte placement与Update接上Clump OnResumeEnabled→ObjectFactory TryResume→原方法查找/反射wrapper；Clump/Enable恢复方法及无方法的普通SetEnabled回退一起恢复。联合906组、4313快照、398249100字节原机器码0差异，包含全部5个实际ResumeEnable根配置；嵌套Clump、Marker启用、Enable保存false/killEvents后续调度、Delay重启、原null/required/receiver断言通过。25个原断言、1个长度错误服务与227次缺失类服务边界分列。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker变换/场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原64-byte placement与Update接上Clump OnResumeEnabled→ObjectFactory TryResume→原方法查找/反射wrapper；Clump/Enable恢复方法及无方法的普通SetEnabled回退一起恢复。联合906组、4313快照、398249100字节原机器码0差异，包含全部5个实际ResumeEnable根配置；嵌套Clump、Marker启用、Enable保存false/killEvents后续调度、Delay重启、原null/required/receiver断言通过。25个原断言、1个长度错误服务与227次缺失类服务边界分列。真实片段至多6帧；完整metadata/default准备、cast/堆池和Game启动、调试流/异常unwind、Marker变换/场景消费以及资源/UI/Avatar与Windows/原游戏验收仍待闭合，完整原类/实例仍为0。
- [ ] Windows 真机与原游戏验收

地图：Night（节点 5 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cf01d0`。

实现：[logic-event-runtime.ts](../src/core/logic-event-runtime.ts)、[object-resume-runtime.ts](../src/core/object-resume-runtime.ts)、[object-enabled-runtime.ts](../src/core/object-enabled-runtime.ts)、[marker-runtime.ts](../src/core/marker-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)。

证据：[Marker启用与ResumeEnable恢复调用链逆向.md](Marker启用与ResumeEnable恢复调用链逆向.md)、[marker-resume-native.json](marker-resume-native.json)、[logic-chain-oracle.json](logic-chain-oracle.json)。

</details>

<details>
<summary>ResumeGate · 20%（2/10）</summary>

恢复流程门控。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ResumeGate 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 恢复流程门控：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100c929d0`。

</details>

<details>
<summary>ReverbRegion · 30%（3/10）</summary>

区域混响与参数过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ReverbRegion 的原默认值、继承初始化及 28 个序列化字段变体；原注册字段 28 项。
- [ ] 区域混响与参数过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（33 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 28 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 3 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 2 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、SkyHub2（节点 5 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 3 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：28；文件声明字段变体：28。 RTTI：`0x100cf0c30`。

</details>

<details>
<summary>RiseWhenStoodOn · 30%（3/10）</summary>

站立交互引发网格升起。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：RiseWhenStoodOn 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 站立交互引发网格升起：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand（节点 1 / 嵌套 0）、CarryLand2（节点 3 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cdfb10`。

</details>

<details>
<summary>RotateObject · 30%（3/10）</summary>

对象旋转范围与速度控制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：RotateObject 的原默认值、继承初始化及 18 个序列化字段变体；原注册字段 17 项。
- [ ] 对象旋转范围与速度控制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（8 条引用）、Float（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 17 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、Night（节点 4 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）。

原注册字段：17；文件声明字段变体：18。 RTTI：`0x100d071c0`。

</details>

<details>
<summary>ScheduledEvent · 30%（3/10）</summary>

命名计划事件与对象集合。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ScheduledEvent 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 命名计划事件与对象集合：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（13 条引用）、SoulTrap（8 条引用）、Marker（1 条引用）、AncestorEngine（5 条引用）、ClockTower（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、RainForest（节点 3 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、SkyHub2（节点 10 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cf1090`。

</details>

<details>
<summary>ScoreRaceCollectibles · 30%（3/10）</summary>

竞赛收集物计分。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ScoreRaceCollectibles 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 竞赛收集物计分：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：AncestorRaceGoal（1 条引用）、Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SunsetEnd（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c7c9c0`。

</details>

<details>
<summary>SendAnalyticsEvent · 30%（3/10）</summary>

命名统计事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SendAnalyticsEvent 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 命名统计事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c94440`。

</details>

<details>
<summary>SetAvatarMinYSpeed · 30%（3/10）</summary>

玩家最小竖直速度与起飞。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetAvatarMinYSpeed 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 玩家最小竖直速度与起飞：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpaceEnd（节点 1 / 嵌套 0）、Night（节点 10 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cfdaf0`。

</details>

<details>
<summary>SetAvatarRender · 30%（3/10）</summary>

本地与远端玩家绘制开关。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetAvatarRender 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 本地与远端玩家绘制开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 5 / 嵌套 0）、Prairie_Village（节点 6 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100ce7010`。

</details>

<details>
<summary>SetBirdGuidesEnabled · 40%（4/10）</summary>

鸟类引导开关。

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：SetBirdGuidesEnabled 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 鸟类引导开关（部分完成）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 依赖调用与事件：Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_Village（节点 4 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c8a9b0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[nature-event-runtime.ts](../src/core/nature-event-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[nature-event-audit.json](nature-event-audit.json)、[nature-event-verification.json](nature-event-verification.json)、[nature-event-oracle.json](nature-event-oracle.json)。

</details>

<details>
<summary>SetBlockUpdraftWind · 20%（2/10）</summary>

上升风场作用限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetBlockUpdraftWind 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 上升风场作用限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_NestAndKeeper（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100cfdce0`。

</details>

<details>
<summary>SetCameraKeyFrameShake · 40%（4/10）</summary>

关键帧震动参数与过渡。

原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。先推进计时，再逐个反射解析并写入关键帧idle/moving/speed；保留未夹紧的淡出与成员变更后的重读，结束使用大于等于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机震动采样/绘制及完整运行仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetCameraKeyFrameShake 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 关键帧震动参数与过渡（部分完成）：原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。先推进计时，再逐个反射解析并写入关键帧idle/moving/speed；保留未夹紧的淡出与成员变更后的重读，结束使用大于等于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机震动采样/绘制及完整运行仍待恢复。
- [ ] 依赖调用与事件（部分完成）：Clump（10 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。先推进计时，再逐个反射解析并写入关键帧idle/moving/speed；保留未夹紧的淡出与成员变更后的重读，结束使用大于等于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机震动采样/绘制及完整运行仍待恢复。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。先推进计时，再逐个反射解析并写入关键帧idle/moving/speed；保留未夹紧的淡出与成员变更后的重读，结束使用大于等于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机震动采样/绘制及完整运行仍待恢复。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。先推进计时，再逐个反射解析并写入关键帧idle/moving/speed；保留未夹紧的淡出与成员变更后的重读，结束使用大于等于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机震动采样/绘制及完整运行仍待恢复。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 3 / 嵌套 0）、DayEnd（节点 2 / 嵌套 0）、Prairie_Cave（节点 3 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）。

原注册字段：7；文件声明字段变体：8。 RTTI：`0x100cf1500`。

实现：[camera-events.ts](../src/core/camera-events.ts)、[camera-event-preview.ts](../src/core/camera-event-preview.ts)、[avatar-camera-controller.ts](../src/renderer/avatar-camera-controller.ts)。

证据：[camera-events-native.json](camera-events-native.json)、[camera-events-oracle.json](camera-events-oracle.json)、[camera-events-smoke.json](camera-events-smoke.json)、[Objects相机事件与Avatar推进.md](Objects相机事件与Avatar推进.md)。

</details>

<details>
<summary>SetCameraShake · 40%（4/10）</summary>

摄像机震动强度与时长。

原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。原Whisker速度/幅度/权重写入，先输出后推进计时；结束使用严格大于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机/避障及完整运行仍待恢复。 本轮新增完整Whisker震动/基底辅助函数核验：162组、1,296帧、2,126,416字节零差异，含10条真实speed/force输入；原三轴哈希噪声、事件权重幂次混合/衰减及射线/擦身音效请求参数已核对。Avatar已接位置震动，暂停/停止/重启保留基准镜头；物理、Wind、射线和音效为服务，原连续相机、避障和关键帧震动未闭合。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetCameraShake 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 摄像机震动强度与时长（部分完成）：原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。原Whisker速度/幅度/权重写入，先输出后推进计时；结束使用严格大于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机/避障及完整运行仍待恢复。 本轮新增完整Whisker震动/基底辅助函数核验：162组、1,296帧、2,126,416字节零差异，含10条真实speed/force输入；原三轴哈希噪声、事件权重幂次混合/衰减及射线/擦身音效请求参数已核对。Avatar已接位置震动，暂停/停止/重启保留基准镜头；物理、Wind、射线和音效为服务，原连续相机、避障和关键帧震动未闭合。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。原Whisker速度/幅度/权重写入，先输出后推进计时；结束使用严格大于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机/避障及完整运行仍待恢复。 本轮新增完整Whisker震动/基底辅助函数核验：162组、1,296帧、2,126,416字节零差异，含10条真实speed/force输入；原三轴哈希噪声、事件权重幂次混合/衰减及射线/擦身音效请求参数已核对。Avatar已接位置震动，暂停/停止/重启保留基准镜头；物理、Wind、射线和音效为服务，原连续相机、避障和关键帧震动未闭合。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。原Whisker速度/幅度/权重写入，先输出后推进计时；结束使用严格大于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机/避障及完整运行仍待恢复。 本轮新增完整Whisker震动/基底辅助函数核验：162组、1,296帧、2,126,416字节零差异，含10条真实speed/force输入；原三轴哈希噪声、事件权重幂次混合/衰减及射线/擦身音效请求参数已核对。Avatar已接位置震动，暂停/停止/重启保留基准镜头；物理、Wind、射线和音效为服务，原连续相机、避障和关键帧震动未闭合。
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：原 OnStart/Update 与 CameraSystem 相机句柄、metadata getter、Event Start 已联合核验；220组、1,540帧、3,642,016字节零差异，含两类全部20条真实字段/Clump引用配置。原Whisker速度/幅度/权重写入，先输出后推进计时；结束使用严格大于。Avatar面板显式运行实际地图事件并隔离预览状态；时钟、类型解析和结束分发为服务。缺字段构造默认值、自动场景事件、完整相机/避障及完整运行仍待恢复。 本轮新增完整Whisker震动/基底辅助函数核验：162组、1,296帧、2,126,416字节零差异，含10条真实speed/force输入；原三轴哈希噪声、事件权重幂次混合/衰减及射线/擦身音效请求参数已核对。Avatar已接位置震动，暂停/停止/重启保留基准镜头；物理、Wind、射线和音效为服务，原连续相机、避障和关键帧震动未闭合。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、Night（节点 4 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cbb3a0`。

实现：[camera-events.ts](../src/core/camera-events.ts)、[camera-event-preview.ts](../src/core/camera-event-preview.ts)、[avatar-camera-controller.ts](../src/renderer/avatar-camera-controller.ts)、[avatar-camera-shake.ts](../src/core/avatar-camera-shake.ts)。

证据：[camera-events-native.json](camera-events-native.json)、[camera-events-oracle.json](camera-events-oracle.json)、[camera-events-smoke.json](camera-events-smoke.json)、[Objects相机事件与Avatar推进.md](Objects相机事件与Avatar推进.md)、[avatar-camera-shake-native.json](avatar-camera-shake-native.json)、[avatar-camera-shake-oracle.json](avatar-camera-shake-oracle.json)、[avatar-camera-shake-smoke.json](avatar-camera-shake-smoke.json)、[Avatar位置震动与Objects相机推进.md](Avatar位置震动与Objects相机推进.md)。

</details>

<details>
<summary>SetDarkCreaturesNetworked · 40%（4/10）</summary>

暗生物网络同步配置。

原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：SetDarkCreaturesNetworked 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 暗生物网络同步配置（部分完成）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 依赖调用与事件：Clump（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造、共享保存字段和已定位的池式创建／启用子链已有实现与核验；实际资源装载、AI、骨骼动画、碰撞／效果和动态绘制及完整生命周期继续待接。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DuskMid（节点 3 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100c9e390`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[creature-construction-runtime.ts](../src/core/creature-construction-runtime.ts)、[creature-runtime.ts](../src/core/creature-runtime.ts)、[nature-event-runtime.ts](../src/core/nature-event-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[creature-construction.json](creature-construction.json)、[creature-construction-oracle.json](creature-construction-oracle.json)、[creature-kernel-oracle.json](creature-kernel-oracle.json)、[objects-nature-audit.json](objects-nature-audit.json)、[nature-event-audit.json](nature-event-audit.json)、[nature-event-verification.json](nature-event-verification.json)、[nature-event-oracle.json](nature-event-oracle.json)。

</details>

<details>
<summary>SetDroppableCountFloat · 30%（3/10）</summary>

可掉落数量到浮点输出。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetDroppableCountFloat 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 可掉落数量到浮点输出：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Float（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：NightEnd（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c76f20`。

</details>

<details>
<summary>SetEmitterFlowRail · 30%（3/10）</summary>

发射器沿轨道流向设置。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetEmitterFlowRail 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 发射器沿轨道流向设置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（2 条引用）、Rail（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100ce5b40`。

</details>

<details>
<summary>SetEnvDefault · 40%（4/10）</summary>

设置默认环境参数。

公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：SetEnvDefault 的原默认值、继承初始化及 38 个序列化字段变体；原注册字段 37 项。
- [ ] 设置默认环境参数（部分完成）：公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。
- [ ] 依赖调用与事件（部分完成）：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 37 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：公开字段到 EnvVars 的原存储转换已核验；自动事件、默认指针选择与完整类运行待恢复。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、Dawn（节点 2 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：37；文件声明字段变体：38。 RTTI：`0x100cabd40`。

实现：[environment-storage.ts](../src/core/environment-storage.ts)、[environment-runtime.ts](../src/core/environment-runtime.ts)。

证据：[environment-oracle.json](environment-oracle.json)、[烘焙与环境逆向进展.md](烘焙与环境逆向进展.md)、[env-vars-native.json](../tests/fixtures/env-vars-native.json)。

</details>

<details>
<summary>SetEnvHull · 40%（4/10）</summary>

设置区域环境参数。

原存储转换和 Clump 环境范围子链已核验；自动激活/事件及动态生命周期待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：SetEnvHull 的原默认值、继承初始化及 44 个序列化字段变体；原注册字段 43 项。
- [ ] 设置区域环境参数（部分完成）：原存储转换和 Clump 环境范围子链已核验；自动激活/事件及动态生命周期待恢复。
- [ ] 依赖调用与事件（部分完成）：Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 43 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原存储转换和 Clump 环境范围子链已核验；自动激活/事件及动态生命周期待恢复。
- [ ] 完整加载、注册与启用传播
- [x] 明确范围的原核心子链已独立核验：原存储转换和 Clump 环境范围子链已核验；自动激活/事件及动态生命周期待恢复。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原存储转换和 Clump 环境范围子链已核验；自动激活/事件及动态生命周期待恢复。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Storm（节点 3 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）。

原注册字段：43；文件声明字段变体：44。 RTTI：`0x100cabf30`。

实现：[environment-storage.ts](../src/core/environment-storage.ts)、[environment-regions.ts](../src/core/environment-regions.ts)。

证据：[environment-oracle.json](environment-oracle.json)、[environment-clump-oracle.json](environment-clump-oracle.json)、[烘焙与环境逆向进展.md](烘焙与环境逆向进展.md)、[env-vars-native.json](../tests/fixtures/env-vars-native.json)。

</details>

<details>
<summary>SetFlame · 40%（4/10）</summary>

火焰集合点燃状态与计时。

原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：SetFlame 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 火焰集合点燃状态与计时（部分完成）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 依赖调用与事件：Clump（43 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [x] 明确范围的原核心子链已独立核验：原普通构造和共享保存字段已恢复；Candle 渲染记录保持未装载，Flame／Candle 完整装载、蜡量／点燃更新、音效粒子、绘制及卸载尚未闭合。 此类原事件调用体已独立核验，部分真实事件接共享 EventBarn；缺失转换／玩家／声音／Model 消费者的分支保留明确依赖，不能计为完整类。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 3 / 嵌套 0）、DayEnd（节点 5 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、Night（节点 14 / 嵌套 0）、Prairie_Village（节点 5 / 嵌套 0）、Rain（节点 5 / 嵌套 0）、RainEnd（节点 4 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 4 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100caf9a0`。

实现：[environment-object-state.ts](../src/core/environment-object-state.ts)、[object-item-construction-runtime.ts](../src/core/object-item-construction-runtime.ts)、[nature-event-runtime.ts](../src/core/nature-event-runtime.ts)。

证据：[生物骨骼动画续接.md](生物骨骼动画续接.md)、[object-item-construction.json](object-item-construction.json)、[object-item-construction-oracle.json](object-item-construction-oracle.json)、[nature-event-audit.json](nature-event-audit.json)、[nature-event-verification.json](nature-event-verification.json)、[nature-event-oracle.json](nature-event-oracle.json)。

</details>

<details>
<summary>SetFlightParams · 30%（3/10）</summary>

飞行巡航角与升力配置。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetFlightParams 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 飞行巡航角与升力配置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：RainEnd（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100cfe280`。

</details>

<details>
<summary>SetFloat · 40%（4/10）</summary>

浮点目标值与时间过渡。

原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：SetFloat 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 浮点目标值与时间过渡（部分完成）：原88-byte placement构造已恢复并保留未写字段；OnLevelLoad清零初值/进度，enable/resume捕获当前target，Update按原GameTime顺序平滑并当帧结束。全部4个真实配置接通创建→字段/引用→触发登记→原加载/逐帧调度→释放；41组自动子链、462对Linux logf/expf服务输出核验，基础2278组0差异。原macOS libm、metadata/default缓存、堆内部、对象名字及完整场景反馈仍待闭合。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Float（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：DayHubCave（节点 1 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100d0c090`。

实现：[set-float-runtime.ts](../src/core/set-float-runtime.ts)、[event-foundation-runtime.ts](../src/core/event-foundation-runtime.ts)、[native-event-barn-runtime.ts](../src/core/native-event-barn-runtime.ts)、[native-event-barn-view.ts](../src/core/native-event-barn-view.ts)、[object-field-load-runtime.ts](../src/core/object-field-load-runtime.ts)、[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)、[numeric-event-runtime.ts](../src/core/numeric-event-runtime.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)。

证据：[数值类事件与依赖音效逆向.md](数值类事件与依赖音效逆向.md)、[object-runtime-native.json](object-runtime-native.json)、[FloatAdd与SetFloat创建装载自动调度逆向.md](FloatAdd与SetFloat创建装载自动调度逆向.md)、[numeric-event-chain-evidence.json](numeric-event-chain-evidence.json)、[object-foundation-oracle.json](object-foundation-oracle.json)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[object-batch-oracle.json](object-batch-oracle.json)。

</details>

<details>
<summary>SetForce · 30%（3/10）</summary>

标记区域内受力与速度限制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetForce 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 标记区域内受力与速度限制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cdf550`。

</details>

<details>
<summary>SetGlide · 30%（3/10）</summary>

滑翔与飞行能力开关。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetGlide 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 滑翔与飞行能力开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Night（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cfdec0`。

</details>

<details>
<summary>SetGlobalEventParameter · 30%（3/10）</summary>

全局事件参数设置。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetGlobalEventParameter 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 全局事件参数设置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100ce95b0`。

</details>

<details>
<summary>SetInputState · 30%（3/10）</summary>

玩家与摄像机输入开关。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetInputState 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 玩家与摄像机输入开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 2 / 嵌套 0）、Dawn（节点 6 / 嵌套 0）、DayEnd（节点 2 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 5 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、SkyHub2（节点 4 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、StormEnd（节点 4 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、TitleWater（节点 2 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100cb8250`。

</details>

<details>
<summary>SetMeshShaderParam · 30%（3/10）</summary>

模型 uniform 值与过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetMeshShaderParam 的原默认值、继承初始化及 14 个序列化字段变体；原注册字段 13 项。
- [ ] 模型 uniform 值与过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（359 条引用）、Float（19 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 13 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、Dawn（节点 52 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、DayHubCave（节点 10 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Dusk_CrabField（节点 2 / 嵌套 0）、HubReveal（节点 2 / 嵌套 0）、Night（节点 89 / 嵌套 0）、NightEnd（节点 71 / 嵌套 0）、NightEntrance（节点 4 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 30 / 嵌套 0）、Rain（节点 33 / 嵌套 0）、RainEnd（节点 3 / 嵌套 0）、RainMid（节点 9 / 嵌套 0）、SkyHub2（节点 34 / 嵌套 0）、SunsetEnd（节点 11 / 嵌套 0）、SunsetEnd2（节点 2 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：13；文件声明字段变体：14。 RTTI：`0x100cf1c40`。

</details>

<details>
<summary>SetMixChannelLowpassFreq · 30%（3/10）</summary>

混音通道低通频率过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetMixChannelLowpassFreq 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 混音通道低通频率过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dusk（节点 6 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Storm（节点 4 / 嵌套 0）、Sunset（节点 6 / 嵌套 0）、SunsetEnd（节点 6 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100ce8be0`。

</details>

<details>
<summary>SetMixChannelVolume · 30%（3/10）</summary>

混音通道音量过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetMixChannelVolume 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 混音通道音量过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：Dawn（节点 4 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、NightEnd（节点 5 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、Storm（节点 4 / 嵌套 0）、StormEnd（节点 5 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100ce8820`。

</details>

<details>
<summary>SetMusicVolume · 30%（3/10）</summary>

音乐音量过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetMusicVolume 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 音乐音量过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Dawn（节点 6 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、DuskMid（节点 2 / 嵌套 0）、HubReveal（节点 4 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、RainForest（节点 6 / 嵌套 0）、RainMid（节点 8 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Sunset（节点 4 / 嵌套 0）、SunsetEnd（节点 10 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100ce8620`。

</details>

<details>
<summary>SetOceanRender · 30%（3/10）</summary>

海洋绘制开关。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetOceanRender 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 海洋绘制开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、Dawn（节点 2 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cd3920`。

</details>

<details>
<summary>SetRainParams · 30%（3/10）</summary>

降雨强度、速度与过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetRainParams 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 降雨强度、速度与过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、Rain（节点 5 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cecec0`。

</details>

<details>
<summary>SetRender · 30%（3/10）</summary>

模型绘制开关。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetRender 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 模型绘制开关：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（10 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、SkyHub2（节点 9 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100cdf190`。

</details>

<details>
<summary>SetShopTableTutorial · 30%（3/10）</summary>

任务桌商店教程配置。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetShopTableTutorial 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 2 项。
- [ ] 任务桌商店教程配置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：WorldQuestTable（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 2 / 嵌套 0）。

原注册字段：2；文件声明字段变体：3。 RTTI：`0x100ce2be0`。

</details>

<details>
<summary>SetSoundParameter · 30%（3/10）</summary>

全局、音乐或发射器声音参数。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetSoundParameter 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 全局、音乐或发射器声音参数：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Float（5 条引用）、Clump（7 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayHubCave（节点 1 / 嵌套 0）、Night（节点 5 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：7；文件声明字段变体：8。 RTTI：`0x100ce9790`。

</details>

<details>
<summary>SetTutorialMode · 30%（3/10）</summary>

教程状态设置。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetTutorialMode 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 教程状态设置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 4 / 嵌套 0）、Dawn（节点 8 / 嵌套 0）、HubReveal（节点 7 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c25f90`。

</details>

<details>
<summary>SetWind · 30%（3/10）</summary>

全局或区域风场设置。

节点和 Wind 引用已清点；全局阵风核心不能代替 SetWind 类的原事件/启用行为。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SetWind 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 全局或区域风场设置：节点和 Wind 引用已清点；全局阵风核心不能代替 SetWind 类的原事件/启用行为。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：HubReveal（节点 2 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：7；文件声明字段变体：8。 RTTI：`0x100cf2530`。

</details>

<details>
<summary>ShowHUDTimed · 30%（3/10）</summary>

HUD 纹理、图层、时长与过渡。

73 个节点和字段已清点；原纹理、持续时间、图层、淡入淡出和摄像机/玩家事件待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ShowHUDTimed 的原默认值、继承初始化及 16 个序列化字段变体；原注册字段 15 项。
- [ ] HUD 纹理、图层、时长与过渡：73 个节点和字段已清点；原纹理、持续时间、图层、淡入淡出和摄像机/玩家事件待恢复。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 15 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 2 / 嵌套 0）、CandleSpaceEnd（节点 5 / 嵌套 0）、Dawn（节点 5 / 嵌套 0）、DayEnd（节点 6 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 3 / 嵌套 0）、DuskMid（节点 3 / 嵌套 0）、HubReveal（节点 6 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 3 / 嵌套 0）、NightEntrance（节点 3 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 4 / 嵌套 0）、Prairie_Village（节点 11 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、StormEnd（节点 2 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）、TitleWater（节点 3 / 嵌套 0）。

原注册字段：15；文件声明字段变体：16。 RTTI：`0x100cba870`。

</details>

<details>
<summary>ShowMOTD · 30%（3/10）</summary>

公告显示与关闭事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：ShowMOTD 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 公告显示与关闭事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：TitleWater（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100c72930`。

</details>

<details>
<summary>SnapToCam · 30%（3/10）</summary>

摄像机切换、注视与过渡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SnapToCam 的原默认值、继承初始化及 18 个序列化字段变体；原注册字段 17 项。
- [ ] 摄像机切换、注视与过渡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1464 条引用）、Rail（4 条引用）、Marker（97 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 17 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 16 / 嵌套 0）、CandleSpaceEnd（节点 51 / 嵌套 0）、Dawn（节点 92 / 嵌套 0）、DayEnd（节点 46 / 嵌套 0）、DayHubCave（节点 7 / 嵌套 0）、Dusk（节点 27 / 嵌套 0）、DuskGraveyard（节点 7 / 嵌套 0）、DuskMid（节点 49 / 嵌套 0）、HubReveal（节点 46 / 嵌套 0）、Night（节点 33 / 嵌套 0）、NightEnd（节点 23 / 嵌套 0）、NightEntrance（节点 5 / 嵌套 0）、Prairie_ButterflyFields（节点 10 / 嵌套 0）、Prairie_Cave（节点 27 / 嵌套 0）、Prairie_NestAndKeeper（节点 23 / 嵌套 0）、Prairie_Village（节点 66 / 嵌套 0）、Rain（节点 19 / 嵌套 0）、RainEnd（节点 33 / 嵌套 0）、RainForest（节点 8 / 嵌套 0）、RainMid（节点 32 / 嵌套 0）、SkyHub2（节点 49 / 嵌套 0）、Storm（节点 6 / 嵌套 0）、StormEnd（节点 5 / 嵌套 0）、Sunset（节点 7 / 嵌套 0）、SunsetEnd（节点 7 / 嵌套 0）、SunsetEnd2（节点 27 / 嵌套 0）、SunsetRace（节点 7 / 嵌套 0）、TitleWater（节点 4 / 嵌套 0）。

原注册字段：17；文件声明字段变体：18。 RTTI：`0x100cf5170`。

</details>

<details>
<summary>SoulDeposit · 30%（3/10）</summary>

灵魂提交类型、摄像机与事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SoulDeposit 的原默认值、继承初始化及 14 个序列化字段变体；原注册字段 13 项。
- [ ] 灵魂提交类型、摄像机与事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：LensFlair（9 条引用）、Clump（9 条引用）、Marker（9 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 13 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：DayEnd（节点 3 / 嵌套 0）、StormEnd（节点 6 / 嵌套 0）。

原注册字段：13；文件声明字段变体：14。 RTTI：`0x100ce02d0`。

</details>

<details>
<summary>SoulTrap · 40%（4/10）</summary>

灵魂捕获物、几何与销毁事件。

原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SoulTrap 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 9 项。
- [ ] 灵魂捕获物、几何与销毁事件（部分完成）：原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。
- [ ] 依赖调用与事件：Clump（58 条引用）、Collectible（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。
- [x] 明确范围的原核心子链已独立核验：原 SoulTrap.Load、Darkstone/SoulTrap 池分配、子节点登记、完整普通 Darkstone.Initialize 和原 OBB 层级生成已独立核验。初始化真实 SoulTrap→Clump→LevelMesh 材质已接入 33 图 932 网格；近距离点火、颜色、缩退和消失已有编辑器交互预览。燃烧缩退仍是模拟，完整 Darkstone.Update／传播／奖励／联网、真实 Model 生命周期及卸载仍待接，完整类不计完成。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand2（节点 1 / 嵌套 0）、Dusk（节点 4 / 嵌套 0）、DuskGraveyard（节点 4 / 嵌套 0）、DuskMid（节点 4 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_Village（节点 3 / 嵌套 0）、Rain（节点 5 / 嵌套 0）、RainEnd（节点 4 / 嵌套 0）、RainForest（节点 4 / 嵌套 0）、RainMid（节点 14 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）、Storm（节点 1 / 嵌套 0）。

原注册字段：9；文件声明字段变体：9。 RTTI：`0x100c9f780`。

实现：[darkstone-runtime.ts](../src/core/darkstone-runtime.ts)、[darkstone-initialize-runtime.ts](../src/core/darkstone-initialize-runtime.ts)、[darkstone-hierarchy-runtime.ts](../src/core/darkstone-hierarchy-runtime.ts)、[darkstone-material.ts](../src/core/darkstone-material.ts)、[viewport-ignition.ts](../src/core/viewport-ignition.ts)、[ignition-controller.ts](../src/renderer/ignition-controller.ts)。

证据：[黑暗植物与生物加载续接.md](黑暗植物与生物加载续接.md)、[darkstone-oracle.json](darkstone-oracle.json)、[creature-plant-load-native.json](creature-plant-load-native.json)、[dark-plant-owner-dependencies.json](dark-plant-owner-dependencies.json)、[dark-plant-owner-native-discovery.json](dark-plant-owner-native-discovery.json)、[darkstone-initialize-oracle.json](darkstone-initialize-oracle.json)、[darkstone-hierarchy-oracle.json](darkstone-hierarchy-oracle.json)、[darkstone-material-gpu-check.json](darkstone-material-gpu-check.json)。

</details>

<details>
<summary>SoundEmitter · 30%（3/10）</summary>

声音实例、距离、方向与自动播放。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SoundEmitter 的原默认值、继承初始化及 27 个序列化字段变体；原注册字段 27 项。
- [ ] 声音实例、距离、方向与自动播放：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（202 条引用）、Marker（35 条引用）、Rail（5 条引用）、LevelMesh（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 27 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 5 / 嵌套 0）、Dawn（节点 41 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 3 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 14 / 嵌套 0）、Night（节点 43 / 嵌套 0）、NightEnd（节点 17 / 嵌套 0）、NightEntrance（节点 14 / 嵌套 0）、Prairie_ButterflyFields（节点 5 / 嵌套 0）、Prairie_Cave（节点 4 / 嵌套 0）、Prairie_Village（节点 24 / 嵌套 0）、Rain（节点 6 / 嵌套 0）、RainEnd（节点 15 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 15 / 嵌套 0）、SkyHub2（节点 14 / 嵌套 0）、Storm（节点 100 / 嵌套 0）、StormEnd（节点 8 / 嵌套 0）、Sunset（节点 8 / 嵌套 0）、SunsetEnd（节点 13 / 嵌套 0）、SunsetEnd2（节点 6 / 嵌套 0）、SunsetRace（节点 8 / 嵌套 0）。

原注册字段：27；文件声明字段变体：27。 RTTI：`0x100cfa460`。

</details>

<details>
<summary>SpawnMotes · 30%（3/10）</summary>

发射光点数量、速度与时长。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SpawnMotes 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 发射光点数量、速度与时长：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：MoteParams（76 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、DayEnd（节点 10 / 嵌套 0）、DayHubCave（节点 7 / 嵌套 0）、HubReveal（节点 5 / 嵌套 0）、Prairie_ButterflyFields（节点 27 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 8 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 8 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100ccb760`。

</details>

<details>
<summary>SpinMotes · 30%（3/10）</summary>

区域光点旋转、捕获与死亡。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SpinMotes 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 区域光点旋转、捕获与死亡：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（8 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_Village（节点 3 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100ccb950`。

</details>

<details>
<summary>SpiritSoulsDisplayLord · 30%（3/10）</summary>

灵魂进度、标记与显示事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SpiritSoulsDisplayLord 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 7 项。
- [ ] 灵魂进度、标记与显示事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：LevelMesh（1 条引用）、Clump（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpaceEnd（节点 1 / 嵌套 0）。

原注册字段：7；文件声明字段变体：8。 RTTI：`0x100cb34f0`。

</details>

<details>
<summary>Star · 30%（3/10）</summary>

星体收集、解锁与能量容量。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Star 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 星体收集、解锁与能量容量：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：LevelMesh（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Night（节点 1 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100c98540`。

</details>

<details>
<summary>StarFallShower · 30%（3/10）</summary>

流星发射、颜色、轨道与范围。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：StarFallShower 的原默认值、继承初始化及 13 个序列化字段变体；原注册字段 12 项。
- [ ] 流星发射、颜色、轨道与范围：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（3 条引用）、Rail（3 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 2 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）。

原注册字段：12；文件声明字段变体：13。 RTTI：`0x100cc9510`。

</details>

<details>
<summary>StarFragment · 30%（3/10）</summary>

星体碎片实例与收集事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：StarFragment 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 5 项。
- [ ] 星体碎片实例与收集事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：StarFragmentParams（38 条引用）、SoulTrap（3 条引用）、Emitter（1 条引用）、Clump（4 条引用）、CameraGuide（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand（节点 3 / 嵌套 0）、CarryLand2（节点 7 / 嵌套 0）、CarryLand3（节点 6 / 嵌套 0）、Dawn（节点 2 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 11 / 嵌套 0）、Prairie_Cave（节点 13 / 嵌套 0）、Prairie_NestAndKeeper（节点 17 / 嵌套 0）、Prairie_Village（节点 26 / 嵌套 0）。

原注册字段：5；文件声明字段变体：5。 RTTI：`0x100cfbf20`。

</details>

<details>
<summary>StarFragmentParams · 30%（3/10）</summary>

碎片飞行、跟随、携带与人数条件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：StarFragmentParams 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 11 项。
- [ ] 碎片飞行、跟随、携带与人数条件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（17 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 11 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand（节点 3 / 嵌套 0）、CarryLand2（节点 3 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 3 / 嵌套 0）、Prairie_NestAndKeeper（节点 3 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）。

原注册字段：11；文件声明字段变体：11。 RTTI：`0x100cfbe00`。

</details>

<details>
<summary>StarFragmentsConverge · 30%（3/10）</summary>

碎片汇聚、传送与完成事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：StarFragmentsConverge 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 碎片汇聚、传送与完成事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（12 条引用）、CameraKeyFrame（7 条引用）、WorldQuest（9 条引用）、LevelMesh（9 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100cfc180`。

</details>

<details>
<summary>StopGrinding · 30%（3/10）</summary>

停止轨道运动并关联动画。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：StopGrinding 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 停止轨道运动并关联动画：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：DuskGraveyard（节点 2 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100cd9470`。

</details>

<details>
<summary>StormKeyUnlock · 30%（3/10）</summary>

风暴钥匙解锁结果。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：StormKeyUnlock 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 风暴钥匙解锁结果：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）、OnLevelUp（5 条引用）、Timeline（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：DayEnd（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c97c90`。

</details>

<details>
<summary>StreamLevelLink · 30%（3/10）</summary>

带轨道、门槛和场景引导的地图连接。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：StreamLevelLink 的原默认值、继承初始化及 18 个序列化字段变体；原注册字段 18 项。
- [ ] 带轨道、门槛和场景引导的地图连接：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：BirdFlock（1 条引用）、Rail（2 条引用）、MeditationArea（1 条引用）、Marker（1 条引用）、Clump（1 条引用）、LevelLink（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 18 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_ButterflyFields（节点 1 / 嵌套 0）。

原注册字段：18；文件声明字段变体：18。 RTTI：`0x100cfef60`。

</details>

<details>
<summary>StrobeObject · 30%（3/10）</summary>

对象闪烁、时长与结束状态。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：StrobeObject 的原默认值、继承初始化及 19 个序列化字段变体；原注册字段 18 项。
- [ ] 对象闪烁、时长与结束状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（22 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 18 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 6 / 嵌套 0）、Prairie_NestAndKeeper（节点 3 / 嵌套 0）、SkyHub2（节点 3 / 嵌套 0）。

原注册字段：18；文件声明字段变体：19。 RTTI：`0x100d014b0`。

</details>

<details>
<summary>Survey · 30%（3/10）</summary>

问卷入口。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Survey 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 问卷入口：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpaceEnd（节点 1 / 嵌套 0）、Dawn（节点 2 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、DayHubCave（节点 1 / 嵌套 0）、Dusk（节点 2 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainEnd（节点 2 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 2 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Storm（节点 2 / 嵌套 0）、Sunset（节点 2 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100d01b60`。

</details>

<details>
<summary>SwapMoteParams · 30%（3/10）</summary>

光点参数在区域与阶段间切换。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：SwapMoteParams 的原默认值、继承初始化及 5 个序列化字段变体；原注册字段 4 项。
- [ ] 光点参数在区域与阶段间切换：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（14 条引用）、MoteParams（14 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 4 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Prairie_ButterflyFields（节点 13 / 嵌套 0）、Rain（节点 1 / 嵌套 0）。

原注册字段：4；文件声明字段变体：5。 RTTI：`0x100ccb570`。

</details>

<details>
<summary>TerrainBlob · 40%（4/10）</summary>

地形密度形状、噪声与侵蚀参数。

原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：TerrainBlob 的原默认值、继承初始化及 44 个序列化字段变体；原注册字段 44 项。
- [ ] 地形密度形状、噪声与侵蚀参数（部分完成）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] 依赖调用与事件（部分完成）：Rail（54 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 44 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [x] 明确范围的原核心子链已独立核验：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] 完整类行为、事件及依赖调用（部分完成，未计分）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复（部分完成，未计分）：原普通分配/placement 构造和明确直接操作子链新增原指令对照：16924组69862272字节零差异，含7174 TerrainBlob、987 CameraKeyFrame和270 Parent 的准备调用。构造保留未写保存字段；完整 TGCL 缺字段 default/cache、Barn/启动未恢复。TerrainBlob 共用原矩阵乘法与原16角点AABB，保留第四lane初值0、NaN保留和alias；其局部OBB为明确准备输入，不代表shape/rail生成/重新烘焙。CameraKeyFrame原矩阵/fov/pan/震动初始化和HotDate保留，原CameraSystem调度未闭合；Parent只有原构造/启用叶函数，父子跟随/关节和Barn排序更新未恢复。共用live原地址endpoint；完整类/实例未验收。
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 3 / 嵌套 0）、CarryLand（节点 3 / 嵌套 0）、CarryLand2（节点 3 / 嵌套 0）、CarryLand3（节点 6 / 嵌套 0）、Dawn（节点 268 / 嵌套 0）、DayEnd（节点 284 / 嵌套 0）、DayHubCave（节点 147 / 嵌套 0）、Dusk（节点 125 / 嵌套 0）、DuskGraveyard（节点 355 / 嵌套 0）、DuskMid（节点 139 / 嵌套 0）、Dusk_CrabField（节点 236 / 嵌套 0）、HubReveal（节点 296 / 嵌套 0）、Night（节点 134 / 嵌套 0）、NightEnd（节点 37 / 嵌套 0）、NightEntrance（节点 36 / 嵌套 0）、Prairie_ButterflyFields（节点 437 / 嵌套 0）、Prairie_Cave（节点 769 / 嵌套 0）、Prairie_NestAndKeeper（节点 266 / 嵌套 0）、Prairie_Village（节点 488 / 嵌套 0）、Rain（节点 536 / 嵌套 0）、RainEnd（节点 431 / 嵌套 0）、RainForest（节点 310 / 嵌套 0）、RainMid（节点 255 / 嵌套 0）、SkyHub2（节点 320 / 嵌套 0）、Storm（节点 157 / 嵌套 0）、StormEnd（节点 58 / 嵌套 0）、Sunset（节点 306 / 嵌套 0）、SunsetEnd（节点 190 / 嵌套 0）、SunsetEnd2（节点 191 / 嵌套 0）、SunsetRace（节点 351 / 嵌套 0）、TitleWater（节点 36 / 嵌套 0）。

原注册字段：44；文件声明字段变体：44。 RTTI：`0x100d04d40`。

实现：[scene-foundation-runtime.ts](../src/core/scene-foundation-runtime.ts)。

证据：[Beamo全LOD上传与基础类推进.md](Beamo全LOD上传与基础类推进.md)、[scene-foundation-native.json](scene-foundation-native.json)、[scene-foundation-oracle.json](scene-foundation-oracle.json)、[scene-foundation-native.json.gz](../tests/fixtures/scene-foundation-native.json.gz)。

</details>

<details>
<summary>TerrainBlobGroup · 30%（3/10）</summary>

地形对象集合、网格生成与细分配置。

已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：TerrainBlobGroup 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 16 项。
- [ ] 地形对象集合、网格生成与细分配置：已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。
- [ ] 依赖调用与事件：Clump（134 条引用）
- [ ] 实际场景与功能接入（部分完成）：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 16 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入（部分完成，未计分）：已有 BST GUID 与实际地形记录关联；完整 Blob/Group/Prefab 加载、生成、事件和碰撞重建待恢复。
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 1 / 嵌套 0）、CandleSpaceEnd（节点 1 / 嵌套 0）、CarryLand（节点 2 / 嵌套 0）、CarryLand2（节点 2 / 嵌套 0）、CarryLand3（节点 2 / 嵌套 0）、Dawn（节点 3 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、DayHubCave（节点 2 / 嵌套 0）、Dusk（节点 3 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、DuskMid（节点 4 / 嵌套 0）、Dusk_CrabField（节点 5 / 嵌套 0）、HubReveal（节点 5 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 7 / 嵌套 0）、Prairie_Cave（节点 6 / 嵌套 0）、Prairie_NestAndKeeper（节点 5 / 嵌套 0）、Prairie_Village（节点 5 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、RainEnd（节点 5 / 嵌套 0）、RainForest（节点 3 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、SkyHub2（节点 4 / 嵌套 0）、Storm（节点 3 / 嵌套 0）、StormEnd（节点 3 / 嵌套 0）、Sunset（节点 5 / 嵌套 0）、SunsetEnd（节点 6 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）、SunsetRace（节点 7 / 嵌套 0）、TitleWater（节点 2 / 嵌套 0）。

原注册字段：16；文件声明字段变体：15。 RTTI：`0x100d05090`。

证据：[BstBaked数据段清单.md](BstBaked数据段清单.md)。

</details>

<details>
<summary>TerrainBlobPrefab · 30%（3/10）</summary>

地形预制资源、变换与生成顺序。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：TerrainBlobPrefab 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 7 项。
- [ ] 地形预制资源、变换与生成顺序：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 7 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand（节点 3 / 嵌套 0）、CarryLand2（节点 3 / 嵌套 0）、CarryLand3（节点 3 / 嵌套 0）、DayHubCave（节点 3 / 嵌套 0）、Dusk（节点 18 / 嵌套 0）、DuskGraveyard（节点 27 / 嵌套 0）、DuskMid（节点 46 / 嵌套 0）、Dusk_CrabField（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、NightEntrance（节点 9 / 嵌套 0）、Prairie_ButterflyFields（节点 24 / 嵌套 0）、Prairie_Cave（节点 21 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 37 / 嵌套 0）、RainEnd（节点 4 / 嵌套 0）、RainForest（节点 46 / 嵌套 0）、RainMid（节点 41 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Sunset（节点 25 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：7；文件声明字段变体：7。 RTTI：`0x100d04e70`。

</details>

<details>
<summary>Timeline · 30%（3/10）</summary>

时间轴对象和时间节点调度。

293 个节点已清点；原时间推进、循环、暂停和事件派发顺序待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Timeline 的原默认值、继承初始化及 8 个序列化字段变体；原注册字段 8 项。
- [ ] 时间轴对象和时间节点调度：293 个节点已清点；原时间推进、循环、暂停和事件派发顺序待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。
- [ ] 依赖调用与事件：Clump（304 条引用）、Enable（970 条引用）、SnapToCam（671 条引用）、Unlock（13 条引用）、SetRender（9 条引用）、SoundEmitter（74 条引用）、Delay（21 条引用）、TransformObject（159 条引用）、AvatarChargeEnergy（2 条引用）、PlayAvatarAnimSeq（36 条引用）、AvatarSetStance（10 条引用）、SetMusicVolume（6 条引用）、PlaySound2D（75 条引用）、AvatarSetInnerGlow（6 条引用）、SetFlame（27 条引用）、ShowHUDTimed（69 条引用）、NetFlag（21 条引用）、AvatarGrindToPos（26 条引用）、SetInputState（30 条引用）、MoveObjectAlongRail（40 条引用）、LockAllCollectible（1 条引用）、AvatarHijack（8 条引用）、AvatarSetPos（19 条引用）、DialogHint（32 条引用）、ResetAllStormKeyProgress（1 条引用）、SetMeshShaderParam（241 条引用）、PlayMusic（54 条引用）、OutfitSelect（6 条引用）、PlayAnimation（153 条引用）、Survey（1 条引用）、DisplayText（18 条引用）、ChangeLevelWithFade（2 条引用）、DoShout（52 条引用）、PlaySound3D（23 条引用）、DropOcclusion（2 条引用）、SetCameraShake（5 条引用）、AvatarSetCandleState（3 条引用）、SetCameraKeyFrameShake（10 条引用）、TutorialNode（7 条引用）、Checkpoint（44 条引用）、Parent（10 条引用）、EventSeries（4 条引用）、StrobeObject（3 条引用）、DisableDpad（2 条引用）、SetMixChannelVolume（15 条引用）、DebugLogline（1 条引用）、AvatarSetEnergyCapacity（8 条引用）、DisableStep（2 条引用）、StarFallShower（2 条引用）、AvatarSetEnergy（4 条引用）、SetTutorialMode（3 条引用）、IfInRegion（8 条引用）、DisableJump（1 条引用）、IfTweakVar（2 条引用）、DisplayTitleCard（4 条引用）、Rail（2 条引用）、OnCollected（1 条引用）、CollectCollectible（3 条引用）、StormKeyUnlock（1 条引用）、SetFloat（2 条引用）、Npc_PlayAnim（43 条引用）、AwakenDarkCreatures（6 条引用）、SetDarkCreaturesNetworked（3 条引用）、OnUnlocked（4 条引用）、Collectible（1 条引用）、Replay（3 条引用）、OnDemoMode（1 条引用）、Replay_PlayAnim（4 条引用）、Npc_SetScale（9 条引用）、AncientSpirit（1 条引用）、OnRegion（2 条引用）、NotOnRegion（1 条引用）、SetSoundParameter（5 条引用）、MakeFloaty（1 条引用）、FireTriggerAtRandom（4 条引用）、Npc_Teleport（12 条引用）、OnShout（2 条引用）、SetAvatarRender（13 条引用）、LevelMesh（1 条引用）、IfEnabled（13 条引用）、SpinMotes（6 条引用）、OnFloat（20 条引用）、Critter_Shout（21 条引用）、BirdV2ParamSwap（15 条引用）、AttachGuideRail（10 条引用）、EnableCollision（4 条引用）、SetRainParams（5 条引用）、Npc_TakeOutFlame（1 条引用）、Replay_HandHold（1 条引用）、SwapMoteParams（1 条引用）、FloatAdd（3 条引用）、OnBetaMode（1 条引用）、Wind（3 条引用）、Npc_Turn（2 条引用）、Npc_Chat（2 条引用）、Npc_GetAttention（1 条引用）、FireWorkShow（2 条引用）、OnBubbleButton（1 条引用）、AncestorEngine（1 条引用）、Npc_Prompt（1 条引用）、SetWind（1 条引用）、SetAvatarMinYSpeed（1 条引用）、OnAvatarOnGround（1 条引用）、Npc_Reflect（1 条引用）、ScoreRaceCollectibles（1 条引用）、DistributeSpiritCollectibles（2 条引用）、DistributeRaceCollectibles（1 条引用）、ExitRace（1 条引用）、FadeSound（5 条引用）、NetSetMatchmakingDisabled（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 8 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：293 个节点已清点；原时间推进、循环、暂停和事件派发顺序待恢复。 本轮共享TGCL字段子链含12个该类真实字段样本（总报告417组、0差异）；原ReadFields/ReadString及引用修复区间已核验，metadata匹配/默认缓存准备、数组构造和实际创建/注册仍待闭合，真实样本引用保留待解析。此证据仅计部分装载，不表示完整类或玩法运行。
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 6 / 嵌套 0）、CandleSpaceEnd（节点 11 / 嵌套 0）、Dawn（节点 51 / 嵌套 0）、DayEnd（节点 9 / 嵌套 0）、DayHubCave（节点 3 / 嵌套 0）、Dusk（节点 6 / 嵌套 0）、DuskGraveyard（节点 5 / 嵌套 0）、DuskMid（节点 6 / 嵌套 0）、Dusk_CrabField（节点 2 / 嵌套 0）、HubReveal（节点 15 / 嵌套 0）、Night（节点 10 / 嵌套 0）、NightEnd（节点 21 / 嵌套 0）、NightEntrance（节点 3 / 嵌套 0）、Prairie_ButterflyFields（节点 6 / 嵌套 0）、Prairie_Cave（节点 6 / 嵌套 0）、Prairie_NestAndKeeper（节点 4 / 嵌套 0）、Prairie_Village（节点 26 / 嵌套 0）、Rain（节点 21 / 嵌套 0）、RainEnd（节点 8 / 嵌套 0）、RainForest（节点 5 / 嵌套 0）、RainMid（节点 16 / 嵌套 0）、SkyHub2（节点 20 / 嵌套 0）、Storm（节点 8 / 嵌套 0）、StormEnd（节点 9 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 8 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）、SunsetRace（节点 2 / 嵌套 0）、TitleWater（节点 1 / 嵌套 0）。

原注册字段：8；文件声明字段变体：8。 RTTI：`0x100d05770`。

实现：[tgcl-field-runtime.ts](../src/core/tgcl-field-runtime.ts)、[native-string-runtime.ts](../src/core/native-string-runtime.ts)。

证据：[tgcl-field-oracle.json](tgcl-field-oracle.json)、[TGCL字段装载与引用修复逆向.md](TGCL字段装载与引用修复逆向.md)。

</details>

<details>
<summary>TimelineNode · 30%（3/10）</summary>

时间轴时间与目标对象声明。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：TimelineNode 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 2 项。
- [ ] 时间轴时间与目标对象声明：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CandleSpace（节点 0 / 嵌套 0）、CandleSpaceEnd（节点 0 / 嵌套 0）、Dawn（节点 0 / 嵌套 0）、DayEnd（节点 0 / 嵌套 0）、DayHubCave（节点 0 / 嵌套 0）、Dusk（节点 0 / 嵌套 0）、DuskGraveyard（节点 0 / 嵌套 0）、DuskMid（节点 0 / 嵌套 0）、Dusk_CrabField（节点 0 / 嵌套 0）、HubReveal（节点 0 / 嵌套 0）、Night（节点 0 / 嵌套 0）、NightEnd（节点 0 / 嵌套 0）、NightEntrance（节点 0 / 嵌套 0）、Prairie_ButterflyFields（节点 0 / 嵌套 0）、Prairie_Cave（节点 0 / 嵌套 0）、Prairie_NestAndKeeper（节点 0 / 嵌套 0）、Prairie_Village（节点 0 / 嵌套 0）、Rain（节点 0 / 嵌套 0）、RainEnd（节点 0 / 嵌套 0）、RainForest（节点 0 / 嵌套 0）、RainMid（节点 0 / 嵌套 0）、SkyHub2（节点 0 / 嵌套 0）、Storm（节点 0 / 嵌套 0）、StormEnd（节点 0 / 嵌套 0）、Sunset（节点 0 / 嵌套 0）、SunsetEnd（节点 0 / 嵌套 0）、SunsetEnd2（节点 0 / 嵌套 0）、SunsetRace（节点 0 / 嵌套 0）、TitleWater（节点 0 / 嵌套 0）。

原注册字段：2；文件声明字段变体：2。 RTTI：`0x100d05660`。

</details>

<details>
<summary>TitleGate · 20%（2/10）</summary>

标题流程门控。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：TitleGate 的原默认值、继承初始化及 1 个序列化字段变体；原注册字段 0 项。
- [ ] 标题流程门控：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [ ] 此类原字段注册证据已提取（部分完成，未计分）：已有 RTTI 类型地址；此类字段注册证据尚未完整提取。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：TitleWater（节点 1 / 嵌套 0）。

原注册字段：0；文件声明字段变体：1。 RTTI：`0x100c927f0`。

</details>

<details>
<summary>TrackAvatarOnRail · 30%（3/10）</summary>

按玩家位置跟踪轨道对象。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：TrackAvatarOnRail 的原默认值、继承初始化及 7 个序列化字段变体；原注册字段 6 项。
- [ ] 按玩家位置跟踪轨道对象：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（8 条引用）、Rail（7 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 6 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand2（节点 2 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Village（节点 3 / 嵌套 0）。

原注册字段：6；文件声明字段变体：7。 RTTI：`0x100cccb90`。

</details>

<details>
<summary>TransformObject · 40%（4/10）</summary>

对象变换目标、过渡与完成事件。

原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：TransformObject 的原默认值、继承初始化及 22 个序列化字段变体；原注册字段 21 项。
- [ ] 对象变换目标、过渡与完成事件（部分完成）：原216-byte placement、OnLevelLoad/OnStart快照、OnEnable/OnResumeEnabled/GetResumeEnabled/OnStop、有限普通与continuous Update和完成事件接上原单EventDispatch及ObjectFactory Matrix4/启用反射。695组、5102完整内存快照、380591888字节原机器码0差异；全部317真实根配置中91跑完设定有限序列，198未知类及28音效依赖阻断；3个真实Timeline配置先停在未知类处。5原断言及合成stepped前置阻断单列。264多轴旋转样本、两层平滑、stagger/reverse、firstUpdateSkip、captured/live目标、恢复和完成请求/序列通过。Heap/注册表/保存字段及cast/转换为服务，libm仅Linux位模式回放；完整TGCL/默认缓存、audio/stepped/真实Timeline/LevelMesh等目标、完整场景与Avatar/BstBaked生命周期及Windows/原游戏验收仍待闭合，完整类/实例保持0。 LevelMesh/Model连接本轮887组、8322完整快照、636011224字节0差异；真实317根中250有限序列通过，12未接入类、52音效、3Timeline阻断，加载前状态与完整原场景验收分列。 地图内显式TransformObject播放已接入恢复内核/原单Event dispatch与Marker/LevelMesh矩阵，246/317配置满足当前依赖；暂停/停止还原、编辑/切图清理单列。浏览器math/准备分配、加载前null Model与编辑器绘制为明确输入；其他完成目标/音效/Timeline/完整场景仍待闭合，不能计完整类/实例验收。 最新原EventBarn完整Update/排序接回TransformObject完成请求：RainEnd/StormEnd五个真实根，320帧完整准备状态、11104768字节0差异；四个结构循环根的共享事件状态、零时长同帧完成及重启通过。已加载编辑器初始快照、槽顺序/metadata、Heap/scratch/GameTime及Linux libm为明确输入/服务，不能代替完整原创建/场景加载。地图播放支持后续TransformObject接力、循环暂停与整体还原，原Model/GPU/碰撞/音效/其他完成目标继续闭合。 本轮Enable/IfEnabled/Delay与嵌套Clump接入统一地图播放及原EventBarn完整Update/排序、首帧load/enable/update/finish：301组（293真实根、8合成混合链）、7525帧、263925600比较字节0差异。33图四类540配置满足字段/依赖预检，另须模型已加载；每根25帧有限核验，不称全部Delay已结束。Clump无聚合GetEnabled默认true、Delay原时间钳制、Marker保存enabled和LevelMesh启用转发保留。停止还原矩阵/可见性，编辑/模式/切图清理；metadata/保存字段/槽顺序/Heap/GameTime和Linux libm为准备输入/服务，真实Model仍prepared null，完整原类/实例验收保持0。 2026-11-20数值地图播放续接：FloatAdd/FloatMult/SetFloat与原EventBarn、对象组/延迟/条件、共享Float和后续TransformObject同链运行；362组、9146帧、307419512比较字节原机器码0差异，含342真实根与20组准备输入，全部31/14/4真实数值配置。33图七类589配置满足依赖预检。停止恢复保存值/矩阵，暂停及编辑/模式/切图清理；原Model仍prepared null，logf/expf为核验服务、JS Math仅预览，完整原类/实例保持0。 2026-11-20条件地图续接：OnFloat/FloatSplit加入统一播放，保留原比较/双侧嵌套求值、短字符串、原始反转字节、BODY条件指针/Object分支指针、独立结束请求及共享Float分段别名写序。396组、9676帧、323130696比较字节0差异，349真实根和47准备输入分列；新增3 OnFloat、全部2 FloatSplit及2 Delay真实根。33图九类596配置通过依赖预检。准备DayHubCave数值达到0.35后触发0.5秒Delay再变换原平台，15字段修改记录；相机矩阵与渲染对象帧对齐截图、暂停/还原/模式切图检查通过。debug输出/长字符串池/同步条件求值循环显式阻断。原材质非有限RGB错误未修复，Model/GPU/Avatar/完整场景及Windows验收仍缺，完整类/实例0不变。
- [ ] 依赖调用与事件（部分完成）：Marker（216 条引用）、Clump（344 条引用）、LevelMesh（91 条引用）、Timeline（3 条引用）、Float（45 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 3 / 嵌套 0）、CandleSpaceEnd（节点 11 / 嵌套 0）、Dawn（节点 25 / 嵌套 0）、DayEnd（节点 5 / 嵌套 0）、DayHubCave（节点 19 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 6 / 嵌套 0）、DuskMid（节点 7 / 嵌套 0）、Dusk_CrabField（节点 4 / 嵌套 0）、HubReveal（节点 10 / 嵌套 0）、Night（节点 49 / 嵌套 0）、NightEnd（节点 2 / 嵌套 0）、NightEntrance（节点 16 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_Village（节点 14 / 嵌套 0）、Rain（节点 16 / 嵌套 0）、RainEnd（节点 48 / 嵌套 0）、RainMid（节点 37 / 嵌套 0）、SkyHub2（节点 13 / 嵌套 0）、Storm（节点 3 / 嵌套 0）、StormEnd（节点 5 / 嵌套 0）、Sunset（节点 7 / 嵌套 0）、SunsetEnd（节点 4 / 嵌套 0）、SunsetEnd2（节点 4 / 嵌套 0）、SunsetRace（节点 6 / 嵌套 0）。

原注册字段：21；文件声明字段变体：22。 RTTI：`0x100d06d70`。

实现：[transform-object-runtime.ts](../src/core/transform-object-runtime.ts)、[object-transform-runtime.ts](../src/core/object-transform-runtime.ts)、[event-barn-runtime.ts](../src/core/event-barn-runtime.ts)、[event-start-runtime.ts](../src/core/event-start-runtime.ts)、[transform-object-preview.ts](../src/core/transform-object-preview.ts)、[object-playback-plan.ts](../src/core/object-playback-plan.ts)。

证据：[TransformObject变换与完成事件逆向.md](TransformObject变换与完成事件逆向.md)、[transform-object-native.json](transform-object-native.json)、[transform-object-oracle.json](transform-object-oracle.json)、[transform-object-native.json.gz](../tests/fixtures/transform-object-native.json.gz)、[LevelMesh变换与Model状态连接逆向.md](LevelMesh变换与Model状态连接逆向.md)、[Objects对象变换地图播放.md](Objects对象变换地图播放.md)、[transform-preview-availability.json](transform-preview-availability.json)、[transform-object-preview-smoke.json](transform-object-preview-smoke.json)、[Objects完成事件与循环变换地图播放.md](Objects完成事件与循环变换地图播放.md)、[transform-sequence-oracle.json](transform-sequence-oracle.json)、[transform-sequence-verification.json](transform-sequence-verification.json)、[Objects对象组启用延迟与条件地图播放.md](Objects对象组启用延迟与条件地图播放.md)、[object-logic-preview-oracle.json](object-logic-preview-oracle.json)、[object-logic-preview-availability.json](object-logic-preview-availability.json)、[object-logic-preview-smoke.json](object-logic-preview-smoke.json)、[object-logic-preview-verification.json](object-logic-preview-verification.json)、[object-logic-preview-native.json.gz](../tests/fixtures/object-logic-preview-native.json.gz)、[Objects数值与平滑控制地图播放.md](Objects数值与平滑控制地图播放.md)、[numeric-map-preview-oracle.json](numeric-map-preview-oracle.json)、[numeric-map-preview-smoke.json](numeric-map-preview-smoke.json)、[set-float-map-preview-oracle.json](set-float-map-preview-oracle.json)、[set-float-map-preview-availability.json](set-float-map-preview-availability.json)、[set-float-map-preview-native.json.gz](../tests/fixtures/set-float-map-preview-native.json.gz)、[set-float-map-preview-smoke.json](set-float-map-preview-smoke.json)、[set-float-map-preview-material-boundary.json](set-float-map-preview-material-boundary.json)、[set-float-map-preview-before.png](set-float-map-preview-before.png)、[set-float-map-preview-moving.png](set-float-map-preview-moving.png)、[Objects条件与分段数值地图播放.md](Objects条件与分段数值地图播放.md)、[float-condition-map-preview-oracle.json](float-condition-map-preview-oracle.json)、[float-condition-map-preview-availability.json](float-condition-map-preview-availability.json)、[float-condition-map-preview-smoke.json](float-condition-map-preview-smoke.json)、[float-condition-map-preview-screenshot-check.json](float-condition-map-preview-screenshot-check.json)、[float-condition-map-preview-verification.json](float-condition-map-preview-verification.json)、[float-condition-map-preview-native.json.gz](../tests/fixtures/float-condition-map-preview-native.json.gz)、[float-condition-map-preview-before.png](float-condition-map-preview-before.png)、[float-condition-map-preview-moving.png](float-condition-map-preview-moving.png)、[transform-object-level-mesh-oracle.json](transform-object-level-mesh-oracle.json)。

</details>

<details>
<summary>Turret · 30%（3/10）</summary>

机关眼部、光束与转动参数。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Turret 的原默认值、继承初始化及 6 个序列化字段变体；原注册字段 5 项。
- [ ] 机关眼部、光束与转动参数：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）、Marker（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 5 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Storm（节点 1 / 嵌套 0）。

原注册字段：5；文件声明字段变体：6。 RTTI：`0x100cdcfb0`。

</details>

<details>
<summary>TutorialNode · 30%（3/10）</summary>

教程步骤、目标、拖动与行走事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：TutorialNode 的原默认值、继承初始化及 11 个序列化字段变体；原注册字段 10 项。
- [ ] 教程步骤、目标、拖动与行走事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（24 条引用）、Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 10 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 15 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、HubReveal（节点 4 / 嵌套 0）、Prairie_Cave（节点 3 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）。

原注册字段：10；文件声明字段变体：11。 RTTI：`0x100c25bc0`。

</details>

<details>
<summary>Tweener · 30%（3/10）</summary>

属性与变换补间控制。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Tweener 的原默认值、继承初始化及 46 个序列化字段变体；原注册字段 45 项。
- [ ] 属性与变换补间控制：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（6 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 45 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：NightEnd（节点 3 / 嵌套 0）、Storm（节点 3 / 嵌套 0）。

原注册字段：45；文件声明字段变体：46。 RTTI：`0x100d09f80`。

</details>

<details>
<summary>UIInterestMask · 30%（3/10）</summary>

界面关注区域标记。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：UIInterestMask 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 1 项。
- [ ] 界面关注区域标记：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Marker（2 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：SkyHub2（节点 2 / 嵌套 0）。

原注册字段：1；文件声明字段变体：2。 RTTI：`0x100ce2820`。

</details>

<details>
<summary>Unlock · 30%（3/10）</summary>

命名解锁与确认事件。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Unlock 的原默认值、继承初始化及 4 个序列化字段变体；原注册字段 3 项。
- [ ] 命名解锁与确认事件：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：CandleSpace（节点 4 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、HubReveal（节点 3 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、SkyHub2（节点 13 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）。

原注册字段：3；文件声明字段变体：4。 RTTI：`0x100c97b80`。

</details>

<details>
<summary>Water · 30%（3/10）</summary>

水面空间与阴影配置。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Water 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 2 项。
- [ ] 水面空间与阴影配置：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 3 / 嵌套 0）、DuskMid（节点 5 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_Cave（节点 4 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 3 / 嵌套 0）、RainEnd（节点 5 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 3 / 嵌套 0）、SkyHub2（节点 2 / 嵌套 0）、Storm（节点 4 / 嵌套 0）、StormEnd（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：2。 RTTI：`0x100cd3670`。

</details>

<details>
<summary>Waypoint · 30%（3/10）</summary>

导航点与范围。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：Waypoint 的原默认值、继承初始化及 3 个序列化字段变体；原注册字段 3 项。
- [ ] 导航点与范围：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：当前无非空序列化依赖；原虚方法、资源或全局调用仍需恢复。
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

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

地图：DayHubCave（节点 9 / 嵌套 0）。

原注册字段：3；文件声明字段变体：3。 RTTI：`0x100d0ee20`。

</details>

<details>
<summary>Wind · 40%（4/10）</summary>

区域、轨道与附加标记的风场。

范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造（部分完成）：Wind 的原默认值、继承初始化及 12 个序列化字段变体；原注册字段 12 项。
- [ ] 区域、轨道与附加标记的风场（部分完成）：范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。
- [ ] 依赖调用与事件：Rail（26 条引用）、Clump（4 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 12 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值（部分完成，未计分）：范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。
- [ ] 完整加载、注册与启用传播（部分完成，未计分）：范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。
- [x] 明确范围的原核心子链已独立核验：范围采样、聚合、计时及正常 Rail 调用的明确子链已核验；原启用事件、完整风场和云/玩家来源待闭合。
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 7 / 嵌套 0）、DayEnd（节点 3 / 嵌套 0）、Dusk（节点 7 / 嵌套 0）、DuskGraveyard（节点 2 / 嵌套 0）、DuskMid（节点 17 / 嵌套 0）、Dusk_CrabField（节点 3 / 嵌套 0）、HubReveal（节点 8 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 3 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 5 / 嵌套 0）、Prairie_Village（节点 9 / 嵌套 0）、Rain（节点 2 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 2 / 嵌套 0）、RainMid（节点 4 / 嵌套 0）、SkyHub2（节点 10 / 嵌套 0）、Storm（节点 6 / 嵌套 0）、StormEnd（节点 7 / 嵌套 0）、Sunset（节点 3 / 嵌套 0）、SunsetEnd（节点 9 / 嵌套 0）、SunsetEnd2（节点 5 / 嵌套 0）、SunsetRace（节点 4 / 嵌套 0）。

原注册字段：12；文件声明字段变体：12。 RTTI：`0x100cac8f0`。

实现：[environment-wind.ts](../src/core/environment-wind.ts)、[rail-level.ts](../src/core/rail-level.ts)。

证据：[Wind风场采样逆向.md](Wind风场采样逆向.md)、[environment-wind-oracle.json](environment-wind-oracle.json)、[wind-rail-oracle.json](wind-rail-oracle.json)。

</details>

<details>
<summary>WorldQuest · 30%（3/10）</summary>

世界任务、活动、加入与奖励状态。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：WorldQuest 的原默认值、继承初始化及 15 个序列化字段变体；原注册字段 15 项。
- [ ] 世界任务、活动、加入与奖励状态：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：FragmentCollectActivity（15 条引用）、MeditationArea（15 条引用）、Clump（23 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 15 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：CarryLand（节点 3 / 嵌套 0）、CarryLand2（节点 3 / 嵌套 0）、Dawn（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 2 / 嵌套 0）、Prairie_Cave（节点 2 / 嵌套 0）、Prairie_NestAndKeeper（节点 2 / 嵌套 0）、Prairie_Village（节点 2 / 嵌套 0）。

原注册字段：15；文件声明字段变体：15。 RTTI：`0x100cebb60`。

</details>

<details>
<summary>WorldQuestTable · 30%（3/10）</summary>

任务桌、菜单与地图连接。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：WorldQuestTable 的原默认值、继承初始化及 9 个序列化字段变体；原注册字段 9 项。
- [ ] 任务桌、菜单与地图连接：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：Clump（19 条引用）、Marker（19 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 9 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：Dawn（节点 1 / 嵌套 0）、DayEnd（节点 1 / 嵌套 0）、Dusk（节点 1 / 嵌套 0）、DuskGraveyard（节点 1 / 嵌套 0）、DuskMid（节点 1 / 嵌套 0）、HubReveal（节点 1 / 嵌套 0）、Night（节点 1 / 嵌套 0）、NightEnd（节点 1 / 嵌套 0）、NightEntrance（节点 1 / 嵌套 0）、Prairie_ButterflyFields（节点 1 / 嵌套 0）、Prairie_Cave（节点 1 / 嵌套 0）、Prairie_NestAndKeeper（节点 1 / 嵌套 0）、Prairie_Village（节点 1 / 嵌套 0）、Rain（节点 1 / 嵌套 0）、RainEnd（节点 1 / 嵌套 0）、RainForest（节点 1 / 嵌套 0）、RainMid（节点 1 / 嵌套 0）、SkyHub2（节点 1 / 嵌套 0）、Storm（节点 1 / 嵌套 0）、Sunset（节点 1 / 嵌套 0）、SunsetEnd（节点 1 / 嵌套 0）、SunsetEnd2（节点 1 / 嵌套 0）、SunsetRace（节点 1 / 嵌套 0）。

原注册字段：9；文件声明字段变体：9。 RTTI：`0x100cebc80`。

</details>

<details>
<summary>WorldQuestWorldAreaGateEffect · 30%（3/10）</summary>

世界任务区域门效果。

已完成格式、实例/引用清点和原字节回写；原默认值、加载启用、核心行为、事件/资源依赖、实际接入和生命周期仍待恢复。

功能实施项（不另改检查项分母）：

- [ ] 原输入与构造：WorldQuestWorldAreaGateEffect 的原默认值、继承初始化及 2 个序列化字段变体；原注册字段 2 项。
- [ ] 世界任务区域门效果：此功能完整分支、输出与边界行为待恢复；字段声明不代替原运行验证。
- [ ] 依赖调用与事件：LevelLink（1 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

- [x] 实际类声明、实例与引用清点：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 全地图解析和无修改逐字节回写：所有含此类声明/数据的真实地图均完整解析，引用有效且原样回写一致。
- [x] 此类原字段注册证据已提取：已提取 2 个原注册字段；此项表示字段证据，完整继承与缺字段默认值分别验收。
- [ ] 完整原构造与缺字段默认值
- [ ] 完整加载、注册与启用传播
- [ ] 明确范围的原核心子链已独立核验
- [ ] 完整类行为、事件及依赖调用
- [ ] 实际场景、绘制或游戏 UI 接入
- [ ] 切图、注销、销毁及状态恢复
- [ ] Windows 真机与原游戏验收

地图：SkyHub2（节点 1 / 嵌套 0）。

原注册字段：2；文件声明字段变体：2。 RTTI：`0x100cebfe0`。

</details>

重建命令：

```bash
npx tsx tools/objects-avatar-inventory.ts
```

现有 inventory 命令自动刷新逐类和逐对象清单；单独运行 tools/objects-class-progress.ts 也会刷新两套清单。生成器重新读取真实文件、校验全部引用/回写并核对既有节点清点；现代原机报告必须显式 passed=true，三种环境存储核心直接重放原输出 fixture 比较。每类部分状态与实现/证据由 tools/objects-class-progress-spec.json 维护。
