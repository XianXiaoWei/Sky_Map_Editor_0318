# 地形 bin 显隐、动态登记清理与 LOD 任务入口

当前实施目标更新为 BstBaked 五段同等优先达到各 9/10（90%），最后一项保留真机验收。本轮新增的是地形第 8 项的运行子链，完整 Visibility／Job／LOD／细分／碰撞仍未闭合，整项分数不变。

`updateTerrainBinVisibility` 恢复原 `0x1006a331f..0x1006a343a` 的显隐切换。目标隐藏且当前可见时进入独占段；目标可见且当前隐藏时运行原绘制准备。再次可见的 bin 先得到 LOD 3，细分目标交给后续任务；已可见 bin 不在此函数中直接改为距离目标。重复隐藏不获取锁、不清理登记，也不重写 pending。

`releaseTerrainBinDraw` 对应完整原 `0x1006a8100` 正常路径。在取得 Barn+0x470 独占访问后重新读取当前 LOD。只有无符号 LOD 0～2 才移除动态顶点／索引拥有者登记、清零选中 bin 的整个 0x3e0 字节块；LOD 3、FFFF、FFFE 和其他高位值保留所有绘制字节。两种路径都写入 LOD FFFF、pending FFFE。

登记清理执行完整原 `0x10077e4b0`。每条登记为 16 字节，首字为**拥有者指针槽的地址**，第二字为保留的数据。匹配键分别是 drawBase+bin×0x3e0+0x20／+0x30，不能用槽内的资源指针替代。全部匹配登记按原稳定顺序删除，其他记录的全部 16 字节保留；压缩后的废弃尾部不清零。此操作没有恢复堆回收、GPU 释放或任务完成机制。

`dispatchTerrainBinLodJob` 恢复完整原 TessBinJob `0x1006ad3f0` 的分发判断。它在执行时读取当前 LOD，以有符号 int16 比较目标值。目标小于当前时跳转到 `0x1006a81d0`，其余情况（包括相等）跳转到 `0x1006a88c0`；FFFF 在这里是 -1。原入口不能改成相等时跳过，也不能在本函数中猜测取消规则、pending 更新或任务排序。两个细分／降级方法目前仍由显式服务提供，未记为完整 worker 恢复。

[原机报告](terrain-bin-lifecycle-oracle.json)新增 345 组／1,558 步／9,058 次独占段／100 次任务分发，共 56,684,094 字节比较，0 差异。原 release、prepare、登记清理和任务分发函数体未修改；显隐指令子段仅在退出边界设置返回跳板。互斥与 bzero 采用明确的串行主机服务，任务分发的两个 worker 入口为明确的记录回调。测试没有恢复并发执行、真实任务队列或细分函数体。

真实 packet 直接来自此前原创建函数的最终输出，选择显式零初始化 heap 的输入。31 张地图全部 77 条地形记录（包含无 bin 的记录）纳入清点，按开头／中间／结尾各最多 32 个 bin 抽样，共 5,339 个实际 bin，保留原 packet offset。测试只在独立生命周期快照里重编号抽样 bin，不将其冒充原加载状态。动态 LOD 的 draw 内容与登记表是明确快照，未将它们计为原细分生产结果。

验证覆盖空列表、没有匹配项、单项／连续／分散重复登记、列表尾部、其他 bin 与 64-byte guard、连续显隐、空 draw 的 coarse 路径，以及取得锁时 LOD 改变后的重新读取。原核心输出 fixture 独立保存供普通项目测试使用。本轮 167 项项目测试、TypeScript 和构建通过。

仍需恢复原对象距离排序、实际 LOD 任务排队、细分与降级 worker、堆资源回收、真实 Camera／加载／模块顺序，再接主视口与五段共用 Visibility。原游戏和 Windows 真机校验保留在各段最后一项。

重建命令：`npx tsx tools/terrain-bin-geometry-oracle.ts` 重新导出原 packet 语料，随后 `npx tsx tools/terrain-bin-lifecycle-oracle.ts`。对应实现位于 `src/core/terrain-bin-runtime.ts`；新增回归位于 `tests/terrain-bin-lifecycle.test.ts`。
