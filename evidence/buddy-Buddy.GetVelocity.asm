0x1001d37d0: push rbp
0x1001d37d1: mov rbp, rsp
0x1001d37d4: vmovaps xmm0, xmmword ptr [rsi + 0x50]
0x1001d37d9: vmovaps xmmword ptr [rdi], xmm0
0x1001d37dd: mov rax, rdi
0x1001d37e0: pop rbp
0x1001d37e1: ret 
0x1001d37e2: nop word ptr cs:[rax + rax]
