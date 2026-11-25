0x10031c050: push rbp
0x10031c051: mov rbp, rsp
0x10031c054: mov eax, dword ptr [rdi + 0x5c]
0x10031c057: mov ecx, dword ptr [rdi + 0x60]
0x10031c05a: mov dword ptr [rdi + 0x1e4], eax
0x10031c060: mov dword ptr [rdi + 0x1e0], ecx
0x10031c066: vmovaps xmm0, xmmword ptr [rdi + 0x70]
0x10031c06b: vmovaps xmmword ptr [rdi + 0x1d0], xmm0
0x10031c073: mov eax, dword ptr [rdi + 0x80]
0x10031c079: mov dword ptr [rdi + 0x1e8], eax
0x10031c07f: mov eax, dword ptr [rdi + 0x88]
0x10031c085: mov dword ptr [rdi + 0x1ec], eax
0x10031c08b: mov eax, dword ptr [rdi + 0x8c]
0x10031c091: mov dword ptr [rdi + 0x1f0], eax
0x10031c097: mov eax, dword ptr [rdi + 0x90]
0x10031c09d: mov dword ptr [rdi + 0x1f4], eax
0x10031c0a3: vmovaps xmm0, xmmword ptr [rdi + 0xa0]
0x10031c0ab: vmovaps xmmword ptr [rdi + 0x210], xmm0
0x10031c0b3: vmovaps xmm0, xmmword ptr [rdi + 0xb0]
0x10031c0bb: vmovaps xmmword ptr [rdi + 0x220], xmm0
0x10031c0c3: vmovaps xmm0, xmmword ptr [rdi + 0xc0]
0x10031c0cb: vmovaps xmm1, xmmword ptr [rdi + 0xd0]
0x10031c0d3: vmovaps xmm2, xmmword ptr [rdi + 0xe0]
0x10031c0db: vmovaps xmmword ptr [rdi + 0x230], xmm0
0x10031c0e3: vmovaps xmmword ptr [rdi + 0x240], xmm1
0x10031c0eb: vmovaps xmmword ptr [rdi + 0x250], xmm2
0x10031c0f3: mov eax, dword ptr [rdi + 0xf0]
0x10031c0f9: mov dword ptr [rdi + 0x260], eax
0x10031c0ff: mov al, byte ptr [rdi + 0xf4]
0x10031c105: mov byte ptr [rdi + 0x2c0], al
0x10031c10b: vmovaps xmm0, xmmword ptr [rdi + 0x110]
0x10031c113: vmovaps xmmword ptr [rdi + 0x270], xmm0
0x10031c11b: vmovaps xmm0, xmmword ptr [rdi + 0x120]
0x10031c123: vmovaps xmmword ptr [rdi + 0x280], xmm0
0x10031c12b: vmovaps xmm0, xmmword ptr [rdi + 0x130]
0x10031c133: vmovaps xmmword ptr [rdi + 0x290], xmm0
0x10031c13b: vmovaps xmm0, xmmword ptr [rdi + 0x140]
0x10031c143: vmovaps xmmword ptr [rdi + 0x2a0], xmm0
0x10031c14b: vmovaps xmm0, xmmword ptr [rdi + 0x150]
0x10031c153: vmovaps xmmword ptr [rdi + 0x2b0], xmm0
0x10031c15b: vmovss xmm0, dword ptr [rdi + 0x160]
0x10031c163: vmulss xmm0, xmm0, dword ptr [rip + 0x78c445] ; 0x100aa85b0
0x10031c16b: vmovss dword ptr [rdi + 0x2d4], xmm0
0x10031c173: mov eax, dword ptr [rdi + 0x164]
0x10031c179: mov dword ptr [rdi + 0x2d8], eax
0x10031c17f: mov eax, dword ptr [rdi + 0x168]
0x10031c185: mov dword ptr [rdi + 0x2dc], eax
0x10031c18b: mov eax, dword ptr [rdi + 0xf8]
0x10031c191: mov ecx, dword ptr [rdi + 0xfc]
0x10031c197: mov dword ptr [rdi + 0x2e0], eax
0x10031c19d: mov dword ptr [rdi + 0x2e4], ecx
0x10031c1a3: mov edx, dword ptr [rdi + 0x100]
0x10031c1a9: mov dword ptr [rdi + 0x2e8], edx
0x10031c1af: vmovd xmm0, ecx
0x10031c1b3: vmovd xmm1, eax
0x10031c1b7: vsubss xmm0, xmm0, xmm1
0x10031c1bb: vmovss xmm1, dword ptr [rip + 0x788efd] ; 0x100aa50c0
0x10031c1c3: vdivss xmm0, xmm1, xmm0
0x10031c1c7: vmovss dword ptr [rdi + 0x2ec], xmm0
0x10031c1cf: mov eax, dword ptr [rdi + 0x104]
0x10031c1d5: mov dword ptr [rdi + 0x2f0], eax
0x10031c1db: mov eax, dword ptr [rdi + 0x108]
0x10031c1e1: mov dword ptr [rdi + 0x2f4], eax
0x10031c1e7: vmovaps xmm0, xmmword ptr [rdi + 0x170]
0x10031c1ef: vmovaps xmmword ptr [rdi + 0x310], xmm0
0x10031c1f7: vmovaps xmm0, xmmword ptr [rdi + 0x180]
0x10031c1ff: vmovaps xmmword ptr [rdi + 0x320], xmm0
0x10031c207: mov eax, dword ptr [rdi + 0x190]
0x10031c20d: mov dword ptr [rdi + 0x334], eax
0x10031c213: vmovaps xmm0, xmmword ptr [rdi + 0x1a0]
0x10031c21b: vmovaps xmmword ptr [rdi + 0x350], xmm0
0x10031c223: mov eax, dword ptr [rdi + 0x1b0]
0x10031c229: mov dword ptr [rdi + 0x360], eax
0x10031c22f: mov eax, dword ptr [rdi + 0x1b4]
0x10031c235: mov dword ptr [rdi + 0x374], eax
0x10031c23b: vmovss xmm0, dword ptr [rdi + 0x1b8]
0x10031c243: vandps xmm1, xmm0, xmmword ptr [rip + 0x78b6c5] ; 0x100aa7910
0x10031c24b: vmovss dword ptr [rdi + 0x37c], xmm1
0x10031c253: mov dword ptr [rdi + 0x380], 0x80
0x10031c25d: mov byte ptr [rdi + 0x385], 0
0x10031c264: vxorps xmm2, xmm2, xmm2
0x10031c268: vucomiss xmm0, xmm2
0x10031c26c: setae byte ptr [rdi + 0x386]
0x10031c273: mov byte ptr [rdi + 0x387], 0
0x10031c27a: vucomiss xmm1, dword ptr [rip + 0x78a81a] ; 0x100aa6a9c
0x10031c282: seta byte ptr [rdi + 0x384]
0x10031c289: pop rbp
0x10031c28a: ret 
0x10031c28b: nop dword ptr [rax + rax]
