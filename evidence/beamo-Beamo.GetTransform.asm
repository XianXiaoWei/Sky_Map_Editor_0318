0x1001985b0: push rbp
0x1001985b1: mov rbp, rsp
0x1001985b4: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x1001985b9: vmovaps xmmword ptr [rdi], xmm0
0x1001985bd: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x1001985c2: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1001985c7: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x1001985cc: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1001985d1: vmovaps xmm0, xmmword ptr [rsi + 0x40]
0x1001985d6: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1001985db: mov rax, rdi
0x1001985de: pop rbp
0x1001985df: ret 
