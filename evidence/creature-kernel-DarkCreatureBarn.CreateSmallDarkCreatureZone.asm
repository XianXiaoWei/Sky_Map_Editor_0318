0x10026c3c0: mov eax, dword ptr [rdi + 0x5ba0]
0x10026c3c6: cmp rax, 8
0x10026c3ca: jae 0x10026c3e5
0x10026c3cc: lea ecx, [rax + 1]
0x10026c3cf: mov dword ptr [rdi + 0x5ba0], ecx
0x10026c3d5: imul rax, rax, 0x270
0x10026c3dc: lea rax, [rdi + rax + 0x5bb0]
0x10026c3e4: ret 
0x10026c3e5: push rbp
0x10026c3e6: mov rbp, rsp
0x10026c3e9: lea rdi, [rip + 0x91093b] ; 0x100b7cd2b m_smallDarkCreatureZoneCount < kMaxSmallCreatureZones
0x10026c3f0: lea rsi, [rip + 0x91080f] ; 0x100b7cc06 DarkCreature.cpp
0x10026c3f7: mov edx, 0x587
0x10026c3fc: mov ecx, 3
0x10026c401: call 0x1007e5f70 ; 0x1007e5f70
0x10026c406: ud2 
0x10026c408: nop dword ptr [rax + rax]
