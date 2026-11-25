0x1001949c0: push rbp
0x1001949c1: mov rbp, rsp
0x1001949c4: vmovaps xmm0, xmmword ptr [rsi]
0x1001949c8: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1001949cd: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x1001949d2: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1001949d7: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x1001949dc: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1001949e1: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x1001949e6: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x1001949eb: pop rbp
0x1001949ec: ret 
0x1001949ed: nop dword ptr [rax]
