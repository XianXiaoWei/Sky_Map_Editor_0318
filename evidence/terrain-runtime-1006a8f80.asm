0x1006a8f80: cmp byte ptr [rsi + 0x5e4], 0
0x1006a8f87: je 0x1006a8fc9
0x1006a8f89: vmovaps xmm0, xmmword ptr [rdx]
0x1006a8f8d: vmovaps xmmword ptr [rsi + 0x20], xmm0
0x1006a8f92: vmovaps xmm0, xmmword ptr [rdx + 0x10]
0x1006a8f97: vmovaps xmmword ptr [rsi + 0x30], xmm0
0x1006a8f9c: vmovaps xmm0, xmmword ptr [rdx + 0x20]
0x1006a8fa1: vmovaps xmmword ptr [rsi + 0x40], xmm0
0x1006a8fa6: vmovaps xmm0, xmmword ptr [rdx + 0x30]
0x1006a8fab: vmovaps xmmword ptr [rsi + 0x50], xmm0
0x1006a8fb0: mov rsi, qword ptr [rsi + 0x598]
0x1006a8fb7: test rsi, rsi
0x1006a8fba: je 0x1006a8fc8
0x1006a8fbc: mov rdi, qword ptr [rdi + 0x318]
0x1006a8fc3: jmp 0x100779320 ; 0x100779320
0x1006a8fc8: ret 
0x1006a8fc9: push rbp
0x1006a8fca: mov rbp, rsp
0x1006a8fcd: lea rdi, [rip + 0x4f0de9] ; 0x100b99dbd model->distant
0x1006a8fd4: lea rsi, [rip + 0x4f0a06] ; 0x100b999e1 TerrainBarn.cpp
0x1006a8fdb: lea r8, [rip + 0x4f0dea] ; 0x100b99dcc Only distant terrain models are allowed to have a transform matrix
0x1006a8fe2: mov edx, 0x389
0x1006a8fe7: mov ecx, 4
0x1006a8fec: xor eax, eax
0x1006a8fee: call 0x1007e6030 ; 0x1007e6030
0x1006a8ff3: ud2 
0x1006a8ff5: nop word ptr cs:[rax + rax]
