0x100402b10: push rbp
0x100402b11: mov rbp, rsp
0x100402b14: mov rax, qword ptr [rsi + 0x228]
0x100402b1b: vmovaps xmm0, xmmword ptr [rax + 0x120]
0x100402b23: vmovaps xmmword ptr [rdi], xmm0
0x100402b27: vmovaps xmm0, xmmword ptr [rax + 0x130]
0x100402b2f: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x100402b34: vmovaps xmm0, xmmword ptr [rax + 0x140]
0x100402b3c: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x100402b41: vmovaps xmm0, xmmword ptr [rax + 0x150]
0x100402b49: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x100402b4e: mov rax, rdi
0x100402b51: pop rbp
0x100402b52: ret 
0x100402b53: nop word ptr cs:[rax + rax]
