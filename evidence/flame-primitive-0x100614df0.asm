0x100614df0: mov r10d, dword ptr [rdi + 0x988]
0x100614df7: mov r9d, dword ptr [rdi]
0x100614dfa: cmp r10d, r9d
0x100614dfd: jae 0x100614e65
0x100614dff: mov r8, qword ptr [rdi + 0x980]
0x100614e06: lea eax, [r10 + 1]
0x100614e0a: mov dword ptr [rdi + 0x988], eax
0x100614e10: lea rdi, [r10 + r10*4]
0x100614e14: shl rdi, 4
0x100614e18: lea rax, [r8 + rdi]
0x100614e1c: vmovaps xmm5, xmmword ptr [rsi]
0x100614e20: vmovaps xmmword ptr [r8 + rdi], xmm5
0x100614e26: vmovaps xmm5, xmmword ptr [rdx]
0x100614e2a: vmovaps xmmword ptr [r8 + rdi + 0x10], xmm5
0x100614e31: vmovss dword ptr [r8 + rdi + 0x20], xmm0
0x100614e38: vmovss dword ptr [r8 + rdi + 0x24], xmm3
0x100614e3f: vmovss dword ptr [r8 + rdi + 0x28], xmm4
0x100614e46: mov word ptr [r8 + rdi + 0x2c], 0x100
0x100614e4e: vmovaps xmm0, xmmword ptr [rcx]
0x100614e52: vmovaps xmmword ptr [r8 + rdi + 0x30], xmm0
0x100614e59: vunpcklpd xmm0, xmm1, xmm2
0x100614e5d: vmovupd xmmword ptr [r8 + rdi + 0x40], xmm0
0x100614e64: ret 
0x100614e65: push rbp
0x100614e66: mov rbp, rsp
0x100614e69: lea rdi, [rip + 0x58209a] ; 0x100b96f0a m_renderListSz < m_kMaxSprites
0x100614e70: lea rsi, [rip + 0x582058] ; 0x100b96ecf SpriteRenderer.cpp
0x100614e77: lea r8, [rip + 0x5820ab] ; 0x100b96f29 Ran out of sprites. Max: %u
0x100614e7e: mov edx, 0x73
0x100614e83: mov ecx, 4
0x100614e88: xor eax, eax
0x100614e8a: call 0x1007e6030 ; 0x1007e6030
0x100614e8f: ud2 
0x100614e91: nop word ptr cs:[rax + rax]
