0x10031bb10: push rbp
0x10031bb11: mov rbp, rsp
0x10031bb14: mov eax, dword ptr [rdi + 0xa4]
0x10031bb1a: mov ecx, dword ptr [rdi + 0xa8]
0x10031bb20: mov dword ptr [rdi + 0x224], eax
0x10031bb26: mov dword ptr [rdi + 0x220], ecx
0x10031bb2c: vmovaps xmm0, xmmword ptr [rdi + 0xb0]
0x10031bb34: vmovaps xmmword ptr [rdi + 0x210], xmm0
0x10031bb3c: mov eax, dword ptr [rdi + 0xc0]
0x10031bb42: mov dword ptr [rdi + 0x228], eax
0x10031bb48: mov eax, dword ptr [rdi + 0xc8]
0x10031bb4e: mov dword ptr [rdi + 0x22c], eax
0x10031bb54: mov rax, qword ptr [rdi + 0xcc]
0x10031bb5b: mov qword ptr [rdi + 0x230], rax
0x10031bb62: vmovaps xmm0, xmmword ptr [rdi + 0xe0]
0x10031bb6a: vmovaps xmmword ptr [rdi + 0x250], xmm0
0x10031bb72: vmovaps xmm0, xmmword ptr [rdi + 0xf0]
0x10031bb7a: vmovaps xmmword ptr [rdi + 0x260], xmm0
0x10031bb82: vmovaps xmm0, xmmword ptr [rdi + 0x100]
0x10031bb8a: vmovaps xmmword ptr [rdi + 0x270], xmm0
0x10031bb92: vmovaps xmm0, xmmword ptr [rdi + 0x110]
0x10031bb9a: vmovaps xmm1, xmmword ptr [rdi + 0x120]
0x10031bba2: vmovaps xmmword ptr [rdi + 0x280], xmm0
0x10031bbaa: vmovaps xmmword ptr [rdi + 0x290], xmm1
0x10031bbb2: mov eax, dword ptr [rdi + 0x130]
0x10031bbb8: mov dword ptr [rdi + 0x2a0], eax
0x10031bbbe: vmovss xmm0, dword ptr [rdi + 0x134]
0x10031bbc6: vmulss xmm0, xmm0, dword ptr [rip + 0x78c9e2] ; 0x100aa85b0
0x10031bbce: vmovss dword ptr [rdi + 0x314], xmm0
0x10031bbd6: mov eax, dword ptr [rdi + 0x138]
0x10031bbdc: mov dword ptr [rdi + 0x318], eax
0x10031bbe2: mov eax, dword ptr [rdi + 0x13c]
0x10031bbe8: mov dword ptr [rdi + 0x31c], eax
0x10031bbee: mov al, byte ptr [rdi + 0x140]
0x10031bbf4: mov byte ptr [rdi + 0x300], al
0x10031bbfa: vmovaps xmm0, xmmword ptr [rdi + 0x160]
0x10031bc02: vmovaps xmmword ptr [rdi + 0x2b0], xmm0
0x10031bc0a: vmovaps xmm0, xmmword ptr [rdi + 0x170]
0x10031bc12: vmovaps xmmword ptr [rdi + 0x2c0], xmm0
0x10031bc1a: vmovaps xmm0, xmmword ptr [rdi + 0x180]
0x10031bc22: vmovaps xmmword ptr [rdi + 0x2d0], xmm0
0x10031bc2a: vmovaps xmm0, xmmword ptr [rdi + 0x190]
0x10031bc32: vmovaps xmmword ptr [rdi + 0x2e0], xmm0
0x10031bc3a: vmovaps xmm0, xmmword ptr [rdi + 0x1a0]
0x10031bc42: vmovaps xmmword ptr [rdi + 0x2f0], xmm0
0x10031bc4a: mov eax, dword ptr [rdi + 0x14c]
0x10031bc50: mov ecx, dword ptr [rdi + 0x150]
0x10031bc56: mov dword ptr [rdi + 0x320], eax
0x10031bc5c: mov dword ptr [rdi + 0x324], ecx
0x10031bc62: mov edx, dword ptr [rdi + 0x154]
0x10031bc68: mov dword ptr [rdi + 0x328], edx
0x10031bc6e: vmovd xmm0, ecx
0x10031bc72: vmovd xmm1, eax
0x10031bc76: vsubss xmm0, xmm0, xmm1
0x10031bc7a: vmovss xmm1, dword ptr [rip + 0x78943e] ; 0x100aa50c0
0x10031bc82: vdivss xmm0, xmm1, xmm0
0x10031bc86: vmovss dword ptr [rdi + 0x32c], xmm0
0x10031bc8e: mov eax, dword ptr [rdi + 0x158]
0x10031bc94: mov dword ptr [rdi + 0x330], eax
0x10031bc9a: mov eax, dword ptr [rdi + 0x15c]
0x10031bca0: mov dword ptr [rdi + 0x334], eax
0x10031bca6: vmovaps xmm0, xmmword ptr [rdi + 0x1b0]
0x10031bcae: vmovaps xmmword ptr [rdi + 0x350], xmm0
0x10031bcb6: vmovaps xmm0, xmmword ptr [rdi + 0x1c0]
0x10031bcbe: vmovaps xmmword ptr [rdi + 0x360], xmm0
0x10031bcc6: mov eax, dword ptr [rdi + 0x1d0]
0x10031bccc: mov dword ptr [rdi + 0x374], eax
0x10031bcd2: vmovaps xmm0, xmmword ptr [rdi + 0x1e0]
0x10031bcda: vmovaps xmmword ptr [rdi + 0x390], xmm0
0x10031bce2: mov eax, dword ptr [rdi + 0x1f0]
0x10031bce8: mov dword ptr [rdi + 0x3a0], eax
0x10031bcee: mov eax, dword ptr [rdi + 0x1f4]
0x10031bcf4: mov dword ptr [rdi + 0x3b4], eax
0x10031bcfa: vmovss xmm0, dword ptr [rdi + 0x1f8]
0x10031bd02: vandps xmm1, xmm0, xmmword ptr [rip + 0x78bc06] ; 0x100aa7910
0x10031bd0a: vmovss dword ptr [rdi + 0x3bc], xmm1
0x10031bd12: mov dword ptr [rdi + 0x3c0], 0x80
0x10031bd1c: mov byte ptr [rdi + 0x3c5], 0
0x10031bd23: vxorps xmm2, xmm2, xmm2
0x10031bd27: vucomiss xmm0, xmm2
0x10031bd2b: setae byte ptr [rdi + 0x3c6]
0x10031bd32: mov byte ptr [rdi + 0x3c7], 0
0x10031bd39: vucomiss xmm1, dword ptr [rip + 0x78ad5b] ; 0x100aa6a9c
0x10031bd41: seta byte ptr [rdi + 0x3c4]
0x10031bd48: pop rbp
0x10031bd49: ret 
0x10031bd4a: nop word ptr [rax + rax]
