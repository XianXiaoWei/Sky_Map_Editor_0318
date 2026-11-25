0x1005acaf0: push rbp
0x1005acaf1: mov rbp, rsp
0x1005acaf4: push r15
0x1005acaf6: push r14
0x1005acaf8: push r13
0x1005acafa: push r12
0x1005acafc: push rbx
0x1005acafd: sub rsp, 0xb8
0x1005acb04: mov qword ptr [rbp - 0xa0], rsi
0x1005acb0b: mov rax, qword ptr [rip + 0x660dc6] ; 0x100c0d8d8
0x1005acb12: mov rax, qword ptr [rax]
0x1005acb15: mov qword ptr [rbp - 0x30], rax
0x1005acb19: cmp byte ptr [rip + 0x7478a0], 0 ; 0x100cf43c0
0x1005acb20: je 0x1005acf0d
0x1005acb26: mov eax, dword ptr [rdi + 0x24]
0x1005acb29: test rax, rax
0x1005acb2c: je 0x1005acbf2
0x1005acb32: lea rdx, [rax - 1]
0x1005acb36: mov ecx, eax
0x1005acb38: and ecx, 7
0x1005acb3b: cmp rdx, 7
0x1005acb3f: jae 0x1005acb51
0x1005acb41: xor edx, edx
0x1005acb43: test rcx, rcx
0x1005acb46: jne 0x1005acbc1
0x1005acb4c: jmp 0x1005acbf2 ; 0x1005acbf2
0x1005acb51: mov rsi, rax
0x1005acb54: sub rsi, rcx
0x1005acb57: lea rbx, [rdi + 0x17a2c]
0x1005acb5e: xor edx, edx
0x1005acb60: mov dword ptr [rbx - 0x174c0], 0
0x1005acb6a: mov dword ptr [rbx - 0x13f80], 0
0x1005acb74: mov dword ptr [rbx - 0x10a40], 0
0x1005acb7e: mov dword ptr [rbx - 0xd500], 0
0x1005acb88: mov dword ptr [rbx - 0x9fc0], 0
0x1005acb92: mov dword ptr [rbx - 0x6a80], 0
0x1005acb9c: mov dword ptr [rbx - 0x3540], 0
0x1005acba6: mov dword ptr [rbx], 0
0x1005acbac: add rdx, 8
0x1005acbb0: add rbx, 0x1aa00
0x1005acbb7: cmp rsi, rdx
0x1005acbba: jne 0x1005acb60
0x1005acbbc: test rcx, rcx
0x1005acbbf: je 0x1005acbf2
0x1005acbc1: imul rdx, rdx, 0x3540
0x1005acbc8: lea rdx, [rdi + rdx + 0x56c]
0x1005acbd0: neg rcx
0x1005acbd3: nop word ptr cs:[rax + rax]
0x1005acbe0: mov dword ptr [rdx], 0
0x1005acbe6: add rdx, 0x3540
0x1005acbed: inc rcx
0x1005acbf0: jne 0x1005acbe0
0x1005acbf2: mov rcx, qword ptr [rbp - 0xa0]
0x1005acbf9: mov rcx, qword ptr [rcx + 0x70]
0x1005acbfd: vmovaps xmm0, xmmword ptr [rcx + 0x1c0]
0x1005acc05: vmovaps xmm6, xmmword ptr [rcx + 0x1d0]
0x1005acc0d: vmovapd xmm1, xmmword ptr [rcx + 0x1e0]
0x1005acc15: vmovaps xmm2, xmmword ptr [rcx + 0x1f0]
0x1005acc1d: vinsertps xmm3, xmm0, xmm6, 0x1c
0x1005acc23: vunpcklpd xmm3, xmm3, xmm1
0x1005acc27: vinsertps xmm3, xmm3, xmm2, 0x30
0x1005acc2d: vinsertps xmm9, xmm6, xmm0, 0x4c
0x1005acc33: vunpckhps xmm5, xmm0, xmm6
0x1005acc37: vblendpd xmm5, xmm1, xmm5, 1
0x1005acc3d: vshufps xmm6, xmm6, xmm0, 0x33
0x1005acc42: vshufps xmm0, xmm6, xmm0, 0xe2
0x1005acc47: vinsertps xmm0, xmm0, xmm1, 0xe8
0x1005acc4d: vblendps xmm0, xmm0, xmm2, 8
0x1005acc53: vaddps xmm7, xmm0, xmm3
0x1005acc57: vmulps xmm6, xmm7, xmm7
0x1005acc5b: vmovshdup xmm4, xmm6
0x1005acc5f: vaddss xmm4, xmm6, xmm4
0x1005acc63: vpermilpd xmm6, xmm6, 1
0x1005acc69: vaddss xmm6, xmm6, xmm4
0x1005acc6d: vxorps xmm8, xmm8, xmm8
0x1005acc72: vucomiss xmm6, xmm8
0x1005acc77: jbe 0x1005acc87
0x1005acc79: vsqrtss xmm4, xmm6, xmm6
0x1005acc7d: vpermilps xmm4, xmm4, 0
0x1005acc83: vdivps xmm7, xmm7, xmm4
0x1005acc87: vinsertps xmm4, xmm9, xmm1, 0x68
0x1005acc8d: vinsertps xmm1, xmm5, xmm2, 0xb0
0x1005acc93: vmovaps xmmword ptr [rbp - 0x90], xmm7
0x1005acc9b: vsubps xmm3, xmm0, xmm3
0x1005acc9f: vmulps xmm5, xmm3, xmm3
0x1005acca3: vmovshdup xmm6, xmm5
0x1005acca7: vaddss xmm6, xmm5, xmm6
0x1005accab: vpermilpd xmm5, xmm5, 1
0x1005accb1: vaddss xmm5, xmm5, xmm6
0x1005accb5: vucomiss xmm5, xmm8
0x1005accba: jbe 0x1005accca
0x1005accbc: vsqrtss xmm5, xmm5, xmm5
0x1005accc0: vpermilps xmm5, xmm5, 0
0x1005accc6: vdivps xmm3, xmm3, xmm5
0x1005accca: vinsertps xmm2, xmm4, xmm2, 0x70
0x1005accd0: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x1005accd5: vaddps xmm4, xmm0, xmm1
0x1005accd9: vmulps xmm3, xmm4, xmm4
0x1005accdd: vmovshdup xmm5, xmm3
0x1005acce1: vaddss xmm5, xmm3, xmm5
0x1005acce5: vpermilpd xmm3, xmm3, 1
0x1005acceb: vaddss xmm5, xmm3, xmm5
0x1005accef: vxorps xmm3, xmm3, xmm3
0x1005accf3: vucomiss xmm5, xmm3
0x1005accf7: jbe 0x1005acd07
0x1005accf9: vsqrtss xmm5, xmm5, xmm5
0x1005accfd: vpermilps xmm5, xmm5, 0
0x1005acd03: vdivps xmm4, xmm4, xmm5
0x1005acd07: vmovaps xmmword ptr [rbp - 0x70], xmm4
0x1005acd0c: vaddps xmm4, xmm0, xmm2
0x1005acd10: vmulps xmm5, xmm4, xmm4
0x1005acd14: vmovshdup xmm6, xmm5
0x1005acd18: vaddss xmm6, xmm5, xmm6
0x1005acd1c: vpermilpd xmm5, xmm5, 1
0x1005acd22: vaddss xmm5, xmm5, xmm6
0x1005acd26: vucomiss xmm5, xmm3
0x1005acd2a: jbe 0x1005acd3a
0x1005acd2c: vsqrtss xmm3, xmm5, xmm5
0x1005acd30: vpermilps xmm3, xmm3, 0
0x1005acd36: vdivps xmm4, xmm4, xmm3
0x1005acd3a: vmovaps xmmword ptr [rbp - 0x60], xmm4
0x1005acd3f: vsubps xmm3, xmm0, xmm2
0x1005acd43: vmulps xmm2, xmm3, xmm3
0x1005acd47: vmovshdup xmm4, xmm2
0x1005acd4b: vaddss xmm4, xmm2, xmm4
0x1005acd4f: vpermilpd xmm2, xmm2, 1
0x1005acd55: vaddss xmm4, xmm2, xmm4
0x1005acd59: vxorps xmm2, xmm2, xmm2
0x1005acd5d: vucomiss xmm4, xmm2
0x1005acd61: jbe 0x1005acd71
0x1005acd63: vsqrtss xmm4, xmm4, xmm4
0x1005acd67: vpermilps xmm4, xmm4, 0
0x1005acd6d: vdivps xmm3, xmm3, xmm4
0x1005acd71: vmovaps xmmword ptr [rbp - 0x50], xmm3
0x1005acd76: vsubps xmm0, xmm0, xmm1
0x1005acd7a: vmulps xmm1, xmm0, xmm0
0x1005acd7e: vmovshdup xmm3, xmm1
0x1005acd82: vaddss xmm3, xmm1, xmm3
0x1005acd86: vpermilpd xmm1, xmm1, 1
0x1005acd8c: vaddss xmm1, xmm1, xmm3
0x1005acd90: vucomiss xmm1, xmm2
0x1005acd94: jbe 0x1005acda4
0x1005acd96: vsqrtss xmm1, xmm1, xmm1
0x1005acd9a: vpermilps xmm1, xmm1, 0
0x1005acda0: vdivps xmm0, xmm0, xmm1
0x1005acda4: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1005acda9: cmp dword ptr [rdi + 0x18], 0
0x1005acdad: mov qword ptr [rbp - 0x98], rdi
0x1005acdb4: je 0x1005acee3
0x1005acdba: mov rax, qword ptr [rdi + 0x641f0]
0x1005acdc1: lea rcx, [rdi + 0x30]
0x1005acdc5: mov qword ptr [rbp - 0xa8], rcx
0x1005acdcc: xor ebx, ebx
0x1005acdce: xor r15d, r15d
0x1005acdd1: nop word ptr cs:[rax + rax]
0x1005acde0: mov ebx, ebx
0x1005acde2: lea r14, [rbx + rbx*2]
0x1005acde6: shl r14, 4
0x1005acdea: vmovaps xmm0, xmmword ptr [rax + r14]
0x1005acdf0: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1005acdf8: vmovaps xmm0, xmmword ptr [rax + r14 + 0x10]
0x1005acdff: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1005ace07: lea rdi, [rbp - 0x90]
0x1005ace0e: lea rsi, [rbp - 0xd0]
0x1005ace15: lea rdx, [rbp - 0xc0]
0x1005ace1c: call 0x100567510 ; 0x100567510
0x1005ace21: mov rdi, qword ptr [rbp - 0x98]
0x1005ace28: test al, al
0x1005ace2a: je 0x1005acec9
0x1005ace30: mov rax, qword ptr [rbp - 0xa0]
0x1005ace37: mov rsi, qword ptr [rax + 0x70]
0x1005ace3b: lea r12, [rbp - 0xe0]
0x1005ace42: mov rdi, r12
0x1005ace45: call 0x10076be90 ; 0x10076be90
0x1005ace4a: mov rax, qword ptr [rbp - 0x98]
0x1005ace51: mov rsi, qword ptr [rax + 0x641f0]
0x1005ace58: lea rdx, [rsi + r14 + 0x10]
0x1005ace5d: add rsi, r14
0x1005ace60: mov rdi, r12
0x1005ace63: vmovss xmm0, dword ptr [rip + 0x4ffb01] ; 0x100aac96c
0x1005ace6b: call 0x10078b5d0 ; 0x10078b5d0
0x1005ace70: mov rdi, qword ptr [rbp - 0x98]
0x1005ace77: test al, al
0x1005ace79: je 0x1005acec9
0x1005ace7b: mov r12, qword ptr [rbp - 0xa8]
0x1005ace82: xor r13d, r13d
0x1005ace85: nop word ptr cs:[rax + rax]
0x1005ace90: mov rax, qword ptr [rdi + 0x641f0]
0x1005ace97: mov ecx, dword ptr [rax + r14 + 0x24]
0x1005ace9c: bt ecx, r13d
0x1005acea0: jae 0x1005aceb9
0x1005acea2: mov edx, dword ptr [rax + r14 + 0x20]
0x1005acea7: mov rdi, r12
0x1005aceaa: mov esi, r15d
0x1005acead: call 0x1007f6ae0 ; 0x1007f6ae0
0x1005aceb2: mov rdi, qword ptr [rbp - 0x98]
0x1005aceb9: inc r13
0x1005acebc: add r12, 0x3540
0x1005acec3: cmp r13, 0x1e
0x1005acec7: jne 0x1005ace90
0x1005acec9: mov rax, qword ptr [rdi + 0x641f0]
0x1005aced0: add r15d, dword ptr [rax + r14 + 0x20]
0x1005aced5: inc ebx
0x1005aced7: cmp ebx, dword ptr [rdi + 0x18]
0x1005aceda: jb 0x1005acde0
0x1005acee0: mov eax, dword ptr [rdi + 0x24]
0x1005acee3: test eax, eax
0x1005acee5: je 0x1005acf0d
0x1005acee7: lea r14, [rdi + 0x30]
0x1005aceeb: xor ebx, ebx
0x1005aceed: nop dword ptr [rax]
0x1005acef0: mov rdi, r14
0x1005acef3: call 0x1007f6540 ; 0x1007f6540
0x1005acef8: add r14, 0x3540
0x1005aceff: inc ebx
0x1005acf01: mov rax, qword ptr [rbp - 0x98]
0x1005acf08: cmp dword ptr [rax + 0x24], ebx
0x1005acf0b: ja 0x1005acef0
0x1005acf0d: mov rax, qword ptr [rip + 0x6609c4] ; 0x100c0d8d8
0x1005acf14: mov rax, qword ptr [rax]
0x1005acf17: cmp rax, qword ptr [rbp - 0x30]
0x1005acf1b: jne 0x1005acf2f
0x1005acf1d: add rsp, 0xb8
0x1005acf24: pop rbx
0x1005acf25: pop r12
0x1005acf27: pop r13
0x1005acf29: pop r14
0x1005acf2b: pop r15
0x1005acf2d: pop rbp
0x1005acf2e: ret 
0x1005acf2f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1005acf34: nop word ptr cs:[rax + rax]
