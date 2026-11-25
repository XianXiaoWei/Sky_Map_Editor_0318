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
