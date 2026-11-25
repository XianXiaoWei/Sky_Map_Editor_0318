0x10047b3a0: push rbp
0x10047b3a1: mov rbp, rsp
0x10047b3a4: vmovaps xmm0, xmmword ptr [rsi + 0x40]
0x10047b3a9: vmovaps xmmword ptr [rdi], xmm0
0x10047b3ad: vmovaps xmm0, xmmword ptr [rsi + 0x50]
0x10047b3b2: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x10047b3b7: vmovaps xmm0, xmmword ptr [rsi + 0x60]
0x10047b3bc: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10047b3c1: vmovaps xmm0, xmmword ptr [rsi + 0x70]
0x10047b3c6: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x10047b3cb: mov rax, rdi
0x10047b3ce: pop rbp
0x10047b3cf: ret 
