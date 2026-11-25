# Marker 空间变换与对象反射

本轮恢复原 Marker 的 GetTransform、SetTransform、本地/世界 OBB、ObjectFactory 矩阵反射和 extent 调用。13,784 组、6,440,572 字节与原机器码一致，覆盖全部 6,538 个真实 Marker 的保存变换，各自执行一次取变换和回写。40 组另连接原 MarkerBarn 创建、反射启用/变换/OBB/extent、释放及复用。完整原游戏/类/实例验收仍为 0。

原执行文件 SHA256：`3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20`。证据提取使用 LC_FUNCTION_STARTS 函数边界；独立核验器在 qemu-x86_64 中映射该文件，执行原函数及 wrapper。报告见 [空间核验](marker-transform-oracle.json)、[地址与常量](marker-transform-native.json)、[测试与构建](marker-transform-verification.json)。

| 原方法 | 地址 | 恢复行为 |
| --- | --- | --- |
| Marker.SetTransform | `0x10043ccd0` | 全矩阵 NaN 检查、保存平移、列长缩放、四分支 quaternion 分解/归一化 |
| Marker.GetTransform | `0x10043e2d0` | quaternion 导出列、分别归一化、按轴缩放、平移 W=1 |
| Marker.LocalObb | `0x10043e470` | 对角线 .5/.5/.5/1 的本地盒 |
| Marker.WorldObb | `0x10043e4b0` | 先虚调用变换，再虚调用本地盒，最后 Obb.Transform |
| Marker.SetTransform wrapper | `0x10043e520` | 参数个数、成员指针/this-adjustment、Matrix4 参数转换 |
| Marker.GetMatrix wrapper | `0x10043e640` | 参数个数、成员指针/this-adjustment、Matrix4 返回转换 |
| Obb.Transform | `0x100076df0` | column-major 矩阵乘法，保留原乘加顺序 |
| ObjectFactory.SetTransform | `0x1004d1d50` | 原类查询、方法查询、receiver 转换、一个 Matrix4 参数 |
| ObjectFactory.GetTransform | `0x1004d1e40` | 先写 identity，再查询和调用原 getter |
| ObjectFactory.GetObb | `0x1004d2140` | 先写 identity，再取得注册的本地盒 |
| ObjectFactory.Extents | `0x1004d2260` | 变换×本地盒，再写三个 xyz 列长，共12字节 |

## 数值与存储规则

Marker 本体80字节，Object 子对象在本体+8；pos/quat/scale/enabled 位于+16/+32/+48/+64。矩阵为16个 float32，按列排列。

GetTransform 没有先归一化 quaternion。它按原单精度乘加生成三个旋转列，分别计算 `sqrt(z² + (x² + y²))`；只有长度严格大于 float32 `0.00001` 才相除。第三列先翻转符号位，归一化后再翻回；包括 signed zero 的结果已比对。三列 W=0 后各乘对应 scale；平移前三分量保留，W 强制1。负缩放可保留负零。

SetTransform 在任何 Marker 写入前检查全部16个输入分量，包括前三列W和translation W。任意 signaling/quiet NaN 都触发原 `Marker.cpp:78`、severity3、`!isNan( mat )`。随后复制整个平移列，包括W，再重新读取三个轴；这是输入和Marker重叠时必须保留的时序。每轴xyz长度写入scale，scale第四分量和enabled不改。归一化轴后按trace/对角比较生成原符号翻转和分量置换，再以 `sqrt((x²+z²)+(y²+w²))` 归一化quat。负缩放分解得到非负长度；剪切/反射/退化输入采用原规则，没有调用Three.js分解。

原注册 GetTransform 成员编码是 `0x19`（虚表+0x18），GetObb 是 `0x21`（虚表+0x20），因此反射 GetObb 返回本地半尺寸盒。世界盒虚表+0x28另组合两个虚调用。Factory null/缺方法返回identity，因此默认extent是1/1/1；正常Marker extent为世界盒三个列长。wrapper参数个数错误保留 `Meta.h:573`，receiver失败保留 `Meta.h:1091`。

输入/输出重叠单独验证；JS Buffer.slice 是视图，取变换必须显式捕获平移字节后再写输出，避免前面的矩阵列覆盖平移。原机器码保存行为及修正后的字节API一致。

## 连续调用与实际接入

- 6,538 个不同真实Marker，各有原保存字节的GetTransform以及所得矩阵的SetTransform；共13,076组真实数据。来源记录保留地图名、节点ID与Objects.level.bin SHA256。
- 合成输入覆盖四种quat分支、非单位/零quat、非均匀/负/零缩放、阈值、渐进下溢、随机剪切、反射、signed zero和列padding。
- 40组连续调用执行原MarkerBarn创建→原SetEnabled(false)/GetEnabled→原SetTransform/GetTransform/GetObb/extent→原SetEnabled(true)/GetEnabled→原释放→首槽复用；新对象ID为1，启用和变换分别核对。
- 67组原断言包含全16分量NaN、wrapper参数个数和receiver失败。null/缺方法、大小写不匹配、fallback与继承查找保持原默认行为；原 uncached 方法树查找参与执行。
- 通用字节API位于 `src/core/marker-transform-runtime.ts`，Factory/wrapper位于 `src/core/object-transform-runtime.ts`。既有 `railMarkerTransform` 组件入口调用同一字节内核，Rail缓存、风场轨道和Avatar出生定位通过原fixture回归。全部真实Marker额外验证组件适配与原输出一致。

## 验收范围

原registry/默认缓存启动、class/receiver转换、Matrix4/scalar类型转换、libc和初始位图仍是明确服务。紧凑核验器提供原保存vector字节，不重复宣称完整TGCL ReadFields闭合；此前TGCL/启用/ResumeEnable联合906组证据独立保留。生命周期核验逐字节比较对象、启用结果和释放复用的计数/ID；全部1024槽的池状态仍由先前联合核验覆盖。

默认算术范围为有限中间结果、round-to-nearest-even和渐进下溢。输入Infinity不是原NaN断言；单纯Infinity平移在SetTransform中可保存。产生非有限算术、NaN payload传播和其他MXCSR模式进入明确算术服务边界；没有伪装成原Marker断言。派生Marker改变GetTransform/LocalObb、TransformObject完整更新、环境/资源消费、Avatar完整物理/动画/连续相机、Windows和原游戏验收仍待恢复。

此轮扩展已有Marker核心子链，不增加完整类计数。核心子链24类；854/2830=30.18%仍是清单比例。

重建证据：`python3 tools/reverse-marker-transform.py /path/to/Sky`。
重建核验：`SKY_DATA=/path/to/Data npx tsx tools/marker-transform-oracle.ts /path/to/Sky`。
普通 `npm test` 重放压缩原输出fixture；`SKY_MARKER_FILTER=...` 仅局部核验，不覆盖全量报告。
