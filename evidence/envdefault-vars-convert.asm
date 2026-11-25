0x10031be30: push rbp
0x10031be31: mov rbp, rsp
0x10031be34: mov eax, dword ptr [rdi + 0x40]
0x10031be37: mov ecx, dword ptr [rdi + 0x44]
0x10031be3a: mov dword ptr [rdi + 0x1b4], eax
0x10031be40: mov dword ptr [rdi + 0x1b0], ecx
0x10031be46: vmovaps xmm0, xmmword ptr [rdi + 0x50]
0x10031be4b: vmovaps xmmword ptr [rdi + 0x1a0], xmm0
0x10031be53: vmovaps xmm0, xmmword ptr [rdi + 0x60]
0x10031be58: vmovups xmmword ptr [rdi + 0x1b8], xmm0
0x10031be60: vmovaps xmm0, xmmword ptr [rdi + 0x70]
0x10031be65: vmovaps xmmword ptr [rdi + 0x1e0], xmm0
0x10031be6d: vmovaps xmm0, xmmword ptr [rdi + 0x80]
0x10031be75: vmovaps xmmword ptr [rdi + 0x1f0], xmm0
0x10031be7d: vmovaps xmm0, xmmword ptr [rdi + 0x90]
0x10031be85: vmovaps xmmword ptr [rdi + 0x200], xmm0
0x10031be8d: vmovaps xmm0, xmmword ptr [rdi + 0xa0]
0x10031be95: vmovaps xmmword ptr [rdi + 0x210], xmm0
0x10031be9d: vmovaps xmm0, xmmword ptr [rdi + 0xb0]
0x10031bea5: vmovaps xmmword ptr [rdi + 0x220], xmm0
0x10031bead: mov eax, dword ptr [rdi + 0xc0]
0x10031beb3: mov dword ptr [rdi + 0x230], eax
0x10031beb9: mov al, byte ptr [rdi + 0xc4]
0x10031bebf: mov byte ptr [rdi + 0x290], al
0x10031bec5: vmovaps xmm0, xmmword ptr [rdi + 0xe0]
0x10031becd: vmovaps xmmword ptr [rdi + 0x240], xmm0
0x10031bed5: vmovaps xmm0, xmmword ptr [rdi + 0xf0]
0x10031bedd: vmovaps xmmword ptr [rdi + 0x250], xmm0
0x10031bee5: vmovaps xmm0, xmmword ptr [rdi + 0x100]
0x10031beed: vmovaps xmmword ptr [rdi + 0x260], xmm0
0x10031bef5: vmovaps xmm0, xmmword ptr [rdi + 0x110]
0x10031befd: vmovaps xmmword ptr [rdi + 0x270], xmm0
0x10031bf05: vmovaps xmm0, xmmword ptr [rdi + 0x120]
0x10031bf0d: vmovaps xmmword ptr [rdi + 0x280], xmm0
0x10031bf15: vmovss xmm0, dword ptr [rdi + 0x130]
0x10031bf1d: vmulss xmm0, xmm0, dword ptr [rip + 0x78c68b] ; 0x100aa85b0
0x10031bf25: vmovss dword ptr [rdi + 0x2a4], xmm0
0x10031bf2d: mov eax, dword ptr [rdi + 0x134]
0x10031bf33: mov dword ptr [rdi + 0x2a8], eax
0x10031bf39: mov eax, dword ptr [rdi + 0x138]
0x10031bf3f: mov dword ptr [rdi + 0x2ac], eax
0x10031bf45: mov eax, dword ptr [rdi + 0xc8]
0x10031bf4b: mov ecx, dword ptr [rdi + 0xcc]
0x10031bf51: mov dword ptr [rdi + 0x2b0], eax
0x10031bf57: mov dword ptr [rdi + 0x2b4], ecx
0x10031bf5d: mov edx, dword ptr [rdi + 0xd0]
0x10031bf63: mov dword ptr [rdi + 0x2b8], edx
0x10031bf69: vmovd xmm0, ecx
0x10031bf6d: vmovd xmm1, eax
0x10031bf71: vsubss xmm0, xmm0, xmm1
0x10031bf75: vmovss xmm1, dword ptr [rip + 0x789143] ; 0x100aa50c0
0x10031bf7d: vdivss xmm0, xmm1, xmm0
0x10031bf81: vmovss dword ptr [rdi + 0x2bc], xmm0
0x10031bf89: mov eax, dword ptr [rdi + 0xd4]
0x10031bf8f: mov dword ptr [rdi + 0x2c0], eax
0x10031bf95: mov eax, dword ptr [rdi + 0xd8]
0x10031bf9b: mov dword ptr [rdi + 0x2c4], eax
0x10031bfa1: vmovaps xmm0, xmmword ptr [rdi + 0x140]
0x10031bfa9: vmovaps xmmword ptr [rdi + 0x2e0], xmm0
0x10031bfb1: vmovaps xmm0, xmmword ptr [rdi + 0x150]
0x10031bfb9: vmovaps xmmword ptr [rdi + 0x2f0], xmm0
0x10031bfc1: mov eax, dword ptr [rdi + 0x160]
0x10031bfc7: mov dword ptr [rdi + 0x304], eax
0x10031bfcd: vmovaps xmm0, xmmword ptr [rdi + 0x170]
0x10031bfd5: vmovaps xmmword ptr [rdi + 0x320], xmm0
0x10031bfdd: mov eax, dword ptr [rdi + 0x180]
0x10031bfe3: mov dword ptr [rdi + 0x330], eax
0x10031bfe9: mov eax, dword ptr [rdi + 0x184]
0x10031bfef: mov dword ptr [rdi + 0x344], eax
0x10031bff5: vmovss xmm0, dword ptr [rdi + 0x188]
0x10031bffd: vandps xmm1, xmm0, xmmword ptr [rip + 0x78b90b] ; 0x100aa7910
0x10031c005: vmovss dword ptr [rdi + 0x34c], xmm1
0x10031c00d: mov dword ptr [rdi + 0x350], 0x80
0x10031c017: mov byte ptr [rdi + 0x355], 0
0x10031c01e: vxorps xmm2, xmm2, xmm2
0x10031c022: vucomiss xmm0, xmm2
0x10031c026: setae byte ptr [rdi + 0x356]
0x10031c02d: mov byte ptr [rdi + 0x357], 0
0x10031c034: vucomiss xmm1, dword ptr [rip + 0x78aa60] ; 0x100aa6a9c
0x10031c03c: seta byte ptr [rdi + 0x354]
0x10031c043: pop rbp
0x10031c044: ret 
0x10031c045: nop word ptr cs:[rax + rax]
