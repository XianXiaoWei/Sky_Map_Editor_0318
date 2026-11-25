0x1002594c0: push rbp
0x1002594c1: mov rbp, rsp
0x1002594c4: push r15
0x1002594c6: push r14
0x1002594c8: push r13
0x1002594ca: push r12
0x1002594cc: push rbx
0x1002594cd: sub rsp, 0x428
0x1002594d4: mov qword ptr [rbp - 0x3f0], rsi
0x1002594db: mov r14, rdi
0x1002594de: mov rax, qword ptr [rip + 0x9b43f3] ; 0x100c0d8d8
0x1002594e5: mov rax, qword ptr [rax]
0x1002594e8: mov qword ptr [rbp - 0x30], rax
0x1002594ec: mov rax, qword ptr [r14 + 0x10]
0x1002594f0: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1002594f5: vmovaps xmmword ptr [rbp - 0x420], xmm0
0x1002594fd: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x100259502: vmovaps xmmword ptr [rbp - 0x3e0], xmm0
0x10025950a: mov dword ptr [rbp - 0x80], 0
0x100259511: vxorps xmm0, xmm0, xmm0
0x100259515: vmovups xmmword ptr [rbp - 0x78], xmm0
0x10025951a: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10025951f: mov dword ptr [rbp - 0x50], 0
0x100259526: mov dword ptr [rbp - 0x40], 0xff7fffff
0x10025952d: lea rbx, [r14 + 0x50]
0x100259531: cmp dword ptr [r14 + 0x50], 5
0x100259536: jne 0x10025956c
0x100259538: mov rax, qword ptr [rbx + 0x10]
0x10025953c: mov qword ptr [rbp - 0xb0], rax
0x100259543: vmovaps xmm0, xmmword ptr [rbx]
0x100259547: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x10025954f: vmovaps xmm0, xmmword ptr [r14 + 0x70]
0x100259555: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x10025955d: mov eax, dword ptr [r14 + 0x80]
0x100259564: mov dword ptr [rbp - 0x90], eax
0x10025956a: jmp 0x100259590 ; 0x100259590
0x10025956c: mov dword ptr [rbp - 0xc0], 5
0x100259576: vmovups xmmword ptr [rbp - 0xb8], xmm0
0x10025957e: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x100259586: mov dword ptr [rbp - 0x90], 0
0x100259590: lea rsi, [rbp - 0x80]
0x100259594: lea rdx, [rbp - 0xc0]
0x10025959b: mov rdi, r14
0x10025959e: call 0x100258f00 ; 0x100258f00
0x1002595a3: cmp dword ptr [r14 + 0x50], 7
0x1002595a8: jne 0x1002595de
0x1002595aa: mov rax, qword ptr [rbx + 0x10]
0x1002595ae: mov qword ptr [rbp - 0xf0], rax
0x1002595b5: vmovaps xmm0, xmmword ptr [rbx]
0x1002595b9: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1002595c1: vmovaps xmm0, xmmword ptr [r14 + 0x70]
0x1002595c7: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1002595cf: mov eax, dword ptr [r14 + 0x80]
0x1002595d6: mov dword ptr [rbp - 0xd0], eax
0x1002595dc: jmp 0x100259606 ; 0x100259606
0x1002595de: mov dword ptr [rbp - 0x100], 7
0x1002595e8: vxorps xmm0, xmm0, xmm0
0x1002595ec: vmovups xmmword ptr [rbp - 0xf8], xmm0
0x1002595f4: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1002595fc: mov dword ptr [rbp - 0xd0], 0
0x100259606: lea rsi, [rbp - 0x80]
0x10025960a: lea rdx, [rbp - 0x100]
0x100259611: mov rdi, r14
0x100259614: call 0x100258f00 ; 0x100258f00
0x100259619: cmp dword ptr [r14 + 0x50], 8
0x10025961e: jne 0x100259654
0x100259620: mov rax, qword ptr [rbx + 0x10]
0x100259624: mov qword ptr [rbp - 0x130], rax
0x10025962b: vmovaps xmm0, xmmword ptr [rbx]
0x10025962f: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x100259637: vmovaps xmm0, xmmword ptr [r14 + 0x70]
0x10025963d: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x100259645: mov eax, dword ptr [r14 + 0x80]
0x10025964c: mov dword ptr [rbp - 0x110], eax
0x100259652: jmp 0x10025967c ; 0x10025967c
0x100259654: mov dword ptr [rbp - 0x140], 8
0x10025965e: vxorps xmm0, xmm0, xmm0
0x100259662: vmovups xmmword ptr [rbp - 0x138], xmm0
0x10025966a: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x100259672: mov dword ptr [rbp - 0x110], 0
0x10025967c: lea rsi, [rbp - 0x80]
0x100259680: lea rdx, [rbp - 0x140]
0x100259687: mov rdi, r14
0x10025968a: call 0x100258f00 ; 0x100258f00
0x10025968f: cmp dword ptr [r14 + 0x50], 3
0x100259694: jne 0x1002596ca
0x100259696: mov rax, qword ptr [rbx + 0x10]
0x10025969a: mov qword ptr [rbp - 0x170], rax
0x1002596a1: vmovaps xmm0, xmmword ptr [rbx]
0x1002596a5: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x1002596ad: vmovaps xmm0, xmmword ptr [r14 + 0x70]
0x1002596b3: vmovaps xmmword ptr [rbp - 0x160], xmm0
0x1002596bb: mov eax, dword ptr [r14 + 0x80]
0x1002596c2: mov dword ptr [rbp - 0x150], eax
0x1002596c8: jmp 0x1002596f2 ; 0x1002596f2
0x1002596ca: mov dword ptr [rbp - 0x180], 3
0x1002596d4: vxorps xmm0, xmm0, xmm0
0x1002596d8: vmovups xmmword ptr [rbp - 0x178], xmm0
0x1002596e0: vmovaps xmmword ptr [rbp - 0x160], xmm0
0x1002596e8: mov dword ptr [rbp - 0x150], 0
0x1002596f2: lea rsi, [rbp - 0x80]
0x1002596f6: lea rdx, [rbp - 0x180]
0x1002596fd: mov rdi, r14
0x100259700: call 0x100258f00 ; 0x100258f00
0x100259705: cmp dword ptr [r14 + 0x50], 4
0x10025970a: jne 0x100259740
0x10025970c: mov rax, qword ptr [rbx + 0x10]
0x100259710: mov qword ptr [rbp - 0x1b0], rax
0x100259717: vmovaps xmm0, xmmword ptr [rbx]
0x10025971b: vmovaps xmmword ptr [rbp - 0x1c0], xmm0
0x100259723: vmovaps xmm0, xmmword ptr [r14 + 0x70]
0x100259729: vmovaps xmmword ptr [rbp - 0x1a0], xmm0
0x100259731: mov eax, dword ptr [r14 + 0x80]
0x100259738: mov dword ptr [rbp - 0x190], eax
0x10025973e: jmp 0x10025976e ; 0x10025976e
0x100259740: vmovaps xmm0, xmmword ptr [r14 + 0x30]
0x100259746: mov dword ptr [rbp - 0x1c0], 4
0x100259750: vpxor xmm1, xmm1, xmm1
0x100259754: vmovdqu xmmword ptr [rbp - 0x1b8], xmm1
0x10025975c: vmovaps xmmword ptr [rbp - 0x1a0], xmm0
0x100259764: mov dword ptr [rbp - 0x190], 0
0x10025976e: lea rsi, [rbp - 0x80]
0x100259772: lea rdx, [rbp - 0x1c0]
0x100259779: mov rdi, r14
0x10025977c: call 0x100258f00 ; 0x100258f00
0x100259781: cmp dword ptr [r14 + 0x50], 6
0x100259786: jne 0x1002597cd
0x100259788: mov rax, qword ptr [rbx + 0x10]
0x10025978c: mov qword ptr [rbp - 0x1f0], rax
0x100259793: vmovaps xmm0, xmmword ptr [rbx]
0x100259797: vmovaps xmmword ptr [rbp - 0x200], xmm0
0x10025979f: vmovaps xmm0, xmmword ptr [r14 + 0x70]
0x1002597a5: vmovaps xmmword ptr [rbp - 0x1e0], xmm0
0x1002597ad: mov eax, dword ptr [r14 + 0x80]
0x1002597b4: mov dword ptr [rbp - 0x1d0], eax
0x1002597ba: lea rsi, [rbp - 0x80]
0x1002597be: lea rdx, [rbp - 0x200]
0x1002597c5: mov rdi, r14
0x1002597c8: call 0x100258f00 ; 0x100258f00
0x1002597cd: mov qword ptr [rbp - 0x3e8], rbx
0x1002597d4: vmovaps xmm0, xmmword ptr [rbp - 0x3e0]
0x1002597dc: vmulps xmm0, xmm0, xmmword ptr [rip + 0x84e75c] ; 0x100aa7f40
0x1002597e4: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x420]
0x1002597ec: mov dword ptr [rbp - 0x240], 6
0x1002597f6: vpxor xmm1, xmm1, xmm1
0x1002597fa: vmovdqu xmmword ptr [rbp - 0x238], xmm1
0x100259802: vmovaps xmmword ptr [rbp - 0x220], xmm0
0x10025980a: mov dword ptr [rbp - 0x210], 0
0x100259814: lea rsi, [rbp - 0x80]
0x100259818: lea rdx, [rbp - 0x240]
0x10025981f: mov rdi, r14
0x100259822: call 0x100258f00 ; 0x100258f00
0x100259827: cmp dword ptr [r14 + 0x1c8], 0
0x10025982f: mov qword ptr [rbp - 0x3e0], r14
0x100259836: je 0x10025a4ee
0x10025983c: xor r12d, r12d
0x10025983f: lea r13, [rbp - 0x2c0]
0x100259846: lea r15, [rbp - 0x3c8]
0x10025984d: nop dword ptr [rax]
0x100259850: mov rax, qword ptr [r14 + r12*8 + 0xc8]
0x100259858: mov qword ptr [rbp - 0x3c8], rax
0x10025985f: cmp rax, qword ptr [r14 + 0x10]
0x100259863: je 0x10025a120
0x100259869: call 0x10074a170 ; 0x10074a170
0x10025986e: mov r14, rax
0x100259871: mov qword ptr [rbp - 0x2c0], 0
0x10025987c: call 0x100474e80 ; 0x100474e80
0x100259881: mov rbx, qword ptr [rax]
0x100259884: mov rdi, rax
0x100259887: mov rsi, r13
0x10025988a: mov rdx, r15
0x10025988d: mov rcx, r14
0x100259890: call qword ptr [rbx + 0x40]
0x100259893: cmp qword ptr [rbp - 0x2c0], 0
0x10025989b: jne 0x100259940
0x1002598a1: call 0x10074a170 ; 0x10074a170
0x1002598a6: mov qword ptr [rbp - 0x2c0], 0
0x1002598b1: mov rdi, qword ptr [rip + 0x1b8c3a8] ; 0x101de5c60
0x1002598b8: mov rbx, qword ptr [rdi]
0x1002598bb: mov rsi, r13
0x1002598be: mov rdx, r15
0x1002598c1: mov rcx, rax
0x1002598c4: call qword ptr [rbx + 0x40]
0x1002598c7: cmp qword ptr [rbp - 0x2c0], 0
0x1002598cf: jne 0x100259940
0x1002598d1: call 0x10074a170 ; 0x10074a170
0x1002598d6: mov r14, rax
0x1002598d9: mov qword ptr [rbp - 0x2c0], 0
0x1002598e4: call 0x10033abb0 ; 0x10033abb0
0x1002598e9: mov rbx, qword ptr [rax]
0x1002598ec: mov rdi, rax
0x1002598ef: mov rsi, r13
0x1002598f2: mov rdx, r15
0x1002598f5: mov rcx, r14
0x1002598f8: call qword ptr [rbx + 0x40]
0x1002598fb: cmp qword ptr [rbp - 0x2c0], 0
0x100259903: jne 0x100259940
0x100259905: call 0x10074a170 ; 0x10074a170
0x10025990a: mov r14, rax
0x10025990d: mov qword ptr [rbp - 0x2c0], 0
0x100259918: call 0x10043ccc0 ; 0x10043ccc0
0x10025991d: mov rbx, qword ptr [rax]
0x100259920: mov rdi, rax
0x100259923: mov rsi, r13
0x100259926: mov rdx, r15
0x100259929: mov rcx, r14
0x10025992c: call qword ptr [rbx + 0x40]
0x10025992f: cmp qword ptr [rbp - 0x2c0], 0
0x100259937: je 0x10025a10e
0x10025993d: nop dword ptr [rax]
0x100259940: call 0x10074a170 ; 0x10074a170
0x100259945: mov r14, rax
0x100259948: mov qword ptr [rbp - 0x2c0], 0
0x100259953: call 0x10043ccc0 ; 0x10043ccc0
0x100259958: mov rbx, qword ptr [rax]
0x10025995b: mov rdi, rax
0x10025995e: mov rsi, r13
0x100259961: mov rdx, r15
0x100259964: mov rcx, r14
0x100259967: call qword ptr [rbx + 0x40]
0x10025996a: mov rbx, qword ptr [rbp - 0x2c0]
0x100259971: call 0x10074a170 ; 0x10074a170
0x100259976: mov r14, rax
0x100259979: cmp rbx, 0
0x10025997d: je 0x100259a40
0x100259983: mov qword ptr [rbp - 0x2c0], 0
0x10025998e: call 0x10043ccc0 ; 0x10043ccc0
0x100259993: mov rbx, qword ptr [rax]
0x100259996: mov rdi, rax
0x100259999: mov rsi, r13
0x10025999c: mov rdx, r15
0x10025999f: mov rcx, r14
0x1002599a2: call qword ptr [rbx + 0x40]
0x1002599a5: mov rax, qword ptr [rbp - 0x2c0]
0x1002599ac: test rax, rax
0x1002599af: je 0x100259c80
0x1002599b5: vmovaps xmm0, xmmword ptr [rbp - 0x440]
0x1002599bd: vblendps xmm0, xmm0, xmmword ptr [rip + 0x84abd9], 7 ; 0x100aa45a0
0x1002599c7: add rax, 8
0x1002599cb: mov dword ptr [rbp - 0x280], 3
0x1002599d5: mov qword ptr [rbp - 0x278], rax
0x1002599dc: mov qword ptr [rbp - 0x270], 0
0x1002599e7: vmovaps xmmword ptr [rbp - 0x440], xmm0
0x1002599ef: vmovaps xmmword ptr [rbp - 0x260], xmm0
0x1002599f7: mov dword ptr [rbp - 0x250], 0
0x100259a01: mov r14, qword ptr [rbp - 0x3e0]
0x100259a08: mov rdi, r14
0x100259a0b: lea rsi, [rbp - 0x80]
0x100259a0f: lea rdx, [rbp - 0x280]
0x100259a16: call 0x100258f00 ; 0x100258f00
0x100259a1b: lea r15, [rbp - 0x3c8]
0x100259a22: lea r13, [rbp - 0x2c0]
0x100259a29: inc r12
0x100259a2c: cmp dword ptr [r14 + 0x1c8], r12d
0x100259a33: ja 0x100259850
0x100259a39: jmp 0x10025a4ee ; 0x10025a4ee
0x100259a3e: nop 
0x100259a40: mov qword ptr [rbp - 0x2c0], 0
0x100259a4b: call 0x100474e80 ; 0x100474e80
0x100259a50: mov rbx, qword ptr [rax]
0x100259a53: mov rdi, rax
0x100259a56: mov rsi, r13
0x100259a59: mov rdx, r15
0x100259a5c: mov rcx, r14
0x100259a5f: call qword ptr [rbx + 0x40]
0x100259a62: mov rbx, qword ptr [rbp - 0x2c0]
0x100259a69: call 0x10074a170 ; 0x10074a170
0x100259a6e: mov r14, rax
0x100259a71: cmp rbx, 0
0x100259a75: je 0x100259b4d
0x100259a7b: mov qword ptr [rbp - 0x2c0], 0
0x100259a86: call 0x100474e80 ; 0x100474e80
0x100259a8b: mov rbx, qword ptr [rax]
0x100259a8e: mov rdi, rax
0x100259a91: mov rsi, r13
0x100259a94: mov rdx, r15
0x100259a97: mov rcx, r14
0x100259a9a: call qword ptr [rbx + 0x40]
0x100259a9d: mov rbx, qword ptr [rbp - 0x2c0]
0x100259aa4: test rbx, rbx
0x100259aa7: je 0x100259c80
0x100259aad: mov rax, qword ptr [rbx]
0x100259ab0: mov rdi, rbx
0x100259ab3: call qword ptr [rax + 0x10]
0x100259ab6: test al, al
0x100259ab8: mov r14, qword ptr [rbp - 0x3e0]
0x100259abf: je 0x100259a1b
0x100259ac5: mov qword ptr [r14 + 0x18], rbx
0x100259ac9: vxorps xmm0, xmm0, xmm0
0x100259acd: vmovaps xmm1, xmmword ptr [rbp - 0x410]
0x100259ad5: vblendps xmm1, xmm0, xmm1, 8
0x100259adb: lea rax, [rbp - 0x2b8]
0x100259ae2: vmovups xmmword ptr [rax], xmm0
0x100259ae6: vmovaps xmmword ptr [rbp - 0x410], xmm1
0x100259aee: vmovaps xmmword ptr [rbp - 0x2a0], xmm1
0x100259af6: mov dword ptr [rbp - 0x290], 0
0x100259b00: mov dword ptr [rbp - 0x2c0], 9
0x100259b0a: mov r11d, dword ptr [rbx + 0x74]
0x100259b0e: mov dword ptr [rbp - 0x2b0], r11d
0x100259b15: mov rax, qword ptr [rbp - 0x3f0]
0x100259b1c: mov r8, qword ptr [rax + 0x370]
0x100259b23: mov r14d, dword ptr [r8 + 0x518]
0x100259b2a: xor edi, edi
0x100259b2c: mov ebx, 0
0x100259b31: test r14, r14
0x100259b34: je 0x100259e33
0x100259b3a: cmp r14d, 0xf
0x100259b3e: ja 0x100259d80
0x100259b44: xor ecx, ecx
0x100259b46: xor ebx, ebx
0x100259b48: jmp 0x100259e10 ; 0x100259e10
0x100259b4d: mov qword ptr [rbp - 0x2c0], 0
0x100259b58: call 0x10033abb0 ; 0x10033abb0
0x100259b5d: mov rbx, qword ptr [rax]
0x100259b60: mov rdi, rax
0x100259b63: mov rsi, r13
0x100259b66: mov rdx, r15
0x100259b69: mov rcx, r14
0x100259b6c: call qword ptr [rbx + 0x40]
0x100259b6f: mov rbx, qword ptr [rbp - 0x2c0]
0x100259b76: call 0x10074a170 ; 0x10074a170
0x100259b7b: mov r14, rax
0x100259b7e: cmp rbx, 0
0x100259b82: je 0x100259caa
0x100259b88: mov qword ptr [rbp - 0x2c0], 0
0x100259b93: call 0x10033abb0 ; 0x10033abb0
0x100259b98: mov rbx, qword ptr [rax]
0x100259b9b: mov rdi, rax
0x100259b9e: mov rsi, r13
0x100259ba1: mov rdx, r15
0x100259ba4: mov rcx, r14
0x100259ba7: call qword ptr [rbx + 0x40]
0x100259baa: mov rax, qword ptr [rbp - 0x2c0]
0x100259bb1: test rax, rax
0x100259bb4: je 0x100259c80
0x100259bba: cmp byte ptr [rax + 0xb4], 0
0x100259bc1: lea r15, [rbp - 0x3c8]
0x100259bc8: lea r13, [rbp - 0x2c0]
0x100259bcf: mov r14, qword ptr [rbp - 0x3e0]
0x100259bd6: je 0x10025a120
0x100259bdc: cmp byte ptr [rax + 0xb6], 0
0x100259be3: je 0x10025a120
0x100259be9: mov qword ptr [r14 + 0x20], rax
0x100259bed: vxorps xmm0, xmm0, xmm0
0x100259bf1: vmovaps xmm1, xmmword ptr [rbp - 0x400]
0x100259bf9: vblendps xmm1, xmm0, xmm1, 8
0x100259bff: lea rcx, [rbp - 0x2b8]
0x100259c06: vmovups xmmword ptr [rcx], xmm0
0x100259c0a: vmovaps xmmword ptr [rbp - 0x400], xmm1
0x100259c12: vmovaps xmmword ptr [rbp - 0x2a0], xmm1
0x100259c1a: mov dword ptr [rbp - 0x290], 0
0x100259c24: mov dword ptr [rbp - 0x2c0], 9
0x100259c2e: mov r11d, dword ptr [rax + 0x150]
0x100259c35: mov dword ptr [rbp - 0x2b0], r11d
0x100259c3c: mov rax, qword ptr [rbp - 0x3f0]
0x100259c43: mov r8, qword ptr [rax + 0x370]
0x100259c4a: mov r14d, dword ptr [r8 + 0x518]
0x100259c51: xor edi, edi
0x100259c53: mov ebx, 0
0x100259c58: test r14, r14
0x100259c5b: je 0x10025a203
0x100259c61: cmp r14d, 0xf
0x100259c65: ja 0x10025a151
0x100259c6b: xor ecx, ecx
0x100259c6d: xor ebx, ebx
0x100259c6f: jmp 0x10025a1e0 ; 0x10025a1e0
0x100259c74: nop word ptr cs:[rax + rax]
0x100259c80: lea r15, [rbp - 0x3c8]
0x100259c87: lea r13, [rbp - 0x2c0]
0x100259c8e: mov r14, qword ptr [rbp - 0x3e0]
0x100259c95: inc r12
0x100259c98: cmp dword ptr [r14 + 0x1c8], r12d
0x100259c9f: ja 0x100259850
0x100259ca5: jmp 0x10025a4ee ; 0x10025a4ee
0x100259caa: mov qword ptr [rbp - 0x2c0], 0
0x100259cb5: mov rdi, qword ptr [rip + 0x1b8bfa4] ; 0x101de5c60
0x100259cbc: mov rax, qword ptr [rdi]
0x100259cbf: mov rsi, r13
0x100259cc2: mov rdx, r15
0x100259cc5: mov rcx, r14
0x100259cc8: call qword ptr [rax + 0x40]
0x100259ccb: cmp qword ptr [rbp - 0x2c0], 0
0x100259cd3: je 0x10025a135
0x100259cd9: call 0x10074a170 ; 0x10074a170
0x100259cde: mov qword ptr [rbp - 0x2c0], 0
0x100259ce9: mov rdi, qword ptr [rip + 0x1b8bf70] ; 0x101de5c60
0x100259cf0: mov rbx, qword ptr [rdi]
0x100259cf3: mov rsi, r13
0x100259cf6: mov rdx, r15
0x100259cf9: mov rcx, rax
0x100259cfc: call qword ptr [rbx + 0x40]
0x100259cff: mov rax, qword ptr [rbp - 0x2c0]
0x100259d06: cmp dword ptr [rax + 0x140], 0xa
0x100259d0d: mov r14, qword ptr [rbp - 0x3e0]
0x100259d14: jne 0x10025a120
0x100259d1a: vmovaps xmm0, xmmword ptr [rbp - 0x430]
0x100259d22: vblendps xmm0, xmm0, xmmword ptr [rip + 0x84a874], 7 ; 0x100aa45a0
0x100259d2c: lea rcx, [rax + 8]
0x100259d30: test rax, rax
0x100259d33: cmove rcx, rax
0x100259d37: mov dword ptr [rbp - 0x380], 0xb
0x100259d41: mov qword ptr [rbp - 0x378], rcx
0x100259d48: mov qword ptr [rbp - 0x370], 0
0x100259d53: vmovaps xmmword ptr [rbp - 0x430], xmm0
0x100259d5b: vmovaps xmmword ptr [rbp - 0x360], xmm0
0x100259d63: mov dword ptr [rbp - 0x350], 0
0x100259d6d: mov rdi, r14
0x100259d70: lea rsi, [rbp - 0x80]
0x100259d74: lea rdx, [rbp - 0x380]
0x100259d7b: jmp 0x10025a4d9 ; 0x10025a4d9
0x100259d80: mov r9d, r14d
0x100259d83: and r9d, 0xf
0x100259d87: mov rcx, r14
0x100259d8a: sub rcx, r9
0x100259d8d: vmovd xmm0, r11d
0x100259d92: vpshufd xmm0, xmm0, 0
0x100259d97: lea rbx, [r8 + 0x4c4]
0x100259d9e: vxorps xmm1, xmm1, xmm1
0x100259da2: mov rsi, rcx
0x100259da5: vpxor xmm2, xmm2, xmm2
0x100259da9: vpxor xmm3, xmm3, xmm3
0x100259dad: vpxor xmm4, xmm4, xmm4
0x100259db1: nop word ptr cs:[rax + rax]
0x100259dc0: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x30]
0x100259dc5: vpsubd xmm1, xmm1, xmm5
0x100259dc9: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x20]
0x100259dce: vpsubd xmm2, xmm2, xmm5
0x100259dd2: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x10]
0x100259dd7: vpsubd xmm3, xmm3, xmm5
0x100259ddb: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx]
0x100259ddf: vpsubd xmm4, xmm4, xmm5
0x100259de3: add rbx, 0x40
0x100259de7: add rsi, -0x10
0x100259deb: jne 0x100259dc0
0x100259ded: vpaddd xmm0, xmm2, xmm1
0x100259df1: vpaddd xmm0, xmm3, xmm0
0x100259df5: vpaddd xmm0, xmm4, xmm0
0x100259df9: vpshufd xmm1, xmm0, 0x4e
0x100259dfe: vpaddd xmm0, xmm0, xmm1
0x100259e02: vphaddd xmm0, xmm0, xmm0
0x100259e07: vmovd ebx, xmm0
0x100259e0b: test r9d, r9d
0x100259e0e: je 0x100259e33
0x100259e10: mov rsi, r14
0x100259e13: sub rsi, rcx
0x100259e16: lea rcx, [r8 + rcx*4 + 0x494]
0x100259e1e: nop 
0x100259e20: xor eax, eax
0x100259e22: cmp dword ptr [rcx], r11d
0x100259e25: sete al
0x100259e28: add ebx, eax
0x100259e2a: add rcx, 4
0x100259e2e: dec rsi
0x100259e31: jne 0x100259e20
0x100259e33: mov esi, dword ptr [r8 + 0x514]
0x100259e3a: test rsi, rsi
0x100259e3d: je 0x100259f03
0x100259e43: cmp esi, 0xf
0x100259e46: ja 0x100259e52
0x100259e48: xor r10d, r10d
0x100259e4b: xor edi, edi
0x100259e4d: jmp 0x100259ee0 ; 0x100259ee0
0x100259e52: mov r9d, esi
0x100259e55: and r9d, 0xf
0x100259e59: mov r10, rsi
0x100259e5c: sub r10, r9
0x100259e5f: vmovd xmm0, r11d
0x100259e64: vpshufd xmm0, xmm0, 0
0x100259e69: lea rdi, [r8 + 0x444]
0x100259e70: vxorps xmm1, xmm1, xmm1
0x100259e74: mov rcx, r10
0x100259e77: vpxor xmm2, xmm2, xmm2
0x100259e7b: vpxor xmm3, xmm3, xmm3
0x100259e7f: vpxor xmm4, xmm4, xmm4
0x100259e83: nop word ptr cs:[rax + rax]
0x100259e90: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x30]
0x100259e95: vpsubd xmm1, xmm1, xmm5
0x100259e99: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x20]
0x100259e9e: vpsubd xmm2, xmm2, xmm5
0x100259ea2: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x10]
0x100259ea7: vpsubd xmm3, xmm3, xmm5
0x100259eab: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi]
0x100259eaf: vpsubd xmm4, xmm4, xmm5
0x100259eb3: add rdi, 0x40
0x100259eb7: add rcx, -0x10
0x100259ebb: jne 0x100259e90
0x100259ebd: vpaddd xmm0, xmm2, xmm1
0x100259ec1: vpaddd xmm0, xmm3, xmm0
0x100259ec5: vpaddd xmm0, xmm4, xmm0
0x100259ec9: vpshufd xmm1, xmm0, 0x4e
0x100259ece: vpaddd xmm0, xmm0, xmm1
0x100259ed2: vphaddd xmm0, xmm0, xmm0
0x100259ed7: vmovd edi, xmm0
0x100259edb: test r9d, r9d
0x100259ede: je 0x100259f03
0x100259ee0: mov rcx, rsi
0x100259ee3: sub rcx, r10
0x100259ee6: lea rax, [r8 + r10*4 + 0x414]
0x100259eee: nop 
0x100259ef0: xor edx, edx
0x100259ef2: cmp dword ptr [rax], r11d
0x100259ef5: sete dl
0x100259ef8: add edi, edx
0x100259efa: add rax, 4
0x100259efe: dec rcx
0x100259f01: jne 0x100259ef0
0x100259f03: cmp ebx, edi
0x100259f05: cmovge edi, ebx
0x100259f08: xor ebx, ebx
0x100259f0a: mov dword ptr [rbp - 0x2ac], edi
0x100259f10: mov edi, 0
0x100259f15: test r14d, r14d
0x100259f18: je 0x100259fd3
0x100259f1e: cmp r14d, 0xf
0x100259f22: ja 0x100259f2e
0x100259f24: xor r10d, r10d
0x100259f27: xor edi, edi
0x100259f29: jmp 0x100259fb0 ; 0x100259fb0
0x100259f2e: mov r9d, r14d
0x100259f31: and r9d, 0xf
0x100259f35: mov r10, r14
0x100259f38: sub r10, r9
0x100259f3b: vmovd xmm0, r11d
0x100259f40: vpshufd xmm0, xmm0, 0
0x100259f45: lea rdi, [r8 + 0x4c4]
0x100259f4c: vxorps xmm1, xmm1, xmm1
0x100259f50: mov rcx, r10
0x100259f53: vpxor xmm2, xmm2, xmm2
0x100259f57: vpxor xmm3, xmm3, xmm3
0x100259f5b: vpxor xmm4, xmm4, xmm4
0x100259f5f: nop 
0x100259f60: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x30]
0x100259f65: vpsubd xmm1, xmm1, xmm5
0x100259f69: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x20]
0x100259f6e: vpsubd xmm2, xmm2, xmm5
0x100259f72: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x10]
0x100259f77: vpsubd xmm3, xmm3, xmm5
0x100259f7b: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi]
0x100259f7f: vpsubd xmm4, xmm4, xmm5
0x100259f83: add rdi, 0x40
0x100259f87: add rcx, -0x10
0x100259f8b: jne 0x100259f60
0x100259f8d: vpaddd xmm0, xmm2, xmm1
0x100259f91: vpaddd xmm0, xmm3, xmm0
0x100259f95: vpaddd xmm0, xmm4, xmm0
0x100259f99: vpshufd xmm1, xmm0, 0x4e
0x100259f9e: vpaddd xmm0, xmm0, xmm1
0x100259fa2: vphaddd xmm0, xmm0, xmm0
0x100259fa7: vmovd edi, xmm0
0x100259fab: test r9d, r9d
0x100259fae: je 0x100259fd3
0x100259fb0: sub r14, r10
0x100259fb3: lea rax, [r8 + r10*4 + 0x494]
0x100259fbb: nop dword ptr [rax + rax]
0x100259fc0: xor ecx, ecx
0x100259fc2: cmp dword ptr [rax], r11d
0x100259fc5: sete cl
0x100259fc8: add edi, ecx
0x100259fca: add rax, 4
0x100259fce: dec r14
0x100259fd1: jne 0x100259fc0
0x100259fd3: test esi, esi
0x100259fd5: lea r15, [rbp - 0x3c8]
0x100259fdc: lea r13, [rbp - 0x2c0]
0x100259fe3: mov r14, qword ptr [rbp - 0x3e0]
0x100259fea: je 0x10025a0a3
0x100259ff0: cmp esi, 0xf
0x100259ff3: ja 0x100259ffe
0x100259ff5: xor edx, edx
0x100259ff7: xor ebx, ebx
0x100259ff9: jmp 0x10025a080 ; 0x10025a080
0x100259ffe: mov r9d, esi
0x10025a001: and r9d, 0xf
0x10025a005: mov rdx, rsi
0x10025a008: sub rdx, r9
0x10025a00b: vmovd xmm0, r11d
0x10025a010: vpshufd xmm0, xmm0, 0
0x10025a015: lea rbx, [r8 + 0x444]
0x10025a01c: vxorps xmm1, xmm1, xmm1
0x10025a020: mov rcx, rdx
0x10025a023: vpxor xmm2, xmm2, xmm2
0x10025a027: vpxor xmm3, xmm3, xmm3
0x10025a02b: vpxor xmm4, xmm4, xmm4
0x10025a02f: nop 
0x10025a030: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x30]
0x10025a035: vpsubd xmm1, xmm1, xmm5
0x10025a039: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x20]
0x10025a03e: vpsubd xmm2, xmm2, xmm5
0x10025a042: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x10]
0x10025a047: vpsubd xmm3, xmm3, xmm5
0x10025a04b: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx]
0x10025a04f: vpsubd xmm4, xmm4, xmm5
0x10025a053: add rbx, 0x40
0x10025a057: add rcx, -0x10
0x10025a05b: jne 0x10025a030
0x10025a05d: vpaddd xmm0, xmm2, xmm1
0x10025a061: vpaddd xmm0, xmm3, xmm0
0x10025a065: vpaddd xmm0, xmm4, xmm0
0x10025a069: vpshufd xmm1, xmm0, 0x4e
0x10025a06e: vpaddd xmm0, xmm0, xmm1
0x10025a072: vphaddd xmm0, xmm0, xmm0
0x10025a077: vmovd ebx, xmm0
0x10025a07b: test r9d, r9d
0x10025a07e: je 0x10025a0a3
0x10025a080: sub rsi, rdx
0x10025a083: lea rax, [r8 + rdx*4 + 0x414]
0x10025a08b: nop dword ptr [rax + rax]
0x10025a090: xor ecx, ecx
0x10025a092: cmp dword ptr [rax], r11d
0x10025a095: sete cl
0x10025a098: add ebx, ecx
0x10025a09a: add rax, 4
0x10025a09e: dec rsi
0x10025a0a1: jne 0x10025a090
0x10025a0a3: cmp edi, ebx
0x10025a0a5: cmovge ebx, edi
0x10025a0a8: mov dword ptr [r14 + 0x64], ebx
0x10025a0ac: vmovaps xmm0, xmmword ptr [rbp - 0x410]
0x10025a0b4: mov rax, r13
0x10025a0b7: cmp r11d, dword ptr [r14 + 0x60]
0x10025a0bb: jne 0x10025a0d3
0x10025a0bd: mov rcx, qword ptr [rbp - 0x3e8]
0x10025a0c4: cmp dword ptr [rcx], 9
0x10025a0c7: mov rax, r13
0x10025a0ca: cmove rax, rcx
0x10025a0ce: vmovaps xmm0, xmmword ptr [rax + 0x20]
0x10025a0d3: mov rcx, qword ptr [rax + 0x10]
0x10025a0d7: mov qword ptr [rbp - 0x2f0], rcx
0x10025a0de: vmovdqa xmm1, xmmword ptr [rax]
0x10025a0e2: vmovdqa xmmword ptr [rbp - 0x300], xmm1
0x10025a0ea: vmovaps xmmword ptr [rbp - 0x2e0], xmm0
0x10025a0f2: mov eax, dword ptr [rax + 0x30]
0x10025a0f5: mov dword ptr [rbp - 0x2d0], eax
0x10025a0fb: mov rdi, r14
0x10025a0fe: lea rsi, [rbp - 0x80]
0x10025a102: lea rdx, [rbp - 0x300]
0x10025a109: jmp 0x10025a4d9 ; 0x10025a4d9
0x10025a10e: mov r14, qword ptr [rbp - 0x3e0]
0x10025a115: nop word ptr cs:[rax + rax]
0x10025a120: inc r12
0x10025a123: cmp dword ptr [r14 + 0x1c8], r12d
0x10025a12a: ja 0x100259850
0x10025a130: jmp 0x10025a4ee ; 0x10025a4ee
0x10025a135: mov r14, qword ptr [rbp - 0x3e0]
0x10025a13c: inc r12
0x10025a13f: cmp dword ptr [r14 + 0x1c8], r12d
0x10025a146: ja 0x100259850
0x10025a14c: jmp 0x10025a4ee ; 0x10025a4ee
0x10025a151: mov r9d, r14d
0x10025a154: and r9d, 0xf
0x10025a158: mov rcx, r14
0x10025a15b: sub rcx, r9
0x10025a15e: vmovd xmm0, r11d
0x10025a163: vpshufd xmm0, xmm0, 0
0x10025a168: lea rbx, [r8 + 0x4c4]
0x10025a16f: vxorps xmm1, xmm1, xmm1
0x10025a173: mov rsi, rcx
0x10025a176: vpxor xmm2, xmm2, xmm2
0x10025a17a: vpxor xmm3, xmm3, xmm3
0x10025a17e: vpxor xmm4, xmm4, xmm4
0x10025a182: nop word ptr cs:[rax + rax]
0x10025a190: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x30]
0x10025a195: vpsubd xmm1, xmm1, xmm5
0x10025a199: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x20]
0x10025a19e: vpsubd xmm2, xmm2, xmm5
0x10025a1a2: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x10]
0x10025a1a7: vpsubd xmm3, xmm3, xmm5
0x10025a1ab: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx]
0x10025a1af: vpsubd xmm4, xmm4, xmm5
0x10025a1b3: add rbx, 0x40
0x10025a1b7: add rsi, -0x10
0x10025a1bb: jne 0x10025a190
0x10025a1bd: vpaddd xmm0, xmm2, xmm1
0x10025a1c1: vpaddd xmm0, xmm3, xmm0
0x10025a1c5: vpaddd xmm0, xmm4, xmm0
0x10025a1c9: vpshufd xmm1, xmm0, 0x4e
0x10025a1ce: vpaddd xmm0, xmm0, xmm1
0x10025a1d2: vphaddd xmm0, xmm0, xmm0
0x10025a1d7: vmovd ebx, xmm0
0x10025a1db: test r9d, r9d
0x10025a1de: je 0x10025a203
0x10025a1e0: mov rsi, r14
0x10025a1e3: sub rsi, rcx
0x10025a1e6: lea rcx, [r8 + rcx*4 + 0x494]
0x10025a1ee: nop 
0x10025a1f0: xor eax, eax
0x10025a1f2: cmp dword ptr [rcx], r11d
0x10025a1f5: sete al
0x10025a1f8: add ebx, eax
0x10025a1fa: add rcx, 4
0x10025a1fe: dec rsi
0x10025a201: jne 0x10025a1f0
0x10025a203: mov esi, dword ptr [r8 + 0x514]
0x10025a20a: test rsi, rsi
0x10025a20d: je 0x10025a2d3
0x10025a213: cmp esi, 0xf
0x10025a216: ja 0x10025a222
0x10025a218: xor r10d, r10d
0x10025a21b: xor edi, edi
0x10025a21d: jmp 0x10025a2b0 ; 0x10025a2b0
0x10025a222: mov r9d, esi
0x10025a225: and r9d, 0xf
0x10025a229: mov r10, rsi
0x10025a22c: sub r10, r9
0x10025a22f: vmovd xmm0, r11d
0x10025a234: vpshufd xmm0, xmm0, 0
0x10025a239: lea rdi, [r8 + 0x444]
0x10025a240: vxorps xmm1, xmm1, xmm1
0x10025a244: mov rcx, r10
0x10025a247: vpxor xmm2, xmm2, xmm2
0x10025a24b: vpxor xmm3, xmm3, xmm3
0x10025a24f: vpxor xmm4, xmm4, xmm4
0x10025a253: nop word ptr cs:[rax + rax]
0x10025a260: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x30]
0x10025a265: vpsubd xmm1, xmm1, xmm5
0x10025a269: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x20]
0x10025a26e: vpsubd xmm2, xmm2, xmm5
0x10025a272: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x10]
0x10025a277: vpsubd xmm3, xmm3, xmm5
0x10025a27b: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi]
0x10025a27f: vpsubd xmm4, xmm4, xmm5
0x10025a283: add rdi, 0x40
0x10025a287: add rcx, -0x10
0x10025a28b: jne 0x10025a260
0x10025a28d: vpaddd xmm0, xmm2, xmm1
0x10025a291: vpaddd xmm0, xmm3, xmm0
0x10025a295: vpaddd xmm0, xmm4, xmm0
0x10025a299: vpshufd xmm1, xmm0, 0x4e
0x10025a29e: vpaddd xmm0, xmm0, xmm1
0x10025a2a2: vphaddd xmm0, xmm0, xmm0
0x10025a2a7: vmovd edi, xmm0
0x10025a2ab: test r9d, r9d
0x10025a2ae: je 0x10025a2d3
0x10025a2b0: mov rcx, rsi
0x10025a2b3: sub rcx, r10
0x10025a2b6: lea rax, [r8 + r10*4 + 0x414]
0x10025a2be: nop 
0x10025a2c0: xor edx, edx
0x10025a2c2: cmp dword ptr [rax], r11d
0x10025a2c5: sete dl
0x10025a2c8: add edi, edx
0x10025a2ca: add rax, 4
0x10025a2ce: dec rcx
0x10025a2d1: jne 0x10025a2c0
0x10025a2d3: cmp ebx, edi
0x10025a2d5: cmovge edi, ebx
0x10025a2d8: xor ebx, ebx
0x10025a2da: mov dword ptr [rbp - 0x2ac], edi
0x10025a2e0: mov edi, 0
0x10025a2e5: test r14d, r14d
0x10025a2e8: je 0x10025a3a3
0x10025a2ee: cmp r14d, 0xf
0x10025a2f2: ja 0x10025a2fe
0x10025a2f4: xor r10d, r10d
0x10025a2f7: xor edi, edi
0x10025a2f9: jmp 0x10025a380 ; 0x10025a380
0x10025a2fe: mov r9d, r14d
0x10025a301: and r9d, 0xf
0x10025a305: mov r10, r14
0x10025a308: sub r10, r9
0x10025a30b: vmovd xmm0, r11d
0x10025a310: vpshufd xmm0, xmm0, 0
0x10025a315: lea rdi, [r8 + 0x4c4]
0x10025a31c: vxorps xmm1, xmm1, xmm1
0x10025a320: mov rcx, r10
0x10025a323: vpxor xmm2, xmm2, xmm2
0x10025a327: vpxor xmm3, xmm3, xmm3
0x10025a32b: vpxor xmm4, xmm4, xmm4
0x10025a32f: nop 
0x10025a330: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x30]
0x10025a335: vpsubd xmm1, xmm1, xmm5
0x10025a339: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x20]
0x10025a33e: vpsubd xmm2, xmm2, xmm5
0x10025a342: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi - 0x10]
0x10025a347: vpsubd xmm3, xmm3, xmm5
0x10025a34b: vpcmpeqd xmm5, xmm0, xmmword ptr [rdi]
0x10025a34f: vpsubd xmm4, xmm4, xmm5
0x10025a353: add rdi, 0x40
0x10025a357: add rcx, -0x10
0x10025a35b: jne 0x10025a330
0x10025a35d: vpaddd xmm0, xmm2, xmm1
0x10025a361: vpaddd xmm0, xmm3, xmm0
0x10025a365: vpaddd xmm0, xmm4, xmm0
0x10025a369: vpshufd xmm1, xmm0, 0x4e
0x10025a36e: vpaddd xmm0, xmm0, xmm1
0x10025a372: vphaddd xmm0, xmm0, xmm0
0x10025a377: vmovd edi, xmm0
0x10025a37b: test r9d, r9d
0x10025a37e: je 0x10025a3a3
0x10025a380: sub r14, r10
0x10025a383: lea rax, [r8 + r10*4 + 0x494]
0x10025a38b: nop dword ptr [rax + rax]
0x10025a390: xor ecx, ecx
0x10025a392: cmp dword ptr [rax], r11d
0x10025a395: sete cl
0x10025a398: add edi, ecx
0x10025a39a: add rax, 4
0x10025a39e: dec r14
0x10025a3a1: jne 0x10025a390
0x10025a3a3: test esi, esi
0x10025a3a5: lea r15, [rbp - 0x3c8]
0x10025a3ac: lea r13, [rbp - 0x2c0]
0x10025a3b3: mov r14, qword ptr [rbp - 0x3e0]
0x10025a3ba: je 0x10025a473
0x10025a3c0: cmp esi, 0xf
0x10025a3c3: ja 0x10025a3ce
0x10025a3c5: xor edx, edx
0x10025a3c7: xor ebx, ebx
0x10025a3c9: jmp 0x10025a450 ; 0x10025a450
0x10025a3ce: mov r9d, esi
0x10025a3d1: and r9d, 0xf
0x10025a3d5: mov rdx, rsi
0x10025a3d8: sub rdx, r9
0x10025a3db: vmovd xmm0, r11d
0x10025a3e0: vpshufd xmm0, xmm0, 0
0x10025a3e5: lea rbx, [r8 + 0x444]
0x10025a3ec: vxorps xmm1, xmm1, xmm1
0x10025a3f0: mov rcx, rdx
0x10025a3f3: vpxor xmm2, xmm2, xmm2
0x10025a3f7: vpxor xmm3, xmm3, xmm3
0x10025a3fb: vpxor xmm4, xmm4, xmm4
0x10025a3ff: nop 
0x10025a400: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x30]
0x10025a405: vpsubd xmm1, xmm1, xmm5
0x10025a409: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x20]
0x10025a40e: vpsubd xmm2, xmm2, xmm5
0x10025a412: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx - 0x10]
0x10025a417: vpsubd xmm3, xmm3, xmm5
0x10025a41b: vpcmpeqd xmm5, xmm0, xmmword ptr [rbx]
0x10025a41f: vpsubd xmm4, xmm4, xmm5
0x10025a423: add rbx, 0x40
0x10025a427: add rcx, -0x10
0x10025a42b: jne 0x10025a400
0x10025a42d: vpaddd xmm0, xmm2, xmm1
0x10025a431: vpaddd xmm0, xmm3, xmm0
0x10025a435: vpaddd xmm0, xmm4, xmm0
0x10025a439: vpshufd xmm1, xmm0, 0x4e
0x10025a43e: vpaddd xmm0, xmm0, xmm1
0x10025a442: vphaddd xmm0, xmm0, xmm0
0x10025a447: vmovd ebx, xmm0
0x10025a44b: test r9d, r9d
0x10025a44e: je 0x10025a473
0x10025a450: sub rsi, rdx
0x10025a453: lea rax, [r8 + rdx*4 + 0x414]
0x10025a45b: nop dword ptr [rax + rax]
0x10025a460: xor ecx, ecx
0x10025a462: cmp dword ptr [rax], r11d
0x10025a465: sete cl
0x10025a468: add ebx, ecx
0x10025a46a: add rax, 4
0x10025a46e: dec rsi
0x10025a471: jne 0x10025a460
0x10025a473: cmp edi, ebx
0x10025a475: cmovge ebx, edi
0x10025a478: mov dword ptr [r14 + 0x64], ebx
0x10025a47c: vmovaps xmm0, xmmword ptr [rbp - 0x400]
0x10025a484: mov rax, r13
0x10025a487: cmp r11d, dword ptr [r14 + 0x60]
0x10025a48b: jne 0x10025a4a3
0x10025a48d: mov rcx, qword ptr [rbp - 0x3e8]
0x10025a494: cmp dword ptr [rcx], 9
0x10025a497: mov rax, r13
0x10025a49a: cmove rax, rcx
0x10025a49e: vmovaps xmm0, xmmword ptr [rax + 0x20]
0x10025a4a3: mov rcx, qword ptr [rax + 0x10]
0x10025a4a7: mov qword ptr [rbp - 0x330], rcx
0x10025a4ae: vmovdqa xmm1, xmmword ptr [rax]
0x10025a4b2: vmovdqa xmmword ptr [rbp - 0x340], xmm1
0x10025a4ba: vmovaps xmmword ptr [rbp - 0x320], xmm0
0x10025a4c2: mov eax, dword ptr [rax + 0x30]
0x10025a4c5: mov dword ptr [rbp - 0x310], eax
0x10025a4cb: mov rdi, r14
0x10025a4ce: lea rsi, [rbp - 0x80]
0x10025a4d2: lea rdx, [rbp - 0x340]
0x10025a4d9: call 0x100258f00 ; 0x100258f00
0x10025a4de: inc r12
0x10025a4e1: cmp dword ptr [r14 + 0x1c8], r12d
0x10025a4e8: ja 0x100259850
0x10025a4ee: mov rax, qword ptr [rbp - 0x3f0]
0x10025a4f5: mov rdi, qword ptr [rax + 0x280]
0x10025a4fc: vmovaps xmm0, xmmword ptr [rbp - 0x420]
0x10025a504: vmovaps xmmword ptr [rbp - 0x450], xmm0
0x10025a50c: lea rsi, [rbp - 0x450]
0x10025a513: xor edx, edx
0x10025a515: xor ecx, ecx
0x10025a517: mov r8d, 1
0x10025a51d: call 0x100103770 ; 0x100103770
0x10025a522: lea rcx, [rax + 8]
0x10025a526: test rax, rax
0x10025a529: cmove rcx, rax
0x10025a52d: mov dword ptr [rbp - 0x3c0], 1
0x10025a537: mov qword ptr [rbp - 0x3b8], rcx
0x10025a53e: mov qword ptr [rbp - 0x3b0], 0
0x10025a549: vxorps xmm0, xmm0, xmm0
0x10025a54d: vmovaps xmmword ptr [rbp - 0x3a0], xmm0
0x10025a555: mov dword ptr [rbp - 0x390], 0
0x10025a55f: lea rsi, [rbp - 0x80]
0x10025a563: lea rdx, [rbp - 0x3c0]
0x10025a56a: mov rdi, r14
0x10025a56d: call 0x100258f00 ; 0x100258f00
0x10025a572: cmp dword ptr [r14 + 0x50], 0xb
0x10025a577: jne 0x10025a5bf
0x10025a579: mov rax, qword ptr [rbp - 0x3e0]
0x10025a580: lea r14, [rax + 0x58]
0x10025a584: call 0x1007abc10 ; 0x1007abc10
0x10025a589: mov qword ptr [rbp - 0x2c0], 0
0x10025a594: mov rdi, qword ptr [rip + 0x1b8b6c5] ; 0x101de5c60
0x10025a59b: mov rbx, qword ptr [rdi]
0x10025a59e: lea rsi, [rbp - 0x2c0]
0x10025a5a5: mov rdx, r14
0x10025a5a8: mov r14, qword ptr [rbp - 0x3e0]
0x10025a5af: mov rcx, rax
0x10025a5b2: call qword ptr [rbx + 0x40]
0x10025a5b5: mov rax, qword ptr [rbp - 0x2c0]
0x10025a5bc: dec dword ptr [rax + 0x78]
0x10025a5bf: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10025a5c4: mov eax, dword ptr [rbp - 0x50]
0x10025a5c7: mov rcx, qword ptr [rbp - 0x70]
0x10025a5cb: mov rdx, qword ptr [rbp - 0x3e8]
0x10025a5d2: mov qword ptr [rdx + 0x10], rcx
0x10025a5d6: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x10025a5db: vmovaps xmmword ptr [rdx], xmm1
0x10025a5df: vmovaps xmmword ptr [r14 + 0x70], xmm0
0x10025a5e5: mov dword ptr [r14 + 0x80], eax
0x10025a5ec: cmp dword ptr [r14 + 0x50], 0xb
0x10025a5f1: jne 0x10025a639
0x10025a5f3: mov rax, qword ptr [rbp - 0x3e0]
0x10025a5fa: lea r14, [rax + 0x58]
0x10025a5fe: call 0x1007abc10 ; 0x1007abc10
0x10025a603: mov qword ptr [rbp - 0x2c0], 0
0x10025a60e: mov rdi, qword ptr [rip + 0x1b8b64b] ; 0x101de5c60
0x10025a615: mov rbx, qword ptr [rdi]
0x10025a618: lea rsi, [rbp - 0x2c0]
0x10025a61f: mov rdx, r14
0x10025a622: mov r14, qword ptr [rbp - 0x3e0]
0x10025a629: mov rcx, rax
0x10025a62c: call qword ptr [rbx + 0x40]
0x10025a62f: mov rax, qword ptr [rbp - 0x2c0]
0x10025a636: inc dword ptr [rax + 0x78]
0x10025a639: mov eax, dword ptr [r14 + 0x40]
0x10025a63d: lea ecx, [rax + 1]
0x10025a640: mov dword ptr [r14 + 0x40], ecx
0x10025a644: mov ecx, eax
0x10025a646: shl ecx, 0xd
0x10025a649: xor ecx, eax
0x10025a64b: mov eax, ecx
0x10025a64d: imul eax, eax
0x10025a650: imul eax, eax, 0x3d73
0x10025a656: add eax, 0xc0ae5
0x10025a65b: imul eax, ecx
0x10025a65e: add eax, 0x5208dd0d
0x10025a663: and eax, 0x7fffffff
0x10025a668: vcvtsi2ss xmm0, xmm6, eax
0x10025a66c: vmulss xmm0, xmm0, dword ptr [rip + 0x854208] ; 0x100aae87c
0x10025a674: vmovss xmm1, dword ptr [rip + 0x84aa44] ; 0x100aa50c0
0x10025a67c: vaddss xmm0, xmm0, xmm1
0x10025a680: vaddss xmm0, xmm0, xmm1
0x10025a684: vmulss xmm0, xmm0, dword ptr [rip + 0x849f2c] ; 0x100aa45b8
0x10025a68c: vsubss xmm1, xmm1, xmm0
0x10025a690: vmulss xmm1, xmm1, dword ptr [rip + 0x84df38] ; 0x100aa85d0
0x10025a698: vmulss xmm0, xmm0, dword ptr [rip + 0x84eb24] ; 0x100aa91c4
0x10025a6a0: vaddss xmm0, xmm0, xmm1
0x10025a6a4: vmovss dword ptr [r14 + 0x90], xmm0
0x10025a6ad: mov rax, qword ptr [rip + 0x9b3224] ; 0x100c0d8d8
0x10025a6b4: mov rax, qword ptr [rax]
0x10025a6b7: cmp rax, qword ptr [rbp - 0x30]
0x10025a6bb: jne 0x10025a6cf
0x10025a6bd: add rsp, 0x428
0x10025a6c4: pop rbx
0x10025a6c5: pop r12
0x10025a6c7: pop r13
0x10025a6c9: pop r14
0x10025a6cb: pop r15
0x10025a6cd: pop rbp
0x10025a6ce: ret 
0x10025a6cf: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10025a6d4: nop word ptr cs:[rax + rax]
