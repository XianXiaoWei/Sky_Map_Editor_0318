# 原引擎共享类的功能清单

2026-11-22 补充 RenderList：8 个完整原注册/注销/提交/图元计数/格式上下文入口，以及已有 Model、VertexRender 初始化/释放组合已独立核验。248 组明确准备输入、798 操作快照、26,291,400 字节零差异；主视口原 Scene 队列、分配/清帧/完整排序与 GPU 生命周期仍未接齐，不计为完整类，也不增加 Objects 声明类/实例分母。详见 [RenderList 本轮说明](RenderList原注册提交与生命周期推进.md) 和 [原对照](render-list-oracle.json)。

本页补充当前 Objects.level.bin 未声明、但原引擎实际注册并被其他类调用的基础类。与 283 个实际序列化声明类型分开统计，避免虚增地图类型、实例数量或平均进度。所列共享类当前没有序列化实例；原 RTTI 和字段注册证据来自原引擎。

| 单独类 | 原功能 | 本轮已核验范围 | 未完成运行依赖 |
| --- | --- | --- | --- |
| Event | 启用、启动顺序、事件身份、持久化和派发的基础状态 | 原基础构造、Start/Resume、身份/虚转发、SetEnabled 与 EventBarn 正常调度/加载/排序/释放 | metadata classId 来源、原自动继承回调、EventBarn 类型索引树/卸载切图/真机 |
| FloatEnable | 以 Float 输入决定对象集合的启用数量 | 有符号 int32 截断、每轮输入读取、Clump cast、逐对象 SetEnabled 和动态 count | 原 ObjectFactory、Get/SetEnabled 元数据方法、启用传播、自动调度、生命周期/真机 |

Event 每类实施项：

1. 原基础构造与分配字节：构造写入子链已核验，未写字节保留快照，classId 来源待恢复。
2. SetEnabled：完整原请求体已核验；真实 metadata 分发/继承虚方法仍待恢复。
3. Start 与身份：核心及 Barn 正常逐帧派发/两种排序已核验；日志/heap/虚回调服务明确，类型索引分配仍待恢复。
4. 连续驱动：FloatAdd/PlaySound2D 在原 EventBarn 内核验通过；实际场景自动创建、完整消费类仍待闭合。
5. 注销、切图与真机：待原游戏验收。

FloatEnable 每类实施项：

1. 原 input/objects 字段与构造：字段注册已定位，完整默认值/创建待恢复。
2. 动态集合启用：整个原驱动已核验，保留每轮输入和 count 读取顺序。
3. Get/SetEnabled 依赖：原反射方法定位与继承传播待恢复。
4. 场景接入：实际自动调度和反馈待恢复。
5. 注销、切图与真机：待原游戏验收。

依据：[原函数/常量定位](object-runtime-native.json)、[基础事件与数值核验](object-numeric-oracle.json)、[13 函数统一核验](object-batch-oracle.json)、[完整边界说明](数值类事件与依赖音效逆向.md)。核心子链通过不代替整个类的原运行验收。

EventBarn 为原引擎共享管理器。本批 1280 槽位正常 Update、OnLevelLoad、ReleaseAll、FindUniqueId 和渲染转发均有原机器码连续核验；原池初始化、类型索引树、CreateEvent、OnLevelUnload 与完整派生场景待恢复。它不增加本文件实际序列化类/对象分母。详见 [对象启用与 EventBarn](对象启用与EventBarn调度逆向.md)。

本次补充共享池内核，仍不增加 Objects 声明类/对象分母：

| 单独类 | 原功能 | 新已核验范围 | 未完成运行依赖 |
| --- | --- | --- | --- |
| CollisionGeo | 碰撞 geometry 实例注册、索引与池管理 | 整个正常 Remove 的范围断言、三次索引解除调度、live 字段读取、查找/末尾交换/free-list归还；77组/80754524字节零差异 | 完整注册/索引内核、碰撞查询/物理/world启动/真机 |
| ParentBarn | Parent 池分配、释放和更新顺序管理 | 128槽 Reset/Create/Release/ReleaseAll/HotDate/FindByTarget及Parent五节点解除；639组/21297516字节零差异 | TGCL/cache/地图启动、真实引用和关节、依赖排序/跟随更新、底层node pool/真机 |

依据：[本轮说明](Beamo包围盒材质分组与Parent池推进.md)、[原地址与布局](beamo-spatial-native.json)、[CollisionGeo原对照](collision-geo-remove-oracle.json)、[ParentBarn原对照](parent-barn-oracle.json)。
