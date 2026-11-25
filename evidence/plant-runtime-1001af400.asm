0x1001af400: push rbp
0x1001af401: mov rbp, rsp
0x1001af404: push r15
0x1001af406: push r14
0x1001af408: push r13
0x1001af40a: push r12
0x1001af40c: push rbx
0x1001af40d: and rsp, 0xffffffffffffffe0
0x1001af411: sub rsp, 0x3c0
0x1001af418: mov rbx, rcx
0x1001af41b: mov r14, rsi
0x1001af41e: mov r13, rdi
0x1001af421: mov rax, qword ptr [rip + 0xa5e4b0] ; 0x100c0d8d8
0x1001af428: mov rax, qword ptr [rax]
0x1001af42b: mov qword ptr [rsp + 0x3a0], rax
0x1001af433: cmp byte ptr [r13 + 0x99], 0
0x1001af43b: jne 0x1001af454
0x1001af43d: cmp byte ptr [r13 + 0x55], 0
0x1001af442: je 0x1001af454
0x1001af444: mov edx, 1
0x1001af449: mov rdi, r13
0x1001af44c: mov rsi, r14
0x1001af44f: call 0x1001b1310 ; 0x1001b1310
0x1001af454: mov byte ptr [r13 + 0x99], 1
0x1001af45c: mov rax, qword ptr [r13 + 0x110]
0x1001af463: test rax, rax
0x1001af466: je 0x1001af46f
0x1001af468: mov byte ptr [rax + 0xb7], 1
0x1001af46f: cmp byte ptr [r13 + 0x54], 0
0x1001af474: je 0x1001af4cd
0x1001af476: mov qword ptr [rsp + 0x28], rbx
0x1001af47b: mov r12b, 1
0x1001af47e: cmp byte ptr [r13 + 0xa4], 0
0x1001af486: je 0x1001af611
0x1001af48c: cmp byte ptr [r13 + 0x90], 0
0x1001af494: je 0x1001af62b
0x1001af49a: cmp byte ptr [r13 + 0x60], 0
0x1001af49f: mov al, byte ptr [r13 + 0xa3]
0x1001af4a6: je 0x1001af677
0x1001af4ac: test al, al
0x1001af4ae: setne al
0x1001af4b1: or al, r12b
0x1001af4b4: jne 0x1001af68a
0x1001af4ba: cmp byte ptr [r13 + 0xa2], 0
0x1001af4c2: jne 0x1001af68a
0x1001af4c8: jmp 0x1001b0e7c ; 0x1001b0e7c
0x1001af4cd: cmp byte ptr [r13 + 0xa0], 0
0x1001af4d5: je 0x1001af543
0x1001af4d7: mov rdi, qword ptr [r13 + 0x100]
0x1001af4de: test rdi, rdi
0x1001af4e1: je 0x1001af53b
0x1001af4e3: mov rbx, qword ptr [r13 + 0x108]
0x1001af4ea: test rbx, rbx
0x1001af4ed: je 0x1001af53b
0x1001af4ef: mov rax, qword ptr [rdi]
0x1001af4f2: call qword ptr [rax]
0x1001af4f4: cmp rbx, rax
0x1001af4f7: jne 0x1001af53b
0x1001af4f9: mov rdi, qword ptr [r13 + 0x100]
0x1001af500: mov rax, qword ptr [rdi]
0x1001af503: call qword ptr [rax + 0x10]
0x1001af506: test al, al
0x1001af508: je 0x1001af53b
0x1001af50a: mov rdi, qword ptr [r13 + 0x100]
0x1001af511: test rdi, rdi
0x1001af514: je 0x1001af53b
0x1001af516: mov rbx, qword ptr [r13 + 0x108]
0x1001af51d: test rbx, rbx
0x1001af520: je 0x1001af53b
0x1001af522: mov rax, qword ptr [rdi]
0x1001af525: call qword ptr [rax]
0x1001af527: cmp rbx, rax
0x1001af52a: jne 0x1001af53b
0x1001af52c: mov rdi, qword ptr [r13 + 0x100]
0x1001af533: mov rax, qword ptr [rdi]
0x1001af536: xor esi, esi
0x1001af538: call qword ptr [rax + 0x30]
0x1001af53b: mov byte ptr [r13 + 0xa0], 0
0x1001af543: mov word ptr [r13 + 0xa3], 0
0x1001af54d: mov byte ptr [r13 + 0xa5], 0
0x1001af555: mov qword ptr [r13 + 0xa8], 0
0x1001af560: mov dword ptr [r13 + 0xb0], 0
0x1001af56b: mov dword ptr [r13 + 0xd4], 0
0x1001af576: cmp byte ptr [r13 + 0xca], 0
0x1001af57e: je 0x1001b09f5
0x1001af584: mov rax, qword ptr [r14 + 0x160]
0x1001af58b: lea rcx, [rip + 0x1e4bb3e] ; 0x101ffb0d0
0x1001af592: cmp byte ptr [rcx], 0
0x1001af595: vmovss xmm0, dword ptr [rip + 0x8f5b23] ; 0x100aa50c0
0x1001af59d: vmovaps xmm1, xmm0
0x1001af5a1: je 0x1001af5ae
0x1001af5a3: lea rcx, [rip + 0xb08f96] ; 0x100cb8540
0x1001af5aa: vmovss xmm1, dword ptr [rcx]
0x1001af5ae: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1001af5b3: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1001af5b8: vmovss xmm2, dword ptr [rip + 0x8f74dc] ; 0x100aa6a9c
0x1001af5c0: vmaxss xmm1, xmm2, xmm1
0x1001af5c4: vmovss xmm2, dword ptr [rip + 0x8f74d4] ; 0x100aa6aa0
0x1001af5cc: vminss xmm2, xmm2, xmm1
0x1001af5d0: vmulss xmm1, xmm2, dword ptr [rip + 0x8f82e4] ; 0x100aa78bc
0x1001af5d8: vsubss xmm3, xmm0, xmm1
0x1001af5dc: vmulss xmm3, xmm3, dword ptr [r13 + 0xcc]
0x1001af5e5: vaddss xmm1, xmm1, xmm3
0x1001af5e9: vmovss dword ptr [r13 + 0xcc], xmm1
0x1001af5f2: vmulss xmm2, xmm2, dword ptr [rip + 0x8f8fb6] ; 0x100aa85b0
0x1001af5fa: vsubss xmm0, xmm0, xmm2
0x1001af5fe: vucomiss xmm0, xmm1
0x1001af602: jbe 0x1001b0a05
0x1001af608: vaddss xmm0, xmm2, xmm1
0x1001af60c: jmp 0x1001b0a1b ; 0x1001b0a1b
0x1001af611: cmp byte ptr [r13 + 0xa5], 0
0x1001af619: setne r12b
0x1001af61d: cmp byte ptr [r13 + 0x90], 0
0x1001af625: jne 0x1001af49a
0x1001af62b: cmp byte ptr [r13 + 0xa3], 0
0x1001af633: jne 0x1001af68a
0x1001af635: cmp byte ptr [r13 + 0x60], 0
0x1001af63a: je 0x1001b0e73
0x1001af640: cmp byte ptr [r13 + 0x55], 0
0x1001af645: jne 0x1001af68a
0x1001af647: add rax, 0xb6
0x1001af64d: cmp byte ptr [r13 + 0x98], 0
0x1001af655: lea rcx, [r13 + 0x56]
0x1001af659: cmove rax, rcx
0x1001af65d: cmp byte ptr [rax], 0
0x1001af660: jne 0x1001af68a
0x1001af662: cmp byte ptr [r13 + 0xa2], 0
0x1001af66a: setne al
0x1001af66d: or al, r12b
0x1001af670: jne 0x1001af68a
0x1001af672: jmp 0x1001b0e7c ; 0x1001b0e7c
0x1001af677: test al, al
0x1001af679: je 0x1001b0e7c
0x1001af67f: mov eax, r12d
0x1001af682: xor al, 1
0x1001af684: je 0x1001b0e7c
0x1001af68a: cmp byte ptr [r13 + 0xa0], 0
0x1001af692: je 0x1001af7d0
0x1001af698: cmp byte ptr [r13 + 0xca], 0
0x1001af6a0: je 0x1001afa0b
0x1001af6a6: cmp byte ptr [r13 + 0x90], 0
0x1001af6ae: vxorps xmm1, xmm1, xmm1
0x1001af6b2: je 0x1001af6bc
0x1001af6b4: vmovss xmm1, dword ptr [rip + 0x8fadec] ; 0x100aaa4a8
0x1001af6bc: mov rax, qword ptr [r14 + 0x160]
0x1001af6c3: lea rcx, [rip + 0x1e4ba06] ; 0x101ffb0d0
0x1001af6ca: cmp byte ptr [rcx], 0
0x1001af6cd: vmovss xmm2, dword ptr [rip + 0x8f59eb] ; 0x100aa50c0
0x1001af6d5: vmovaps xmm0, xmm2
0x1001af6d9: je 0x1001af6e6
0x1001af6db: lea rcx, [rip + 0xb08e5e] ; 0x100cb8540
0x1001af6e2: vmovss xmm0, dword ptr [rcx]
0x1001af6e6: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x1001af6eb: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x1001af6f0: vmovss xmm3, dword ptr [rip + 0x8f73a4] ; 0x100aa6a9c
0x1001af6f8: vmaxss xmm0, xmm3, xmm0
0x1001af6fc: vmovss xmm3, dword ptr [rip + 0x8f739c] ; 0x100aa6aa0
0x1001af704: vminss xmm3, xmm3, xmm0
0x1001af708: vmulss xmm4, xmm3, dword ptr [rip + 0x8f81ac] ; 0x100aa78bc
0x1001af710: cmp byte ptr [r13 + 0xa0], 0
0x1001af718: vmovaps xmm0, xmm2
0x1001af71c: je 0x1001af722
0x1001af71e: vmovaps xmm0, xmm1
0x1001af722: vsubss xmm1, xmm2, xmm4
0x1001af726: vmulss xmm1, xmm1, dword ptr [r13 + 0xcc]
0x1001af72f: vmulss xmm2, xmm0, xmm4
0x1001af733: vaddss xmm1, xmm2, xmm1
0x1001af737: vmovss dword ptr [r13 + 0xcc], xmm1
0x1001af740: vmulss xmm2, xmm3, dword ptr [rip + 0x8f8e68] ; 0x100aa85b0
0x1001af748: vsubss xmm3, xmm0, xmm2
0x1001af74c: vucomiss xmm3, xmm1
0x1001af750: jbe 0x1001af758
0x1001af752: vaddss xmm0, xmm2, xmm1
0x1001af756: jmp 0x1001af766 ; 0x1001af766
0x1001af758: vaddss xmm3, xmm0, xmm2
0x1001af75c: vucomiss xmm1, xmm3
0x1001af760: jbe 0x1001af766
0x1001af762: vsubss xmm0, xmm1, xmm2
0x1001af766: vmovss dword ptr [r13 + 0xcc], xmm0
0x1001af76f: mov rdi, qword ptr [r13 + 0xe0]
0x1001af776: vmovss xmm1, dword ptr [rip + 0x8f5942] ; 0x100aa50c0
0x1001af77e: xor esi, esi
0x1001af780: vucomiss xmm1, xmm0
0x1001af784: seta sil
0x1001af788: call 0x1004636d0 ; 0x1004636d0
0x1001af78d: vmovss xmm0, dword ptr [r13 + 0xcc]
0x1001af796: vucomiss xmm0, dword ptr [rip + 0x8f5922] ; 0x100aa50c0
0x1001af79e: jb 0x1001afa24
0x1001af7a4: mov rdi, qword ptr [r13 + 0x110]
0x1001af7ab: test rdi, rdi
0x1001af7ae: je 0x1001afa24
0x1001af7b4: cmp byte ptr [rdi + 0xb6], 0
0x1001af7bb: je 0x1001afa24
0x1001af7c1: mov esi, 1
0x1001af7c6: call 0x10033a780 ; 0x10033a780
0x1001af7cb: jmp 0x1001afa24 ; 0x1001afa24
0x1001af7d0: mov rdi, qword ptr [r14 + 0x438]
0x1001af7d7: mov rax, qword ptr [r13 + 0xe0]
0x1001af7de: cmp byte ptr [rax + 0x32e], 0
0x1001af7e5: lea rcx, [rax + 0x240]
0x1001af7ec: lea rax, [rax + 0x160]
0x1001af7f3: cmove rcx, rax
0x1001af7f7: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1001af7fc: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x1001af805: mov rax, qword ptr [rip + 0x8f8894] ; 0x100aa80a0
0x1001af80c: mov qword ptr [rsp + 0x80], rax
0x1001af814: mov dword ptr [rsp + 0x88], 0
0x1001af81f: cmp byte ptr [r13 + 0x98], 0
0x1001af827: lea rax, [rip + 0x1c4006a] ; 0x101def898
0x1001af82e: cmove rax, qword ptr [rip + 0xa5abca] ; 0x100c0a400
0x1001af836: mov rcx, qword ptr [rax]
0x1001af839: vmovss xmm0, dword ptr [rip + 0x8f8df3] ; 0x100aa8634
0x1001af841: lea rsi, [rsp + 0x110]
0x1001af849: lea rdx, [rsp + 0x80]
0x1001af851: xor r8d, r8d
0x1001af854: call 0x1002de9e0 ; 0x1002de9e0
0x1001af859: mov qword ptr [rsp + 0x90], rax
0x1001af861: mov dword ptr [rsp + 0x98], edx
0x1001af868: lea rdi, [rsp + 0x90]
0x1001af870: call 0x100316270 ; 0x100316270
0x1001af875: lea rcx, [rip + 0x1e8fdd4] ; 0x10203f650
0x1001af87c: vmovaps xmm0, xmmword ptr [rcx]
0x1001af880: vinsertps xmm0, xmm0, dword ptr [rip + 0x8f4d2e], 0x20 ; 0x100aa45b8
0x1001af88a: vmovaps xmmword ptr [rax + 0x120], xmm0
0x1001af892: vmovaps xmmword ptr [rax + 0x110], xmm0
0x1001af89a: mov rdi, qword ptr [r13 + 0x100]
0x1001af8a1: test rdi, rdi
0x1001af8a4: je 0x1001af8d1
0x1001af8a6: mov rbx, qword ptr [r13 + 0x108]
0x1001af8ad: test rbx, rbx
0x1001af8b0: je 0x1001af8d1
0x1001af8b2: mov rax, qword ptr [rdi]
0x1001af8b5: call qword ptr [rax]
0x1001af8b7: cmp rbx, rax
0x1001af8ba: jne 0x1001af8d1
0x1001af8bc: mov rdi, qword ptr [r13 + 0x100]
0x1001af8c3: mov rax, qword ptr [rdi]
0x1001af8c6: call qword ptr [rax + 0x10]
0x1001af8c9: test al, al
0x1001af8cb: jne 0x1001af9ea
0x1001af8d1: mov rdi, qword ptr [r14 + 0x5c8]
0x1001af8d8: vxorps ymm0, ymm0, ymm0
0x1001af8dc: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x1001af8e5: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x1001af8ee: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x1001af8f7: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x1001af900: vmovaps xmm1, xmmword ptr [r13 + 0x40]
0x1001af906: mov byte ptr [rsp + 0x32d], 1
0x1001af90e: mov dword ptr [rsp + 0x320], 0x3f800000
0x1001af919: vmovaps xmmword ptr [rsp + 0x330], xmm1
0x1001af922: movabs rax, 0x41a0000040000000
0x1001af92c: mov qword ptr [rsp + 0x368], rax
0x1001af934: mov dword ptr [rsp + 0x390], 0xc31
0x1001af93f: vmovups ymmword ptr [rsp + 0x2f0], ymm0
0x1001af948: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x1001af951: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x1001af95a: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x1001af963: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x1001af96c: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x1001af975: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x1001af97e: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x1001af987: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x1001af990: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x1001af999: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1001af9a2: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1001af9ab: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x1001af9b4: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1001af9bd: lea rsi, [rip + 0x9c85e0] ; 0x100b77fa4 blazeon
0x1001af9c4: lea rdx, [rsp + 0x320]
0x1001af9cc: lea rcx, [rsp + 0x160]
0x1001af9d4: vzeroupper 
0x1001af9d7: call 0x1006018a0 ; 0x1006018a0
0x1001af9dc: mov qword ptr [r13 + 0x100], rax
0x1001af9e3: mov qword ptr [r13 + 0x108], rdx
0x1001af9ea: mov byte ptr [r13 + 0xa0], 1
0x1001af9f2: mov dword ptr [r13 + 0xd4], 0x3dcccccd
0x1001af9fd: cmp byte ptr [r13 + 0xca], 0
0x1001afa05: jne 0x1001af6a6
0x1001afa0b: mov rdi, qword ptr [r13 + 0xe0]
0x1001afa12: test rdi, rdi
0x1001afa15: je 0x1001afa4c
0x1001afa17: movzx esi, byte ptr [r13 + 0xa0]
0x1001afa1f: call 0x1004636d0 ; 0x1004636d0
0x1001afa24: mov rbx, qword ptr [r13 + 0xe0]
0x1001afa2b: lea r15, [rsp + 0x160]
0x1001afa33: mov rdi, r15
0x1001afa36: mov rsi, r13
0x1001afa39: mov rdx, r14
0x1001afa3c: call 0x1001b14f0 ; 0x1001b14f0
0x1001afa41: mov rdi, rbx
0x1001afa44: mov rsi, r15
0x1001afa47: call 0x100463750 ; 0x100463750
0x1001afa4c: mov rdi, qword ptr [r13 + 0x110]
0x1001afa53: test rdi, rdi
0x1001afa56: je 0x1001afb94
0x1001afa5c: movzx esi, byte ptr [r13 + 0xa0]
0x1001afa64: call 0x10033ac40 ; 0x10033ac40
0x1001afa69: cmp byte ptr [r13 + 0xa0], 0
0x1001afa71: jne 0x1001afa8a
0x1001afa73: mov rdi, qword ptr [r13 + 0x110]
0x1001afa7a: cmp byte ptr [rdi + 0xb6], 0
0x1001afa81: je 0x1001afa8a
0x1001afa83: xor esi, esi
0x1001afa85: call 0x10033a780 ; 0x10033a780
0x1001afa8a: mov al, byte ptr [r13 + 0x90]
0x1001afa91: mov rbx, qword ptr [r13 + 0x110]
0x1001afa98: or byte ptr [rbx + 0xb6], al
0x1001afa9e: mov rax, qword ptr [r13 + 0xe0]
0x1001afaa5: cmp byte ptr [rax + 0x32e], 0
0x1001afaac: lea rcx, [rax + 0x240]
0x1001afab3: lea rax, [rax + 0x160]
0x1001afaba: cmove rcx, rax
0x1001afabe: vmovaps xmm0, xmmword ptr [rcx]
0x1001afac2: vmovaps xmmword ptr [rsp + 0x320], xmm0
0x1001afacb: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1001afad0: vmovaps xmmword ptr [rsp + 0x330], xmm0
0x1001afad9: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x1001afade: vmovaps xmmword ptr [rsp + 0x340], xmm0
0x1001afae7: vmovaps xmm0, xmmword ptr [rcx + 0x30]
0x1001afaec: vmovss xmm1, dword ptr [r13 + 0xf4]
0x1001afaf5: vdivss xmm1, xmm1, dword ptr [rip + 0x8f6fab] ; 0x100aa6aa8
0x1001afafd: vinsertps xmm1, xmm0, xmm1, 0x1d
0x1001afb03: vaddps xmm1, xmm0, xmm1
0x1001afb07: vblendps xmm0, xmm1, xmm0, 8
0x1001afb0d: vmovaps xmmword ptr [rsp + 0x350], xmm0
0x1001afb16: vmovaps xmm0, xmmword ptr [r13 + 0xf0]
0x1001afb1f: vdivps xmm0, xmm0, xmmword ptr [rip + 0x8fe539] ; 0x100aae060
0x1001afb27: vxorps xmm1, xmm1, xmm1
0x1001afb2b: vblendps xmm2, xmm1, xmm0, 1
0x1001afb31: vblendps xmm3, xmm1, xmm0, 2
0x1001afb37: vblendps xmm0, xmm1, xmm0, 4
0x1001afb3d: vmovaps xmmword ptr [rsp + 0x90], xmm2
0x1001afb46: vmovaps xmmword ptr [rsp + 0xa0], xmm3
0x1001afb4f: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x1001afb58: vmovaps xmm0, xmmword ptr [rip + 0x8f8ea0] ; 0x100aa8a00
0x1001afb60: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x1001afb69: lea r15, [rsp + 0x160]
0x1001afb71: lea rsi, [rsp + 0x320]
0x1001afb79: lea rdx, [rsp + 0x90]
0x1001afb81: mov rdi, r15
0x1001afb84: call 0x100076df0 ; 0x100076df0
0x1001afb89: mov rdi, rbx
0x1001afb8c: mov rsi, r15
0x1001afb8f: call 0x10033abc0 ; 0x10033abc0
0x1001afb94: mov rbx, qword ptr [r13 + 0xe8]
0x1001afb9b: test rbx, rbx
0x1001afb9e: je 0x1001afc4f
0x1001afba4: vmovaps xmm0, xmmword ptr [r13 + 0x10]
0x1001afbaa: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x1001afbb3: vmovaps xmm0, xmmword ptr [r13 + 0x20]
0x1001afbb9: vmovaps xmmword ptr [rsp + 0x130], xmm0
0x1001afbc2: vmovaps xmm0, xmmword ptr [r13 + 0x30]
0x1001afbc8: vmovaps xmmword ptr [rsp + 0x140], xmm0
0x1001afbd1: vmovaps xmm0, xmmword ptr [r13 + 0x40]
0x1001afbd7: vmovaps xmmword ptr [rsp + 0x150], xmm0
0x1001afbe0: vmovss xmm0, dword ptr [rip + 0x8f54d8] ; 0x100aa50c0
0x1001afbe8: vmovaps xmmword ptr [rsp + 0x320], xmm0
0x1001afbf1: vmovaps xmm0, xmmword ptr [rip + 0x8f7cf7] ; 0x100aa78f0
0x1001afbf9: vmovaps xmmword ptr [rsp + 0x330], xmm0
0x1001afc02: vmovaps xmm0, xmmword ptr [rip + 0x8f8e26] ; 0x100aa8a30
0x1001afc0a: vmovaps xmmword ptr [rsp + 0x340], xmm0
0x1001afc13: vmovaps xmm0, xmmword ptr [rip + 0x8f8de5] ; 0x100aa8a00
0x1001afc1b: vmovaps xmmword ptr [rsp + 0x350], xmm0
0x1001afc24: lea r15, [rsp + 0x160]
0x1001afc2c: lea rsi, [rsp + 0x120]
0x1001afc34: lea rdx, [rsp + 0x320]
0x1001afc3c: mov rdi, r15
0x1001afc3f: call 0x100076df0 ; 0x100076df0
0x1001afc44: mov rdi, rbx
0x1001afc47: mov rsi, r15
0x1001afc4a: call 0x100463750 ; 0x100463750
0x1001afc4f: cmp byte ptr [r13 + 0x90], 0
0x1001afc57: mov byte ptr [rsp + 0xf], r12b
0x1001afc5c: je 0x1001b0193
0x1001afc62: mov dl, byte ptr [r13 + 0x60]
0x1001afc66: mov cl, byte ptr [r13 + 0xa3]
0x1001afc6d: mov eax, ecx
0x1001afc6f: or al, dl
0x1001afc71: setne al
0x1001afc74: test dl, dl
0x1001afc76: je 0x1001afc87
0x1001afc78: test cl, cl
0x1001afc7a: jne 0x1001afc87
0x1001afc7c: cmp byte ptr [r13 + 0xa2], 0
0x1001afc84: setne al
0x1001afc87: mov byte ptr [r13 + 0x56], al
0x1001afc8b: mov qword ptr [rsp + 0x40], r14
0x1001afc90: mov rax, qword ptr [r13 + 0x70]
0x1001afc94: test rax, rax
0x1001afc97: je 0x1001aff57
0x1001afc9d: cmp dword ptr [rax + 0x10], 0
0x1001afca1: je 0x1001aff57
0x1001afca7: lea rcx, [r13 + 0x56]
0x1001afcab: mov qword ptr [rsp + 0x10], rcx
0x1001afcb0: xor r14d, r14d
0x1001afcb3: lea r15, [rsp + 0x160]
0x1001afcbb: lea r12, [rsp + 0x320]
0x1001afcc3: jmp 0x1001afd90 ; 0x1001afd90
0x1001afcc8: nop dword ptr [rax + rax]
0x1001afcd0: mov byte ptr [rax + 0xa3], 1
0x1001afcd7: mov dword ptr [rax + 0xa8], 0
0x1001afce1: vmovss xmm0, dword ptr [r13 + 0x78]
0x1001afce7: vucomiss xmm0, xmm2
0x1001afceb: jbe 0x1001afd24
0x1001afced: vmovss xmm1, dword ptr [r13 + 0xb4]
0x1001afcf6: vdivss xmm0, xmm1, xmm0
0x1001afcfa: vmaxss xmm0, xmm2, xmm0
0x1001afcfe: vmovss xmm1, dword ptr [rip + 0x8f53ba] ; 0x100aa50c0
0x1001afd06: vminss xmm0, xmm1, xmm0
0x1001afd0a: vmovss dword ptr [rax + 0xb8], xmm0
0x1001afd12: cmp byte ptr [rax + 0x90], 0
0x1001afd19: jne 0x1001aff0e
0x1001afd1f: jmp 0x1001afe9f ; 0x1001afe9f
0x1001afd24: mov dword ptr [rax + 0xb8], 0x3f800000
0x1001afd2e: cmp byte ptr [rax + 0x90], 0
0x1001afd35: jne 0x1001aff0e
0x1001afd3b: jmp 0x1001afe9f ; 0x1001afe9f
0x1001afd40: lea rdx, [rax + 0x56]
0x1001afd44: movzx edx, byte ptr [rdx]
0x1001afd47: test cl, cl
0x1001afd49: jne 0x1001afeca
0x1001afd4f: test dl, dl
0x1001afd51: jne 0x1001afd69
0x1001afd53: cmp byte ptr [rax + 0xa4], 0
0x1001afd5a: jne 0x1001afd69
0x1001afd5c: cmp byte ptr [rax + 0xa2], 0
0x1001afd63: je 0x1001aff46
0x1001afd69: mov byte ptr [r13 + 0xa4], 1
0x1001afd71: mov dword ptr [r13 + 0xac], 0
0x1001afd7c: jmp 0x1001aff46 ; 0x1001aff46
0x1001afd81: nop word ptr cs:[rax + rax]
0x1001afd90: mov rax, qword ptr [rax + 8]
0x1001afd94: mov ecx, r14d
0x1001afd97: mov rax, qword ptr [rax + rcx*8]
0x1001afd9b: mov qword ptr [rsp + 0x320], rax
0x1001afda3: call 0x1007abc10 ; 0x1007abc10
0x1001afda8: mov qword ptr [rsp + 0x160], 0
0x1001afdb4: mov rdi, qword ptr [rip + 0x1c2b045] ; 0x101ddae00
0x1001afdbb: mov rbx, qword ptr [rdi]
0x1001afdbe: mov rsi, r15
0x1001afdc1: mov rdx, r12
0x1001afdc4: mov rcx, rax
0x1001afdc7: call qword ptr [rbx + 0x40]
0x1001afdca: mov rax, qword ptr [rsp + 0x160]
0x1001afdd2: test rax, rax
0x1001afdd5: je 0x1001b1259
0x1001afddb: cmp byte ptr [r13 + 0x7c], 0
0x1001afde0: vxorps xmm2, xmm2, xmm2
0x1001afde4: je 0x1001afdff
0x1001afde6: test r14d, r14d
0x1001afde9: jne 0x1001aff57
0x1001afdef: mov rax, qword ptr [r13 + 0xc0]
0x1001afdf6: test rax, rax
0x1001afdf9: je 0x1001aff57
0x1001afdff: cmp byte ptr [r13 + 0x90], 0
0x1001afe07: je 0x1001afed0
0x1001afe0d: movzx ecx, byte ptr [rax + 0xa2]
0x1001afe14: mov byte ptr [r13 + 0xa2], cl
0x1001afe1b: cmp byte ptr [r13 + 0xa3], 0
0x1001afe23: je 0x1001afef7
0x1001afe29: vmovss xmm0, dword ptr [r13 + 0xd8]
0x1001afe32: vucomiss xmm0, xmm2
0x1001afe36: jbe 0x1001afcd0
0x1001afe3c: mov rcx, qword ptr [rsp + 0x40]
0x1001afe41: mov rcx, qword ptr [rcx + 0x160]
0x1001afe48: lea rdx, [rip + 0x1e4b281] ; 0x101ffb0d0
0x1001afe4f: cmp byte ptr [rdx], 0
0x1001afe52: vmovss xmm1, dword ptr [rip + 0x8f5266] ; 0x100aa50c0
0x1001afe5a: je 0x1001afe67
0x1001afe5c: lea rdx, [rip + 0xb086dd] ; 0x100cb8540
0x1001afe63: vmovss xmm1, dword ptr [rdx]
0x1001afe67: vmulss xmm1, xmm1, dword ptr [rcx + 0x20]
0x1001afe6c: vmulss xmm1, xmm1, dword ptr [rcx + 0x14]
0x1001afe71: vmovss xmm2, dword ptr [rip + 0x8f6c23] ; 0x100aa6a9c
0x1001afe79: vmaxss xmm1, xmm2, xmm1
0x1001afe7d: vmovss xmm2, dword ptr [rip + 0x8f6c1b] ; 0x100aa6aa0
0x1001afe85: vminss xmm1, xmm2, xmm1
0x1001afe89: vsubss xmm0, xmm0, xmm1
0x1001afe8d: vmovss dword ptr [r13 + 0xd8], xmm0
0x1001afe96: cmp byte ptr [rax + 0x90], 0
0x1001afe9d: jne 0x1001aff0e
0x1001afe9f: movzx ecx, byte ptr [rax + 0x55]
0x1001afea3: cmp byte ptr [rax + 0x98], 0
0x1001afeaa: je 0x1001afd40
0x1001afeb0: mov rdx, qword ptr [rax + 0x110]
0x1001afeb7: mov esi, 0xb6
0x1001afebc: add rdx, rsi
0x1001afebf: movzx edx, byte ptr [rdx]
0x1001afec2: test cl, cl
0x1001afec4: je 0x1001afd4f
0x1001afeca: test dl, dl
0x1001afecc: jne 0x1001aff33
0x1001afece: jmp 0x1001aff46 ; 0x1001aff46
0x1001afed0: cmp byte ptr [r13 + 0x98], 0
0x1001afed8: mov rcx, qword ptr [rsp + 0x10]
0x1001afedd: je 0x1001afeee
0x1001afedf: mov rcx, qword ptr [r13 + 0x110]
0x1001afee6: mov edx, 0xb6
0x1001afeeb: add rcx, rdx
0x1001afeee: cmp byte ptr [rcx], 0
0x1001afef1: jne 0x1001afe29
0x1001afef7: mov ecx, dword ptr [r13 + 0x94]
0x1001afefe: mov dword ptr [r13 + 0xd8], ecx
0x1001aff05: cmp byte ptr [rax + 0x90], 0
0x1001aff0c: je 0x1001afe9f
0x1001aff0e: cmp byte ptr [rax + 0xa4], 0
0x1001aff15: je 0x1001aff2a
0x1001aff17: mov byte ptr [r13 + 0xa4], 1
0x1001aff1f: mov dword ptr [r13 + 0xac], 0
0x1001aff2a: cmp byte ptr [rax + 0xa5], 0
0x1001aff31: je 0x1001aff46
0x1001aff33: mov byte ptr [r13 + 0xa5], 1
0x1001aff3b: mov dword ptr [r13 + 0xb0], 0
0x1001aff46: inc r14d
0x1001aff49: mov rax, qword ptr [r13 + 0x70]
0x1001aff4d: cmp r14d, dword ptr [rax + 0x10]
0x1001aff51: jb 0x1001afd90
0x1001aff57: mov al, byte ptr [r13 + 0x98]
0x1001aff5e: test al, al
0x1001aff60: je 0x1001b0439
0x1001aff66: mov ecx, 0xb6
0x1001aff6b: add rcx, qword ptr [r13 + 0x110]
0x1001aff72: cmp byte ptr [rcx], 0
0x1001aff75: je 0x1001b0446
0x1001aff7b: cmp byte ptr [r13 + 0xc9], 0
0x1001aff83: jne 0x1001b0446
0x1001aff89: cmp byte ptr [r13 + 0x55], 0
0x1001aff8e: jne 0x1001b0446
0x1001aff94: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001aff99: vcvtsi2ss xmm0, xmm5, eax
0x1001aff9d: vmulss xmm0, xmm0, dword ptr [rip + 0x8f714b] ; 0x100aa70f0
0x1001affa5: vmovss xmm1, dword ptr [r13 + 0x64]
0x1001affab: vucomiss xmm1, xmm0
0x1001affaf: mov r15, qword ptr [rsp + 0x40]
0x1001affb4: jbe 0x1001b0151
0x1001affba: mov rdi, qword ptr [r15 + 0x280]
0x1001affc1: call 0x1000fc260 ; 0x1000fc260
0x1001affc6: mov rax, qword ptr [rax + 0x18]
0x1001affca: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1001affcf: vsubps xmm0, xmm0, xmmword ptr [r13 + 0x40]
0x1001affd5: vmulps xmm0, xmm0, xmm0
0x1001affd9: vmovshdup xmm1, xmm0
0x1001affdd: vaddss xmm1, xmm0, xmm1
0x1001affe1: vpermilpd xmm0, xmm0, 1
0x1001affe7: vaddss xmm0, xmm0, xmm1
0x1001affeb: vsqrtss xmm0, xmm0, xmm0
0x1001affef: vmovss xmm1, dword ptr [rip + 0x8f77e5] ; 0x100aa77dc
0x1001afff7: vucomiss xmm1, xmm0
0x1001afffb: jbe 0x1001b0151
0x1001b0001: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001b0006: vcvtsi2ss xmm0, xmm5, eax
0x1001b000a: vmulss xmm0, xmm0, dword ptr [rip + 0x8f70de] ; 0x100aa70f0
0x1001b0012: vmulss xmm0, xmm0, dword ptr [rip + 0x8faf26] ; 0x100aaaf40
0x1001b001a: vcvttss2si eax, xmm0
0x1001b001e: cdqe 
0x1001b0020: imul rbx, rax, 0x68db8bad
0x1001b0027: mov rax, rbx
0x1001b002a: shr rax, 0x3f
0x1001b002e: sar rbx, 0x2d
0x1001b0032: add ebx, eax
0x1001b0034: add ebx, 3
0x1001b0037: je 0x1001b0151
0x1001b003d: lea r14, [rsp + 0xd0]
0x1001b0045: nop word ptr cs:[rax + rax]
0x1001b0050: vmovaps xmm0, xmmword ptr [rip + 0x8f7898] ; 0x100aa78f0
0x1001b0058: vaddps xmm0, xmm0, xmmword ptr [r13 + 0x40]
0x1001b005e: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001b0064: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001b0069: vcvtsi2ss xmm0, xmm5, eax
0x1001b006d: vmovss xmm1, dword ptr [rip + 0x8f707b] ; 0x100aa70f0
0x1001b0075: vmulss xmm0, xmm0, xmm1
0x1001b0079: vmovss xmm1, dword ptr [rip + 0x8f503f] ; 0x100aa50c0
0x1001b0081: vsubss xmm1, xmm1, xmm0
0x1001b0085: vmulss xmm1, xmm1, dword ptr [rip + 0x8f7057] ; 0x100aa70e4
0x1001b008d: vmulss xmm0, xmm0, dword ptr [rip + 0x8f8923] ; 0x100aa89b8
0x1001b0095: vaddss xmm0, xmm0, xmm1
0x1001b0099: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x1001b009e: vpshufb xmm0, xmm0, xmmword ptr [rip + 0x8fbe49] ; 0x100aabef0
0x1001b00a7: vmovdqa xmmword ptr [rsp + 0x30], xmm0
0x1001b00ad: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001b00b2: vcvtsi2ss xmm0, xmm5, eax
0x1001b00b6: vmulss xmm0, xmm0, dword ptr [rip + 0x8f7032] ; 0x100aa70f0
0x1001b00be: vmovss xmm1, dword ptr [rip + 0x8f4ffa] ; 0x100aa50c0
0x1001b00c6: vsubss xmm1, xmm1, xmm0
0x1001b00ca: vmulss xmm1, xmm1, dword ptr [rip + 0x8f88d6] ; 0x100aa89a8
0x1001b00d2: vmulss xmm0, xmm0, dword ptr [rip + 0x8f9102] ; 0x100aa91dc
0x1001b00da: vaddss xmm0, xmm0, xmm1
0x1001b00de: vpermilps xmm0, xmm0, 0xc0
0x1001b00e4: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x1001b00ea: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x10]
0x1001b00f0: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001b00f6: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001b00fb: vcvtsi2ss xmm0, xmm5, eax
0x1001b00ff: vmulss xmm0, xmm0, dword ptr [rip + 0x8f6fe9] ; 0x100aa70f0
0x1001b0107: vmovss xmm1, dword ptr [rip + 0x8f4fb1] ; 0x100aa50c0
0x1001b010f: vsubss xmm1, xmm1, xmm0
0x1001b0113: vmulss xmm1, xmm1, dword ptr [rip + 0x8f76cd] ; 0x100aa77e8
0x1001b011b: vmulss xmm0, xmm0, dword ptr [rip + 0x8f6fd1] ; 0x100aa70f4
0x1001b0123: vaddss xmm0, xmm0, xmm1
0x1001b0127: mov rdi, qword ptr [r15 + 0x428]
0x1001b012e: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x1001b0134: vmovaps xmmword ptr [rsp + 0xd0], xmm1
0x1001b013d: mov rsi, r14
0x1001b0140: vmovaps xmm1, xmm0
0x1001b0144: call 0x1002d8410 ; 0x1002d8410
0x1001b0149: dec ebx
0x1001b014b: jne 0x1001b0050
0x1001b0151: mov byte ptr [r13 + 0xc9], 1
0x1001b0159: mov al, byte ptr [r13 + 0x98]
0x1001b0160: test al, al
0x1001b0162: jne 0x1001b044e
0x1001b0168: lea rcx, [r13 + 0x56]
0x1001b016c: cmp byte ptr [rcx], 0
0x1001b016f: je 0x1001b0463
0x1001b0175: cmp byte ptr [r13 + 0x57], 0
0x1001b017a: je 0x1001b0463
0x1001b0180: cmp byte ptr [r13 + 0x90], 0
0x1001b0188: jne 0x1001b0463
0x1001b018e: jmp 0x1001b0477 ; 0x1001b0477
0x1001b0193: mov rdi, qword ptr [r14 + 0x280]
0x1001b019a: cmp byte ptr [rdi + 0xc], 0
0x1001b019e: je 0x1001b06b5
0x1001b01a4: xor ebx, ebx
0x1001b01a6: lea r12, [rsp + 0x100]
0x1001b01ae: jmp 0x1001b01b7 ; 0x1001b01b7
0x1001b01b0: mov rdi, qword ptr [r14 + 0x280]
0x1001b01b7: mov esi, ebx
0x1001b01b9: call 0x1001031d0 ; 0x1001031d0
0x1001b01be: mov r15, rax
0x1001b01c1: mov rdi, r15
0x1001b01c4: call 0x1000fe050 ; 0x1000fe050
0x1001b01c9: test al, al
0x1001b01cb: je 0x1001b02b0
0x1001b01d1: cmp byte ptr [r13 + 0x98], 0
0x1001b01d9: je 0x1001b02c0
0x1001b01df: mov rax, qword ptr [r15 + 0xa8]
0x1001b01e6: mov rdi, qword ptr [rax + 0x210]
0x1001b01ed: call 0x1003c62c0 ; 0x1003c62c0
0x1001b01f2: vmovaps xmm0, xmmword ptr [rax + 0xc0]
0x1001b01fa: mov rcx, qword ptr [r13 + 0x110]
0x1001b0201: vsubps xmm0, xmm0, xmmword ptr [rcx + 0xc0]
0x1001b0209: vmulps xmm0, xmm0, xmm0
0x1001b020d: vmovshdup xmm1, xmm0
0x1001b0211: vaddss xmm1, xmm0, xmm1
0x1001b0215: vpermilpd xmm0, xmm0, 1
0x1001b021b: vaddss xmm0, xmm0, xmm1
0x1001b021f: vsqrtss xmm0, xmm0, xmm0
0x1001b0223: vmovss xmm1, dword ptr [rax + 0x108]
0x1001b022b: vinsertps xmm1, xmm1, dword ptr [rcx + 0x108], 0x10
0x1001b0235: vmovaps xmm2, xmmword ptr [rip + 0x8fde33] ; 0x100aae070
0x1001b023d: vmovaps xmm3, xmm2
0x1001b0241: vmaxps xmm2, xmm3, xmm1
0x1001b0245: vcmpunordps xmm1, xmm1, xmm1
0x1001b024a: vblendvps xmm1, xmm2, xmm3, xmm1
0x1001b0250: vmovss xmm2, dword ptr [rax + 0x10c]
0x1001b0258: vinsertps xmm2, xmm2, dword ptr [rcx + 0x10c], 0x10
0x1001b0262: vmulps xmm2, xmm2, xmmword ptr [rip + 0x8fde16] ; 0x100aae080
0x1001b026a: vaddps xmm2, xmm2, xmmword ptr [rip + 0x8fa2de] ; 0x100aaa550
0x1001b0272: vmulps xmm1, xmm1, xmm2
0x1001b0276: vmovshdup xmm2, xmm1
0x1001b027a: vaddss xmm1, xmm1, xmm2
0x1001b027e: vaddss xmm1, xmm1, xmm1
0x1001b0282: vucomiss xmm1, xmm0
0x1001b0286: setae al
0x1001b0289: cmp byte ptr [r13 + 0xa0], 0
0x1001b0291: jne 0x1001b03ae
0x1001b0297: cmp byte ptr [r13 + 0x56], 0
0x1001b029c: je 0x1001b02b0
0x1001b029e: xor al, 1
0x1001b02a0: je 0x1001b03b6
0x1001b02a6: nop word ptr cs:[rax + rax]
0x1001b02b0: inc ebx
0x1001b02b2: cmp ebx, 0xf
0x1001b02b5: jbe 0x1001b01b0
0x1001b02bb: jmp 0x1001b06b5 ; 0x1001b06b5
0x1001b02c0: vmovaps xmm0, xmmword ptr [r13 + 0x10]
0x1001b02c6: vmovaps xmm1, xmmword ptr [r13 + 0x40]
0x1001b02cc: vmovaps xmmword ptr [rsp + 0x30], xmm1
0x1001b02d2: vmulps xmm0, xmm0, xmm0
0x1001b02d6: vpermilpd xmm1, xmm0, 1
0x1001b02dc: vaddps xmm0, xmm0, xmm1
0x1001b02e0: vmovshdup xmm1, xmm0
0x1001b02e4: vaddss xmm0, xmm0, xmm1
0x1001b02e8: vsqrtss xmm0, xmm0, xmm0
0x1001b02ec: vmulss xmm0, xmm0, dword ptr [rip + 0x8f42c4] ; 0x100aa45b8
0x1001b02f4: vmovss dword ptr [rsp + 0x10], xmm0
0x1001b02fa: mov rax, qword ptr [r15 + 0x20]
0x1001b02fe: mov rsi, qword ptr [rax + 0x258]
0x1001b0305: mov rdi, r12
0x1001b0308: call 0x1007f26b0 ; 0x1007f26b0
0x1001b030d: vmovaps xmm0, xmmword ptr [rsp + 0x100]
0x1001b0316: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x1001b031c: vmulps xmm0, xmm0, xmm0
0x1001b0320: vmovshdup xmm1, xmm0
0x1001b0324: vaddss xmm1, xmm0, xmm1
0x1001b0328: vpermilpd xmm0, xmm0, 1
0x1001b032e: vaddss xmm0, xmm0, xmm1
0x1001b0332: vsqrtss xmm0, xmm0, xmm0
0x1001b0336: mov al, 1
0x1001b0338: vmovss xmm1, dword ptr [rsp + 0x10]
0x1001b033e: vucomiss xmm1, xmm0
0x1001b0342: ja 0x1001b03a0
0x1001b0344: mov rax, qword ptr [r15 + 0x20]
0x1001b0348: mov rsi, qword ptr [rax + 0x260]
0x1001b034f: lea rdi, [rsp + 0xf0]
0x1001b0357: call 0x1007f26b0 ; 0x1007f26b0
0x1001b035c: vmovaps xmm0, xmmword ptr [rsp + 0xf0]
0x1001b0365: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x1001b036b: vmulps xmm0, xmm0, xmm0
0x1001b036f: vmovshdup xmm1, xmm0
0x1001b0373: vaddss xmm1, xmm0, xmm1
0x1001b0377: vpermilpd xmm0, xmm0, 1
0x1001b037d: vaddss xmm0, xmm0, xmm1
0x1001b0381: vsqrtss xmm0, xmm0, xmm0
0x1001b0385: vmovss xmm1, dword ptr [rsp + 0x10]
0x1001b038b: vucomiss xmm1, xmm0
0x1001b038f: seta al
0x1001b0392: nop word ptr cs:[rax + rax]
0x1001b03a0: cmp byte ptr [r13 + 0xa0], 0
0x1001b03a8: je 0x1001b0297
0x1001b03ae: test al, al
0x1001b03b0: je 0x1001b02b0
0x1001b03b6: vmovss xmm0, dword ptr [r13 + 0x9c]
0x1001b03bf: vxorps xmm1, xmm1, xmm1
0x1001b03c3: vucomiss xmm0, xmm1
0x1001b03c7: jne 0x1001b0406
0x1001b03c9: jp 0x1001b0406
0x1001b03cb: mov eax, dword ptr [r15 + 0xe0]
0x1001b03d2: mov dword ptr [rsp + 0x68], eax
0x1001b03d6: mov rdx, qword ptr [r14 + 0x178]
0x1001b03dd: mov rcx, qword ptr [r14 + 0x5c8]
0x1001b03e4: lea rsi, [rsp + 0x68]
0x1001b03e9: mov r8d, 1
0x1001b03ef: mov r9d, 1
0x1001b03f5: mov rdi, r13
0x1001b03f8: call 0x1001ae070 ; 0x1001ae070
0x1001b03fd: vmovss xmm0, dword ptr [r13 + 0x9c]
0x1001b0406: lea rax, [r13 + 0x9c]
0x1001b040d: mov rcx, qword ptr [r14 + 0x160]
0x1001b0414: lea rdx, [rip + 0x1e4acb5] ; 0x101ffb0d0
0x1001b041b: cmp byte ptr [rdx], 0
0x1001b041e: mov rbx, qword ptr [rsp + 0x28]
0x1001b0423: je 0x1001b0f89
0x1001b0429: lea rdx, [rip + 0xb08110] ; 0x100cb8540
0x1001b0430: vmovss xmm1, dword ptr [rdx]
0x1001b0434: jmp 0x1001b0f91 ; 0x1001b0f91
0x1001b0439: lea rcx, [r13 + 0x56]
0x1001b043d: cmp byte ptr [rcx], 0
0x1001b0440: jne 0x1001aff7b
0x1001b0446: test al, al
0x1001b0448: je 0x1001b0168
0x1001b044e: mov ecx, 0xb6
0x1001b0453: add rcx, qword ptr [r13 + 0x110]
0x1001b045a: cmp byte ptr [rcx], 0
0x1001b045d: jne 0x1001b0175
0x1001b0463: cmp byte ptr [r13 + 0xa0], 0
0x1001b046b: je 0x1001b047f
0x1001b046d: cmp byte ptr [r13 + 0x91], 0
0x1001b0475: je 0x1001b047f
0x1001b0477: mov byte ptr [r13 + 0xa2], 1
0x1001b047f: test al, al
0x1001b0481: je 0x1001b04a7
0x1001b0483: mov ecx, 0xb6
0x1001b0488: add rcx, qword ptr [r13 + 0x110]
0x1001b048f: cmp byte ptr [rcx], 0
0x1001b0492: je 0x1001b04b0
0x1001b0494: cmp byte ptr [r13 + 0x55], 0
0x1001b0499: je 0x1001b04b0
0x1001b049b: cmp byte ptr [r13 + 0xa3], 0
0x1001b04a3: jne 0x1001b04be
0x1001b04a5: jmp 0x1001b04b0 ; 0x1001b04b0
0x1001b04a7: lea rcx, [r13 + 0x56]
0x1001b04ab: cmp byte ptr [rcx], 0
0x1001b04ae: jne 0x1001b0494
0x1001b04b0: cmp byte ptr [r13 + 0xc8], 0
0x1001b04b8: je 0x1001b059e
0x1001b04be: mov rcx, qword ptr [r13 + 0x70]
0x1001b04c2: test rcx, rcx
0x1001b04c5: je 0x1001b0571
0x1001b04cb: cmp dword ptr [rcx + 0x10], 0
0x1001b04cf: je 0x1001b0571
0x1001b04d5: xor ebx, ebx
0x1001b04d7: lea r15, [rsp + 0x160]
0x1001b04df: lea r14, [rsp + 0x320]
0x1001b04e7: nop word ptr [rax + rax]
0x1001b04f0: mov rax, qword ptr [rcx + 8]
0x1001b04f4: mov ecx, ebx
0x1001b04f6: mov rax, qword ptr [rax + rcx*8]
0x1001b04fa: mov qword ptr [rsp + 0x320], rax
0x1001b0502: call 0x1007abc10 ; 0x1007abc10
0x1001b0507: mov qword ptr [rsp + 0x160], 0
0x1001b0513: mov rdi, qword ptr [rip + 0x1c2a8e6] ; 0x101ddae00
0x1001b051a: mov r8, qword ptr [rdi]
0x1001b051d: mov rsi, r15
0x1001b0520: mov rdx, r14
0x1001b0523: mov rcx, rax
0x1001b0526: call qword ptr [r8 + 0x40]
0x1001b052a: mov rax, qword ptr [rsp + 0x160]
0x1001b0532: test rax, rax
0x1001b0535: je 0x1001b1259
0x1001b053b: cmp byte ptr [r13 + 0x7c], 0
0x1001b0540: je 0x1001b0552
0x1001b0542: test ebx, ebx
0x1001b0544: jne 0x1001b056a
0x1001b0546: mov rax, qword ptr [r13 + 0xc0]
0x1001b054d: test rax, rax
0x1001b0550: je 0x1001b056a
0x1001b0552: cmp byte ptr [rax + 0x55], 0
0x1001b0556: jne 0x1001b055f
0x1001b0558: mov byte ptr [rax + 0xc8], 1
0x1001b055f: inc ebx
0x1001b0561: mov rcx, qword ptr [r13 + 0x70]
0x1001b0565: cmp ebx, dword ptr [rcx + 0x10]
0x1001b0568: jb 0x1001b04f0
0x1001b056a: mov al, byte ptr [r13 + 0x98]
0x1001b0571: mov byte ptr [r13 + 0xa2], 0
0x1001b0579: mov byte ptr [r13 + 0xc8], 0
0x1001b0581: test al, al
0x1001b0583: je 0x1001b0719
0x1001b0589: mov ecx, 0xb6
0x1001b058e: add rcx, qword ptr [r13 + 0x110]
0x1001b0595: cmp byte ptr [rcx], 0
0x1001b0598: je 0x1001b0726
0x1001b059e: cmp byte ptr [r13 + 0xa0], 0
0x1001b05a6: je 0x1001b073c
0x1001b05ac: test al, al
0x1001b05ae: je 0x1001b091a
0x1001b05b4: mov eax, 0xb6
0x1001b05b9: add rax, qword ptr [r13 + 0x110]
0x1001b05c0: cmp byte ptr [rax], 0
0x1001b05c3: je 0x1001b0927
0x1001b05c9: xor r12d, r12d
0x1001b05cc: cmp qword ptr [r13 + 0xe8], 0
0x1001b05d4: je 0x1001b074d
0x1001b05da: cmp byte ptr [r13 + 0x90], 0
0x1001b05e2: jne 0x1001b074d
0x1001b05e8: lea rax, [rip + 0x1e4aae1] ; 0x101ffb0d0
0x1001b05ef: cmp byte ptr [rax], 0
0x1001b05f2: vmovss xmm0, dword ptr [rip + 0x8f4ac6] ; 0x100aa50c0
0x1001b05fa: vmovaps xmm1, xmm0
0x1001b05fe: je 0x1001b060b
0x1001b0600: lea rax, [rip + 0xb07f39] ; 0x100cb8540
0x1001b0607: vmovss xmm1, dword ptr [rax]
0x1001b060b: mov rax, qword ptr [rsp + 0x40]
0x1001b0610: mov rax, qword ptr [rax + 0x160]
0x1001b0617: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1001b061c: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1001b0621: vmovss xmm2, dword ptr [rip + 0x8f6473] ; 0x100aa6a9c
0x1001b0629: vmaxss xmm1, xmm2, xmm1
0x1001b062d: vmovss xmm2, dword ptr [rip + 0x8f646b] ; 0x100aa6aa0
0x1001b0635: vminss xmm2, xmm2, xmm1
0x1001b0639: vmulss xmm1, xmm2, dword ptr [rip + 0x8f6463] ; 0x100aa6aa4
0x1001b0641: vsubss xmm0, xmm0, xmm1
0x1001b0645: vmulss xmm3, xmm0, dword ptr [r13 + 0xd0]
0x1001b064e: test r12b, 1
0x1001b0652: jne 0x1001b0b36
0x1001b0658: vaddss xmm1, xmm1, xmm3
0x1001b065c: vmovss dword ptr [r13 + 0xd0], xmm1
0x1001b0665: vmulss xmm2, xmm2, dword ptr [rip + 0x8f7f43] ; 0x100aa85b0
0x1001b066d: vmovss xmm0, dword ptr [rip + 0x8f4a4b] ; 0x100aa50c0
0x1001b0675: vsubss xmm3, xmm0, xmm2
0x1001b0679: vucomiss xmm3, xmm1
0x1001b067d: ja 0x1001b0b65
0x1001b0683: vaddss xmm3, xmm2, xmm0
0x1001b0687: vucomiss xmm1, xmm3
0x1001b068b: jbe 0x1001b0691
0x1001b068d: vsubss xmm0, xmm1, xmm2
0x1001b0691: vmovss dword ptr [r13 + 0xd0], xmm0
0x1001b069a: cmp byte ptr [r13 + 0x57], 0
0x1001b069f: jne 0x1001b0758
0x1001b06a5: cmp byte ptr [r13 + 0x55], 0
0x1001b06aa: jne 0x1001b0758
0x1001b06b0: jmp 0x1001b07cc ; 0x1001b07cc
0x1001b06b5: lea rax, [r13 + 0x9c]
0x1001b06bc: xor r15d, r15d
0x1001b06bf: mov rbx, qword ptr [rsp + 0x28]
0x1001b06c4: mov dword ptr [rax], 0
0x1001b06ca: vmovss xmm0, dword ptr [r13 + 0x78]
0x1001b06d0: vxorps xmm1, xmm1, xmm1
0x1001b06d4: vucomiss xmm0, xmm1
0x1001b06d8: jbe 0x1001b0c00
0x1001b06de: cmp byte ptr [r13 + 0x56], 0
0x1001b06e3: je 0x1001b0c00
0x1001b06e9: vmovss xmm0, dword ptr [r13 + 0xb4]
0x1001b06f2: mov rax, qword ptr [r14 + 0x160]
0x1001b06f9: lea rcx, [rip + 0x1e4a9d0] ; 0x101ffb0d0
0x1001b0700: cmp byte ptr [rcx], 0
0x1001b0703: je 0x1001b0b82
0x1001b0709: lea rcx, [rip + 0xb07e30] ; 0x100cb8540
0x1001b0710: vmovss xmm1, dword ptr [rcx]
0x1001b0714: jmp 0x1001b0b8a ; 0x1001b0b8a
0x1001b0719: lea rcx, [r13 + 0x56]
0x1001b071d: cmp byte ptr [rcx], 0
0x1001b0720: jne 0x1001b059e
0x1001b0726: mov byte ptr [r13 + 0xc9], 0
0x1001b072e: cmp byte ptr [r13 + 0xa0], 0
0x1001b0736: jne 0x1001b05ac
0x1001b073c: xor r12d, r12d
0x1001b073f: cmp qword ptr [r13 + 0xe8], 0
0x1001b0747: jne 0x1001b05da
0x1001b074d: cmp byte ptr [r13 + 0x57], 0
0x1001b0752: je 0x1001b06a5
0x1001b0758: cmp byte ptr [r13 + 0xa0], 0
0x1001b0760: je 0x1001b07cc
0x1001b0762: mov al, byte ptr [rip + 0xadaab8] ; 0x100c8b220
0x1001b0768: test al, al
0x1001b076a: je 0x1001b07cc
0x1001b076c: call 0x1002b9810 ; 0x1002b9810
0x1001b0771: vmovaps xmm0, xmmword ptr [r13 + 0x40]
0x1001b0777: vmovaps xmmword ptr [rsp + 0x160], xmm0
0x1001b0780: vaddps xmm0, xmm0, xmmword ptr [rip + 0x8f7918] ; 0x100aa80a0
0x1001b0788: vmovaps xmmword ptr [rsp + 0x320], xmm0
0x1001b0791: xor ecx, ecx
0x1001b0793: cmp byte ptr [r13 + 0xa2], 0
0x1001b079b: sete cl
0x1001b079e: lea rdx, [rip + 0x8fd8eb] ; 0x100aae090
0x1001b07a5: vmovss xmm0, dword ptr [rdx + rcx*4]
0x1001b07aa: lea rcx, [rip + 0x1e8ee8f] ; 0x10203f640
0x1001b07b1: lea rsi, [rsp + 0x160]
0x1001b07b9: lea rdx, [rsp + 0x320]
0x1001b07c1: xor r8d, r8d
0x1001b07c4: mov rdi, rax
0x1001b07c7: call 0x1002bd2b0 ; 0x1002bd2b0
0x1001b07cc: cmp byte ptr [r13 + 0x90], 0
0x1001b07d4: mov cl, byte ptr [rsp + 0xf]
0x1001b07d8: je 0x1001b07e0
0x1001b07da: vxorps xmm0, xmm0, xmm0
0x1001b07de: jmp 0x1001b07e8 ; 0x1001b07e8
0x1001b07e0: vmovss xmm0, dword ptr [rip + 0x8f7008] ; 0x100aa77f0
0x1001b07e8: mov eax, dword ptr [r13 + 0xac]
0x1001b07ef: vcvtsi2ss xmm1, xmm5, eax
0x1001b07f3: vucomiss xmm1, xmm0
0x1001b07f7: jbe 0x1001b0803
0x1001b07f9: mov byte ptr [r13 + 0xa4], 0
0x1001b0801: jmp 0x1001b080c ; 0x1001b080c
0x1001b0803: inc eax
0x1001b0805: mov dword ptr [r13 + 0xac], eax
0x1001b080c: mov eax, dword ptr [r13 + 0xa8]
0x1001b0813: vcvtsi2ss xmm1, xmm5, eax
0x1001b0817: vucomiss xmm1, xmm0
0x1001b081b: jbe 0x1001b0827
0x1001b081d: mov byte ptr [r13 + 0xa3], 0
0x1001b0825: jmp 0x1001b0830 ; 0x1001b0830
0x1001b0827: inc eax
0x1001b0829: mov dword ptr [r13 + 0xa8], eax
0x1001b0830: mov eax, dword ptr [r13 + 0xb0]
0x1001b0837: vcvtsi2ss xmm1, xmm5, eax
0x1001b083b: vucomiss xmm1, xmm0
0x1001b083f: jbe 0x1001b084b
0x1001b0841: mov byte ptr [r13 + 0xa5], 0
0x1001b0849: jmp 0x1001b0854 ; 0x1001b0854
0x1001b084b: inc eax
0x1001b084d: mov dword ptr [r13 + 0xb0], eax
0x1001b0854: cmp byte ptr [r13 + 0x56], 0
0x1001b0859: setne al
0x1001b085c: or cl, al
0x1001b085e: jne 0x1001b0897
0x1001b0860: mov rdi, qword ptr [r13 + 0x110]
0x1001b0867: test rdi, rdi
0x1001b086a: je 0x1001b0897
0x1001b086c: cmp byte ptr [rdi + 0xb6], 0
0x1001b0873: je 0x1001b0897
0x1001b0875: cmp byte ptr [r13 + 0x11c], 0
0x1001b087d: je 0x1001b0886
0x1001b087f: cmp qword ptr [r13 + 0x70], 0
0x1001b0884: je 0x1001b0897
0x1001b0886: cmp byte ptr [r13 + 0x91], 0
0x1001b088e: jne 0x1001b0897
0x1001b0890: xor esi, esi
0x1001b0892: call 0x10033a780 ; 0x10033a780
0x1001b0897: lea rbx, [r13 + 0x56]
0x1001b089b: mov al, byte ptr [r13 + 0x98]
0x1001b08a2: mov rcx, rbx
0x1001b08a5: test al, al
0x1001b08a7: je 0x1001b08b5
0x1001b08a9: mov ecx, 0xb6
0x1001b08ae: add rcx, qword ptr [r13 + 0x110]
0x1001b08b5: cmp byte ptr [rcx], 0
0x1001b08b8: je 0x1001b08e9
0x1001b08ba: cmp byte ptr [r13 + 0x11c], 0
0x1001b08c2: jne 0x1001b08e9
0x1001b08c4: mov byte ptr [r13 + 0x11c], 1
0x1001b08cc: mov rdi, qword ptr [r13 + 0x80]
0x1001b08d3: test rdi, rdi
0x1001b08d6: je 0x1001b08e9
0x1001b08d8: mov esi, 1
0x1001b08dd: call 0x1004d1f60 ; 0x1004d1f60
0x1001b08e2: mov al, byte ptr [r13 + 0x98]
0x1001b08e9: test al, al
0x1001b08eb: je 0x1001b08f9
0x1001b08ed: mov ebx, 0xb6
0x1001b08f2: add rbx, qword ptr [r13 + 0x110]
0x1001b08f9: cmp byte ptr [rbx], 0
0x1001b08fc: jne 0x1001b0b0f
0x1001b0902: cmp qword ptr [r13 + 0x70], 0
0x1001b0907: je 0x1001b0b0f
0x1001b090d: mov byte ptr [r13 + 0x11c], 0
0x1001b0915: jmp 0x1001b0b0f ; 0x1001b0b0f
0x1001b091a: lea rax, [r13 + 0x56]
0x1001b091e: cmp byte ptr [rax], 0
0x1001b0921: jne 0x1001b05c9
0x1001b0927: mov rax, qword ptr [r13 + 0x70]
0x1001b092b: mov r12b, 1
0x1001b092e: test rax, rax
0x1001b0931: je 0x1001b073f
0x1001b0937: cmp dword ptr [rax + 0x10], 0
0x1001b093b: je 0x1001b073f
0x1001b0941: mov r12b, 1
0x1001b0944: xor ebx, ebx
0x1001b0946: lea r15, [rsp + 0x160]
0x1001b094e: lea r14, [rsp + 0x320]
0x1001b0956: nop word ptr cs:[rax + rax]
0x1001b0960: mov rax, qword ptr [rax + 8]
0x1001b0964: mov ecx, ebx
0x1001b0966: mov rax, qword ptr [rax + rcx*8]
0x1001b096a: mov qword ptr [rsp + 0x320], rax
0x1001b0972: call 0x1007abc10 ; 0x1007abc10
0x1001b0977: mov qword ptr [rsp + 0x160], 0
0x1001b0983: mov rdi, qword ptr [rip + 0x1c2a476] ; 0x101ddae00
0x1001b098a: mov r8, qword ptr [rdi]
0x1001b098d: mov rsi, r15
0x1001b0990: mov rdx, r14
0x1001b0993: mov rcx, rax
0x1001b0996: call qword ptr [r8 + 0x40]
0x1001b099a: mov rax, qword ptr [rsp + 0x160]
0x1001b09a2: test rax, rax
0x1001b09a5: je 0x1001b1259
0x1001b09ab: cmp byte ptr [r13 + 0x7c], 0
0x1001b09b0: je 0x1001b09ca
0x1001b09b2: test ebx, ebx
0x1001b09b4: jne 0x1001b073f
0x1001b09ba: mov rax, qword ptr [r13 + 0xc0]
0x1001b09c1: test rax, rax
0x1001b09c4: je 0x1001b073f
0x1001b09ca: cmp byte ptr [rax + 0xa0], 0
0x1001b09d1: je 0x1001b09e1
0x1001b09d3: movzx eax, byte ptr [rax + 0x55]
0x1001b09d7: test al, al
0x1001b09d9: je 0x1001b09de
0x1001b09db: mov eax, r12d
0x1001b09de: mov r12b, al
0x1001b09e1: inc ebx
0x1001b09e3: mov rax, qword ptr [r13 + 0x70]
0x1001b09e7: cmp ebx, dword ptr [rax + 0x10]
0x1001b09ea: jb 0x1001b0960
0x1001b09f0: jmp 0x1001b073f ; 0x1001b073f
0x1001b09f5: mov rdi, qword ptr [r13 + 0xe0]
0x1001b09fc: test rdi, rdi
0x1001b09ff: je 0x1001b0a42
0x1001b0a01: xor esi, esi
0x1001b0a03: jmp 0x1001b0a3d ; 0x1001b0a3d
0x1001b0a05: vmovss xmm0, dword ptr [rip + 0x8f46b3] ; 0x100aa50c0
0x1001b0a0d: vaddss xmm3, xmm2, xmm0
0x1001b0a11: vucomiss xmm1, xmm3
0x1001b0a15: jbe 0x1001b0a1b
0x1001b0a17: vsubss xmm0, xmm1, xmm2
0x1001b0a1b: vmovss dword ptr [r13 + 0xcc], xmm0
0x1001b0a24: mov rdi, qword ptr [r13 + 0xe0]
0x1001b0a2b: vmovss xmm1, dword ptr [rip + 0x8f468d] ; 0x100aa50c0
0x1001b0a33: xor esi, esi
0x1001b0a35: vucomiss xmm1, xmm0
0x1001b0a39: seta sil
0x1001b0a3d: call 0x1004636d0 ; 0x1004636d0
0x1001b0a42: cmp qword ptr [r13 + 0xe8], 0
0x1001b0a4a: je 0x1001b0af5
0x1001b0a50: mov rax, qword ptr [r14 + 0x160]
0x1001b0a57: lea rcx, [rip + 0x1e4a672] ; 0x101ffb0d0
0x1001b0a5e: cmp byte ptr [rcx], 0
0x1001b0a61: vmovss xmm0, dword ptr [rip + 0x8f4657] ; 0x100aa50c0
0x1001b0a69: vmovaps xmm1, xmm0
0x1001b0a6d: je 0x1001b0a7a
0x1001b0a6f: lea rcx, [rip + 0xb07aca] ; 0x100cb8540
0x1001b0a76: vmovss xmm1, dword ptr [rcx]
0x1001b0a7a: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1001b0a7f: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1001b0a84: vmovss xmm2, dword ptr [rip + 0x8f6010] ; 0x100aa6a9c
0x1001b0a8c: vmaxss xmm1, xmm2, xmm1
0x1001b0a90: vmovss xmm2, dword ptr [rip + 0x8f6008] ; 0x100aa6aa0
0x1001b0a98: vminss xmm2, xmm2, xmm1
0x1001b0a9c: vmulss xmm1, xmm2, dword ptr [rip + 0x8f6e18] ; 0x100aa78bc
0x1001b0aa4: vsubss xmm3, xmm0, xmm1
0x1001b0aa8: vmulss xmm3, xmm3, dword ptr [r13 + 0xd0]
0x1001b0ab1: vaddss xmm1, xmm1, xmm3
0x1001b0ab5: vmovss dword ptr [r13 + 0xd0], xmm1
0x1001b0abe: vmulss xmm2, xmm2, dword ptr [rip + 0x8f7aea] ; 0x100aa85b0
0x1001b0ac6: vsubss xmm0, xmm0, xmm2
0x1001b0aca: vucomiss xmm0, xmm1
0x1001b0ace: jbe 0x1001b0ad6
0x1001b0ad0: vaddss xmm0, xmm2, xmm1
0x1001b0ad4: jmp 0x1001b0aec ; 0x1001b0aec
0x1001b0ad6: vmovss xmm0, dword ptr [rip + 0x8f45e2] ; 0x100aa50c0
0x1001b0ade: vaddss xmm3, xmm2, xmm0
0x1001b0ae2: vucomiss xmm1, xmm3
0x1001b0ae6: jbe 0x1001b0aec
0x1001b0ae8: vsubss xmm0, xmm1, xmm2
0x1001b0aec: vmovss dword ptr [r13 + 0xd0], xmm0
0x1001b0af5: mov rdi, qword ptr [r13 + 0x110]
0x1001b0afc: test rdi, rdi
0x1001b0aff: je 0x1001b0b0f
0x1001b0b01: mov byte ptr [rdi + 0xb4], 0
0x1001b0b08: xor esi, esi
0x1001b0b0a: call 0x10033a780 ; 0x10033a780
0x1001b0b0f: mov rax, qword ptr [rip + 0xa5cdc2] ; 0x100c0d8d8
0x1001b0b16: mov rax, qword ptr [rax]
0x1001b0b19: cmp rax, qword ptr [rsp + 0x3a0]
0x1001b0b21: jne 0x1001b1254
0x1001b0b27: lea rsp, [rbp - 0x28]
0x1001b0b2b: pop rbx
0x1001b0b2c: pop r12
0x1001b0b2e: pop r13
0x1001b0b30: pop r14
0x1001b0b32: pop r15
0x1001b0b34: pop rbp
0x1001b0b35: ret 
0x1001b0b36: vmovss xmm0, dword ptr [rip + 0x8f996a] ; 0x100aaa4a8
0x1001b0b3e: vmulss xmm1, xmm1, xmm0
0x1001b0b42: vaddss xmm1, xmm1, xmm3
0x1001b0b46: vmovss dword ptr [r13 + 0xd0], xmm1
0x1001b0b4f: vmulss xmm2, xmm2, dword ptr [rip + 0x8f7a59] ; 0x100aa85b0
0x1001b0b57: vsubss xmm3, xmm0, xmm2
0x1001b0b5b: vucomiss xmm3, xmm1
0x1001b0b5f: jbe 0x1001b0683
0x1001b0b65: vaddss xmm0, xmm2, xmm1
0x1001b0b69: vmovss dword ptr [r13 + 0xd0], xmm0
0x1001b0b72: cmp byte ptr [r13 + 0x57], 0
0x1001b0b77: jne 0x1001b0758
0x1001b0b7d: jmp 0x1001b06a5 ; 0x1001b06a5
0x1001b0b82: vmovss xmm1, dword ptr [rip + 0x8f4536] ; 0x100aa50c0
0x1001b0b8a: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1001b0b8f: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1001b0b94: vmovss xmm2, dword ptr [rip + 0x8f5f00] ; 0x100aa6a9c
0x1001b0b9c: vmaxss xmm1, xmm2, xmm1
0x1001b0ba0: vmovss xmm2, dword ptr [rip + 0x8f5ef8] ; 0x100aa6aa0
0x1001b0ba8: vminss xmm1, xmm2, xmm1
0x1001b0bac: vsubss xmm0, xmm0, xmm1
0x1001b0bb0: vxorps xmm1, xmm1, xmm1
0x1001b0bb4: vmaxss xmm2, xmm1, xmm0
0x1001b0bb8: vcmpunordss xmm0, xmm0, xmm0
0x1001b0bbd: vandnps xmm0, xmm0, xmm2
0x1001b0bc1: vmovss dword ptr [r13 + 0xb4], xmm0
0x1001b0bca: vucomiss xmm0, xmm1
0x1001b0bce: jne 0x1001b0c00
0x1001b0bd0: jp 0x1001b0c00
0x1001b0bd2: mov eax, dword ptr [rip + 0xb733c4] ; 0x100d23f9c
0x1001b0bd8: mov dword ptr [rsp + 0x60], eax
0x1001b0bdc: mov rdx, qword ptr [r14 + 0x178]
0x1001b0be3: mov rcx, qword ptr [r14 + 0x5c8]
0x1001b0bea: lea rsi, [rsp + 0x60]
0x1001b0bef: mov r8d, 1
0x1001b0bf5: xor r9d, r9d
0x1001b0bf8: mov rdi, r13
0x1001b0bfb: call 0x1001ae070 ; 0x1001ae070
0x1001b0c00: cmp byte ptr [r13 + 0x98], 0
0x1001b0c08: je 0x1001b0dd6
0x1001b0c0e: mov eax, 0xb6
0x1001b0c13: add rax, qword ptr [r13 + 0x110]
0x1001b0c1a: cmp byte ptr [rax], 0
0x1001b0c1d: je 0x1001b0de3
0x1001b0c23: mov eax, dword ptr [r13 + 0x50]
0x1001b0c27: cmp eax, dword ptr [rbx + 0xe0]
0x1001b0c2d: jne 0x1001b0de3
0x1001b0c33: mov rsi, qword ptr [r14 + 0x298]
0x1001b0c3a: lea rdi, [rsp + 0x160]
0x1001b0c42: xor ebx, ebx
0x1001b0c44: xor edx, edx
0x1001b0c46: call 0x1001e2ac0 ; 0x1001e2ac0
0x1001b0c4b: mov rax, qword ptr [rsp + 0x160]
0x1001b0c53: mov r12, r14
0x1001b0c56: test rax, rax
0x1001b0c59: je 0x1001b0c5f
0x1001b0c5b: mov rbx, qword ptr [rax + 0x10]
0x1001b0c5f: mov qword ptr [rsp + 0x90], rbx
0x1001b0c67: call 0x1001ddff0 ; 0x1001ddff0
0x1001b0c6c: mov r14, rax
0x1001b0c6f: mov qword ptr [rsp + 0x320], 0
0x1001b0c7b: call 0x10073aa80 ; 0x10073aa80
0x1001b0c80: mov rbx, qword ptr [rax]
0x1001b0c83: lea rsi, [rsp + 0x320]
0x1001b0c8b: lea rdx, [rsp + 0x90]
0x1001b0c93: mov rdi, rax
0x1001b0c96: mov rcx, r14
0x1001b0c99: call qword ptr [rbx + 0x40]
0x1001b0c9c: mov rsi, qword ptr [rsp + 0x320]
0x1001b0ca4: mov rax, qword ptr [rsp + 0x160]
0x1001b0cac: test rax, rax
0x1001b0caf: mov r14, r12
0x1001b0cb2: je 0x1001b0d0d
0x1001b0cb4: mov rcx, qword ptr [rsp + 0x168]
0x1001b0cbc: mov rdx, qword ptr [rsp + 0x170]
0x1001b0cc4: test rdx, rdx
0x1001b0cc7: lea rdx, [rdx + 8]
0x1001b0ccb: cmove rdx, rax
0x1001b0ccf: mov qword ptr [rdx], rcx
0x1001b0cd2: mov rcx, qword ptr [rsp + 0x168]
0x1001b0cda: mov rdx, qword ptr [rsp + 0x170]
0x1001b0ce2: add rax, 8
0x1001b0ce6: test rcx, rcx
0x1001b0ce9: lea rcx, [rcx + 0x10]
0x1001b0ced: cmove rcx, rax
0x1001b0cf1: mov qword ptr [rcx], rdx
0x1001b0cf4: vxorps xmm0, xmm0, xmm0
0x1001b0cf8: vmovaps xmmword ptr [rsp + 0x160], xmm0
0x1001b0d01: mov qword ptr [rsp + 0x170], 0
0x1001b0d0d: test rsi, rsi
0x1001b0d10: mov rbx, qword ptr [rsp + 0x28]
0x1001b0d15: je 0x1001b0de3
0x1001b0d1b: cmp byte ptr [r13 + 0x61], 0
0x1001b0d20: je 0x1001b0de3
0x1001b0d26: mov rax, qword ptr [r13 + 0x70]
0x1001b0d2a: test rax, rax
0x1001b0d2d: je 0x1001b0de3
0x1001b0d33: cmp dword ptr [rax + 0x10], 1
0x1001b0d37: jne 0x1001b0de3
0x1001b0d3d: mov qword ptr [rsp + 0x30], rsi
0x1001b0d42: mov rax, qword ptr [rax + 8]
0x1001b0d46: mov rax, qword ptr [rax]
0x1001b0d49: mov qword ptr [rsp + 0x320], rax
0x1001b0d51: call 0x1007abc10 ; 0x1007abc10
0x1001b0d56: mov qword ptr [rsp + 0x160], 0
0x1001b0d62: mov rdi, qword ptr [rip + 0x1c2a097] ; 0x101ddae00
0x1001b0d69: mov r8, qword ptr [rdi]
0x1001b0d6c: lea rsi, [rsp + 0x160]
0x1001b0d74: lea rdx, [rsp + 0x320]
0x1001b0d7c: mov rcx, rax
0x1001b0d7f: call qword ptr [r8 + 0x40]
0x1001b0d83: mov rax, qword ptr [rsp + 0x160]
0x1001b0d8b: test rax, rax
0x1001b0d8e: je 0x1001b1259
0x1001b0d94: mov rcx, qword ptr [rax + 0x70]
0x1001b0d98: test rcx, rcx
0x1001b0d9b: je 0x1001b1065
0x1001b0da1: mov rdx, qword ptr [r13 + 0x70]
0x1001b0da5: cmp dword ptr [rdx + 0x10], 1
0x1001b0da9: jne 0x1001b1065
0x1001b0daf: cmp byte ptr [rax + 0x98], 0
0x1001b0db6: je 0x1001b1000
0x1001b0dbc: mov edx, 0xb6
0x1001b0dc1: add rdx, qword ptr [rax + 0x110]
0x1001b0dc8: cmp byte ptr [rdx], 0
0x1001b0dcb: jne 0x1001b1009
0x1001b0dd1: jmp 0x1001b1065 ; 0x1001b1065
0x1001b0dd6: lea rax, [r13 + 0x56]
0x1001b0dda: cmp byte ptr [rax], 0
0x1001b0ddd: jne 0x1001b0c23
0x1001b0de3: cmp byte ptr [r13 + 0x56], 0
0x1001b0de8: je 0x1001afc8b
0x1001b0dee: mov eax, dword ptr [r13 + 0x50]
0x1001b0df2: cmp eax, dword ptr [rbx + 0xe0]
0x1001b0df8: jne 0x1001b0e22
0x1001b0dfa: test r15b, r15b
0x1001b0dfd: jne 0x1001afc8b
0x1001b0e03: mov eax, dword ptr [rip + 0xb73193] ; 0x100d23f9c
0x1001b0e09: mov dword ptr [rsp + 0x58], eax
0x1001b0e0d: mov rdx, qword ptr [r14 + 0x178]
0x1001b0e14: mov rcx, qword ptr [r14 + 0x5c8]
0x1001b0e1b: lea rsi, [rsp + 0x58]
0x1001b0e20: jmp 0x1001b0e5d ; 0x1001b0e5d
0x1001b0e22: mov rdi, qword ptr [r14 + 0x280]
0x1001b0e29: mov dword ptr [rsp + 0x50], eax
0x1001b0e2d: lea rsi, [rsp + 0x50]
0x1001b0e32: call 0x100101e20 ; 0x100101e20
0x1001b0e37: test rax, rax
0x1001b0e3a: jne 0x1001afc8b
0x1001b0e40: mov eax, dword ptr [rip + 0xb73156] ; 0x100d23f9c
0x1001b0e46: mov dword ptr [rsp + 0x48], eax
0x1001b0e4a: mov rdx, qword ptr [r14 + 0x178]
0x1001b0e51: mov rcx, qword ptr [r14 + 0x5c8]
0x1001b0e58: lea rsi, [rsp + 0x48]
0x1001b0e5d: mov r8d, 1
0x1001b0e63: xor r9d, r9d
0x1001b0e66: mov rdi, r13
0x1001b0e69: call 0x1001ae070 ; 0x1001ae070
0x1001b0e6e: jmp 0x1001afc8b ; 0x1001afc8b
0x1001b0e73: test r12b, r12b
0x1001b0e76: je 0x1001b0fd1
0x1001b0e7c: vmovss xmm0, dword ptr [r13 + 0xd4]
0x1001b0e85: vxorps xmm1, xmm1, xmm1
0x1001b0e89: vucomiss xmm1, xmm0
0x1001b0e8d: jae 0x1001b0eb6
0x1001b0e8f: mov rax, qword ptr [r14 + 0x160]
0x1001b0e96: lea rcx, [rip + 0x1e4a233] ; 0x101ffb0d0
0x1001b0e9d: cmp byte ptr [rcx], 0
0x1001b0ea0: je 0x1001b0f3f
0x1001b0ea6: lea rcx, [rip + 0xb07693] ; 0x100cb8540
0x1001b0ead: vmovss xmm1, dword ptr [rcx]
0x1001b0eb1: jmp 0x1001b0f47 ; 0x1001b0f47
0x1001b0eb6: cmp byte ptr [r13 + 0xa0], 0
0x1001b0ebe: je 0x1001b0f24
0x1001b0ec0: mov rdi, qword ptr [r13 + 0x100]
0x1001b0ec7: test rdi, rdi
0x1001b0eca: je 0x1001b0f24
0x1001b0ecc: mov rbx, qword ptr [r13 + 0x108]
0x1001b0ed3: test rbx, rbx
0x1001b0ed6: je 0x1001b0f24
0x1001b0ed8: mov rax, qword ptr [rdi]
0x1001b0edb: call qword ptr [rax]
0x1001b0edd: cmp rbx, rax
0x1001b0ee0: jne 0x1001b0f24
0x1001b0ee2: mov rdi, qword ptr [r13 + 0x100]
0x1001b0ee9: mov rax, qword ptr [rdi]
0x1001b0eec: call qword ptr [rax + 0x10]
0x1001b0eef: test al, al
0x1001b0ef1: je 0x1001b0f24
0x1001b0ef3: mov rdi, qword ptr [r13 + 0x100]
0x1001b0efa: test rdi, rdi
0x1001b0efd: je 0x1001b0f24
0x1001b0eff: mov rbx, qword ptr [r13 + 0x108]
0x1001b0f06: test rbx, rbx
0x1001b0f09: je 0x1001b0f24
0x1001b0f0b: mov rax, qword ptr [rdi]
0x1001b0f0e: call qword ptr [rax]
0x1001b0f10: cmp rbx, rax
0x1001b0f13: jne 0x1001b0f24
0x1001b0f15: mov rdi, qword ptr [r13 + 0x100]
0x1001b0f1c: mov rax, qword ptr [rdi]
0x1001b0f1f: xor esi, esi
0x1001b0f21: call qword ptr [rax + 0x30]
0x1001b0f24: mov byte ptr [r13 + 0xa0], 0
0x1001b0f2c: cmp byte ptr [r13 + 0xca], 0
0x1001b0f34: jne 0x1001af6a6
0x1001b0f3a: jmp 0x1001afa0b ; 0x1001afa0b
0x1001b0f3f: vmovss xmm1, dword ptr [rip + 0x8f4179] ; 0x100aa50c0
0x1001b0f47: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1001b0f4c: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1001b0f51: vmovss xmm2, dword ptr [rip + 0x8f5b43] ; 0x100aa6a9c
0x1001b0f59: vmaxss xmm1, xmm2, xmm1
0x1001b0f5d: vmovss xmm2, dword ptr [rip + 0x8f5b3b] ; 0x100aa6aa0
0x1001b0f65: vminss xmm1, xmm2, xmm1
0x1001b0f69: vsubss xmm0, xmm0, xmm1
0x1001b0f6d: vmovss dword ptr [r13 + 0xd4], xmm0
0x1001b0f76: cmp byte ptr [r13 + 0xca], 0
0x1001b0f7e: jne 0x1001af6a6
0x1001b0f84: jmp 0x1001afa0b ; 0x1001afa0b
0x1001b0f89: vmovss xmm1, dword ptr [rip + 0x8f412f] ; 0x100aa50c0
0x1001b0f91: vmulss xmm1, xmm1, dword ptr [rcx + 0x20]
0x1001b0f96: vmulss xmm1, xmm1, dword ptr [rcx + 0x14]
0x1001b0f9b: vmovss xmm2, dword ptr [rip + 0x8f5af9] ; 0x100aa6a9c
0x1001b0fa3: vmaxss xmm1, xmm2, xmm1
0x1001b0fa7: vmovss xmm2, dword ptr [rip + 0x8f5af1] ; 0x100aa6aa0
0x1001b0faf: vminss xmm1, xmm2, xmm1
0x1001b0fb3: vaddss xmm0, xmm0, xmm1
0x1001b0fb7: vmovss dword ptr [rax], xmm0
0x1001b0fbb: mov r15b, 1
0x1001b0fbe: vucomiss xmm0, dword ptr [rip + 0x8f5ae6] ; 0x100aa6aac
0x1001b0fc6: ja 0x1001b06c4
0x1001b0fcc: jmp 0x1001b06ca ; 0x1001b06ca
0x1001b0fd1: cmp byte ptr [r13 + 0x55], 0
0x1001b0fd6: jne 0x1001af68a
0x1001b0fdc: add rax, 0xb6
0x1001b0fe2: cmp byte ptr [r13 + 0x98], 0
0x1001b0fea: lea rcx, [r13 + 0x56]
0x1001b0fee: cmove rax, rcx
0x1001b0ff2: cmp byte ptr [rax], 0
0x1001b0ff5: jne 0x1001af68a
0x1001b0ffb: jmp 0x1001af4ba ; 0x1001af4ba
0x1001b1000: lea rdx, [rax + 0x56]
0x1001b1004: cmp byte ptr [rdx], 0
0x1001b1007: je 0x1001b1065
0x1001b1009: cmp dword ptr [rcx + 0x10], 0
0x1001b100d: je 0x1001b1278
0x1001b1013: mov rax, qword ptr [rcx + 8]
0x1001b1017: mov rax, qword ptr [rax]
0x1001b101a: mov qword ptr [rsp + 0x320], rax
0x1001b1022: call 0x1007abc10 ; 0x1007abc10
0x1001b1027: mov qword ptr [rsp + 0x160], 0
0x1001b1033: mov rdi, qword ptr [rip + 0x1c29dc6] ; 0x101ddae00
0x1001b103a: mov r8, qword ptr [rdi]
0x1001b103d: lea rsi, [rsp + 0x160]
0x1001b1045: lea rdx, [rsp + 0x320]
0x1001b104d: mov rcx, rax
0x1001b1050: call qword ptr [r8 + 0x40]
0x1001b1054: mov rax, qword ptr [rsp + 0x160]
0x1001b105c: test rax, rax
0x1001b105f: je 0x1001b1259
0x1001b1065: lea rcx, [rip + 0x9107cc] ; 0x100ac1838
0x1001b106c: vmovss xmm0, dword ptr [rcx]
0x1001b1070: vmulss xmm0, xmm0, dword ptr [rip + 0x8f3540] ; 0x100aa45b8
0x1001b1078: vpermilps xmm0, xmm0, 0xc0
0x1001b107e: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8f701a] ; 0x100aa80a0
0x1001b1086: vaddps xmm0, xmm0, xmmword ptr [rax + 0x40]
0x1001b108b: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1001b1091: mov rax, qword ptr [rbx + 0x20]
0x1001b1095: mov rsi, qword ptr [rax + 0x298]
0x1001b109c: lea rdi, [rsp + 0x160]
0x1001b10a4: call 0x1007f26b0 ; 0x1007f26b0
0x1001b10a9: vmovaps xmm0, xmmword ptr [rsp + 0x10]
0x1001b10af: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x160]
0x1001b10b8: vmulps xmm1, xmm0, xmm0
0x1001b10bc: vmovshdup xmm2, xmm1
0x1001b10c0: vaddss xmm2, xmm1, xmm2
0x1001b10c4: vpermilpd xmm1, xmm1, 1
0x1001b10ca: vaddss xmm1, xmm1, xmm2
0x1001b10ce: vsqrtss xmm1, xmm1, xmm1
0x1001b10d2: vucomiss xmm1, dword ptr [rip + 0x8f67ea] ; 0x100aa78c4
0x1001b10da: jbe 0x1001b10e6
0x1001b10dc: vpermilps xmm1, xmm1, 0xc0
0x1001b10e2: vdivps xmm0, xmm0, xmm1
0x1001b10e6: vmovaps xmmword ptr [rsp + 0x320], xmm0
0x1001b10ef: mov rax, qword ptr [rbx + 0x20]
0x1001b10f3: mov rsi, qword ptr [rax + 0x298]
0x1001b10fa: lea rdi, [rsp + 0xe0]
0x1001b1102: call 0x1007f26b0 ; 0x1007f26b0
0x1001b1107: vmovaps xmm0, xmmword ptr [rsp + 0xe0]
0x1001b1110: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x10]
0x1001b1116: vmulps xmm0, xmm0, xmm0
0x1001b111a: vmovshdup xmm1, xmm0
0x1001b111e: vaddss xmm1, xmm0, xmm1
0x1001b1122: vpermilpd xmm0, xmm0, 1
0x1001b1128: vaddss xmm0, xmm0, xmm1
0x1001b112c: vsqrtss xmm0, xmm0, xmm0
0x1001b1130: vmovss dword ptr [rsp + 0x6c], xmm0
0x1001b1136: vmovapd xmm0, xmmword ptr [rsp + 0x320]
0x1001b113f: vmovapd xmmword ptr [rsp + 0x70], xmm0
0x1001b1145: vpermilpd xmm1, xmm0, 1
0x1001b114b: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x1001b1150: vmovss dword ptr [rsp + 0x10], xmm0
0x1001b1156: vmovaps xmm1, xmmword ptr [rsp + 0x70]
0x1001b115c: vmovshdup xmm0, xmm1
0x1001b1160: vmulps xmm1, xmm1, xmm1
0x1001b1164: vmovshdup xmm2, xmm1
0x1001b1168: vaddss xmm2, xmm1, xmm2
0x1001b116c: vpermilpd xmm1, xmm1, 1
0x1001b1172: vaddss xmm1, xmm1, xmm2
0x1001b1176: vsqrtss xmm1, xmm1, xmm1
0x1001b117a: vmovss xmm2, dword ptr [rip + 0x8f591a] ; 0x100aa6a9c
0x1001b1182: vmaxss xmm3, xmm2, xmm1
0x1001b1186: vcmpunordss xmm1, xmm1, xmm1
0x1001b118b: vandnps xmm3, xmm1, xmm3
0x1001b118f: vandps xmm1, xmm1, xmm2
0x1001b1193: vorps xmm1, xmm3, xmm1
0x1001b1197: vdivss xmm0, xmm0, xmm1
0x1001b119b: call 0x100aa2588 ; 0x100aa2588 _asinf
0x1001b11a0: vmovss dword ptr [rsp + 0x70], xmm0
0x1001b11a6: mov r12, qword ptr [r14 + 0x138]
0x1001b11ad: mov rax, qword ptr [rbx + 0x20]
0x1001b11b1: mov rsi, qword ptr [rax + 0x298]
0x1001b11b8: lea rbx, [rsp + 0x90]
0x1001b11c0: mov rdi, rbx
0x1001b11c3: call 0x1007f26b0 ; 0x1007f26b0
0x1001b11c8: lea rdx, [rsp + 0x320]
0x1001b11d0: lea r8, [rsp + 0x160]
0x1001b11d8: xor ecx, ecx
0x1001b11da: mov rdi, r12
0x1001b11dd: mov rsi, rbx
0x1001b11e0: vmovss xmm0, dword ptr [rsp + 0x6c]
0x1001b11e6: call 0x100776a90 ; 0x100776a90
0x1001b11eb: test al, al
0x1001b11ed: jne 0x1001b11fc
0x1001b11ef: mov rbx, qword ptr [rsp + 0x30]
0x1001b11f4: vmovss xmm0, dword ptr [rsp + 0x10]
0x1001b11fa: jmp 0x1001b120f ; 0x1001b120f
0x1001b11fc: vmovss xmm0, dword ptr [rsp + 0x10]
0x1001b1202: vaddss xmm0, xmm0, dword ptr [rip + 0x8f742a] ; 0x100aa8634
0x1001b120a: mov rbx, qword ptr [rsp + 0x30]
0x1001b120f: mov rax, qword ptr [rbx]
0x1001b1212: vmovss xmm1, dword ptr [rip + 0x8f339e] ; 0x100aa45b8
0x1001b121a: xor esi, esi
0x1001b121c: xor edx, edx
0x1001b121e: mov rdi, rbx
0x1001b1221: call qword ptr [rax + 0x20]
0x1001b1224: mov rax, qword ptr [rbx]
0x1001b1227: xor esi, esi
0x1001b1229: xor edx, edx
0x1001b122b: mov rdi, rbx
0x1001b122e: vmovss xmm0, dword ptr [rsp + 0x70]
0x1001b1234: vmovss xmm1, dword ptr [rip + 0x8f337c] ; 0x100aa45b8
0x1001b123c: call qword ptr [rax + 0x28]
0x1001b123f: mov rbx, qword ptr [rsp + 0x28]
0x1001b1244: cmp byte ptr [r13 + 0x56], 0
0x1001b1249: jne 0x1001b0dee
0x1001b124f: jmp 0x1001afc8b ; 0x1001afc8b
0x1001b1254: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001b1259: lea rdi, [rip + 0x9b0898] ; 0x100b61af8 ret
0x1001b1260: lea rsi, [rip + 0x9b06fc] ; 0x100b61963 ./Clump.h
0x1001b1267: mov edx, 0x47
0x1001b126c: mov ecx, 3
0x1001b1271: call 0x1007e5f70 ; 0x1007e5f70
0x1001b1276: ud2 
0x1001b1278: lea rdi, [rip + 0x9b06d9] ; 0x100b61958 idx < size
0x1001b127f: lea rsi, [rip + 0x9b06dd] ; 0x100b61963 ./Clump.h
0x1001b1286: mov edx, 0x36
0x1001b128b: mov ecx, 3
0x1001b1290: call 0x1007e5f70 ; 0x1007e5f70
0x1001b1295: ud2 
0x1001b1297: mov rcx, qword ptr [rsp + 0x160]
0x1001b129f: test rcx, rcx
0x1001b12a2: je 0x1001b12fd
0x1001b12a4: mov rdx, qword ptr [rsp + 0x168]
0x1001b12ac: mov rsi, qword ptr [rsp + 0x170]
0x1001b12b4: test rsi, rsi
0x1001b12b7: lea rsi, [rsi + 8]
0x1001b12bb: cmove rsi, rcx
0x1001b12bf: mov qword ptr [rsi], rdx
0x1001b12c2: mov rdx, qword ptr [rsp + 0x168]
0x1001b12ca: mov rsi, qword ptr [rsp + 0x170]
0x1001b12d2: add rcx, 8
0x1001b12d6: test rdx, rdx
0x1001b12d9: lea rdx, [rdx + 0x10]
0x1001b12dd: cmove rdx, rcx
0x1001b12e1: mov qword ptr [rdx], rsi
0x1001b12e4: vxorps xmm0, xmm0, xmm0
0x1001b12e8: vmovaps xmmword ptr [rsp + 0x160], xmm0
0x1001b12f1: mov qword ptr [rsp + 0x170], 0
0x1001b12fd: mov rdi, rax
0x1001b1300: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001b1305: nop word ptr cs:[rax + rax]
