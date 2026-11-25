0x10033abc0: push rbp
0x10033abc1: mov rbp, rsp
0x10033abc4: vmovaps xmm0, xmmword ptr [rsi]
0x10033abc8: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x10033abcd: vmovaps xmm1, xmmword ptr [rsi + 0x10]
0x10033abd2: vmovaps xmmword ptr [rdi + 0x20], xmm1
0x10033abd7: vmovaps xmm1, xmmword ptr [rsi + 0x20]
0x10033abdc: vmovaps xmmword ptr [rdi + 0x30], xmm1
0x10033abe1: vmovaps xmm1, xmmword ptr [rsi + 0x30]
0x10033abe6: vmovaps xmmword ptr [rdi + 0x40], xmm1
0x10033abeb: vmovaps xmm1, xmmword ptr [rdi + 0xc0]
0x10033abf3: vmovaps xmmword ptr [rdi + 0xd0], xmm1
0x10033abfb: vmovaps xmm1, xmmword ptr [rsi + 0x30]
0x10033ac00: vmovaps xmmword ptr [rdi + 0xc0], xmm1
0x10033ac08: vmulps xmm0, xmm0, xmm0
0x10033ac0c: vmovshdup xmm1, xmm0
0x10033ac10: vaddss xmm1, xmm0, xmm1
0x10033ac14: vpermilpd xmm0, xmm0, 1
0x10033ac1a: vaddss xmm0, xmm0, xmm1
0x10033ac1e: vsqrtss xmm0, xmm0, xmm0
0x10033ac22: vmulss xmm0, xmm0, dword ptr [rip + 0x76d9a6] ; 0x100aa85d0
0x10033ac2a: vaddss xmm0, xmm0, dword ptr [rip + 0x76dd82] ; 0x100aa89b4
0x10033ac32: vmovss dword ptr [rdi + 0x108], xmm0
0x10033ac3a: pop rbp
0x10033ac3b: ret 
0x10033ac3c: nop dword ptr [rax]
