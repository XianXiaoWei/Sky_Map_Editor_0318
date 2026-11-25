0x10027a760: mov eax, dword ptr [rdi + 0x1b220]
0x10027a766: cmp eax, 0x100
0x10027a76b: jae 0x10027a78e
0x10027a76d: mov dword ptr [rsi], eax
0x10027a76f: mov eax, dword ptr [rdi + 0x1b220]
0x10027a775: lea ecx, [rax + 1]
0x10027a778: mov dword ptr [rdi + 0x1b220], ecx
0x10027a77e: imul rax, rax, 0x1a0
0x10027a785: lea rax, [rdi + rax + 0x1220]
0x10027a78d: ret 
0x10027a78e: push rbp
0x10027a78f: mov rbp, rsp
0x10027a792: lea rdi, [rip + 0x902a5d] ; 0x100b7d1f6 m_darkstoneCount < kMaxDarkstones
0x10027a799: lea rsi, [rip + 0x902796] ; 0x100b7cf36 Darkstone.cpp
0x10027a7a0: mov edx, 0x5ab
0x10027a7a5: mov ecx, 3
0x10027a7aa: call 0x1007e5f70 ; 0x1007e5f70
0x10027a7af: ud2 
0x10027a7b1: nop word ptr cs:[rax + rax]
