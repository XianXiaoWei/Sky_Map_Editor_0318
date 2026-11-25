0x1001ea9e0: mov eax, dword ptr [rdi + 0xf6d0]
0x1001ea9e6: cmp rax, 0xc4
0x1001ea9ec: jae 0x1001eaa96
0x1001ea9f2: lea ecx, [rax + 1]
0x1001ea9f5: mov dword ptr [rdi + 0xf6d0], ecx
0x1001ea9fb: imul rcx, rax, 0xb0
0x1001eaa02: lea rax, [rdi + rcx + 0x7010]
0x1001eaa0a: vmovss xmm0, dword ptr [rip + 0x8ba6ae] ; 0x100aa50c0
0x1001eaa12: vmovaps xmmword ptr [rdi + rcx + 0x7020], xmm0
0x1001eaa1b: vmovaps xmm1, xmmword ptr [rip + 0x8bd67d] ; 0x100aa80a0
0x1001eaa23: vmovaps xmmword ptr [rdi + rcx + 0x7030], xmm1
0x1001eaa2c: vmovaps xmm2, xmmword ptr [rip + 0x8bdffc] ; 0x100aa8a30
0x1001eaa34: vmovaps xmmword ptr [rdi + rcx + 0x7040], xmm2
0x1001eaa3d: vmovaps xmm3, xmmword ptr [rip + 0x8bdfbb] ; 0x100aa8a00
0x1001eaa45: vmovaps xmmword ptr [rdi + rcx + 0x7050], xmm3
0x1001eaa4e: vmovaps xmmword ptr [rdi + rcx + 0x7060], xmm0
0x1001eaa57: vmovaps xmmword ptr [rdi + rcx + 0x7070], xmm1
0x1001eaa60: vmovaps xmmword ptr [rdi + rcx + 0x7080], xmm2
0x1001eaa69: vmovaps xmmword ptr [rdi + rcx + 0x7090], xmm3
0x1001eaa72: mov dword ptr [rdi + rcx + 0x70b8], 0
0x1001eaa7d: mov qword ptr [rdi + rcx + 0x70ad], 0
0x1001eaa89: mov qword ptr [rdi + rcx + 0x70a8], 0
0x1001eaa95: ret 
0x1001eaa96: push rbp
0x1001eaa97: mov rbp, rsp
0x1001eaa9a: lea rdi, [rip + 0x98ebc2] ; 0x100b79663 m_candleObjectCount < kMaxCandleObjects
0x1001eaaa1: lea rsi, [rip + 0x98e9b2] ; 0x100b7945a Candle.cpp
0x1001eaaa8: mov edx, 0x236
0x1001eaaad: mov ecx, 3
0x1001eaab2: call 0x1007e5f70 ; 0x1007e5f70
0x1001eaab7: ud2 
0x1001eaab9: nop dword ptr [rax]
