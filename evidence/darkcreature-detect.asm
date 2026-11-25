0x10026d410: push rbp
0x10026d411: mov rbp, rsp
0x10026d414: push r15
0x10026d416: push r14
0x10026d418: push r13
0x10026d41a: push r12
0x10026d41c: push rbx
0x10026d41d: sub rsp, 0x1e8
0x10026d424: mov r13, r9
0x10026d427: vmovss dword ptr [rbp - 0xb4], xmm0
0x10026d42f: mov qword ptr [rbp - 0x118], rdx
0x10026d436: mov qword ptr [rbp - 0x120], rsi
0x10026d43d: mov r14, rdi
0x10026d440: mov rax, qword ptr [rip + 0x9a0491] ; 0x100c0d8d8
0x10026d447: mov rax, qword ptr [rax]
0x10026d44a: mov qword ptr [rbp - 0x30], rax
0x10026d44e: mov eax, dword ptr [r14 + 0x2c8]
0x10026d455: mov dword ptr [rbp - 0xc8], eax
0x10026d45b: mov eax, dword ptr [r14 + 0x2cc]
0x10026d462: mov qword ptr [rbp - 0x168], rax
0x10026d469: lea r15, [rbp - 0xb0]
0x10026d470: mov edx, 1
0x10026d475: mov rdi, rcx
0x10026d478: mov rsi, r15
0x10026d47b: call 0x1001032a0 ; 0x1001032a0
0x10026d480: mov ebx, eax
0x10026d482: mov rsi, qword ptr [r14 + 0x228]
0x10026d489: lea rdi, [rbp - 0x110]
0x10026d490: call 0x1007f26b0 ; 0x1007f26b0
0x10026d495: mov rsi, qword ptr [r14 + 0x210]
0x10026d49c: lea rdi, [rbp - 0x1d0]
0x10026d4a3: call 0x1007f26b0 ; 0x1007f26b0
0x10026d4a8: mov rsi, qword ptr [r14 + 0x218]
0x10026d4af: lea rdi, [rbp - 0x1c0]
0x10026d4b6: call 0x1007f26b0 ; 0x1007f26b0
0x10026d4bb: vmovddup xmm0, qword ptr [rip + 0x847505] ; 0x100ab49c8
0x10026d4c3: vmovapd xmmword ptr [rbp - 0xe0], xmm0
0x10026d4cb: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x110]
0x10026d4d3: vmovaps xmmword ptr [rbp - 0x1b0], xmm0
0x10026d4db: mov rsi, qword ptr [r14 + 0x220]
0x10026d4e2: lea rdi, [rbp - 0x160]
0x10026d4e9: call 0x1007f26b0 ; 0x1007f26b0
0x10026d4ee: vmovss xmm1, dword ptr [rbp - 0xb4]
0x10026d4f6: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x10026d4fe: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x160]
0x10026d506: vmovaps xmmword ptr [rbp - 0x1a0], xmm0
0x10026d50e: test ebx, ebx
0x10026d510: je 0x10026d952
0x10026d516: vmulss xmm0, xmm1, xmm1
0x10026d51a: vmovss dword ptr [rbp - 0x140], xmm0
0x10026d522: mov ebx, ebx
0x10026d524: mov dword ptr [rbp - 0xbc], 0
0x10026d52e: vmovss xmm0, dword ptr [rip + 0x83a382] ; 0x100aa78b8
0x10026d536: vmovss dword ptr [rbp - 0xe0], xmm0
0x10026d53e: mov dword ptr [rbp - 0xcc], 0
0x10026d548: vmovaps xmm0, xmm1
0x10026d54c: jmp 0x10026d660 ; 0x10026d660
0x10026d551: mov dword ptr [rbp - 0xcc], r12d
0x10026d558: vmovss xmm0, dword ptr [rbp - 0xb8]
0x10026d560: vmovss dword ptr [rbp - 0xe0], xmm0
0x10026d568: mov al, 1
0x10026d56a: mov dword ptr [rbp - 0xbc], eax
0x10026d570: vmovss xmm0, dword ptr [rbp - 0xb4]
0x10026d578: add r15, 8
0x10026d57c: dec rbx
0x10026d57f: jne 0x10026d660
0x10026d585: jmp 0x10026d92d ; 0x10026d92d
0x10026d58a: vmovss dword ptr [rbp - 0xc0], xmm2
0x10026d592: vmovss dword ptr [rbp - 0xb8], xmm3
0x10026d59a: vmovss dword ptr [rbp - 0xe4], xmm7
0x10026d5a2: vmovss xmm0, dword ptr [rbp - 0xb4]
0x10026d5aa: vmovaps xmmword ptr [rbp - 0x130], xmm6
0x10026d5b2: vmovss dword ptr [rbp - 0xc4], xmm1
0x10026d5ba: vmovaps xmmword ptr [rbp - 0x100], xmm4
0x10026d5c2: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10026d5c7: vmovaps xmm1, xmmword ptr [rbp - 0x130]
0x10026d5cf: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x100]
0x10026d5d7: vmovshdup xmm2, xmm1
0x10026d5db: vaddss xmm2, xmm1, xmm2
0x10026d5df: vpermilpd xmm1, xmm1, 1
0x10026d5e5: vaddss xmm1, xmm1, xmm2
0x10026d5e9: vmovss dword ptr [rbp - 0x100], xmm1
0x10026d5f1: call 0x100aa260c ; 0x100aa260c _cosf
0x10026d5f6: vmovss xmm3, dword ptr [rbp - 0x100]
0x10026d5fe: vmovss xmm2, dword ptr [rbp - 0xc4]
0x10026d606: vdivss xmm1, xmm3, xmm2
0x10026d60a: vucomiss xmm2, xmm1
0x10026d60e: jbe 0x10026d570
0x10026d614: vdivss xmm1, xmm3, dword ptr [rbp - 0xc0]
0x10026d61c: vdivss xmm1, xmm1, xmm2
0x10026d620: vucomiss xmm1, xmm0
0x10026d624: jbe 0x10026d570
0x10026d62a: vmovss xmm0, dword ptr [rbp - 0xe0]
0x10026d632: vmovss xmm3, dword ptr [rbp - 0xb8]
0x10026d63a: vucomiss xmm0, xmm3
0x10026d63e: vmovaps xmm6, xmmword ptr [rbp - 0x130]
0x10026d646: vmovss xmm7, dword ptr [rbp - 0xe4]
0x10026d64e: ja 0x10026d873
0x10026d654: jmp 0x10026d570 ; 0x10026d570
0x10026d659: nop dword ptr [rax]
0x10026d660: mov r12, qword ptr [r15]
0x10026d663: test r12, r12
0x10026d666: je 0x10026d920
0x10026d66c: mov rax, qword ptr [r12]
0x10026d670: mov rdi, r12
0x10026d673: call qword ptr [rax + 0x10]
0x10026d676: test al, al
0x10026d678: je 0x10026d570
0x10026d67e: mov rax, qword ptr [r12 + 0x30]
0x10026d683: vmovss xmm0, dword ptr [rip + 0x83d2b5] ; 0x100aaa940
0x10026d68b: vucomiss xmm0, dword ptr [rax + 8]
0x10026d690: vmovss xmm4, dword ptr [rip + 0x83f310] ; 0x100aac9a8
0x10026d698: vmovss xmm5, dword ptr [rip + 0x83a138] ; 0x100aa77d8
0x10026d6a0: ja 0x10026d570
0x10026d6a6: mov rax, qword ptr [r12 + 0x18]
0x10026d6ab: vmovaps xmm1, xmmword ptr [rax + 0x10]
0x10026d6b0: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x10026d6b8: vsubps xmm6, xmm1, xmm0
0x10026d6bc: vmulps xmm2, xmm6, xmm6
0x10026d6c0: vmovshdup xmm3, xmm2
0x10026d6c4: vaddss xmm3, xmm2, xmm3
0x10026d6c8: vpermilpd xmm2, xmm2, 1
0x10026d6ce: vaddss xmm7, xmm2, xmm3
0x10026d6d2: vaddss xmm2, xmm7, xmm4
0x10026d6d6: vucomiss xmm5, xmm2
0x10026d6da: vmovaps xmm3, xmm5
0x10026d6de: jae 0x10026d873
0x10026d6e4: vsubps xmm2, xmm1, xmmword ptr [rbp - 0x1d0]
0x10026d6ec: vmulps xmm2, xmm2, xmm2
0x10026d6f0: vmovshdup xmm3, xmm2
0x10026d6f4: vaddss xmm3, xmm2, xmm3
0x10026d6f8: vpermilpd xmm2, xmm2, 1
0x10026d6fe: vaddss xmm2, xmm2, xmm3
0x10026d702: vaddss xmm2, xmm2, xmm4
0x10026d706: vucomiss xmm5, xmm2
0x10026d70a: vmovaps xmm3, xmm5
0x10026d70e: jae 0x10026d873
0x10026d714: vsubps xmm2, xmm1, xmmword ptr [rbp - 0x1c0]
0x10026d71c: vmulps xmm2, xmm2, xmm2
0x10026d720: vmovshdup xmm3, xmm2
0x10026d724: vaddss xmm3, xmm2, xmm3
0x10026d728: vpermilpd xmm2, xmm2, 1
0x10026d72e: vaddss xmm2, xmm2, xmm3
0x10026d732: vaddss xmm2, xmm2, xmm4
0x10026d736: vucomiss xmm5, xmm2
0x10026d73a: vmovaps xmm3, xmm5
0x10026d73e: jae 0x10026d873
0x10026d744: vsubps xmm2, xmm1, xmmword ptr [rbp - 0x160]
0x10026d74c: vmulps xmm2, xmm2, xmm2
0x10026d750: vmovshdup xmm3, xmm2
0x10026d754: vaddss xmm3, xmm2, xmm3
0x10026d758: vpermilpd xmm2, xmm2, 1
0x10026d75e: vaddss xmm2, xmm2, xmm3
0x10026d762: vaddss xmm2, xmm2, xmm4
0x10026d766: vmovss xmm3, dword ptr [rip + 0x83be86] ; 0x100aa95f4
0x10026d76e: vucomiss xmm3, xmm2
0x10026d772: vmovaps xmm3, xmm5
0x10026d776: jae 0x10026d873
0x10026d77c: vsubps xmm2, xmm1, xmmword ptr [rbp - 0x1b0]
0x10026d784: vmulps xmm2, xmm2, xmm2
0x10026d788: vmovshdup xmm3, xmm2
0x10026d78c: vaddss xmm3, xmm2, xmm3
0x10026d790: vpermilpd xmm2, xmm2, 1
0x10026d796: vaddss xmm2, xmm2, xmm3
0x10026d79a: vaddss xmm2, xmm2, xmm4
0x10026d79e: vmovss xmm3, dword ptr [rip + 0x83a11a] ; 0x100aa78c0
0x10026d7a6: vucomiss xmm3, xmm2
0x10026d7aa: vmovaps xmm3, xmm5
0x10026d7ae: jae 0x10026d873
0x10026d7b4: vsubps xmm2, xmm1, xmmword ptr [rbp - 0x1a0]
0x10026d7bc: vmulps xmm2, xmm2, xmm2
0x10026d7c0: vmovshdup xmm3, xmm2
0x10026d7c4: vaddss xmm3, xmm2, xmm3
0x10026d7c8: vpermilpd xmm2, xmm2, 1
0x10026d7ce: vaddss xmm2, xmm2, xmm3
0x10026d7d2: vaddss xmm2, xmm2, xmm4
0x10026d7d6: vmovss xmm3, dword ptr [rip + 0x83a0e2] ; 0x100aa78c0
0x10026d7de: vucomiss xmm3, xmm2
0x10026d7e2: vmovaps xmm3, xmm5
0x10026d7e6: jae 0x10026d873
0x10026d7ec: mov rax, qword ptr [rbp - 0x118]
0x10026d7f3: vmovaps xmm2, xmmword ptr [rax]
0x10026d7f7: vsubps xmm1, xmm1, xmm2
0x10026d7fb: vmulps xmm1, xmm1, xmm1
0x10026d7ff: vmovshdup xmm3, xmm1
0x10026d803: vaddss xmm3, xmm1, xmm3
0x10026d807: vpermilpd xmm1, xmm1, 1
0x10026d80d: vaddss xmm1, xmm1, xmm3
0x10026d811: vaddss xmm3, xmm1, xmm4
0x10026d815: vmovss xmm1, dword ptr [rbp - 0x140]
0x10026d81d: vucomiss xmm1, xmm3
0x10026d821: jae 0x10026d861
0x10026d823: vsubps xmm4, xmm2, xmm0
0x10026d827: vmulps xmm0, xmm4, xmm4
0x10026d82b: vmovshdup xmm1, xmm0
0x10026d82f: vaddss xmm1, xmm0, xmm1
0x10026d833: vpermilpd xmm0, xmm0, 1
0x10026d839: vaddss xmm0, xmm0, xmm1
0x10026d83d: vsqrtss xmm1, xmm0, xmm0
0x10026d841: vmovss xmm0, dword ptr [rip + 0x839253] ; 0x100aa6a9c
0x10026d849: vucomiss xmm0, xmm1
0x10026d84d: ja 0x10026d570
0x10026d853: vsqrtss xmm2, xmm7, xmm7
0x10026d857: vucomiss xmm0, xmm2
0x10026d85b: jbe 0x10026d58a
0x10026d861: vmovss xmm0, dword ptr [rbp - 0xe0]
0x10026d869: vucomiss xmm0, xmm3
0x10026d86d: jbe 0x10026d570
0x10026d873: mov r12d, dword ptr [r12 + 0xe0]
0x10026d87b: vsqrtss xmm0, xmm7, xmm7
0x10026d87f: vucomiss xmm0, dword ptr [rip + 0x839215] ; 0x100aa6a9c
0x10026d887: vmovss dword ptr [rbp - 0xb8], xmm3
0x10026d88f: jbe 0x10026d89b
0x10026d891: vpermilps xmm1, xmm0, 0xc0
0x10026d897: vdivps xmm6, xmm6, xmm1
0x10026d89b: vmovaps xmmword ptr [rbp - 0x150], xmm6
0x10026d8a3: movabs rax, 0x2a00000001
0x10026d8ad: mov qword ptr [rbp - 0x188], rax
0x10026d8b4: mov byte ptr [rbp - 0x180], 1
0x10026d8bb: lea rax, [rbp - 0x178]
0x10026d8c2: vxorps xmm1, xmm1, xmm1
0x10026d8c6: vmovups xmmword ptr [rax], xmm1
0x10026d8ca: mov rdi, qword ptr [rbp + 0x10]
0x10026d8ce: lea rsi, [rbp - 0x110]
0x10026d8d5: lea rdx, [rbp - 0x150]
0x10026d8dc: lea rcx, [rbp - 0x188]
0x10026d8e3: lea r8, [rbp - 0x210]
0x10026d8ea: call 0x100776a90 ; 0x100776a90
0x10026d8ef: test al, al
0x10026d8f1: je 0x10026d551
0x10026d8f7: cmp dword ptr [rbp - 0xc8], r12d
0x10026d8fe: vmovss xmm0, dword ptr [rbp - 0xb4]
0x10026d906: jne 0x10026d920
0x10026d908: mov rax, qword ptr [rbp - 0x120]
0x10026d90f: cmp byte ptr [rax], 1
0x10026d912: jne 0x10026d920
0x10026d914: mov byte ptr [r14 + 0x2d0], 1
0x10026d91c: nop dword ptr [rax]
0x10026d920: add r15, 8
0x10026d924: dec rbx
0x10026d927: jne 0x10026d660
0x10026d92d: mov r12d, dword ptr [r13 + 0x210]
0x10026d934: test r12, r12
0x10026d937: je 0x10026d986
0x10026d939: vmulss xmm0, xmm0, xmm0
0x10026d93d: vmovss dword ptr [rbp - 0xc8], xmm0
0x10026d945: mov r15d, 0xffffffff
0x10026d94b: xor ebx, ebx
0x10026d94d: jmp 0x10026da70 ; 0x10026da70
0x10026d952: vmovss xmm0, dword ptr [rip + 0x839f5e] ; 0x100aa78b8
0x10026d95a: vmovss dword ptr [rbp - 0xe0], xmm0
0x10026d962: mov dword ptr [rbp - 0xcc], 0
0x10026d96c: mov dword ptr [rbp - 0xbc], 0
0x10026d976: vmovaps xmm0, xmm1
0x10026d97a: mov r12d, dword ptr [r13 + 0x210]
0x10026d981: test r12, r12
0x10026d984: jne 0x10026d939
0x10026d986: mov r15d, 0xffffffff
0x10026d98c: mov ecx, dword ptr [rbp - 0xbc]
0x10026d992: cmp cl, 1
0x10026d995: jne 0x10026dd6b
0x10026d99b: mov eax, dword ptr [rbp - 0xcc]
0x10026d9a1: mov dword ptr [r14 + 0x2c8], eax
0x10026d9a8: jmp 0x10026dd77 ; 0x10026dd77
0x10026d9ad: vmovss dword ptr [rbp - 0xc0], xmm0
0x10026d9b5: vmovaps xmmword ptr [rbp - 0x130], xmm2
0x10026d9bd: vmovss dword ptr [rbp - 0x100], xmm8
0x10026d9c5: vmovaps xmmword ptr [rbp - 0x140], xmm7
0x10026d9cd: vmovss xmm0, dword ptr [rbp - 0xb4]
0x10026d9d5: vmovss dword ptr [rbp - 0xb8], xmm4
0x10026d9dd: vmovss dword ptr [rbp - 0xc4], xmm1
0x10026d9e5: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10026d9ea: call 0x100aa260c ; 0x100aa260c _cosf
0x10026d9ef: vmovss xmm4, dword ptr [rbp - 0xb8]
0x10026d9f7: vmovss xmm1, dword ptr [rbp - 0xe0]
0x10026d9ff: vucomiss xmm1, xmm4
0x10026da03: jbe 0x10026dd50
0x10026da09: vmovaps xmm7, xmmword ptr [rbp - 0x140]
0x10026da11: vmulps xmm1, xmm7, xmmword ptr [rbp - 0x130]
0x10026da19: vmovshdup xmm2, xmm1
0x10026da1d: vaddss xmm2, xmm1, xmm2
0x10026da21: vpermilpd xmm1, xmm1, 1
0x10026da27: vaddss xmm1, xmm1, xmm2
0x10026da2b: vmovss xmm3, dword ptr [rbp - 0xc4]
0x10026da33: vdivss xmm2, xmm1, xmm3
0x10026da37: vucomiss xmm3, xmm2
0x10026da3b: vmovaps xmm2, xmm3
0x10026da3f: jbe 0x10026dd50
0x10026da45: vdivss xmm1, xmm1, dword ptr [rbp - 0xc0]
0x10026da4d: vdivss xmm1, xmm1, xmm2
0x10026da51: vucomiss xmm1, xmm0
0x10026da55: vmovss xmm6, dword ptr [rip + 0x83903f] ; 0x100aa6a9c
0x10026da5d: vmovss xmm8, dword ptr [rbp - 0x100]
0x10026da65: ja 0x10026dc93
0x10026da6b: jmp 0x10026dd50 ; 0x10026dd50
0x10026da70: cmp rbx, 0x3f
0x10026da74: ja 0x10026dd50
0x10026da7a: mov rsi, qword ptr [r13 + rbx*8 + 0x10]
0x10026da7f: test rsi, rsi
0x10026da82: je 0x10026dd50
0x10026da88: cmp byte ptr [rsi + 0xd0], 0
0x10026da8f: je 0x10026dd50
0x10026da95: mov rax, qword ptr [rsi + 0x78]
0x10026da99: vmovss xmm0, dword ptr [rax + 0x18]
0x10026da9e: vmovss dword ptr [rbp - 0xb8], xmm0
0x10026daa6: mov rax, qword ptr [rsi]
0x10026daa9: lea rdi, [rbp - 0x150]
0x10026dab0: call qword ptr [rax + 0x58]
0x10026dab3: vmovss xmm6, dword ptr [rip + 0x838fe1] ; 0x100aa6a9c
0x10026dabb: vmovss xmm5, dword ptr [rip + 0x839d15] ; 0x100aa77d8
0x10026dac3: vmovaps xmm1, xmmword ptr [rbp - 0x150]
0x10026dacb: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x10026dad3: vsubps xmm7, xmm1, xmm0
0x10026dad7: vmulps xmm2, xmm7, xmm7
0x10026dadb: vmovshdup xmm3, xmm2
0x10026dadf: vaddss xmm3, xmm2, xmm3
0x10026dae3: vpermilpd xmm2, xmm2, 1
0x10026dae9: vaddss xmm8, xmm2, xmm3
0x10026daed: vmovss xmm2, dword ptr [rbp - 0xb8]
0x10026daf5: vmulss xmm2, xmm2, xmm2
0x10026daf9: vsubss xmm3, xmm8, xmm2
0x10026dafd: vucomiss xmm5, xmm3
0x10026db01: vmovaps xmm4, xmm5
0x10026db05: jae 0x10026dc93
0x10026db0b: vsubps xmm3, xmm1, xmmword ptr [rbp - 0x1d0]
0x10026db13: vmulps xmm3, xmm3, xmm3
0x10026db17: vmovshdup xmm4, xmm3
0x10026db1b: vaddss xmm4, xmm3, xmm4
0x10026db1f: vpermilpd xmm3, xmm3, 1
0x10026db25: vaddss xmm3, xmm3, xmm4
0x10026db29: vsubss xmm3, xmm3, xmm2
0x10026db2d: vucomiss xmm5, xmm3
0x10026db31: vmovaps xmm4, xmm5
0x10026db35: jae 0x10026dc93
0x10026db3b: vsubps xmm3, xmm1, xmmword ptr [rbp - 0x1c0]
0x10026db43: vmulps xmm3, xmm3, xmm3
0x10026db47: vmovshdup xmm4, xmm3
0x10026db4b: vaddss xmm4, xmm3, xmm4
0x10026db4f: vpermilpd xmm3, xmm3, 1
0x10026db55: vaddss xmm3, xmm3, xmm4
0x10026db59: vsubss xmm3, xmm3, xmm2
0x10026db5d: vucomiss xmm5, xmm3
0x10026db61: vmovaps xmm4, xmm5
0x10026db65: jae 0x10026dc93
0x10026db6b: vsubps xmm3, xmm1, xmmword ptr [rbp - 0x160]
0x10026db73: vmulps xmm3, xmm3, xmm3
0x10026db77: vmovshdup xmm4, xmm3
0x10026db7b: vaddss xmm4, xmm3, xmm4
0x10026db7f: vpermilpd xmm3, xmm3, 1
0x10026db85: vaddss xmm3, xmm3, xmm4
0x10026db89: vsubss xmm3, xmm3, xmm2
0x10026db8d: vmovss xmm4, dword ptr [rip + 0x83ba5f] ; 0x100aa95f4
0x10026db95: vucomiss xmm4, xmm3
0x10026db99: vmovaps xmm4, xmm5
0x10026db9d: jae 0x10026dc93
0x10026dba3: vsubps xmm3, xmm1, xmmword ptr [rbp - 0x1b0]
0x10026dbab: vmulps xmm3, xmm3, xmm3
0x10026dbaf: vmovshdup xmm4, xmm3
0x10026dbb3: vaddss xmm4, xmm3, xmm4
0x10026dbb7: vpermilpd xmm3, xmm3, 1
0x10026dbbd: vaddss xmm3, xmm3, xmm4
0x10026dbc1: vsubss xmm3, xmm3, xmm2
0x10026dbc5: vmovss xmm4, dword ptr [rip + 0x839cf3] ; 0x100aa78c0
0x10026dbcd: vucomiss xmm4, xmm3
0x10026dbd1: vmovaps xmm4, xmm5
0x10026dbd5: jae 0x10026dc93
0x10026dbdb: vsubps xmm3, xmm1, xmmword ptr [rbp - 0x1a0]
0x10026dbe3: vmulps xmm3, xmm3, xmm3
0x10026dbe7: vmovshdup xmm4, xmm3
0x10026dbeb: vaddss xmm4, xmm3, xmm4
0x10026dbef: vpermilpd xmm3, xmm3, 1
0x10026dbf5: vaddss xmm3, xmm3, xmm4
0x10026dbf9: vsubss xmm3, xmm3, xmm2
0x10026dbfd: vmovss xmm4, dword ptr [rip + 0x839cbb] ; 0x100aa78c0
0x10026dc05: vucomiss xmm4, xmm3
0x10026dc09: vmovaps xmm4, xmm5
0x10026dc0d: jae 0x10026dc93
0x10026dc13: mov rax, qword ptr [rbp - 0x118]
0x10026dc1a: vmovaps xmm3, xmmword ptr [rax]
0x10026dc1e: vsubps xmm1, xmm1, xmm3
0x10026dc22: vmulps xmm1, xmm1, xmm1
0x10026dc26: vmovshdup xmm4, xmm1
0x10026dc2a: vaddss xmm4, xmm1, xmm4
0x10026dc2e: vpermilpd xmm1, xmm1, 1
0x10026dc34: vaddss xmm1, xmm1, xmm4
0x10026dc38: vsubss xmm4, xmm1, xmm2
0x10026dc3c: vmovss xmm1, dword ptr [rbp - 0xc8]
0x10026dc44: vucomiss xmm1, xmm4
0x10026dc48: jae 0x10026dc81
0x10026dc4a: vsubps xmm2, xmm3, xmm0
0x10026dc4e: vmulps xmm0, xmm2, xmm2
0x10026dc52: vmovshdup xmm1, xmm0
0x10026dc56: vaddss xmm1, xmm0, xmm1
0x10026dc5a: vpermilpd xmm0, xmm0, 1
0x10026dc60: vaddss xmm0, xmm0, xmm1
0x10026dc64: vsqrtss xmm1, xmm0, xmm0
0x10026dc68: vucomiss xmm6, xmm1
0x10026dc6c: ja 0x10026dd50
0x10026dc72: vsqrtss xmm0, xmm8, xmm8
0x10026dc77: vucomiss xmm6, xmm0
0x10026dc7b: jbe 0x10026d9ad
0x10026dc81: vmovss xmm0, dword ptr [rbp - 0xe0]
0x10026dc89: vucomiss xmm0, xmm4
0x10026dc8d: jbe 0x10026dd50
0x10026dc93: vsqrtss xmm0, xmm8, xmm8
0x10026dc98: vucomiss xmm0, xmm6
0x10026dc9c: vmovss dword ptr [rbp - 0xb8], xmm4
0x10026dca4: jbe 0x10026dcb0
0x10026dca6: vpermilps xmm1, xmm0, 0xc0
0x10026dcac: vdivps xmm7, xmm7, xmm1
0x10026dcb0: vmovaps xmmword ptr [rbp - 0x1e0], xmm7
0x10026dcb8: movabs rax, 0x2a00000001
0x10026dcc2: mov qword ptr [rbp - 0x188], rax
0x10026dcc9: mov byte ptr [rbp - 0x180], 1
0x10026dcd0: lea rax, [rbp - 0x178]
0x10026dcd7: vxorps xmm1, xmm1, xmm1
0x10026dcdb: vmovups xmmword ptr [rax], xmm1
0x10026dcdf: mov rdi, qword ptr [rbp + 0x10]
0x10026dce3: lea rsi, [rbp - 0x110]
0x10026dcea: lea rdx, [rbp - 0x1e0]
0x10026dcf1: lea rcx, [rbp - 0x188]
0x10026dcf8: lea r8, [rbp - 0x210]
0x10026dcff: call 0x100776a90 ; 0x100776a90
0x10026dd04: test al, al
0x10026dd06: je 0x10026dd2f
0x10026dd08: cmp qword ptr [rbp - 0x168], rbx
0x10026dd0f: jne 0x10026dd25
0x10026dd11: mov rax, qword ptr [rbp - 0x120]
0x10026dd18: cmp byte ptr [rax], 2
0x10026dd1b: jne 0x10026dd25
0x10026dd1d: mov byte ptr [r14 + 0x2d0], 1
0x10026dd25: vmovss xmm0, dword ptr [rbp - 0xe0]
0x10026dd2d: jmp 0x10026dd42 ; 0x10026dd42
0x10026dd2f: mov al, 2
0x10026dd31: mov dword ptr [rbp - 0xbc], eax
0x10026dd37: mov r15d, ebx
0x10026dd3a: vmovss xmm0, dword ptr [rbp - 0xb8]
0x10026dd42: vmovss dword ptr [rbp - 0xe0], xmm0
0x10026dd4a: nop word ptr [rax + rax]
0x10026dd50: inc rbx
0x10026dd53: cmp r12, rbx
0x10026dd56: jne 0x10026da70
0x10026dd5c: mov ecx, dword ptr [rbp - 0xbc]
0x10026dd62: cmp cl, 1
0x10026dd65: je 0x10026d99b
0x10026dd6b: cmp cl, 2
0x10026dd6e: jne 0x10026dd7f
0x10026dd70: mov dword ptr [r14 + 0x2cc], r15d
0x10026dd77: mov byte ptr [r14 + 0x2d0], 0
0x10026dd7f: mov rax, qword ptr [rip + 0x99fb52] ; 0x100c0d8d8
0x10026dd86: mov rax, qword ptr [rax]
0x10026dd89: cmp rax, qword ptr [rbp - 0x30]
0x10026dd8d: jne 0x10026dda4
0x10026dd8f: movzx eax, cl
0x10026dd92: add rsp, 0x1e8
0x10026dd99: pop rbx
0x10026dd9a: pop r12
0x10026dd9c: pop r13
0x10026dd9e: pop r14
0x10026dda0: pop r15
0x10026dda2: pop rbp
0x10026dda3: ret 
0x10026dda4: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10026dda9: nop dword ptr [rax]
