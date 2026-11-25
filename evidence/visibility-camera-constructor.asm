0x10076bd20: push rbp
0x10076bd21: mov rbp, rsp
0x10076bd24: push rbx
0x10076bd25: push rax
0x10076bd26: mov rbx, rdi
0x10076bd29: call 0x1007abc10 ; 0x1007abc10
0x10076bd2e: mov rax, qword ptr [rip + 0x18d357b] ; 0x10203f2b0
0x10076bd35: mov eax, dword ptr [rax + 0x38]
0x10076bd38: mov dword ptr [rbx], eax
0x10076bd3a: vmovaps xmm0, xmmword ptr [rip + 0x36ed4e] ; 0x100adaa90
0x10076bd42: vmovups xmmword ptr [rbx + 4], xmm0
0x10076bd47: mov dword ptr [rbx + 0x14], 0x3f800000
0x10076bd4e: vxorps ymm0, ymm0, ymm0
0x10076bd52: vmovups ymmword ptr [rbx + 0x20], ymm0
0x10076bd57: vmovups ymmword ptr [rbx + 0x70], ymm0
0x10076bd5c: vmovups ymmword ptr [rbx + 0x60], ymm0
0x10076bd61: vmovss xmm0, dword ptr [rip + 0x339357] ; 0x100aa50c0
0x10076bd69: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x10076bd71: vmovaps xmm1, xmmword ptr [rip + 0x33c327] ; 0x100aa80a0
0x10076bd79: vmovaps xmmword ptr [rbx + 0xd0], xmm1
0x10076bd81: vmovaps xmm2, xmmword ptr [rip + 0x33cca7] ; 0x100aa8a30
0x10076bd89: vmovaps xmmword ptr [rbx + 0xe0], xmm2
0x10076bd91: vmovaps xmm3, xmmword ptr [rip + 0x33cc67] ; 0x100aa8a00
0x10076bd99: vmovaps xmmword ptr [rbx + 0xf0], xmm3
0x10076bda1: vmovaps xmmword ptr [rbx + 0x100], xmm0
0x10076bda9: vmovaps xmmword ptr [rbx + 0x110], xmm1
0x10076bdb1: vmovaps xmmword ptr [rbx + 0x120], xmm2
0x10076bdb9: vmovaps xmmword ptr [rbx + 0x130], xmm3
0x10076bdc1: vmovaps xmmword ptr [rbx + 0x140], xmm0
0x10076bdc9: vmovaps xmmword ptr [rbx + 0x150], xmm1
0x10076bdd1: vmovaps xmmword ptr [rbx + 0x160], xmm2
0x10076bdd9: vmovaps xmmword ptr [rbx + 0x170], xmm3
0x10076bde1: vmovaps xmmword ptr [rbx + 0x180], xmm0
0x10076bde9: vmovaps xmmword ptr [rbx + 0x190], xmm1
0x10076bdf1: vmovaps xmmword ptr [rbx + 0x1a0], xmm2
0x10076bdf9: vmovaps xmmword ptr [rbx + 0x1b0], xmm3
0x10076be01: vmovaps xmmword ptr [rbx + 0x1c0], xmm0
0x10076be09: vmovaps xmmword ptr [rbx + 0x1d0], xmm1
0x10076be11: vmovaps xmmword ptr [rbx + 0x1e0], xmm2
0x10076be19: vmovaps xmmword ptr [rbx + 0x1f0], xmm3
0x10076be21: vmovaps xmmword ptr [rbx + 0x200], xmm0
0x10076be29: vmovaps xmmword ptr [rbx + 0x210], xmm1
0x10076be31: vmovaps xmmword ptr [rbx + 0x220], xmm2
0x10076be39: vmovaps xmmword ptr [rbx + 0x230], xmm3
0x10076be41: vmovaps xmmword ptr [rbx + 0x280], xmm0
0x10076be49: vmovaps xmmword ptr [rbx + 0x290], xmm1
0x10076be51: vmovaps xmmword ptr [rbx + 0x2a0], xmm2
0x10076be59: vmovaps xmmword ptr [rbx + 0x2b0], xmm3
0x10076be61: vmovaps xmmword ptr [rbx + 0x2c0], xmm0
0x10076be69: vmovaps xmmword ptr [rbx + 0x2d0], xmm1
0x10076be71: vmovaps xmmword ptr [rbx + 0x2e0], xmm2
0x10076be79: vmovaps xmmword ptr [rbx + 0x2f0], xmm3
0x10076be81: add rsp, 8
0x10076be85: pop rbx
0x10076be86: pop rbp
0x10076be87: vzeroupper 
0x10076be8a: ret 
0x10076be8b: nop dword ptr [rax + rax]
