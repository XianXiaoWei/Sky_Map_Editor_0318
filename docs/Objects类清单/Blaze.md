# Blaze 单独类功能实现清单

功能分类：粒子、灯光与场景效果。

此类职责：**燃烧对象、网格和灰烬参数**。

类清单进度 40%（4/10），17 个实例；完整原类运行未验收。分类依据实际声明/字段与所列原函数证据，不把名字或字段当作完整行为证明。

## 此类功能实施项

- [ ] 原输入与构造（部分完成）：Blaze 的原默认值、继承初始化及 17 个序列化字段变体；原注册字段 17 项。
- [ ] 燃烧对象、网格和灰烬参数（部分完成）：原池创建／启用／变换／Reset／SetActive／释放和普通 Load 已独立核验；使用保存模型时保留原克隆、重复缩放与透明度，生成分支保留贴图引用和 Flame 配置。实际 Model／资源／音效 owner、Blaze.Update 与动态绘制仍待接；本语料未发现直接 Darkshroom 引用，不计为黑暗植物实现。
- [ ] 依赖调用与事件：Clump（15 条引用）
- [ ] 实际场景与功能接入：按该类职责接入原更新、UI、渲染或物理调用，不把预览当作完整原逻辑。
- [ ] 注销、恢复与真机行为：逐类闭合原销毁/切图状态及原游戏真机行为。

## 原类完整验收

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

原池创建／启用／变换／Reset／SetActive／释放和普通 Load 已独立核验；使用保存模型时保留原克隆、重复缩放与透明度，生成分支保留贴图引用和 Flame 配置。实际 Model／资源／音效 owner、Blaze.Update 与动态绘制仍待接；本语料未发现直接 Darkshroom 引用，不计为黑暗植物实现。

[此类全部实例与依赖详情](../Objects.level.bin对象实现清单.html#class=Blaze) · [原字段、进度与全部实例 JSON](Blaze.json) · [全部功能类目录](../Objects.level.bin全部实现清单.md)

## 该类全部实例

每个实例另外验收完整构造、加载、启动、事件、更新、实际接入、销毁和真机行为；共享原类子链不自动计入实例验收。地图在各行作为原始来源保留。

| 实例 | 对象名 | 实例自身检查 | 出引用 / 入引用 | 来源 |
| --- | --- | --- | ---: | --- |
| [n84](../Objects.level.bin对象实现清单.html#Night%3An84) | BstNode_2204 | 20%（2/10），运行待验 | 1 / 5 | Night · 35204 + 121 bytes |
| [n111](../Objects.level.bin对象实现清单.html#Night%3An111) | BstNode_2198 | 20%（2/10），运行待验 | 1 / 2 | Night · 38308 + 121 bytes |
| [n313](../Objects.level.bin对象实现清单.html#Night%3An313) | BstNode_2190 | 20%（2/10），运行待验 | 1 / 2 | Night · 68940 + 121 bytes |
| [n483](../Objects.level.bin对象实现清单.html#Night%3An483) | BstNode_2205 | 20%（2/10），运行待验 | 1 / 5 | Night · 95758 + 121 bytes |
| [n958](../Objects.level.bin对象实现清单.html#Night%3An958) | BstNode_2185 | 20%（2/10），运行待验 | 1 / 2 | Night · 167012 + 121 bytes |
| [n2179](../Objects.level.bin对象实现清单.html#Night%3An2179) | BstNode_2191 | 20%（2/10），运行待验 | 1 / 2 | Night · 345349 + 121 bytes |
| [n2492](../Objects.level.bin对象实现清单.html#Night%3An2492) | BstNode_2231 | 20%（2/10），运行待验 | 0 / 5 | Night · 391309 + 121 bytes |
| [n2782](../Objects.level.bin对象实现清单.html#Night%3An2782) | BstNode_2199 | 20%（2/10），运行待验 | 1 / 2 | Night · 432510 + 121 bytes |
| [n2807](../Objects.level.bin对象实现清单.html#Night%3An2807) | BstNode_2206 | 20%（2/10），运行待验 | 1 / 4 | Night · 435711 + 121 bytes |
| [n3001](../Objects.level.bin对象实现清单.html#Night%3An3001) | BstNode_2200 | 20%（2/10），运行待验 | 1 / 2 | Night · 466147 + 121 bytes |
| [n3085](../Objects.level.bin对象实现清单.html#Night%3An3085) | BstNode_2208 | 20%（2/10），运行待验 | 1 / 3 | Night · 481577 + 121 bytes |
| [n1146](../Objects.level.bin对象实现清单.html#Rain%3An1146) | BstNode_2345992852 | 20%（2/10），运行待验 | 1 / 2 | Rain · 286675 + 127 bytes |
| [n1415](../Objects.level.bin对象实现清单.html#Rain%3An1415) | BstNode_2345992845 | 20%（2/10），运行待验 | 1 / 2 | Rain · 344085 + 127 bytes |
| [n1462](../Objects.level.bin对象实现清单.html#Rain%3An1462) | BstNode_2345992302 | 20%（2/10），运行待验 | 1 / 2 | Rain · 355132 + 127 bytes |
| [n1571](../Objects.level.bin对象实现清单.html#Rain%3An1571) | BstNode_2345992304 | 20%（2/10），运行待验 | 1 / 2 | Rain · 378497 + 127 bytes |
| [n1626](../Objects.level.bin对象实现清单.html#Rain%3An1626) | BstNode_2345992865 | 20%（2/10），运行待验 | 0 / 4 | Rain · 390859 + 127 bytes |
| [n1819](../Objects.level.bin对象实现清单.html#Rain%3An1819) | BstNode_2345992303 | 20%（2/10），运行待验 | 1 / 2 | Rain · 438883 + 127 bytes |
