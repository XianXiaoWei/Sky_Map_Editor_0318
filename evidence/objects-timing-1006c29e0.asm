0x1006c29e0: cmp esi, 0x80
0x1006c29e6: jae 0x1006c29ef
0x1006c29e8: mov dword ptr [rdi + 0x480], esi
0x1006c29ee: ret 
0x1006c29ef: push rbp
0x1006c29f0: mov rbp, rsp
0x1006c29f3: lea rdi, [rip + 0x4d8550] ; 0x100b9af4a numNodes < kMaxTimelineNodes
0x1006c29fa: lea rsi, [rip + 0x4d84b4] ; 0x100b9aeb5 Timeline.cpp
0x1006c2a01: mov edx, 0xe9
0x1006c2a06: mov ecx, 3
0x1006c2a0b: call 0x1007e5f70 ; 0x1007e5f70
0x1006c2a10: ud2 
0x1006c2a12: nop word ptr cs:[rax + rax]
