0x1007f21f0: push rbp
0x1007f21f1: mov rbp, rsp
0x1007f21f4: vxorps xmm0, xmm0, xmm0
0x1007f21f8: vmovaps xmmword ptr [rdi], xmm0
0x1007f21fc: vmovaps xmm0, xmmword ptr [rip + 0x2b86bc] ; 0x100aaa8c0
0x1007f2204: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1007f2209: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1007f220e: vmovaps xmm0, xmmword ptr [rip + 0x2b67ea] ; 0x100aa8a00
0x1007f2216: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1007f221b: vmovss xmm1, dword ptr [rip + 0x2b2e9d] ; 0x100aa50c0
0x1007f2223: vmovaps xmmword ptr [rdi + 0x40], xmm1
0x1007f2228: vmovaps xmm2, xmmword ptr [rip + 0x2b5e70] ; 0x100aa80a0
0x1007f2230: vmovaps xmmword ptr [rdi + 0x50], xmm2
0x1007f2235: vmovaps xmm3, xmmword ptr [rip + 0x2b67f3] ; 0x100aa8a30
0x1007f223d: vmovaps xmmword ptr [rdi + 0x60], xmm3
0x1007f2242: vmovaps xmmword ptr [rdi + 0x70], xmm0
0x1007f2247: vmovaps xmmword ptr [rdi + 0x80], xmm1
0x1007f224f: vmovaps xmmword ptr [rdi + 0x90], xmm2
0x1007f2257: vmovaps xmmword ptr [rdi + 0xa0], xmm3
0x1007f225f: vmovaps xmmword ptr [rdi + 0xb0], xmm0
0x1007f2267: vxorps ymm0, ymm0, ymm0
0x1007f226b: vmovups ymmword ptr [rdi + 0xc0], ymm0
0x1007f2273: mov byte ptr [rdi + 0xe0], 0
0x1007f227a: pop rbp
0x1007f227b: vzeroupper 
0x1007f227e: ret 
0x1007f227f: nop 
