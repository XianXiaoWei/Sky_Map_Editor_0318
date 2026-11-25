0x10005c140: push rbp
0x10005c141: mov rbp, rsp
0x10005c144: push r15
0x10005c146: push r14
0x10005c148: push r13
0x10005c14a: push r12
0x10005c14c: push rbx
0x10005c14d: sub rsp, 0x48
0x10005c151: mov r13, r8
0x10005c154: mov r14, rcx
0x10005c157: mov qword ptr [rbp - 0x50], rdx
0x10005c15b: mov r15, rdi
0x10005c15e: mov rdi, qword ptr [rbp + 0x28]
0x10005c162: call 0x100257030 ; 0x100257030
0x10005c167: mov qword ptr [rbp - 0x58], rax
0x10005c16b: call 0x100255de0 ; 0x100255de0
0x10005c170: mov rbx, rax
0x10005c173: mov qword ptr [rbp - 0x40], 0
0x10005c17b: call 0x10029fe80 ; 0x10029fe80
0x10005c180: mov r8, qword ptr [rax]
0x10005c183: lea rsi, [rbp - 0x40]
0x10005c187: lea rdx, [rbp - 0x58]
0x10005c18b: mov rdi, rax
0x10005c18e: mov rcx, rbx
0x10005c191: call qword ptr [r8 + 0x40]
0x10005c195: cmp qword ptr [rbp - 0x40], 0
0x10005c19a: mov qword ptr [rbp - 0x48], r14
0x10005c19e: je 0x10005c1b3
0x10005c1a0: lea rdi, [rbp - 0x40]
0x10005c1a4: mov rsi, r14
0x10005c1a7: call 0x10076be90 ; 0x10076be90
0x10005c1ac: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10005c1b1: jmp 0x10005c1ea ; 0x10005c1ea
0x10005c1b3: mov rbx, qword ptr [rbp + 0x18]
0x10005c1b7: mov rdi, rbx
0x10005c1ba: call 0x1000ff210 ; 0x1000ff210
0x10005c1bf: test rax, rax
0x10005c1c2: je 0x10005c1a0
0x10005c1c4: mov rdi, rbx
0x10005c1c7: call 0x1000fc260 ; 0x1000fc260
0x10005c1cc: lea rdi, [rbp - 0x70]
0x10005c1d0: mov rsi, rax
0x10005c1d3: call 0x100101420 ; 0x100101420
0x10005c1d8: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10005c1dd: vaddps xmm0, xmm0, xmmword ptr [rip + 0xa4be2b] ; 0x100aa8010
0x10005c1e5: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10005c1ea: vmovaps xmmword ptr [r15 + 0x65570], xmm0
0x10005c1f3: mov r12, qword ptr [rbp + 0x38]
0x10005c1f7: mov rbx, qword ptr [rbp + 0x20]
0x10005c1fb: vmovshdup xmm0, xmm0
0x10005c1ff: vmovss xmm1, dword ptr [rip + 0xa4b5e1] ; 0x100aa77e8
0x10005c207: vucomiss xmm1, xmm0
0x10005c20b: jbe 0x10005c218
0x10005c20d: mov dword ptr [r15 + 0x65574], 0x3dcccccd
0x10005c218: lea rdi, [r15 + 0x66790]
0x10005c21f: mov qword ptr [r15 + 0x667a0], r15
0x10005c226: mov qword ptr [r15 + 0x66798], r13
0x10005c22d: mov esi, dword ptr [r15 + 0x66758]
0x10005c234: call 0x1007e8ed0 ; 0x1007e8ed0
0x10005c239: vmovaps xmm0, xmmword ptr [r15 + 0x65570]
0x10005c242: vmovaps xmmword ptr [r15 + 0x667d0], xmm0
0x10005c24b: lea r13, [r15 + 0x667e8]
0x10005c252: mov esi, 0x800
0x10005c257: mov rdi, r13
0x10005c25a: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10005c25f: mov edx, 0x100
0x10005c264: mov rdi, rbx
0x10005c267: mov rsi, r13
0x10005c26a: call 0x100540c10 ; 0x100540c10
0x10005c26f: mov dword ptr [r15 + 0x66fe8], eax
0x10005c276: vbroadcastss xmm0, dword ptr [r15 + 0x280]
0x10005c27f: vmulps xmm0, xmm0, xmmword ptr [r15 + 0x270]
0x10005c288: vmovaps xmmword ptr [r15 + 0x66ff0], xmm0
0x10005c291: mov rdi, r12
0x10005c294: call 0x100241e10 ; 0x100241e10
0x10005c299: mov r12d, eax
0x10005c29c: and r12d, 0xf
0x10005c2a0: shr eax, 4
0x10005c2a3: xor edx, edx
0x10005c2a5: vmovss xmm0, dword ptr [rip + 0xa4b60f] ; 0x100aa78bc
0x10005c2ad: vmovss xmm1, dword ptr [rip + 0xa4c393] ; 0x100aa8648
0x10005c2b5: vmovss xmm9, dword ptr [rip + 0xa482fb] ; 0x100aa45b8
0x10005c2bd: lea r11, [rip + 0x3f0] ; 0x10005c6b4
0x10005c2c4: vmovss xmm8, dword ptr [rip + 0xa4c354] ; 0x100aa8620
0x10005c2cc: xor r13d, r13d
0x10005c2cf: xor r9d, r9d
0x10005c2d2: nop word ptr cs:[rax + rax]
0x10005c2e0: mov ecx, r9d
0x10005c2e3: vcvtsi2ss xmm5, xmm10, rcx
0x10005c2e8: mov dword ptr [rbp - 0x2c], edx
0x10005c2eb: mov r14d, edx
0x10005c2ee: xor r10d, r10d
0x10005c2f1: nop word ptr cs:[rax + rax]
0x10005c300: mov ecx, r10d
0x10005c303: vcvtsi2ss xmm6, xmm10, rcx
0x10005c308: test r9d, r9d
0x10005c30b: je 0x10005c490
0x10005c311: xor esi, esi
0x10005c313: mov r8d, r14d
0x10005c316: nop word ptr cs:[rax + rax]
0x10005c320: lea ecx, [r13 + rsi]
0x10005c325: mov edi, dword ptr [r15 + 0x667c0]
0x10005c32c: imul edi, eax
0x10005c32f: add edi, r8d
0x10005c332: mov ebx, edi
0x10005c334: shl ebx, 0xd
0x10005c337: xor ebx, edi
0x10005c339: mov edi, ebx
0x10005c33b: imul edi, edi
0x10005c33e: imul edx, edi, 0x3d73
0x10005c344: add edx, 0xc0ae5
0x10005c34a: imul edx, ebx
0x10005c34d: add edx, 0x5208dd0d
0x10005c353: mov edi, edx
0x10005c355: shr edi, 4
0x10005c358: imul rdi, rdi, 0x10040101
0x10005c35f: shr rdi, 0x26
0x10005c363: imul edi, edi, 0x3ff0
0x10005c369: sub edx, edi
0x10005c36b: add edx, r12d
0x10005c36e: vaddss xmm2, xmm6, dword ptr [r15 + rdx*4 + 0x970a0]
0x10005c378: vmulss xmm2, xmm2, xmm0
0x10005c37c: vmulss xmm7, xmm2, xmm1
0x10005c380: mov edi, esi
0x10005c382: vcvtsi2ss xmm2, xmm10, rdi
0x10005c387: vaddss xmm2, xmm2, dword ptr [r15 + rdx*4 + 0xa70a0]
0x10005c391: vmulss xmm2, xmm2, xmm0
0x10005c395: vmulss xmm3, xmm2, xmm1
0x10005c399: vinsertps xmm2, xmm5, xmm7, 0x10
0x10005c39f: vinsertps xmm2, xmm2, xmm3, 0x20
0x10005c3a5: vblendps xmm4, xmm2, xmm4, 8
0x10005c3ab: mov rdx, qword ptr [r15 + 0x66770]
0x10005c3b2: shl rcx, 4
0x10005c3b6: vmovaps xmmword ptr [rdx + rcx], xmm4
0x10005c3bb: lea edi, [r9 - 1]
0x10005c3bf: cmp edi, 4
0x10005c3c2: ja 0x10005c692
0x10005c3c8: movsxd rdx, dword ptr [r11 + rdi*4]
0x10005c3cc: add rdx, r11
0x10005c3cf: jmp rdx
0x10005c3d1: vsubss xmm2, xmm9, xmm3
0x10005c3d5: vaddss xmm3, xmm7, xmm8
0x10005c3da: vinsertps xmm2, xmm8, xmm2, 0x10
0x10005c3e0: jmp 0x10005c438 ; 0x10005c438
0x10005c3e2: vsubss xmm2, xmm9, xmm7
0x10005c3e6: vsubss xmm3, xmm9, xmm3
0x10005c3ea: vinsertps xmm2, xmm2, xmm3, 0x10
0x10005c3f0: vinsertps xmm3, xmm2, dword ptr [rip + 0xa4c226], 0x20 ; 0x100aa8620
0x10005c3fa: jmp 0x10005c43e ; 0x10005c43e
0x10005c3fc: vaddss xmm2, xmm7, xmm8
0x10005c401: vsubss xmm3, xmm9, xmm3
0x10005c405: vinsertps xmm2, xmm2, xmm8, 0x10
0x10005c40b: jmp 0x10005c438 ; 0x10005c438
0x10005c40d: vaddss xmm2, xmm7, xmm8
0x10005c412: vsubss xmm3, xmm9, xmm3
0x10005c416: vinsertps xmm2, xmm2, xmm3, 0x10
0x10005c41c: vinsertps xmm3, xmm2, xmm9, 0x20
0x10005c422: jmp 0x10005c43e ; 0x10005c43e
0x10005c424: vaddss xmm2, xmm7, xmm8
0x10005c429: vaddss xmm3, xmm3, xmm8
0x10005c42e: vinsertps xmm2, xmm2, dword ptr [rip + 0xa48180], 0x10 ; 0x100aa45b8
0x10005c438: vinsertps xmm3, xmm2, xmm3, 0x20
0x10005c43e: vmulps xmm2, xmm3, xmm3
0x10005c442: vmovshdup xmm7, xmm2
0x10005c446: vaddss xmm7, xmm2, xmm7
0x10005c44a: vpermilpd xmm2, xmm2, 1
0x10005c450: vaddss xmm2, xmm2, xmm7
0x10005c454: vrsqrtss xmm2, xmm2, xmm2
0x10005c458: vpermilps xmm2, xmm2, 0xc0
0x10005c45e: vmulps xmm2, xmm3, xmm2
0x10005c462: mov rdx, qword ptr [r15 + 0x66778]
0x10005c469: vmovaps xmmword ptr [rdx + rcx], xmm2
0x10005c46e: inc esi
0x10005c470: add r8d, 8
0x10005c474: cmp esi, 8
0x10005c477: jb 0x10005c320
0x10005c47d: add r13d, esi
0x10005c480: jmp 0x10005c59d ; 0x10005c59d
0x10005c485: nop word ptr cs:[rax + rax]
0x10005c490: xor ecx, ecx
0x10005c492: mov ebx, r14d
0x10005c495: mov edx, r14d
0x10005c498: nop dword ptr [rax + rax]
0x10005c4a0: lea esi, [r13 + rcx]
0x10005c4a5: mov edi, dword ptr [r15 + 0x667c0]
0x10005c4ac: imul edi, eax
0x10005c4af: add edi, edx
0x10005c4b1: mov r14d, edi
0x10005c4b4: shl r14d, 0xd
0x10005c4b8: xor r14d, edi
0x10005c4bb: mov edi, r14d
0x10005c4be: imul edi, edi
0x10005c4c1: imul r8d, edi, 0x3d73
0x10005c4c8: add r8d, 0xc0ae5
0x10005c4cf: imul r8d, r14d
0x10005c4d3: add r8d, 0x5208dd0d
0x10005c4da: mov edi, r8d
0x10005c4dd: shr edi, 4
0x10005c4e0: imul rdi, rdi, 0x10040101
0x10005c4e7: shr rdi, 0x26
0x10005c4eb: imul edi, edi, 0x3ff0
0x10005c4f1: sub r8d, edi
0x10005c4f4: add r8d, r12d
0x10005c4f7: vaddss xmm3, xmm6, dword ptr [r15 + r8*4 + 0x970a0]
0x10005c501: mov edi, ecx
0x10005c503: vmulss xmm3, xmm3, xmm0
0x10005c507: vcvtsi2ss xmm7, xmm10, rdi
0x10005c50c: vaddss xmm7, xmm7, dword ptr [r15 + r8*4 + 0xa70a0]
0x10005c516: vmulss xmm7, xmm7, xmm0
0x10005c51a: vmulss xmm3, xmm3, xmm1
0x10005c51e: vmulss xmm7, xmm7, xmm1
0x10005c522: vinsertps xmm2, xmm5, xmm3, 0x10
0x10005c528: vinsertps xmm2, xmm2, xmm7, 0x20
0x10005c52e: vblendps xmm4, xmm2, xmm4, 8
0x10005c534: mov rdi, qword ptr [r15 + 0x66770]
0x10005c53b: shl rsi, 4
0x10005c53f: vsubss xmm2, xmm9, xmm7
0x10005c543: vmovaps xmmword ptr [rdi + rsi], xmm4
0x10005c548: vsubss xmm3, xmm9, xmm3
0x10005c54c: vinsertps xmm2, xmm9, xmm2, 0x10
0x10005c552: vinsertps xmm2, xmm2, xmm3, 0x20
0x10005c558: vmulps xmm3, xmm2, xmm2
0x10005c55c: vmovshdup xmm7, xmm3
0x10005c560: vaddss xmm7, xmm3, xmm7
0x10005c564: vpermilpd xmm3, xmm3, 1
0x10005c56a: vaddss xmm3, xmm3, xmm7
0x10005c56e: vrsqrtss xmm3, xmm3, xmm3
0x10005c572: vpermilps xmm3, xmm3, 0xc0
0x10005c578: vmulps xmm2, xmm2, xmm3
0x10005c57c: mov rdi, qword ptr [r15 + 0x66778]
0x10005c583: inc ecx
0x10005c585: add edx, 8
0x10005c588: cmp ecx, 8
0x10005c58b: vmovaps xmmword ptr [rdi + rsi], xmm2
0x10005c590: jne 0x10005c4a0
0x10005c596: add r13d, 8
0x10005c59a: mov r14d, ebx
0x10005c59d: inc r10d
0x10005c5a0: inc r14d
0x10005c5a3: cmp r10d, 8
0x10005c5a7: jb 0x10005c300
0x10005c5ad: inc r9d
0x10005c5b0: mov edx, dword ptr [rbp - 0x2c]
0x10005c5b3: add edx, 0x40
0x10005c5b6: cmp r9d, 6
0x10005c5ba: jb 0x10005c2e0
0x10005c5c0: mov rax, qword ptr [rbp - 0x50]
0x10005c5c4: vmovss xmm0, dword ptr [rax + 0x14]
0x10005c5c9: vmovss xmm1, dword ptr [rax + 0x20]
0x10005c5ce: lea rax, [rip + 0x1f9eafb] ; 0x101ffb0d0
0x10005c5d5: cmp byte ptr [rax], 0
0x10005c5d8: je 0x10005c5e7
0x10005c5da: lea rax, [rip + 0xc5bf5f] ; 0x100cb8540
0x10005c5e1: vmovss xmm2, dword ptr [rax]
0x10005c5e5: jmp 0x10005c5ef ; 0x10005c5ef
0x10005c5e7: vmovss xmm2, dword ptr [rip + 0xa48ad1] ; 0x100aa50c0
0x10005c5ef: mov rax, qword ptr [rbp - 0x48]
0x10005c5f3: vmulss xmm1, xmm1, xmm2
0x10005c5f7: vmulss xmm0, xmm0, xmm1
0x10005c5fb: vmovss xmm1, dword ptr [rip + 0xa4a499] ; 0x100aa6a9c
0x10005c603: vmaxss xmm0, xmm1, xmm0
0x10005c607: vmovss xmm1, dword ptr [rip + 0xa4a491] ; 0x100aa6aa0
0x10005c60f: vminss xmm0, xmm1, xmm0
0x10005c613: vmovaps xmm1, xmmword ptr [rax + 0x150]
0x10005c61b: vmulps xmm1, xmm1, xmmword ptr [rip + 0xa4b93d] ; 0x100aa7f60
0x10005c623: vaddps xmm1, xmm1, xmmword ptr [rax + 0x140]
0x10005c62b: vxorps xmm2, xmm2, xmm2
0x10005c62f: vmulps xmm2, xmm2, xmmword ptr [rax + 0x160]
0x10005c637: vaddps xmm1, xmm2, xmm1
0x10005c63b: vpermilps xmm0, xmm0, 0xc0
0x10005c641: vmulps xmm0, xmm1, xmm0
0x10005c645: vmovaps xmm1, xmmword ptr [r15 + 0x656c0]
0x10005c64e: vsubps xmm0, xmm1, xmm0
0x10005c652: vmovaps xmmword ptr [r15 + 0x656c0], xmm0
0x10005c65b: mov byte ptr [r15 + 0x97070], 1
0x10005c663: mov rax, qword ptr [r15 + 0x66798]
0x10005c66a: inc dword ptr [rax + 0x92034]
0x10005c670: add r15, 0x97040
0x10005c677: mov rdi, qword ptr [rbp + 0x10]
0x10005c67b: mov rsi, r15
0x10005c67e: call 0x10079e480 ; 0x10079e480
0x10005c683: add rsp, 0x48
0x10005c687: pop rbx
0x10005c688: pop r12
0x10005c68a: pop r13
0x10005c68c: pop r14
0x10005c68e: pop r15
0x10005c690: pop rbp
0x10005c691: ret 
0x10005c692: lea rdi, [rip + 0xb46993] ; 0x100ba302c false
0x10005c699: lea rsi, [rip + 0xb05785] ; 0x100b61e25 Ambience.cpp
0x10005c6a0: mov edx, 0x141
0x10005c6a5: mov ecx, 3
0x10005c6aa: call 0x1007e5f70 ; 0x1007e5f70
0x10005c6af: ud2 
0x10005c6b1: nop dword ptr [rax]
