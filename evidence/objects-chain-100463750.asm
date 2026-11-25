0x100463750: push rbp
0x100463751: mov rbp, rsp
0x100463754: cmp byte ptr [rdi + 0x32e], 0
0x10046375b: vmovaps xmm0, xmmword ptr [rsi]
0x10046375f: je 0x100463799
0x100463761: vmovaps xmmword ptr [rdi + 0x240], xmm0
0x100463769: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x10046376e: vmovaps xmmword ptr [rdi + 0x250], xmm0
0x100463776: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x10046377b: vmovaps xmmword ptr [rdi + 0x260], xmm0
0x100463783: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x100463788: vmovaps xmmword ptr [rdi + 0x270], xmm0
0x100463790: mov byte ptr [rdi + 0x280], 1
0x100463797: pop rbp
0x100463798: ret 
0x100463799: vmovaps xmmword ptr [rdi + 0x160], xmm0
0x1004637a1: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x1004637a6: vmovaps xmmword ptr [rdi + 0x170], xmm0
0x1004637ae: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x1004637b3: vmovaps xmmword ptr [rdi + 0x180], xmm0
0x1004637bb: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x1004637c0: vmovaps xmmword ptr [rdi + 0x190], xmm0
0x1004637c8: mov byte ptr [rdi + 0x225], 1
0x1004637cf: pop rbp
0x1004637d0: ret 
0x1004637d1: nop word ptr cs:[rax + rax]
