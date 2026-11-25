0x10025bc10: push rbp
0x10025bc11: mov rbp, rsp
0x10025bc14: push r15
0x10025bc16: push r14
0x10025bc18: push r13
0x10025bc1a: push r12
0x10025bc1c: push rbx
0x10025bc1d: sub rsp, 0x338
0x10025bc24: mov r12, rsi
0x10025bc27: mov r15, rdi
0x10025bc2a: mov rdi, qword ptr [r12 + 0x280]
0x10025bc32: call 0x1000fc260 ; 0x1000fc260
0x10025bc37: mov rbx, rax
0x10025bc3a: mov rax, qword ptr [r15 + 0x4e0]
0x10025bc41: mov cl, byte ptr [r15 + 0xd8]
0x10025bc48: mov byte ptr [rax + 0x32d], cl
0x10025bc4e: test cl, cl
0x10025bc50: je 0x10025e504
0x10025bc56: mov eax, dword ptr [r15 + 0x500]
0x10025bc5d: cmp eax, dword ptr [rip + 0xacf74d] ; 0x100d2b3b0
0x10025bc63: je 0x10025bc91
0x10025bc65: mov rdi, qword ptr [r12 + 0x280]
0x10025bc6d: mov dword ptr [rbp - 0x120], eax
0x10025bc73: lea rsi, [rbp - 0x120]
0x10025bc7a: call 0x100101e20 ; 0x100101e20
0x10025bc7f: test rax, rax
0x10025bc82: jne 0x10025bc91
0x10025bc84: mov eax, dword ptr [rip + 0xacf726] ; 0x100d2b3b0
0x10025bc8a: mov dword ptr [r15 + 0x500], eax
0x10025bc91: lea rax, [rip + 0x1d9f438] ; 0x101ffb0d0
0x10025bc98: cmp byte ptr [rax], 0
0x10025bc9b: mov qword ptr [rbp - 0xd8], rbx
0x10025bca2: je 0x10025bcb1
0x10025bca4: lea rax, [rip + 0xa5c895] ; 0x100cb8540
0x10025bcab: vmovss xmm0, dword ptr [rax]
0x10025bcaf: jmp 0x10025bcb9 ; 0x10025bcb9
0x10025bcb1: vmovss xmm0, dword ptr [rip + 0x849407] ; 0x100aa50c0
0x10025bcb9: mov rax, qword ptr [r12 + 0x160]
0x10025bcc1: mov rcx, qword ptr [r12 + 0x178]
0x10025bcc9: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x10025bcce: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x10025bcd3: vmovss dword ptr [rbp - 0x40], xmm0
0x10025bcd8: mov rax, qword ptr [rcx + 0x20]
0x10025bcdc: mov ecx, dword ptr [r15 + 0x598]
0x10025bce3: cmp ecx, dword ptr [rax + 0x7d18]
0x10025bce9: sete byte ptr [r15 + 0x59d]
0x10025bcf1: mov dword ptr [rbp - 0x48], 0
0x10025bcf8: mov dword ptr [rbp - 0x44], 0
0x10025bcff: mov rdi, qword ptr [r12 + 0x138]
0x10025bd07: lea r13, [r15 + 0x10]
0x10025bd0b: vmovaps xmm0, xmmword ptr [r15 + 0x10]
0x10025bd11: vaddps xmm0, xmm0, xmmword ptr [rip + 0x84c387] ; 0x100aa80a0
0x10025bd19: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x10025bd21: vmovaps xmm0, xmmword ptr [rip + 0x84d5b7] ; 0x100aa92e0
0x10025bd29: vmovaps xmmword ptr [rbp - 0x1b0], xmm0
0x10025bd31: lea rsi, [rbp - 0x90]
0x10025bd38: lea rdx, [rbp - 0x1b0]
0x10025bd3f: vmovss xmm0, dword ptr [rip + 0x84d49d] ; 0x100aa91e4
0x10025bd47: lea r8, [rbp - 0x320]
0x10025bd4e: xor ecx, ecx
0x10025bd50: call 0x100776a90 ; 0x100776a90
0x10025bd55: test al, al
0x10025bd57: je 0x10025c088
0x10025bd5d: mov rax, qword ptr [rbp - 0x2f8]
0x10025bd64: vmovaps xmm0, xmmword ptr [rax + 0x30]
0x10025bd69: vmovaps xmmword ptr [rbp - 0x2f0], xmm0
0x10025bd71: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x10025bd76: vmovaps xmmword ptr [rbp - 0x2e0], xmm0
0x10025bd7e: vmovaps xmm0, xmmword ptr [rax + 0x50]
0x10025bd83: vmovaps xmmword ptr [rbp - 0x2d0], xmm0
0x10025bd8b: vmovaps xmm0, xmmword ptr [rax + 0x60]
0x10025bd90: vmovaps xmmword ptr [rbp - 0x2c0], xmm0
0x10025bd98: vmovaps xmm0, xmmword ptr [rax + 0x70]
0x10025bd9d: vmovaps xmmword ptr [rbp - 0x210], xmm0
0x10025bda5: vmovaps xmm0, xmmword ptr [rax + 0x80]
0x10025bdad: vmovaps xmmword ptr [rbp - 0x200], xmm0
0x10025bdb5: vmovaps xmm0, xmmword ptr [rax + 0x90]
0x10025bdbd: vmovaps xmmword ptr [rbp - 0x1f0], xmm0
0x10025bdc5: vmovaps xmm0, xmmword ptr [rax + 0xa0]
0x10025bdcd: vmovaps xmmword ptr [rbp - 0x1e0], xmm0
0x10025bdd5: lea rbx, [rbp - 0x1b0]
0x10025bddc: lea rsi, [rbp - 0x210]
0x10025bde3: mov rdi, rbx
0x10025bde6: call 0x100076940 ; 0x100076940
0x10025bdeb: lea rdi, [rbp - 0x90]
0x10025bdf2: lea rsi, [rbp - 0x2f0]
0x10025bdf9: mov rdx, rbx
0x10025bdfc: call 0x100076df0 ; 0x100076df0
0x10025be01: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x10025be09: vmovaps xmm3, xmmword ptr [rbp - 0x80]
0x10025be0e: vmovaps xmm9, xmmword ptr [rbp - 0x70]
0x10025be13: vmovaps xmm8, xmmword ptr [rbp - 0x60]
0x10025be18: vaddps xmm4, xmm1, xmmword ptr [rip + 0x850090] ; 0x100aabeb0
0x10025be20: vandps xmm5, xmm4, xmmword ptr [rip + 0x84bae8] ; 0x100aa7910
0x10025be28: vucomiss xmm5, dword ptr [rip + 0x84c784] ; 0x100aa85b4
0x10025be30: jae 0x10025bfe8
0x10025be36: vmovshdup xmm5, xmm4
0x10025be3a: vandps xmm5, xmm5, xmmword ptr [rip + 0x84bace] ; 0x100aa7910
0x10025be42: vucomiss xmm5, dword ptr [rip + 0x84c76a] ; 0x100aa85b4
0x10025be4a: jae 0x10025bfe8
0x10025be50: vpermilpd xmm5, xmm4, 1
0x10025be56: vandpd xmm5, xmm5, xmmword ptr [rip + 0x84bab2] ; 0x100aa7910
0x10025be5e: vucomiss xmm5, dword ptr [rip + 0x84c74e] ; 0x100aa85b4
0x10025be66: jae 0x10025bfe8
0x10025be6c: vpermilps xmm4, xmm4, 0xe7
0x10025be72: vandps xmm4, xmm4, xmmword ptr [rip + 0x84ba96] ; 0x100aa7910
0x10025be7a: vucomiss xmm4, dword ptr [rip + 0x84c732] ; 0x100aa85b4
0x10025be82: jae 0x10025bfe8
0x10025be88: vaddps xmm4, xmm3, xmmword ptr [rip + 0x850030] ; 0x100aabec0
0x10025be90: vandps xmm5, xmm4, xmmword ptr [rip + 0x84ba78] ; 0x100aa7910
0x10025be98: vucomiss xmm5, dword ptr [rip + 0x84c714] ; 0x100aa85b4
0x10025bea0: jae 0x10025bfe8
0x10025bea6: vmovshdup xmm5, xmm4
0x10025beaa: vandps xmm5, xmm5, xmmword ptr [rip + 0x84ba5e] ; 0x100aa7910
0x10025beb2: vucomiss xmm5, dword ptr [rip + 0x84c6fa] ; 0x100aa85b4
0x10025beba: jae 0x10025bfe8
0x10025bec0: vpermilpd xmm5, xmm4, 1
0x10025bec6: vandpd xmm5, xmm5, xmmword ptr [rip + 0x84ba42] ; 0x100aa7910
0x10025bece: vucomiss xmm5, dword ptr [rip + 0x84c6de] ; 0x100aa85b4
0x10025bed6: jae 0x10025bfe8
0x10025bedc: vpermilps xmm4, xmm4, 0xe7
0x10025bee2: vandps xmm4, xmm4, xmmword ptr [rip + 0x84ba26] ; 0x100aa7910
0x10025beea: vucomiss xmm4, dword ptr [rip + 0x84c6c2] ; 0x100aa85b4
0x10025bef2: jae 0x10025bfe8
0x10025bef8: vaddps xmm4, xmm9, xmmword ptr [rip + 0x84ffd0] ; 0x100aabed0
0x10025bf00: vandps xmm5, xmm4, xmmword ptr [rip + 0x84ba08] ; 0x100aa7910
0x10025bf08: vucomiss xmm5, dword ptr [rip + 0x84c6a4] ; 0x100aa85b4
0x10025bf10: jae 0x10025bfe8
0x10025bf16: vmovshdup xmm5, xmm4
0x10025bf1a: vandps xmm5, xmm5, xmmword ptr [rip + 0x84b9ee] ; 0x100aa7910
0x10025bf22: vucomiss xmm5, dword ptr [rip + 0x84c68a] ; 0x100aa85b4
0x10025bf2a: jae 0x10025bfe8
0x10025bf30: vpermilpd xmm5, xmm4, 1
0x10025bf36: vandpd xmm5, xmm5, xmmword ptr [rip + 0x84b9d2] ; 0x100aa7910
0x10025bf3e: vucomiss xmm5, dword ptr [rip + 0x84c66e] ; 0x100aa85b4
0x10025bf46: jae 0x10025bfe8
0x10025bf4c: vpermilps xmm4, xmm4, 0xe7
0x10025bf52: vandps xmm4, xmm4, xmmword ptr [rip + 0x84b9b6] ; 0x100aa7910
0x10025bf5a: vucomiss xmm4, dword ptr [rip + 0x84c652] ; 0x100aa85b4
0x10025bf62: jae 0x10025bfe8
0x10025bf68: vaddps xmm4, xmm8, xmmword ptr [rip + 0x84ff70] ; 0x100aabee0
0x10025bf70: vandps xmm5, xmm4, xmmword ptr [rip + 0x84b998] ; 0x100aa7910
0x10025bf78: vucomiss xmm5, dword ptr [rip + 0x84c634] ; 0x100aa85b4
0x10025bf80: jae 0x10025bfe8
0x10025bf82: vmovshdup xmm5, xmm4
0x10025bf86: vandps xmm5, xmm5, xmmword ptr [rip + 0x84b982] ; 0x100aa7910
0x10025bf8e: vucomiss xmm5, dword ptr [rip + 0x84c61e] ; 0x100aa85b4
0x10025bf96: jae 0x10025bfe8
0x10025bf98: vpermilpd xmm5, xmm4, 1
0x10025bf9e: vandpd xmm5, xmm5, xmmword ptr [rip + 0x84b96a] ; 0x100aa7910
0x10025bfa6: vucomiss xmm5, dword ptr [rip + 0x84c606] ; 0x100aa85b4
0x10025bfae: jae 0x10025bfe8
0x10025bfb0: vpermilps xmm4, xmm4, 0xe7
0x10025bfb6: vandps xmm4, xmm4, xmmword ptr [rip + 0x84b952] ; 0x100aa7910
0x10025bfbe: vucomiss xmm4, dword ptr [rip + 0x84c5ee] ; 0x100aa85b4
0x10025bfc6: jae 0x10025bfe8
0x10025bfc8: vmovss xmm1, dword ptr [rip + 0x8490f0] ; 0x100aa50c0
0x10025bfd0: vmovaps xmm8, xmmword ptr [rip + 0x84ca28] ; 0x100aa8a00
0x10025bfd8: vmovaps xmm9, xmmword ptr [rip + 0x84ca50] ; 0x100aa8a30
0x10025bfe0: vmovaps xmm3, xmmword ptr [rip + 0x84c0b8] ; 0x100aa80a0
0x10025bfe8: vmovaps xmm4, xmmword ptr [r13]
0x10025bfee: vmulss xmm5, xmm1, xmm4
0x10025bff2: vmovshdup xmm6, xmm4
0x10025bff6: vmulss xmm7, xmm3, xmm6
0x10025bffa: vaddss xmm5, xmm5, xmm7
0x10025bffe: vpermilpd xmm7, xmm4, 1
0x10025c004: vmulss xmm0, xmm9, xmm7
0x10025c008: vaddss xmm0, xmm0, xmm5
0x10025c00c: vaddss xmm0, xmm8, xmm0
0x10025c010: vmovshdup xmm5, xmm1
0x10025c014: vmulss xmm5, xmm5, xmm4
0x10025c018: vmovshdup xmm2, xmm3
0x10025c01c: vmulss xmm2, xmm2, xmm6
0x10025c020: vaddss xmm2, xmm5, xmm2
0x10025c024: vmovshdup xmm5, xmm9
0x10025c029: vmulss xmm5, xmm5, xmm7
0x10025c02d: vaddss xmm2, xmm5, xmm2
0x10025c031: vmovshdup xmm5, xmm8
0x10025c036: vaddss xmm2, xmm5, xmm2
0x10025c03a: vpermilpd xmm1, xmm1, 1
0x10025c040: vmulss xmm1, xmm1, xmm4
0x10025c044: vpermilpd xmm3, xmm3, 1
0x10025c04a: vmulss xmm3, xmm3, xmm6
0x10025c04e: vaddss xmm1, xmm1, xmm3
0x10025c052: vpermilpd xmm3, xmm9, 1
0x10025c058: vmulss xmm3, xmm3, xmm7
0x10025c05c: vaddss xmm1, xmm3, xmm1
0x10025c060: vpermilpd xmm3, xmm8, 1
0x10025c066: vaddss xmm1, xmm3, xmm1
0x10025c06a: vinsertps xmm0, xmm0, xmm2, 0x10
0x10025c070: vinsertps xmm0, xmm0, xmm1, 0x20
0x10025c076: vxorps xmm1, xmm1, xmm1
0x10025c07a: vmulps xmm1, xmm4, xmm1
0x10025c07e: vaddps xmm0, xmm1, xmm0
0x10025c082: vmovaps xmmword ptr [r13], xmm0
0x10025c088: vmovss xmm0, dword ptr [rip + 0x84aa0c] ; 0x100aa6a9c
0x10025c090: vmaxss xmm0, xmm0, dword ptr [rbp - 0x40]
0x10025c095: vmovss dword ptr [rbp - 0x40], xmm0
0x10025c09a: mov rsi, qword ptr [r12 + 0x2c8]
0x10025c0a2: lea rdi, [rbp - 0x2b0]
0x10025c0a9: mov rdx, r13
0x10025c0ac: call 0x100328200 ; 0x100328200
0x10025c0b1: vmovaps xmm1, xmmword ptr [rbp - 0x2b0]
0x10025c0b9: vmovaps xmm0, xmmword ptr [r15 + 0x50]
0x10025c0bf: vsubps xmm1, xmm1, xmm0
0x10025c0c3: vmulps xmm2, xmm1, xmm1
0x10025c0c7: vmovshdup xmm3, xmm2
0x10025c0cb: vaddss xmm3, xmm2, xmm3
0x10025c0cf: vpermilpd xmm2, xmm2, 1
0x10025c0d5: vaddss xmm2, xmm2, xmm3
0x10025c0d9: vsqrtss xmm3, xmm2, xmm2
0x10025c0dd: vucomiss xmm3, dword ptr [rip + 0x84b7df] ; 0x100aa78c4
0x10025c0e5: jbe 0x10025c0f1
0x10025c0e7: vpermilps xmm3, xmm3, 0xc0
0x10025c0ed: vdivps xmm1, xmm1, xmm3
0x10025c0f1: vmovss xmm3, dword ptr [rip + 0x84a9a7] ; 0x100aa6aa0
0x10025c0f9: vminss xmm3, xmm3, dword ptr [rbp - 0x40]
0x10025c0fe: vmovaps xmmword ptr [rbp - 0xd0], xmm3
0x10025c106: vpermilps xmm2, xmm2, 0xc0
0x10025c10c: vmulps xmm1, xmm2, xmm1
0x10025c110: vmulps xmm1, xmm1, xmmword ptr [rip + 0x857ae8] ; 0x100ab3c00
0x10025c118: vmulps xmm2, xmm1, xmm1
0x10025c11c: vmovshdup xmm3, xmm2
0x10025c120: vaddss xmm3, xmm2, xmm3
0x10025c124: vpermilpd xmm2, xmm2, 1
0x10025c12a: vaddss xmm2, xmm2, xmm3
0x10025c12e: vsqrtss xmm2, xmm2, xmm2
0x10025c132: vucomiss xmm2, dword ptr [rip + 0x84a972] ; 0x100aa6aac
0x10025c13a: jbe 0x10025c1c5
0x10025c140: mov byte ptr [r15 + 0x504], 1
0x10025c148: cmp byte ptr [r15 + 0x59d], 0
0x10025c150: je 0x10025c1c5
0x10025c152: vucomiss xmm2, dword ptr [rip + 0x84a94e] ; 0x100aa6aa8
0x10025c15a: vpermilps xmm3, xmmword ptr [rbp - 0xd0], 0xc0
0x10025c164: vinsertps xmm2, xmm1, xmm2, 0x10
0x10025c16a: vblendpd xmm1, xmm1, xmm2, 1
0x10025c170: vmulps xmm1, xmm3, xmm1
0x10025c174: vmulps xmm1, xmm1, xmmword ptr [rip + 0x84ded4] ; 0x100aaa050
0x10025c17c: mov rax, qword ptr [r15 + 0x80]
0x10025c183: vbroadcastss xmm2, dword ptr [rax + 0x10]
0x10025c189: vdivps xmm1, xmm1, xmm2
0x10025c18d: vaddps xmm0, xmm0, xmm1
0x10025c191: vmovaps xmmword ptr [r15 + 0x50], xmm0
0x10025c197: jbe 0x10025c1c5
0x10025c199: mov dword ptr [r15 + 0x140], 0xa
0x10025c1a4: vxorps xmm1, xmm1, xmm1
0x10025c1a8: vmovups xmmword ptr [r15 + 0x148], xmm1
0x10025c1b1: vmovaps xmmword ptr [r15 + 0x160], xmm1
0x10025c1ba: mov dword ptr [r15 + 0x170], 0
0x10025c1c5: vmovss xmm1, dword ptr [r15 + 0x4d0]
0x10025c1ce: vsubss xmm1, xmm1, dword ptr [rbp - 0xd0]
0x10025c1d6: vmovss dword ptr [r15 + 0x4d0], xmm1
0x10025c1df: vxorps xmm2, xmm2, xmm2
0x10025c1e3: vucomiss xmm1, xmm2
0x10025c1e7: jbe 0x10025c207
0x10025c1e9: vmovss xmm1, dword ptr [rip + 0x84b603] ; 0x100aa77f4
0x10025c1f1: vmulss xmm0, xmm0, xmm1
0x10025c1f5: vmovss dword ptr [r15 + 0x50], xmm0
0x10025c1fb: vmulss xmm0, xmm1, dword ptr [r15 + 0x58]
0x10025c201: vmovss dword ptr [r15 + 0x58], xmm0
0x10025c207: cmp dword ptr [r15 + 0x140], 9
0x10025c20f: jne 0x10025c660
0x10025c215: mov rax, qword ptr [r12 + 0x370]
0x10025c21d: mov ecx, dword ptr [rax + 0x514]
0x10025c223: cmp rcx, 0x1f
0x10025c227: ja 0x10025c240
0x10025c229: mov edx, dword ptr [r15 + 0x150]
0x10025c230: lea esi, [rcx + 1]
0x10025c233: mov dword ptr [rax + 0x514], esi
0x10025c239: mov dword ptr [rax + rcx*4 + 0x414], edx
0x10025c240: mov rdi, qword ptr [r12 + 0x398]
0x10025c248: mov esi, dword ptr [r15 + 0x150]
0x10025c24f: call 0x100263550 ; 0x100263550
0x10025c254: mov qword ptr [rbp - 0x1b0], rax
0x10025c25b: call 0x100262d70 ; 0x100262d70
0x10025c260: mov r14, rax
0x10025c263: mov qword ptr [rbp - 0x90], 0
0x10025c26e: call 0x100474e80 ; 0x100474e80
0x10025c273: mov rbx, qword ptr [rax]
0x10025c276: lea rsi, [rbp - 0x90]
0x10025c27d: lea rdx, [rbp - 0x1b0]
0x10025c284: mov rdi, rax
0x10025c287: mov rcx, r14
0x10025c28a: call qword ptr [rbx + 0x40]
0x10025c28d: mov rbx, qword ptr [rbp - 0x90]
0x10025c294: test rbx, rbx
0x10025c297: je 0x10025c43e
0x10025c29d: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x10025c2a2: vsubps xmm0, xmm0, xmmword ptr [r15 + 0x10]
0x10025c2a8: vmulps xmm0, xmm0, xmm0
0x10025c2ac: vmovshdup xmm1, xmm0
0x10025c2b0: vaddss xmm1, xmm0, xmm1
0x10025c2b4: vpermilpd xmm0, xmm0, 1
0x10025c2ba: vaddss xmm0, xmm0, xmm1
0x10025c2be: vsqrtss xmm2, xmm0, xmm0
0x10025c2c2: mov rax, qword ptr [r15 + 0x80]
0x10025c2c9: vmovss xmm0, dword ptr [rax + 0x10]
0x10025c2ce: vmulss xmm0, xmm0, dword ptr [rip + 0x84f532] ; 0x100aab808
0x10025c2d6: vucomiss xmm0, xmm2
0x10025c2da: jbe 0x10025c375
0x10025c2e0: mov rax, qword ptr [rbx]
0x10025c2e3: mov rsi, qword ptr [r12 + 0xe8]
0x10025c2eb: mov rdi, rbx
0x10025c2ee: mov rdx, r12
0x10025c2f1: vmovss dword ptr [rbp - 0x40], xmm2
0x10025c2f6: call qword ptr [rax + 0x38]
0x10025c2f9: vmovss xmm2, dword ptr [rbp - 0x40]
0x10025c2fe: mov dword ptr [r15 + 0x4d0], 0x3f000000
0x10025c309: cmp byte ptr [r15 + 0x59d], 0
0x10025c311: je 0x10025c375
0x10025c313: call 0x1007abc10 ; 0x1007abc10
0x10025c318: mov eax, dword ptr [rax + 0x38]
0x10025c31b: mov dword ptr [rbp - 0x88], eax
0x10025c321: call 0x1004b1530 ; 0x1004b1530
0x10025c326: mov rax, qword ptr [rip + 0x1b89b9b] ; 0x101de5ec8
0x10025c32d: mov eax, dword ptr [rax + 0x38]
0x10025c330: mov dword ptr [rbp - 0x88], eax
0x10025c336: mov rax, qword ptr [rip + 0x9b07a3] ; 0x100c0cae0
0x10025c33d: add rax, 0x10
0x10025c341: mov qword ptr [rbp - 0x90], rax
0x10025c348: mov al, byte ptr [r15 + 0x594]
0x10025c34f: mov byte ptr [rbp - 0x7f], al
0x10025c352: mov eax, dword ptr [rbx + 0x74]
0x10025c355: mov dword ptr [rbp - 0x7c], eax
0x10025c358: mov rax, qword ptr [r12 + 0x178]
0x10025c360: mov rdi, qword ptr [rax + 0x38]
0x10025c364: lea rsi, [rbp - 0x90]
0x10025c36b: call 0x1004b1f90 ; 0x1004b1f90
0x10025c370: vmovss xmm2, dword ptr [rbp - 0x40]
0x10025c375: vmovss xmm1, dword ptr [rip + 0x848d43] ; 0x100aa50c0
0x10025c37d: vucomiss xmm1, xmm2
0x10025c381: jbe 0x10025c660
0x10025c387: vmovaps xmm2, xmmword ptr [rbx + 0x10]
0x10025c38c: vmovaps xmm0, xmmword ptr [r13]
0x10025c392: vsubps xmm2, xmm2, xmm0
0x10025c396: vmulps xmm2, xmm2, xmm2
0x10025c39a: vmovshdup xmm3, xmm2
0x10025c39e: vaddss xmm3, xmm2, xmm3
0x10025c3a2: vpermilpd xmm2, xmm2, 1
0x10025c3a8: vaddss xmm2, xmm2, xmm3
0x10025c3ac: vsqrtss xmm2, xmm2, xmm2
0x10025c3b0: vucomiss xmm1, xmm2
0x10025c3b4: jbe 0x10025c660
0x10025c3ba: vmovaps xmm1, xmmword ptr [r15 + 0x50]
0x10025c3c0: vmulps xmm1, xmm1, xmmword ptr [rip + 0x84b2a8] ; 0x100aa7670
0x10025c3c8: vmovaps xmmword ptr [r15 + 0x50], xmm1
0x10025c3ce: vmovaps xmm2, xmmword ptr [rbx + 0x10]
0x10025c3d3: vsubps xmm0, xmm2, xmm0
0x10025c3d7: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10025c3dc: vaddps xmm0, xmm1, xmm0
0x10025c3e0: vmovaps xmmword ptr [r15 + 0x50], xmm0
0x10025c3e6: call 0x1007abc10 ; 0x1007abc10
0x10025c3eb: call 0x1004b1530 ; 0x1004b1530
0x10025c3f0: mov rax, qword ptr [rip + 0x1b89a11] ; 0x101de5e08
0x10025c3f7: mov eax, dword ptr [rax + 0x38]
0x10025c3fa: mov dword ptr [rbp - 0x88], eax
0x10025c400: mov rax, qword ptr [rip + 0x9b06e1] ; 0x100c0cae8
0x10025c407: add rax, 0x10
0x10025c40b: mov qword ptr [rbp - 0x90], rax
0x10025c412: mov al, byte ptr [r15 + 0x594]
0x10025c419: mov byte ptr [rbp - 0x7f], al
0x10025c41c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10025c421: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10025c426: mov rdi, qword ptr [r15 + 0x508]
0x10025c42d: lea rsi, [rbp - 0x90]
0x10025c434: call 0x1004b1f90 ; 0x1004b1f90
0x10025c439: jmp 0x10025c660 ; 0x10025c660
0x10025c43e: mov rdi, qword ptr [r12 + 0x418]
0x10025c446: mov esi, dword ptr [r15 + 0x150]
0x10025c44d: call 0x10033a5f0 ; 0x10033a5f0
0x10025c452: mov qword ptr [rbp - 0x1b0], rax
0x10025c459: call 0x10033abb0 ; 0x10033abb0
0x10025c45e: mov r14, rax
0x10025c461: mov qword ptr [rbp - 0x90], 0
0x10025c46c: call 0x10033abb0 ; 0x10033abb0
0x10025c471: mov rbx, qword ptr [rax]
0x10025c474: lea rsi, [rbp - 0x90]
0x10025c47b: lea rdx, [rbp - 0x1b0]
0x10025c482: mov rdi, rax
0x10025c485: mov rcx, r14
0x10025c488: call qword ptr [rbx + 0x40]
0x10025c48b: mov rbx, qword ptr [rbp - 0x90]
0x10025c492: test rbx, rbx
0x10025c495: je 0x10025c660
0x10025c49b: cmp byte ptr [rbx + 0xb4], 0
0x10025c4a2: je 0x10025c660
0x10025c4a8: cmp byte ptr [rbx + 0xb6], 0
0x10025c4af: je 0x10025c660
0x10025c4b5: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10025c4bd: vsubps xmm0, xmm0, xmmword ptr [r15 + 0x10]
0x10025c4c3: vxorps xmm1, xmm1, xmm1
0x10025c4c7: vblendps xmm0, xmm0, xmm1, 2
0x10025c4cd: vmulps xmm0, xmm0, xmm0
0x10025c4d1: vmovshdup xmm1, xmm0
0x10025c4d5: vaddss xmm1, xmm0, xmm1
0x10025c4d9: vpermilpd xmm0, xmm0, 1
0x10025c4df: vaddss xmm0, xmm0, xmm1
0x10025c4e3: vsqrtss xmm2, xmm0, xmm0
0x10025c4e7: mov rax, qword ptr [r15 + 0x80]
0x10025c4ee: vmovss xmm0, dword ptr [rax + 0x10]
0x10025c4f3: vmulss xmm0, xmm0, dword ptr [rip + 0x84b7c5] ; 0x100aa7cc0
0x10025c4fb: vucomiss xmm0, xmm2
0x10025c4ff: jbe 0x10025c596
0x10025c505: mov esi, 1
0x10025c50a: mov rdi, rbx
0x10025c50d: vmovss dword ptr [rbp - 0x40], xmm2
0x10025c512: call 0x10033a780 ; 0x10033a780
0x10025c517: vmovss xmm2, dword ptr [rbp - 0x40]
0x10025c51c: mov dword ptr [r15 + 0x4d0], 0x3f000000
0x10025c527: cmp byte ptr [r15 + 0x59d], 0
0x10025c52f: je 0x10025c596
0x10025c531: call 0x1007abc10 ; 0x1007abc10
0x10025c536: mov eax, dword ptr [rax + 0x38]
0x10025c539: mov dword ptr [rbp - 0x88], eax
0x10025c53f: call 0x1004b1530 ; 0x1004b1530
0x10025c544: mov rax, qword ptr [rip + 0x1b8997d] ; 0x101de5ec8
0x10025c54b: mov eax, dword ptr [rax + 0x38]
0x10025c54e: mov dword ptr [rbp - 0x88], eax
0x10025c554: mov rax, qword ptr [rip + 0x9b0585] ; 0x100c0cae0
0x10025c55b: add rax, 0x10
0x10025c55f: mov qword ptr [rbp - 0x90], rax
0x10025c566: mov al, byte ptr [r15 + 0x594]
0x10025c56d: mov byte ptr [rbp - 0x7f], al
0x10025c570: mov eax, dword ptr [rbx + 0x150]
0x10025c576: mov dword ptr [rbp - 0x7c], eax
0x10025c579: mov rax, qword ptr [r12 + 0x178]
0x10025c581: mov rdi, qword ptr [rax + 0x38]
0x10025c585: lea rsi, [rbp - 0x90]
0x10025c58c: call 0x1004b1f90 ; 0x1004b1f90
0x10025c591: vmovss xmm2, dword ptr [rbp - 0x40]
0x10025c596: vmovss xmm1, dword ptr [rip + 0x848b22] ; 0x100aa50c0
0x10025c59e: vucomiss xmm1, xmm2
0x10025c5a2: jbe 0x10025c660
0x10025c5a8: vmovaps xmm2, xmmword ptr [rbx + 0xc0]
0x10025c5b0: vmovaps xmm0, xmmword ptr [r13]
0x10025c5b6: vsubps xmm2, xmm2, xmm0
0x10025c5ba: vmulps xmm2, xmm2, xmm2
0x10025c5be: vmovshdup xmm3, xmm2
0x10025c5c2: vaddss xmm3, xmm2, xmm3
0x10025c5c6: vpermilpd xmm2, xmm2, 1
0x10025c5cc: vaddss xmm2, xmm2, xmm3
0x10025c5d0: vsqrtss xmm2, xmm2, xmm2
0x10025c5d4: vucomiss xmm1, xmm2
0x10025c5d8: jbe 0x10025c660
0x10025c5de: vmovaps xmm1, xmmword ptr [r15 + 0x50]
0x10025c5e4: vmulps xmm1, xmm1, xmmword ptr [rip + 0x84b084] ; 0x100aa7670
0x10025c5ec: vmovaps xmmword ptr [r15 + 0x50], xmm1
0x10025c5f2: vmovaps xmm2, xmmword ptr [rbx + 0xc0]
0x10025c5fa: vsubps xmm0, xmm2, xmm0
0x10025c5fe: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10025c603: vaddps xmm0, xmm1, xmm0
0x10025c607: vmovaps xmmword ptr [r15 + 0x50], xmm0
0x10025c60d: call 0x1007abc10 ; 0x1007abc10
0x10025c612: call 0x1004b1530 ; 0x1004b1530
0x10025c617: mov rax, qword ptr [rip + 0x1b897ea] ; 0x101de5e08
0x10025c61e: mov eax, dword ptr [rax + 0x38]
0x10025c621: mov dword ptr [rbp - 0x88], eax
0x10025c627: mov rax, qword ptr [rip + 0x9b04ba] ; 0x100c0cae8
0x10025c62e: add rax, 0x10
0x10025c632: mov qword ptr [rbp - 0x90], rax
0x10025c639: mov al, byte ptr [r15 + 0x594]
0x10025c640: mov byte ptr [rbp - 0x7f], al
0x10025c643: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10025c648: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10025c64d: mov rdi, qword ptr [r15 + 0x508]
0x10025c654: lea rsi, [rbp - 0x90]
0x10025c65b: call 0x1004b1f90 ; 0x1004b1f90
0x10025c660: mov eax, dword ptr [r15 + 0x500]
0x10025c667: cmp eax, dword ptr [rip + 0xaced43] ; 0x100d2b3b0
0x10025c66d: jne 0x10025c727
0x10025c673: cmp byte ptr [r15 + 0x504], 0
0x10025c67b: je 0x10025c897
0x10025c681: vmovaps xmm0, xmmword ptr [r15 + 0x50]
0x10025c687: vmulps xmm1, xmm0, xmm0
0x10025c68b: vmovshdup xmm2, xmm1
0x10025c68f: vaddss xmm2, xmm1, xmm2
0x10025c693: vpermilpd xmm1, xmm1, 1
0x10025c699: vaddss xmm1, xmm1, xmm2
0x10025c69d: vsqrtss xmm1, xmm1, xmm1
0x10025c6a1: vucomiss xmm1, dword ptr [rip + 0x84b21b] ; 0x100aa78c4
0x10025c6a9: jbe 0x10025c6b5
0x10025c6ab: vpermilps xmm2, xmm1, 0xc0
0x10025c6b1: vdivps xmm0, xmm0, xmm2
0x10025c6b5: vucomiss xmm1, dword ptr [rip + 0x848a03] ; 0x100aa50c0
0x10025c6bd: jbe 0x10025c8ba
0x10025c6c3: vpermilpd xmm1, xmm0, 1
0x10025c6c9: call 0x100aa25a0 ; 0x100aa25a0 _atan2f
0x10025c6ce: vsubss xmm0, xmm0, dword ptr [r15 + 0xd0]
0x10025c6d7: vaddss xmm1, xmm0, dword ptr [rip + 0x84bf21] ; 0x100aa8600
0x10025c6df: vmovss xmm2, dword ptr [rip + 0x84c2d1] ; 0x100aa89b8
0x10025c6e7: vdivss xmm1, xmm1, xmm2
0x10025c6eb: vroundss xmm1, xmm1, xmm1, 9
0x10025c6f1: vmulss xmm1, xmm1, xmm2
0x10025c6f5: vsubss xmm0, xmm0, xmm1
0x10025c6f9: vmovss xmm1, dword ptr [rip + 0x8489c3] ; 0x100aa50c4
0x10025c701: vmaxss xmm0, xmm1, xmm0
0x10025c705: vmovss xmm1, dword ptr [rip + 0x8489b3] ; 0x100aa50c0
0x10025c70d: vminss xmm0, xmm1, xmm0
0x10025c711: vmulss xmm1, xmm0, dword ptr [rip + 0x84a38f] ; 0x100aa6aa8
0x10025c719: vmovss dword ptr [rbp - 0x48], xmm1
0x10025c71e: vxorps xmm0, xmm0, xmm0
0x10025c722: jmp 0x10025c8c9 ; 0x10025c8c9
0x10025c727: mov rdi, qword ptr [r12 + 0x280]
0x10025c72f: mov dword ptr [rbp - 0x118], eax
0x10025c735: lea rsi, [rbp - 0x118]
0x10025c73c: call 0x100101e20 ; 0x100101e20
0x10025c741: mov rbx, rax
0x10025c744: test rbx, rbx
0x10025c747: je 0x10025c8c1
0x10025c74d: mov rax, qword ptr [rbx + 0x20]
0x10025c751: mov rsi, qword ptr [rax + 0x288]
0x10025c758: lea rdi, [rbp - 0x90]
0x10025c75f: call 0x1007f26e0 ; 0x1007f26e0
0x10025c764: mov rbx, qword ptr [rbx + 0x20]
0x10025c768: mov rsi, qword ptr [rbx + 0x288]
0x10025c76f: lea rdi, [rbp - 0x1b0]
0x10025c776: call 0x1007f26b0 ; 0x1007f26b0
0x10025c77b: mov rsi, qword ptr [rbx + 0x298]
0x10025c782: lea rdi, [rbp - 0x210]
0x10025c789: call 0x1007f26b0 ; 0x1007f26b0
0x10025c78e: vmovaps xmm0, xmmword ptr [rbp - 0x1b0]
0x10025c796: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x210]
0x10025c79e: vmulps xmm2, xmm0, xmmword ptr [rip + 0x84aeca] ; 0x100aa7670
0x10025c7a6: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x10025c7ae: vmovaps xmm3, xmmword ptr [rbp - 0x80]
0x10025c7b3: vmulps xmm0, xmm3, xmm3
0x10025c7b7: vmovshdup xmm4, xmm0
0x10025c7bb: vaddss xmm4, xmm0, xmm4
0x10025c7bf: vpermilpd xmm0, xmm0, 1
0x10025c7c5: vaddss xmm4, xmm0, xmm4
0x10025c7c9: vrsqrtss xmm5, xmm4, xmm4
0x10025c7cd: vmovss xmm8, dword ptr [rip + 0x847de3] ; 0x100aa45b8
0x10025c7d5: vmulss xmm7, xmm4, xmm8
0x10025c7da: vxorps xmm0, xmm0, xmm0
0x10025c7de: vcmpeqss xmm4, xmm4, xmm0
0x10025c7e3: vandnps xmm7, xmm4, xmm7
0x10025c7e7: vmovss xmm6, dword ptr [rip + 0x84be39] ; 0x100aa8628
0x10025c7ef: vandps xmm4, xmm4, xmm6
0x10025c7f3: vorps xmm4, xmm7, xmm4
0x10025c7f7: vmulss xmm4, xmm5, xmm4
0x10025c7fb: vmulss xmm4, xmm5, xmm4
0x10025c7ff: vmovss xmm7, dword ptr [rip + 0x84afe5] ; 0x100aa77ec
0x10025c807: vsubss xmm4, xmm7, xmm4
0x10025c80b: vmulss xmm4, xmm5, xmm4
0x10025c80f: vpermilps xmm4, xmm4, 0xc0
0x10025c815: vmulps xmm3, xmm3, xmm4
0x10025c819: vmulps xmm3, xmm3, xmmword ptr [rip + 0x84efaf] ; 0x100aab7d0
0x10025c821: vsubps xmm2, xmm2, xmm3
0x10025c825: vmulps xmm3, xmm1, xmm1
0x10025c829: vmovshdup xmm4, xmm3
0x10025c82d: vaddss xmm4, xmm3, xmm4
0x10025c831: vpermilpd xmm3, xmm3, 1
0x10025c837: vaddss xmm3, xmm3, xmm4
0x10025c83b: vrsqrtss xmm4, xmm3, xmm3
0x10025c83f: vmulss xmm5, xmm3, xmm8
0x10025c844: vcmpeqss xmm3, xmm3, xmm0
0x10025c849: vandnps xmm5, xmm3, xmm5
0x10025c84d: vandps xmm3, xmm3, xmm6
0x10025c851: vorps xmm3, xmm5, xmm3
0x10025c855: vmulss xmm3, xmm4, xmm3
0x10025c859: vmulss xmm3, xmm4, xmm3
0x10025c85d: vsubss xmm3, xmm7, xmm3
0x10025c861: vmulss xmm3, xmm4, xmm3
0x10025c865: vpermilps xmm3, xmm3, 0xc0
0x10025c86b: vmulps xmm1, xmm1, xmm3
0x10025c86f: vmulps xmm1, xmm1, xmmword ptr [rip + 0x84b759] ; 0x100aa7fd0
0x10025c877: vsubps xmm1, xmm2, xmm1
0x10025c87b: vsubps xmm1, xmm1, xmmword ptr [r15 + 0x10]
0x10025c881: vpermilps xmm2, xmmword ptr [rbp - 0xd0], 0xc0
0x10025c88b: vdivps xmm1, xmm1, xmm2
0x10025c88f: vmovaps xmmword ptr [r15 + 0x50], xmm1
0x10025c895: jmp 0x10025c8c5 ; 0x10025c8c5
0x10025c897: lea rdi, [r15 + 0xf0]
0x10025c89e: lea rdx, [rbp - 0x48]
0x10025c8a2: lea rcx, [rbp - 0x44]
0x10025c8a6: mov rsi, r12
0x10025c8a9: call 0x10025a880 ; 0x10025a880
0x10025c8ae: vmovss xmm1, dword ptr [rbp - 0x48]
0x10025c8b3: vmovss xmm0, dword ptr [rbp - 0x44]
0x10025c8b8: jmp 0x10025c8c9 ; 0x10025c8c9
0x10025c8ba: mov dword ptr [rbp - 0x48], 0
0x10025c8c1: vxorps xmm0, xmm0, xmm0
0x10025c8c5: vxorps xmm1, xmm1, xmm1
0x10025c8c9: vmulss xmm2, xmm1, dword ptr [rbp - 0xd0]
0x10025c8d1: vaddss xmm2, xmm2, dword ptr [r15 + 0xd0]
0x10025c8da: vmovss dword ptr [r15 + 0xd0], xmm2
0x10025c8e3: vandps xmm1, xmm1, xmmword ptr [rip + 0x84b025] ; 0x100aa7910
0x10025c8eb: mov rax, qword ptr [r15 + 0x80]
0x10025c8f2: vmulss xmm1, xmm1, dword ptr [rax + 0x10]
0x10025c8f7: vmulss xmm1, xmm1, dword ptr [rip + 0x84aeed] ; 0x100aa77ec
0x10025c8ff: vmaxss xmm0, xmm0, xmm1
0x10025c903: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x10025c90b: vmovss dword ptr [rbp - 0x44], xmm0
0x10025c910: mov rax, qword ptr [r15 + 0x4e0]
0x10025c917: mov rdi, qword ptr [rax + 0x68]
0x10025c91b: test rdi, rdi
0x10025c91e: mov qword ptr [rbp - 0xb8], r13
0x10025c925: je 0x10025c943
0x10025c927: call 0x100098790 ; 0x100098790
0x10025c92c: test al, al
0x10025c92e: je 0x10025c943
0x10025c930: mov dword ptr [rbp - 0x44], 0
0x10025c937: vxorps xmm0, xmm0, xmm0
0x10025c93b: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x10025c943: vmovss xmm0, dword ptr [r15 + 0xd0]
0x10025c94c: vmovss xmm1, dword ptr [r15 + 0xd4]
0x10025c955: lea rdi, [rbp - 0x230]
0x10025c95c: call 0x100064550 ; 0x100064550
0x10025c961: vmovddup xmm0, qword ptr [rip + 0x84af6f] ; 0x100aa78d8
0x10025c969: vmovapd xmmword ptr [rbp - 0x40], xmm0
0x10025c96e: vaddps xmm0, xmm0, xmmword ptr [r15 + 0x10]
0x10025c974: vmovaps xmm1, xmmword ptr [rbp - 0x230]
0x10025c97c: vmulps xmm1, xmm1, xmmword ptr [rip + 0x84b6fc] ; 0x100aa8080
0x10025c984: vaddps xmm0, xmm0, xmm1
0x10025c988: vmovaps xmmword ptr [rbp - 0x2a0], xmm0
0x10025c990: mov rdi, qword ptr [r12 + 0x138]
0x10025c998: vmovddup xmm0, qword ptr [rip + 0x857288] ; 0x100ab3c28
0x10025c9a0: vmovapd xmmword ptr [rbp - 0xb0], xmm0
0x10025c9a8: vmovapd xmmword ptr [rbp - 0x90], xmm0
0x10025c9b0: lea rsi, [rbp - 0x2a0]
0x10025c9b7: lea rdx, [rbp - 0x90]
0x10025c9be: vmovss xmm0, dword ptr [rip + 0x84ae2a] ; 0x100aa77f0
0x10025c9c6: lea rbx, [rbp - 0x210]
0x10025c9cd: xor ecx, ecx
0x10025c9cf: mov r8, rbx
0x10025c9d2: call 0x100776a90 ; 0x100776a90
0x10025c9d7: mov rdi, qword ptr [r12 + 0x138]
0x10025c9df: mov qword ptr [rbp - 0x98], r15
0x10025c9e6: vmovaps xmm0, xmmword ptr [r15 + 0x10]
0x10025c9ec: vaddps xmm0, xmm0, xmmword ptr [rip + 0x84c83c] ; 0x100aa9230
0x10025c9f4: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x10025c9fc: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10025ca04: vmovaps xmmword ptr [rbp - 0x1b0], xmm0
0x10025ca0c: lea rsi, [rbp - 0x90]
0x10025ca13: lea rdx, [rbp - 0x1b0]
0x10025ca1a: vmovss xmm0, dword ptr [rip + 0x84bbae] ; 0x100aa85d0
0x10025ca22: xor ecx, ecx
0x10025ca24: mov r8, rbx
0x10025ca27: call 0x100776a90 ; 0x100776a90
0x10025ca2c: mov r13d, eax
0x10025ca2f: vmovaps xmm0, xmmword ptr [rbp - 0x210]
0x10025ca37: and r13b, byte ptr [rbp - 0x1ec]
0x10025ca3e: jne 0x10025ca47
0x10025ca40: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x10025ca45: jmp 0x10025ca4f ; 0x10025ca4f
0x10025ca47: vmovaps xmm2, xmmword ptr [rbp - 0x200]
0x10025ca4f: mov rbx, qword ptr [rbp - 0x98]
0x10025ca56: mov eax, dword ptr [rbx + 0x500]
0x10025ca5c: cmp eax, dword ptr [rip + 0xace94e] ; 0x100d2b3b0
0x10025ca62: jne 0x10025cc34
0x10025ca68: cmp byte ptr [rbx + 0x504], 0
0x10025ca6f: je 0x10025cc4d
0x10025ca75: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x10025ca7d: vpermilps xmm0, xmm1, 0xc0
0x10025ca83: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10025ca88: vmulps xmm0, xmm0, xmmword ptr [rip + 0x84e2e0] ; 0x100aaad70
0x10025ca90: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x50]
0x10025ca95: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x10025ca9d: vmulss xmm0, xmm1, dword ptr [rip + 0x84d9e7] ; 0x100aaa48c
0x10025caa5: call 0x100aa2708 ; 0x100aa2708 _expf
0x10025caaa: vmovss xmm2, dword ptr [rip + 0x84860e] ; 0x100aa50c0
0x10025cab2: vsubss xmm0, xmm2, xmm0
0x10025cab6: vxorps xmm1, xmm1, xmm1
0x10025caba: vmaxss xmm0, xmm1, xmm0
0x10025cabe: vminss xmm0, xmm2, xmm0
0x10025cac2: vsubss xmm1, xmm2, xmm0
0x10025cac6: vpermilps xmm1, xmm1, 0xc0
0x10025cacc: vmulps xmm1, xmm1, xmmword ptr [rbp - 0xb0]
0x10025cad4: vpermilps xmm2, xmm0, 0xc0
0x10025cada: vxorps xmm0, xmm0, xmm0
0x10025cade: vmulps xmm2, xmm2, xmm0
0x10025cae2: vaddps xmm1, xmm2, xmm1
0x10025cae6: vmovaps xmmword ptr [rbx + 0x50], xmm1
0x10025caeb: vmulps xmm2, xmm1, xmm1
0x10025caef: vmovshdup xmm3, xmm2
0x10025caf3: vaddss xmm3, xmm2, xmm3
0x10025caf7: vpermilpd xmm2, xmm2, 1
0x10025cafd: vaddss xmm2, xmm2, xmm3
0x10025cb01: vsqrtss xmm2, xmm2, xmm2
0x10025cb05: vucomiss xmm2, dword ptr [rip + 0x84acdb] ; 0x100aa77e8
0x10025cb0d: vmovaps xmm3, xmmword ptr [rip + 0x84c7cb] ; 0x100aa92e0
0x10025cb15: mov r14, rbx
0x10025cb18: jbe 0x10025cb32
0x10025cb1a: vucomiss xmm2, dword ptr [rip + 0x84ada2] ; 0x100aa78c4
0x10025cb22: vmovaps xmm3, xmm1
0x10025cb26: jbe 0x10025cb32
0x10025cb28: vpermilps xmm3, xmm2, 0xc0
0x10025cb2e: vdivps xmm3, xmm1, xmm3
0x10025cb32: vmovaps xmmword ptr [rbp - 0x150], xmm3
0x10025cb3a: vmaxss xmm1, xmm2, dword ptr [rip + 0x84aca6] ; 0x100aa77e8
0x10025cb42: mov byte ptr [rbp - 0x1a8], 1
0x10025cb49: vmovups xmmword ptr [rbp - 0x1a0], xmm0
0x10025cb51: movabs rax, 0xffffffff00000001
0x10025cb5b: mov qword ptr [rbp - 0x1b0], rax
0x10025cb62: mov rdi, qword ptr [r12 + 0x138]
0x10025cb6a: vmulps xmm0, xmm3, xmmword ptr [rip + 0x84ebfe] ; 0x100aab770
0x10025cb72: mov rbx, qword ptr [rbp - 0xb8]
0x10025cb79: vmovaps xmm2, xmmword ptr [rbx]
0x10025cb7d: vsubps xmm0, xmm2, xmm0
0x10025cb81: vmovaps xmmword ptr [rbp - 0x1d0], xmm0
0x10025cb89: vmulss xmm0, xmm1, dword ptr [rbp - 0xd0]
0x10025cb91: vaddss xmm0, xmm0, dword ptr [rip + 0x84ba6f] ; 0x100aa8608
0x10025cb99: lea rsi, [rbp - 0x1d0]
0x10025cba0: lea rdx, [rbp - 0x150]
0x10025cba7: lea rcx, [rbp - 0x1b0]
0x10025cbae: lea r8, [rbp - 0x90]
0x10025cbb5: call 0x100776a90 ; 0x100776a90
0x10025cbba: test al, al
0x10025cbbc: je 0x10025ceec
0x10025cbc2: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x10025cbc7: vmovaps xmm0, xmmword ptr [r14 + 0x50]
0x10025cbcd: vmulps xmm2, xmm1, xmm0
0x10025cbd1: vmovshdup xmm3, xmm2
0x10025cbd5: vaddss xmm3, xmm2, xmm3
0x10025cbd9: vpermilpd xmm2, xmm2, 1
0x10025cbdf: vaddss xmm2, xmm2, xmm3
0x10025cbe3: vmulps xmm3, xmm0, xmm0
0x10025cbe7: vmovshdup xmm4, xmm3
0x10025cbeb: vaddss xmm4, xmm3, xmm4
0x10025cbef: vpermilpd xmm3, xmm3, 1
0x10025cbf5: vaddss xmm3, xmm3, xmm4
0x10025cbf9: vsqrtss xmm3, xmm3, xmm3
0x10025cbfd: vucomiss xmm3, dword ptr [rip + 0x84ca6b] ; 0x100aa9670
0x10025cc05: jbe 0x10025e218
0x10025cc0b: vmulss xmm2, xmm2, dword ptr [rip + 0x84ca71] ; 0x100aa9684
0x10025cc13: vpermilps xmm2, xmm2, 0xc0
0x10025cc19: vmulps xmm1, xmm1, xmm2
0x10025cc1d: vaddps xmm0, xmm0, xmm1
0x10025cc21: vmulps xmm1, xmm0, xmmword ptr [rip + 0x84aa47] ; 0x100aa7670
0x10025cc29: vmovaps xmmword ptr [r14 + 0x50], xmm1
0x10025cc2f: jmp 0x10025cef2 ; 0x10025cef2
0x10025cc34: vpermilps xmm3, xmmword ptr [rbp - 0xd0], 0xc0
0x10025cc3e: mov r14, rbx
0x10025cc41: mov rbx, qword ptr [rbp - 0xb8]
0x10025cc48: jmp 0x10025d026 ; 0x10025d026
0x10025cc4d: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x10025cc55: vmovss xmm0, dword ptr [rbx + 0xd0]
0x10025cc5d: lea rdi, [rbp - 0x90]
0x10025cc64: vxorps xmm1, xmm1, xmm1
0x10025cc68: vmovaps xmmword ptr [rbp - 0x40], xmm2
0x10025cc6d: call 0x100064550 ; 0x100064550
0x10025cc72: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x10025cc77: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x10025cc7f: vmulps xmm0, xmm3, xmm1
0x10025cc83: vmovshdup xmm2, xmm0
0x10025cc87: vaddss xmm2, xmm0, xmm2
0x10025cc8b: vpermilpd xmm0, xmm0, 1
0x10025cc91: vaddss xmm0, xmm0, xmm2
0x10025cc95: vpermilps xmm0, xmm0, 0xc0
0x10025cc9b: vmulps xmm0, xmm3, xmm0
0x10025cc9f: vsubps xmm0, xmm1, xmm0
0x10025cca3: vmulps xmm1, xmm1, xmm1
0x10025cca7: vmovshdup xmm2, xmm1
0x10025ccab: vaddss xmm2, xmm1, xmm2
0x10025ccaf: vpermilpd xmm1, xmm1, 1
0x10025ccb5: vaddss xmm1, xmm1, xmm2
0x10025ccb9: vsqrtss xmm1, xmm1, xmm1
0x10025ccbd: vmulps xmm2, xmm0, xmm0
0x10025ccc1: vmovshdup xmm3, xmm2
0x10025ccc5: vaddss xmm3, xmm2, xmm3
0x10025ccc9: vpermilpd xmm2, xmm2, 1
0x10025cccf: vaddss xmm2, xmm2, xmm3
0x10025ccd3: vsqrtss xmm2, xmm2, xmm2
0x10025ccd7: vucomiss xmm2, dword ptr [rip + 0x84abe5] ; 0x100aa78c4
0x10025ccdf: jbe 0x10025cceb
0x10025cce1: vpermilps xmm2, xmm2, 0xc0
0x10025cce7: vdivps xmm0, xmm0, xmm2
0x10025cceb: vpermilps xmm1, xmm1, 0xc0
0x10025ccf1: vmulps xmm0, xmm1, xmm0
0x10025ccf5: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x10025ccfd: vmulss xmm1, xmm1, dword ptr [rip + 0x849da3] ; 0x100aa6aa8
0x10025cd05: vmovss dword ptr [rbp - 0xb0], xmm1
0x10025cd0d: vmovshdup xmm0, xmm0
0x10025cd11: vmovss xmm1, dword ptr [rip + 0x8483ab] ; 0x100aa50c4
0x10025cd19: vmaxss xmm0, xmm1, xmm0
0x10025cd1d: vmovss xmm1, dword ptr [rip + 0x84839b] ; 0x100aa50c0
0x10025cd25: vminss xmm0, xmm1, xmm0
0x10025cd29: call 0x100aa2588 ; 0x100aa2588 _asinf
0x10025cd2e: vmovss xmm5, dword ptr [rip + 0x84838a] ; 0x100aa50c0
0x10025cd36: vmovss xmm2, dword ptr [rbp - 0xb0]
0x10025cd3e: vsubss xmm1, xmm5, xmm2
0x10025cd42: mov rax, qword ptr [rbp - 0x98]
0x10025cd49: vmulss xmm1, xmm1, dword ptr [rax + 0xd4]
0x10025cd51: vmulss xmm0, xmm2, xmm0
0x10025cd55: vaddss xmm0, xmm0, xmm1
0x10025cd59: vmovss dword ptr [rax + 0xd4], xmm0
0x10025cd61: vpermilps xmm0, xmmword ptr [rbp - 0x140], 0xc0
0x10025cd6b: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x230]
0x10025cd73: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x10025cd78: vmulps xmm1, xmm3, xmm0
0x10025cd7c: vmovshdup xmm2, xmm1
0x10025cd80: vaddss xmm2, xmm1, xmm2
0x10025cd84: vpermilpd xmm1, xmm1, 1
0x10025cd8a: vaddss xmm1, xmm1, xmm2
0x10025cd8e: vxorps xmm2, xmm2, xmm2
0x10025cd92: vucomiss xmm2, xmm1
0x10025cd96: jbe 0x10025cdf8
0x10025cd98: vpermilps xmm1, xmm1, 0xc0
0x10025cd9e: vmulps xmm1, xmm3, xmm1
0x10025cda2: vsubps xmm1, xmm0, xmm1
0x10025cda6: vmulps xmm0, xmm0, xmm0
0x10025cdaa: vmovshdup xmm2, xmm0
0x10025cdae: vaddss xmm2, xmm0, xmm2
0x10025cdb2: vpermilpd xmm0, xmm0, 1
0x10025cdb8: vaddss xmm0, xmm0, xmm2
0x10025cdbc: vsqrtss xmm0, xmm0, xmm0
0x10025cdc0: vmulps xmm2, xmm1, xmm1
0x10025cdc4: vmovshdup xmm3, xmm2
0x10025cdc8: vaddss xmm3, xmm2, xmm3
0x10025cdcc: vpermilpd xmm2, xmm2, 1
0x10025cdd2: vaddss xmm2, xmm2, xmm3
0x10025cdd6: vsqrtss xmm2, xmm2, xmm2
0x10025cdda: vucomiss xmm2, dword ptr [rip + 0x84aae2] ; 0x100aa78c4
0x10025cde2: jbe 0x10025cdee
0x10025cde4: vpermilps xmm2, xmm2, 0xc0
0x10025cdea: vdivps xmm1, xmm1, xmm2
0x10025cdee: vpermilps xmm0, xmm0, 0xc0
0x10025cdf4: vmulps xmm0, xmm0, xmm1
0x10025cdf8: mov rcx, qword ptr [rbp - 0x98]
0x10025cdff: mov rax, qword ptr [rcx + 0x80]
0x10025ce06: vmovss xmm1, dword ptr [rax + 0x18]
0x10025ce0b: vmulps xmm2, xmm0, xmm0
0x10025ce0f: vmovshdup xmm3, xmm2
0x10025ce13: vaddss xmm3, xmm2, xmm3
0x10025ce17: vpermilpd xmm2, xmm2, 1
0x10025ce1d: vaddss xmm2, xmm2, xmm3
0x10025ce21: vsqrtss xmm2, xmm2, xmm2
0x10025ce25: vmovss xmm3, dword ptr [rip + 0x849c6f] ; 0x100aa6a9c
0x10025ce2d: vmovaps xmm4, xmm3
0x10025ce31: vmaxss xmm3, xmm4, xmm2
0x10025ce35: vcmpunordss xmm2, xmm2, xmm2
0x10025ce3a: vandnps xmm3, xmm2, xmm3
0x10025ce3e: vandps xmm2, xmm2, xmm4
0x10025ce42: vorps xmm2, xmm3, xmm2
0x10025ce46: vdivss xmm1, xmm1, xmm2
0x10025ce4a: vminss xmm2, xmm5, xmm1
0x10025ce4e: vcmpunordss xmm1, xmm1, xmm1
0x10025ce53: vandnps xmm2, xmm1, xmm2
0x10025ce57: vandps xmm1, xmm1, xmm5
0x10025ce5b: vorps xmm1, xmm2, xmm1
0x10025ce5f: vpermilps xmm1, xmm1, 0xc0
0x10025ce65: vmulps xmm1, xmm0, xmm1
0x10025ce69: vmovaps xmm0, xmmword ptr [rcx + 0x50]
0x10025ce6e: vsubps xmm1, xmm1, xmm0
0x10025ce72: vmulps xmm1, xmm1, xmmword ptr [rip + 0x84b206] ; 0x100aa8080
0x10025ce7a: vmulps xmm2, xmm1, xmm1
0x10025ce7e: vmovshdup xmm3, xmm2
0x10025ce82: vaddss xmm3, xmm2, xmm3
0x10025ce86: vpermilpd xmm2, xmm2, 1
0x10025ce8c: vaddss xmm2, xmm2, xmm3
0x10025ce90: vsqrtss xmm2, xmm2, xmm2
0x10025ce94: vmaxss xmm3, xmm4, xmm2
0x10025ce98: vcmpunordss xmm2, xmm2, xmm2
0x10025ce9d: vandnps xmm3, xmm2, xmm3
0x10025cea1: vandps xmm2, xmm2, xmm4
0x10025cea5: vorps xmm2, xmm3, xmm2
0x10025cea9: vmovss xmm3, dword ptr [rip + 0x84ae03] ; 0x100aa7cb4
0x10025ceb1: vdivss xmm2, xmm3, xmm2
0x10025ceb5: vminss xmm3, xmm5, xmm2
0x10025ceb9: vcmpunordss xmm2, xmm2, xmm2
0x10025cebe: vandnps xmm3, xmm2, xmm3
0x10025cec2: vandps xmm2, xmm2, xmm5
0x10025cec6: vorps xmm2, xmm3, xmm2
0x10025ceca: vpermilps xmm2, xmm2, 0xc0
0x10025ced0: vmovss xmm3, dword ptr [rcx + 0x14]
0x10025ced5: test r13b, 1
0x10025ced9: jne 0x10025cfde
0x10025cedf: vmovss xmm4, dword ptr [rip + 0x851d4d] ; 0x100aaec34
0x10025cee7: jmp 0x10025cfee ; 0x10025cfee
0x10025ceec: vmovaps xmm1, xmmword ptr [r14 + 0x50]
0x10025cef2: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x10025cef7: mov rax, qword ptr [r14 + 0x80]
0x10025cefe: vmovss xmm0, dword ptr [rax + 0x10]
0x10025cf03: vpermilps xmm2, xmm0, 0
0x10025cf09: vmulps xmm2, xmm2, xmmword ptr [rip + 0x84b18f] ; 0x100aa80a0
0x10025cf11: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x10025cf19: vaddps xmm2, xmm2, xmmword ptr [r14 + 0x10]
0x10025cf1f: vmulps xmm1, xmm3, xmm1
0x10025cf23: vaddps xmm1, xmm2, xmm1
0x10025cf27: vmovaps xmmword ptr [rbp - 0x1d0], xmm1
0x10025cf2f: mov rdi, qword ptr [r12 + 0x138]
0x10025cf37: vmovaps xmmword ptr [rbp - 0x290], xmm2
0x10025cf3f: lea rsi, [rbp - 0x290]
0x10025cf46: lea rdx, [rbp - 0x1d0]
0x10025cf4d: mov ecx, 0xffffffff
0x10025cf52: mov r8, rdx
0x10025cf55: call 0x100778220 ; 0x100778220
0x10025cf5a: vmovaps xmm0, xmmword ptr [rbp - 0x1d0]
0x10025cf62: vsubps xmm0, xmm0, xmmword ptr [rbp - 0xb0]
0x10025cf6a: vmovaps xmmword ptr [r14 + 0x10], xmm0
0x10025cf70: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x10025cf78: vmulss xmm0, xmm0, dword ptr [rip + 0x849b28] ; 0x100aa6aa8
0x10025cf80: vmovss dword ptr [rbp - 0xb0], xmm0
0x10025cf88: vmovss xmm0, dword ptr [rip + 0x84a840] ; 0x100aa77d0
0x10025cf90: vmaxss xmm0, xmm0, dword ptr [rbp - 0x14c]
0x10025cf98: vmovss xmm1, dword ptr [rip + 0x84b62c] ; 0x100aa85cc
0x10025cfa0: vminss xmm0, xmm1, xmm0
0x10025cfa4: call 0x100aa2588 ; 0x100aa2588 _asinf
0x10025cfa9: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x10025cfae: vmovss xmm1, dword ptr [rip + 0x84810a] ; 0x100aa50c0
0x10025cfb6: vmovss xmm2, dword ptr [rbp - 0xb0]
0x10025cfbe: vsubss xmm1, xmm1, xmm2
0x10025cfc2: vmulss xmm1, xmm1, dword ptr [r14 + 0xd4]
0x10025cfcb: vmulss xmm0, xmm2, xmm0
0x10025cfcf: vaddss xmm0, xmm0, xmm1
0x10025cfd3: vmovss dword ptr [r14 + 0xd4], xmm0
0x10025cfdc: jmp 0x10025d026 ; 0x10025d026
0x10025cfde: vmovshdup xmm4, xmmword ptr [rbp - 0x130]
0x10025cfe6: vaddss xmm4, xmm4, dword ptr [rip + 0x84b61a] ; 0x100aa8608
0x10025cfee: mov rbx, qword ptr [rbp - 0xb8]
0x10025cff5: vmulps xmm1, xmm2, xmm1
0x10025cff9: vucomiss xmm3, xmm4
0x10025cffd: mov r14, qword ptr [rbp - 0x98]
0x10025d004: jbe 0x10025d00e
0x10025d006: vsubps xmm1, xmm1, xmmword ptr [rip + 0x856c02] ; 0x100ab3c10
0x10025d00e: vpermilps xmm3, xmmword ptr [rbp - 0xd0], 0xc0
0x10025d018: vmulps xmm1, xmm3, xmm1
0x10025d01c: vaddps xmm0, xmm0, xmm1
0x10025d020: vmovaps xmmword ptr [r14 + 0x50], xmm0
0x10025d026: vmovaps xmmword ptr [rbp - 0x40], xmm3
0x10025d02b: mov rax, qword ptr [r14 + 0x80]
0x10025d032: vmovss xmm0, dword ptr [rax + 0x10]
0x10025d037: vpermilps xmm1, xmm0, 0
0x10025d03d: vmulps xmm1, xmm1, xmmword ptr [rip + 0x84b05b] ; 0x100aa80a0
0x10025d045: vmovaps xmmword ptr [rbp - 0xb0], xmm1
0x10025d04d: vaddps xmm2, xmm1, xmmword ptr [r14 + 0x10]
0x10025d053: vmulps xmm1, xmm3, xmmword ptr [r14 + 0x50]
0x10025d059: vaddps xmm1, xmm2, xmm1
0x10025d05d: vmovaps xmmword ptr [rbp - 0x150], xmm1
0x10025d065: mov rdi, qword ptr [r12 + 0x138]
0x10025d06d: vmovaps xmmword ptr [rbp - 0x90], xmm2
0x10025d075: lea rsi, [rbp - 0x90]
0x10025d07c: lea rdx, [rbp - 0x150]
0x10025d083: mov ecx, 0xffffffff
0x10025d088: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x10025d090: mov r8, rdx
0x10025d093: call 0x100778220 ; 0x100778220
0x10025d098: mov eax, dword ptr [r14 + 0x500]
0x10025d09f: cmp eax, dword ptr [rip + 0xace30b] ; 0x100d2b3b0
0x10025d0a5: mov qword ptr [rbp - 0x1b8], r12
0x10025d0ac: jne 0x10025d0c7
0x10025d0ae: vmovaps xmm0, xmmword ptr [rbp - 0x150]
0x10025d0b6: vsubps xmm0, xmm0, xmmword ptr [rbp - 0xb0]
0x10025d0be: vmovaps xmmword ptr [rbx], xmm0
0x10025d0c2: jmp 0x10025d2ce ; 0x10025d2ce
0x10025d0c7: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10025d0cc: vmulps xmm0, xmm0, xmmword ptr [r14 + 0x50]
0x10025d0d2: vaddps xmm0, xmm0, xmmword ptr [r14 + 0x10]
0x10025d0d8: vmovaps xmmword ptr [r14 + 0x10], xmm0
0x10025d0de: vxorps xmm0, xmm0, xmm0
0x10025d0e2: vmovaps xmmword ptr [r14 + 0x50], xmm0
0x10025d0e8: mov rdi, qword ptr [r12 + 0x280]
0x10025d0f0: mov dword ptr [rbp - 0x110], eax
0x10025d0f6: lea rsi, [rbp - 0x110]
0x10025d0fd: call 0x100101e20 ; 0x100101e20
0x10025d102: test rax, rax
0x10025d105: je 0x10025d2ce
0x10025d10b: mov rdi, qword ptr [r12 + 0x280]
0x10025d113: mov eax, dword ptr [r14 + 0x500]
0x10025d11a: mov dword ptr [rbp - 0x108], eax
0x10025d120: lea rsi, [rbp - 0x108]
0x10025d127: call 0x100101e20 ; 0x100101e20
0x10025d12c: mov rax, qword ptr [rax + 0x20]
0x10025d130: mov rsi, qword ptr [rax + 0x288]
0x10025d137: lea rdi, [rbp - 0x90]
0x10025d13e: call 0x1007f26e0 ; 0x1007f26e0
0x10025d143: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x10025d14b: vmovaps xmm2, xmmword ptr [rbp - 0x80]
0x10025d150: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10025d155: vmulps xmm3, xmm1, xmm1
0x10025d159: vmovshdup xmm4, xmm3
0x10025d15d: vaddss xmm4, xmm3, xmm4
0x10025d161: vpermilpd xmm3, xmm3, 1
0x10025d167: vaddss xmm5, xmm3, xmm4
0x10025d16b: vrsqrtss xmm7, xmm5, xmm5
0x10025d16f: vmovss xmm8, dword ptr [rip + 0x847441] ; 0x100aa45b8
0x10025d177: vmulss xmm6, xmm5, xmm8
0x10025d17c: vxorps xmm9, xmm9, xmm9
0x10025d181: vcmpeqss xmm3, xmm5, xmm9
0x10025d187: vandnps xmm6, xmm3, xmm6
0x10025d18b: vmovss xmm5, dword ptr [rip + 0x84b495] ; 0x100aa8628
0x10025d193: vandps xmm3, xmm3, xmm5
0x10025d197: vorps xmm3, xmm6, xmm3
0x10025d19b: vmulss xmm3, xmm7, xmm3
0x10025d19f: vmulss xmm3, xmm7, xmm3
0x10025d1a3: vmovss xmm6, dword ptr [rip + 0x84a641] ; 0x100aa77ec
0x10025d1ab: vsubss xmm3, xmm6, xmm3
0x10025d1af: vmulss xmm3, xmm7, xmm3
0x10025d1b3: vpermilps xmm3, xmm3, 0xc0
0x10025d1b9: vmulps xmm1, xmm1, xmm3
0x10025d1bd: vmulps xmm3, xmm2, xmm2
0x10025d1c1: vmovshdup xmm7, xmm3
0x10025d1c5: vaddss xmm7, xmm3, xmm7
0x10025d1c9: vpermilpd xmm3, xmm3, 1
0x10025d1cf: vaddss xmm3, xmm3, xmm7
0x10025d1d3: vrsqrtss xmm7, xmm3, xmm3
0x10025d1d7: vmulss xmm4, xmm3, xmm8
0x10025d1dc: vcmpeqss xmm3, xmm3, xmm9
0x10025d1e2: vandnps xmm4, xmm3, xmm4
0x10025d1e6: vandps xmm3, xmm3, xmm5
0x10025d1ea: vorps xmm3, xmm4, xmm3
0x10025d1ee: vmulss xmm3, xmm7, xmm3
0x10025d1f2: vmulss xmm3, xmm7, xmm3
0x10025d1f6: vsubss xmm3, xmm6, xmm3
0x10025d1fa: vmulss xmm3, xmm7, xmm3
0x10025d1fe: vpermilps xmm3, xmm3, 0xc0
0x10025d204: vmulps xmm2, xmm2, xmm3
0x10025d208: vmulps xmm3, xmm0, xmm0
0x10025d20c: vmovshdup xmm4, xmm3
0x10025d210: vaddss xmm4, xmm3, xmm4
0x10025d214: vpermilpd xmm3, xmm3, 1
0x10025d21a: vaddss xmm3, xmm3, xmm4
0x10025d21e: vrsqrtss xmm4, xmm3, xmm3
0x10025d222: vmulss xmm7, xmm3, xmm8
0x10025d227: vcmpeqss xmm3, xmm3, xmm9
0x10025d22d: vandnps xmm7, xmm3, xmm7
0x10025d231: vandps xmm3, xmm3, xmm5
0x10025d235: vorps xmm3, xmm7, xmm3
0x10025d239: vmulss xmm3, xmm4, xmm3
0x10025d23d: vmulss xmm3, xmm4, xmm3
0x10025d241: vsubss xmm3, xmm6, xmm3
0x10025d245: vmulss xmm3, xmm4, xmm3
0x10025d249: vpermilps xmm3, xmm3, 0xc0
0x10025d24f: vmulps xmm0, xmm0, xmm3
0x10025d253: vmovaps xmm3, xmmword ptr [rip + 0x84e3f5] ; 0x100aab650
0x10025d25b: vmulps xmm4, xmm1, xmm3
0x10025d25f: vsubps xmm4, xmm4, xmm2
0x10025d263: vxorps xmm7, xmm7, xmm7
0x10025d267: vmulps xmm5, xmm0, xmm7
0x10025d26b: vaddps xmm4, xmm5, xmm4
0x10025d26f: vmulps xmm6, xmm2, xmm3
0x10025d273: vaddps xmm6, xmm6, xmm1
0x10025d277: vaddps xmm5, xmm5, xmm6
0x10025d27b: vmulps xmm1, xmm1, xmm7
0x10025d27f: vmulps xmm2, xmm2, xmm7
0x10025d283: vaddps xmm1, xmm2, xmm1
0x10025d287: vaddps xmm0, xmm0, xmm1
0x10025d28b: vmulps xmm1, xmm4, xmm3
0x10025d28f: vmulps xmm2, xmm5, xmm7
0x10025d293: vaddps xmm1, xmm2, xmm1
0x10025d297: vaddps xmm1, xmm0, xmm1
0x10025d29b: vmulps xmm6, xmm4, xmm7
0x10025d29f: vaddps xmm5, xmm5, xmm6
0x10025d2a3: vmulps xmm6, xmm0, xmm7
0x10025d2a7: vaddps xmm5, xmm6, xmm5
0x10025d2ab: vsubps xmm2, xmm2, xmm4
0x10025d2af: vmulps xmm0, xmm0, xmm3
0x10025d2b3: vaddps xmm0, xmm0, xmm2
0x10025d2b7: vinsertf128 ymm1, ymm1, xmm5, 1
0x10025d2bd: vmovups ymmword ptr [r14 + 0x20], ymm1
0x10025d2c3: vmovaps xmmword ptr [r14 + 0x40], xmm0
0x10025d2c9: jmp 0x10025d49a ; 0x10025d49a
0x10025d2ce: vmovss xmm0, dword ptr [r14 + 0xd0]
0x10025d2d7: vcvtss2sd xmm0, xmm0, xmm0
0x10025d2db: vaddsd xmm0, xmm0, qword ptr [rip + 0x84c415] ; 0x100aa96f8
0x10025d2e3: vcvtsd2ss xmm0, xmm0, xmm0
0x10025d2e7: vmulss xmm0, xmm0, dword ptr [rip + 0x8472c9] ; 0x100aa45b8
0x10025d2ef: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10025d2f4: vmovshdup xmm2, xmm0
0x10025d2f8: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x10025d300: vxorps xmm1, xmm1, xmm1
0x10025d304: vblendps xmm0, xmm1, xmm0, 1
0x10025d30a: vblendps xmm1, xmm1, xmm2, 1
0x10025d310: vshufps xmm0, xmm0, xmm1, 0x11
0x10025d315: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10025d31a: vmovss xmm0, dword ptr [rip + 0x847296] ; 0x100aa45b8
0x10025d322: vmulss xmm0, xmm0, dword ptr [r14 + 0xd4]
0x10025d32b: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10025d330: vmovshdup xmm1, xmm0
0x10025d334: vinsertps xmm0, xmm0, xmm0, 0x76
0x10025d33a: vmovaps xmm6, xmmword ptr [rbp - 0xb0]
0x10025d342: vpermilps xmm2, xmm6, 0xc0
0x10025d348: vmulps xmm2, xmm2, xmm0
0x10025d34c: vpermilps xmm3, xmm1, 0xc0
0x10025d352: vmovaps xmm5, xmmword ptr [rbp - 0x40]
0x10025d357: vmulps xmm3, xmm5, xmm3
0x10025d35b: vaddps xmm2, xmm2, xmm3
0x10025d35f: vpermilps xmm3, xmm5, 0xd2
0x10025d365: vmulps xmm3, xmm3, xmm0
0x10025d369: vpermilps xmm4, xmm0, 0xd2
0x10025d36f: vmulps xmm4, xmm5, xmm4
0x10025d373: vsubps xmm3, xmm3, xmm4
0x10025d377: vpermilps xmm3, xmm3, 0xd2
0x10025d37d: vaddps xmm2, xmm2, xmm3
0x10025d381: vmulss xmm1, xmm6, xmm1
0x10025d385: vmulps xmm0, xmm5, xmm0
0x10025d389: vmovshdup xmm3, xmm0
0x10025d38d: vaddss xmm3, xmm0, xmm3
0x10025d391: vpermilpd xmm0, xmm0, 1
0x10025d397: vaddss xmm0, xmm0, xmm3
0x10025d39b: vsubss xmm0, xmm1, xmm0
0x10025d39f: vinsertps xmm1, xmm2, xmm0, 0x30
0x10025d3a5: vpermilps xmm2, xmm0, 0xc0
0x10025d3ab: vxorps xmm4, xmm4, xmm4
0x10025d3af: vmulps xmm2, xmm2, xmm4
0x10025d3b3: vaddps xmm2, xmm1, xmm2
0x10025d3b7: vpermilps xmm3, xmm1, 0xd2
0x10025d3bd: vmulps xmm3, xmm3, xmm4
0x10025d3c1: vmulps xmm4, xmm1, xmm4
0x10025d3c5: vsubps xmm3, xmm3, xmm4
0x10025d3c9: vpermilps xmm3, xmm3, 0xd2
0x10025d3cf: vaddps xmm2, xmm2, xmm3
0x10025d3d3: vmulps xmm1, xmm1, xmmword ptr [rip + 0x84b625] ; 0x100aa8a00
0x10025d3db: vmovshdup xmm3, xmm1
0x10025d3df: vaddss xmm3, xmm1, xmm3
0x10025d3e3: vpermilpd xmm1, xmm1, 1
0x10025d3e9: vaddss xmm1, xmm1, xmm3
0x10025d3ed: vsubss xmm0, xmm0, xmm1
0x10025d3f1: vmovshdup xmm1, xmm2
0x10025d3f5: vpermilpd xmm3, xmm2, 1
0x10025d3fb: vaddss xmm4, xmm2, xmm2
0x10025d3ff: vaddss xmm5, xmm1, xmm1
0x10025d403: vaddss xmm6, xmm3, xmm3
0x10025d407: vmulss xmm8, xmm2, xmm4
0x10025d40b: vmulss xmm7, xmm2, xmm5
0x10025d40f: vmulss xmm11, xmm2, xmm6
0x10025d413: vmulss xmm12, xmm0, xmm4
0x10025d417: vmulss xmm9, xmm1, xmm5
0x10025d41b: vmulss xmm1, xmm1, xmm6
0x10025d41f: vmulss xmm5, xmm0, xmm5
0x10025d423: vmulss xmm3, xmm3, xmm6
0x10025d427: vmulss xmm0, xmm0, xmm6
0x10025d42b: vmovss xmm10, dword ptr [rip + 0x847c8d] ; 0x100aa50c0
0x10025d433: vsubss xmm6, xmm10, xmm9
0x10025d438: vsubss xmm6, xmm6, xmm3
0x10025d43c: vaddss xmm2, xmm7, xmm0
0x10025d440: vsubss xmm4, xmm11, xmm5
0x10025d444: vinsertps xmm2, xmm6, xmm2, 0x10
0x10025d44a: vinsertps xmm2, xmm2, xmm4, 0x20
0x10025d450: vsubss xmm0, xmm7, xmm0
0x10025d454: vsubss xmm4, xmm10, xmm8
0x10025d459: vsubss xmm3, xmm4, xmm3
0x10025d45d: vaddss xmm6, xmm1, xmm12
0x10025d462: vinsertps xmm0, xmm0, xmm3, 0x10
0x10025d468: vinsertps xmm0, xmm0, xmm6, 0x20
0x10025d46e: vaddss xmm3, xmm11, xmm5
0x10025d472: vsubss xmm1, xmm1, xmm12
0x10025d477: vsubss xmm4, xmm4, xmm9
0x10025d47c: vinsertps xmm1, xmm3, xmm1, 0x10
0x10025d482: vinsertps xmm1, xmm1, xmm4, 0x20
0x10025d488: vmovaps xmmword ptr [r14 + 0x20], xmm2
0x10025d48e: vmovaps xmmword ptr [r14 + 0x30], xmm0
0x10025d494: vmovaps xmmword ptr [r14 + 0x40], xmm1
0x10025d49a: mov rbx, qword ptr [r14 + 0x4e0]
0x10025d4a1: mov rax, qword ptr [r14]
0x10025d4a4: lea r13, [rbp - 0x360]
0x10025d4ab: mov rdi, r13
0x10025d4ae: mov rsi, qword ptr [rbp - 0x98]
0x10025d4b5: vzeroupper 
0x10025d4b8: call qword ptr [rax + 0x18]
0x10025d4bb: mov rax, qword ptr [rbp - 0x98]
0x10025d4c2: vmovaps xmm0, xmmword ptr [rax + 0x4f0]
0x10025d4ca: vxorps xmm1, xmm1, xmm1
0x10025d4ce: vblendps xmm2, xmm1, xmm0, 1
0x10025d4d4: vblendps xmm3, xmm1, xmm0, 2
0x10025d4da: vblendps xmm0, xmm1, xmm0, 4
0x10025d4e0: vmovaps xmmword ptr [rbp - 0x1b0], xmm2
0x10025d4e8: vmovaps xmmword ptr [rbp - 0x1a0], xmm3
0x10025d4f0: vmovaps xmmword ptr [rbp - 0x190], xmm0
0x10025d4f8: vmovaps xmm0, xmmword ptr [rip + 0x84b500] ; 0x100aa8a00
0x10025d500: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x10025d508: lea r15, [rbp - 0x90]
0x10025d50f: lea rdx, [rbp - 0x1b0]
0x10025d516: mov rdi, r15
0x10025d519: mov rsi, r13
0x10025d51c: mov r13, qword ptr [rbp - 0x98]
0x10025d523: call 0x100076df0 ; 0x100076df0
0x10025d528: mov rdi, rbx
0x10025d52b: mov rsi, r15
0x10025d52e: call 0x100463750 ; 0x100463750
0x10025d533: vmovaps xmm0, xmmword ptr [r13 + 0x50]
0x10025d539: vmulps xmm0, xmm0, xmm0
0x10025d53d: vmovshdup xmm1, xmm0
0x10025d541: vaddss xmm1, xmm0, xmm1
0x10025d545: vpermilpd xmm0, xmm0, 1
0x10025d54b: vaddss xmm0, xmm0, xmm1
0x10025d54f: vsqrtss xmm0, xmm0, xmm0
0x10025d553: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x10025d55b: vucomiss xmm0, dword ptr [rip + 0x84a285] ; 0x100aa77e8
0x10025d563: jbe 0x10025d854
0x10025d569: vmovss xmm0, dword ptr [r13 + 0x60]
0x10025d56f: vucomiss xmm0, dword ptr [rip + 0x854fbd] ; 0x100ab2534
0x10025d577: jbe 0x10025d854
0x10025d57d: cmp dword ptr [r13 + 0x2b8], 0
0x10025d585: je 0x10025d854
0x10025d58b: vmovaps xmm0, xmmword ptr [rbp - 0x130]
0x10025d593: vaddss xmm0, xmm0, dword ptr [rip + 0x84f7e1] ; 0x100aacd7c
0x10025d59b: vmovss dword ptr [rbp - 0xb0], xmm0
0x10025d5a3: vmovaps xmm1, xmmword ptr [rbp - 0x140]
0x10025d5ab: vaddss xmm0, xmm1, dword ptr [rip + 0x847b0d] ; 0x100aa50c0
0x10025d5b3: vpermilps xmm0, xmm0, 0xc0
0x10025d5b9: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x10025d5c1: vpermilps xmm0, xmm1, 0xc0
0x10025d5c7: vmovaps xmmword ptr [rbp - 0x250], xmm0
0x10025d5cf: vmulps xmm0, xmm0, xmmword ptr [rip + 0x84aac9] ; 0x100aa80a0
0x10025d5d7: vmulps xmm0, xmm0, xmmword ptr [rip + 0x84a091] ; 0x100aa7670
0x10025d5df: vmovaps xmmword ptr [rbp - 0x240], xmm0
0x10025d5e7: xor r14d, r14d
0x10025d5ea: lea r15, [rbp - 0x1b0]
0x10025d5f1: nop word ptr cs:[rax + rax]
0x10025d600: movzx eax, r14w
0x10025d604: mov rax, qword ptr [r13 + rax*8 + 0x1b8]
0x10025d60c: mov qword ptr [rbp - 0x1b0], rax
0x10025d613: call 0x10074a170 ; 0x10074a170
0x10025d618: mov qword ptr [rbp - 0x90], 0
0x10025d623: mov rdi, qword ptr [rip + 0x1b88636] ; 0x101de5c60
0x10025d62a: mov rbx, qword ptr [rdi]
0x10025d62d: lea rsi, [rbp - 0x90]
0x10025d634: mov rdx, r15
0x10025d637: mov rcx, rax
0x10025d63a: call qword ptr [rbx + 0x40]
0x10025d63d: mov r12, qword ptr [rbp - 0x90]
0x10025d644: test r12, r12
0x10025d647: je 0x10025d655
0x10025d649: vmovaps xmm0, xmmword ptr [r12 + 0x10]
0x10025d650: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10025d655: call 0x10074a170 ; 0x10074a170
0x10025d65a: mov r13, rax
0x10025d65d: mov qword ptr [rbp - 0x90], 0
0x10025d668: call 0x1000f8400 ; 0x1000f8400
0x10025d66d: mov rbx, qword ptr [rax]
0x10025d670: mov rdi, rax
0x10025d673: lea rsi, [rbp - 0x90]
0x10025d67a: mov rdx, r15
0x10025d67d: mov rcx, r13
0x10025d680: call qword ptr [rbx + 0x40]
0x10025d683: mov rbx, qword ptr [rbp - 0x90]
0x10025d68a: test rbx, rbx
0x10025d68d: je 0x10025d69d
0x10025d68f: mov rax, qword ptr [rbx + 0x18]
0x10025d693: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10025d698: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10025d69d: test r12, r12
0x10025d6a0: mov r13, qword ptr [rbp - 0x98]
0x10025d6a7: je 0x10025d6d3
0x10025d6a9: cmp dword ptr [r12 + 0x140], 0xa
0x10025d6b2: je 0x10025d840
0x10025d6b8: vmovss xmm0, dword ptr [r12 + 0x60]
0x10025d6bf: vsubss xmm0, xmm0, dword ptr [r13 + 0x60]
0x10025d6c5: vucomiss xmm0, dword ptr [rip + 0x84a113] ; 0x100aa77e0
0x10025d6cd: ja 0x10025d840
0x10025d6d3: mov rax, qword ptr [rbp - 0xb8]
0x10025d6da: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10025d6df: vsubps xmm0, xmm0, xmmword ptr [rax]
0x10025d6e3: vmulps xmm1, xmm0, xmm0
0x10025d6e7: vmovshdup xmm2, xmm1
0x10025d6eb: vaddss xmm2, xmm1, xmm2
0x10025d6ef: vpermilpd xmm1, xmm1, 1
0x10025d6f5: vaddss xmm1, xmm1, xmm2
0x10025d6f9: vsqrtss xmm1, xmm1, xmm1
0x10025d6fd: vmovss xmm2, dword ptr [rbp - 0xb0]
0x10025d705: vucomiss xmm2, xmm1
0x10025d709: jbe 0x10025d840
0x10025d70f: vmulps xmm1, xmm0, xmmword ptr [r13 + 0x50]
0x10025d715: vmovshdup xmm2, xmm1
0x10025d719: vaddss xmm2, xmm1, xmm2
0x10025d71d: vpermilpd xmm1, xmm1, 1
0x10025d723: vaddss xmm1, xmm1, xmm2
0x10025d727: vucomiss xmm1, dword ptr [rip + 0x84a0b9] ; 0x100aa77e8
0x10025d72f: jbe 0x10025d840
0x10025d735: test rbx, rbx
0x10025d738: je 0x10025d76f
0x10025d73a: vmovss xmm1, dword ptr [rip + 0x84baa2] ; 0x100aa91e4
0x10025d742: vucomiss xmm1, dword ptr [rbp - 0x140]
0x10025d74a: jbe 0x10025d7ed
0x10025d750: vmulps xmm1, xmm0, xmmword ptr [rbp - 0x130]
0x10025d758: mov rax, qword ptr [rbx + 0x18]
0x10025d75c: vmovaps xmmword ptr [rax + 0x50], xmm1
0x10025d761: mov rax, qword ptr [rbx + 0x18]
0x10025d765: vmovaps xmmword ptr [rax + 0x60], xmm0
0x10025d76a: jmp 0x10025d840 ; 0x10025d840
0x10025d76f: test r12, r12
0x10025d772: je 0x10025d840
0x10025d778: cmp byte ptr [r12 + 0x59d], 0
0x10025d781: je 0x10025d840
0x10025d787: vmovaps xmm1, xmmword ptr [rbp - 0x140]
0x10025d78f: vucomiss xmm1, dword ptr [rip + 0x856489] ; 0x100ab3c20
0x10025d797: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x130]
0x10025d79f: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x240]
0x10025d7a7: vaddps xmm0, xmm0, xmmword ptr [r12 + 0x50]
0x10025d7ae: vmovaps xmmword ptr [r12 + 0x50], xmm0
0x10025d7b5: jbe 0x10025d840
0x10025d7bb: mov dword ptr [r12 + 0x140], 0xa
0x10025d7c7: vxorps xmm0, xmm0, xmm0
0x10025d7cb: vmovups xmmword ptr [r12 + 0x148], xmm0
0x10025d7d5: vmovaps xmmword ptr [r12 + 0x160], xmm0
0x10025d7df: mov dword ptr [r12 + 0x170], 0
0x10025d7eb: jmp 0x10025d840 ; 0x10025d840
0x10025d7ed: mov rax, qword ptr [rbp - 0x1b8]
0x10025d7f4: mov rsi, qword ptr [rax + 0x270]
0x10025d7fb: mov rdi, qword ptr [rbx + 0x18]
0x10025d7ff: mov rdx, qword ptr [rbx + 0x20]
0x10025d803: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x250]
0x10025d80b: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10025d810: vmovaps xmmword ptr [rbp - 0x280], xmm0
0x10025d818: lea rcx, [rbp - 0x280]
0x10025d81f: vmovss xmm0, dword ptr [rip + 0x846d91] ; 0x100aa45b8
0x10025d827: call 0x100148160 ; 0x100148160
0x10025d82c: mov rdi, qword ptr [rbx + 0x10]
0x10025d830: call 0x1000f0f40 ; 0x1000f0f40
0x10025d835: nop word ptr cs:[rax + rax]
0x10025d840: inc r14d
0x10025d843: movzx eax, r14w
0x10025d847: cmp dword ptr [r13 + 0x2b8], eax
0x10025d84e: ja 0x10025d600
0x10025d854: cmp dword ptr [r13 + 0x140], 0xb
0x10025d85c: jne 0x10025d95a
0x10025d862: lea r14, [r13 + 0x148]
0x10025d869: call 0x1007abc10 ; 0x1007abc10
0x10025d86e: mov qword ptr [rbp - 0x90], 0
0x10025d879: mov rdi, qword ptr [rip + 0x1b883e0] ; 0x101de5c60
0x10025d880: mov rbx, qword ptr [rdi]
0x10025d883: lea rsi, [rbp - 0x90]
0x10025d88a: mov rdx, r14
0x10025d88d: mov rcx, rax
0x10025d890: call qword ptr [rbx + 0x40]
0x10025d893: mov rax, qword ptr [rbp - 0x90]
0x10025d89a: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10025d89f: vsubps xmm0, xmm0, xmmword ptr [r13 + 0x10]
0x10025d8a5: vmulps xmm0, xmm0, xmm0
0x10025d8a9: vmovshdup xmm1, xmm0
0x10025d8ad: vaddss xmm1, xmm0, xmm1
0x10025d8b1: vpermilpd xmm0, xmm0, 1
0x10025d8b7: vaddss xmm0, xmm0, xmm1
0x10025d8bb: vsqrtss xmm0, xmm0, xmm0
0x10025d8bf: vmovss xmm1, dword ptr [rax + 0x60]
0x10025d8c4: vmulss xmm1, xmm1, dword ptr [rip + 0x84b910] ; 0x100aa91dc
0x10025d8cc: vmovaps xmm2, xmmword ptr [r13 + 0x50]
0x10025d8d2: vmulps xmm2, xmm2, xmm2
0x10025d8d6: vmovshdup xmm3, xmm2
0x10025d8da: vaddss xmm3, xmm2, xmm3
0x10025d8de: vpermilpd xmm2, xmm2, 1
0x10025d8e4: vaddss xmm2, xmm2, xmm3
0x10025d8e8: vsqrtss xmm2, xmm2, xmm2
0x10025d8ec: vaddss xmm2, xmm2, dword ptr [rip + 0x8477cc] ; 0x100aa50c0
0x10025d8f4: vmulss xmm2, xmm2, dword ptr [r13 + 0x60]
0x10025d8fa: vaddss xmm1, xmm1, xmm2
0x10025d8fe: vucomiss xmm1, xmm0
0x10025d902: jbe 0x10025d929
0x10025d904: vxorps xmm0, xmm0, xmm0
0x10025d908: vucomiss xmm0, dword ptr [r13 + 0x4d4]
0x10025d911: jb 0x10025d929
0x10025d913: cmp dword ptr [rax + 0x140], 0xa
0x10025d91a: jne 0x10025d929
0x10025d91c: mov dword ptr [r13 + 0x4d4], 0x3fc00000
0x10025d927: jmp 0x10025d95a ; 0x10025d95a
0x10025d929: cmp dword ptr [rax + 0x140], 0xa
0x10025d930: je 0x10025d95a
0x10025d932: mov dword ptr [r13 + 0x140], 5
0x10025d93d: vxorps xmm0, xmm0, xmm0
0x10025d941: vmovups xmmword ptr [r14], xmm0
0x10025d946: vmovaps xmmword ptr [r13 + 0x160], xmm0
0x10025d94f: mov dword ptr [r13 + 0x170], 0
0x10025d95a: vmovss xmm1, dword ptr [r13 + 0x4d4]
0x10025d963: vxorps xmm0, xmm0, xmm0
0x10025d967: vucomiss xmm1, xmm0
0x10025d96b: mov r15, qword ptr [rbp - 0x1b8]
0x10025d972: jbe 0x10025da29
0x10025d978: vsubss xmm1, xmm1, dword ptr [rbp - 0xd0]
0x10025d980: vmovss dword ptr [r13 + 0x4d4], xmm1
0x10025d989: vucomiss xmm0, xmm1
0x10025d98d: jbe 0x10025da29
0x10025d993: lea r14, [r13 + 0x148]
0x10025d99a: call 0x1007abc10 ; 0x1007abc10
0x10025d99f: mov qword ptr [rbp - 0x90], 0
0x10025d9aa: mov rdi, qword ptr [rip + 0x1b882af] ; 0x101de5c60
0x10025d9b1: mov rbx, qword ptr [rdi]
0x10025d9b4: lea rsi, [rbp - 0x90]
0x10025d9bb: mov rdx, r14
0x10025d9be: mov rcx, rax
0x10025d9c1: call qword ptr [rbx + 0x40]
0x10025d9c4: mov rax, qword ptr [rbp - 0x90]
0x10025d9cb: test rax, rax
0x10025d9ce: je 0x10025da01
0x10025d9d0: cmp byte ptr [rax + 0x59d], 0
0x10025d9d7: je 0x10025da01
0x10025d9d9: mov dword ptr [rax + 0x140], 5
0x10025d9e3: vxorps xmm0, xmm0, xmm0
0x10025d9e7: vmovups xmmword ptr [rax + 0x148], xmm0
0x10025d9ef: vmovaps xmmword ptr [rax + 0x160], xmm0
0x10025d9f7: mov dword ptr [rax + 0x170], 0
0x10025da01: mov dword ptr [r13 + 0x140], 5
0x10025da0c: vxorps xmm0, xmm0, xmm0
0x10025da10: vmovups xmmword ptr [r14], xmm0
0x10025da15: vmovaps xmmword ptr [r13 + 0x160], xmm0
0x10025da1e: mov dword ptr [r13 + 0x170], 0
0x10025da29: cmp dword ptr [r13 + 0x140], 0xa
0x10025da31: je 0x10025da3b
0x10025da33: mov dword ptr [r13 + 0x78], 0
0x10025da3b: mov rax, qword ptr [r13 + 0x4e0]
0x10025da42: mov rdi, qword ptr [rax + 0x68]
0x10025da46: test rdi, rdi
0x10025da49: je 0x10025da58
0x10025da4b: call 0x100098790 ; 0x100098790
0x10025da50: test al, al
0x10025da52: jne 0x10025dbd6
0x10025da58: mov eax, dword ptr [r13 + 0x500]
0x10025da5f: mov ecx, 5
0x10025da64: cmp eax, dword ptr [rip + 0xacd946] ; 0x100d2b3b0
0x10025da6a: jne 0x10025db27
0x10025da70: cmp byte ptr [r13 + 0x504], 0
0x10025da78: jne 0x10025db27
0x10025da7e: vmovaps xmm0, xmmword ptr [r13 + 0x50]
0x10025da84: vmulps xmm0, xmm0, xmm0
0x10025da88: vmovshdup xmm1, xmm0
0x10025da8c: vaddss xmm1, xmm0, xmm1
0x10025da90: vpermilpd xmm0, xmm0, 1
0x10025da96: vaddss xmm0, xmm0, xmm1
0x10025da9a: vsqrtss xmm0, xmm0, xmm0
0x10025da9e: mov rax, qword ptr [r13 + 0x80]
0x10025daa5: vmovss xmm1, dword ptr [rax + 0x14]
0x10025daaa: vmovss xmm2, dword ptr [rax + 0x18]
0x10025daaf: vsubss xmm3, xmm2, xmm1
0x10025dab3: vucomiss xmm3, dword ptr [rip + 0x849e09] ; 0x100aa78c4
0x10025dabb: vmovss xmm2, dword ptr [rip + 0x8475fd] ; 0x100aa50c0
0x10025dac3: ja 0x10025dad7
0x10025dac5: vmovss xmm4, dword ptr [rip + 0x84bb03] ; 0x100aa95d0
0x10025dacd: vucomiss xmm4, xmm3
0x10025dad1: vmovaps xmm4, xmm2
0x10025dad5: jbe 0x10025dadf
0x10025dad7: vsubss xmm4, xmm0, xmm1
0x10025dadb: vdivss xmm4, xmm4, xmm3
0x10025dadf: vxorps xmm3, xmm3, xmm3
0x10025dae3: vmaxss xmm3, xmm3, xmm4
0x10025dae7: vminss xmm2, xmm2, xmm3
0x10025daeb: mov ecx, 3
0x10025daf0: vucomiss xmm2, dword ptr [rip + 0x846ac0] ; 0x100aa45b8
0x10025daf8: ja 0x10025db27
0x10025dafa: vmulss xmm1, xmm1, dword ptr [rip + 0x849ce6] ; 0x100aa77e8
0x10025db02: mov ecx, 2
0x10025db07: vucomiss xmm0, xmm1
0x10025db0b: ja 0x10025db27
0x10025db0d: mov eax, dword ptr [r13 + 0x140]
0x10025db14: mov ecx, 1
0x10025db19: mov edx, eax
0x10025db1b: or edx, 4
0x10025db1e: cmp edx, 7
0x10025db21: jne 0x10025e519
0x10025db27: mov eax, dword ptr [r13 + 0x140]
0x10025db2e: vmovss xmm0, dword ptr [r13 + 0x4d0]
0x10025db37: vxorps xmm1, xmm1, xmm1
0x10025db3b: vucomiss xmm0, xmm1
0x10025db3f: mov edx, 6
0x10025db44: cmovbe edx, ecx
0x10025db47: cmp eax, 0xa
0x10025db4a: mov ebx, 4
0x10025db4f: cmovne ebx, edx
0x10025db52: mov ecx, dword ptr [r13 + 0xe0]
0x10025db59: cmp ebx, ecx
0x10025db5b: je 0x10025dbcd
0x10025db5d: cmp ecx, 1
0x10025db60: jne 0x10025db95
0x10025db62: mov rcx, qword ptr [r13 + 0x80]
0x10025db69: dec eax
0x10025db6b: vmovss xmm0, dword ptr [rip + 0x849581] ; 0x100aa70f4
0x10025db73: vucomiss xmm0, dword ptr [rcx + 0x10]
0x10025db78: lea rsi, [rip + 0x90d3fd] ; 0x100b6af7c CrabShocked
0x10025db7f: lea rcx, [rip + 0x90d3c8] ; 0x100b6af4e CrabExitHide
0x10025db86: cmovbe rsi, rcx
0x10025db8a: cmp eax, 2
0x10025db8d: cmovae rsi, rcx
0x10025db91: xor ebx, ebx
0x10025db93: jmp 0x10025dbaa ; 0x10025dbaa
0x10025db95: xor eax, eax
0x10025db97: cmp ebx, 6
0x10025db9a: ja 0x10025dbcf
0x10025db9c: movsxd rax, ebx
0x10025db9f: lea rcx, [rip + 0x9b605a] ; 0x100c13c00
0x10025dba6: mov rsi, qword ptr [rcx + rax*8]
0x10025dbaa: mov rax, qword ptr [r13 + 0x4e0]
0x10025dbb1: mov rdi, qword ptr [rax + 0x68]
0x10025dbb5: test rdi, rdi
0x10025dbb8: je 0x10025dbcd
0x10025dbba: vmovss xmm0, dword ptr [rip + 0x8474fe] ; 0x100aa50c0
0x10025dbc2: xor edx, edx
0x10025dbc4: vmovaps xmm1, xmm0
0x10025dbc8: call 0x1000967b0 ; 0x1000967b0
0x10025dbcd: mov eax, ebx
0x10025dbcf: mov dword ptr [r13 + 0xe0], eax
0x10025dbd6: mov rdi, qword ptr [r15 + 0x138]
0x10025dbdd: vmovaps xmm0, xmmword ptr [rip + 0x84b6fb] ; 0x100aa92e0
0x10025dbe5: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x10025dbed: lea rsi, [rbp - 0x150]
0x10025dbf4: lea rdx, [rbp - 0x90]
0x10025dbfb: vmovss xmm0, dword ptr [rip + 0x848ea1] ; 0x100aa6aa4
0x10025dc03: lea r8, [rbp - 0x210]
0x10025dc0a: xor ecx, ecx
0x10025dc0c: call 0x100776a90 ; 0x100776a90
0x10025dc11: test al, al
0x10025dc13: je 0x10025dcde
0x10025dc19: mov al, byte ptr [rbp - 0x1ec]
0x10025dc1f: and al, 1
0x10025dc21: je 0x10025dcde
0x10025dc27: vmovaps xmm0, xmmword ptr [rbp - 0x210]
0x10025dc2f: vsubps xmm1, xmm0, xmmword ptr [r13 + 0x10]
0x10025dc35: vmulps xmm1, xmm1, xmm1
0x10025dc39: vmovshdup xmm2, xmm1
0x10025dc3d: vaddss xmm2, xmm1, xmm2
0x10025dc41: vpermilpd xmm1, xmm1, 1
0x10025dc47: vaddss xmm1, xmm1, xmm2
0x10025dc4b: vsqrtss xmm1, xmm1, xmm1
0x10025dc4f: vaddss xmm1, xmm1, dword ptr [rip + 0x84746d] ; 0x100aa50c4
0x10025dc57: vdivss xmm1, xmm1, dword ptr [rip + 0x848e49] ; 0x100aa6aa8
0x10025dc5f: vxorps xmm2, xmm2, xmm2
0x10025dc63: vmaxss xmm1, xmm2, xmm1
0x10025dc67: vmovss xmm3, dword ptr [rip + 0x847451] ; 0x100aa50c0
0x10025dc6f: vminss xmm1, xmm3, xmm1
0x10025dc73: vsubss xmm2, xmm3, xmm1
0x10025dc77: mov rax, qword ptr [r13 + 0x80]
0x10025dc7e: vmulss xmm1, xmm2, dword ptr [rax + 0x10]
0x10025dc83: vmulss xmm1, xmm1, dword ptr [rip + 0x849b61] ; 0x100aa77ec
0x10025dc8b: mov rdi, qword ptr [r15 + 0x500]
0x10025dc92: vmovaps xmmword ptr [rbp - 0x270], xmm0
0x10025dc9a: vpermilps xmm0, xmm2, 0xc0
0x10025dca0: vmulps xmm0, xmm0, xmmword ptr [rip + 0x84dae8] ; 0x100aab790
0x10025dca8: vinsertps xmm0, xmm0, xmm3, 0x30
0x10025dcae: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x10025dcb6: vmulss xmm0, xmm2, dword ptr [rip + 0x84a976] ; 0x100aa8634
0x10025dcbe: lea rdx, [rbp - 0x270]
0x10025dcc5: lea rcx, [rbp - 0x90]
0x10025dccc: vmovss xmm2, dword ptr [rip + 0x8468e4] ; 0x100aa45b8
0x10025dcd4: mov esi, 1
0x10025dcd9: call 0x1004d3940 ; 0x1004d3940
0x10025dcde: cmp byte ptr [r13 + 0xd8], 0
0x10025dce6: je 0x10025ded0
0x10025dcec: cmp dword ptr [r13 + 0x140], 0xa
0x10025dcf4: jne 0x10025ded0
0x10025dcfa: cmp byte ptr [r13 + 0x59c], 0
0x10025dd02: je 0x10025dd1e
0x10025dd04: mov rax, qword ptr [rbp - 0xd8]
0x10025dd0b: mov eax, dword ptr [rax + 0xe0]
0x10025dd11: cmp eax, dword ptr [r13 + 0x598]
0x10025dd18: jne 0x10025ded0
0x10025dd1e: mov eax, dword ptr [r13 + 0x500]
0x10025dd25: cmp eax, dword ptr [rip + 0xacd685] ; 0x100d2b3b0
0x10025dd2b: jne 0x10025ded0
0x10025dd31: vmovss xmm0, dword ptr [rip + 0x8493bb] ; 0x100aa70f4
0x10025dd39: vucomiss xmm0, dword ptr [r13 + 0x60]
0x10025dd3f: jbe 0x10025ded0
0x10025dd45: mov rax, qword ptr [rbp - 0xd8]
0x10025dd4c: mov rbx, qword ptr [rax + 0x20]
0x10025dd50: mov rsi, qword ptr [rbx + 0x258]
0x10025dd57: lea rdi, [rbp - 0x90]
0x10025dd5e: call 0x1007f26b0 ; 0x1007f26b0
0x10025dd63: mov rsi, qword ptr [rbx + 0x260]
0x10025dd6a: lea rdi, [rbp - 0x1b0]
0x10025dd71: call 0x1007f26b0 ; 0x1007f26b0
0x10025dd76: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10025dd7e: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x1b0]
0x10025dd86: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8498e2] ; 0x100aa7670
0x10025dd8e: vmovaps xmm1, xmmword ptr [r13 + 0x10]
0x10025dd94: vsubps xmm0, xmm1, xmm0
0x10025dd98: vmulps xmm0, xmm0, xmm0
0x10025dd9c: vmovshdup xmm1, xmm0
0x10025dda0: vaddss xmm1, xmm0, xmm1
0x10025dda4: vpermilpd xmm0, xmm0, 1
0x10025ddaa: vaddss xmm0, xmm0, xmm1
0x10025ddae: vmovss xmm1, dword ptr [rip + 0x84933e] ; 0x100aa70f4
0x10025ddb6: vucomiss xmm1, xmm0
0x10025ddba: mov rax, qword ptr [r13 + 0x5a0]
0x10025ddc1: jbe 0x10025ded7
0x10025ddc7: test rax, rax
0x10025ddca: jne 0x10025de83
0x10025ddd0: mov rdi, qword ptr [r15 + 0x538]
0x10025ddd7: lea rsi, [r13 + 8]
0x10025dddb: xor edx, edx
0x10025dddd: mov ecx, 1
0x10025dde2: mov r8d, 1
0x10025dde8: call 0x1001c7880 ; 0x1001c7880
0x10025dded: mov qword ptr [r13 + 0x5a0], rax
0x10025ddf4: mov rbx, qword ptr [r15 + 0x488]
0x10025ddfb: call 0x1005bb8f0 ; 0x1005bb8f0
0x10025de00: mov rdi, rbx
0x10025de03: mov rsi, rax
0x10025de06: call 0x100039f40 ; 0x100039f40
0x10025de0b: mov rdi, qword ptr [r13 + 0x5a0]
0x10025de12: vxorps xmm0, xmm0, xmm0
0x10025de16: vmovups xmmword ptr [rbp - 0x160], xmm0
0x10025de1e: mov byte ptr [rbp - 0x168], 0xc
0x10025de25: mov word ptr [rbp - 0x163], 0x646e
0x10025de2e: mov dword ptr [rbp - 0x167], 0x61484955
0x10025de38: mov byte ptr [rbp - 0x161], 0
0x10025de3f: lea rdx, [rbp - 0x168]
0x10025de46: mov ecx, 1
0x10025de4b: mov r8d, 1
0x10025de51: xor r9d, r9d
0x10025de54: mov rsi, rax
0x10025de57: call 0x1001c7bc0 ; 0x1001c7bc0
0x10025de5c: mov qword ptr [r13 + 0x5a8], rax
0x10025de63: test byte ptr [rbp - 0x168], 1
0x10025de6a: je 0x10025de8d
0x10025de6c: mov rbx, qword ptr [rbp - 0x158]
0x10025de73: call 0x1007e50d0 ; 0x1007e50d0
0x10025de78: mov rdi, rax
0x10025de7b: mov rsi, rbx
0x10025de7e: call 0x1007e5db0 ; 0x1007e5db0
0x10025de83: lea rax, [r13 + 0x5a8]
0x10025de8a: mov rax, qword ptr [rax]
0x10025de8d: test rax, rax
0x10025de90: je 0x10025def8
0x10025de92: mov ecx, dword ptr [rax + 0x10]
0x10025de95: movzx eax, word ptr [rax + 0x14]
0x10025de99: shl rax, 0x20
0x10025de9d: or rax, rcx
0x10025dea0: bt rax, 0x22
0x10025dea5: jae 0x10025def8
0x10025dea7: mov rbx, qword ptr [rbp - 0xd8]
0x10025deae: mov rdi, qword ptr [rbx + 0x10]
0x10025deb2: call 0x1000f0f40 ; 0x1000f0f40
0x10025deb7: mov rdi, qword ptr [rbx + 0x10]
0x10025debb: mov dword ptr [rdi + 0xb0], 2
0x10025dec5: lea rsi, [r13 + 8]
0x10025dec9: call 0x1000f48a0 ; 0x1000f48a0
0x10025dece: jmp 0x10025def8 ; 0x10025def8
0x10025ded0: mov rax, qword ptr [r13 + 0x5a0]
0x10025ded7: test rax, rax
0x10025deda: je 0x10025def8
0x10025dedc: mov dword ptr [rax + 0x34], 0
0x10025dee3: or byte ptr [rax + 0x28], 0xc
0x10025dee7: mov byte ptr [rax + 4], 0
0x10025deeb: vxorps xmm0, xmm0, xmm0
0x10025deef: vmovaps xmmword ptr [r13 + 0x5a0], xmm0
0x10025def8: mov rdi, qword ptr [r15 + 0x280]
0x10025deff: mov eax, dword ptr [r13 + 0x500]
0x10025df06: mov dword ptr [rbp - 0x100], eax
0x10025df0c: lea rsi, [rbp - 0x100]
0x10025df13: call 0x100101e20 ; 0x100101e20
0x10025df18: mov rbx, rax
0x10025df1b: test rbx, rbx
0x10025df1e: je 0x10025df55
0x10025df20: mov rdi, rbx
0x10025df23: call 0x1000fe050 ; 0x1000fe050
0x10025df28: test al, al
0x10025df2a: jne 0x10025df55
0x10025df2c: mov rdi, qword ptr [rbx + 0x10]
0x10025df30: call 0x1000f0f40 ; 0x1000f0f40
0x10025df35: mov rax, qword ptr [r15 + 0x178]
0x10025df3c: mov rax, qword ptr [rax + 0x40]
0x10025df40: mov eax, dword ptr [rax + 0x820]
0x10025df46: mov dword ptr [r13 + 0x598], eax
0x10025df4d: mov byte ptr [r13 + 0x59c], 0
0x10025df55: mov rdi, qword ptr [r15 + 0x280]
0x10025df5c: call 0x1000fc260 ; 0x1000fc260
0x10025df61: mov rbx, qword ptr [rax + 0x20]
0x10025df65: mov rsi, qword ptr [rbx + 0x258]
0x10025df6c: lea rdi, [rbp - 0x90]
0x10025df73: call 0x1007f26b0 ; 0x1007f26b0
0x10025df78: mov rsi, qword ptr [rbx + 0x260]
0x10025df7f: lea rdi, [rbp - 0x1b0]
0x10025df86: call 0x1007f26b0 ; 0x1007f26b0
0x10025df8b: cmp byte ptr [r13 + 0x504], 0
0x10025df93: je 0x10025e012
0x10025df95: cmp byte ptr [r13 + 0x59d], 0
0x10025df9d: jne 0x10025e4ea
0x10025dfa3: vmovss xmm0, dword ptr [r13 + 0x590]
0x10025dfac: vandps xmm0, xmm0, xmmword ptr [rip + 0x84995c] ; 0x100aa7910
0x10025dfb4: vmovss xmm1, dword ptr [rip + 0x849908] ; 0x100aa78c4
0x10025dfbc: vucomiss xmm1, xmm0
0x10025dfc0: jb 0x10025e4d0
0x10025dfc6: movzx ebx, byte ptr [r13 + 0x51c]
0x10025dfce: mov al, byte ptr [r13 + 0x51d]
0x10025dfd5: test al, al
0x10025dfd7: je 0x10025e2de
0x10025dfdd: cmp al, 2
0x10025dfdf: je 0x10025e29b
0x10025dfe5: cmp al, 1
0x10025dfe7: jne 0x10025e34c
0x10025dfed: movzx eax, word ptr [r13 + 0x524]
0x10025dff5: mov rcx, qword ptr [r15 + 0x370]
0x10025dffc: cmp dword ptr [rcx + 0x410], eax
0x10025e002: jbe 0x10025e520
0x10025e008: mov rax, qword ptr [rcx + rax*8 + 0x10]
0x10025e00d: jmp 0x10025e2fe ; 0x10025e2fe
0x10025e012: mov rax, qword ptr [r13 + 0x80]
0x10025e019: cmp byte ptr [rax + 0x1c], 0
0x10025e01d: je 0x10025df95
0x10025e023: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10025e02b: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x1b0]
0x10025e033: vmulps xmm0, xmm0, xmmword ptr [rip + 0x849635] ; 0x100aa7670
0x10025e03b: vmovshdup xmm1, xmm0
0x10025e03f: vsubss xmm1, xmm1, dword ptr [r13 + 0x14]
0x10025e045: vandps xmm1, xmm1, xmmword ptr [rip + 0x8498c3] ; 0x100aa7910
0x10025e04d: vmovss xmm2, dword ptr [rip + 0x849793] ; 0x100aa77e8
0x10025e055: vucomiss xmm2, xmm1
0x10025e059: jbe 0x10025df95
0x10025e05f: vsubps xmm0, xmm0, xmmword ptr [r13 + 0x10]
0x10025e065: vmulps xmm0, xmm0, xmm0
0x10025e069: vmovshdup xmm1, xmm0
0x10025e06d: vaddss xmm1, xmm0, xmm1
0x10025e071: vpermilpd xmm0, xmm0, 1
0x10025e077: vaddss xmm0, xmm0, xmm1
0x10025e07b: vsqrtss xmm0, xmm0, xmm0
0x10025e07f: vmovss xmm1, dword ptr [r13 + 0x60]
0x10025e085: vaddss xmm1, xmm1, xmm1
0x10025e089: vucomiss xmm1, xmm0
0x10025e08d: jbe 0x10025df95
0x10025e093: mov rdi, qword ptr [r15 + 0x280]
0x10025e09a: call 0x1000fc260 ; 0x1000fc260
0x10025e09f: mov rax, qword ptr [rax + 0x10]
0x10025e0a3: cmp dword ptr [rax + 0x90], 0
0x10025e0aa: jne 0x10025df95
0x10025e0b0: vmovss xmm0, dword ptr [r13 + 0x4d0]
0x10025e0b9: vxorps xmm1, xmm1, xmm1
0x10025e0bd: vucomiss xmm0, xmm1
0x10025e0c1: ja 0x10025df95
0x10025e0c7: cmp dword ptr [r13 + 0xe0], 4
0x10025e0cf: je 0x10025df95
0x10025e0d5: mov dword ptr [r13 + 0x4d0], 0x3f800000
0x10025e0e0: mov rdi, qword ptr [r15 + 0x280]
0x10025e0e7: call 0x1000fc260 ; 0x1000fc260
0x10025e0ec: mov rbx, qword ptr [rax + 0x30]
0x10025e0f0: vmovss xmm0, dword ptr [rbx + 0xc]
0x10025e0f5: vmovss xmm1, dword ptr [rbx + 0x58]
0x10025e0fa: vaddss xmm0, xmm0, dword ptr [rip + 0x84caa6] ; 0x100aaaba8
0x10025e102: vmovss dword ptr [rbx + 0xc], xmm0
0x10025e107: vxorps xmm0, xmm0, xmm0
0x10025e10b: vucomiss xmm1, xmm0
0x10025e10f: ja 0x10025e167
0x10025e111: vmovss xmm1, dword ptr [rip + 0x846fa7] ; 0x100aa50c0
0x10025e119: vaddss xmm2, xmm1, dword ptr [rbx + 8]
0x10025e11e: vmulss xmm2, xmm2, dword ptr [rip + 0x84a4fa] ; 0x100aa8620
0x10025e126: vmaxss xmm2, xmm0, xmm2
0x10025e12a: vminss xmm1, xmm1, xmm2
0x10025e12e: vucomiss xmm1, xmm0
0x10025e132: jbe 0x10025e167
0x10025e134: mov rdi, rbx
0x10025e137: call 0x10011fe00 ; 0x10011fe00
0x10025e13c: mov esi, 1
0x10025e141: mov rdi, rbx
0x10025e144: call 0x10011fce0 ; 0x10011fce0
0x10025e149: mov rax, qword ptr [r15 + 0x160]
0x10025e150: vmovaps xmm0, xmmword ptr [rip + 0x84ce68] ; 0x100aaafc0
0x10025e158: vmovups xmmword ptr [rax + 0x74], xmm0
0x10025e15d: mov dword ptr [rax + 0x84], 0x3e4ccccd
0x10025e167: mov rdi, qword ptr [r15 + 0x438]
0x10025e16e: mov rax, qword ptr [rbp - 0xb8]
0x10025e175: vmovaps xmm0, xmmword ptr [rax]
0x10025e179: vmovaps xmmword ptr [rbp - 0x260], xmm0
0x10025e181: mov rax, qword ptr [rip + 0x849f18] ; 0x100aa80a0
0x10025e188: mov qword ptr [rbp - 0x220], rax
0x10025e18f: mov dword ptr [rbp - 0x218], 0
0x10025e199: lea rax, [rip + 0x1b91a80] ; 0x101defc20
0x10025e1a0: mov rcx, qword ptr [rax]
0x10025e1a3: vmovss xmm0, dword ptr [rip + 0x84a425] ; 0x100aa85d0
0x10025e1ab: lea rsi, [rbp - 0x260]
0x10025e1b2: lea rdx, [rbp - 0x220]
0x10025e1b9: xor r8d, r8d
0x10025e1bc: call 0x1002de9e0 ; 0x1002de9e0
0x10025e1c1: mov qword ptr [rbp - 0x90], rax
0x10025e1c8: mov dword ptr [rbp - 0x88], edx
0x10025e1ce: lea rdi, [rbp - 0x90]
0x10025e1d5: call 0x100316270 ; 0x100316270
0x10025e1da: test rax, rax
0x10025e1dd: je 0x10025df95
0x10025e1e3: mov dword ptr [rax + 0x80], 0x3e4ccccd
0x10025e1ed: vmovaps xmm0, xmmword ptr [rip + 0x84d4eb] ; 0x100aab6e0
0x10025e1f5: vmovaps xmmword ptr [rax + 0x110], xmm0
0x10025e1fd: vmovaps xmmword ptr [rax + 0x120], xmm0
0x10025e205: cmp byte ptr [r13 + 0x59d], 0
0x10025e20d: jne 0x10025e4ea
0x10025e213: jmp 0x10025dfa3 ; 0x10025dfa3
0x10025e218: vxorps xmm2, xmm2, xmmword ptr [rip + 0x8496e0] ; 0x100aa7900
0x10025e220: vpshufd xmm2, xmm2, 0xc0
0x10025e225: vmulps xmm1, xmm1, xmm2
0x10025e229: vaddps xmm0, xmm0, xmm1
0x10025e22d: vminss xmm1, xmm3, dword ptr [rip + 0x84a41b] ; 0x100aa8650 33s?
0x10025e235: vpermilps xmm1, xmm1, 0xc0
0x10025e23b: vmulps xmm1, xmm1, xmm0
0x10025e23f: vmovaps xmmword ptr [r14 + 0x50], xmm1
0x10025e245: vmulps xmm0, xmm1, xmm1
0x10025e249: vmovshdup xmm2, xmm0
0x10025e24d: vaddss xmm2, xmm0, xmm2
0x10025e251: vpermilpd xmm0, xmm0, 1
0x10025e257: vaddss xmm0, xmm0, xmm2
0x10025e25b: vsqrtss xmm0, xmm0, xmm0
0x10025e25f: vmovss xmm2, dword ptr [rip + 0x846351] ; 0x100aa45b8
0x10025e267: vucomiss xmm2, xmm0
0x10025e26b: vmovaps xmm3, xmmword ptr [rbp - 0x40]
0x10025e270: jbe 0x10025cef7
0x10025e276: mov byte ptr [r14 + 0x504], 0
0x10025e27e: vxorps xmm1, xmm1, xmm1
0x10025e282: vmovaps xmmword ptr [r14 + 0x50], xmm1
0x10025e288: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10025e290: vmovaps xmmword ptr [r14 + 0x10], xmm0
0x10025e296: jmp 0x10025cef7 ; 0x10025cef7
0x10025e29b: movzx eax, word ptr [r13 + 0x524]
0x10025e2a3: mov ecx, dword ptr [r13 + 0x510]
0x10025e2aa: mov dword ptr [r13 + 0x130], ecx
0x10025e2b1: vmovups ymm0, ymmword ptr [r13 + 0x540]
0x10025e2ba: vmovups ymmword ptr [r13 + 0x184], ymm0
0x10025e2c3: vmovups ymm0, ymmword ptr [r13 + 0x550]
0x10025e2cc: vmovups ymmword ptr [r13 + 0x194], ymm0
0x10025e2d5: vxorps xmm0, xmm0, xmm0
0x10025e2d9: jmp 0x10025e392 ; 0x10025e392
0x10025e2de: mov rdi, qword ptr [r15 + 0x280]
0x10025e2e5: mov eax, dword ptr [r13 + 0x520]
0x10025e2ec: mov dword ptr [rbp - 0xf8], eax
0x10025e2f2: lea rsi, [rbp - 0xf8]
0x10025e2f9: call 0x100101e20 ; 0x100101e20
0x10025e2fe: lea rcx, [rax + 8]
0x10025e302: test rax, rax
0x10025e305: cmove rcx, rax
0x10025e309: mov eax, dword ptr [r13 + 0x510]
0x10025e310: mov dword ptr [r13 + 0x130], eax
0x10025e317: vmovups ymm0, ymmword ptr [r13 + 0x540]
0x10025e320: vmovups ymmword ptr [r13 + 0x184], ymm0
0x10025e329: vmovups ymm0, ymmword ptr [r13 + 0x550]
0x10025e332: vmovups ymmword ptr [r13 + 0x194], ymm0
0x10025e33b: test rcx, rcx
0x10025e33e: je 0x10025e3e2
0x10025e344: xor eax, eax
0x10025e346: vxorps xmm0, xmm0, xmm0
0x10025e34a: jmp 0x10025e394 ; 0x10025e394
0x10025e34c: vmovaps xmm0, xmmword ptr [r13 + 0x530]
0x10025e355: vaddps xmm0, xmm0, xmmword ptr [r13 + 0x120]
0x10025e35e: mov eax, dword ptr [r13 + 0x510]
0x10025e365: mov dword ptr [r13 + 0x130], eax
0x10025e36c: vmovups ymm1, ymmword ptr [r13 + 0x540]
0x10025e375: vmovups ymmword ptr [r13 + 0x184], ymm1
0x10025e37e: vmovups ymm1, ymmword ptr [r13 + 0x550]
0x10025e387: vmovups ymmword ptr [r13 + 0x194], ymm1
0x10025e390: xor eax, eax
0x10025e392: xor ecx, ecx
0x10025e394: mov dword ptr [r13 + 0x140], ebx
0x10025e39b: mov qword ptr [r13 + 0x148], rcx
0x10025e3a2: mov dword ptr [r13 + 0x150], eax
0x10025e3a9: mov dword ptr [r13 + 0x154], 0
0x10025e3b4: vmovaps xmmword ptr [r13 + 0x160], xmm0
0x10025e3bd: mov dword ptr [r13 + 0x170], 0
0x10025e3c8: vmovss xmm0, dword ptr [r13 + 0x180]
0x10025e3d1: vmaxss xmm0, xmm0, dword ptr [rip + 0x84a25b] ; 0x100aa8634
0x10025e3d9: vmovss dword ptr [r13 + 0x180], xmm0
0x10025e3e2: vmovaps xmm0, xmmword ptr [r13 + 0x570]
0x10025e3eb: vsubps xmm1, xmm0, xmmword ptr [r13 + 0x10]
0x10025e3f1: vmulps xmm1, xmm1, xmm1
0x10025e3f5: vmovshdup xmm2, xmm1
0x10025e3f9: vaddss xmm2, xmm1, xmm2
0x10025e3fd: vpermilpd xmm1, xmm1, 1
0x10025e403: vaddss xmm1, xmm1, xmm2
0x10025e407: vsqrtss xmm1, xmm1, xmm1
0x10025e40b: vucomiss xmm1, dword ptr [rip + 0x8498a1] ; 0x100aa7cb4
0x10025e413: jbe 0x10025e420
0x10025e415: mov rax, qword ptr [rbp - 0xb8]
0x10025e41c: vmovaps xmmword ptr [rax], xmm0
0x10025e420: cmp byte ptr [r13 + 0x580], 0
0x10025e428: je 0x10025e497
0x10025e42a: mov rdi, qword ptr [r15 + 0x280]
0x10025e431: mov eax, dword ptr [r13 + 0x584]
0x10025e438: mov dword ptr [rbp - 0xf0], eax
0x10025e43e: lea rsi, [rbp - 0xf0]
0x10025e445: vzeroupper 
0x10025e448: call 0x100101e20 ; 0x100101e20
0x10025e44d: mov rbx, rax
0x10025e450: mov rdi, qword ptr [r15 + 0x280]
0x10025e457: mov eax, dword ptr [r13 + 0x500]
0x10025e45e: mov dword ptr [rbp - 0xe8], eax
0x10025e464: lea rsi, [rbp - 0xe8]
0x10025e46b: call 0x100101e20 ; 0x100101e20
0x10025e470: test rbx, rbx
0x10025e473: je 0x10025e4d0
0x10025e475: cmp rbx, rax
0x10025e478: je 0x10025e4d0
0x10025e47a: test rax, rax
0x10025e47d: je 0x10025e488
0x10025e47f: mov rdi, qword ptr [rax + 0x10]
0x10025e483: call 0x1000f0f40 ; 0x1000f0f40
0x10025e488: mov rdi, qword ptr [rbx + 0x10]
0x10025e48c: lea rsi, [r13 + 8]
0x10025e490: call 0x1000f48a0 ; 0x1000f48a0
0x10025e495: jmp 0x10025e4d0 ; 0x10025e4d0
0x10025e497: mov eax, dword ptr [r13 + 0x500]
0x10025e49e: cmp eax, dword ptr [rip + 0xaccf0c] ; 0x100d2b3b0
0x10025e4a4: je 0x10025e4d0
0x10025e4a6: mov rdi, qword ptr [r15 + 0x280]
0x10025e4ad: mov dword ptr [rbp - 0xe0], eax
0x10025e4b3: lea rsi, [rbp - 0xe0]
0x10025e4ba: vzeroupper 
0x10025e4bd: call 0x100101e20 ; 0x100101e20
0x10025e4c2: test rax, rax
0x10025e4c5: je 0x10025e4d0
0x10025e4c7: mov rdi, qword ptr [rax + 0x10]
0x10025e4cb: call 0x1000f0f40 ; 0x1000f0f40
0x10025e4d0: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x10025e4d8: vaddss xmm0, xmm0, dword ptr [r13 + 0x590]
0x10025e4e1: vmovss dword ptr [r13 + 0x590], xmm0
0x10025e4ea: vmovss xmm0, dword ptr [r13 + 0xdc]
0x10025e4f3: vsubss xmm0, xmm0, dword ptr [rbp - 0xd0]
0x10025e4fb: vmovss dword ptr [r13 + 0xdc], xmm0
0x10025e504: add rsp, 0x338
0x10025e50b: pop rbx
0x10025e50c: pop r12
0x10025e50e: pop r13
0x10025e510: pop r14
0x10025e512: pop r15
0x10025e514: pop rbp
0x10025e515: vzeroupper 
0x10025e518: ret 
0x10025e519: xor ecx, ecx
0x10025e51b: jmp 0x10025db2e ; 0x10025db2e
0x10025e520: lea rdi, [rip + 0x91e0ab] ; 0x100b7c5d2 m_netState.aiObjectId < game->crabBarn->GetNumCrabs()
0x10025e527: lea rsi, [rip + 0x91e095] ; 0x100b7c5c3 Crab.cpp
0x10025e52e: mov edx, 0x4af
0x10025e533: mov ecx, 3
0x10025e538: call 0x1007e5f70 ; 0x1007e5f70
0x10025e53d: ud2 
0x10025e53f: mov rdi, rax
0x10025e542: call 0x100011bf0 ; 0x100011bf0
0x10025e547: mov rbx, rax
0x10025e54a: test byte ptr [rbp - 0x168], 1
0x10025e551: je 0x10025e57d
0x10025e553: mov r14, qword ptr [rbp - 0x158]
0x10025e55a: call 0x1007e50d0 ; 0x1007e50d0
0x10025e55f: mov rdi, rax
0x10025e562: mov rsi, r14
0x10025e565: call 0x1007e5db0 ; 0x1007e5db0
0x10025e56a: jmp 0x10025e57d ; 0x10025e57d
0x10025e56c: mov rdi, rax
0x10025e56f: call 0x100011bf0 ; 0x100011bf0
0x10025e574: jmp 0x10025e57a ; 0x10025e57a
0x10025e576: jmp 0x10025e57a ; 0x10025e57a
0x10025e578: jmp 0x10025e57a ; 0x10025e57a
0x10025e57a: mov rbx, rax
0x10025e57d: mov rdi, rbx
0x10025e580: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10025e585: nop word ptr cs:[rax + rax]
