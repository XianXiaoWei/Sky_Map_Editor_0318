0x10034f110: mov eax, dword ptr [rdi + 0x11dc0]
0x10034f116: cmp rax, 0xff
0x10034f11c: jae 0x10034f137
0x10034f11e: lea ecx, [rax + 1]
0x10034f121: mov dword ptr [rdi + 0x11dc0], ecx
0x10034f127: imul rax, rax, 0x110
0x10034f12e: lea rax, [rdi + rax + 0xed0]
0x10034f136: ret 
0x10034f137: push rbp
0x10034f138: mov rbp, rsp
0x10034f13b: lea rdi, [rip + 0x832caf] ; 0x100b81df1 m_flowerPatchCount < kMaxFlowerPatches
0x10034f142: lea rsi, [rip + 0x832af1] ; 0x100b81c3a FlowerBarn.cpp
0x10034f149: mov edx, 0x2e7
0x10034f14e: mov ecx, 3
0x10034f153: call 0x1007e5f70 ; 0x1007e5f70
0x10034f158: ud2 
0x10034f15a: nop word ptr [rax + rax]
