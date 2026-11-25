0x10025a880: push rbp
0x10025a881: mov rbp, rsp
0x10025a884: push r15
0x10025a886: push r14
0x10025a888: push r13
0x10025a88a: push r12
0x10025a88c: push rbx
0x10025a88d: sub rsp, 0x248
0x10025a894: mov qword ptr [rbp - 0xe8], rcx
0x10025a89b: mov qword ptr [rbp - 0xe0], rdx
0x10025a8a2: mov r12, rsi
0x10025a8a5: mov rbx, rdi
0x10025a8a8: mov rax, qword ptr [rip + 0x9b3029] ; 0x100c0d8d8
0x10025a8af: mov rax, qword ptr [rax]
0x10025a8b2: mov qword ptr [rbp - 0x30], rax
0x10025a8b6: mov rax, qword ptr [r12 + 0x160]
0x10025a8be: vmovss xmm0, dword ptr [rax + 0x14]
0x10025a8c3: lea r15, [rip + 0x1da0806] ; 0x101ffb0d0
0x10025a8ca: cmp byte ptr [r15], 0
0x10025a8ce: lea r14, [rip + 0xa5dc6b] ; 0x100cb8540
0x10025a8d5: je 0x10025a8de
0x10025a8d7: vmovss xmm1, dword ptr [r14]
0x10025a8dc: jmp 0x10025a8e6 ; 0x10025a8e6
0x10025a8de: vmovss xmm1, dword ptr [rip + 0x84a7da] ; 0x100aa50c0
0x10025a8e6: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x10025a8eb: vmulss xmm0, xmm0, xmm1
0x10025a8ef: vmovss xmm1, dword ptr [rip + 0x84c1a5] ; 0x100aa6a9c
0x10025a8f7: vmaxss xmm0, xmm1, xmm0
0x10025a8fb: vmovss xmm1, dword ptr [rip + 0x84c19d] ; 0x100aa6aa0
0x10025a903: vminss xmm0, xmm1, xmm0
0x10025a907: vmovss dword ptr [rbp - 0x94], xmm0
0x10025a90f: mov rax, qword ptr [rbx + 0x10]
0x10025a913: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10025a918: vmovaps xmmword ptr [rbp - 0x150], xmm0
0x10025a920: vmovups ymm0, ymmword ptr [rax + 0x20]
0x10025a925: vmovups ymm1, ymmword ptr [rax + 0x30]
0x10025a92a: vmovups ymmword ptr [rbp - 0x130], ymm1
0x10025a932: vmovups ymmword ptr [rbp - 0x140], ymm0
0x10025a93a: vmovaps xmm0, xmmword ptr [rax + 0x50]
0x10025a93f: vmovaps xmmword ptr [rbp - 0x110], xmm0
0x10025a947: mov ecx, dword ptr [rax + 0x68]
0x10025a94a: mov dword ptr [rbp - 0xf8], ecx
0x10025a950: mov rax, qword ptr [rax + 0x60]
0x10025a954: mov qword ptr [rbp - 0x100], rax
0x10025a95b: vmovss xmm0, dword ptr [rbx + 0x1cc]
0x10025a963: vxorps xmm1, xmm1, xmm1
0x10025a967: vucomiss xmm1, xmm0
0x10025a96b: jb 0x10025a9be
0x10025a96d: mov rdi, qword ptr [r12 + 0x220]
0x10025a975: lea rdx, [rbx + 0xc8]
0x10025a97c: lea r8, [rip + 0x49ad] ; 0x10025f330
0x10025a983: lea rsi, [rbp - 0x150]
0x10025a98a: vmovss xmm0, dword ptr [rip + 0x84ce4a] ; 0x100aa77dc
0x10025a992: mov ecx, 0x20
0x10025a997: xor r9d, r9d
0x10025a99a: vzeroupper 
0x10025a99d: call 0x1004ce4b0 ; 0x1004ce4b0
0x10025a9a2: vxorps xmm1, xmm1, xmm1
0x10025a9a6: mov dword ptr [rbx + 0x1c8], eax
0x10025a9ac: mov dword ptr [rbx + 0x1cc], 0x3f000000
0x10025a9b6: vmovss xmm0, dword ptr [rip + 0x849bfa] ; 0x100aa45b8
0x10025a9be: vsubss xmm0, xmm0, dword ptr [rbp - 0x94]
0x10025a9c6: vmovss dword ptr [rbx + 0x1cc], xmm0
0x10025a9ce: vmovss xmm0, dword ptr [rbx + 0x90]
0x10025a9d6: vucomiss xmm1, xmm0
0x10025a9da: jb 0x10025a9f2
0x10025a9dc: mov rdi, rbx
0x10025a9df: mov rsi, r12
0x10025a9e2: vzeroupper 
0x10025a9e5: call 0x1002594c0 ; 0x1002594c0
0x10025a9ea: vmovss xmm0, dword ptr [rbx + 0x90]
0x10025a9f2: vmovss xmm1, dword ptr [rbp - 0x94]
0x10025a9fa: vsubss xmm0, xmm0, xmm1
0x10025a9fe: vmovss dword ptr [rbx + 0x90], xmm0
0x10025aa06: vaddss xmm0, xmm1, dword ptr [rbx + 0x80]
0x10025aa0e: vmovss dword ptr [rbx + 0x80], xmm0
0x10025aa16: mov qword ptr [rbp - 0xd8], r12
0x10025aa1d: mov rax, qword ptr [r12 + 0x160]
0x10025aa25: cmp byte ptr [r15], 0
0x10025aa29: vmovss xmm1, dword ptr [rip + 0x84a68f] ; 0x100aa50c0
0x10025aa31: vmovaps xmm0, xmm1
0x10025aa35: je 0x10025aa3c
0x10025aa37: vmovss xmm0, dword ptr [r14]
0x10025aa3c: lea r14, [rbx + 0x50]
0x10025aa40: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x10025aa45: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x10025aa4a: vmovss xmm2, dword ptr [rip + 0x84c04a] ; 0x100aa6a9c
0x10025aa52: vmaxss xmm0, xmm2, xmm0
0x10025aa56: vmovss xmm2, dword ptr [rip + 0x84c042] ; 0x100aa6aa0
0x10025aa5e: vminss xmm0, xmm2, xmm0
0x10025aa62: vmulss xmm2, xmm0, dword ptr [rip + 0x849b4e] ; 0x100aa45b8
0x10025aa6a: mov r15d, 1
0x10025aa70: mov r12d, 0x98
0x10025aa76: vmovss xmm3, dword ptr [rip + 0x84ebfa] ; 0x100aa9678
0x10025aa7e: vxorps xmm4, xmm4, xmm4
0x10025aa82: lea r13, [rip + 0xa0f] ; 0x10025b498
0x10025aa89: vmovss dword ptr [rbp - 0xd0], xmm2
0x10025aa91: nop word ptr cs:[rax + rax]
0x10025aaa0: cmp r15d, 0xb
0x10025aaa4: ja 0x10025aab7
0x10025aaa6: mov rax, qword ptr [rbx + 8]
0x10025aaaa: mov ecx, r15d
0x10025aaad: movsxd rcx, dword ptr [r13 + rcx*4]
0x10025aab2: add rcx, r13
0x10025aab5: jmp rcx
0x10025aab7: vblendps xmm5, xmm5, xmmword ptr [rip + 0x849adf], 7 ; 0x100aa45a0
0x10025aac1: mov eax, dword ptr [r14]
0x10025aac4: cmp r15, rax
0x10025aac7: jne 0x10025ac30
0x10025aacd: nop dword ptr [rax]
0x10025aad0: mov rax, qword ptr [r14 + 0x10]
0x10025aad4: mov qword ptr [rbp - 0x80], rax
0x10025aad8: vmovaps xmm0, xmmword ptr [r14]
0x10025aadd: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x10025aae5: vmovaps xmm0, xmmword ptr [rbx + 0x70]
0x10025aaea: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10025aaef: mov eax, dword ptr [rbx + 0x80]
0x10025aaf5: mov dword ptr [rbp - 0x60], eax
0x10025aaf8: mov rdi, rbx
0x10025aafb: lea rsi, [rbp - 0x90]
0x10025ab02: vmovaps xmmword ptr [rbp - 0xb0], xmm5
0x10025ab0a: vzeroupper 
0x10025ab0d: call 0x100258790 ; 0x100258790
0x10025ab12: vmovaps xmm5, xmmword ptr [rbp - 0xb0]
0x10025ab1a: vxorps xmm4, xmm4, xmm4
0x10025ab1e: vmovss xmm3, dword ptr [rip + 0x84eb52] ; 0x100aa9678
0x10025ab26: vmovss xmm2, dword ptr [rbp - 0xd0]
0x10025ab2e: vmulss xmm0, xmm2, xmm0
0x10025ab32: vmovshdup xmm1, xmm5
0x10025ab36: vmaxss xmm1, xmm1, xmm3
0x10025ab3a: vdivss xmm0, xmm0, xmm1
0x10025ab3e: lea rax, [rbx + r12]
0x10025ab42: vmovss xmm1, dword ptr [rbx + r12]
0x10025ab48: vsubss xmm0, xmm1, xmm0
0x10025ab4c: vmovss xmm1, dword ptr [rip + 0x84a56c] ; 0x100aa50c0
0x10025ab54: jmp 0x10025ac4c ; 0x10025ac4c
0x10025ab59: vmovaps xmm5, xmmword ptr [rax + 0x20]
0x10025ab5e: mov eax, dword ptr [r14]
0x10025ab61: cmp r15, rax
0x10025ab64: je 0x10025aad0
0x10025ab6a: jmp 0x10025ac30 ; 0x10025ac30
0x10025ab6f: vmovaps xmm5, xmmword ptr [rax + 0x30]
0x10025ab74: mov eax, dword ptr [r14]
0x10025ab77: cmp r15, rax
0x10025ab7a: je 0x10025aad0
0x10025ab80: jmp 0x10025ac30 ; 0x10025ac30
0x10025ab85: vmovaps xmm5, xmmword ptr [rax + 0x40]
0x10025ab8a: mov eax, dword ptr [r14]
0x10025ab8d: cmp r15, rax
0x10025ab90: je 0x10025aad0
0x10025ab96: jmp 0x10025ac30 ; 0x10025ac30
0x10025ab9b: vmovaps xmm5, xmmword ptr [rax + 0x50]
0x10025aba0: mov eax, dword ptr [r14]
0x10025aba3: cmp r15, rax
0x10025aba6: je 0x10025aad0
0x10025abac: jmp 0x10025ac30 ; 0x10025ac30
0x10025abb1: vmovaps xmm5, xmmword ptr [rax + 0x60]
0x10025abb6: mov eax, dword ptr [r14]
0x10025abb9: cmp r15, rax
0x10025abbc: je 0x10025aad0
0x10025abc2: jmp 0x10025ac30 ; 0x10025ac30
0x10025abc4: vmovaps xmm5, xmmword ptr [rax + 0x70]
0x10025abc9: mov eax, dword ptr [r14]
0x10025abcc: cmp r15, rax
0x10025abcf: je 0x10025aad0
0x10025abd5: jmp 0x10025ac30 ; 0x10025ac30
0x10025abd7: vmovaps xmm5, xmmword ptr [rax + 0x80]
0x10025abdf: mov eax, dword ptr [r14]
0x10025abe2: cmp r15, rax
0x10025abe5: je 0x10025aad0
0x10025abeb: jmp 0x10025ac30 ; 0x10025ac30
0x10025abed: vmovaps xmm5, xmmword ptr [rax + 0x90]
0x10025abf5: mov eax, dword ptr [r14]
0x10025abf8: cmp r15, rax
0x10025abfb: je 0x10025aad0
0x10025ac01: jmp 0x10025ac30 ; 0x10025ac30
0x10025ac03: vmovaps xmm5, xmmword ptr [rax + 0xa0]
0x10025ac0b: mov eax, dword ptr [r14]
0x10025ac0e: cmp r15, rax
0x10025ac11: je 0x10025aad0
0x10025ac17: jmp 0x10025ac30 ; 0x10025ac30
0x10025ac19: vmovaps xmm5, xmmword ptr [rax + 0xb0]
0x10025ac21: mov eax, dword ptr [r14]
0x10025ac24: cmp r15, rax
0x10025ac27: je 0x10025aad0
0x10025ac2d: nop dword ptr [rax]
0x10025ac30: vpermilpd xmm0, xmm5, 1
0x10025ac36: vmaxss xmm0, xmm0, xmm3
0x10025ac3a: vdivss xmm0, xmm2, xmm0
0x10025ac3e: lea rax, [rbx + r15*4 + 0x94]
0x10025ac46: vaddss xmm0, xmm0, dword ptr [rbx + r12]
0x10025ac4c: vmovss dword ptr [rbx + r12], xmm0
0x10025ac52: vmaxss xmm0, xmm4, xmm0
0x10025ac56: vminss xmm0, xmm1, xmm0
0x10025ac5a: vmovss dword ptr [rax], xmm0
0x10025ac5e: inc r15
0x10025ac61: add r12, 4
0x10025ac65: cmp r12, 0xc4
0x10025ac6c: jne 0x10025aaa0
0x10025ac72: vmovaps xmm3, xmmword ptr [rbp - 0x150]
0x10025ac7a: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025ac82: mov r13, qword ptr [rbx + 8]
0x10025ac86: mov eax, dword ptr [r13 + 0x14]
0x10025ac8a: mov ecx, dword ptr [rbx + 0x50]
0x10025ac8d: lea edx, [rcx - 2]
0x10025ac90: cmp edx, 6
0x10025ac93: ja 0x10025adf4
0x10025ac99: lea rsi, [rip + 0x828] ; 0x10025b4c8
0x10025aca0: movsxd rdx, dword ptr [rsi + rdx*4]
0x10025aca4: add rdx, rsi
0x10025aca7: mov r15, qword ptr [rbp - 0xe0]
0x10025acae: jmp rdx
0x10025acb0: mov rsi, qword ptr [rbx + 0x58]
0x10025acb4: lea rdi, [rbp - 0x90]
0x10025acbb: vzeroupper 
0x10025acbe: call 0x10062e430 ; 0x10062e430
0x10025acc3: vmovaps xmm2, xmmword ptr [rbp - 0x150]
0x10025accb: vsubps xmm3, xmm2, xmmword ptr [rbp - 0x90]
0x10025acd3: vmulps xmm0, xmm3, xmm3
0x10025acd7: vmovshdup xmm1, xmm0
0x10025acdb: vaddss xmm1, xmm0, xmm1
0x10025acdf: vpermilpd xmm0, xmm0, 1
0x10025ace5: vaddss xmm0, xmm0, xmm1
0x10025ace9: vsqrtss xmm0, xmm0, xmm0
0x10025aced: vucomiss xmm0, dword ptr [rip + 0x84cbcf] ; 0x100aa78c4
0x10025acf5: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x10025acfd: jbe 0x10025ae09
0x10025ad03: vpermilps xmm0, xmm0, 0xc0
0x10025ad09: vdivps xmm3, xmm3, xmm0
0x10025ad0d: vmovaps xmmword ptr [rbp - 0xd0], xmm3
0x10025ad15: mov rax, qword ptr [rbp - 0xd8]
0x10025ad1c: jmp 0x10025ae18 ; 0x10025ae18
0x10025ad21: vmovaps xmm3, xmmword ptr [rbx + 0x30]
0x10025ad26: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025ad2e: jmp 0x10025b078 ; 0x10025b078
0x10025ad33: vmovaps xmm3, xmmword ptr [rbx + 0x70]
0x10025ad38: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025ad40: jmp 0x10025b078 ; 0x10025b078
0x10025ad45: vmovd xmm0, eax
0x10025ad49: vmovd dword ptr [rbp - 0xd0], xmm0
0x10025ad51: vmovss xmm0, dword ptr [rbp - 0x94]
0x10025ad59: vmulss xmm0, xmm0, dword ptr [rip + 0x84ca7b] ; 0x100aa77dc
0x10025ad61: vmovaps xmmword ptr [rbp - 0xb0], xmm3
0x10025ad69: vzeroupper 
0x10025ad6c: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10025ad71: vxorps xmm1, xmm0, xmmword ptr [rip + 0x84cb87] ; 0x100aa7900
0x10025ad79: vinsertps xmm2, xmm0, xmm0, 0x4e
0x10025ad7f: vinsertps xmm1, xmm2, xmm1, 0x20
0x10025ad85: vxorps xmm2, xmm2, xmm2
0x10025ad89: vunpcklps xmm0, xmm0, xmm2
0x10025ad8d: vmovaps xmm2, xmmword ptr [rbp - 0x120]
0x10025ad95: vmulps xmm2, xmm2, xmmword ptr [rip + 0x84d1a3] ; 0x100aa7f40
0x10025ad9d: vpermilps xmm3, xmm2, 0xc0
0x10025ada3: vmulps xmm1, xmm1, xmm3
0x10025ada7: vpermilps xmm3, xmm2, 0xd5
0x10025adad: vmulps xmm3, xmm3, xmmword ptr [rip + 0x84d2eb] ; 0x100aa80a0
0x10025adb5: vaddps xmm1, xmm3, xmm1
0x10025adb9: vmovaps xmm3, xmmword ptr [rbp - 0xb0]
0x10025adc1: vpermilps xmm2, xmm2, 0xea
0x10025adc7: vmulps xmm0, xmm0, xmm2
0x10025adcb: vaddps xmm0, xmm0, xmm1
0x10025adcf: vsubps xmm3, xmm3, xmm0
0x10025add3: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025addb: vmovss xmm0, dword ptr [rbp - 0xd0]
0x10025ade3: vmulss xmm0, xmm0, dword ptr [rip + 0x8497cd] ; 0x100aa45b8
0x10025adeb: vmovd eax, xmm0
0x10025adef: jmp 0x10025b078 ; 0x10025b078
0x10025adf4: mov r15, qword ptr [rbp - 0xe0]
0x10025adfb: cmp ecx, 1
0x10025adfe: jne 0x10025af34
0x10025ae04: jmp 0x10025af47 ; 0x10025af47
0x10025ae09: mov rax, qword ptr [rbp - 0xd8]
0x10025ae10: vmovaps xmmword ptr [rbp - 0xd0], xmm3
0x10025ae18: mov rax, qword ptr [rax + 0x160]
0x10025ae1f: vmovss xmm0, dword ptr [rbx + 0x80]
0x10025ae27: vaddss xmm0, xmm0, xmm0
0x10025ae2b: vaddss xmm0, xmm0, dword ptr [rax + 0x24]
0x10025ae30: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10025ae35: vmulss xmm0, xmm0, dword ptr [rip + 0x84d7b7] ; 0x100aa85f4
0x10025ae3d: vmulss xmm0, xmm0, dword ptr [rip + 0x849773] ; 0x100aa45b8
0x10025ae45: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10025ae4a: vmovshdup xmm1, xmm0
0x10025ae4e: vmovaps xmm5, xmmword ptr [rbp - 0xd0]
0x10025ae56: vmulss xmm2, xmm5, xmm1
0x10025ae5a: vpermilpd xmm3, xmm5, 1
0x10025ae60: vmulss xmm4, xmm3, xmm0
0x10025ae64: vaddss xmm2, xmm4, xmm2
0x10025ae68: vmovshdup xmm4, xmm5
0x10025ae6c: vxorps xmm11, xmm11, xmm11
0x10025ae71: vmulss xmm6, xmm4, xmm11
0x10025ae76: vsubss xmm8, xmm2, xmm6
0x10025ae7a: vmulss xmm7, xmm4, xmm1
0x10025ae7e: vmulss xmm2, xmm5, xmm11
0x10025ae83: vaddss xmm9, xmm2, xmm7
0x10025ae87: vmulss xmm7, xmm3, xmm11
0x10025ae8c: vsubss xmm9, xmm9, xmm7
0x10025ae90: vmulss xmm3, xmm3, xmm1
0x10025ae94: vaddss xmm3, xmm6, xmm3
0x10025ae98: vmulss xmm6, xmm5, xmm0
0x10025ae9c: vsubss xmm3, xmm3, xmm6
0x10025aea0: vmulss xmm4, xmm4, xmm0
0x10025aea4: vaddss xmm2, xmm2, xmm4
0x10025aea8: vaddss xmm2, xmm7, xmm2
0x10025aeac: vmulss xmm4, xmm2, xmm11
0x10025aeb1: vmulss xmm6, xmm1, xmm8
0x10025aeb6: vaddss xmm6, xmm4, xmm6
0x10025aeba: vmulss xmm7, xmm9, xmm11
0x10025aebf: vsubss xmm10, xmm6, xmm7
0x10025aec3: vmulss xmm6, xmm0, xmm3
0x10025aec7: vaddss xmm10, xmm6, xmm10
0x10025aecc: vmulss xmm2, xmm0, xmm2
0x10025aed0: vmulss xmm6, xmm1, xmm9
0x10025aed5: vaddss xmm2, xmm2, xmm6
0x10025aed9: vmulss xmm6, xmm3, xmm11
0x10025aede: vsubss xmm2, xmm2, xmm6
0x10025aee2: vmulss xmm5, xmm8, xmm11
0x10025aee7: vaddss xmm2, xmm5, xmm2
0x10025aeeb: vmulss xmm1, xmm1, xmm3
0x10025aeef: vaddss xmm1, xmm4, xmm1
0x10025aef3: vmulss xmm0, xmm0, xmm8
0x10025aef8: vsubss xmm0, xmm1, xmm0
0x10025aefc: vaddss xmm0, xmm7, xmm0
0x10025af00: vinsertps xmm1, xmm10, xmm2, 0x10
0x10025af06: vinsertps xmm0, xmm1, xmm0, 0x20
0x10025af0c: vmulps xmm0, xmm0, xmmword ptr [rip + 0x84d02c] ; 0x100aa7f40
0x10025af14: vaddps xmm3, xmm0, xmmword ptr [rbp - 0xb0]
0x10025af1c: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025af24: mov r13, qword ptr [rbx + 8]
0x10025af28: mov eax, dword ptr [r13 + 0x18]
0x10025af2c: mov ecx, dword ptr [rbx + 0x50]
0x10025af2f: cmp ecx, 1
0x10025af32: je 0x10025af47
0x10025af34: cmp ecx, 9
0x10025af37: je 0x10025af7a
0x10025af39: cmp ecx, 0xb
0x10025af3c: jne 0x10025b078
0x10025af42: jmp 0x10025b092 ; 0x10025b092
0x10025af47: mov rsi, qword ptr [rbx + 0x58]
0x10025af4b: lea rdi, [rbp - 0x90]
0x10025af52: vzeroupper 
0x10025af55: call 0x10062e430 ; 0x10062e430
0x10025af5a: vmovaps xmm3, xmmword ptr [rbp - 0x90]
0x10025af62: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025af6a: mov r13, qword ptr [rbx + 8]
0x10025af6e: mov eax, dword ptr [r13 + 0x18]
0x10025af72: mov ecx, dword ptr [rbx + 0x50]
0x10025af75: cmp ecx, 9
0x10025af78: jne 0x10025af39
0x10025af7a: mov r12, qword ptr [rbp - 0xd8]
0x10025af81: mov rdi, qword ptr [r12 + 0x398]
0x10025af89: mov esi, dword ptr [rbx + 0x60]
0x10025af8c: vzeroupper 
0x10025af8f: call 0x100263550 ; 0x100263550
0x10025af94: mov qword ptr [rbp - 0x210], rax
0x10025af9b: call 0x100262d70 ; 0x100262d70
0x10025afa0: mov r13, rax
0x10025afa3: mov qword ptr [rbp - 0x90], 0
0x10025afae: call 0x100474e80 ; 0x100474e80
0x10025afb3: mov r8, qword ptr [rax]
0x10025afb6: lea rsi, [rbp - 0x90]
0x10025afbd: lea rdx, [rbp - 0x210]
0x10025afc4: mov rdi, rax
0x10025afc7: mov rcx, r13
0x10025afca: call qword ptr [r8 + 0x40]
0x10025afce: mov r14, qword ptr [rbp - 0x90]
0x10025afd5: mov rdi, qword ptr [r12 + 0x418]
0x10025afdd: mov esi, dword ptr [rbx + 0x60]
0x10025afe0: call 0x10033a5f0 ; 0x10033a5f0
0x10025afe5: mov qword ptr [rbp - 0x210], rax
0x10025afec: call 0x10033abb0 ; 0x10033abb0
0x10025aff1: mov r12, rax
0x10025aff4: mov qword ptr [rbp - 0x90], 0
0x10025afff: call 0x10033abb0 ; 0x10033abb0
0x10025b004: mov r8, qword ptr [rax]
0x10025b007: lea rsi, [rbp - 0x90]
0x10025b00e: lea rdx, [rbp - 0x210]
0x10025b015: mov rdi, rax
0x10025b018: mov rcx, r12
0x10025b01b: call qword ptr [r8 + 0x40]
0x10025b01f: test r14, r14
0x10025b022: je 0x10025b02c
0x10025b024: vmovaps xmm3, xmmword ptr [r14 + 0x10]
0x10025b02a: jmp 0x10025b052 ; 0x10025b052
0x10025b02c: mov rax, qword ptr [rbp - 0x90]
0x10025b033: test rax, rax
0x10025b036: je 0x10025b042
0x10025b038: vmovaps xmm3, xmmword ptr [rax + 0xc0]
0x10025b040: jmp 0x10025b052 ; 0x10025b052
0x10025b042: vmovaps xmm0, xmmword ptr [rbp - 0x120]
0x10025b04a: vmulps xmm3, xmm0, xmmword ptr [rip + 0x858b9e] ; 0x100ab3bf0
0x10025b052: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025b05a: mov r13, qword ptr [rbx + 8]
0x10025b05e: vmovss xmm0, dword ptr [r13 + 0x18]
0x10025b064: vmulss xmm0, xmm0, dword ptr [rip + 0x84cc54] ; 0x100aa7cc0
0x10025b06c: vmovd eax, xmm0
0x10025b070: mov ecx, dword ptr [rbx + 0x50]
0x10025b073: cmp ecx, 0xb
0x10025b076: je 0x10025b092
0x10025b078: mov rcx, qword ptr [rbx + 0x10]
0x10025b07c: vmovss xmm0, dword ptr [rcx + 0x4d4]
0x10025b084: vxorps xmm1, xmm1, xmm1
0x10025b088: vucomiss xmm0, xmm1
0x10025b08c: jbe 0x10025b188
0x10025b092: mov rsi, qword ptr [rbx + 0x58]
0x10025b096: lea rdi, [rbp - 0x90]
0x10025b09d: vzeroupper 
0x10025b0a0: call 0x10062e430 ; 0x10062e430
0x10025b0a5: mov rsi, qword ptr [rbx + 0x58]
0x10025b0a9: lea rdi, [rbp - 0x210]
0x10025b0b0: call 0x10062e430 ; 0x10062e430
0x10025b0b5: vmovaps xmm0, xmmword ptr [rbp - 0x210]
0x10025b0bd: vsubps xmm2, xmm0, xmmword ptr [rbp - 0x150]
0x10025b0c5: vmulps xmm0, xmm2, xmm2
0x10025b0c9: vmovshdup xmm1, xmm0
0x10025b0cd: vaddss xmm1, xmm0, xmm1
0x10025b0d1: vpermilpd xmm0, xmm0, 1
0x10025b0d7: vaddss xmm0, xmm0, xmm1
0x10025b0db: vsqrtss xmm0, xmm0, xmm0
0x10025b0df: vucomiss xmm0, dword ptr [rip + 0x84c7dd] ; 0x100aa78c4
0x10025b0e7: jbe 0x10025b0f3
0x10025b0e9: vpermilps xmm0, xmm0, 0xc0
0x10025b0ef: vdivps xmm2, xmm2, xmm0
0x10025b0f3: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x10025b0fb: mov rsi, qword ptr [rbx + 0x58]
0x10025b0ff: lea rdi, [rbp - 0x270]
0x10025b106: call 0x10062e430 ; 0x10062e430
0x10025b10b: vmovss xmm0, dword ptr [rip + 0x84e0c9] ; 0x100aa91dc
0x10025b113: vmulss xmm1, xmm0, dword ptr [rbp - 0x220]
0x10025b11b: vmulss xmm0, xmm0, dword ptr [rbp - 0x100]
0x10025b123: vaddss xmm0, xmm1, xmm0
0x10025b127: vxorps xmm0, xmm0, xmmword ptr [rip + 0x84c7d1] ; 0x100aa7900
0x10025b12f: vpshufd xmm0, xmm0, 0xc0
0x10025b134: vmulps xmm0, xmm0, xmmword ptr [rbp - 0xb0]
0x10025b13c: vaddps xmm3, xmm0, xmmword ptr [rbp - 0x90]
0x10025b144: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025b14c: mov dword ptr [rbx + 0x90], 0x3f800000
0x10025b156: mov r13, qword ptr [rbx + 8]
0x10025b15a: mov rcx, qword ptr [rbx + 0x10]
0x10025b15e: vmovss xmm0, dword ptr [r13 + 0x18]
0x10025b164: vmovss xmm2, dword ptr [rcx + 0x4d4]
0x10025b16c: vxorps xmm1, xmm1, xmm1
0x10025b170: vucomiss xmm2, xmm1
0x10025b174: jbe 0x10025b17c
0x10025b176: vmulss xmm0, xmm0, xmm1
0x10025b17a: jmp 0x10025b184 ; 0x10025b184
0x10025b17c: vmulss xmm0, xmm0, dword ptr [rip + 0x84d448] ; 0x100aa85cc
0x10025b184: vmovd eax, xmm0
0x10025b188: mov esi, dword ptr [rbx + 0x50]
0x10025b18b: cmp esi, 0xa
0x10025b18e: je 0x10025b1a2
0x10025b190: vmovss xmm0, dword ptr [rcx + 0x4d0]
0x10025b198: vxorps xmm1, xmm1, xmm1
0x10025b19c: vucomiss xmm0, xmm1
0x10025b1a0: jbe 0x10025b1bc
0x10025b1a2: mov dword ptr [rbx + 0x90], 0x3f800000
0x10025b1ac: vmovaps xmm3, xmmword ptr [rbp - 0x150]
0x10025b1b4: vmovaps xmmword ptr [rbp - 0xc0], xmm3
0x10025b1bc: add esi, -3
0x10025b1bf: xor edx, edx
0x10025b1c1: mov edi, 0x95
0x10025b1c6: bt edi, esi
0x10025b1c9: cmovae edx, eax
0x10025b1cc: cmp esi, 8
0x10025b1cf: cmovae edx, eax
0x10025b1d2: mov rax, qword ptr [rcx + 0x80]
0x10025b1d9: vmovss xmm0, dword ptr [rax + 0x10]
0x10025b1de: vaddss xmm0, xmm0, dword ptr [rip + 0x84d43a] ; 0x100aa8620
0x10025b1e6: vmulss xmm0, xmm0, dword ptr [rip + 0x84d4a2] ; 0x100aa8690
0x10025b1ee: vxorps xmm1, xmm1, xmm1
0x10025b1f2: vmaxss xmm1, xmm1, xmm0
0x10025b1f6: vmovss xmm0, dword ptr [rip + 0x849ec2] ; 0x100aa50c0
0x10025b1fe: vminss xmm1, xmm0, xmm1
0x10025b202: vmovss xmm2, dword ptr [rip + 0x8493ae] ; 0x100aa45b8
0x10025b20a: vmulss xmm1, xmm1, xmm2
0x10025b20e: vaddss xmm1, xmm1, xmm2
0x10025b212: vmulss xmm4, xmm1, dword ptr [rip + 0x84b88e] ; 0x100aa6aa8
0x10025b21a: cmp byte ptr [rcx + 0x59d], 0
0x10025b221: vmovss dword ptr [rbp - 0xd0], xmm4
0x10025b229: jne 0x10025b2f9
0x10025b22f: vsubps xmm1, xmm3, xmmword ptr [rbp - 0x150]
0x10025b237: vmulps xmm1, xmm1, xmm1
0x10025b23b: vmovshdup xmm2, xmm1
0x10025b23f: vaddss xmm2, xmm1, xmm2
0x10025b243: vpermilpd xmm1, xmm1, 1
0x10025b249: vaddss xmm1, xmm1, xmm2
0x10025b24d: vsqrtss xmm1, xmm1, xmm1
0x10025b251: vucomiss xmm1, dword ptr [rip + 0x84d357] ; 0x100aa85b0
0x10025b259: jbe 0x10025b2f9
0x10025b25f: vmovss xmm1, dword ptr [rcx + 0x590]
0x10025b267: vaddss xmm1, xmm1, dword ptr [rip + 0x84e415] ; 0x100aa9684
0x10025b26f: vdivss xmm1, xmm1, dword ptr [rip + 0x850575] ; 0x100aab7ec
0x10025b277: vxorps xmm2, xmm2, xmm2
0x10025b27b: vmaxss xmm1, xmm2, xmm1
0x10025b27f: vminss xmm0, xmm0, xmm1
0x10025b283: vmovaps xmm1, xmmword ptr [rcx + 0x570]
0x10025b28b: vsubps xmm1, xmm1, xmmword ptr [rcx + 0x10]
0x10025b290: vpermilps xmm0, xmm0, 0xc0
0x10025b296: vmulps xmm0, xmm1, xmm0
0x10025b29a: vmovaps xmm1, xmmword ptr [rcx + 0x10]
0x10025b29f: vaddps xmm0, xmm1, xmm0
0x10025b2a3: vsubps xmm1, xmm0, xmm1
0x10025b2a7: vmulps xmm1, xmm1, xmm1
0x10025b2ab: vmovshdup xmm2, xmm1
0x10025b2af: vaddss xmm2, xmm1, xmm2
0x10025b2b3: vpermilpd xmm1, xmm1, 1
0x10025b2b9: vaddss xmm1, xmm1, xmm2
0x10025b2bd: vsqrtss xmm1, xmm1, xmm1
0x10025b2c1: vucomiss xmm1, dword ptr [rip + 0x84b7e3] ; 0x100aa6aac
0x10025b2c9: jbe 0x10025b2f9
0x10025b2cb: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x10025b2d3: vmovss xmm0, dword ptr [rip + 0x84d3c1] ; 0x100aa869c
0x10025b2db: vmulss xmm1, xmm0, dword ptr [r13 + 0x18]
0x10025b2e1: vmovd xmm2, edx
0x10025b2e5: vmaxss xmm1, xmm1, xmm2
0x10025b2e9: vmovd edx, xmm1
0x10025b2ed: vmulss xmm4, xmm4, xmm0
0x10025b2f1: vmovss dword ptr [rbp - 0xd0], xmm4
0x10025b2f9: vmovd xmm1, edx
0x10025b2fd: vmovss xmm0, dword ptr [r13 + 0x10]
0x10025b303: vmovss dword ptr [rbp - 0xb0], xmm0
0x10025b30b: lea r12, [rbx + 0x1d0]
0x10025b312: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x10025b317: vmovaps xmmword ptr [rbp - 0x1b0], xmm0
0x10025b31f: vmovups ymm0, ymmword ptr [rcx + 0x20]
0x10025b324: vmovups ymm2, ymmword ptr [rcx + 0x30]
0x10025b329: vmovups ymmword ptr [rbp - 0x190], ymm2
0x10025b331: vmovups ymmword ptr [rbp - 0x1a0], ymm0
0x10025b339: vmovaps xmm0, xmmword ptr [rcx + 0x50]
0x10025b33e: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x10025b346: mov eax, dword ptr [rcx + 0x68]
0x10025b349: mov dword ptr [rbp - 0x158], eax
0x10025b34f: mov rax, qword ptr [rcx + 0x60]
0x10025b353: mov qword ptr [rbp - 0x160], rax
0x10025b35a: lea rsi, [rbp - 0x1b0]
0x10025b361: mov rdi, r12
0x10025b364: vmovss xmm0, dword ptr [rbp - 0x94]
0x10025b36c: vzeroupper 
0x10025b36f: call 0x10062e690 ; 0x10062e690
0x10025b374: lea rsi, [rbp - 0xc0]
0x10025b37b: vmovss xmm0, dword ptr [rip + 0x849d3d] ; 0x100aa50c0
0x10025b383: mov rdi, r12
0x10025b386: vmovaps xmm1, xmm0
0x10025b38a: call 0x10062f710 ; 0x10062f710
0x10025b38f: mov rsi, qword ptr [rbx + 0x10]
0x10025b393: lea rdx, [rip + 0x40b6] ; 0x10025f450
0x10025b39a: vmovss xmm0, dword ptr [rip + 0x84b70a] ; 0x100aa6aac
0x10025b3a2: mov rdi, r12
0x10025b3a5: vmovss xmm1, dword ptr [rip + 0x849d13] ; 0x100aa50c0
0x10025b3ad: vmovaps xmm2, xmm1
0x10025b3b1: vmovaps xmm3, xmm0
0x10025b3b5: vmovss xmm4, dword ptr [rbp - 0xb0]
0x10025b3bd: call 0x10062f800 ; 0x10062f800
0x10025b3c2: lea rdi, [rbp - 0x90]
0x10025b3c9: xor edx, edx
0x10025b3cb: mov rsi, r12
0x10025b3ce: call 0x10062e700 ; 0x10062e700
0x10025b3d3: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10025b3db: vmulps xmm1, xmm0, xmm0
0x10025b3df: vmovshdup xmm2, xmm1
0x10025b3e3: vaddss xmm2, xmm1, xmm2
0x10025b3e7: vpermilpd xmm1, xmm1, 1
0x10025b3ed: vaddss xmm1, xmm1, xmm2
0x10025b3f1: vsqrtss xmm1, xmm1, xmm1
0x10025b3f5: mov rax, qword ptr [rbp - 0xe8]
0x10025b3fc: vmovss dword ptr [rax], xmm1
0x10025b400: vxorps xmm2, xmm2, xmm2
0x10025b404: vucomiss xmm1, xmm2
0x10025b408: vxorps xmm1, xmm1, xmm1
0x10025b40c: jbe 0x10025b469
0x10025b40e: vmovss xmm1, dword ptr [rbp - 0x88]
0x10025b416: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10025b41b: mov rax, qword ptr [rbx + 0x10]
0x10025b41f: vsubss xmm0, xmm0, dword ptr [rax + 0xd0]
0x10025b427: vaddss xmm1, xmm0, dword ptr [rip + 0x84d1d1] ; 0x100aa8600
0x10025b42f: vmovss xmm2, dword ptr [rip + 0x84d581] ; 0x100aa89b8
0x10025b437: vdivss xmm1, xmm1, xmm2
0x10025b43b: vroundss xmm1, xmm1, xmm1, 9
0x10025b441: vmulss xmm1, xmm1, xmm2
0x10025b445: vsubss xmm0, xmm0, xmm1
0x10025b449: vmovss xmm1, dword ptr [rip + 0x849c73] ; 0x100aa50c4
0x10025b451: vmaxss xmm0, xmm1, xmm0
0x10025b455: vmovss xmm1, dword ptr [rip + 0x849c63] ; 0x100aa50c0
0x10025b45d: vminss xmm0, xmm1, xmm0
0x10025b461: vmulss xmm1, xmm0, dword ptr [rbp - 0xd0]
0x10025b469: vmovss dword ptr [r15], xmm1
0x10025b46e: mov rax, qword ptr [rip + 0x9b2463] ; 0x100c0d8d8
0x10025b475: mov rax, qword ptr [rax]
0x10025b478: cmp rax, qword ptr [rbp - 0x30]
0x10025b47c: jne 0x10025b490
0x10025b47e: add rsp, 0x248
0x10025b485: pop rbx
0x10025b486: pop r12
0x10025b488: pop r13
0x10025b48a: pop r14
0x10025b48c: pop r15
0x10025b48e: pop rbp
0x10025b48f: ret 
0x10025b490: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10025b495: nop dword ptr [rax]
