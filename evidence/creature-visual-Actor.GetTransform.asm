0x1001a6610: push rbp
0x1001a6611: mov rbp, rsp
0x1001a6614: vxorps xmm0, xmm0, xmm0
0x1001a6618: vblendps xmm1, xmm0, xmmword ptr [rsi + 0x20], 7
0x1001a661f: vmovaps xmmword ptr [rdi], xmm1
0x1001a6623: vblendps xmm1, xmm0, xmmword ptr [rsi + 0x30], 7
0x1001a662a: vmovaps xmmword ptr [rdi + 0x10], xmm1
0x1001a662f: vblendps xmm0, xmm0, xmmword ptr [rsi + 0x40], 7
0x1001a6636: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1001a663b: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x1001a6640: vinsertps xmm0, xmm0, dword ptr [rip + 0x8fea76], 0x30 ; 0x100aa50c0
0x1001a664a: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1001a664f: mov rax, rdi
0x1001a6652: pop rbp
0x1001a6653: ret 
0x1001a6654: nop word ptr cs:[rax + rax]
