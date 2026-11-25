0x10027ecb0: mov eax, dword ptr [rdi + 0x104]
0x10027ecb6: test rsi, rsi
0x10027ecb9: je 0x10027ecd4
0x10027ecbb: cmp eax, 7
0x10027ecbe: ja 0x10027ecda
0x10027ecc0: mov ecx, dword ptr [rsi + 0x20]
0x10027ecc3: lea edx, [rax + 1]
0x10027ecc6: mov dword ptr [rdi + 0x104], edx
0x10027eccc: mov dword ptr [rdi + rax*4 + 0xe4], ecx
0x10027ecd3: ret 
0x10027ecd4: cmp eax, 8
0x10027ecd7: jae 0x10027ecda
0x10027ecd9: ret 
0x10027ecda: push rbp
0x10027ecdb: mov rbp, rsp
0x10027ecde: lea rdi, [rip + 0x8fe48b] ; 0x100b7d170 m_childCount < kMaxChildCount
0x10027ece5: lea rsi, [rip + 0x8fe24a] ; 0x100b7cf36 Darkstone.cpp
0x10027ecec: lea r8, [rip + 0x8fe49b] ; 0x100b7d18e Darkstone has more children than supported
0x10027ecf3: mov edx, 0x4f7
0x10027ecf8: mov ecx, 4
0x10027ecfd: xor eax, eax
0x10027ecff: call 0x1007e6030 ; 0x1007e6030
0x10027ed04: ud2 
0x10027ed06: nop word ptr cs:[rax + rax]
