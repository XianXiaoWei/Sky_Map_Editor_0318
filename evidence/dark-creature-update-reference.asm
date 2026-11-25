0x10026ddb0: push rbp
0x10026ddb1: mov rbp, rsp
0x10026ddb4: push r15
0x10026ddb6: push r14
0x10026ddb8: push r13
0x10026ddba: push r12
0x10026ddbc: push rbx
0x10026ddbd: and rsp, 0xffffffffffffffe0
0x10026ddc1: sub rsp, 0x3e0
0x10026ddc8: mov qword ptr [rsp + 0xc8], r9
0x10026ddd0: mov r14, r8
0x10026ddd3: mov qword ptr [rsp + 0x58], rcx
0x10026ddd8: mov r15, rdx
0x10026dddb: mov r13, rsi
0x10026ddde: mov r12, rdi
0x10026dde1: mov rbx, qword ptr [rbp + 0x10]
0x10026dde5: mov rax, qword ptr [rip + 0x99faec] ; 0x100c0d8d8
0x10026ddec: mov rax, qword ptr [rax]
0x10026ddef: mov qword ptr [rsp + 0x3c0], rax
0x10026ddf7: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x10026ddfd: vmovss dword ptr [r12 + 0x120], xmm0
0x10026de07: vmovss dword ptr [rsp + 0xa0], xmm1
0x10026de10: vmovss dword ptr [r12 + 0x124], xmm1
0x10026de1a: mov byte ptr [r12 + 0x1d4], 0
0x10026de23: mov byte ptr [r12 + 0x2c0], 0
0x10026de2c: vmovaps xmm2, xmmword ptr [rip + 0xabd61c] ; 0x100d2b450
0x10026de34: vmovaps xmmword ptr [rsp + 0x80], xmm2
0x10026de3d: vxorps xmm0, xmm0, xmm0
0x10026de41: vmovaps xmmword ptr [r12 + 0xc0], xmm0
0x10026de4b: cmp byte ptr [r12 + 0x2c3], 0
0x10026de54: mov qword ptr [rsp + 0x98], r13
0x10026de5c: je 0x10026dea3
0x10026de5e: cmp byte ptr [r12 + 0x2c4], 0
0x10026de67: je 0x10026def0
0x10026de6d: mov eax, dword ptr [r12 + 0x2e0]
0x10026de75: cmp eax, 4
0x10026de78: je 0x10026df00
0x10026de7e: test eax, eax
0x10026de80: jne 0x10026df94
0x10026de86: cmp byte ptr [r12 + 0x2c5], 0
0x10026de8f: mov rax, qword ptr [r12 + 0x50]
0x10026de94: je 0x10026dffb
0x10026de9a: mov r15, qword ptr [rax + 0x18]
0x10026de9e: jmp 0x10026e2e7 ; 0x10026e2e7
0x10026dea3: lea rsi, [r12 + 0x60]
0x10026dea8: lea rdx, [r12 + 0xe0]
0x10026deb0: lea rdi, [rsp + 0x180]
0x10026deb8: vmovss xmm0, dword ptr [rip + 0x837200] ; 0x100aa50c0
0x10026dec0: call 0x10062cb10 ; 0x10062cb10
0x10026dec5: vmovaps xmm0, xmmword ptr [r12 + 0xc0]
0x10026decf: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x180]
0x10026ded8: vmovaps xmmword ptr [r12 + 0xc0], xmm0
0x10026dee2: mov byte ptr [r12 + 0x2c4], 0
0x10026deeb: jmp 0x10026e446 ; 0x10026e446
0x10026def0: mov rdi, r12
0x10026def3: mov rsi, rbx
0x10026def6: call 0x100270010 ; 0x100270010
0x10026defb: jmp 0x10026e446 ; 0x10026e446
0x10026df00: vmovss xmm0, dword ptr [r12 + 0x180]
0x10026df0a: vsubss xmm0, xmm0, dword ptr [rsp + 0x40]
0x10026df10: vmovss dword ptr [r12 + 0x180], xmm0
0x10026df1a: vxorps xmm1, xmm1, xmm1
0x10026df1e: vucomiss xmm1, xmm0
0x10026df22: jb 0x10026df5d
0x10026df24: mov byte ptr [r12 + 0x2d0], 0
0x10026df2d: mov dword ptr [r12 + 0x140], 0
0x10026df39: mov dword ptr [r12 + 0x178], 0
0x10026df45: mov dword ptr [r12 + 0x100], 0x40800000
0x10026df51: mov dword ptr [r12 + 0x2e0], 0
0x10026df5d: vmovaps xmm0, xmmword ptr [rip + 0xabd4cb] ; 0x100d2b430
0x10026df65: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x10026df6e: mov byte ptr [r12 + 0x1d4], 1
0x10026df77: mov byte ptr [r12 + 0x2c0], 1
0x10026df80: cmp byte ptr [r12 + 0x2c7], 0
0x10026df89: jne 0x10026e343
0x10026df8f: jmp 0x10026e446 ; 0x10026e446
0x10026df94: mov cl, byte ptr [r12 + 0x2c7]
0x10026df9c: cmp cl, 2
0x10026df9f: je 0x10026e0dc
0x10026dfa5: cmp cl, 1
0x10026dfa8: jne 0x10026e13d
0x10026dfae: mov rdi, r13
0x10026dfb1: mov r13, r14
0x10026dfb4: mov eax, dword ptr [r12 + 0x2c8]
0x10026dfbc: mov dword ptr [rsp + 0x180], eax
0x10026dfc3: lea rsi, [rsp + 0x180]
0x10026dfcb: call 0x100101e20 ; 0x100101e20
0x10026dfd0: mov r14, rax
0x10026dfd3: test r14, r14
0x10026dfd6: je 0x10026e126
0x10026dfdc: mov rax, qword ptr [r14]
0x10026dfdf: mov rdi, r14
0x10026dfe2: call qword ptr [rax + 0x10]
0x10026dfe5: test al, al
0x10026dfe7: je 0x10026e126
0x10026dfed: mov rax, qword ptr [r14 + 0x18]
0x10026dff1: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10026dff6: jmp 0x10026e11c ; 0x10026e11c
0x10026dffb: mov r15, qword ptr [rax + 0x10]
0x10026dfff: vmovss xmm1, dword ptr [r12 + 0x1a0]
0x10026e009: vmovss xmm0, dword ptr [rax + 0xc]
0x10026e00e: vucomiss xmm0, xmm1
0x10026e012: jbe 0x10026e2cd
0x10026e018: vaddss xmm1, xmm1, dword ptr [rsp + 0x40]
0x10026e01e: vmovss dword ptr [r12 + 0x1a0], xmm1
0x10026e028: vsubss xmm0, xmm0, xmm1
0x10026e02c: vmovss xmm1, dword ptr [rip + 0x8397bc] ; 0x100aa77f0
0x10026e034: vucomiss xmm1, xmm0
0x10026e038: jbe 0x10026e2e7
0x10026e03e: vdivss xmm0, xmm0, dword ptr [rip + 0x8397aa] ; 0x100aa77f0
0x10026e046: vxorps xmm3, xmm3, xmm3
0x10026e04a: vmaxss xmm0, xmm3, xmm0
0x10026e04e: vmovss xmm1, dword ptr [rip + 0x83706a] ; 0x100aa50c0
0x10026e056: vminss xmm0, xmm1, xmm0
0x10026e05a: vsubss xmm1, xmm1, xmm0
0x10026e05e: vmulss xmm1, xmm1, xmm3
0x10026e062: vmulss xmm0, xmm0, dword ptr [rip + 0x838a3e] ; 0x100aa6aa8
0x10026e06a: vaddss xmm0, xmm0, xmm1
0x10026e06e: vmulss xmm0, xmm0, dword ptr [rip + 0x83a942] ; 0x100aa89b8
0x10026e076: vmovaps xmmword ptr [rsp + 0x20], xmm2
0x10026e07c: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10026e081: vmovss xmm1, dword ptr [rip + 0x83652f] ; 0x100aa45b8
0x10026e089: vmulss xmm0, xmm0, xmm1
0x10026e08d: vaddss xmm0, xmm0, xmm1
0x10026e091: vxorps xmm1, xmm1, xmm1
0x10026e095: vmaxss xmm0, xmm1, xmm0
0x10026e099: vmovss xmm1, dword ptr [rip + 0x83701f] ; 0x100aa50c0
0x10026e0a1: vminss xmm0, xmm1, xmm0
0x10026e0a5: vmovaps xmm1, xmmword ptr [rip + 0xabd383] ; 0x100d2b430
0x10026e0ad: vmovaps xmm2, xmmword ptr [rsp + 0x20]
0x10026e0b3: vsubps xmm2, xmm2, xmm1
0x10026e0b7: vpermilps xmm0, xmm0, 0
0x10026e0bd: vmulps xmm0, xmm2, xmm0
0x10026e0c1: vaddps xmm0, xmm1, xmm0
0x10026e0c5: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x10026e0ce: mov byte ptr [r12 + 0x2c0], 1
0x10026e0d7: jmp 0x10026e2e7 ; 0x10026e2e7
0x10026e0dc: mov r13, r14
0x10026e0df: mov eax, dword ptr [r12 + 0x2cc]
0x10026e0e7: cmp rax, 0x3f
0x10026e0eb: ja 0x10026e126
0x10026e0ed: mov rcx, qword ptr [rsp + 0x58]
0x10026e0f2: mov rsi, qword ptr [rcx + rax*8 + 0x10]
0x10026e0f7: test rsi, rsi
0x10026e0fa: je 0x10026e126
0x10026e0fc: cmp byte ptr [rsi + 0xd0], 0
0x10026e103: je 0x10026e126
0x10026e105: mov rax, qword ptr [rsi]
0x10026e108: lea rdi, [rsp + 0x180]
0x10026e110: call qword ptr [rax + 0x58]
0x10026e113: vmovaps xmm0, xmmword ptr [rsp + 0x180]
0x10026e11c: vmovaps xmmword ptr [r12 + 0x130], xmm0
0x10026e126: mov eax, dword ptr [r12 + 0x2e0]
0x10026e12e: mov rbx, qword ptr [rbp + 0x10]
0x10026e132: mov r14, r13
0x10026e135: mov r13, qword ptr [rsp + 0x98]
0x10026e13d: cmp eax, 3
0x10026e140: je 0x10026e1ae
0x10026e142: cmp eax, 2
0x10026e145: je 0x10026e292
0x10026e14b: cmp eax, 1
0x10026e14e: jne 0x10026e446
0x10026e154: mov r15, qword ptr [rbp + 0x18]
0x10026e158: mov al, byte ptr [r12 + 0x2c7]
0x10026e160: cmp al, 2
0x10026e162: je 0x10026e360
0x10026e168: cmp al, 1
0x10026e16a: jne 0x10026e38f
0x10026e170: mov eax, dword ptr [r12 + 0x2c8]
0x10026e178: mov dword ptr [rsp + 0x180], eax
0x10026e17f: lea rsi, [rsp + 0x180]
0x10026e187: mov rdi, r13
0x10026e18a: call 0x100101e20 ; 0x100101e20
0x10026e18f: test rax, rax
0x10026e192: je 0x10026e386
0x10026e198: mov rcx, qword ptr [rax]
0x10026e19b: mov rdi, rax
0x10026e19e: call qword ptr [rcx + 0x10]
0x10026e1a1: test al, al
0x10026e1a3: je 0x10026e386
0x10026e1a9: jmp 0x10026e38f ; 0x10026e38f
0x10026e1ae: lea rsi, [r12 + 0x60]
0x10026e1b3: vmovaps xmm0, xmmword ptr [r12 + 0x60]
0x10026e1ba: vaddps xmm0, xmm0, xmmword ptr [r12 + 0xa0]
0x10026e1c4: vmovaps xmmword ptr [rsp + 0x340], xmm0
0x10026e1cd: lea rdi, [rsp + 0x180]
0x10026e1d5: lea rdx, [rsp + 0x340]
0x10026e1dd: vmovss xmm0, dword ptr [rip + 0x836edb] ; 0x100aa50c0
0x10026e1e5: call 0x10062cb10 ; 0x10062cb10
0x10026e1ea: vmovaps xmm0, xmmword ptr [r12 + 0xc0]
0x10026e1f4: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x180]
0x10026e1fd: vmovaps xmmword ptr [r12 + 0xc0], xmm0
0x10026e207: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x10026e20d: vaddss xmm0, xmm0, dword ptr [r12 + 0x178]
0x10026e217: vmovss dword ptr [r12 + 0x178], xmm0
0x10026e221: vucomiss xmm0, dword ptr [rip + 0x83a42f] ; 0x100aa8658
0x10026e229: jbe 0x10026e27c
0x10026e22b: mov esi, 1
0x10026e230: mov rdi, r12
0x10026e233: call 0x10026d0f0 ; 0x10026d0f0
0x10026e238: mov byte ptr [r12 + 0x2d0], 0
0x10026e241: mov dword ptr [r12 + 0x140], 0
0x10026e24d: mov dword ptr [r12 + 0x178], 0
0x10026e259: mov dword ptr [r12 + 0x100], 0x40800000
0x10026e265: mov dword ptr [r12 + 0x2e0], 0
0x10026e271: mov word ptr [r12 + 0x2c1], 0
0x10026e27c: vmovaps xmm0, xmmword ptr [rip + 0xabd1cc] ; 0x100d2b450
0x10026e284: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x10026e28d: jmp 0x10026e446 ; 0x10026e446
0x10026e292: mov rax, qword ptr [rbp + 0x38]
0x10026e296: mov r9, qword ptr [rbp + 0x30]
0x10026e29a: mov r8, qword ptr [rbp + 0x28]
0x10026e29e: mov qword ptr [rsp + 8], rax
0x10026e2a3: mov qword ptr [rsp], rbx
0x10026e2a7: mov rdi, r12
0x10026e2aa: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x10026e2b0: mov rsi, r13
0x10026e2b3: mov rdx, r15
0x10026e2b6: mov rcx, qword ptr [rsp + 0x58]
0x10026e2bb: call 0x100270960 ; 0x100270960
0x10026e2c0: vmovaps xmm0, xmmword ptr [rip + 0xabd178] ; 0x100d2b440
0x10026e2c8: jmp 0x10026e434 ; 0x10026e434
0x10026e2cd: vmovaps xmm0, xmmword ptr [rip + 0xabd15b] ; 0x100d2b430
0x10026e2d5: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x10026e2de: mov byte ptr [r12 + 0x1d4], 1
0x10026e2e7: lea rsi, [r12 + 0x60]
0x10026e2ec: lea rcx, [r12 + 0x2d4]
0x10026e2f4: movzx r8d, byte ptr [r12 + 0x2c6]
0x10026e2fd: lea rdi, [rsp + 0x180]
0x10026e305: vxorps xmm0, xmm0, xmm0
0x10026e309: mov rdx, r15
0x10026e30c: vmovaps xmm1, xmmword ptr [rsp + 0x40]
0x10026e312: call 0x10062e300 ; 0x10062e300
0x10026e317: vmovaps xmm0, xmmword ptr [r12 + 0xc0]
0x10026e321: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x180]
0x10026e32a: vmovaps xmmword ptr [r12 + 0xc0], xmm0
0x10026e334: cmp byte ptr [r12 + 0x2c7], 0
0x10026e33d: je 0x10026e446
0x10026e343: mov dword ptr [r12 + 0x100], 0x3dcccccd
0x10026e34f: mov dword ptr [r12 + 0x2e0], 1
0x10026e35b: jmp 0x10026e446 ; 0x10026e446
0x10026e360: mov eax, dword ptr [r12 + 0x2cc]
0x10026e368: cmp rax, 0x3f
0x10026e36c: ja 0x10026e386
0x10026e36e: mov rcx, qword ptr [rsp + 0x58]
0x10026e373: mov rax, qword ptr [rcx + rax*8 + 0x10]
0x10026e378: test rax, rax
0x10026e37b: je 0x10026e386
0x10026e37d: cmp byte ptr [rax + 0xd0], 0
0x10026e384: jne 0x10026e38f
0x10026e386: mov byte ptr [r12 + 0x2c7], 0
0x10026e38f: mov rdi, r12
0x10026e392: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x10026e398: mov rdx, rbx
0x10026e39b: mov rcx, r15
0x10026e39e: call 0x1002703d0 ; 0x1002703d0
0x10026e3a3: vmovss xmm0, dword ptr [r12 + 0x140]
0x10026e3ad: vdivss xmm0, xmm0, dword ptr [rip + 0x8386f3] ; 0x100aa6aa8
0x10026e3b5: vxorps xmm2, xmm2, xmm2
0x10026e3b9: vmaxss xmm0, xmm2, xmm0
0x10026e3bd: vmovss xmm1, dword ptr [rip + 0x836cfb] ; 0x100aa50c0
0x10026e3c5: vminss xmm0, xmm1, xmm0
0x10026e3c9: vmulss xmm0, xmm0, xmm0
0x10026e3cd: vsubss xmm1, xmm1, xmm0
0x10026e3d1: vmulss xmm1, xmm1, xmm2
0x10026e3d5: vmulss xmm0, xmm0, dword ptr [rip + 0x83a28f] ; 0x100aa866c
0x10026e3dd: vaddss xmm0, xmm0, xmm1
0x10026e3e1: vmulss xmm0, xmm0, dword ptr [rip + 0x83a5cf] ; 0x100aa89b8
0x10026e3e9: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10026e3ee: vmovss xmm1, dword ptr [rip + 0x8361c2] ; 0x100aa45b8
0x10026e3f6: vmulss xmm0, xmm0, xmm1
0x10026e3fa: vaddss xmm0, xmm0, xmm1
0x10026e3fe: vxorps xmm1, xmm1, xmm1
0x10026e402: vmaxss xmm0, xmm1, xmm0
0x10026e406: vmovss xmm1, dword ptr [rip + 0x836cb2] ; 0x100aa50c0
0x10026e40e: vminss xmm0, xmm1, xmm0
0x10026e412: vmovaps xmm1, xmmword ptr [rip + 0xabd036] ; 0x100d2b450
0x10026e41a: vmovaps xmm2, xmmword ptr [rip + 0xabd01e] ; 0x100d2b440
0x10026e422: vsubps xmm1, xmm1, xmm2
0x10026e426: vpermilps xmm0, xmm0, 0
0x10026e42c: vmulps xmm0, xmm1, xmm0
0x10026e430: vaddps xmm0, xmm2, xmm0
0x10026e434: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x10026e43d: mov byte ptr [r12 + 0x1d4], 1
0x10026e446: mov rdi, qword ptr [r12 + 0x230]
0x10026e44e: vmovaps xmm0, xmmword ptr [r12 + 0x60]
0x10026e455: vinsertps xmm0, xmm0, dword ptr [rip + 0x836c61], 0x30 ; 0x100aa50c0
0x10026e45f: vmovss xmm1, dword ptr [rip + 0x838641] ; 0x100aa6aa8
0x10026e467: vmovaps xmmword ptr [rdi + 0x10], xmm1
0x10026e46c: vmovaps xmm1, xmmword ptr [rip + 0x8464ac] ; 0x100ab4920
0x10026e474: vmovaps xmmword ptr [rdi + 0x20], xmm1
0x10026e479: vmovaps xmm1, xmmword ptr [rip + 0x8464af] ; 0x100ab4930
0x10026e481: vmovaps xmmword ptr [rdi + 0x30], xmm1
0x10026e486: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x10026e48b: call 0x100328de0 ; 0x100328de0
0x10026e490: mov rsi, qword ptr [r12 + 0x218]
0x10026e498: test rsi, rsi
0x10026e49b: je 0x10026e4f6
0x10026e49d: lea rdi, [rsp + 0x180]
0x10026e4a5: call 0x1007f26b0 ; 0x1007f26b0
0x10026e4aa: vmovaps xmm0, xmmword ptr [rsp + 0x180]
0x10026e4b3: vinsertps xmm0, xmm0, dword ptr [rip + 0x836c03], 0x30 ; 0x100aa50c0
0x10026e4bd: mov rdi, qword ptr [r12 + 0x238]
0x10026e4c5: vmovss xmm1, dword ptr [rip + 0x8385db] ; 0x100aa6aa8
0x10026e4cd: vmovaps xmmword ptr [rdi + 0x10], xmm1
0x10026e4d2: vmovaps xmm1, xmmword ptr [rip + 0x846446] ; 0x100ab4920
0x10026e4da: vmovaps xmmword ptr [rdi + 0x20], xmm1
0x10026e4df: vmovaps xmm1, xmmword ptr [rip + 0x846449] ; 0x100ab4930
0x10026e4e7: vmovaps xmmword ptr [rdi + 0x30], xmm1
0x10026e4ec: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x10026e4f1: call 0x100328de0 ; 0x100328de0
0x10026e4f6: vmovaps xmm0, xmmword ptr [r12 + 0x60]
0x10026e4fd: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x10026e503: vmovaps xmmword ptr [r12 + 0xf0], xmm0
0x10026e50d: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x10026e513: vmulss xmm0, xmm0, dword ptr [rip + 0x8463e5] ; 0x100ab4900
0x10026e51b: call 0x100aa2708 ; 0x100aa2708 _expf
0x10026e520: vmovss xmm6, dword ptr [rip + 0x836b98] ; 0x100aa50c0
0x10026e528: vsubss xmm0, xmm6, xmm0
0x10026e52c: vxorps xmm1, xmm1, xmm1
0x10026e530: vmaxss xmm0, xmm1, xmm0
0x10026e534: vminss xmm0, xmm6, xmm0
0x10026e538: vsubss xmm1, xmm6, xmm0
0x10026e53c: vmulss xmm1, xmm1, dword ptr [r12 + 0xb4]
0x10026e546: vmulss xmm0, xmm0, dword ptr [r12 + 0x100]
0x10026e550: vaddss xmm0, xmm0, xmm1
0x10026e554: vmovss dword ptr [r12 + 0xb4], xmm0
0x10026e55e: vpermilps xmm1, xmmword ptr [rsp + 0x40], 0xc0
0x10026e566: vmulps xmm2, xmm1, xmmword ptr [r12 + 0xc0]
0x10026e570: vaddps xmm2, xmm2, xmmword ptr [r12 + 0xa0]
0x10026e57a: vmulps xmm3, xmm2, xmm2
0x10026e57e: vmovshdup xmm4, xmm3
0x10026e582: vaddss xmm4, xmm3, xmm4
0x10026e586: vpermilpd xmm3, xmm3, 1
0x10026e58c: vaddss xmm3, xmm3, xmm4
0x10026e590: vsqrtss xmm3, xmm3, xmm3
0x10026e594: vmovss xmm5, dword ptr [rip + 0x838500] ; 0x100aa6a9c
0x10026e59c: vmaxss xmm4, xmm5, xmm3
0x10026e5a0: vcmpunordss xmm3, xmm3, xmm3
0x10026e5a5: vandnps xmm4, xmm3, xmm4
0x10026e5a9: vandps xmm3, xmm3, xmm5
0x10026e5ad: vorps xmm3, xmm4, xmm3
0x10026e5b1: vdivss xmm0, xmm0, xmm3
0x10026e5b5: vminss xmm3, xmm6, xmm0
0x10026e5b9: vcmpunordss xmm0, xmm0, xmm0
0x10026e5be: vandnps xmm3, xmm0, xmm3
0x10026e5c2: vandps xmm0, xmm0, xmm6
0x10026e5c6: vorps xmm0, xmm3, xmm0
0x10026e5ca: vpermilps xmm0, xmm0, 0xc0
0x10026e5d0: vmulps xmm2, xmm2, xmm0
0x10026e5d4: vmovaps xmmword ptr [r12 + 0xa0], xmm2
0x10026e5de: vmulps xmm0, xmm1, xmm2
0x10026e5e2: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x20]
0x10026e5e8: vmovaps xmmword ptr [r12 + 0x60], xmm0
0x10026e5ef: vmulps xmm1, xmm2, xmm2
0x10026e5f3: vmovshdup xmm3, xmm1
0x10026e5f7: vaddss xmm3, xmm1, xmm3
0x10026e5fb: vpermilpd xmm1, xmm1, 1
0x10026e601: vaddss xmm1, xmm1, xmm3
0x10026e605: vucomiss xmm1, dword ptr [rip + 0x835fab] ; 0x100aa45b8
0x10026e60d: jbe 0x10026e719
0x10026e613: vsqrtss xmm1, xmm1, xmm1
0x10026e617: vucomiss xmm1, dword ptr [rip + 0x8392a5] ; 0x100aa78c4
0x10026e61f: jbe 0x10026e62b
0x10026e621: vpermilps xmm1, xmm1, 0xc0
0x10026e627: vdivps xmm2, xmm2, xmm1
0x10026e62b: vxorps xmm1, xmm2, xmmword ptr [rip + 0x8392cd] ; 0x100aa7900
0x10026e633: vmovddup xmm4, qword ptr [rip + 0x83929d] ; 0x100aa78d8
0x10026e63b: vmulps xmm2, xmm2, xmm4
0x10026e63f: vmovshdup xmm3, xmm2
0x10026e643: vaddss xmm3, xmm2, xmm3
0x10026e647: vpermilpd xmm2, xmm2, 1
0x10026e64d: vaddss xmm2, xmm2, xmm3
0x10026e651: vandps xmm2, xmm2, xmmword ptr [rip + 0x8392b7] ; 0x100aa7910
0x10026e659: vucomiss xmm2, dword ptr [rip + 0x83926b] ; 0x100aa78cc
0x10026e661: jbe 0x10026e66b
0x10026e663: vmovaps xmm4, xmmword ptr [rip + 0x8392b5] ; 0x100aa7920
0x10026e66b: vpermilps xmm2, xmm4, 0xd2
0x10026e671: vmulps xmm2, xmm2, xmm1
0x10026e675: vpshufd xmm3, xmm1, 0xd2
0x10026e67a: vmulps xmm4, xmm3, xmm4
0x10026e67e: vsubps xmm4, xmm2, xmm4
0x10026e682: vpermilps xmm2, xmm4, 0xd2
0x10026e688: vmulps xmm4, xmm4, xmm4
0x10026e68c: vpermilpd xmm5, xmm4, 1
0x10026e692: vaddss xmm5, xmm5, xmm4
0x10026e696: vmovshdup xmm4, xmm4
0x10026e69a: vaddss xmm4, xmm4, xmm5
0x10026e69e: vsqrtss xmm4, xmm4, xmm4
0x10026e6a2: vucomiss xmm4, dword ptr [rip + 0x83921a] ; 0x100aa78c4
0x10026e6aa: jbe 0x10026e6b6
0x10026e6ac: vpermilps xmm4, xmm4, 0xc0
0x10026e6b2: vdivps xmm2, xmm2, xmm4
0x10026e6b6: vmulps xmm3, xmm3, xmm2
0x10026e6ba: vpermilps xmm4, xmm2, 0xd2
0x10026e6c0: vmulps xmm4, xmm4, xmm1
0x10026e6c4: vsubps xmm4, xmm3, xmm4
0x10026e6c8: vpermilps xmm3, xmm4, 0xd2
0x10026e6ce: vmulps xmm4, xmm4, xmm4
0x10026e6d2: vpermilpd xmm5, xmm4, 1
0x10026e6d8: vaddss xmm5, xmm5, xmm4
0x10026e6dc: vmovshdup xmm4, xmm4
0x10026e6e0: vaddss xmm4, xmm4, xmm5
0x10026e6e4: vsqrtss xmm4, xmm4, xmm4
0x10026e6e8: vucomiss xmm4, dword ptr [rip + 0x8391d4] ; 0x100aa78c4
0x10026e6f0: jbe 0x10026e6fc
0x10026e6f2: vpermilps xmm4, xmm4, 0xc0
0x10026e6f8: vdivps xmm3, xmm3, xmm4
0x10026e6fc: vmovaps xmmword ptr [r12 + 0x70], xmm2
0x10026e703: vmovaps xmmword ptr [r12 + 0x80], xmm3
0x10026e70d: vmovaps xmmword ptr [r12 + 0x90], xmm1
0x10026e717: jmp 0x10026e734 ; 0x10026e734
0x10026e719: vmovaps xmm2, xmmword ptr [r12 + 0x70]
0x10026e720: vmovaps xmm3, xmmword ptr [r12 + 0x80]
0x10026e72a: vmovaps xmm1, xmmword ptr [r12 + 0x90]
0x10026e734: vxorps xmm4, xmm4, xmm4
0x10026e738: vblendps xmm2, xmm2, xmm4, 8
0x10026e73e: vblendps xmm3, xmm3, xmm4, 8
0x10026e744: vblendps xmm1, xmm1, xmm4, 8
0x10026e74a: vinsertps xmm0, xmm0, dword ptr [rip + 0x83696c], 0x30 ; 0x100aa50c0
0x10026e754: vmovaps xmm4, xmmword ptr [r12 + 0xd0]
0x10026e75e: vmulps xmm4, xmm4, xmmword ptr [rip + 0x8461da] ; 0x100ab4940
0x10026e766: vpermilps xmm5, xmm4, 0
0x10026e76c: vmulps xmm2, xmm2, xmm5
0x10026e770: vpermilps xmm5, xmm4, 0x55
0x10026e776: vmulps xmm3, xmm3, xmm5
0x10026e77a: vpermilps xmm4, xmm4, 0xaa
0x10026e780: vmulps xmm1, xmm1, xmm4
0x10026e784: vmovaps xmmword ptr [rsp + 0xd0], xmm2
0x10026e78d: vmovaps xmmword ptr [rsp + 0xe0], xmm3
0x10026e796: vmovaps xmmword ptr [rsp + 0xf0], xmm1
0x10026e79f: vmovaps xmmword ptr [rsp + 0x100], xmm0
0x10026e7a8: mov rdi, qword ptr [r12 + 0x1e0]
0x10026e7b0: lea rsi, [rsp + 0xd0]
0x10026e7b8: call 0x100463750 ; 0x100463750
0x10026e7bd: mov rax, qword ptr [r12 + 0x1e0]
0x10026e7c5: lea rcx, [rip + 0x3994] ; 0x100272160
0x10026e7cc: mov qword ptr [rax + 0x3b0], rcx
0x10026e7d3: mov qword ptr [rax + 0x3b8], r12
0x10026e7da: mov rsi, qword ptr [r12 + 0x228]
0x10026e7e2: lea rdi, [rsp + 0x70]
0x10026e7e7: call 0x1007f26b0 ; 0x1007f26b0
0x10026e7ec: vmovaps xmm5, xmmword ptr [r12 + 0x110]
0x10026e7f6: vmovaps xmmword ptr [rsp + 0x130], xmm5
0x10026e7ff: mov eax, dword ptr [r12 + 0x2e0]
0x10026e807: cmp eax, 1
0x10026e80a: vmovaps xmmword ptr [rsp + 0x20], xmm5
0x10026e810: je 0x10026e8df
0x10026e816: cmp eax, 4
0x10026e819: jne 0x10026e8f1
0x10026e81f: vmovss xmm0, dword ptr [r12 + 0x124]
0x10026e829: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10026e82e: vmulss xmm0, xmm0, dword ptr [rip + 0x839482] ; 0x100aa7cb8
0x10026e836: vmulss xmm0, xmm0, dword ptr [rip + 0x839dc2] ; 0x100aa8600
0x10026e83e: vdivss xmm0, xmm0, dword ptr [rip + 0x839dbe] ; 0x100aa8604
0x10026e846: vmulss xmm0, xmm0, dword ptr [rip + 0x835d6a] ; 0x100aa45b8
0x10026e84e: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10026e853: vmovshdup xmm1, xmm0
0x10026e857: vxorps xmm2, xmm2, xmm2
0x10026e85b: vblendps xmm0, xmm2, xmm0, 1
0x10026e861: vblendps xmm2, xmm2, xmm1, 1
0x10026e867: vshufps xmm0, xmm0, xmm2, 0x11
0x10026e86c: vmovaps xmm2, xmmword ptr [r12 + 0x190]
0x10026e876: vpermilps xmm3, xmm2, 0xe7
0x10026e87c: vpermilps xmm4, xmm2, 0xff
0x10026e882: vmulps xmm4, xmm4, xmm0
0x10026e886: vpermilps xmm5, xmm1, 0xc0
0x10026e88c: vmulps xmm5, xmm2, xmm5
0x10026e890: vaddps xmm4, xmm4, xmm5
0x10026e894: vpermilps xmm5, xmm2, 0xd2
0x10026e89a: vmulps xmm5, xmm5, xmm0
0x10026e89e: vpermilps xmm6, xmm0, 0xd2
0x10026e8a4: vmulps xmm6, xmm2, xmm6
0x10026e8a8: vsubps xmm5, xmm5, xmm6
0x10026e8ac: vpermilps xmm5, xmm5, 0xd2
0x10026e8b2: vaddps xmm4, xmm4, xmm5
0x10026e8b6: vmulss xmm1, xmm1, xmm3
0x10026e8ba: vmulps xmm0, xmm2, xmm0
0x10026e8be: vmovshdup xmm2, xmm0
0x10026e8c2: vaddss xmm2, xmm0, xmm2
0x10026e8c6: vpermilpd xmm0, xmm0, 1
0x10026e8cc: vaddss xmm0, xmm0, xmm2
0x10026e8d0: vsubss xmm0, xmm1, xmm0
0x10026e8d4: vinsertps xmm0, xmm4, xmm0, 0x30
0x10026e8da: jmp 0x10026eb3e ; 0x10026eb3e
0x10026e8df: vmovaps xmm0, xmmword ptr [r12 + 0x130]
0x10026e8e9: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x70]
0x10026e8ef: jmp 0x10026e8fb ; 0x10026e8fb
0x10026e8f1: vmovaps xmm0, xmmword ptr [r12 + 0xa0]
0x10026e8fb: vmulps xmm1, xmm0, xmm0
0x10026e8ff: vmovshdup xmm2, xmm1
0x10026e903: vaddss xmm2, xmm1, xmm2
0x10026e907: vpermilpd xmm1, xmm1, 1
0x10026e90d: vaddss xmm1, xmm1, xmm2
0x10026e911: vsqrtss xmm1, xmm1, xmm1
0x10026e915: vucomiss xmm1, dword ptr [rip + 0x838fa7] ; 0x100aa78c4
0x10026e91d: jbe 0x10026e929
0x10026e91f: vpermilps xmm1, xmm1, 0xc0
0x10026e925: vdivps xmm0, xmm0, xmm1
0x10026e929: vxorps xmm1, xmm0, xmmword ptr [rip + 0x838fcf] ; 0x100aa7900
0x10026e931: vmovddup xmm2, qword ptr [rip + 0x838f9f] ; 0x100aa78d8
0x10026e939: vmulps xmm1, xmm1, xmm2
0x10026e93d: vmovshdup xmm3, xmm1
0x10026e941: vaddss xmm3, xmm1, xmm3
0x10026e945: vpermilpd xmm1, xmm1, 1
0x10026e94b: vaddss xmm1, xmm1, xmm3
0x10026e94f: vandps xmm1, xmm1, xmmword ptr [rip + 0x838fb9] ; 0x100aa7910
0x10026e957: vucomiss xmm1, dword ptr [rip + 0x838f6d] ; 0x100aa78cc
0x10026e95f: jbe 0x10026e969
0x10026e961: vmovaps xmm2, xmmword ptr [rip + 0x838fb7] ; 0x100aa7920
0x10026e969: vpermilps xmm1, xmm2, 0xd2
0x10026e96f: vmulps xmm3, xmm0, xmm1
0x10026e973: vpermilps xmm1, xmm0, 0xd2
0x10026e979: vmulps xmm2, xmm1, xmm2
0x10026e97d: vsubps xmm3, xmm3, xmm2
0x10026e981: vpermilps xmm2, xmm3, 0xd2
0x10026e987: vmulps xmm3, xmm3, xmm3
0x10026e98b: vpermilpd xmm4, xmm3, 1
0x10026e991: vaddss xmm4, xmm4, xmm3
0x10026e995: vmovshdup xmm3, xmm3
0x10026e999: vaddss xmm3, xmm3, xmm4
0x10026e99d: vsqrtss xmm3, xmm3, xmm3
0x10026e9a1: vucomiss xmm3, dword ptr [rip + 0x838f1b] ; 0x100aa78c4
0x10026e9a9: jbe 0x10026e9b5
0x10026e9ab: vpermilps xmm3, xmm3, 0xc0
0x10026e9b1: vdivps xmm2, xmm2, xmm3
0x10026e9b5: vmulps xmm1, xmm1, xmm2
0x10026e9b9: vpermilps xmm3, xmm2, 0xd2
0x10026e9bf: vmulps xmm3, xmm0, xmm3
0x10026e9c3: vsubps xmm3, xmm1, xmm3
0x10026e9c7: vpermilps xmm1, xmm3, 0xd2
0x10026e9cd: vmulps xmm3, xmm3, xmm3
0x10026e9d1: vpermilpd xmm4, xmm3, 1
0x10026e9d7: vaddss xmm4, xmm4, xmm3
0x10026e9db: vmovshdup xmm3, xmm3
0x10026e9df: vaddss xmm3, xmm3, xmm4
0x10026e9e3: vsqrtss xmm3, xmm3, xmm3
0x10026e9e7: vucomiss xmm3, dword ptr [rip + 0x838ed5] ; 0x100aa78c4
0x10026e9ef: jbe 0x10026e9fb
0x10026e9f1: vpermilps xmm3, xmm3, 0xc0
0x10026e9f7: vdivps xmm1, xmm1, xmm3
0x10026e9fb: vpermilpd xmm3, xmm2, 1
0x10026ea01: vmovshdup xmm4, xmm1
0x10026ea05: vmovshdup xmm9, xmm0
0x10026ea09: vpermilpd xmm5, xmm0, 1
0x10026ea0f: vaddss xmm6, xmm2, xmm4
0x10026ea13: vaddss xmm6, xmm5, xmm6
0x10026ea17: vxorps xmm7, xmm7, xmm7
0x10026ea1b: vucomiss xmm7, xmm6
0x10026ea1f: seta sil
0x10026ea23: vucomiss xmm5, xmm2
0x10026ea27: seta dl
0x10026ea2a: vucomiss xmm5, xmm4
0x10026ea2e: seta al
0x10026ea31: vucomiss xmm4, xmm2
0x10026ea35: setbe bl
0x10026ea38: seta dil
0x10026ea3c: or dil, dl
0x10026ea3f: or bl, al
0x10026ea41: vmovaps xmm7, xmmword ptr [rip + 0x838eb7] ; 0x100aa7900
0x10026ea49: mov ecx, edi
0x10026ea4b: and cl, sil
0x10026ea4e: jne 0x10026ea56
0x10026ea50: vmovaps xmm8, xmm2
0x10026ea54: jmp 0x10026ea5e ; 0x10026ea5e
0x10026ea56: vxorps xmm8, xmm2, xmm7
0x10026ea5a: vxorps xmm9, xmm9, xmm7
0x10026ea5e: and dl, al
0x10026ea60: vxorpd xmm10, xmm3, xmm7
0x10026ea64: and bl, sil
0x10026ea67: je 0x10026ea6d
0x10026ea69: vxorps xmm4, xmm4, xmm7
0x10026ea6d: xor dl, 1
0x10026ea70: test bl, bl
0x10026ea72: jne 0x10026ea78
0x10026ea74: vmovapd xmm10, xmm3
0x10026ea78: vmovshdup xmm2, xmm2
0x10026ea7c: vpermilpd xmm3, xmm1, 1
0x10026ea82: and dl, sil
0x10026ea85: je 0x10026ea8f
0x10026ea87: vxorps xmm5, xmm5, xmm7
0x10026ea8b: vxorps xmm1, xmm1, xmm7
0x10026ea8f: vaddss xmm4, xmm8, xmm4
0x10026ea93: vaddss xmm4, xmm5, xmm4
0x10026ea97: vmovss xmm5, dword ptr [rip + 0x836621] ; 0x100aa50c0
0x10026ea9f: vaddss xmm7, xmm4, xmm5
0x10026eaa3: vsqrtss xmm4, xmm7, xmm7
0x10026eaa7: vdivss xmm4, xmm5, xmm4
0x10026eaab: vmulss xmm6, xmm4, dword ptr [rip + 0x835b05] ; 0x100aa45b8
0x10026eab3: vsubss xmm3, xmm3, xmm9
0x10026eab8: vmulss xmm3, xmm6, xmm3
0x10026eabc: vsubss xmm0, xmm0, xmm10
0x10026eac1: vmulss xmm4, xmm6, xmm0
0x10026eac5: vsubss xmm0, xmm2, xmm1
0x10026eac9: vmulss xmm5, xmm6, xmm0
0x10026eacd: vmulss xmm0, xmm6, xmm7
0x10026ead1: jne 0x10026eaf0
0x10026ead3: vmovaps xmm1, xmm4
0x10026ead7: vmovaps xmm2, xmm0
0x10026eadb: mov eax, edi
0x10026eadd: and al, sil
0x10026eae0: je 0x10026eb03
0x10026eae2: vmovaps xmm4, xmm2
0x10026eae6: vmovaps xmm2, xmm5
0x10026eaea: test dl, dl
0x10026eaec: je 0x10026eb0b
0x10026eaee: jmp 0x10026eb0f ; 0x10026eb0f
0x10026eaf0: vmovaps xmm1, xmm5
0x10026eaf4: vmovaps xmm5, xmm4
0x10026eaf8: vmovaps xmm2, xmm3
0x10026eafc: mov eax, edi
0x10026eafe: and al, sil
0x10026eb01: jne 0x10026eae2
0x10026eb03: vmovaps xmm4, xmm5
0x10026eb07: test dl, dl
0x10026eb09: jne 0x10026eb0f
0x10026eb0b: vmovaps xmm0, xmm3
0x10026eb0f: vmovaps xmm3, xmm0
0x10026eb13: and dil, sil
0x10026eb16: jne 0x10026eb23
0x10026eb18: vmovaps xmm3, xmm1
0x10026eb1c: test dil, dil
0x10026eb1f: je 0x10026eb28
0x10026eb21: jmp 0x10026eb2c ; 0x10026eb2c
0x10026eb23: test dil, dil
0x10026eb26: jne 0x10026eb2c
0x10026eb28: vmovaps xmm1, xmm0
0x10026eb2c: vinsertps xmm0, xmm1, xmm3, 0x10
0x10026eb32: vinsertps xmm0, xmm0, xmm4, 0x20
0x10026eb38: vinsertps xmm0, xmm0, xmm2, 0x30
0x10026eb3e: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10026eb44: vmovaps xmmword ptr [r12 + 0x110], xmm0
0x10026eb4e: vmovss xmm0, dword ptr [r12 + 0x120]
0x10026eb58: vmulss xmm0, xmm0, dword ptr [rip + 0x839e50] ; 0x100aa89b0
0x10026eb60: call 0x100aa2708 ; 0x100aa2708 _expf
0x10026eb65: vmovaps xmm6, xmmword ptr [rsp + 0x20]
0x10026eb6b: vmulps xmm1, xmm6, xmm6
0x10026eb6f: vpermilpd xmm2, xmm1, 1
0x10026eb75: vaddps xmm1, xmm1, xmm2
0x10026eb79: vmovshdup xmm2, xmm1
0x10026eb7d: vaddss xmm1, xmm1, xmm2
0x10026eb81: vsqrtss xmm1, xmm1, xmm1
0x10026eb85: vucomiss xmm1, dword ptr [rip + 0x838d37] ; 0x100aa78c4
0x10026eb8d: jbe 0x10026eb99
0x10026eb8f: vpermilps xmm1, xmm1, 0
0x10026eb95: vdivps xmm6, xmm6, xmm1
0x10026eb99: vmovss xmm5, dword ptr [rip + 0x83651f] ; 0x100aa50c0
0x10026eba1: vmovaps xmm7, xmmword ptr [rsp + 0x30]
0x10026eba7: vmulps xmm1, xmm7, xmm7
0x10026ebab: vpermilpd xmm2, xmm1, 1
0x10026ebb1: vaddps xmm1, xmm1, xmm2
0x10026ebb5: vmovshdup xmm2, xmm1
0x10026ebb9: vaddss xmm1, xmm1, xmm2
0x10026ebbd: vsqrtss xmm1, xmm1, xmm1
0x10026ebc1: vucomiss xmm1, dword ptr [rip + 0x838cfb] ; 0x100aa78c4
0x10026ebc9: jbe 0x10026ebd5
0x10026ebcb: vpermilps xmm1, xmm1, 0
0x10026ebd1: vdivps xmm7, xmm7, xmm1
0x10026ebd5: vmulps xmm1, xmm6, xmm7
0x10026ebd9: vpermilpd xmm2, xmm1, 1
0x10026ebdf: vaddps xmm1, xmm1, xmm2
0x10026ebe3: vmovshdup xmm2, xmm1
0x10026ebe7: vaddss xmm1, xmm1, xmm2
0x10026ebeb: vxorps xmm2, xmm2, xmm2
0x10026ebef: vucomiss xmm2, xmm1
0x10026ebf3: vmovaps xmm4, xmmword ptr [rip + 0x838d05] ; 0x100aa7900
0x10026ebfb: vxorps xmm3, xmm1, xmm4
0x10026ebff: jbe 0x10026ec05
0x10026ec01: vxorps xmm6, xmm6, xmm4
0x10026ec05: vsubss xmm4, xmm5, xmm0
0x10026ec09: vcmpltss xmm0, xmm1, xmm2
0x10026ec0e: vblendvps xmm0, xmm1, xmm3, xmm0
0x10026ec14: vmovss xmm1, dword ptr [rip + 0x838cb0] ; 0x100aa78cc
0x10026ec1c: vucomiss xmm1, xmm0
0x10026ec20: jbe 0x10026ecae
0x10026ec26: vmovaps xmmword ptr [rsp + 0x20], xmm6
0x10026ec2c: vmovaps xmmword ptr [rsp + 0x30], xmm7
0x10026ec32: vmovss dword ptr [rsp + 0x60], xmm4
0x10026ec38: call 0x100aa2576 ; 0x100aa2576 _acosf
0x10026ec3d: vmovss dword ptr [rsp + 0x50], xmm0
0x10026ec43: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10026ec48: vmovss xmm1, dword ptr [rip + 0x836470] ; 0x100aa50c0
0x10026ec50: vdivss xmm0, xmm1, xmm0
0x10026ec54: vmovss dword ptr [rsp + 0x54], xmm0
0x10026ec5a: vsubss xmm0, xmm1, dword ptr [rsp + 0x60]
0x10026ec60: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x10026ec66: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10026ec6b: vmulss xmm0, xmm0, dword ptr [rsp + 0x54]
0x10026ec71: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x10026ec7a: vmovss xmm0, dword ptr [rsp + 0x50]
0x10026ec80: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x10026ec86: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10026ec8b: vmovaps xmm1, xmmword ptr [rsp + 0x120]
0x10026ec94: vmovss xmm4, dword ptr [rsp + 0x60]
0x10026ec9a: vmovaps xmm7, xmmword ptr [rsp + 0x30]
0x10026eca0: vmovaps xmm6, xmmword ptr [rsp + 0x20]
0x10026eca6: vmulss xmm0, xmm0, dword ptr [rsp + 0x54]
0x10026ecac: jmp 0x10026ecb6 ; 0x10026ecb6
0x10026ecae: vsubss xmm1, xmm5, xmm4
0x10026ecb2: vmovaps xmm0, xmm4
0x10026ecb6: lea rbx, [r12 + 0x110]
0x10026ecbe: vpermilps xmm1, xmm1, 0
0x10026ecc4: vmulps xmm1, xmm6, xmm1
0x10026ecc8: vpermilps xmm0, xmm0, 0
0x10026ecce: vmulps xmm0, xmm7, xmm0
0x10026ecd2: vaddps xmm0, xmm0, xmm1
0x10026ecd6: vpermilps xmm1, xmm0, 0xe7
0x10026ecdc: vucomiss xmm1, xmm1
0x10026ece0: jp 0x10026ecf8
0x10026ece2: vmovshdup xmm1, xmm0
0x10026ece6: vucomiss xmm0, xmm1
0x10026ecea: jp 0x10026ecf8
0x10026ecec: vpermilpd xmm1, xmm0, 1
0x10026ecf2: vucomiss xmm1, xmm1
0x10026ecf6: jnp 0x10026ed10
0x10026ecf8: vxorps xmm0, xmm0, xmm0
0x10026ecfc: vucomiss xmm4, xmm0
0x10026ed00: lea rax, [rsp + 0x130]
0x10026ed08: cmova rax, rbx
0x10026ed0c: vmovaps xmm0, xmmword ptr [rax]
0x10026ed10: vmovaps xmmword ptr [r12 + 0x110], xmm0
0x10026ed1a: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x10026ed20: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x100], 8
0x10026ed2b: vmovaps xmm1, xmmword ptr [r12 + 0xd0]
0x10026ed35: vmulps xmm1, xmm1, xmmword ptr [rip + 0x839283] ; 0x100aa7fc0
0x10026ed3d: vpermilps xmm2, xmm1, 0
0x10026ed43: vmulps xmm2, xmm2, xmmword ptr [rsp + 0xd0]
0x10026ed4c: vpermilps xmm3, xmm1, 0x55
0x10026ed52: vmulps xmm3, xmm3, xmmword ptr [rsp + 0xe0]
0x10026ed5b: vpermilps xmm1, xmm1, 0xaa
0x10026ed61: vmulps xmm1, xmm1, xmmword ptr [rsp + 0xf0]
0x10026ed6a: vmovaps xmmword ptr [rsp + 0xd0], xmm2
0x10026ed73: vmovaps xmmword ptr [rsp + 0xe0], xmm3
0x10026ed7c: vmovaps xmmword ptr [rsp + 0xf0], xmm1
0x10026ed85: vmovaps xmmword ptr [rsp + 0x100], xmm0
0x10026ed8e: mov rdi, qword ptr [r12 + 0x1e8]
0x10026ed96: lea rsi, [rsp + 0xd0]
0x10026ed9e: call 0x100463750 ; 0x100463750
0x10026eda3: cmp dword ptr [r12 + 0x2e0], 1
0x10026edac: jne 0x10026ee90
0x10026edb2: vmovaps xmm0, xmmword ptr [r12 + 0x130]
0x10026edbc: vmovaps xmm3, xmmword ptr [rsp + 0x70]
0x10026edc2: vsubps xmm0, xmm0, xmm3
0x10026edc6: vmulps xmm1, xmm0, xmm0
0x10026edca: vmovshdup xmm2, xmm1
0x10026edce: vaddss xmm2, xmm1, xmm2
0x10026edd2: vpermilpd xmm1, xmm1, 1
0x10026edd8: vaddss xmm1, xmm1, xmm2
0x10026eddc: vsqrtss xmm1, xmm1, xmm1
0x10026ede0: vucomiss xmm1, dword ptr [rip + 0x838adc] ; 0x100aa78c4
0x10026ede8: jbe 0x10026edf4
0x10026edea: vpermilps xmm1, xmm1, 0xc0
0x10026edf0: vdivps xmm0, xmm0, xmm1
0x10026edf4: vxorps xmm4, xmm0, xmmword ptr [rip + 0x838b04] ; 0x100aa7900
0x10026edfc: vmovddup xmm1, qword ptr [rip + 0x838ad4] ; 0x100aa78d8
0x10026ee04: vmulps xmm0, xmm0, xmm1
0x10026ee08: vmovshdup xmm2, xmm0
0x10026ee0c: vaddss xmm2, xmm0, xmm2
0x10026ee10: vpermilpd xmm0, xmm0, 1
0x10026ee16: vaddss xmm0, xmm0, xmm2
0x10026ee1a: vandps xmm0, xmm0, xmmword ptr [rip + 0x838aee] ; 0x100aa7910
0x10026ee22: vucomiss xmm0, dword ptr [rip + 0x838aa2] ; 0x100aa78cc
0x10026ee2a: jbe 0x10026ee34
0x10026ee2c: vmovaps xmm1, xmmword ptr [rip + 0x838aec] ; 0x100aa7920
0x10026ee34: vpermilps xmm0, xmm1, 0xd2
0x10026ee3a: vmulps xmm0, xmm0, xmm4
0x10026ee3e: vpshufd xmm2, xmm4, 0xd2
0x10026ee43: vmulps xmm1, xmm2, xmm1
0x10026ee47: vsubps xmm0, xmm0, xmm1
0x10026ee4b: vpermilps xmm2, xmm0, 0xd2
0x10026ee51: vmulps xmm0, xmm0, xmm0
0x10026ee55: vpermilpd xmm1, xmm0, 1
0x10026ee5b: vaddss xmm1, xmm1, xmm0
0x10026ee5f: vmovshdup xmm0, xmm0
0x10026ee63: vaddss xmm0, xmm0, xmm1
0x10026ee67: vsqrtss xmm0, xmm0, xmm0
0x10026ee6b: vucomiss xmm0, dword ptr [rip + 0x838a51] ; 0x100aa78c4
0x10026ee73: vmovaps xmmword ptr [rsp + 0x30], xmm3
0x10026ee79: jbe 0x10026ee85
0x10026ee7b: vpermilps xmm0, xmm0, 0xc0
0x10026ee81: vdivps xmm2, xmm2, xmm0
0x10026ee85: vmovaps xmmword ptr [rsp + 0x20], xmm2
0x10026ee8b: jmp 0x10026efab ; 0x10026efab
0x10026ee90: vmovss xmm0, dword ptr [rip + 0xabc5d8] ; 0x100d2b470
0x10026ee98: vaddss xmm0, xmm0, dword ptr [rip + 0x839760] ; 0x100aa8600
0x10026eea0: vmulss xmm0, xmm0, dword ptr [rip + 0x835710] ; 0x100aa45b8
0x10026eea8: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10026eead: vmovshdup xmm1, xmm0
0x10026eeb1: vinsertps xmm0, xmm0, xmm0, 0x76
0x10026eeb7: vmovaps xmm2, xmmword ptr [rbx]
0x10026eebb: vpermilps xmm3, xmm2, 0xe7
0x10026eec1: vpermilps xmm4, xmm2, 0xff
0x10026eec7: vmulps xmm4, xmm4, xmm0
0x10026eecb: vpermilps xmm5, xmm1, 0xc0
0x10026eed1: vmulps xmm5, xmm2, xmm5
0x10026eed5: vaddps xmm4, xmm4, xmm5
0x10026eed9: vpermilps xmm5, xmm2, 0xd2
0x10026eedf: vmulps xmm5, xmm5, xmm0
0x10026eee3: vpermilps xmm6, xmm0, 0xd2
0x10026eee9: vmulps xmm6, xmm2, xmm6
0x10026eeed: vsubps xmm5, xmm5, xmm6
0x10026eef1: vpermilps xmm5, xmm5, 0xd2
0x10026eef7: vaddps xmm4, xmm4, xmm5
0x10026eefb: vmulss xmm1, xmm1, xmm3
0x10026eeff: vmulps xmm0, xmm2, xmm0
0x10026ef03: vmovshdup xmm2, xmm0
0x10026ef07: vaddss xmm2, xmm0, xmm2
0x10026ef0b: vpermilpd xmm0, xmm0, 1
0x10026ef11: vaddss xmm0, xmm0, xmm2
0x10026ef15: vsubss xmm0, xmm1, xmm0
0x10026ef19: vmovshdup xmm1, xmm4
0x10026ef1d: vpermilpd xmm2, xmm4, 1
0x10026ef23: vaddss xmm3, xmm4, xmm4
0x10026ef27: vaddss xmm5, xmm1, xmm1
0x10026ef2b: vaddss xmm6, xmm2, xmm2
0x10026ef2f: vmulss xmm8, xmm4, xmm3
0x10026ef33: vmulss xmm7, xmm4, xmm5
0x10026ef37: vmulss xmm4, xmm4, xmm6
0x10026ef3b: vmulss xmm9, xmm0, xmm3
0x10026ef3f: vmulss xmm3, xmm1, xmm5
0x10026ef43: vmulss xmm1, xmm1, xmm6
0x10026ef47: vmulss xmm5, xmm0, xmm5
0x10026ef4b: vmulss xmm2, xmm2, xmm6
0x10026ef4f: vmulss xmm0, xmm0, xmm6
0x10026ef53: vmovss xmm6, dword ptr [rip + 0x836165] ; 0x100aa50c0
0x10026ef5b: vmovaps xmm10, xmm6
0x10026ef5f: vsubss xmm6, xmm10, xmm3
0x10026ef63: vsubss xmm2, xmm6, xmm2
0x10026ef67: vaddss xmm0, xmm7, xmm0
0x10026ef6b: vsubss xmm6, xmm4, xmm5
0x10026ef6f: vinsertps xmm0, xmm2, xmm0, 0x10
0x10026ef75: vinsertps xmm0, xmm0, xmm6, 0x20
0x10026ef7b: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x10026ef81: vsubss xmm0, xmm10, xmm8
0x10026ef86: vaddss xmm2, xmm4, xmm5
0x10026ef8a: vsubss xmm1, xmm1, xmm9
0x10026ef8f: vsubss xmm0, xmm0, xmm3
0x10026ef93: vinsertps xmm1, xmm2, xmm1, 0x10
0x10026ef99: vinsertps xmm4, xmm1, xmm0, 0x20
0x10026ef9f: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x10026efa5: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10026efab: vmovaps xmmword ptr [rsp + 0x60], xmm4
0x10026efb1: vxorps xmm0, xmm4, xmmword ptr [rip + 0x838947] ; 0x100aa7900
0x10026efb9: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x10026efc2: vmovss xmm0, dword ptr [rsp + 0xa0]
0x10026efcb: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10026efd0: vmovshdup xmm1, xmm0
0x10026efd4: vmovss xmm2, dword ptr [rip + 0x837acc] ; 0x100aa6aa8
0x10026efdc: vmulss xmm0, xmm0, xmm2
0x10026efe0: vmulss xmm1, xmm1, xmm2
0x10026efe4: lea r15, [r12 + 0x1b0]
0x10026efec: vmovaps xmm3, xmmword ptr [r12 + 0x1b0]
0x10026eff6: vmovaps xmm6, xmmword ptr [rsp + 0x60]
0x10026effc: vmulps xmm2, xmm6, xmmword ptr [rip + 0x84594c] ; 0x100ab4950
0x10026f004: vaddps xmm2, xmm2, xmmword ptr [rsp + 0x30]
0x10026f00a: vpermilps xmm0, xmm0, 0xc0
0x10026f010: vmulps xmm4, xmm0, xmmword ptr [rsp + 0x20]
0x10026f016: vaddps xmm0, xmm2, xmm4
0x10026f01a: vpermilps xmm5, xmm1, 0xc0
0x10026f020: vmulps xmm1, xmm5, xmm6
0x10026f024: vsubps xmm1, xmm0, xmm1
0x10026f028: mov al, byte ptr [r12 + 0x2c7]
0x10026f030: cmp al, 2
0x10026f032: je 0x10026f0d6
0x10026f038: cmp al, 1
0x10026f03a: je 0x10026f133
0x10026f040: vmovaps xmm0, xmm3
0x10026f044: test al, al
0x10026f046: vmovss xmm2, dword ptr [rip + 0x836072] ; 0x100aa50c0
0x10026f04e: jne 0x10026f224
0x10026f054: vmovaps xmmword ptr [rsp + 0x60], xmm5
0x10026f05a: vmovaps xmmword ptr [rsp + 0xa0], xmm4
0x10026f063: vmovaps xmmword ptr [rsp + 0x30], xmm1
0x10026f069: vmovaps xmmword ptr [rsp + 0x20], xmm3
0x10026f06f: movabs rax, 0x2a00000001
0x10026f079: mov qword ptr [rsp + 0x340], rax
0x10026f081: mov byte ptr [rsp + 0x348], 1
0x10026f089: vxorps xmm0, xmm0, xmm0
0x10026f08d: vmovups xmmword ptr [rsp + 0x350], xmm0
0x10026f096: lea rsi, [rsp + 0x70]
0x10026f09b: lea rdx, [rsp + 0x110]
0x10026f0a3: vmovss xmm0, dword ptr [rip + 0x839921] ; 0x100aa89cc
0x10026f0ab: lea rcx, [rsp + 0x340]
0x10026f0b3: lea r8, [rsp + 0x180]
0x10026f0bb: mov rdi, r14
0x10026f0be: call 0x100776a90 ; 0x100776a90
0x10026f0c3: test al, al
0x10026f0c5: jne 0x10026f18d
0x10026f0cb: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x10026f0d1: jmp 0x10026f196 ; 0x10026f196
0x10026f0d6: mov eax, dword ptr [r12 + 0x2cc]
0x10026f0de: cmp rax, 0x3f
0x10026f0e2: ja 0x10026f213
0x10026f0e8: mov rcx, qword ptr [rsp + 0x58]
0x10026f0ed: mov rsi, qword ptr [rcx + rax*8 + 0x10]
0x10026f0f2: test rsi, rsi
0x10026f0f5: vmovss xmm2, dword ptr [rip + 0x835fc3] ; 0x100aa50c0
0x10026f0fd: je 0x10026f21b
0x10026f103: mov rax, qword ptr [rsi]
0x10026f106: lea rdi, [rsp + 0x180]
0x10026f10e: vmovaps xmmword ptr [rsp + 0x20], xmm3
0x10026f114: call qword ptr [rax + 0x58]
0x10026f117: vmovaps xmm3, xmmword ptr [rsp + 0x20]
0x10026f11d: vmovss xmm2, dword ptr [rip + 0x835f9b] ; 0x100aa50c0
0x10026f125: vmovaps xmm1, xmmword ptr [rsp + 0x180]
0x10026f12e: jmp 0x10026f21b ; 0x10026f21b
0x10026f133: vmovaps xmmword ptr [rsp + 0x20], xmm3
0x10026f139: mov eax, dword ptr [r12 + 0x2c8]
0x10026f141: mov dword ptr [rsp + 0x180], eax
0x10026f148: lea rsi, [rsp + 0x180]
0x10026f150: mov rdi, r13
0x10026f153: vmovaps xmmword ptr [rsp + 0x30], xmm1
0x10026f159: call 0x100101e20 ; 0x100101e20
0x10026f15e: vmovaps xmm0, xmmword ptr [rsp + 0x30]
0x10026f164: test rax, rax
0x10026f167: je 0x10026f175
0x10026f169: mov rax, qword ptr [rax + 0x18]
0x10026f16d: vmovaps xmm0, xmmword ptr [rax + 0x130]
0x10026f175: vmovaps xmmword ptr [r15], xmm0
0x10026f17a: vmovss xmm2, dword ptr [rip + 0x835f3e] ; 0x100aa50c0
0x10026f182: vmovaps xmm3, xmmword ptr [rsp + 0x20]
0x10026f188: jmp 0x10026f224 ; 0x10026f224
0x10026f18d: vmovaps xmm1, xmmword ptr [rsp + 0x180]
0x10026f196: vmovaps xmm2, xmmword ptr [rsp + 0xa0]
0x10026f19f: vmovaps xmm0, xmmword ptr [rsp + 0x60]
0x10026f1a5: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x110]
0x10026f1ae: vaddps xmm0, xmm2, xmm0
0x10026f1b2: vaddps xmm0, xmm1, xmm0
0x10026f1b6: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10026f1bc: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x10026f1c2: vmulss xmm0, xmm0, dword ptr [rip + 0x84573a] ; 0x100ab4904
0x10026f1ca: call 0x100aa2708 ; 0x100aa2708 _expf
0x10026f1cf: vmovss xmm2, dword ptr [rip + 0x835ee9] ; 0x100aa50c0
0x10026f1d7: vsubss xmm0, xmm2, xmm0
0x10026f1db: vxorps xmm1, xmm1, xmm1
0x10026f1df: vmaxss xmm0, xmm1, xmm0
0x10026f1e3: vminss xmm0, xmm2, xmm0
0x10026f1e7: vsubss xmm1, xmm2, xmm0
0x10026f1eb: vpermilps xmm1, xmm1, 0xc0
0x10026f1f1: vmulps xmm1, xmm1, xmmword ptr [r15]
0x10026f1f6: vpermilps xmm0, xmm0, 0xc0
0x10026f1fc: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x10026f202: vaddps xmm0, xmm0, xmm1
0x10026f206: vmovaps xmmword ptr [r15], xmm0
0x10026f20b: vmovaps xmm3, xmmword ptr [rsp + 0x20]
0x10026f211: jmp 0x10026f224 ; 0x10026f224
0x10026f213: vmovss xmm2, dword ptr [rip + 0x835ea5] ; 0x100aa50c0
0x10026f21b: vmovaps xmmword ptr [r15], xmm1
0x10026f220: vmovaps xmm0, xmm1
0x10026f224: mov r13, r14
0x10026f227: vsubps xmm0, xmm0, xmm3
0x10026f22b: vmovaps xmmword ptr [r12 + 0x1c0], xmm0
0x10026f235: vmovss xmm0, dword ptr [r12 + 0x140]
0x10026f23f: vdivss xmm0, xmm0, dword ptr [rip + 0x837861] ; 0x100aa6aa8
0x10026f247: vxorps xmm1, xmm1, xmm1
0x10026f24b: vmaxss xmm0, xmm1, xmm0
0x10026f24f: vminss xmm1, xmm2, xmm0
0x10026f253: vmovss dword ptr [rsp + 0x20], xmm1
0x10026f259: vsubss xmm0, xmm2, xmm1
0x10026f25d: vmulss xmm0, xmm0, dword ptr [rip + 0x838577] ; 0x100aa77dc
0x10026f265: vmulss xmm1, xmm1, dword ptr [rip + 0x838a53] ; 0x100aa7cc0
0x10026f26d: vaddss xmm0, xmm1, xmm0
0x10026f271: vmovss dword ptr [r12 + 0x1d0], xmm0
0x10026f27b: lea r14, [rsp + 0x80]
0x10026f283: vmovss xmm1, dword ptr [rip + 0x838561] ; 0x100aa77ec
0x10026f28b: mov rbx, qword ptr [rsp + 0xc8]
0x10026f293: mov rdi, rbx
0x10026f296: mov rsi, r14
0x10026f299: mov rdx, r15
0x10026f29c: call 0x100416140 ; 0x100416140
0x10026f2a1: lea rdx, [rsp + 0x70]
0x10026f2a6: vmovss xmm0, dword ptr [rip + 0x8377fe] ; 0x100aa6aac
0x10026f2ae: vmovss xmm1, dword ptr [rip + 0x83933e] ; 0x100aa85f4
0x10026f2b6: mov rdi, rbx
0x10026f2b9: mov rsi, r14
0x10026f2bc: vmovss xmm2, dword ptr [rip + 0x835dfc] ; 0x100aa50c0
0x10026f2c4: call 0x100416140 ; 0x100416140
0x10026f2c9: mov rdi, qword ptr [r12 + 0x1e8]
0x10026f2d1: lea rdx, [rip + 0x8f5519] ; 0x100b647f1 u_diffuseColor
0x10026f2d8: xor esi, esi
0x10026f2da: mov rcx, r14
0x10026f2dd: call 0x100466a50 ; 0x100466a50
0x10026f2e2: vmovss xmm0, dword ptr [rsp + 0x20]
0x10026f2e8: vucomiss xmm0, dword ptr [rip + 0x837df4] ; 0x100aa70e4
0x10026f2f0: jbe 0x10026f307
0x10026f2f2: mov rsi, qword ptr [r12 + 0x228]
0x10026f2fa: lea rdi, [rsp + 0x180]
0x10026f302: call 0x1007f26b0 ; 0x1007f26b0
0x10026f307: mov r14, qword ptr [r12 + 0x1d8]
0x10026f30f: vmovaps xmm0, xmmword ptr [r12 + 0x1b0]
0x10026f319: vinsertps xmm0, xmm0, dword ptr [rip + 0x835d9d], 0x30 ; 0x100aa50c0
0x10026f323: vmovss xmm1, dword ptr [rip + 0x835d95] ; 0x100aa50c0
0x10026f32b: vmovaps xmmword ptr [rsp + 0x140], xmm1
0x10026f334: vmovaps xmm1, xmmword ptr [rip + 0x838d64] ; 0x100aa80a0
0x10026f33c: vmovaps xmmword ptr [rsp + 0x150], xmm1
0x10026f345: vmovaps xmm1, xmmword ptr [rip + 0x8396e3] ; 0x100aa8a30
0x10026f34d: vmovaps xmmword ptr [rsp + 0x160], xmm1
0x10026f356: vmovaps xmmword ptr [rsp + 0x170], xmm0
0x10026f35f: vbroadcastss xmm0, dword ptr [r12 + 0x1d0]
0x10026f369: vmovss xmm1, dword ptr [r12 + 0x1d0]
0x10026f373: vxorps xmm2, xmm2, xmm2
0x10026f377: vblendps xmm3, xmm2, xmm0, 2
0x10026f37d: vblendps xmm0, xmm2, xmm0, 4
0x10026f383: vmovaps xmmword ptr [rsp + 0x340], xmm1
0x10026f38c: vmovaps xmmword ptr [rsp + 0x350], xmm3
0x10026f395: vmovaps xmmword ptr [rsp + 0x360], xmm0
0x10026f39e: vmovaps xmm0, xmmword ptr [rip + 0x83965a] ; 0x100aa8a00
0x10026f3a6: vmovaps xmmword ptr [rsp + 0x370], xmm0
0x10026f3af: lea rbx, [rsp + 0x180]
0x10026f3b7: lea rsi, [rsp + 0x140]
0x10026f3bf: lea rdx, [rsp + 0x340]
0x10026f3c7: mov rdi, rbx
0x10026f3ca: call 0x100076df0 ; 0x100076df0
0x10026f3cf: mov rdi, r14
0x10026f3d2: mov rsi, rbx
0x10026f3d5: call 0x10043ccd0 ; 0x10043ccd0
0x10026f3da: mov rax, qword ptr [r12 + 0x1f8]
0x10026f3e2: test rax, rax
0x10026f3e5: je 0x10026f41e
0x10026f3e7: vmovss xmm0, dword ptr [r12 + 0x200]
0x10026f3f1: vsubss xmm0, xmm0, dword ptr [rsp + 0x40]
0x10026f3f7: vmovss dword ptr [r12 + 0x200], xmm0
0x10026f401: vxorps xmm1, xmm1, xmm1
0x10026f405: vucomiss xmm1, xmm0
0x10026f409: jbe 0x10026f41e
0x10026f40b: mov byte ptr [rax + 0xb1], 1
0x10026f412: mov qword ptr [r12 + 0x1f8], 0
0x10026f41e: cmp byte ptr [r12 + 0x2c7], 0
0x10026f427: je 0x10026f6bc
0x10026f42d: mov rdi, qword ptr [rsp + 0x98]
0x10026f435: call 0x1000ff210 ; 0x1000ff210
0x10026f43a: test rax, rax
0x10026f43d: je 0x10026f6bc
0x10026f443: mov rax, qword ptr [rax + 0x18]
0x10026f447: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10026f44c: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x1b0]
0x10026f456: vmulps xmm0, xmm0, xmm0
0x10026f45a: vmovshdup xmm1, xmm0
0x10026f45e: vaddss xmm1, xmm0, xmm1
0x10026f462: vpermilpd xmm0, xmm0, 1
0x10026f468: vaddss xmm0, xmm0, xmm1
0x10026f46c: vmovss xmm1, dword ptr [r12 + 0x1d0]
0x10026f476: vmulss xmm1, xmm1, xmm1
0x10026f47a: vucomiss xmm1, xmm0
0x10026f47e: jbe 0x10026f6bc
0x10026f484: mov rsi, qword ptr [rbp + 0x20]
0x10026f488: lea rdi, [rsp + 0x180]
0x10026f490: xor ebx, ebx
0x10026f492: xor edx, edx
0x10026f494: call 0x1001e2ac0 ; 0x1001e2ac0
0x10026f499: mov rax, qword ptr [rsp + 0x180]
0x10026f4a1: test rax, rax
0x10026f4a4: je 0x10026f4aa
0x10026f4a6: mov rbx, qword ptr [rax + 0x10]
0x10026f4aa: mov qword ptr [rsp + 0xb0], rbx
0x10026f4b2: call 0x1001ddff0 ; 0x1001ddff0
0x10026f4b7: mov r14, rax
0x10026f4ba: mov qword ptr [rsp + 0x340], 0
0x10026f4c6: call 0x10073aa80 ; 0x10073aa80
0x10026f4cb: mov rbx, qword ptr [rax]
0x10026f4ce: lea rsi, [rsp + 0x340]
0x10026f4d6: lea rdx, [rsp + 0xb0]
0x10026f4de: mov rdi, rax
0x10026f4e1: mov rcx, r14
0x10026f4e4: call qword ptr [rbx + 0x40]
0x10026f4e7: mov r14, qword ptr [rsp + 0x340]
0x10026f4ef: mov rax, qword ptr [rsp + 0x180]
0x10026f4f7: test rax, rax
0x10026f4fa: je 0x10026f555
0x10026f4fc: mov rcx, qword ptr [rsp + 0x188]
0x10026f504: mov rdx, qword ptr [rsp + 0x190]
0x10026f50c: test rdx, rdx
0x10026f50f: lea rdx, [rdx + 8]
0x10026f513: cmove rdx, rax
0x10026f517: mov qword ptr [rdx], rcx
0x10026f51a: mov rcx, qword ptr [rsp + 0x188]
0x10026f522: mov rdx, qword ptr [rsp + 0x190]
0x10026f52a: add rax, 8
0x10026f52e: test rcx, rcx
0x10026f531: lea rcx, [rcx + 0x10]
0x10026f535: cmove rcx, rax
0x10026f539: mov qword ptr [rcx], rdx
0x10026f53c: vxorps xmm0, xmm0, xmm0
0x10026f540: vmovaps xmmword ptr [rsp + 0x180], xmm0
0x10026f549: mov qword ptr [rsp + 0x190], 0
0x10026f555: test r14, r14
0x10026f558: je 0x10026f6bc
0x10026f55e: lea r15, [r12 + 0x130]
0x10026f566: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x10026f56c: vsubps xmm2, xmm0, xmmword ptr [r12 + 0x130]
0x10026f576: vmulps xmm0, xmm2, xmm2
0x10026f57a: vmovshdup xmm1, xmm0
0x10026f57e: vaddss xmm1, xmm0, xmm1
0x10026f582: vpermilpd xmm0, xmm0, 1
0x10026f588: vaddss xmm0, xmm0, xmm1
0x10026f58c: vsqrtss xmm0, xmm0, xmm0
0x10026f590: vucomiss xmm0, dword ptr [rip + 0x837504] ; 0x100aa6a9c
0x10026f598: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x10026f59e: jbe 0x10026f5aa
0x10026f5a0: vpermilps xmm0, xmm0, 0xc0
0x10026f5a6: vdivps xmm2, xmm2, xmm0
0x10026f5aa: vmovaps xmmword ptr [rsp + 0x20], xmm2
0x10026f5b0: vmovaps xmmword ptr [rsp + 0xb0], xmm2
0x10026f5b9: vpermilpd xmm1, xmm2, 1
0x10026f5bf: vmovaps xmm0, xmm2
0x10026f5c3: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10026f5c8: vmovss dword ptr [rsp + 0x30], xmm0
0x10026f5ce: vmovaps xmm1, xmmword ptr [rsp + 0x20]
0x10026f5d4: vmovshdup xmm0, xmm1
0x10026f5d8: vmulps xmm1, xmm1, xmm1
0x10026f5dc: vmovshdup xmm2, xmm1
0x10026f5e0: vaddss xmm2, xmm1, xmm2
0x10026f5e4: vpermilpd xmm1, xmm1, 1
0x10026f5ea: vaddss xmm1, xmm1, xmm2
0x10026f5ee: vsqrtss xmm1, xmm1, xmm1
0x10026f5f2: vmovss xmm2, dword ptr [rip + 0x8374a2] ; 0x100aa6a9c
0x10026f5fa: vmovaps xmm3, xmm2
0x10026f5fe: vmaxss xmm2, xmm3, xmm1
0x10026f602: vcmpunordss xmm1, xmm1, xmm1
0x10026f607: vandnps xmm2, xmm1, xmm2
0x10026f60b: vandps xmm1, xmm1, xmm3
0x10026f60f: vorps xmm1, xmm2, xmm1
0x10026f613: vdivss xmm0, xmm0, xmm1
0x10026f617: call 0x100aa2588 ; 0x100aa2588 _asinf
0x10026f61c: vmovss dword ptr [rsp + 0x20], xmm0
0x10026f622: movabs rax, 0x2a00000001
0x10026f62c: mov qword ptr [rsp + 0x340], rax
0x10026f634: mov byte ptr [rsp + 0x348], 1
0x10026f63c: vxorps xmm0, xmm0, xmm0
0x10026f640: vmovups xmmword ptr [rsp + 0x350], xmm0
0x10026f649: lea rdx, [rsp + 0xb0]
0x10026f651: lea rcx, [rsp + 0x340]
0x10026f659: lea r8, [rsp + 0x180]
0x10026f661: mov rdi, r13
0x10026f664: mov rsi, r15
0x10026f667: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x10026f66d: call 0x100776a90 ; 0x100776a90
0x10026f672: test al, al
0x10026f674: jne 0x10026f67e
0x10026f676: vmovss xmm0, dword ptr [rsp + 0x30]
0x10026f67c: jmp 0x10026f68c ; 0x10026f68c
0x10026f67e: vmovss xmm0, dword ptr [rsp + 0x30]
0x10026f684: vaddss xmm0, xmm0, dword ptr [rip + 0x838fa8] ; 0x100aa8634
0x10026f68c: mov rax, qword ptr [r14]
0x10026f68f: vmovss xmm1, dword ptr [rip + 0x838f5d] ; 0x100aa85f4
0x10026f697: xor esi, esi
0x10026f699: xor edx, edx
0x10026f69b: mov rdi, r14
0x10026f69e: call qword ptr [rax + 0x20]
0x10026f6a1: mov rax, qword ptr [r14]
0x10026f6a4: xor esi, esi
0x10026f6a6: xor edx, edx
0x10026f6a8: mov rdi, r14
0x10026f6ab: vmovss xmm0, dword ptr [rsp + 0x20]
0x10026f6b1: vmovss xmm1, dword ptr [rip + 0x838f3b] ; 0x100aa85f4
0x10026f6b9: call qword ptr [rax + 0x28]
0x10026f6bc: cmp byte ptr [r12 + 0x2c3], 0
0x10026f6c5: mov r14, qword ptr [rbp + 0x10]
0x10026f6c9: je 0x10026fd8f
0x10026f6cf: mov rdi, qword ptr [r12 + 0x250]
0x10026f6d7: test rdi, rdi
0x10026f6da: je 0x10026f709
0x10026f6dc: mov rbx, qword ptr [r12 + 0x258]
0x10026f6e4: test rbx, rbx
0x10026f6e7: je 0x10026f709
0x10026f6e9: mov rax, qword ptr [rdi]
0x10026f6ec: call qword ptr [rax]
0x10026f6ee: cmp rbx, rax
0x10026f6f1: jne 0x10026f709
0x10026f6f3: mov rdi, qword ptr [r12 + 0x250]
0x10026f6fb: mov rax, qword ptr [rdi]
0x10026f6fe: call qword ptr [rax + 0x10]
0x10026f701: test al, al
0x10026f703: jne 0x10026f821
0x10026f709: vxorps ymm0, ymm0, ymm0
0x10026f70d: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10026f716: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10026f71f: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10026f728: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10026f731: mov byte ptr [rsp + 0x34d], 1
0x10026f739: mov dword ptr [rsp + 0x340], 0x3f800000
0x10026f744: vmovaps xmm1, xmmword ptr [r12 + 0x60]
0x10026f74b: vmovaps xmmword ptr [rsp + 0x350], xmm1
0x10026f754: movabs rax, 0x42a0000040400000
0x10026f75e: mov qword ptr [rsp + 0x388], rax
0x10026f766: mov dword ptr [rsp + 0x3b0], 0xc31
0x10026f771: vmovups ymmword ptr [rsp + 0x310], ymm0
0x10026f77a: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10026f783: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10026f78c: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10026f795: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10026f79e: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10026f7a7: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10026f7b0: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10026f7b9: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10026f7c2: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10026f7cb: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10026f7d4: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10026f7dd: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10026f7e6: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10026f7ef: lea rsi, [rip + 0x90d441] ; 0x100b7cc37 DuskCreatureIdleLP
0x10026f7f6: lea rdx, [rsp + 0x340]
0x10026f7fe: lea rcx, [rsp + 0x180]
0x10026f806: mov rdi, r14
0x10026f809: vzeroupper 
0x10026f80c: call 0x1006018a0 ; 0x1006018a0
0x10026f811: mov qword ptr [r12 + 0x250], rax
0x10026f819: mov qword ptr [r12 + 0x258], rdx
0x10026f821: mov eax, dword ptr [r12 + 0x2e0]
0x10026f829: or eax, 4
0x10026f82c: cmp eax, 4
0x10026f82f: jne 0x10026f84b
0x10026f831: cmp byte ptr [r12 + 0x1d4], 0
0x10026f83a: je 0x10026f84b
0x10026f83c: cmp byte ptr [r12 + 0x2c5], 0
0x10026f845: je 0x10026fa76
0x10026f84b: mov rdi, qword ptr [r12 + 0x260]
0x10026f853: test rdi, rdi
0x10026f856: je 0x10026fc3e
0x10026f85c: mov rbx, qword ptr [r12 + 0x268]
0x10026f864: test rbx, rbx
0x10026f867: je 0x10026fc3e
0x10026f86d: mov rax, qword ptr [rdi]
0x10026f870: call qword ptr [rax]
0x10026f872: cmp rbx, rax
0x10026f875: jne 0x10026fc3e
0x10026f87b: mov rdi, qword ptr [r12 + 0x260]
0x10026f883: mov rax, qword ptr [rdi]
0x10026f886: xor esi, esi
0x10026f888: call qword ptr [rax + 0x30]
0x10026f88b: cmp byte ptr [r12 + 0x2c0], 0
0x10026f894: je 0x10026fc4d
0x10026f89a: mov rdi, qword ptr [r12 + 0x2b0]
0x10026f8a2: test rdi, rdi
0x10026f8a5: je 0x10026f904
0x10026f8a7: mov rbx, qword ptr [r12 + 0x2b8]
0x10026f8af: test rbx, rbx
0x10026f8b2: je 0x10026f904
0x10026f8b4: mov rax, qword ptr [rdi]
0x10026f8b7: call qword ptr [rax]
0x10026f8b9: cmp rbx, rax
0x10026f8bc: jne 0x10026f904
0x10026f8be: mov rdi, qword ptr [r12 + 0x2b0]
0x10026f8c6: mov rax, qword ptr [rdi]
0x10026f8c9: call qword ptr [rax + 0x10]
0x10026f8cc: test al, al
0x10026f8ce: je 0x10026f904
0x10026f8d0: mov rdi, qword ptr [r12 + 0x2b0]
0x10026f8d8: test rdi, rdi
0x10026f8db: je 0x10026f904
0x10026f8dd: mov rbx, qword ptr [r12 + 0x2b8]
0x10026f8e5: test rbx, rbx
0x10026f8e8: je 0x10026f904
0x10026f8ea: mov rax, qword ptr [rdi]
0x10026f8ed: call qword ptr [rax]
0x10026f8ef: cmp rbx, rax
0x10026f8f2: jne 0x10026f904
0x10026f8f4: mov rdi, qword ptr [r12 + 0x2b0]
0x10026f8fc: mov rax, qword ptr [rdi]
0x10026f8ff: xor esi, esi
0x10026f901: call qword ptr [rax + 0x30]
0x10026f904: mov byte ptr [r12 + 0x2c2], 0
0x10026f90d: mov rdi, qword ptr [r12 + 0x260]
0x10026f915: test rdi, rdi
0x10026f918: je 0x10026f947
0x10026f91a: mov rbx, qword ptr [r12 + 0x268]
0x10026f922: test rbx, rbx
0x10026f925: je 0x10026f947
0x10026f927: mov rax, qword ptr [rdi]
0x10026f92a: call qword ptr [rax]
0x10026f92c: cmp rbx, rax
0x10026f92f: jne 0x10026f947
0x10026f931: mov rdi, qword ptr [r12 + 0x260]
0x10026f939: mov rax, qword ptr [rdi]
0x10026f93c: call qword ptr [rax + 0x10]
0x10026f93f: test al, al
0x10026f941: jne 0x10026fc4d
0x10026f947: vxorps ymm0, ymm0, ymm0
0x10026f94b: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10026f954: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10026f95d: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10026f966: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10026f96f: mov byte ptr [rsp + 0x34d], 1
0x10026f977: mov dword ptr [rsp + 0x340], 0x3f800000
0x10026f982: vmovaps xmm1, xmmword ptr [r12 + 0x1b0]
0x10026f98c: vmovaps xmmword ptr [rsp + 0x350], xmm1
0x10026f995: movabs rax, 0x425c00003f000000
0x10026f99f: mov qword ptr [rsp + 0x388], rax
0x10026f9a7: mov dword ptr [rsp + 0x3b0], 0xc31
0x10026f9b2: vmovups ymmword ptr [rsp + 0x310], ymm0
0x10026f9bb: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10026f9c4: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10026f9cd: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10026f9d6: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10026f9df: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10026f9e8: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10026f9f1: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10026f9fa: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10026fa03: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10026fa0c: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10026fa15: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10026fa1e: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10026fa27: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10026fa30: lea rsi, [rip + 0x90d213] ; 0x100b7cc4a SearchlightLP
0x10026fa37: lea rdx, [rsp + 0x340]
0x10026fa3f: lea rcx, [rsp + 0x180]
0x10026fa47: mov rdi, r14
0x10026fa4a: vzeroupper 
0x10026fa4d: call 0x1006018a0 ; 0x1006018a0
0x10026fa52: mov qword ptr [r12 + 0x260], rax
0x10026fa5a: mov qword ptr [r12 + 0x268], rdx
0x10026fa62: cmp dword ptr [r12 + 0x2e0], 1
0x10026fa6b: jne 0x10026fd8f
0x10026fa71: jmp 0x10026fc5c ; 0x10026fc5c
0x10026fa76: mov rdi, qword ptr [r12 + 0x2b0]
0x10026fa7e: test rdi, rdi
0x10026fa81: je 0x10026fae0
0x10026fa83: mov rbx, qword ptr [r12 + 0x2b8]
0x10026fa8b: test rbx, rbx
0x10026fa8e: je 0x10026fae0
0x10026fa90: mov rax, qword ptr [rdi]
0x10026fa93: call qword ptr [rax]
0x10026fa95: cmp rbx, rax
0x10026fa98: jne 0x10026fae0
0x10026fa9a: mov rdi, qword ptr [r12 + 0x2b0]
0x10026faa2: mov rax, qword ptr [rdi]
0x10026faa5: call qword ptr [rax + 0x10]
0x10026faa8: test al, al
0x10026faaa: je 0x10026fae0
0x10026faac: mov rdi, qword ptr [r12 + 0x2b0]
0x10026fab4: test rdi, rdi
0x10026fab7: je 0x10026fae0
0x10026fab9: mov rbx, qword ptr [r12 + 0x2b8]
0x10026fac1: test rbx, rbx
0x10026fac4: je 0x10026fae0
0x10026fac6: mov rax, qword ptr [rdi]
0x10026fac9: call qword ptr [rax]
0x10026facb: cmp rbx, rax
0x10026face: jne 0x10026fae0
0x10026fad0: mov rdi, qword ptr [r12 + 0x2b0]
0x10026fad8: mov rax, qword ptr [rdi]
0x10026fadb: xor esi, esi
0x10026fadd: call qword ptr [rax + 0x30]
0x10026fae0: mov byte ptr [r12 + 0x2c2], 0
0x10026fae9: mov rdi, qword ptr [r12 + 0x260]
0x10026faf1: test rdi, rdi
0x10026faf4: je 0x10026fb23
0x10026faf6: mov rbx, qword ptr [r12 + 0x268]
0x10026fafe: test rbx, rbx
0x10026fb01: je 0x10026fb23
0x10026fb03: mov rax, qword ptr [rdi]
0x10026fb06: call qword ptr [rax]
0x10026fb08: cmp rbx, rax
0x10026fb0b: jne 0x10026fb23
0x10026fb0d: mov rdi, qword ptr [r12 + 0x260]
0x10026fb15: mov rax, qword ptr [rdi]
0x10026fb18: call qword ptr [rax + 0x10]
0x10026fb1b: test al, al
0x10026fb1d: jne 0x10026fc3e
0x10026fb23: vxorps ymm0, ymm0, ymm0
0x10026fb27: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10026fb30: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10026fb39: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10026fb42: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10026fb4b: mov byte ptr [rsp + 0x34d], 1
0x10026fb53: mov dword ptr [rsp + 0x340], 0x3f800000
0x10026fb5e: vmovaps xmm1, xmmword ptr [r12 + 0x1b0]
0x10026fb68: vmovaps xmmword ptr [rsp + 0x350], xmm1
0x10026fb71: movabs rax, 0x425c00003f000000
0x10026fb7b: mov qword ptr [rsp + 0x388], rax
0x10026fb83: mov dword ptr [rsp + 0x3b0], 0xc31
0x10026fb8e: vmovups ymmword ptr [rsp + 0x310], ymm0
0x10026fb97: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10026fba0: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10026fba9: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10026fbb2: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10026fbbb: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10026fbc4: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10026fbcd: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10026fbd6: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10026fbdf: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10026fbe8: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10026fbf1: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10026fbfa: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10026fc03: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10026fc0c: lea rsi, [rip + 0x90d037] ; 0x100b7cc4a SearchlightLP
0x10026fc13: lea rdx, [rsp + 0x340]
0x10026fc1b: lea rcx, [rsp + 0x180]
0x10026fc23: mov rdi, r14
0x10026fc26: vzeroupper 
0x10026fc29: call 0x1006018a0 ; 0x1006018a0
0x10026fc2e: mov qword ptr [r12 + 0x260], rax
0x10026fc36: mov qword ptr [r12 + 0x268], rdx
0x10026fc3e: cmp byte ptr [r12 + 0x2c0], 0
0x10026fc47: jne 0x10026f89a
0x10026fc4d: cmp dword ptr [r12 + 0x2e0], 1
0x10026fc56: jne 0x10026fd8f
0x10026fc5c: cmp byte ptr [r12 + 0x2c2], 0
0x10026fc65: jne 0x10026fd8f
0x10026fc6b: vxorps ymm0, ymm0, ymm0
0x10026fc6f: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10026fc78: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10026fc81: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10026fc8a: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10026fc93: mov byte ptr [rsp + 0x34d], 1
0x10026fc9b: mov dword ptr [rsp + 0x340], 0x3f800000
0x10026fca6: vmovaps xmm1, xmmword ptr [r12 + 0x1b0]
0x10026fcb0: vmovaps xmmword ptr [rsp + 0x350], xmm1
0x10026fcb9: movabs rax, 0x41f0000040400000
0x10026fcc3: mov qword ptr [rsp + 0x388], rax
0x10026fccb: mov dword ptr [rsp + 0x3b0], 0xc31
0x10026fcd6: vmovups ymmword ptr [rsp + 0x310], ymm0
0x10026fcdf: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10026fce8: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10026fcf1: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10026fcfa: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10026fd03: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10026fd0c: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10026fd15: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10026fd1e: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10026fd27: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10026fd30: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10026fd39: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10026fd42: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10026fd4b: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10026fd54: lea rsi, [rip + 0x90cefd] ; 0x100b7cc58 SearchlightFind
0x10026fd5b: lea rdx, [rsp + 0x340]
0x10026fd63: lea rcx, [rsp + 0x180]
0x10026fd6b: mov rdi, r14
0x10026fd6e: vzeroupper 
0x10026fd71: call 0x1006018a0 ; 0x1006018a0
0x10026fd76: mov qword ptr [r12 + 0x2b0], rax
0x10026fd7e: mov qword ptr [r12 + 0x2b8], rdx
0x10026fd86: mov byte ptr [r12 + 0x2c2], 1
0x10026fd8f: vxorps ymm1, ymm1, ymm1
0x10026fd93: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10026fd9c: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10026fda5: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x10026fdae: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10026fdb7: vmovaps xmm0, xmmword ptr [r12 + 0x60]
0x10026fdbe: vmovaps xmmword ptr [rsp + 0x190], xmm0
0x10026fdc7: mov dword ptr [rsp + 0x1f0], 0x20
0x10026fdd2: mov rdi, qword ptr [r12 + 0x250]
0x10026fdda: test rdi, rdi
0x10026fddd: je 0x10026fe1a
0x10026fddf: mov rbx, qword ptr [r12 + 0x258]
0x10026fde7: test rbx, rbx
0x10026fdea: je 0x10026fe1a
0x10026fdec: mov rax, qword ptr [rdi]
0x10026fdef: vzeroupper 
0x10026fdf2: call qword ptr [rax]
0x10026fdf4: vxorps ymm1, ymm1, ymm1
0x10026fdf8: cmp rbx, rax
0x10026fdfb: jne 0x10026fe1a
0x10026fdfd: mov rdi, qword ptr [r12 + 0x250]
0x10026fe05: mov rax, qword ptr [rdi]
0x10026fe08: lea rsi, [rsp + 0x180]
0x10026fe10: vzeroupper 
0x10026fe13: call qword ptr [rax + 0x68]
0x10026fe16: vxorps ymm1, ymm1, ymm1
0x10026fe1a: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x10026fe23: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10026fe2c: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x10026fe35: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10026fe3e: vmovaps xmm0, xmmword ptr [r12 + 0x1b0]
0x10026fe48: vmovaps xmmword ptr [rsp + 0x190], xmm0
0x10026fe51: mov dword ptr [rsp + 0x1f0], 0x20
0x10026fe5c: mov rdi, qword ptr [r12 + 0x260]
0x10026fe64: test rdi, rdi
0x10026fe67: je 0x10026fe99
0x10026fe69: mov rbx, qword ptr [r12 + 0x268]
0x10026fe71: test rbx, rbx
0x10026fe74: je 0x10026fe99
0x10026fe76: mov rax, qword ptr [rdi]
0x10026fe79: vzeroupper 
0x10026fe7c: call qword ptr [rax]
0x10026fe7e: cmp rbx, rax
0x10026fe81: jne 0x10026fe99
0x10026fe83: mov rdi, qword ptr [r12 + 0x260]
0x10026fe8b: mov rax, qword ptr [rdi]
0x10026fe8e: lea rsi, [rsp + 0x180]
0x10026fe96: call qword ptr [rax + 0x68]
0x10026fe99: cmp byte ptr [r12 + 0x2c3], 0
0x10026fea2: je 0x10026fece
0x10026fea4: mov rax, qword ptr [rip + 0x99da2d] ; 0x100c0d8d8
0x10026feab: mov rax, qword ptr [rax]
0x10026feae: cmp rax, qword ptr [rsp + 0x3c0]
0x10026feb6: jne 0x10026ff44
0x10026febc: lea rsp, [rbp - 0x28]
0x10026fec0: pop rbx
0x10026fec1: pop r12
0x10026fec3: pop r13
0x10026fec5: pop r14
0x10026fec7: pop r15
0x10026fec9: pop rbp
0x10026feca: vzeroupper 
0x10026fecd: ret 
0x10026fece: mov rdi, qword ptr [r12 + 0x250]
0x10026fed6: test rdi, rdi
0x10026fed9: je 0x10026fea4
0x10026fedb: mov rbx, qword ptr [r12 + 0x258]
0x10026fee3: test rbx, rbx
0x10026fee6: je 0x10026fea4
0x10026fee8: mov rax, qword ptr [rdi]
0x10026feeb: vzeroupper 
0x10026feee: call qword ptr [rax]
0x10026fef0: cmp rbx, rax
0x10026fef3: jne 0x10026fea4
0x10026fef5: mov rdi, qword ptr [r12 + 0x250]
0x10026fefd: mov rax, qword ptr [rdi]
0x10026ff00: call qword ptr [rax + 0x10]
0x10026ff03: test al, al
0x10026ff05: je 0x10026fea4
0x10026ff07: mov rdi, qword ptr [r12 + 0x250]
0x10026ff0f: test rdi, rdi
0x10026ff12: je 0x10026fea4
0x10026ff14: mov rbx, qword ptr [r12 + 0x258]
0x10026ff1c: test rbx, rbx
0x10026ff1f: je 0x10026fea4
0x10026ff21: mov rax, qword ptr [rdi]
0x10026ff24: call qword ptr [rax]
0x10026ff26: cmp rbx, rax
0x10026ff29: jne 0x10026fea4
0x10026ff2f: mov rdi, qword ptr [r12 + 0x250]
0x10026ff37: mov rax, qword ptr [rdi]
0x10026ff3a: xor esi, esi
0x10026ff3c: call qword ptr [rax + 0x30]
0x10026ff3f: jmp 0x10026fea4 ; 0x10026fea4
0x10026ff44: vzeroupper 
0x10026ff47: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10026ff4c: mov rcx, qword ptr [rsp + 0x180]
0x10026ff54: test rcx, rcx
0x10026ff57: je 0x10026ffb2
0x10026ff59: mov rdx, qword ptr [rsp + 0x188]
0x10026ff61: mov rsi, qword ptr [rsp + 0x190]
0x10026ff69: test rsi, rsi
0x10026ff6c: lea rsi, [rsi + 8]
0x10026ff70: cmove rsi, rcx
0x10026ff74: mov qword ptr [rsi], rdx
0x10026ff77: mov rdx, qword ptr [rsp + 0x188]
0x10026ff7f: mov rsi, qword ptr [rsp + 0x190]
0x10026ff87: add rcx, 8
0x10026ff8b: test rdx, rdx
0x10026ff8e: lea rdx, [rdx + 0x10]
0x10026ff92: cmove rdx, rcx
0x10026ff96: mov qword ptr [rdx], rsi
0x10026ff99: vxorps xmm0, xmm0, xmm0
0x10026ff9d: vmovaps xmmword ptr [rsp + 0x180], xmm0
0x10026ffa6: mov qword ptr [rsp + 0x190], 0
0x10026ffb2: mov rdi, rax
0x10026ffb5: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10026ffba: nop word ptr [rax + rax]
