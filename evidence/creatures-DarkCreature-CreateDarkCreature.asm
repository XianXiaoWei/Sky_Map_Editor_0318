0x10026c330: mov eax, dword ptr [rdi + 0xc]
0x10026c333: cmp rax, 8
0x10026c337: jae 0x10026c34c
0x10026c339: lea ecx, [rax + 1]
0x10026c33c: mov dword ptr [rdi + 0xc], ecx
0x10026c33f: imul rax, rax, 0x2f0
0x10026c346: lea rax, [rdi + rax + 0x10]
0x10026c34b: ret 
0x10026c34c: push rbp
0x10026c34d: mov rbp, rsp
0x10026c350: lea rdi, [rip + 0x91097e] ; 0x100b7ccd5 m_darkCreatureCount < kMaxDarkCreatures
0x10026c357: lea rsi, [rip + 0x9108a8] ; 0x100b7cc06 DarkCreature.cpp
0x10026c35e: mov edx, 0x57b
0x10026c363: mov ecx, 3
0x10026c368: call 0x1007e5f70 ; 0x1007e5f70
0x10026c36d: ud2 
0x10026c36f: nop 
