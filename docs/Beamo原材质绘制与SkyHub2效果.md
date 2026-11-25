# Beamo 原材质绘制与 SkyHub2 效果

本批继续模型调用类的优先级：Beamo／BeamoDecal 的 LOD0 原上传结果已进入编辑器主视口，与 LevelMesh、地形、裙边和云使用同一 Vulkan 管线。这里只验收明确范围；完整 Model／Barn／场景生命周期、自动 LOD、Visibility 和原游戏画面仍待恢复，完整原类／实例计数保持 0。

## 几何、材质和透明绘制

`src/core/beamo-draw.ts` 使用已经独立核验的原 Beamo 上传内核，保留世界坐标的 48-byte 顶点、打包法线、两组 half UV、三组光照和 primary／secondary／alpha 索引区。烘焙接受继续分别采用 Beamo 和 BeamoDecal 的原规则；原 fallback 光照为明确能力输入。

`docs/beamo-rsqrt-capability.bin` 保存 2,087,452 个独立观测的 RSQRTSS 输入／输出对，来自此前 2,912,317 次原调用。未知输入仍直接阻断；不能用 JS 倒数平方根补齐。独立 SkyHub2 fixture 包含 189 个原 LOD0 观察，逐个比较原快照 SHA、顶点、索引区和材质关联，测试见 `tests/beamo-draw.test.ts`。

原材质沿 LevelMaterial 的 GUID 首匹配连接 shader 和贴图；LevelMaterial 与自定义 LevelMesh 的参数类型约定分开。新增六种已观测绘制组的深度、混合、剔除状态，包括 Blended／BlendedBackground／BlendedWithBackfaces。透明材质进入独立颜色／log-depth 附件并使用不透明深度；普通 HDR 保留原 RGBDepth。原状态见 `docs/model-render-state.json`，实际 Vulkan 附件、遮挡、深度写入、背面、resize／clear 共 14 项检查见 `docs/model-render-state-gpu-check.json`。

同材质的静态不透明／贴花 Beamo 合并上传，保留原字节和索引顺序；移动或隐藏的对象分别处理。透明对象按包围中心随相机调整远近顺序，这是编辑器适配器，未声称原 Scene sort 或 RenderList 所有权完成。独立 tests 覆盖合并、变换、隐藏以及透明次序。

## 编辑与显示帧

实际属性抽屉可修改 Beamo 变换及共享 LevelMaterial。材质修改复用未变化的原上传几何，重新解析当前 shader 和贴图；Beamo 自身字段修改仍重算上传。材质索引在场景提交时刷新，同一提交内复用，避免每个合并 owner 和每次 uniform 更新重建整个索引。

地图／撤销重建和共享材质批量更新期间，视口等待更新结束后提交完整场景，避免不断提交中间模型集合。已显示帧记录其提交的几何／材质纹理哈希，实际界面检查等到哈希与主进程当前绑定一致才验收。仅靠更大的帧号，会误把选择变化后的帧当成材质编辑结果；已修正这条检查。

`tools/beamo-edit-map-smoke.mjs` 检查 SkyHub2 #20 的 X 平移 +8、真实上传字节改变、撤销恢复、共享材质 #1959 的 StoneGrunge2→Black、原几何字节不变、撤销和切回 WorldEmpty 的清理。结果见 `docs/beamo-edit-map-smoke.json`；全过程不保存原地图。

全部 33 图的 4,133 个 LevelMesh 材质依赖预检已刷新：3,322 个满足当前依赖，其中 2,781 个保存状态允许初始显示；上一轮为 3,072／2,546。新增的 250 个来自本批绘制组接入。逐实例与阻断见 `docs/model-draw-availability.json`；这是依赖预检，未增加完整运行验收。

## SkyHub2

效果与逐绑定记录见 `docs/model-material-SkyHub2-smoke.json`。当前已有截图包含 182 个 Beamo／贴花实例，合并为 6 个绘制批次，另有 171 个 LevelMesh 批次和 20 个地形／裙边批次。总三角面为 336,284；这些数字只描述本机编辑器的静态绘制。

- [完整编辑器截图](model-material-SkyHub2.png)
- [原始渲染图](model-material-SkyHub2-render.png)
- [视口截图](model-material-SkyHub2-viewport.png)

目前 SkyHub2 的原平均 probe 全局参数、native skinning／animation、Skybox 及部分 Beamo 材质仍有明确阻断。外部 weight volumes、真实 ResourceManager IO、原 Model 构造、自动 LOD／Visibility、碰撞、Barn／GPU 所有权、完整卸载和重烘焙、原 Metal／Windows 真机仍待闭合。Avatar 的已有滑移／相机证据保留，本批不增加其完整运行验收。

最终验证和开发文件同步收据见 `docs/beamo-draw-verification.json`。类／实例清单只补明确证据，不用静态绘制扩大完整类或实例计数；原地图、Mesh 和 reference 不修改，release 不重打。
