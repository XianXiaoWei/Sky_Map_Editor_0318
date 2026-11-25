0x100337540: push rbp
0x100337541: mov rbp, rsp
0x100337544: push r15
0x100337546: push r14
0x100337548: push r13
0x10033754a: push r12
0x10033754c: push rbx
0x10033754d: sub rsp, 0x198
0x100337554: mov rbx, rsi
0x100337557: mov r14, rdi
0x10033755a: mov rdi, qword ptr [r14 + 0x110]
0x100337561: movzx esi, byte ptr [r14 + 0xc0]
0x100337569: call 0x1004636d0 ; 0x1004636d0
0x10033756e: cmp byte ptr [r14 + 0xc0], 0
0x100337576: je 0x10033846d
0x10033757c: mov rax, qword ptr [rbx + 0x160]
0x100337583: vmovss xmm0, dword ptr [rax + 0x14]
0x100337588: lea rcx, [rip + 0x1cc3b41] ; 0x101ffb0d0
0x10033758f: cmp byte ptr [rcx], 0
0x100337592: je 0x1003375a1
0x100337594: lea rcx, [rip + 0x980fa5] ; 0x100cb8540
0x10033759b: vmovss xmm1, dword ptr [rcx]
0x10033759f: jmp 0x1003375a9 ; 0x1003375a9
0x1003375a1: vmovss xmm1, dword ptr [rip + 0x76db17] ; 0x100aa50c0
0x1003375a9: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1003375ae: vmulss xmm0, xmm0, xmm1
0x1003375b2: vmovss xmm1, dword ptr [rip + 0x76f4e2] ; 0x100aa6a9c
0x1003375ba: vmaxss xmm0, xmm1, xmm0
0x1003375be: vmovss xmm1, dword ptr [rip + 0x76f4da] ; 0x100aa6aa0
0x1003375c6: vminss xmm0, xmm1, xmm0
0x1003375ca: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1003375cf: lea rdi, [rbp - 0x170]
0x1003375d6: mov rsi, r14
0x1003375d9: mov rdx, rbx
0x1003375dc: call 0x100335a40 ; 0x100335a40
0x1003375e1: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x1003375e6: vpermilps xmm0, xmm3, 0xc0
0x1003375ec: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1003375f1: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x170]
0x1003375f9: vaddps xmm0, xmm0, xmmword ptr [r14 + 0x50]
0x1003375ff: vmovaps xmmword ptr [r14 + 0x50], xmm0
0x100337605: vmulps xmm1, xmm0, xmm0
0x100337609: vmovshdup xmm2, xmm1
0x10033760d: vaddss xmm2, xmm1, xmm2
0x100337611: vpermilpd xmm1, xmm1, 1
0x100337617: vaddss xmm1, xmm1, xmm2
0x10033761b: vsqrtss xmm1, xmm1, xmm1
0x10033761f: vucomiss xmm1, dword ptr [rip + 0x76f475] ; 0x100aa6a9c
0x100337627: jbe 0x10033767e
0x100337629: vmovshdup xmm2, xmm0
0x10033762d: vdivss xmm1, xmm2, xmm1
0x100337631: lea rax, [r14 + 0x78]
0x100337635: mov qword ptr [rbp - 0x38], rax
0x100337639: mov rax, qword ptr [r14 + 0x78]
0x10033763d: vmulss xmm1, xmm1, dword ptr [rax + 0x1c]
0x100337642: vmulss xmm1, xmm3, xmm1
0x100337646: vmovss xmm2, dword ptr [rip + 0x76da72] ; 0x100aa50c0
0x10033764e: vsubss xmm1, xmm2, xmm1
0x100337652: vpermilps xmm1, xmm1, 0xc0
0x100337658: vmulps xmm0, xmm0, xmm1
0x10033765c: vmovaps xmmword ptr [r14 + 0x50], xmm0
0x100337662: vmulps xmm1, xmm0, xmm0
0x100337666: vmovshdup xmm2, xmm1
0x10033766a: vaddss xmm2, xmm1, xmm2
0x10033766e: vpermilpd xmm1, xmm1, 1
0x100337674: vaddss xmm1, xmm1, xmm2
0x100337678: vsqrtss xmm1, xmm1, xmm1
0x10033767c: jmp 0x10033768a ; 0x10033768a
0x10033767e: lea rax, [r14 + 0x78]
0x100337682: mov qword ptr [rbp - 0x38], rax
0x100337686: mov rax, qword ptr [r14 + 0x78]
0x10033768a: lea r13, [r14 + 0x50]
0x10033768e: vmovss xmm2, dword ptr [rax + 0x1c]
0x100337693: vaddss xmm2, xmm2, dword ptr [rip + 0x76da25] ; 0x100aa50c0
0x10033769b: vmulss xmm2, xmm2, dword ptr [rax + 0x14]
0x1003376a0: vucomiss xmm1, xmm2
0x1003376a4: jbe 0x1003376ca
0x1003376a6: vpermilps xmm1, xmm1, 0xc0
0x1003376ac: vdivps xmm0, xmm0, xmm1
0x1003376b0: vmovaps xmmword ptr [rbp - 0x120], xmm2
0x1003376b8: vpermilps xmm1, xmm2, 0xc0
0x1003376be: vmulps xmm0, xmm1, xmm0
0x1003376c2: vmovaps xmmword ptr [r13], xmm0
0x1003376c8: jmp 0x1003376d2 ; 0x1003376d2
0x1003376ca: vmovaps xmmword ptr [rbp - 0x120], xmm1
0x1003376d2: mov qword ptr [rbp - 0x88], r14
0x1003376d9: lea rax, [r14 + 0x10]
0x1003376dd: mov qword ptr [rbp - 0x30], rax
0x1003376e1: mov byte ptr [rbp - 0x110], 1
0x1003376e8: vmulss xmm0, xmm3, dword ptr [rip + 0x7701cc] ; 0x100aa78bc
0x1003376f0: vmovss dword ptr [rbp - 0x70], xmm0
0x1003376f5: mov r15d, 1
0x1003376fb: lea r12, [rbp - 0xd0]
0x100337702: lea r14, [rbp - 0x110]
0x100337709: nop dword ptr [rax]
0x100337710: mov rcx, qword ptr [rbx + 0x138]
0x100337717: mov rdi, r12
0x10033771a: mov rsi, qword ptr [rbp - 0x30]
0x10033771e: mov rdx, r13
0x100337721: vmovss xmm0, dword ptr [rbp - 0x70]
0x100337726: mov r8, r14
0x100337729: call 0x10062d590 ; 0x10062d590
0x10033772e: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100337736: vmovaps xmmword ptr [r13], xmm2
0x10033773c: cmp r15d, 2
0x100337740: ja 0x100337750
0x100337742: movzx eax, byte ptr [rbp - 0x110]
0x100337749: inc r15d
0x10033774c: test al, al
0x10033774e: jne 0x100337710
0x100337750: vmulps xmm0, xmm2, xmm2
0x100337754: vmovshdup xmm1, xmm0
0x100337758: vaddss xmm1, xmm0, xmm1
0x10033775c: vpermilpd xmm0, xmm0, 1
0x100337762: vaddss xmm0, xmm0, xmm1
0x100337766: vsqrtss xmm0, xmm0, xmm0
0x10033776a: vucomiss xmm0, dword ptr [rip + 0x770152] ; 0x100aa78c4
0x100337772: vmovaps xmm1, xmm2
0x100337776: jbe 0x100337782
0x100337778: vpermilps xmm0, xmm0, 0xc0
0x10033777e: vdivps xmm1, xmm2, xmm0
0x100337782: vmovaps xmmword ptr [rbp - 0x60], xmm2
0x100337787: vmovaps xmmword ptr [rbp - 0x70], xmm1
0x10033778c: vmulps xmm0, xmm1, xmmword ptr [rip + 0x77090c] ; 0x100aa80a0
0x100337794: vmovshdup xmm1, xmm0
0x100337798: vaddss xmm1, xmm0, xmm1
0x10033779c: vpermilpd xmm0, xmm0, 1
0x1003377a2: vaddss xmm0, xmm0, xmm1
0x1003377a6: vmovss xmm1, dword ptr [rip + 0x76d916] ; 0x100aa50c4
0x1003377ae: vmaxss xmm0, xmm1, xmm0
0x1003377b2: vmovss xmm1, dword ptr [rip + 0x76d906] ; 0x100aa50c0
0x1003377ba: vminss xmm0, xmm1, xmm0
0x1003377be: call 0x100aa2576 ; 0x100aa2576 _acosf
0x1003377c3: vucomiss xmm0, dword ptr [rip + 0x776189] ; 0x100aad954
0x1003377cb: mov r15, rbx
0x1003377ce: mov r12, qword ptr [rbp - 0x88]
0x1003377d5: jbe 0x100337901
0x1003377db: vaddss xmm1, xmm0, dword ptr [rip + 0x76d8dd] ; 0x100aa50c0
0x1003377e3: vandps xmm2, xmm1, xmmword ptr [rip + 0x770125] ; 0x100aa7910
0x1003377eb: vmovss xmm1, dword ptr [rip + 0x7700d1] ; 0x100aa78c4
0x1003377f3: vucomiss xmm1, xmm2
0x1003377f7: vmovss xmm2, dword ptr [rip + 0x76d8c1] ; 0x100aa50c0
0x1003377ff: jae 0x100337809
0x100337801: vmovaps xmm2, xmmword ptr [rip + 0x770897] ; 0x100aa80a0
0x100337809: vaddss xmm0, xmm0, dword ptr [rip + 0x77614b] ; 0x100aad95c
0x100337811: vmovaps xmm4, xmmword ptr [rbp - 0x70]
0x100337816: vpermilps xmm3, xmm4, 0xd2
0x10033781c: vmulps xmm3, xmm3, xmm2
0x100337820: vpermilps xmm2, xmm2, 0xd2
0x100337826: vmulps xmm2, xmm4, xmm2
0x10033782a: vsubps xmm2, xmm3, xmm2
0x10033782e: vpermilps xmm4, xmm2, 0xd2
0x100337834: vmulps xmm2, xmm2, xmm2
0x100337838: vpermilpd xmm3, xmm2, 1
0x10033783e: vaddss xmm3, xmm3, xmm2
0x100337842: vmovshdup xmm2, xmm2
0x100337846: vaddss xmm2, xmm2, xmm3
0x10033784a: vsqrtss xmm2, xmm2, xmm2
0x10033784e: vucomiss xmm2, xmm1
0x100337852: jbe 0x10033785e
0x100337854: vpermilps xmm1, xmm2, 0xc0
0x10033785a: vdivps xmm4, xmm4, xmm1
0x10033785e: vmovaps xmmword ptr [rbp - 0x60], xmm4
0x100337863: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100337868: vmovshdup xmm11, xmm0
0x10033786c: vmovaps xmm6, xmmword ptr [rbp - 0x60]
0x100337871: vmovshdup xmm4, xmm6
0x100337875: vpermilpd xmm14, xmm6, 1
0x10033787b: vmulss xmm3, xmm6, xmm4
0x10033787f: vmulss xmm8, xmm4, xmm14
0x100337884: vmulss xmm9, xmm14, xmm6
0x100337888: vmovss xmm1, dword ptr [rip + 0x76d830] ; 0x100aa50c0
0x100337890: vsubss xmm2, xmm1, xmm11
0x100337895: vmulss xmm5, xmm6, xmm6
0x100337899: vmulss xmm5, xmm5, xmm2
0x10033789d: vaddss xmm10, xmm11, xmm5
0x1003378a1: vmulss xmm3, xmm3, xmm2
0x1003378a5: vmulss xmm7, xmm0, xmm14
0x1003378aa: vaddss xmm12, xmm7, xmm3
0x1003378ae: vmulss xmm13, xmm9, xmm2
0x1003378b2: vmulss xmm5, xmm0, xmm4
0x1003378b6: vsubss xmm9, xmm13, xmm5
0x1003378ba: vinsertps xmm1, xmm10, xmm12, 0x10
0x1003378c0: vinsertps xmm9, xmm1, xmm9, 0x20
0x1003378c6: vsubss xmm1, xmm3, xmm7
0x1003378ca: vmulss xmm3, xmm4, xmm4
0x1003378ce: vmulss xmm3, xmm3, xmm2
0x1003378d2: vaddss xmm3, xmm11, xmm3
0x1003378d6: vmulss xmm7, xmm8, xmm2
0x1003378da: vmulss xmm0, xmm0, xmm6
0x1003378de: vaddss xmm4, xmm0, xmm7
0x1003378e2: vinsertps xmm1, xmm1, xmm3, 0x10
0x1003378e8: vinsertps xmm1, xmm1, xmm4, 0x20
0x1003378ee: vaddss xmm4, xmm5, xmm13
0x1003378f3: vsubss xmm5, xmm7, xmm0
0x1003378f7: vmulss xmm6, xmm14, xmm14
0x1003378fc: jmp 0x100337a33 ; 0x100337a33
0x100337901: vmovss xmm2, dword ptr [rip + 0x77604f] ; 0x100aad958
0x100337909: vucomiss xmm2, xmm0
0x10033790d: vmovaps xmm3, xmmword ptr [rbp - 0x60]
0x100337912: jbe 0x100337a87
0x100337918: vaddss xmm1, xmm0, dword ptr [rip + 0x76d7a4] ; 0x100aa50c4
0x100337920: vandps xmm3, xmm1, xmmword ptr [rip + 0x76ffe8] ; 0x100aa7910
0x100337928: vmovss xmm1, dword ptr [rip + 0x76ff94] ; 0x100aa78c4
0x100337930: vucomiss xmm1, xmm3
0x100337934: vmovss xmm3, dword ptr [rip + 0x76d784] ; 0x100aa50c0
0x10033793c: jae 0x100337946
0x10033793e: vmovaps xmm3, xmmword ptr [rip + 0x77075a] ; 0x100aa80a0
0x100337946: vsubss xmm0, xmm2, xmm0
0x10033794a: vpermilps xmm2, xmm3, 0xd2
0x100337950: vmovaps xmm4, xmmword ptr [rbp - 0x70]
0x100337955: vmulps xmm2, xmm4, xmm2
0x100337959: vpermilps xmm4, xmm4, 0xd2
0x10033795f: vmulps xmm3, xmm4, xmm3
0x100337963: vsubps xmm2, xmm2, xmm3
0x100337967: vpermilps xmm4, xmm2, 0xd2
0x10033796d: vmulps xmm2, xmm2, xmm2
0x100337971: vpermilpd xmm3, xmm2, 1
0x100337977: vaddss xmm3, xmm3, xmm2
0x10033797b: vmovshdup xmm2, xmm2
0x10033797f: vaddss xmm2, xmm2, xmm3
0x100337983: vsqrtss xmm2, xmm2, xmm2
0x100337987: vucomiss xmm2, xmm1
0x10033798b: jbe 0x100337997
0x10033798d: vpermilps xmm1, xmm2, 0xc0
0x100337993: vdivps xmm4, xmm4, xmm1
0x100337997: vmovaps xmmword ptr [rbp - 0x60], xmm4
0x10033799c: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x1003379a1: vmovshdup xmm11, xmm0
0x1003379a5: vmovaps xmm6, xmmword ptr [rbp - 0x60]
0x1003379aa: vmovshdup xmm1, xmm6
0x1003379ae: vpermilpd xmm3, xmm6, 1
0x1003379b4: vmulss xmm4, xmm6, xmm1
0x1003379b8: vmulss xmm8, xmm1, xmm3
0x1003379bc: vmulss xmm9, xmm3, xmm6
0x1003379c0: vmovss xmm2, dword ptr [rip + 0x76d6f8] ; 0x100aa50c0
0x1003379c8: vsubss xmm2, xmm2, xmm11
0x1003379cd: vmulss xmm7, xmm6, xmm6
0x1003379d1: vmulss xmm7, xmm7, xmm2
0x1003379d5: vaddss xmm10, xmm11, xmm7
0x1003379d9: vmulss xmm4, xmm4, xmm2
0x1003379dd: vmulss xmm5, xmm0, xmm3
0x1003379e1: vaddss xmm12, xmm5, xmm4
0x1003379e5: vmulss xmm13, xmm9, xmm2
0x1003379e9: vmulss xmm14, xmm0, xmm1
0x1003379ed: vsubss xmm9, xmm13, xmm14
0x1003379f2: vinsertps xmm7, xmm10, xmm12, 0x10
0x1003379f8: vinsertps xmm9, xmm7, xmm9, 0x20
0x1003379fe: vsubss xmm4, xmm4, xmm5
0x100337a02: vmulss xmm1, xmm1, xmm1
0x100337a06: vmulss xmm1, xmm1, xmm2
0x100337a0a: vaddss xmm1, xmm11, xmm1
0x100337a0e: vmulss xmm5, xmm8, xmm2
0x100337a12: vmulss xmm0, xmm0, xmm6
0x100337a16: vaddss xmm7, xmm0, xmm5
0x100337a1a: vinsertps xmm1, xmm4, xmm1, 0x10
0x100337a20: vinsertps xmm1, xmm1, xmm7, 0x20
0x100337a26: vaddss xmm4, xmm14, xmm13
0x100337a2b: vsubss xmm5, xmm5, xmm0
0x100337a2f: vmulss xmm6, xmm3, xmm3
0x100337a33: vmulss xmm0, xmm6, xmm2
0x100337a37: vaddss xmm0, xmm11, xmm0
0x100337a3b: vinsertps xmm2, xmm4, xmm5, 0x10
0x100337a41: vinsertps xmm0, xmm2, xmm0, 0x20
0x100337a47: vmovaps xmm4, xmmword ptr [rbp - 0x70]
0x100337a4c: vpermilps xmm2, xmm4, 0xc0
0x100337a52: vmulps xmm2, xmm2, xmm9
0x100337a57: vpermilps xmm3, xmm4, 0xd5
0x100337a5d: vmulps xmm1, xmm1, xmm3
0x100337a61: vaddps xmm1, xmm1, xmm2
0x100337a65: vpermilps xmm2, xmm4, 0xea
0x100337a6b: vmulps xmm0, xmm0, xmm2
0x100337a6f: vaddps xmm0, xmm0, xmm1
0x100337a73: vpermilps xmm1, xmmword ptr [rbp - 0x120], 0xc0
0x100337a7d: vmulps xmm3, xmm1, xmm0
0x100337a81: vmovaps xmmword ptr [r13], xmm3
0x100337a87: vmulps xmm0, xmm3, xmmword ptr [rbp - 0x80]
0x100337a8c: vaddps xmm0, xmm0, xmmword ptr [r12 + 0x10]
0x100337a93: vmovaps xmmword ptr [r12 + 0x10], xmm0
0x100337a9a: vmovaps xmm2, xmmword ptr [r12 + 0x30]
0x100337aa1: vmovaps xmm0, xmmword ptr [r12 + 0x40]
0x100337aa8: vxorps xmm0, xmm0, xmmword ptr [rip + 0x76fe50] ; 0x100aa7900
0x100337ab0: vmovaps xmmword ptr [rbp - 0x160], xmm0
0x100337ab8: vmulps xmm0, xmm3, xmm3
0x100337abc: vmovshdup xmm1, xmm0
0x100337ac0: vaddss xmm1, xmm0, xmm1
0x100337ac4: vpermilpd xmm0, xmm0, 1
0x100337aca: vaddss xmm0, xmm0, xmm1
0x100337ace: vsqrtss xmm0, xmm0, xmm0
0x100337ad2: vucomiss xmm0, dword ptr [rip + 0x76fdea] ; 0x100aa78c4
0x100337ada: vmovss xmm1, dword ptr [rip + 0x76d5de] ; 0x100aa50c0
0x100337ae2: vmovaps xmmword ptr [rbp - 0x70], xmm2
0x100337ae7: jbe 0x100337af3
0x100337ae9: vpermilps xmm0, xmm0, 0xc0
0x100337aef: vdivps xmm3, xmm3, xmm0
0x100337af3: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100337af8: vmovaps xmmword ptr [rbp - 0x150], xmm3
0x100337b00: vaddss xmm0, xmm0, xmm0
0x100337b04: mov rax, qword ptr [rbp - 0x38]
0x100337b08: mov rax, qword ptr [rax]
0x100337b0b: vmaxss xmm1, xmm1, dword ptr [rax + 0x10]
0x100337b10: vdivss xmm0, xmm0, xmm1
0x100337b14: vmovss dword ptr [rbp - 0x110], xmm0
0x100337b1c: lea rdi, [rbp - 0xd0]
0x100337b23: lea rsi, [rbp - 0x110]
0x100337b2a: lea rdx, [rbp - 0x160]
0x100337b31: lea rcx, [rbp - 0x150]
0x100337b38: call 0x100168830 ; 0x100168830
0x100337b3d: vmovaps xmm3, xmmword ptr [rbp - 0xd0]
0x100337b45: vmulps xmm0, xmm3, xmm3
0x100337b49: vmovshdup xmm1, xmm0
0x100337b4d: vaddss xmm1, xmm0, xmm1
0x100337b51: vpermilpd xmm0, xmm0, 1
0x100337b57: vaddss xmm0, xmm0, xmm1
0x100337b5b: vsqrtss xmm0, xmm0, xmm0
0x100337b5f: vucomiss xmm0, dword ptr [rip + 0x76fd5d] ; 0x100aa78c4
0x100337b67: jbe 0x100337b73
0x100337b69: vpermilps xmm0, xmm0, 0xc0
0x100337b6f: vdivps xmm3, xmm3, xmm0
0x100337b73: vmulps xmm0, xmm3, xmm3
0x100337b77: vmovshdup xmm1, xmm0
0x100337b7b: vaddss xmm1, xmm0, xmm1
0x100337b7f: vpermilpd xmm0, xmm0, 1
0x100337b85: vaddss xmm0, xmm0, xmm1
0x100337b89: vsqrtss xmm0, xmm0, xmm0
0x100337b8d: vandps xmm0, xmm0, xmmword ptr [rip + 0x76fd7b] ; 0x100aa7910
0x100337b95: vmovss xmm1, dword ptr [rip + 0x76fd27] ; 0x100aa78c4
0x100337b9d: vucomiss xmm1, xmm0
0x100337ba1: vmovss xmm2, dword ptr [rip + 0x76d517] ; 0x100aa50c0
0x100337ba9: jae 0x100337bb2
0x100337bab: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x100337bb0: jmp 0x100337bbf ; 0x100337bbf
0x100337bb2: vmovaps xmm0, xmmword ptr [rip + 0x770e76] ; 0x100aa8a30
0x100337bba: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100337bbf: lea rdi, [r12 + 0xd0]
0x100337bc7: vmovss xmm1, dword ptr [rip + 0x784b4d] ; 0x100abc71c
0x100337bcf: vmovss xmm3, dword ptr [rip + 0x777d59] ; 0x100aaf930
0x100337bd7: mov rsi, qword ptr [rbp - 0x30]
0x100337bdb: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x100337be0: call 0x100192550 ; 0x100192550
0x100337be5: vmovss xmm0, dword ptr [r12 + 0x100]
0x100337bef: vmulss xmm0, xmm0, dword ptr [rip + 0x770a09] ; 0x100aa8600
0x100337bf7: vdivss xmm0, xmm0, dword ptr [rip + 0x770a05] ; 0x100aa8604
0x100337bff: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100337c04: vmovshdup xmm1, xmm0
0x100337c08: vmovaps xmm12, xmmword ptr [rbp - 0x80]
0x100337c0d: vmovshdup xmm2, xmm12
0x100337c12: vpermilpd xmm3, xmm12, 1
0x100337c18: vmulss xmm4, xmm12, xmm2
0x100337c1c: vmulss xmm8, xmm3, xmm12
0x100337c21: vmovss xmm5, dword ptr [rip + 0x76d497] ; 0x100aa50c0
0x100337c29: vsubss xmm6, xmm5, xmm1
0x100337c2d: vmulss xmm7, xmm12, xmm12
0x100337c32: vmulss xmm7, xmm6, xmm7
0x100337c36: vaddss xmm9, xmm1, xmm7
0x100337c3a: vmulss xmm4, xmm6, xmm4
0x100337c3e: vmulss xmm5, xmm0, xmm3
0x100337c42: vaddss xmm10, xmm5, xmm4
0x100337c46: vmulss xmm8, xmm6, xmm8
0x100337c4b: vmulss xmm11, xmm0, xmm2
0x100337c4f: vinsertps xmm9, xmm9, xmm10, 0x10
0x100337c55: vsubss xmm7, xmm8, xmm11
0x100337c5a: vinsertps xmm7, xmm9, xmm7, 0x20
0x100337c60: vsubss xmm4, xmm4, xmm5
0x100337c64: vmulss xmm5, xmm2, xmm3
0x100337c68: vmulss xmm2, xmm2, xmm2
0x100337c6c: vmulss xmm2, xmm6, xmm2
0x100337c70: vaddss xmm2, xmm1, xmm2
0x100337c74: vmulss xmm5, xmm6, xmm5
0x100337c78: vmulss xmm0, xmm0, xmm12
0x100337c7d: vinsertps xmm2, xmm4, xmm2, 0x10
0x100337c83: vaddss xmm4, xmm0, xmm5
0x100337c87: vinsertps xmm2, xmm2, xmm4, 0x20
0x100337c8d: vaddss xmm4, xmm11, xmm8
0x100337c92: vsubss xmm0, xmm5, xmm0
0x100337c96: vmulss xmm3, xmm3, xmm3
0x100337c9a: vmulss xmm3, xmm6, xmm3
0x100337c9e: vaddss xmm1, xmm1, xmm3
0x100337ca2: vinsertps xmm0, xmm4, xmm0, 0x10
0x100337ca8: vinsertps xmm0, xmm0, xmm1, 0x20
0x100337cae: vxorps xmm1, xmm1, xmm1
0x100337cb2: vmulps xmm3, xmm7, xmm1
0x100337cb6: vaddps xmm2, xmm2, xmm3
0x100337cba: vmulps xmm0, xmm0, xmm1
0x100337cbe: vaddps xmm0, xmm0, xmm2
0x100337cc2: vmulps xmm1, xmm12, xmm0
0x100337cc6: vmovshdup xmm2, xmm1
0x100337cca: vaddss xmm2, xmm1, xmm2
0x100337cce: vpermilpd xmm1, xmm1, 1
0x100337cd4: vaddss xmm1, xmm1, xmm2
0x100337cd8: vmovaps xmm2, xmmword ptr [rip + 0x76fc30] ; 0x100aa7910
0x100337ce0: vandps xmm1, xmm1, xmm2
0x100337ce4: vaddss xmm1, xmm1, dword ptr [rip + 0x76d3d8] ; 0x100aa50c4
0x100337cec: vandps xmm1, xmm1, xmm2
0x100337cf0: vmovss xmm5, dword ptr [rip + 0x76fbcc] ; 0x100aa78c4
0x100337cf8: vucomiss xmm5, xmm1
0x100337cfc: vmovaps xmm4, xmm12
0x100337d00: vmovaps xmm2, xmmword ptr [rbp - 0x70]
0x100337d05: jae 0x100337d0b
0x100337d07: vmovaps xmm2, xmm0
0x100337d0b: vpermilps xmm1, xmm4, 0xd2
0x100337d11: vmulps xmm0, xmm1, xmm2
0x100337d15: vpermilps xmm2, xmm2, 0xd2
0x100337d1b: vmulps xmm2, xmm4, xmm2
0x100337d1f: vsubps xmm2, xmm0, xmm2
0x100337d23: vpermilps xmm0, xmm2, 0xd2
0x100337d29: vmulps xmm2, xmm2, xmm2
0x100337d2d: vpermilpd xmm3, xmm2, 1
0x100337d33: vaddss xmm3, xmm3, xmm2
0x100337d37: vmovshdup xmm2, xmm2
0x100337d3b: vaddss xmm2, xmm2, xmm3
0x100337d3f: vsqrtss xmm2, xmm2, xmm2
0x100337d43: vucomiss xmm2, xmm5
0x100337d47: jbe 0x100337d53
0x100337d49: vpermilps xmm2, xmm2, 0xc0
0x100337d4f: vdivps xmm0, xmm0, xmm2
0x100337d53: vpermilps xmm2, xmm0, 0xd2
0x100337d59: vmulps xmm2, xmm4, xmm2
0x100337d5d: vmulps xmm1, xmm1, xmm0
0x100337d61: vsubps xmm2, xmm2, xmm1
0x100337d65: vpermilps xmm1, xmm2, 0xd2
0x100337d6b: vmulps xmm2, xmm2, xmm2
0x100337d6f: vpermilpd xmm3, xmm2, 1
0x100337d75: vaddss xmm3, xmm3, xmm2
0x100337d79: vmovshdup xmm2, xmm2
0x100337d7d: vaddss xmm2, xmm2, xmm3
0x100337d81: vsqrtss xmm2, xmm2, xmm2
0x100337d85: vucomiss xmm2, dword ptr [rip + 0x76fb37] ; 0x100aa78c4
0x100337d8d: jbe 0x100337d99
0x100337d8f: vpermilps xmm2, xmm2, 0xc0
0x100337d95: vdivps xmm1, xmm1, xmm2
0x100337d99: vxorps xmm2, xmm4, xmmword ptr [rip + 0x76fb5f] ; 0x100aa7900
0x100337da1: vmovaps xmmword ptr [r12 + 0x20], xmm0
0x100337da8: vmovaps xmmword ptr [r12 + 0x30], xmm1
0x100337daf: vmovaps xmmword ptr [r12 + 0x40], xmm2
0x100337db6: mov r13, qword ptr [r12 + 0x110]
0x100337dbe: mov rax, qword ptr [r12]
0x100337dc2: lea r14, [rbp - 0x1b0]
0x100337dc9: mov rdi, r14
0x100337dcc: mov rsi, r12
0x100337dcf: call qword ptr [rax + 0x18]
0x100337dd2: vmovaps xmm0, xmmword ptr [r12 + 0x120]
0x100337ddc: vxorps xmm1, xmm1, xmm1
0x100337de0: vblendps xmm2, xmm1, xmm0, 1
0x100337de6: vblendps xmm3, xmm1, xmm0, 2
0x100337dec: vblendps xmm0, xmm1, xmm0, 4
0x100337df2: vmovaps xmmword ptr [rbp - 0x110], xmm2
0x100337dfa: vmovaps xmmword ptr [rbp - 0x100], xmm3
0x100337e02: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x100337e0a: vmovaps xmm0, xmmword ptr [rip + 0x770bee] ; 0x100aa8a00
0x100337e12: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x100337e1a: lea rbx, [rbp - 0xd0]
0x100337e21: lea rdx, [rbp - 0x110]
0x100337e28: mov rdi, rbx
0x100337e2b: mov rsi, r14
0x100337e2e: call 0x100076df0 ; 0x100076df0
0x100337e33: mov rdi, r13
0x100337e36: mov rsi, rbx
0x100337e39: call 0x100463750 ; 0x100463750
0x100337e3e: mov eax, dword ptr [r12 + 0x17c]
0x100337e46: cmp eax, 1
0x100337e49: vmovss xmm0, dword ptr [rip + 0x76d26f] ; 0x100aa50c0
0x100337e51: je 0x100337e57
0x100337e53: vxorps xmm0, xmm0, xmm0
0x100337e57: vmovss xmm2, dword ptr [r12 + 0x140]
0x100337e61: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x100337e66: vsubss xmm1, xmm0, xmm3
0x100337e6a: vucomiss xmm1, xmm2
0x100337e6e: jbe 0x100337e85
0x100337e70: vaddss xmm0, xmm3, xmm2
0x100337e74: vmovss dword ptr [r12 + 0x140], xmm0
0x100337e7e: cmp eax, 2
0x100337e81: jne 0x100337ea2
0x100337e83: jmp 0x100337ea8 ; 0x100337ea8
0x100337e85: vaddss xmm1, xmm3, xmm0
0x100337e89: vucomiss xmm2, xmm1
0x100337e8d: jbe 0x100337e93
0x100337e8f: vsubss xmm0, xmm2, xmm3
0x100337e93: vmovss dword ptr [r12 + 0x140], xmm0
0x100337e9d: cmp eax, 2
0x100337ea0: je 0x100337ea8
0x100337ea2: vxorps xmm4, xmm4, xmm4
0x100337ea6: jmp 0x100337eb0 ; 0x100337eb0
0x100337ea8: vmovss xmm4, dword ptr [rip + 0x76d210] ; 0x100aa50c0
0x100337eb0: vmovss xmm1, dword ptr [r12 + 0x144]
0x100337eba: vsubss xmm2, xmm4, xmm3
0x100337ebe: vucomiss xmm2, xmm1
0x100337ec2: jbe 0x100337ed9
0x100337ec4: vaddss xmm4, xmm3, xmm1
0x100337ec8: vmovss dword ptr [r12 + 0x144], xmm4
0x100337ed2: cmp eax, 3
0x100337ed5: jne 0x100337ef6
0x100337ed7: jmp 0x100337efc ; 0x100337efc
0x100337ed9: vaddss xmm2, xmm3, xmm4
0x100337edd: vucomiss xmm1, xmm2
0x100337ee1: jbe 0x100337ee7
0x100337ee3: vsubss xmm4, xmm1, xmm3
0x100337ee7: vmovss dword ptr [r12 + 0x144], xmm4
0x100337ef1: cmp eax, 3
0x100337ef4: je 0x100337efc
0x100337ef6: vxorps xmm4, xmm4, xmm4
0x100337efa: jmp 0x100337f04 ; 0x100337f04
0x100337efc: vmovss xmm4, dword ptr [rip + 0x76d1bc] ; 0x100aa50c0
0x100337f04: vmovss xmm1, dword ptr [r12 + 0x148]
0x100337f0e: vsubss xmm2, xmm4, xmm3
0x100337f12: vucomiss xmm2, xmm1
0x100337f16: jbe 0x100337f2d
0x100337f18: vaddss xmm4, xmm3, xmm1
0x100337f1c: vmovss dword ptr [r12 + 0x148], xmm4
0x100337f26: cmp eax, 4
0x100337f29: jne 0x100337f4a
0x100337f2b: jmp 0x100337f50 ; 0x100337f50
0x100337f2d: vaddss xmm2, xmm3, xmm4
0x100337f31: vucomiss xmm1, xmm2
0x100337f35: jbe 0x100337f3b
0x100337f37: vsubss xmm4, xmm1, xmm3
0x100337f3b: vmovss dword ptr [r12 + 0x148], xmm4
0x100337f45: cmp eax, 4
0x100337f48: je 0x100337f50
0x100337f4a: vxorps xmm4, xmm4, xmm4
0x100337f4e: jmp 0x100337f58 ; 0x100337f58
0x100337f50: vmovss xmm4, dword ptr [rip + 0x76d168] ; 0x100aa50c0
0x100337f58: vmovss xmm1, dword ptr [r12 + 0x14c]
0x100337f62: vsubss xmm2, xmm4, xmm3
0x100337f66: vucomiss xmm2, xmm1
0x100337f6a: jbe 0x100337f72
0x100337f6c: vaddss xmm4, xmm3, xmm1
0x100337f70: jmp 0x100337f80 ; 0x100337f80
0x100337f72: vaddss xmm2, xmm3, xmm4
0x100337f76: vucomiss xmm1, xmm2
0x100337f7a: jbe 0x100337f80
0x100337f7c: vsubss xmm4, xmm1, xmm3
0x100337f80: vmovss dword ptr [r12 + 0x14c], xmm4
0x100337f8a: mov rax, qword ptr [r12 + 0x110]
0x100337f92: mov rdi, qword ptr [rax + 0x68]
0x100337f96: mov esi, dword ptr [r12 + 0x130]
0x100337f9e: call 0x100097200 ; 0x100097200
0x100337fa3: mov rax, qword ptr [r12 + 0x110]
0x100337fab: mov rdi, qword ptr [rax + 0x68]
0x100337faf: mov esi, dword ptr [r12 + 0x134]
0x100337fb7: vmovss xmm0, dword ptr [r12 + 0x144]
0x100337fc1: call 0x100097200 ; 0x100097200
0x100337fc6: mov rax, qword ptr [r12 + 0x110]
0x100337fce: mov rdi, qword ptr [rax + 0x68]
0x100337fd2: mov esi, dword ptr [r12 + 0x138]
0x100337fda: vmovss xmm0, dword ptr [r12 + 0x148]
0x100337fe4: call 0x100097200 ; 0x100097200
0x100337fe9: mov rax, qword ptr [r12 + 0x110]
0x100337ff1: mov rdi, qword ptr [rax + 0x68]
0x100337ff5: mov esi, dword ptr [r12 + 0x13c]
0x100337ffd: vmovss xmm0, dword ptr [r12 + 0x14c]
0x100338007: call 0x100097200 ; 0x100097200
0x10033800c: mov rdi, qword ptr [r15 + 0x138]
0x100338013: vmovaps xmm0, xmmword ptr [rip + 0x7712c5] ; 0x100aa92e0
0x10033801b: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x100338023: vmovss xmm0, dword ptr [r12 + 0x14]
0x10033802a: vaddss xmm0, xmm0, dword ptr [rip + 0x76d08e] ; 0x100aa50c0
0x100338032: lea rdx, [rbp - 0xd0]
0x100338039: lea r8, [rbp - 0x110]
0x100338040: xor ecx, ecx
0x100338042: mov rsi, qword ptr [rbp - 0x30]
0x100338046: call 0x100776a90 ; 0x100776a90
0x10033804b: test al, al
0x10033804d: je 0x100338116
0x100338053: mov al, byte ptr [rbp - 0xec]
0x100338059: and al, 1
0x10033805b: je 0x100338116
0x100338061: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x100338069: mov rax, qword ptr [rbp - 0x30]
0x10033806d: vsubps xmm1, xmm0, xmmword ptr [rax]
0x100338071: vmulps xmm1, xmm1, xmm1
0x100338075: vmovshdup xmm2, xmm1
0x100338079: vaddss xmm2, xmm1, xmm2
0x10033807d: vpermilpd xmm1, xmm1, 1
0x100338083: vaddss xmm1, xmm1, xmm2
0x100338087: vsqrtss xmm1, xmm1, xmm1
0x10033808b: vaddss xmm1, xmm1, dword ptr [rip + 0x76d031] ; 0x100aa50c4
0x100338093: vdivss xmm1, xmm1, dword ptr [rip + 0x77b0b9] ; 0x100ab3154
0x10033809b: vxorps xmm2, xmm2, xmm2
0x10033809f: vmaxss xmm1, xmm2, xmm1
0x1003380a3: vmovss xmm2, dword ptr [rip + 0x76d015] ; 0x100aa50c0
0x1003380ab: vminss xmm1, xmm2, xmm1
0x1003380af: vsubss xmm1, xmm2, xmm1
0x1003380b3: mov rdi, qword ptr [r15 + 0x500]
0x1003380ba: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x1003380c2: vpermilps xmm0, xmm1, 0xc0
0x1003380c8: vmulps xmm0, xmm0, xmmword ptr [rip + 0x7736c0] ; 0x100aab790
0x1003380d0: vinsertps xmm0, xmm0, xmm2, 0x30
0x1003380d6: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1003380de: vmulss xmm0, xmm1, dword ptr [rip + 0x77054e] ; 0x100aa8634
0x1003380e6: mov rax, qword ptr [rbp - 0x38]
0x1003380ea: mov rax, qword ptr [rax]
0x1003380ed: vmulss xmm1, xmm1, dword ptr [rax + 0x10]
0x1003380f2: vmulss xmm1, xmm1, dword ptr [rip + 0x76c4be] ; 0x100aa45b8
0x1003380fa: lea rdx, [rbp - 0x140]
0x100338101: lea rcx, [rbp - 0xd0]
0x100338108: mov esi, 1
0x10033810d: vmovaps xmm3, xmm2
0x100338111: call 0x1004d3940 ; 0x1004d3940
0x100338116: mov rbx, qword ptr [r12 + 0x158]
0x10033811e: test rbx, rbx
0x100338121: je 0x100338142
0x100338123: mov rax, qword ptr [r12]
0x100338127: lea r14, [rbp - 0xd0]
0x10033812e: mov rdi, r14
0x100338131: mov rsi, r12
0x100338134: call qword ptr [rax + 0x18]
0x100338137: mov rdi, rbx
0x10033813a: mov rsi, r14
0x10033813d: call 0x1003991b0 ; 0x1003991b0
0x100338142: mov rax, qword ptr [r12]
0x100338146: lea rdi, [rbp - 0xd0]
0x10033814d: mov rsi, r12
0x100338150: call qword ptr [rax + 0x18]
0x100338153: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x10033815b: vpermilps xmm1, xmm0, 0xe7
0x100338161: vucomiss xmm1, xmm1
0x100338165: jp 0x10033847f
0x10033816b: vmovshdup xmm1, xmm0
0x10033816f: vucomiss xmm0, xmm1
0x100338173: jp 0x10033847f
0x100338179: vpermilpd xmm0, xmm0, 1
0x10033817f: vucomiss xmm0, xmm0
0x100338183: jp 0x10033847f
0x100338189: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x100338191: vpermilps xmm1, xmm0, 0xe7
0x100338197: vucomiss xmm1, xmm1
0x10033819b: jp 0x10033847f
0x1003381a1: vmovshdup xmm1, xmm0
0x1003381a5: vucomiss xmm0, xmm1
0x1003381a9: jp 0x10033847f
0x1003381af: vpermilpd xmm0, xmm0, 1
0x1003381b5: vucomiss xmm0, xmm0
0x1003381b9: jp 0x10033847f
0x1003381bf: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1003381c7: vpermilps xmm1, xmm0, 0xe7
0x1003381cd: vucomiss xmm1, xmm1
0x1003381d1: jp 0x10033847f
0x1003381d7: vmovshdup xmm1, xmm0
0x1003381db: vucomiss xmm0, xmm1
0x1003381df: jp 0x10033847f
0x1003381e5: vpermilpd xmm0, xmm0, 1
0x1003381eb: vucomiss xmm0, xmm0
0x1003381ef: jp 0x10033847f
0x1003381f5: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x1003381fd: vpermilps xmm1, xmm0, 0xe7
0x100338203: vucomiss xmm1, xmm1
0x100338207: jp 0x10033847f
0x10033820d: vmovshdup xmm1, xmm0
0x100338211: vucomiss xmm0, xmm1
0x100338215: jp 0x10033847f
0x10033821b: vpermilpd xmm0, xmm0, 1
0x100338221: vucomiss xmm0, xmm0
0x100338225: jp 0x10033847f
0x10033822b: vmovss xmm0, dword ptr [r12 + 0x160]
0x100338235: vucomiss xmm0, dword ptr [rip + 0x771433] ; 0x100aa9670
0x10033823d: vmovaps xmm2, xmmword ptr [rbp - 0x50]
0x100338242: jbe 0x1003382d2
0x100338248: mov rdi, qword ptr [r15 + 0x280]
0x10033824f: call 0x1000fc260 ; 0x1000fc260
0x100338254: mov rax, qword ptr [rax + 0x18]
0x100338258: mov rcx, qword ptr [rbp - 0x30]
0x10033825c: vmovaps xmm0, xmmword ptr [rcx]
0x100338260: vsubps xmm0, xmm0, xmmword ptr [rax + 0x10]
0x100338265: vmulps xmm0, xmm0, xmm0
0x100338269: vmovshdup xmm1, xmm0
0x10033826d: vaddss xmm1, xmm0, xmm1
0x100338271: vpermilpd xmm0, xmm0, 1
0x100338277: vaddss xmm0, xmm0, xmm1
0x10033827b: vsqrtss xmm0, xmm0, xmm0
0x10033827f: mov rax, qword ptr [rbp - 0x38]
0x100338283: mov rax, qword ptr [rax]
0x100338286: vmovss xmm1, dword ptr [rax + 0x10]
0x10033828b: vucomiss xmm1, xmm0
0x10033828f: jbe 0x1003382c3
0x100338291: mov dword ptr [r12 + 0x160], 0x3f800000
0x10033829d: mov rax, qword ptr [r12 + 0x110]
0x1003382a5: mov rdi, qword ptr [rax + 0x68]
0x1003382a9: lea rsi, [rip + 0x832a70] ; 0x100b6ad20 CritterAlert
0x1003382b0: vmovss xmm0, dword ptr [rip + 0x76ce08] ; 0x100aa50c0
0x1003382b8: xor edx, edx
0x1003382ba: vmovaps xmm1, xmm0
0x1003382be: call 0x1000967b0 ; 0x1000967b0
0x1003382c3: vmovss xmm0, dword ptr [r12 + 0x160]
0x1003382cd: vmovaps xmm2, xmmword ptr [rbp - 0x50]
0x1003382d2: vucomiss xmm0, dword ptr [rip + 0x771396] ; 0x100aa9670
0x1003382da: jbe 0x100338392
0x1003382e0: vmovss xmm0, dword ptr [r12 + 0x168]
0x1003382ea: vucomiss xmm0, dword ptr [rip + 0x76f4fe] ; 0x100aa77f0
0x1003382f2: jbe 0x100338392
0x1003382f8: mov rbx, qword ptr [r15 + 0x3c8]
0x1003382ff: mov rax, qword ptr [rbp - 0x30]
0x100338303: vmovaps xmm0, xmmword ptr [rax]
0x100338307: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x10033830f: mov rax, qword ptr [rbp - 0x38]
0x100338313: mov rax, qword ptr [rax]
0x100338316: vmovss xmm0, dword ptr [rax + 0x10]
0x10033831b: vmovss dword ptr [rbp - 0x30], xmm0
0x100338320: mov rdi, qword ptr [r15 + 0x280]
0x100338327: call 0x1000fc260 ; 0x1000fc260
0x10033832c: mov edx, dword ptr [rax + 0xe0]
0x100338332: lea rsi, [rbp - 0x130]
0x100338339: mov ecx, 1
0x10033833e: mov r8d, 1
0x100338344: mov rdi, rbx
0x100338347: vmovss xmm0, dword ptr [rbp - 0x30]
0x10033834c: call 0x1005a18f0 ; 0x1005a18f0
0x100338351: vmovaps xmm2, xmmword ptr [rbp - 0x50]
0x100338356: test al, al
0x100338358: je 0x100338392
0x10033835a: mov dword ptr [r12 + 0x160], 0
0x100338366: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10033836b: vmovaps xmm2, xmmword ptr [rbp - 0x50]
0x100338370: vcvtsi2ss xmm0, xmm5, eax
0x100338374: vmulss xmm0, xmm0, dword ptr [rip + 0x76ed74] ; 0x100aa70f0
0x10033837c: vmulss xmm0, xmm0, dword ptr [rip + 0x76f46c] ; 0x100aa77f0
0x100338384: vcvttss2si eax, xmm0
0x100338388: inc al
0x10033838a: mov byte ptr [r12 + 0x164], al
0x100338392: vaddss xmm1, xmm2, dword ptr [r12 + 0x160]
0x10033839c: vmovss dword ptr [r12 + 0x160], xmm1
0x1003383a6: vaddss xmm0, xmm2, dword ptr [r12 + 0x168]
0x1003383b0: vmovss dword ptr [r12 + 0x168], xmm0
0x1003383ba: movzx eax, byte ptr [r12 + 0x164]
0x1003383c3: test al, al
0x1003383c5: je 0x10033846d
0x1003383cb: vcvtsi2ss xmm0, xmm5, eax
0x1003383cf: vmovss xmm2, dword ptr [rip + 0x76ed1d] ; 0x100aa70f4
0x1003383d7: vmulss xmm3, xmm0, xmm2
0x1003383db: vaddss xmm2, xmm3, xmm2
0x1003383df: vucomiss xmm1, xmm2
0x1003383e3: jbe 0x10033846d
0x1003383e9: mov dword ptr [r12 + 0x160], 0
0x1003383f5: mov dword ptr [r12 + 0x168], 0
0x100338401: mov rbx, qword ptr [r15 + 0x3c8]
0x100338408: mov rcx, qword ptr [r12 + 0x78]
0x10033840d: vmovss xmm1, dword ptr [rcx + 0x10]
0x100338412: vmulss xmm1, xmm1, dword ptr [rip + 0x76f3da] ; 0x100aa77f4
0x10033841a: dec al
0x10033841c: mov byte ptr [r12 + 0x164], al
0x100338424: vmulss xmm0, xmm1, xmm0
0x100338428: vmovss dword ptr [rbp - 0x30], xmm0
0x10033842d: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100338432: vcvtsi2ss xmm0, xmm5, eax
0x100338436: vmulss xmm1, xmm0, dword ptr [rip + 0x76ecb2] ; 0x100aa70f0
0x10033843e: mov dword ptr [rsp], 1
0x100338445: lea rcx, [rip + 0x1d07264] ; 0x10203f6b0
0x10033844c: mov edx, 7
0x100338451: mov r8d, 1
0x100338457: mov r9d, 1
0x10033845d: mov rdi, rbx
0x100338460: mov rsi, r12
0x100338463: vmovss xmm0, dword ptr [rbp - 0x30]
0x100338468: call 0x1005a10e0 ; 0x1005a10e0
0x10033846d: add rsp, 0x198
0x100338474: pop rbx
0x100338475: pop r12
0x100338477: pop r13
0x100338479: pop r14
0x10033847b: pop r15
0x10033847d: pop rbp
0x10033847e: ret 
0x10033847f: lea rdi, [rip + 0x83f889] ; 0x100b77d0f !isNan( GetTransform() )
0x100338486: lea rsi, [rip + 0x8490bb] ; 0x100b81548 FishV2.cpp
0x10033848d: mov edx, 0x2d5
0x100338492: mov ecx, 3
0x100338497: call 0x1007e5f70 ; 0x1007e5f70
0x10033849c: ud2 
0x10033849e: nop 
