0x10027f6a0: mov eax, dword ptr [rdi + 0x1210]
0x10027f6a6: cmp rax, 0x40
0x10027f6aa: jae 0x10027f6bf
0x10027f6ac: lea ecx, [rax + 1]
0x10027f6af: mov dword ptr [rdi + 0x1210], ecx
0x10027f6b5: lea rax, [rax + rax*8]
0x10027f6b9: lea rax, [rdi + rax*8 + 0x10]
0x10027f6be: ret 
0x10027f6bf: push rbp
0x10027f6c0: mov rbp, rsp
0x10027f6c3: lea rdi, [rip + 0x8fdb0c] ; 0x100b7d1d6 m_soulTrapCount < kMaxSoulTraps
0x10027f6ca: lea rsi, [rip + 0x8fd865] ; 0x100b7cf36 Darkstone.cpp
0x10027f6d1: mov edx, 0x5a4
0x10027f6d6: mov ecx, 3
0x10027f6db: call 0x1007e5f70 ; 0x1007e5f70
0x10027f6e0: ud2 
0x10027f6e2: nop word ptr cs:[rax + rax]
