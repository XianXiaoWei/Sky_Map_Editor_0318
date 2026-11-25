0x100335a40: push rbp
0x100335a41: mov rbp, rsp
0x100335a44: push r15
0x100335a46: push r14
0x100335a48: push r13
0x100335a4a: push r12
0x100335a4c: push rbx
0x100335a4d: and rsp, 0xffffffffffffffe0
0x100335a51: sub rsp, 0x380
0x100335a58: mov rbx, rsi
0x100335a5b: mov r14, rdi
0x100335a5e: mov rax, qword ptr [rip + 0x8d7e73] ; 0x100c0d8d8
0x100335a65: mov rax, qword ptr [rax]
0x100335a68: mov qword ptr [rsp + 0x360], rax
0x100335a70: mov qword ptr [rsp + 0x50], rdx
0x100335a75: mov rax, qword ptr [rdx + 0x160]
0x100335a7c: lea rcx, [rip + 0x1cc564d] ; 0x101ffb0d0
0x100335a83: cmp byte ptr [rcx], 0
0x100335a86: je 0x100335a95
0x100335a88: lea rcx, [rip + 0x982ab1] ; 0x100cb8540
0x100335a8f: vmovss xmm0, dword ptr [rcx]
0x100335a93: jmp 0x100335a9d ; 0x100335a9d
0x100335a95: vmovss xmm0, dword ptr [rip + 0x76f623] ; 0x100aa50c0
0x100335a9d: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x100335aa2: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x100335aa7: vmovss xmm1, dword ptr [rip + 0x770fed] ; 0x100aa6a9c
0x100335aaf: vmaxss xmm0, xmm1, xmm0
0x100335ab3: vmovss xmm1, dword ptr [rip + 0x770fe5] ; 0x100aa6aa0
0x100335abb: vminss xmm0, xmm1, xmm0
0x100335abf: vmovss dword ptr [rsp + 0x18], xmm0
0x100335ac5: vmovss xmm0, dword ptr [rbx + 0x184]
0x100335acd: vmovss dword ptr [rsp + 0x14], xmm0
0x100335ad3: mov rax, qword ptr [rbx + 0x78]
0x100335ad7: vmovaps xmm0, xmmword ptr [rbx + 0x80]
0x100335adf: vmulps xmm0, xmm0, xmm0
0x100335ae3: vmovshdup xmm1, xmm0
0x100335ae7: vaddss xmm1, xmm0, xmm1
0x100335aeb: vpermilpd xmm0, xmm0, 1
0x100335af1: vaddss xmm0, xmm0, xmm1
0x100335af5: vsqrtss xmm0, xmm0, xmm0
0x100335af9: vmulss xmm0, xmm0, dword ptr [rax + 0x10]
0x100335afe: vmovss dword ptr [rsp + 0x2c], xmm0
0x100335b04: vmovss xmm0, dword ptr [rbx + 0x294]
0x100335b0c: vxorps xmm1, xmm1, xmm1
0x100335b10: vucomiss xmm1, xmm0
0x100335b14: jb 0x100335b65
0x100335b16: mov rax, qword ptr [rsp + 0x50]
0x100335b1b: mov rdi, qword ptr [rax + 0x220]
0x100335b22: lea rsi, [rbx + 0x10]
0x100335b26: lea rdx, [rbx + 0x190]
0x100335b2d: lea r8, [rip + 0x2a3c] ; 0x100338570
0x100335b34: vmovss xmm0, dword ptr [rip + 0x772b30] ; 0x100aa866c
0x100335b3c: mov ecx, 0x20
0x100335b41: xor r9d, r9d
0x100335b44: call 0x1004ce4b0 ; 0x1004ce4b0
0x100335b49: vxorps xmm1, xmm1, xmm1
0x100335b4d: mov dword ptr [rbx + 0x290], eax
0x100335b53: mov dword ptr [rbx + 0x294], 0x3fc00000
0x100335b5d: vmovss xmm0, dword ptr [rip + 0x771c87] ; 0x100aa77ec
0x100335b65: vsubss xmm0, xmm0, dword ptr [rsp + 0x18]
0x100335b6b: vmovss dword ptr [rbx + 0x294], xmm0
0x100335b73: vmovss xmm0, dword ptr [rbx + 0x188]
0x100335b7b: vucomiss xmm1, xmm0
0x100335b7f: vmovss dword ptr [rsp + 0x1c], xmm0
0x100335b85: vmovaps xmm1, xmm0
0x100335b89: jb 0x100335bbc
0x100335b8b: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100335b90: vcvtsi2ss xmm0, xmm2, eax
0x100335b94: vmulss xmm0, xmm0, dword ptr [rip + 0x771554] ; 0x100aa70f0
0x100335b9c: vmovss xmm1, dword ptr [rip + 0x76f51c] ; 0x100aa50c0
0x100335ba4: vsubss xmm1, xmm1, xmm0
0x100335ba8: vmulss xmm1, xmm1, dword ptr [rip + 0x76ea08] ; 0x100aa45b8
0x100335bb0: vaddss xmm1, xmm0, xmm1
0x100335bb4: vmovss dword ptr [rbx + 0x188], xmm1
0x100335bbc: vmovss xmm0, dword ptr [rsp + 0x18]
0x100335bc2: vsubss xmm1, xmm1, xmm0
0x100335bc6: vmovss dword ptr [rbx + 0x188], xmm1
0x100335bce: lea r15, [rbx + 0x2a0]
0x100335bd5: vmovaps xmm1, xmmword ptr [rbx + 0x10]
0x100335bda: vmovaps xmmword ptr [rsp + 0xc0], xmm1
0x100335be3: vmovups ymm2, ymmword ptr [rbx + 0x20]
0x100335be8: vmovups ymm1, ymmword ptr [rbx + 0x30]
0x100335bed: vmovups ymmword ptr [rsp + 0xe0], ymm1
0x100335bf6: vmovups ymmword ptr [rsp + 0xd0], ymm2
0x100335bff: vmovaps xmm1, xmmword ptr [rbx + 0x50]
0x100335c04: vmovaps xmmword ptr [rsp + 0x100], xmm1
0x100335c0d: mov eax, dword ptr [rbx + 0x68]
0x100335c10: mov dword ptr [rsp + 0x118], eax
0x100335c17: mov rax, qword ptr [rbx + 0x60]
0x100335c1b: mov qword ptr [rsp + 0x110], rax
0x100335c23: mov rax, qword ptr [rbx + 0x78]
0x100335c27: vmovss xmm1, dword ptr [rax + 0x18]
0x100335c2c: lea rsi, [rsp + 0xc0]
0x100335c34: mov rdi, r15
0x100335c37: vzeroupper 
0x100335c3a: call 0x10062e690 ; 0x10062e690
0x100335c3f: mov rax, qword ptr [rbx + 0x78]
0x100335c43: cmp byte ptr [rax + 0x50], 0
0x100335c47: je 0x100335c70
0x100335c49: vmovss xmm1, dword ptr [rax + 0x14]
0x100335c4e: vmovss xmm0, dword ptr [rax + 0x74]
0x100335c53: vdivss xmm1, xmm1, dword ptr [rax + 0x18]
0x100335c58: vmulss xmm1, xmm1, dword ptr [rip + 0x771b8c] ; 0x100aa77ec
0x100335c60: movzx esi, byte ptr [rax + 0x51]
0x100335c64: mov rdi, r15
0x100335c67: call 0x10062e860 ; 0x10062e860
0x100335c6c: mov rax, qword ptr [rbx + 0x78]
0x100335c70: lea rcx, [rbx + 0x10]
0x100335c74: mov qword ptr [rsp + 0x20], rcx
0x100335c79: mov rcx, qword ptr [rax + 0x40]
0x100335c7d: test rcx, rcx
0x100335c80: mov qword ptr [rsp + 8], r14
0x100335c85: mov qword ptr [rsp + 0x40], rbx
0x100335c8a: mov qword ptr [rsp], r15
0x100335c8e: je 0x100335d26
0x100335c94: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x100335c99: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x100335ca2: mov rcx, qword ptr [rip + 0x8d7e5f] ; 0x100c0db08
0x100335ca9: vmovups ymm0, ymmword ptr [rcx]
0x100335cad: vmovups ymm1, ymmword ptr [rcx + 0x10]
0x100335cb2: vmovups ymmword ptr [rsp + 0x140], ymm1
0x100335cbb: vmovups ymmword ptr [rsp + 0x130], ymm0
0x100335cc4: vxorps xmm0, xmm0, xmm0
0x100335cc8: vmovlps qword ptr [rsp + 0x160], xmm0
0x100335cd1: mov dword ptr [rsp + 0x168], 0
0x100335cdc: mov ecx, dword ptr [rbx + 0x60]
0x100335cdf: mov dword ptr [rsp + 0x170], ecx
0x100335ce6: mov qword ptr [rsp + 0x174], 0x3f800000
0x100335cf2: vmovss xmm0, dword ptr [rax + 0x78]
0x100335cf7: lea rsi, [rsp + 0x120]
0x100335cff: vmovss xmm1, dword ptr [rip + 0x771ae9] ; 0x100aa77f0
0x100335d07: vmovss xmm2, dword ptr [rip + 0x770d95] ; 0x100aa6aa4
0x100335d0f: vmovss xmm3, dword ptr [rip + 0x76f3a9] ; 0x100aa50c0
0x100335d17: mov rdi, r15
0x100335d1a: vzeroupper 
0x100335d1d: call 0x10062f540 ; 0x10062f540
0x100335d22: mov rax, qword ptr [rbx + 0x78]
0x100335d26: mov rcx, qword ptr [rsp + 0x20]
0x100335d2b: vmovaps xmm0, xmmword ptr [rcx]
0x100335d2f: vmovaps xmmword ptr [rsp + 0x60], xmm0
0x100335d35: mov rax, qword ptr [rax + 0x48]
0x100335d39: test rax, rax
0x100335d3c: je 0x100335e59
0x100335d42: mov r12d, dword ptr [rax + 0x10]
0x100335d46: test r12, r12
0x100335d49: je 0x100335e59
0x100335d4f: cmp dword ptr [rax + 0x10], 0
0x100335d53: je 0x100335e3a
0x100335d59: vmovss xmm0, dword ptr [rip + 0x771b57] ; 0x100aa78b8
0x100335d61: vmovss dword ptr [rsp + 0x70], xmm0
0x100335d67: xor r13d, r13d
0x100335d6a: lea r15, [rsp + 0x2e0]
0x100335d72: nop word ptr cs:[rax + rax]
0x100335d80: mov rax, qword ptr [rax + 8]
0x100335d84: mov rax, qword ptr [rax + r13*8]
0x100335d88: mov qword ptr [rsp + 0x2e0], rax
0x100335d90: call 0x1007abc10 ; 0x1007abc10
0x100335d95: mov r14, rax
0x100335d98: mov qword ptr [rsp + 0x120], 0
0x100335da4: call 0x1004789e0 ; 0x1004789e0
0x100335da9: mov rbx, qword ptr [rax]
0x100335dac: mov rdi, rax
0x100335daf: lea rsi, [rsp + 0x120]
0x100335db7: mov rdx, r15
0x100335dba: mov rcx, r14
0x100335dbd: call qword ptr [rbx + 0x40]
0x100335dc0: mov rbx, qword ptr [rsp + 0x120]
0x100335dc8: test rbx, rbx
0x100335dcb: je 0x100337083
0x100335dd1: mov rdi, rbx
0x100335dd4: call 0x100478a30 ; 0x100478a30
0x100335dd9: vmovss dword ptr [rsp + 0x30], xmm0
0x100335ddf: mov rdi, rbx
0x100335de2: call 0x100478a50 ; 0x100478a50
0x100335de7: mov eax, eax
0x100335de9: vcvtsi2ss xmm0, xmm4, rax
0x100335dee: vmulss xmm0, xmm0, dword ptr [rip + 0x773886] ; 0x100aa967c
0x100335df6: vaddss xmm0, xmm0, dword ptr [rsp + 0x30]
0x100335dfc: vmovss xmm1, dword ptr [rsp + 0x70]
0x100335e02: vucomiss xmm1, xmm0
0x100335e06: jbe 0x100335e19
0x100335e08: vmovaps xmm1, xmmword ptr [rbx + 0x40]
0x100335e0d: vmovaps xmmword ptr [rsp + 0x60], xmm1
0x100335e13: vmovss dword ptr [rsp + 0x70], xmm0
0x100335e19: inc r13
0x100335e1c: cmp r13, r12
0x100335e1f: jae 0x100335e59
0x100335e21: mov rax, qword ptr [rsp + 0x40]
0x100335e26: mov rax, qword ptr [rax + 0x78]
0x100335e2a: mov rax, qword ptr [rax + 0x48]
0x100335e2e: mov ecx, dword ptr [rax + 0x10]
0x100335e31: cmp r13, rcx
0x100335e34: jb 0x100335d80
0x100335e3a: lea rdi, [rip + 0x82bb17] ; 0x100b61958 idx < size
0x100335e41: lea rsi, [rip + 0x82bb1b] ; 0x100b61963 ./Clump.h
0x100335e48: mov edx, 0x36
0x100335e4d: mov ecx, 3
0x100335e52: call 0x1007e5f70 ; 0x1007e5f70
0x100335e57: ud2 
0x100335e59: mov r13, qword ptr [rsp + 0x40]
0x100335e5e: mov eax, dword ptr [r13 + 0x17c]
0x100335e65: cmp eax, 1
0x100335e68: je 0x100335e73
0x100335e6a: cmp eax, 4
0x100335e6d: jne 0x10033602d
0x100335e73: mov rcx, qword ptr [r13 + 0x78]
0x100335e77: mov rcx, qword ptr [rcx + 0x30]
0x100335e7b: test rcx, rcx
0x100335e7e: mov r14, qword ptr [rsp + 8]
0x100335e83: je 0x100336053
0x100335e89: cmp dword ptr [rcx + 0x10], 0
0x100335e8d: je 0x100336053
0x100335e93: vmovss xmm0, dword ptr [rip + 0x771a1d] ; 0x100aa78b8
0x100335e9b: vmovss dword ptr [rsp + 0x30], xmm0
0x100335ea1: xor r12d, r12d
0x100335ea4: lea r14, [rsp + 0x120]
0x100335eac: xor r15d, r15d
0x100335eaf: nop 
0x100335eb0: mov rax, qword ptr [rcx + 8]
0x100335eb4: mov rax, qword ptr [rax + r12*8]
0x100335eb8: mov qword ptr [rsp + 0x2e0], rax
0x100335ec0: call 0x1007abc10 ; 0x1007abc10
0x100335ec5: mov r13, rax
0x100335ec8: mov qword ptr [rsp + 0x120], 0
0x100335ed4: call 0x10055b490 ; 0x10055b490
0x100335ed9: mov rbx, qword ptr [rax]
0x100335edc: mov rdi, rax
0x100335edf: mov rsi, r14
0x100335ee2: lea rdx, [rsp + 0x2e0]
0x100335eea: mov rcx, r13
0x100335eed: call qword ptr [rbx + 0x40]
0x100335ef0: mov r13, qword ptr [rsp + 0x120]
0x100335ef8: test r13, r13
0x100335efb: je 0x100337083
0x100335f01: cmp byte ptr [r13 + 0x41], 0
0x100335f06: je 0x100335f98
0x100335f0c: cmp byte ptr [r13 + 0x2c], 0
0x100335f11: je 0x100335f30
0x100335f13: mov rdi, r13
0x100335f16: lea rsi, [rsp + 0x60]
0x100335f1b: mov rdx, r14
0x100335f1e: call 0x10055d820 ; 0x10055d820
0x100335f23: vmovaps xmm0, xmmword ptr [rsp + 0x120]
0x100335f2c: jmp 0x100335f60 ; 0x100335f60
0x100335f2e: nop 
0x100335f30: mov rax, qword ptr [rsp + 0x40]
0x100335f35: cmp r13, qword ptr [rax + 0x490]
0x100335f3c: je 0x100335f13
0x100335f3e: lea rdi, [rsp + 0x2e0]
0x100335f46: mov rsi, r13
0x100335f49: call 0x100561340 ; 0x100561340
0x100335f4e: vmovaps xmm0, xmmword ptr [rsp + 0x2e0]
0x100335f57: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x100335f60: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x60]
0x100335f66: vmulps xmm0, xmm0, xmm0
0x100335f6a: vmovshdup xmm1, xmm0
0x100335f6e: vaddss xmm1, xmm0, xmm1
0x100335f72: vpermilpd xmm0, xmm0, 1
0x100335f78: vaddss xmm0, xmm0, xmm1
0x100335f7c: vsqrtss xmm0, xmm0, xmm0
0x100335f80: vmovss xmm1, dword ptr [rsp + 0x30]
0x100335f86: vucomiss xmm1, xmm0
0x100335f8a: vminss xmm1, xmm0, xmm1
0x100335f8e: vmovss dword ptr [rsp + 0x30], xmm1
0x100335f94: cmova r15, r13
0x100335f98: inc r12
0x100335f9b: mov r13, qword ptr [rsp + 0x40]
0x100335fa0: mov rax, qword ptr [r13 + 0x78]
0x100335fa4: mov rcx, qword ptr [rax + 0x30]
0x100335fa8: mov eax, dword ptr [rcx + 0x10]
0x100335fab: cmp r12, rax
0x100335fae: jb 0x100335eb0
0x100335fb4: test r15, r15
0x100335fb7: je 0x10033603e
0x100335fbd: lea rdx, [rsp + 0x120]
0x100335fc5: mov rdi, r15
0x100335fc8: mov rsi, qword ptr [rsp + 0x20]
0x100335fcd: call 0x10055d820 ; 0x10055d820
0x100335fd2: vmovss xmm1, dword ptr [rip + 0x7718e2] ; 0x100aa78bc
0x100335fda: vdivss xmm1, xmm1, dword ptr [r15 + 0x18]
0x100335fe0: vaddss xmm0, xmm0, xmm1
0x100335fe4: vroundss xmm1, xmm0, xmm0, 9
0x100335fea: vsubss xmm0, xmm0, xmm1
0x100335fee: lea rbx, [rsp + 0x2e0]
0x100335ff6: mov rdi, rbx
0x100335ff9: mov rsi, r15
0x100335ffc: call 0x10055e420 ; 0x10055e420
0x100336001: vmovss xmm0, dword ptr [rip + 0x76f0b7] ; 0x100aa50c0
0x100336009: vmovss xmm1, dword ptr [rip + 0x7725bf] ; 0x100aa85d0
0x100336011: mov rdi, qword ptr [rsp]
0x100336015: mov rsi, rbx
0x100336018: call 0x10062f190 ; 0x10062f190
0x10033601d: mov qword ptr [r13 + 0x490], r15
0x100336024: mov eax, dword ptr [r13 + 0x17c]
0x10033602b: jmp 0x10033604e ; 0x10033604e
0x10033602d: mov r14, qword ptr [rsp + 8]
0x100336032: dec eax
0x100336034: cmp eax, 4
0x100336037: jbe 0x10033609e
0x100336039: jmp 0x100336f16 ; 0x100336f16
0x10033603e: mov dword ptr [r13 + 0x17c], 2
0x100336049: mov eax, 2
0x10033604e: mov r14, qword ptr [rsp + 8]
0x100336053: vmovss xmm2, dword ptr [rsp + 0x18]
0x100336059: vmulss xmm0, xmm2, dword ptr [rip + 0x773177] ; 0x100aa91d8
0x100336061: vmovss xmm1, dword ptr [rsp + 0x14]
0x100336067: vaddss xmm1, xmm1, xmm0
0x10033606b: vmovss dword ptr [rsp + 0x14], xmm1
0x100336071: vmulss xmm0, xmm2, dword ptr [rip + 0x771757] ; 0x100aa77d0
0x100336079: vaddss xmm0, xmm0, dword ptr [r13 + 0x180]
0x100336082: vxorps xmm1, xmm1, xmm1
0x100336086: vmaxss xmm0, xmm0, xmm1
0x10033608a: vmovss dword ptr [r13 + 0x180], xmm0
0x100336093: dec eax
0x100336095: cmp eax, 4
0x100336098: ja 0x100336f16
0x10033609e: lea rcx, [rip + 0xfff] ; 0x1003370a4
0x1003360a5: movsxd rax, dword ptr [rcx + rax*4]
0x1003360a9: add rax, rcx
0x1003360ac: jmp rax
0x1003360ae: vxorps xmm0, xmm0, xmm0
0x1003360b2: vucomiss xmm0, dword ptr [rsp + 0x1c]
0x1003360b8: jb 0x100336f16
0x1003360be: vmovss xmm0, dword ptr [r13 + 0x180]
0x1003360c7: vucomiss xmm0, dword ptr [rip + 0x7709dd] ; 0x100aa6aac
0x1003360cf: mov rbx, qword ptr [rsp]
0x1003360d3: jae 0x100336a2c
0x1003360d9: vmovss xmm0, dword ptr [r13 + 0x184]
0x1003360e2: vucomiss xmm0, dword ptr [rip + 0x76efd6] ; 0x100aa50c0
0x1003360ea: jae 0x100336c1d
0x1003360f0: mov eax, 5
0x1003360f5: vmovss xmm0, dword ptr [rip + 0x7709af] ; 0x100aa6aac
0x1003360fd: vucomiss xmm0, dword ptr [r13 + 0x160]
0x100336106: jbe 0x100336f1a
0x10033610c: mov dword ptr [r13 + 0x17c], eax
0x100336113: jmp 0x100336f1a ; 0x100336f1a
0x100336118: cmp dword ptr [r13 + 0x290], 0
0x100336120: je 0x100336898
0x100336126: vmovss xmm0, dword ptr [rip + 0x772506] ; 0x100aa8634
0x10033612e: vmovss xmm1, dword ptr [rsp + 0x2c]
0x100336134: vdivss xmm0, xmm0, xmm1
0x100336138: vmovss dword ptr [rsp + 0x18], xmm0
0x10033613e: vmulss xmm0, xmm1, dword ptr [rip + 0x77095e] ; 0x100aa6aa4
0x100336146: vmovss dword ptr [rsp + 0x5c], xmm0
0x10033614c: lea r14, [r13 + 0x190]
0x100336153: xor r13d, r13d
0x100336156: lea r15, [rsp + 0x120]
0x10033615e: mov dword ptr [rsp + 0x30], 0
0x100336166: nop word ptr cs:[rax + rax]
0x100336170: call 0x10074a170 ; 0x10074a170
0x100336175: mov r12, rax
0x100336178: mov qword ptr [rsp + 0x120], 0
0x100336184: call 0x100474e80 ; 0x100474e80
0x100336189: mov rbx, qword ptr [rax]
0x10033618c: mov rdi, rax
0x10033618f: mov rsi, r15
0x100336192: mov rdx, r14
0x100336195: mov rcx, r12
0x100336198: call qword ptr [rbx + 0x40]
0x10033619b: mov rbx, qword ptr [rsp + 0x120]
0x1003361a3: test rbx, rbx
0x1003361a6: je 0x1003364b0
0x1003361ac: mov rax, qword ptr [rbx]
0x1003361af: mov rdi, rbx
0x1003361b2: call qword ptr [rax + 0x10]
0x1003361b5: test al, al
0x1003361b7: je 0x1003364b0
0x1003361bd: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x1003361c2: mov rax, qword ptr [rsp + 0x20]
0x1003361c7: vsubps xmm3, xmm0, xmmword ptr [rax]
0x1003361cb: vmulps xmm1, xmm3, xmm3
0x1003361cf: vmovshdup xmm2, xmm1
0x1003361d3: vaddss xmm2, xmm1, xmm2
0x1003361d7: vpermilpd xmm1, xmm1, 1
0x1003361dd: vaddss xmm1, xmm1, xmm2
0x1003361e1: vsqrtss xmm2, xmm1, xmm1
0x1003361e5: vmovss xmm1, dword ptr [rsp + 0x2c]
0x1003361eb: vucomiss xmm1, xmm2
0x1003361ef: jbe 0x100336255
0x1003361f1: vmovaps xmmword ptr [rsp + 0x30], xmm3
0x1003361f7: mov rax, qword ptr [rbx]
0x1003361fa: mov r12, qword ptr [rsp + 0x50]
0x1003361ff: mov rsi, qword ptr [r12 + 0xe8]
0x100336207: mov rdi, rbx
0x10033620a: mov rdx, r12
0x10033620d: vmovaps xmmword ptr [rsp + 0x70], xmm2
0x100336213: call qword ptr [rax + 0x38]
0x100336216: vmovaps xmm1, xmmword ptr [rsp + 0x70]
0x10033621c: mov rdi, qword ptr [r12 + 0x438]
0x100336224: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x100336229: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100336232: vucomiss xmm1, dword ptr [rip + 0x77168a] ; 0x100aa78c4
0x10033623a: jbe 0x10033634e
0x100336240: vpermilps xmm0, xmm1, 0xc0
0x100336246: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x10033624c: vdivps xmm1, xmm1, xmm0
0x100336250: jmp 0x100336354 ; 0x100336354
0x100336255: vmovss xmm1, dword ptr [rsp + 0x5c]
0x10033625b: vucomiss xmm1, xmm2
0x10033625f: jbe 0x1003364b0
0x100336265: mov rax, qword ptr [rsp + 0x40]
0x10033626a: vmovaps xmm1, xmmword ptr [rip + 0x77168e] ; 0x100aa7900
0x100336272: vxorps xmm1, xmm1, xmmword ptr [rax + 0x40]
0x100336277: vmulps xmm1, xmm3, xmm1
0x10033627b: vmovshdup xmm2, xmm1
0x10033627f: vaddss xmm2, xmm1, xmm2
0x100336283: vpermilpd xmm1, xmm1, 1
0x100336289: vaddss xmm1, xmm1, xmm2
0x10033628d: vucomiss xmm1, dword ptr [rip + 0x770e4f] ; 0x100aa70e4
0x100336295: jbe 0x1003364b0
0x10033629b: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x1003362a4: vmovups ymm0, ymmword ptr [rbx + 0x20]
0x1003362a9: vmovups ymm1, ymmword ptr [rbx + 0x30]
0x1003362ae: lea rax, [rsp + 0x130]
0x1003362b6: mov rcx, rax
0x1003362b9: vmovups ymmword ptr [rcx + 0x10], ymm1
0x1003362be: vmovups ymmword ptr [rcx], ymm0
0x1003362c2: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x1003362c7: vmovaps xmmword ptr [rsp + 0x160], xmm0
0x1003362d0: mov eax, dword ptr [rbx + 0x68]
0x1003362d3: mov dword ptr [rcx + 0x48], eax
0x1003362d6: mov rax, qword ptr [rbx + 0x60]
0x1003362da: mov qword ptr [rcx + 0x40], rax
0x1003362de: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x1003362e3: vmovaps xmmword ptr [rsp + 0x2e0], xmm0
0x1003362ec: vmovups ymm0, ymmword ptr [rbx + 0x20]
0x1003362f1: vmovups ymm1, ymmword ptr [rbx + 0x30]
0x1003362f6: lea rax, [rsp + 0x2f0]
0x1003362fe: mov rcx, rax
0x100336301: vmovups ymmword ptr [rcx + 0x10], ymm1
0x100336306: vmovups ymmword ptr [rcx], ymm0
0x10033630a: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x10033630f: vmovaps xmmword ptr [rsp + 0x320], xmm0
0x100336318: mov eax, dword ptr [rbx + 0x68]
0x10033631b: mov dword ptr [rcx + 0x48], eax
0x10033631e: mov rax, qword ptr [rbx + 0x60]
0x100336322: mov qword ptr [rcx + 0x40], rax
0x100336326: mov rdi, qword ptr [rsp]
0x10033632a: vmovss xmm0, dword ptr [rip + 0x76ed8e] ; 0x100aa50c0
0x100336332: mov rsi, r15
0x100336335: lea rdx, [rsp + 0x320]
0x10033633d: vmovaps xmm1, xmm0
0x100336341: vzeroupper 
0x100336344: call 0x10062f660 ; 0x10062f660
0x100336349: jmp 0x1003364b0 ; 0x1003364b0
0x10033634e: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x100336354: vmovaps xmmword ptr [rsp + 0xa0], xmm1
0x10033635d: lea rax, [rip + 0x1ab98e4] ; 0x101defc48
0x100336364: mov rcx, qword ptr [rax]
0x100336367: xor r8d, r8d
0x10033636a: vmovss xmm0, dword ptr [rip + 0x771476] ; 0x100aa77e8
0x100336372: lea rsi, [rsp + 0xb0]
0x10033637a: lea rdx, [rsp + 0xa0]
0x100336382: call 0x1002de9e0 ; 0x1002de9e0
0x100336387: mov rax, qword ptr [rsp + 0x50]
0x10033638c: mov rdi, qword ptr [rax + 0x5c8]
0x100336393: vxorps ymm1, ymm1, ymm1
0x100336397: vmovaps ymmword ptr [rsp + 0x340], ymm1
0x1003363a0: vmovaps ymmword ptr [rsp + 0x320], ymm1
0x1003363a9: vmovaps ymmword ptr [rsp + 0x300], ymm1
0x1003363b2: vmovaps ymmword ptr [rsp + 0x2e0], ymm1
0x1003363bb: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x1003363c0: mov byte ptr [rsp + 0x2ed], 1
0x1003363c8: mov dword ptr [rsp + 0x2e0], 0x3f800000
0x1003363d3: vmovaps xmmword ptr [rsp + 0x2f0], xmm0
0x1003363dc: movabs rax, 0x40f000003f800000
0x1003363e6: mov qword ptr [rsp + 0x328], rax
0x1003363ee: mov dword ptr [rsp + 0x350], 0xc31
0x1003363f9: vmovups ymmword ptr [rsp + 0x2b0], ymm1
0x100336402: vmovaps ymmword ptr [rsp + 0x2a0], ymm1
0x10033640b: vmovaps ymmword ptr [rsp + 0x280], ymm1
0x100336414: vmovaps ymmword ptr [rsp + 0x260], ymm1
0x10033641d: vmovaps ymmword ptr [rsp + 0x240], ymm1
0x100336426: vmovaps ymmword ptr [rsp + 0x220], ymm1
0x10033642f: vmovaps ymmword ptr [rsp + 0x200], ymm1
0x100336438: vmovaps ymmword ptr [rsp + 0x1e0], ymm1
0x100336441: vmovaps ymmword ptr [rsp + 0x1c0], ymm1
0x10033644a: vmovaps ymmword ptr [rsp + 0x1a0], ymm1
0x100336453: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10033645c: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x100336465: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x10033646e: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x100336477: lea rsi, [rip + 0x84b0c2] ; 0x100b81540 soulhit
0x10033647e: lea rdx, [rsp + 0x2e0]
0x100336486: mov rcx, r15
0x100336489: vzeroupper 
0x10033648c: call 0x1006018a0 ; 0x1006018a0
0x100336491: vmovss xmm0, dword ptr [rsp + 0x14]
0x100336497: vsubss xmm0, xmm0, dword ptr [rsp + 0x18]
0x10033649d: vmovss dword ptr [rsp + 0x14], xmm0
0x1003364a3: mov al, 1
0x1003364a5: mov dword ptr [rsp + 0x30], eax
0x1003364a9: nop dword ptr [rax]
0x1003364b0: add r14, 8
0x1003364b4: inc r13d
0x1003364b7: mov rax, qword ptr [rsp + 0x40]
0x1003364bc: cmp dword ptr [rax + 0x290], r13d
0x1003364c3: ja 0x100336170
0x1003364c9: test byte ptr [rsp + 0x30], 1
0x1003364ce: mov r14, qword ptr [rsp + 8]
0x1003364d3: jne 0x10033686e
0x1003364d9: mov r13, qword ptr [rsp + 0x40]
0x1003364de: jmp 0x100336898 ; 0x100336898
0x1003364e3: cmp dword ptr [r13 + 0x290], 0
0x1003364eb: je 0x1003365a3
0x1003364f1: lea r12, [r13 + 0x190]
0x1003364f8: xor ebx, ebx
0x1003364fa: lea r14, [rsp + 0x120]
0x100336502: nop word ptr cs:[rax + rax]
0x100336510: call 0x10074a170 ; 0x10074a170
0x100336515: mov r15, rax
0x100336518: mov qword ptr [rsp + 0x120], 0
0x100336524: call 0x1000f8400 ; 0x1000f8400
0x100336529: mov r8, qword ptr [rax]
0x10033652c: mov rdi, rax
0x10033652f: mov rsi, r14
0x100336532: mov rdx, r12
0x100336535: mov rcx, r15
0x100336538: call qword ptr [r8 + 0x40]
0x10033653c: mov r15, qword ptr [rsp + 0x120]
0x100336544: test r15, r15
0x100336547: je 0x100336590
0x100336549: mov rax, qword ptr [r15 + 0x18]
0x10033654d: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x100336552: mov rcx, qword ptr [rsp + 0x20]
0x100336557: vsubps xmm0, xmm0, xmmword ptr [rcx]
0x10033655b: vmulps xmm0, xmm0, xmm0
0x10033655f: vmovshdup xmm1, xmm0
0x100336563: vaddss xmm1, xmm0, xmm1
0x100336567: vpermilpd xmm0, xmm0, 1
0x10033656d: vaddss xmm0, xmm0, xmm1
0x100336571: vsqrtss xmm0, xmm0, xmm0
0x100336575: vmovss xmm1, dword ptr [rip + 0x7730f3] ; 0x100aa9670
0x10033657d: vucomiss xmm1, xmm0
0x100336581: jbe 0x100336590
0x100336583: cmp byte ptr [rax + 0xbb0], 0
0x10033658a: je 0x100336ac4
0x100336590: add r12, 8
0x100336594: inc ebx
0x100336596: cmp dword ptr [r13 + 0x290], ebx
0x10033659d: ja 0x100336510
0x1003365a3: vxorps xmm0, xmm0, xmm0
0x1003365a7: vucomiss xmm0, dword ptr [rsp + 0x1c]
0x1003365ad: jb 0x100336f11
0x1003365b3: mov dword ptr [r13 + 0x17c], 1
0x1003365be: jmp 0x100336f11 ; 0x100336f11
0x1003365c3: mov rax, qword ptr [r13 + 0x78]
0x1003365c7: mov rax, qword ptr [rax + 0x28]
0x1003365cb: test rax, rax
0x1003365ce: je 0x100336b7a
0x1003365d4: cmp dword ptr [rax + 0x10], 0
0x1003365d8: je 0x100336b7a
0x1003365de: vmovss xmm0, dword ptr [rip + 0x7712d2] ; 0x100aa78b8
0x1003365e6: vmovss dword ptr [rsp + 0x30], xmm0
0x1003365ec: xor r14d, r14d
0x1003365ef: xor r15d, r15d
0x1003365f2: nop word ptr cs:[rax + rax]
0x100336600: mov rax, qword ptr [rax + 8]
0x100336604: mov rax, qword ptr [rax + r14*8]
0x100336608: mov qword ptr [rsp + 0x2e0], rax
0x100336610: call 0x1007abc10 ; 0x1007abc10
0x100336615: mov r12, rax
0x100336618: mov qword ptr [rsp + 0x120], 0
0x100336624: call 0x10055b490 ; 0x10055b490
0x100336629: mov rbx, qword ptr [rax]
0x10033662c: mov rdi, rax
0x10033662f: lea rsi, [rsp + 0x120]
0x100336637: lea rdx, [rsp + 0x2e0]
0x10033663f: mov rcx, r12
0x100336642: call qword ptr [rbx + 0x40]
0x100336645: mov r13, qword ptr [rsp + 0x120]
0x10033664d: test r13, r13
0x100336650: je 0x100337083
0x100336656: cmp byte ptr [r13 + 0x41], 0
0x10033665b: je 0x1003366f8
0x100336661: cmp byte ptr [r13 + 0x2c], 0
0x100336666: je 0x100336690
0x100336668: mov rdi, r13
0x10033666b: lea rsi, [rsp + 0x60]
0x100336670: lea rdx, [rsp + 0x120]
0x100336678: call 0x10055d820 ; 0x10055d820
0x10033667d: vmovaps xmm0, xmmword ptr [rsp + 0x120]
0x100336686: jmp 0x1003366c0 ; 0x1003366c0
0x100336688: nop dword ptr [rax + rax]
0x100336690: mov rax, qword ptr [rsp + 0x40]
0x100336695: cmp r13, qword ptr [rax + 0x490]
0x10033669c: je 0x100336668
0x10033669e: lea rdi, [rsp + 0x2e0]
0x1003366a6: mov rsi, r13
0x1003366a9: call 0x100561340 ; 0x100561340
0x1003366ae: vmovaps xmm0, xmmword ptr [rsp + 0x2e0]
0x1003366b7: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x1003366c0: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x60]
0x1003366c6: vmulps xmm0, xmm0, xmm0
0x1003366ca: vmovshdup xmm1, xmm0
0x1003366ce: vaddss xmm1, xmm0, xmm1
0x1003366d2: vpermilpd xmm0, xmm0, 1
0x1003366d8: vaddss xmm0, xmm0, xmm1
0x1003366dc: vsqrtss xmm0, xmm0, xmm0
0x1003366e0: vmovss xmm1, dword ptr [rsp + 0x30]
0x1003366e6: vucomiss xmm1, xmm0
0x1003366ea: vminss xmm1, xmm0, xmm1
0x1003366ee: vmovss dword ptr [rsp + 0x30], xmm1
0x1003366f4: cmova r15, r13
0x1003366f8: inc r14
0x1003366fb: mov r13, qword ptr [rsp + 0x40]
0x100336700: mov rax, qword ptr [r13 + 0x78]
0x100336704: mov rax, qword ptr [rax + 0x28]
0x100336708: mov ecx, dword ptr [rax + 0x10]
0x10033670b: cmp r14, rcx
0x10033670e: jb 0x100336600
0x100336714: test r15, r15
0x100336717: je 0x100336b6a
0x10033671d: lea rdx, [rsp + 0x120]
0x100336725: mov rdi, r15
0x100336728: mov rsi, qword ptr [rsp + 0x20]
0x10033672d: call 0x10055d820 ; 0x10055d820
0x100336732: vmovss xmm1, dword ptr [rip + 0x771182] ; 0x100aa78bc
0x10033673a: vdivss xmm1, xmm1, dword ptr [r15 + 0x18]
0x100336740: vaddss xmm0, xmm0, xmm1
0x100336744: vroundss xmm1, xmm0, xmm0, 9
0x10033674a: vsubss xmm0, xmm0, xmm1
0x10033674e: lea rbx, [rsp + 0x2e0]
0x100336756: mov rdi, rbx
0x100336759: mov rsi, r15
0x10033675c: call 0x10055e420 ; 0x10055e420
0x100336761: vmovss xmm0, dword ptr [rip + 0x76e957] ; 0x100aa50c0
0x100336769: vmovss xmm1, dword ptr [rip + 0x771e5f] ; 0x100aa85d0
0x100336771: mov rdi, qword ptr [rsp]
0x100336775: mov rsi, rbx
0x100336778: call 0x10062f190 ; 0x10062f190
0x10033677d: mov qword ptr [r13 + 0x490], r15
0x100336784: jmp 0x100336b75 ; 0x100336b75
0x100336789: cmp dword ptr [r13 + 0x290], 0
0x100336791: je 0x10033683a
0x100336797: lea r12, [r13 + 0x190]
0x10033679e: xor ebx, ebx
0x1003367a0: lea r14, [rsp + 0x120]
0x1003367a8: nop dword ptr [rax + rax]
0x1003367b0: call 0x10074a170 ; 0x10074a170
0x1003367b5: mov r15, rax
0x1003367b8: mov qword ptr [rsp + 0x120], 0
0x1003367c4: call 0x1000f8400 ; 0x1000f8400
0x1003367c9: mov r8, qword ptr [rax]
0x1003367cc: mov rdi, rax
0x1003367cf: mov rsi, r14
0x1003367d2: mov rdx, r12
0x1003367d5: mov rcx, r15
0x1003367d8: call qword ptr [r8 + 0x40]
0x1003367dc: mov rsi, qword ptr [rsp + 0x120]
0x1003367e4: test rsi, rsi
0x1003367e7: je 0x100336827
0x1003367e9: mov rax, qword ptr [rsi + 0x18]
0x1003367ed: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1003367f2: mov rax, qword ptr [rsp + 0x20]
0x1003367f7: vsubps xmm0, xmm0, xmmword ptr [rax]
0x1003367fb: vmulps xmm0, xmm0, xmm0
0x1003367ff: vmovshdup xmm1, xmm0
0x100336803: vaddss xmm1, xmm0, xmm1
0x100336807: vpermilpd xmm0, xmm0, 1
0x10033680d: vaddss xmm0, xmm0, xmm1
0x100336811: vsqrtss xmm0, xmm0, xmm0
0x100336815: vmovss xmm1, dword ptr [rip + 0x772e53] ; 0x100aa9670
0x10033681d: vucomiss xmm1, xmm0
0x100336821: ja 0x100336a62
0x100336827: add r12, 8
0x10033682b: inc ebx
0x10033682d: cmp dword ptr [r13 + 0x290], ebx
0x100336834: ja 0x1003367b0
0x10033683a: vxorps xmm0, xmm0, xmm0
0x10033683e: vucomiss xmm0, dword ptr [rsp + 0x1c]
0x100336844: jb 0x100336f11
0x10033684a: vucomiss xmm0, dword ptr [r13 + 0x180]
0x100336853: mov r14, qword ptr [rsp + 8]
0x100336858: jb 0x100336f16
0x10033685e: mov dword ptr [r13 + 0x17c], 1
0x100336869: jmp 0x100336f16 ; 0x100336f16
0x10033686e: mov r13, qword ptr [rsp + 0x40]
0x100336873: mov rax, qword ptr [r13 + 0x110]
0x10033687a: mov rdi, qword ptr [rax + 0x68]
0x10033687e: lea rsi, [rip + 0x834473] ; 0x100b6acf8 CritterBite
0x100336885: vmovss xmm0, dword ptr [rip + 0x76e833] ; 0x100aa50c0
0x10033688d: xor edx, edx
0x10033688f: vmovaps xmm1, xmm0
0x100336893: call 0x1000967b0 ; 0x1000967b0
0x100336898: mov rbx, qword ptr [rsp]
0x10033689c: vxorps xmm0, xmm0, xmm0
0x1003368a0: vucomiss xmm0, dword ptr [rsp + 0x1c]
0x1003368a6: jb 0x100336f1a
0x1003368ac: vmovss xmm0, dword ptr [r13 + 0x180]
0x1003368b5: vucomiss xmm0, dword ptr [rip + 0x76e803] ; 0x100aa50c0
0x1003368bd: jae 0x100336be8
0x1003368c3: cmp dword ptr [r13 + 0x290], 0
0x1003368cb: je 0x1003369e4
0x1003368d1: vmovss xmm0, dword ptr [rsp + 0x2c]
0x1003368d7: vmulss xmm0, xmm0, dword ptr [rip + 0x7701c5] ; 0x100aa6aa4
0x1003368df: vmovss dword ptr [rsp + 0x30], xmm0
0x1003368e5: lea r15, [r13 + 0x190]
0x1003368ec: xor r12d, r12d
0x1003368ef: lea r14, [rsp + 0x120]
0x1003368f7: nop word ptr [rax + rax]
0x100336900: call 0x10074a170 ; 0x10074a170
0x100336905: mov r13, rax
0x100336908: mov qword ptr [rsp + 0x120], 0
0x100336914: call 0x100474e80 ; 0x100474e80
0x100336919: mov rbx, qword ptr [rax]
0x10033691c: mov rdi, rax
0x10033691f: mov rsi, r14
0x100336922: mov rdx, r15
0x100336925: mov rcx, r13
0x100336928: mov r13, qword ptr [rsp + 0x40]
0x10033692d: call qword ptr [rbx + 0x40]
0x100336930: mov rbx, qword ptr [rsp + 0x120]
0x100336938: test rbx, rbx
0x10033693b: je 0x1003369d0
0x100336941: mov rax, qword ptr [rbx]
0x100336944: mov rdi, rbx
0x100336947: call qword ptr [rax + 0x10]
0x10033694a: test al, al
0x10033694c: je 0x1003369d0
0x100336952: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x100336957: mov rax, qword ptr [rsp + 0x20]
0x10033695c: vsubps xmm0, xmm0, xmmword ptr [rax]
0x100336960: vmulps xmm1, xmm0, xmm0
0x100336964: vmovshdup xmm2, xmm1
0x100336968: vaddss xmm2, xmm1, xmm2
0x10033696c: vpermilpd xmm1, xmm1, 1
0x100336972: vaddss xmm1, xmm1, xmm2
0x100336976: vsqrtss xmm1, xmm1, xmm1
0x10033697a: vmovss xmm2, dword ptr [rsp + 0x2c]
0x100336980: vucomiss xmm2, xmm1
0x100336984: ja 0x100336f11
0x10033698a: vmovss xmm2, dword ptr [rsp + 0x30]
0x100336990: vucomiss xmm2, xmm1
0x100336994: jbe 0x1003369d0
0x100336996: vmovaps xmm1, xmmword ptr [rip + 0x770f62] ; 0x100aa7900
0x10033699e: vxorps xmm1, xmm1, xmmword ptr [r13 + 0x40]
0x1003369a4: vmulps xmm0, xmm0, xmm1
0x1003369a8: vmovshdup xmm1, xmm0
0x1003369ac: vaddss xmm1, xmm0, xmm1
0x1003369b0: vpermilpd xmm0, xmm0, 1
0x1003369b6: vaddss xmm0, xmm0, xmm1
0x1003369ba: vucomiss xmm0, dword ptr [rip + 0x770722] ; 0x100aa70e4
0x1003369c2: ja 0x100336f11
0x1003369c8: nop dword ptr [rax + rax]
0x1003369d0: add r15, 8
0x1003369d4: inc r12d
0x1003369d7: cmp dword ptr [r13 + 0x290], r12d
0x1003369de: ja 0x100336900
0x1003369e4: mov rax, qword ptr [r13 + 0x110]
0x1003369eb: mov rdi, qword ptr [rax + 0x68]
0x1003369ef: cmp dword ptr [rdi + 0xc], 0
0x1003369f3: mov r14, qword ptr [rsp + 8]
0x1003369f8: mov rbx, qword ptr [rsp]
0x1003369fc: jle 0x100336f1a
0x100336a02: lea rsi, [rip + 0x8342cf] ; 0x100b6acd8 CritterBiteDone
0x100336a09: vmovss xmm0, dword ptr [rip + 0x76e6af] ; 0x100aa50c0
0x100336a11: xor edx, edx
0x100336a13: vmovaps xmm1, xmm0
0x100336a17: call 0x1000967b0 ; 0x1000967b0
0x100336a1c: mov dword ptr [r13 + 0x17c], 2
0x100336a27: jmp 0x100336f1a ; 0x100336f1a
0x100336a2c: mov rax, qword ptr [r13 + 0x110]
0x100336a33: mov rdi, qword ptr [rax + 0x68]
0x100336a37: lea rsi, [rip + 0x8342e2] ; 0x100b6ad20 CritterAlert
0x100336a3e: vmovss xmm0, dword ptr [rip + 0x76e67a] ; 0x100aa50c0
0x100336a46: xor edx, edx
0x100336a48: vmovaps xmm1, xmm0
0x100336a4c: call 0x1000967b0 ; 0x1000967b0
0x100336a51: mov eax, 4
0x100336a56: mov dword ptr [r13 + 0x17c], eax
0x100336a5d: jmp 0x100336f1a ; 0x100336f1a
0x100336a62: mov rax, qword ptr [r13 + 0x78]
0x100336a66: vmovss xmm0, dword ptr [rax + 0x78]
0x100336a6b: vmovss dword ptr [rsp + 0x40], xmm0
0x100336a71: add rsi, 8
0x100336a75: lea rbx, [rsp + 0x120]
0x100336a7d: mov rdi, rbx
0x100336a80: call 0x10062e430 ; 0x10062e430
0x100336a85: vmovss xmm1, dword ptr [rip + 0x770017] ; 0x100aa6aa4
0x100336a8d: vmovss xmm2, dword ptr [rip + 0x770d47] ; 0x100aa77dc
0x100336a95: vmovss xmm3, dword ptr [rip + 0x76e623] ; 0x100aa50c0
0x100336a9d: mov rdi, qword ptr [rsp]
0x100336aa1: vmovss xmm0, dword ptr [rsp + 0x40]
0x100336aa7: mov rsi, rbx
0x100336aaa: call 0x10062f540 ; 0x10062f540
0x100336aaf: vxorps xmm0, xmm0, xmm0
0x100336ab3: vucomiss xmm0, dword ptr [rsp + 0x1c]
0x100336ab9: jae 0x10033684a
0x100336abf: jmp 0x100336f11 ; 0x100336f11
0x100336ac4: mov rax, qword ptr [r15 + 0x20]
0x100336ac8: mov rsi, qword ptr [rax + 0x298]
0x100336acf: lea rdi, [rsp + 0x120]
0x100336ad7: call 0x1007f26b0 ; 0x1007f26b0
0x100336adc: mov rax, qword ptr [rsp + 0x20]
0x100336ae1: vmovaps xmm0, xmmword ptr [rax]
0x100336ae5: vmovaps xmm1, xmmword ptr [rsp + 0x120]
0x100336aee: vmovaps xmmword ptr [rsp + 0x40], xmm1
0x100336af4: vsubps xmm1, xmm0, xmm1
0x100336af8: vxorps xmm0, xmm0, xmm0
0x100336afc: vmovaps xmmword ptr [rsp + 0x30], xmm1
0x100336b02: vblendps xmm0, xmm1, xmm0, 2
0x100336b08: vmulps xmm0, xmm0, xmm0
0x100336b0c: vmovshdup xmm1, xmm0
0x100336b10: vaddss xmm1, xmm0, xmm1
0x100336b14: vpermilpd xmm0, xmm0, 1
0x100336b1a: vaddss xmm0, xmm0, xmm1
0x100336b1e: vsqrtss xmm0, xmm0, xmm0
0x100336b22: vucomiss xmm0, dword ptr [rip + 0x76da8e] ; 0x100aa45b8
0x100336b2a: jbe 0x100336d1d
0x100336b30: vmovss xmm1, dword ptr [rip + 0x76da80] ; 0x100aa45b8
0x100336b38: vdivss xmm0, xmm1, xmm0
0x100336b3c: call 0x100aa2588 ; 0x100aa2588 _asinf
0x100336b41: vcvtss2sd xmm0, xmm0, xmm0
0x100336b45: vmovsd xmm1, qword ptr [rip + 0x785bd3] ; 0x100abc720
0x100336b4d: vsubsd xmm0, xmm1, xmm0
0x100336b51: vcvtsd2ss xmm0, xmm0, xmm0
0x100336b55: vaddss xmm0, xmm0, dword ptr [rip + 0x770c8b] ; 0x100aa77e8
0x100336b5d: vmulss xmm0, xmm0, dword ptr [rip + 0x76da53] ; 0x100aa45b8
0x100336b65: jmp 0x100336d25 ; 0x100336d25
0x100336b6a: mov dword ptr [r13 + 0x17c], 1
0x100336b75: mov r14, qword ptr [rsp + 8]
0x100336b7a: vxorps xmm0, xmm0, xmm0
0x100336b7e: vucomiss xmm0, dword ptr [rsp + 0x1c]
0x100336b84: jb 0x100336f16
0x100336b8a: vmovss xmm0, dword ptr [r13 + 0x180]
0x100336b93: vucomiss xmm0, dword ptr [rip + 0x76e525] ; 0x100aa50c0
0x100336b9b: mov rbx, qword ptr [rsp]
0x100336b9f: jae 0x100336be8
0x100336ba1: vxorps xmm0, xmm0, xmm0
0x100336ba5: vucomiss xmm0, dword ptr [r13 + 0x184]
0x100336bae: jb 0x100336bc5
0x100336bb0: mov rax, qword ptr [r13 + 0x110]
0x100336bb7: mov rdi, qword ptr [rax + 0x68]
0x100336bbb: cmp dword ptr [rdi + 0xc], 0
0x100336bbf: jle 0x10033701a
0x100336bc5: vmovss xmm0, dword ptr [rip + 0x76e4f3] ; 0x100aa50c0
0x100336bcd: vucomiss xmm0, dword ptr [r13 + 0x160]
0x100336bd6: jbe 0x100336c53
0x100336bd8: mov dword ptr [r13 + 0x17c], 5
0x100336be3: jmp 0x100336f1a ; 0x100336f1a
0x100336be8: mov rax, qword ptr [r13 + 0x110]
0x100336bef: mov rdi, qword ptr [rax + 0x68]
0x100336bf3: lea rsi, [rip + 0x834126] ; 0x100b6ad20 CritterAlert
0x100336bfa: vmovss xmm0, dword ptr [rip + 0x76e4be] ; 0x100aa50c0
0x100336c02: xor edx, edx
0x100336c04: vmovaps xmm1, xmm0
0x100336c08: call 0x1000967b0 ; 0x1000967b0
0x100336c0d: mov dword ptr [r13 + 0x17c], 4
0x100336c18: jmp 0x100336f1a ; 0x100336f1a
0x100336c1d: mov rax, qword ptr [r13 + 0x110]
0x100336c24: mov rdi, qword ptr [rax + 0x68]
0x100336c28: lea rsi, [rip + 0x8340d5] ; 0x100b6ad04 CritterExcite
0x100336c2f: vmovss xmm0, dword ptr [rip + 0x76e489] ; 0x100aa50c0
0x100336c37: xor edx, edx
0x100336c39: vmovaps xmm1, xmm0
0x100336c3d: call 0x1000967b0 ; 0x1000967b0
0x100336c42: mov eax, 2
0x100336c47: mov dword ptr [r13 + 0x17c], eax
0x100336c4e: jmp 0x100336f1a ; 0x100336f1a
0x100336c53: cmp dword ptr [r13 + 0x290], 0
0x100336c5b: je 0x100336f1a
0x100336c61: lea r15, [r13 + 0x190]
0x100336c68: xor r12d, r12d
0x100336c6b: lea r14, [rsp + 0x120]
0x100336c73: nop word ptr cs:[rax + rax]
0x100336c80: call 0x10074a170 ; 0x10074a170
0x100336c85: mov r13, rax
0x100336c88: mov qword ptr [rsp + 0x120], 0
0x100336c94: call 0x100474e80 ; 0x100474e80
0x100336c99: mov rbx, qword ptr [rax]
0x100336c9c: mov rdi, rax
0x100336c9f: mov rsi, r14
0x100336ca2: mov rdx, r15
0x100336ca5: mov rcx, r13
0x100336ca8: call qword ptr [rbx + 0x40]
0x100336cab: mov rbx, qword ptr [rsp + 0x120]
0x100336cb3: test rbx, rbx
0x100336cb6: je 0x100336cff
0x100336cb8: mov rax, qword ptr [rbx]
0x100336cbb: mov rdi, rbx
0x100336cbe: call qword ptr [rax + 0x10]
0x100336cc1: test al, al
0x100336cc3: je 0x100336cff
0x100336cc5: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x100336cca: mov rax, qword ptr [rsp + 0x20]
0x100336ccf: vsubps xmm0, xmm0, xmmword ptr [rax]
0x100336cd3: vmulps xmm0, xmm0, xmm0
0x100336cd7: vmovshdup xmm1, xmm0
0x100336cdb: vaddss xmm1, xmm0, xmm1
0x100336cdf: vpermilpd xmm0, xmm0, 1
0x100336ce5: vaddss xmm0, xmm0, xmm1
0x100336ce9: vsqrtss xmm0, xmm0, xmm0
0x100336ced: vmovss xmm1, dword ptr [rip + 0x770ae7] ; 0x100aa77dc
0x100336cf5: vucomiss xmm1, xmm0
0x100336cf9: ja 0x100337044
0x100336cff: add r15, 8
0x100336d03: inc r12d
0x100336d06: mov r13, qword ptr [rsp + 0x40]
0x100336d0b: cmp dword ptr [r13 + 0x290], r12d
0x100336d12: ja 0x100336c80
0x100336d18: jmp 0x100336f11 ; 0x100336f11
0x100336d1d: vmovss xmm0, dword ptr [rip + 0x7718e3] ; 0x100aa8608
0x100336d25: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100336d2a: vmovshdup xmm1, xmm0
0x100336d2e: vmovapd xmm3, xmmword ptr [rsp + 0x30]
0x100336d34: vpermilpd xmm2, xmm3, 1
0x100336d3a: vxorps xmm9, xmm9, xmm9
0x100336d3f: vmulss xmm4, xmm1, xmm9
0x100336d44: vmulss xmm5, xmm3, xmm9
0x100336d49: vaddss xmm4, xmm5, xmm4
0x100336d4d: vmulss xmm6, xmm2, xmm9
0x100336d52: vsubss xmm8, xmm4, xmm6
0x100336d56: vmulss xmm2, xmm2, xmm1
0x100336d5a: vmulss xmm7, xmm3, xmm0
0x100336d5e: vsubss xmm2, xmm2, xmm7
0x100336d62: vmulss xmm7, xmm0, xmm9
0x100336d67: vaddss xmm5, xmm5, xmm7
0x100336d6b: vaddss xmm10, xmm6, xmm5
0x100336d6f: vinsertps xmm6, xmm0, xmm3, 0x9d
0x100336d75: vinsertps xmm7, xmm10, xmm0, 0x10
0x100336d7b: vmulps xmm6, xmm6, xmm7
0x100336d7f: vmovsldup xmm7, xmm3
0x100336d83: vblendps xmm7, xmm7, xmm2, 1
0x100336d89: vmulps xmm7, xmm1, xmm7
0x100336d8d: vaddps xmm7, xmm6, xmm7
0x100336d91: vmovshdup xmm4, xmm7
0x100336d95: vmulss xmm3, xmm1, xmm4
0x100336d99: vaddss xmm3, xmm6, xmm3
0x100336d9d: vmulss xmm6, xmm8, xmm9
0x100336da2: vsubss xmm3, xmm3, xmm6
0x100336da6: vmulss xmm5, xmm0, xmm2
0x100336daa: vaddss xmm3, xmm5, xmm3
0x100336dae: vmulss xmm5, xmm0, xmm10
0x100336db3: vmulss xmm1, xmm1, xmm8
0x100336db8: vaddss xmm1, xmm5, xmm1
0x100336dbc: vmulss xmm2, xmm2, xmm9
0x100336dc1: vsubss xmm1, xmm1, xmm2
0x100336dc5: vmulss xmm2, xmm4, xmm9
0x100336dca: vaddss xmm1, xmm2, xmm1
0x100336dce: vmulss xmm0, xmm0, xmm4
0x100336dd2: vsubss xmm0, xmm7, xmm0
0x100336dd6: vaddss xmm0, xmm6, xmm0
0x100336dda: vinsertps xmm1, xmm3, xmm1, 0x10
0x100336de0: vinsertps xmm0, xmm1, xmm0, 0x20
0x100336de6: vmulps xmm1, xmm0, xmm0
0x100336dea: vmovshdup xmm2, xmm1
0x100336dee: vaddss xmm2, xmm1, xmm2
0x100336df2: vpermilpd xmm1, xmm1, 1
0x100336df8: vaddss xmm1, xmm1, xmm2
0x100336dfc: vsqrtss xmm1, xmm1, xmm1
0x100336e00: vucomiss xmm1, dword ptr [rip + 0x770abc] ; 0x100aa78c4
0x100336e08: jbe 0x100336e14
0x100336e0a: vpermilps xmm1, xmm1, 0xc0
0x100336e10: vdivps xmm0, xmm0, xmm1
0x100336e14: vmulps xmm0, xmm0, xmmword ptr [rip + 0x770854] ; 0x100aa7670
0x100336e1c: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x40]
0x100336e22: vmovaps xmmword ptr [rsp + 0x2e0], xmm0
0x100336e2b: vmovss xmm0, dword ptr [rip + 0x7858e5] ; 0x100abc718 33#A
0x100336e33: lea rsi, [rsp + 0x2e0]
0x100336e3b: vmovss xmm1, dword ptr [rip + 0x76fc65] ; 0x100aa6aa8
0x100336e43: mov rdi, qword ptr [rsp]
0x100336e47: call 0x10062f710 ; 0x10062f710
0x100336e4c: mov rax, qword ptr [r15 + 0x20]
0x100336e50: mov rsi, qword ptr [rax + 0x288]
0x100336e57: lea rdi, [rsp + 0x90]
0x100336e5f: call 0x1007f26b0 ; 0x1007f26b0
0x100336e64: mov rax, qword ptr [r15 + 0x18]
0x100336e68: vmovaps xmm0, xmmword ptr [rip + 0x770800] ; 0x100aa7670
0x100336e70: vmulps xmm0, xmm0, xmmword ptr [rax + 0x60]
0x100336e75: vaddps xmm1, xmm0, xmmword ptr [rsp + 0x90]
0x100336e7e: mov rax, qword ptr [rsp + 0x20]
0x100336e83: vmovaps xmm0, xmmword ptr [rax]
0x100336e87: vsubps xmm1, xmm1, xmm0
0x100336e8b: vmulps xmm1, xmm1, xmm1
0x100336e8f: vmovshdup xmm2, xmm1
0x100336e93: vaddss xmm2, xmm1, xmm2
0x100336e97: vpermilpd xmm1, xmm1, 1
0x100336e9d: vaddss xmm1, xmm1, xmm2
0x100336ea1: vsqrtss xmm1, xmm1, xmm1
0x100336ea5: vmovss xmm2, dword ptr [rip + 0x7717ef] ; 0x100aa869c
0x100336ead: vucomiss xmm2, xmm1
0x100336eb1: jbe 0x100336f11
0x100336eb3: mov rdi, qword ptr [r15 + 0x20]
0x100336eb7: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x100336ec0: lea rsi, [rsp + 0x80]
0x100336ec8: vmovss xmm0, dword ptr [rip + 0x76e1f0] ; 0x100aa50c0
0x100336ed0: xor edx, edx
0x100336ed2: xor ecx, ecx
0x100336ed4: vmovaps xmm1, xmm0
0x100336ed8: call 0x10016dbc0 ; 0x10016dbc0
0x100336edd: mov rax, qword ptr [r15 + 0x30]
0x100336ee1: vmovss xmm0, dword ptr [rax + 0x14]
0x100336ee6: vaddss xmm0, xmm0, dword ptr [rip + 0x771746] ; 0x100aa8634
0x100336eee: vmovss dword ptr [rax + 0x14], xmm0
0x100336ef3: vmovss xmm0, dword ptr [rsp + 0x18]
0x100336ef9: vmulss xmm0, xmm0, dword ptr [rip + 0x77171f] ; 0x100aa8620
0x100336f01: vmovss xmm1, dword ptr [rsp + 0x14]
0x100336f07: vaddss xmm1, xmm1, xmm0
0x100336f0b: vmovss dword ptr [rsp + 0x14], xmm1
0x100336f11: mov r14, qword ptr [rsp + 8]
0x100336f16: mov rbx, qword ptr [rsp]
0x100336f1a: mov rdi, qword ptr [r13 + 0x110]
0x100336f21: vmovss xmm0, dword ptr [rip + 0x76e197] ; 0x100aa50c0
0x100336f29: vsubss xmm1, xmm0, dword ptr [rsp + 0x14]
0x100336f2f: vxorps xmm2, xmm2, xmm2
0x100336f33: vmaxss xmm1, xmm2, xmm1
0x100336f37: vminss xmm0, xmm0, xmm1
0x100336f3b: lea rdx, [rip + 0x82d9d4] ; 0x100b64916 u_chamAmount
0x100336f42: xor esi, esi
0x100336f44: call 0x1004667c0 ; 0x1004667c0
0x100336f49: vmovss xmm0, dword ptr [rsp + 0x14]
0x100336f4f: vmovss dword ptr [r13 + 0x184], xmm0
0x100336f58: vmovss xmm0, dword ptr [rip + 0x771670] ; 0x100aa85d0
0x100336f60: vucomiss xmm0, dword ptr [r13 + 0x160]
0x100336f69: mov rax, qword ptr [r13 + 0x78]
0x100336f6d: jbe 0x100336f80
0x100336f6f: cmp byte ptr [rax + 0x21], 0
0x100336f73: jne 0x100336f80
0x100336f75: mov dword ptr [r13 + 0x180], 0x40000000
0x100336f80: vmovss xmm0, dword ptr [rax + 0x80]
0x100336f88: vmovss xmm3, dword ptr [rax + 0x64]
0x100336f8d: vmovss xmm1, dword ptr [rax + 0x68]
0x100336f92: vmovss xmm2, dword ptr [rax + 0x6c]
0x100336f97: vmovss xmm4, dword ptr [rax + 0x70]
0x100336f9c: mov rdi, rbx
0x100336f9f: call 0x10062e8f0 ; 0x10062e8f0
0x100336fa4: mov rax, qword ptr [r13 + 0x78]
0x100336fa8: vmovss xmm0, dword ptr [rax + 0x7c]
0x100336fad: vmovss xmm2, dword ptr [rax + 0x5c]
0x100336fb2: vmovss xmm1, dword ptr [rax + 0x54]
0x100336fb7: vmovss xmm3, dword ptr [rax + 0x58]
0x100336fbc: vmovss xmm4, dword ptr [rax + 0x60]
0x100336fc1: lea rdx, [rip + 0x1628] ; 0x1003385f0
0x100336fc8: mov rdi, rbx
0x100336fcb: mov rsi, r13
0x100336fce: call 0x10062f800 ; 0x10062f800
0x100336fd3: mov rcx, qword ptr [r13 + 0x78]
0x100336fd7: mov al, 1
0x100336fd9: cmp byte ptr [rcx + 0x50], 0
0x100336fdd: jne 0x100336fe6
0x100336fdf: cmp byte ptr [rcx + 0x51], 0
0x100336fe3: setne al
0x100336fe6: movzx edx, al
0x100336fe9: mov rdi, r14
0x100336fec: mov rsi, rbx
0x100336fef: call 0x10062e700 ; 0x10062e700
0x100336ff4: mov rax, qword ptr [rip + 0x8d68dd] ; 0x100c0d8d8
0x100336ffb: mov rax, qword ptr [rax]
0x100336ffe: cmp rax, qword ptr [rsp + 0x360]
0x100337006: jne 0x10033707e
0x100337008: mov rax, r14
0x10033700b: lea rsp, [rbp - 0x28]
0x10033700f: pop rbx
0x100337010: pop r12
0x100337012: pop r13
0x100337014: pop r14
0x100337016: pop r15
0x100337018: pop rbp
0x100337019: ret 
0x10033701a: lea rsi, [rip + 0x833c5b] ; 0x100b6ac7c CritterRoll
0x100337021: vmovss xmm0, dword ptr [rip + 0x76e097] ; 0x100aa50c0
0x100337029: xor edx, edx
0x10033702b: vmovaps xmm1, xmm0
0x10033702f: call 0x1000967b0 ; 0x1000967b0
0x100337034: mov dword ptr [r13 + 0x17c], 1
0x10033703f: jmp 0x100336f1a ; 0x100336f1a
0x100337044: mov r13, qword ptr [rsp + 0x40]
0x100337049: mov rax, qword ptr [r13 + 0x110]
0x100337050: mov rdi, qword ptr [rax + 0x68]
0x100337054: lea rsi, [rip + 0x833c51] ; 0x100b6acac CritterBiteOpen
0x10033705b: vmovss xmm0, dword ptr [rip + 0x76e05d] ; 0x100aa50c0
0x100337063: xor edx, edx
0x100337065: vmovaps xmm1, xmm0
0x100337069: call 0x1000967b0 ; 0x1000967b0
0x10033706e: mov dword ptr [r13 + 0x17c], 3
0x100337079: jmp 0x100336f11 ; 0x100336f11
0x10033707e: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100337083: lea rdi, [rip + 0x82aa6e] ; 0x100b61af8 ret
0x10033708a: lea rsi, [rip + 0x82a8d2] ; 0x100b61963 ./Clump.h
0x100337091: mov edx, 0x47
0x100337096: mov ecx, 3
0x10033709b: call 0x1007e5f70 ; 0x1007e5f70
0x1003370a0: ud2 
0x1003370a2: nop 
