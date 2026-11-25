0x1001a9df0: push rbp
0x1001a9df1: mov rbp, rsp
0x1001a9df4: mov rax, qword ptr [rsi + 0x160]
0x1001a9dfb: lea rcx, [rip + 0x1e512ce] ; 0x101ffb0d0
0x1001a9e02: cmp byte ptr [rcx], 0
0x1001a9e05: vmovss xmm0, dword ptr [rip + 0x8fb2b3] ; 0x100aa50c0
0x1001a9e0d: vmovaps xmm1, xmm0
0x1001a9e11: je 0x1001a9e1e
0x1001a9e13: lea rcx, [rip + 0xb0e726] ; 0x100cb8540
0x1001a9e1a: vmovss xmm1, dword ptr [rcx]
0x1001a9e1e: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1001a9e23: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1001a9e28: vmovss xmm2, dword ptr [rip + 0x8fcc6c] ; 0x100aa6a9c
0x1001a9e30: vmaxss xmm1, xmm2, xmm1
0x1001a9e34: vmovss xmm2, dword ptr [rip + 0x8fcc64] ; 0x100aa6aa0
0x1001a9e3c: vminss xmm1, xmm2, xmm1
0x1001a9e40: vaddss xmm1, xmm1, dword ptr [rdi + 0x4c]
0x1001a9e45: vmovss dword ptr [rdi + 0x4c], xmm1
0x1001a9e4a: mov rax, qword ptr [rdi + 0x40]
0x1001a9e4e: vmovss xmm2, dword ptr [rip + 0x8fd99a] ; 0x100aa77f0
0x1001a9e56: vdivss xmm1, xmm1, xmm2
0x1001a9e5a: vmulss xmm1, xmm1, dword ptr [rdi + 0x48]
0x1001a9e5f: vsubss xmm0, xmm0, xmm1
0x1001a9e63: vpermilps xmm0, xmm0, 0xc0
0x1001a9e69: vmovaps xmmword ptr [rax + 0x3b0], xmm0
0x1001a9e71: vmovss xmm0, dword ptr [rdi + 0x4c]
0x1001a9e76: vucomiss xmm0, xmm2
0x1001a9e7a: jae 0x1001a9e7e
0x1001a9e7c: pop rbp
0x1001a9e7d: ret 
0x1001a9e7e: pop rbp
0x1001a9e7f: jmp 0x10032ef60 ; 0x10032ef60
0x1001a9e84: nop word ptr cs:[rax + rax]
