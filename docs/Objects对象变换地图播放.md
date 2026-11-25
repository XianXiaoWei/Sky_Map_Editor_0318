# Objects 对象变换地图播放

地图内已接入显式TransformObject播放：位移、旋转、缩放、平滑、reverse、continuous及原两阶段状态继续使用已恢复内核，经原EventBarn Update/排序及单Event dispatch调用。停止还原、暂停、编辑和切图清理由编辑器协调，不自动调度autoStart。

使用：打开地图，进入bin编辑，在左侧选择TransformObject，点击右侧「播放对象变换」。可「暂停」「继续播放」「停止并还原」。CandleSpace的#327、Dawn的#156可用于检查；实际模型资源须已加载。播放矩阵只更新视口，不写入Objects或meshes；保存的仍是编辑字段。开始拖动编辑器变换控件或编辑字段时先还原播放。

33地图有317个该类配置，其中246个满足当前字段/引用/依赖条件。TransformObject完成请求可继续触发另一段变换，允许共享状态的循环；其余配置因音效、Timeline、未接空间类或其他完成目标显示原因并禁用播放。可用数量表示可进入限定变换子链，不表示所有这些对象已完成原场景验收。缺省字段不虚构；仅Marker与LevelMesh端点接入，Clump引用和Float进度值来自实际序列化字段。

核心见 [transform-object-preview.ts](../src/core/transform-object-preview.ts)，视口接入见 [app.ts](../src/renderer/app.ts)。独立分配、已序列化状态、类别查找与浏览器math是编辑器输入；LevelMesh的原Model指针为prepared加载前null，渲染使用已有编辑器资源网格。原TransformObject内核/LevelMesh矩阵接口/单Event dispatch已有完整原对照；11个真实根的播放矩阵从原fixture全内存SHA核对后提取，在新协调器中以明确浮点容差比较，不能计作另一批独立原机器码验收。

全场景触发及其他完成目标、真实metadata/default/资源加载、完整Model创建、GPU原绘制、动态碰撞、音效、Timeline和Avatar生命周期继续闭合。原类核心子链仍26，856/2830（30.25%）为清单比例，完整原类/实例仍0。地图内有限变换效果与完整原游戏效果分列。

[实际地图可用性](transform-preview-availability.json)、[Electron/Vulkan播放检查](transform-object-preview-smoke.json)、[首次播放核验](transform-preview-verification.json)、[最新接力核验](transform-sequence-verification.json)。
