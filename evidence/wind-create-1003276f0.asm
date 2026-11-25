0x1003276f0: mov eax, dword ptr [rdi + 0x48c0]
0x1003276f6: cmp rax, 0x20
0x1003276fa: jae 0x100327715
0x1003276fc: lea ecx, [rax + 1]
0x1003276ff: mov dword ptr [rdi + 0x48c0], ecx
0x100327705: imul rax, rax, 0xd0
0x10032770c: lea rax, [rdi + rax + 0x48d0]
0x100327714: ret 
0x100327715: push rbp
0x100327716: mov rbp, rsp
0x100327719: lea rdi, [rip + 0x859901] ; 0x100b81021 m_windCount < kMaxWinds
0x100327720: lea rsi, [rip + 0x85968a] ; 0x100b80db1 EnvironmentForces.cpp
0x100327727: mov edx, 0x26f
0x10032772c: mov ecx, 3
0x100327731: call 0x1007e5f70 ; 0x1007e5f70
0x100327736: ud2 
0x100327738: nop dword ptr [rax + rax]
