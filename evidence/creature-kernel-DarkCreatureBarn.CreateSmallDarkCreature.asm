0x10026c370: mov eax, dword ptr [rdi + 0x1790]
0x10026c376: cmp rax, 0x40
0x10026c37a: jae 0x10026c395
0x10026c37c: lea ecx, [rax + 1]
0x10026c37f: mov dword ptr [rdi + 0x1790], ecx
0x10026c385: imul rax, rax, 0x110
0x10026c38c: lea rax, [rdi + rax + 0x17a0]
0x10026c394: ret 
0x10026c395: push rbp
0x10026c396: mov rbp, rsp
0x10026c399: lea rdi, [rip + 0x91095d] ; 0x100b7ccfd m_smallDarkCreatureCount < kMaxSmallCreatures
0x10026c3a0: lea rsi, [rip + 0x91085f] ; 0x100b7cc06 DarkCreature.cpp
0x10026c3a7: mov edx, 0x581
0x10026c3ac: mov ecx, 3
0x10026c3b1: call 0x1007e5f70 ; 0x1007e5f70
0x10026c3b6: ud2 
0x10026c3b8: nop dword ptr [rax + rax]
