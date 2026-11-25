0x100484a90: push rbp
0x100484a91: mov rbp, rsp
0x100484a94: push r15
0x100484a96: push r14
0x100484a98: push r13
0x100484a9a: push r12
0x100484a9c: push rbx
0x100484a9d: sub rsp, 0x398
0x100484aa4: mov qword ptr [rbp - 0x48], rsi
0x100484aa8: mov r14, rdi
0x100484aab: cmp byte ptr [r14 + 0xa0], 0
0x100484ab3: je 0x100484baf
0x100484ab9: mov rax, qword ptr [rbp - 0x48]
0x100484abd: mov r15, qword ptr [rax + 0x5d0]
0x100484ac4: mov ebx, dword ptr [r14 + 0xf0]
0x100484acb: mov rdi, r15
0x100484ace: call 0x100410c90 ; 0x100410c90
0x100484ad3: movzx eax, byte ptr [rax + 0x168]
0x100484ada: cmp ebx, eax
0x100484adc: jae 0x100484baf
0x100484ae2: mov rax, qword ptr [rbp - 0x48]
0x100484ae6: mov rax, qword ptr [rax + 0x178]
0x100484aed: mov rdi, qword ptr [rax + 0x40]
0x100484af1: call 0x1004a0a20 ; 0x1004a0a20
0x100484af6: test al, al
0x100484af8: je 0x100484b8d
0x100484afe: mov rdi, r15
0x100484b01: call 0x100410c90 ; 0x100410c90
0x100484b06: mov r12, rax
0x100484b09: mov ebx, dword ptr [r14 + 0xf0]
0x100484b10: shl rbx, 4
0x100484b14: lea r13, [r12 + rbx + 0x68]
0x100484b19: cmp byte ptr [r12 + rbx + 0x68], 0
0x100484b1f: je 0x100484b3d
0x100484b21: mov rdi, qword ptr [r14 + 0xa8]
0x100484b28: test rdi, rdi
0x100484b2b: je 0x100484b8d
0x100484b2d: call 0x1004d2050 ; 0x1004d2050
0x100484b32: test al, al
0x100484b34: jne 0x100484b8d
0x100484b36: mov byte ptr [r13], 0
0x100484b3b: jmp 0x100484b8d ; 0x100484b8d
0x100484b3d: mov rdi, qword ptr [r14 + 0xa8]
0x100484b44: test rdi, rdi
0x100484b47: je 0x100484b56
0x100484b49: call 0x1004d2050 ; 0x1004d2050
0x100484b4e: test al, al
0x100484b50: je 0x1004865e6
0x100484b56: mov byte ptr [r13], 1
0x100484b5b: mov rax, qword ptr [rbp - 0x48]
0x100484b5f: mov rax, qword ptr [rax + 0x160]
0x100484b66: vxorps xmm0, xmm0, xmm0
0x100484b6a: vucomiss xmm0, dword ptr [rax + 0x20]
0x100484b6f: lea rcx, [rax + 0xc8]
0x100484b76: lea rax, [rax + 0xb8]
0x100484b7d: cmovne rcx, rax
0x100484b81: cmovp rcx, rax
0x100484b85: mov rax, qword ptr [rcx]
0x100484b88: mov qword ptr [r12 + rbx + 0x70], rax
0x100484b8d: mov rdi, r15
0x100484b90: call 0x100410ca0 ; 0x100410ca0
0x100484b95: mov ecx, dword ptr [r14 + 0xf0]
0x100484b9c: shl rcx, 4
0x100484ba0: vmovups xmm0, xmmword ptr [rax + rcx + 0x68]
0x100484ba6: vmovups xmmword ptr [r14 + 0xe0], xmm0
0x100484baf: cmp byte ptr [r14 + 0xe0], 0
0x100484bb7: je 0x10048655f
0x100484bbd: mov rax, qword ptr [rbp - 0x48]
0x100484bc1: mov rax, qword ptr [rax + 0x160]
0x100484bc8: vmovss xmm1, dword ptr [rax + 0x20]
0x100484bcd: lea rcx, [rip + 0x1b764fc] ; 0x101ffb0d0
0x100484bd4: cmp byte ptr [rcx], 0
0x100484bd7: lea rcx, [rip + 0x833962] ; 0x100cb8540
0x100484bde: je 0x100484be6
0x100484be0: vmovss xmm0, dword ptr [rcx]
0x100484be4: jmp 0x100484bee ; 0x100484bee
0x100484be6: vmovss xmm0, dword ptr [rip + 0x6204d2] ; 0x100aa50c0
0x100484bee: vmulss xmm2, xmm1, xmm0
0x100484bf2: vmulss xmm0, xmm2, dword ptr [rax + 0x14]
0x100484bf7: vmovss xmm3, dword ptr [rip + 0x621e9d] ; 0x100aa6a9c
0x100484bff: vmaxss xmm0, xmm3, xmm0
0x100484c03: vmovss xmm3, dword ptr [rip + 0x621e95] ; 0x100aa6aa0
0x100484c0b: vminss xmm0, xmm3, xmm0
0x100484c0f: cmp byte ptr [r14 + 0x64], 0
0x100484c14: je 0x100484d78
0x100484c1a: vmulss xmm1, xmm0, dword ptr [r14 + 0x6c]
0x100484c20: vmovss dword ptr [rbp - 0x30], xmm1
0x100484c25: vmulss xmm0, xmm0, dword ptr [r14 + 0x70]
0x100484c2b: vmovss dword ptr [rbp - 0x40], xmm0
0x100484c30: mov rax, qword ptr [rbp - 0x48]
0x100484c34: mov rdi, qword ptr [rax + 0x280]
0x100484c3b: call 0x1000fc260 ; 0x1000fc260
0x100484c40: mov rax, qword ptr [rax + 0x18]
0x100484c44: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x100484c49: vmovaps xmmword ptr [rbp - 0x1b0], xmm0
0x100484c51: mov r15, qword ptr [r14 + 0x38]
0x100484c55: lea rsi, [rbp - 0x1b0]
0x100484c5c: lea rdx, [rbp - 0x150]
0x100484c63: mov rdi, r15
0x100484c66: call 0x10055d820 ; 0x10055d820
0x100484c6b: mov rdi, r15
0x100484c6e: call 0x10055d410 ; 0x10055d410
0x100484c73: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100484c78: mov rax, qword ptr [r14 + 0x40]
0x100484c7c: cmp dword ptr [rax + 0x10], 0
0x100484c80: je 0x10048666e
0x100484c86: mov rcx, qword ptr [r14 + 0x38]
0x100484c8a: vmovss xmm0, dword ptr [rcx + 0x18]
0x100484c8f: vmovaps xmmword ptr [rbp - 0x110], xmm0
0x100484c97: mov rax, qword ptr [rax + 8]
0x100484c9b: mov rax, qword ptr [rax]
0x100484c9e: mov qword ptr [rbp - 0x200], rax
0x100484ca5: call 0x1007abc10 ; 0x1007abc10
0x100484caa: mov r15, rax
0x100484cad: mov qword ptr [rbp - 0x250], 0
0x100484cb8: call 0x1007abc10 ; 0x1007abc10
0x100484cbd: mov rbx, qword ptr [rax]
0x100484cc0: lea rsi, [rbp - 0x250]
0x100484cc7: lea rdx, [rbp - 0x200]
0x100484cce: mov rdi, rax
0x100484cd1: mov rcx, r15
0x100484cd4: call qword ptr [rbx + 0x40]
0x100484cd7: mov rsi, qword ptr [rbp - 0x250]
0x100484cde: test rsi, rsi
0x100484ce1: je 0x100486630
0x100484ce7: lea rdi, [rbp - 0x250]
0x100484cee: call 0x1004d1e40 ; 0x1004d1e40
0x100484cf3: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x100484cfb: vmovaps xmmword ptr [rbp - 0x200], xmm0
0x100484d03: mov r15, qword ptr [r14 + 0x38]
0x100484d07: lea rsi, [rbp - 0x200]
0x100484d0e: lea rdx, [rbp - 0x2c0]
0x100484d15: mov rdi, r15
0x100484d18: call 0x10055d820 ; 0x10055d820
0x100484d1d: mov rdi, r15
0x100484d20: call 0x10055d410 ; 0x10055d410
0x100484d25: mov rax, qword ptr [r14 + 0x38]
0x100484d29: vmovss xmm2, dword ptr [rax + 0x18]
0x100484d2e: vdivss xmm1, xmm0, xmm2
0x100484d32: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x100484d37: vinsertps xmm0, xmm0, dword ptr [r14 + 0x68], 0x10
0x100484d3e: vmovaps xmm3, xmmword ptr [rbp - 0x110]
0x100484d46: vinsertps xmm3, xmm3, xmm2, 0x10
0x100484d4c: vdivps xmm0, xmm0, xmm3
0x100484d50: vmovshdup xmm3, xmm0
0x100484d54: vaddss xmm0, xmm0, xmm3
0x100484d58: vsubss xmm3, xmm0, xmm1
0x100484d5c: vmulss xmm3, xmm2, xmm3
0x100484d60: vmovss xmm4, dword ptr [rbp - 0x30]
0x100484d65: vucomiss xmm3, xmm4
0x100484d69: jbe 0x100484f6a
0x100484d6f: vdivss xmm0, xmm4, xmm2
0x100484d73: jmp 0x100484f7d ; 0x100484f7d
0x100484d78: cmp byte ptr [r14 + 0xa0], 0
0x100484d80: je 0x10048657f
0x100484d86: lea rcx, [rax + 0xc8]
0x100484d8d: add rax, 0xb8
0x100484d93: vxorps xmm3, xmm3, xmm3
0x100484d97: vucomiss xmm1, xmm3
0x100484d9b: cmovne rcx, rax
0x100484d9f: cmovp rcx, rax
0x100484da3: vmovsd xmm1, qword ptr [rcx]
0x100484da7: vsubsd xmm1, xmm1, qword ptr [r14 + 0xe8]
0x100484db0: vcvtsd2ss xmm1, xmm1, xmm1
0x100484db4: vmulss xmm7, xmm2, xmm1
0x100484db8: vmovss xmm1, dword ptr [r14 + 0x50]
0x100484dbe: vucomiss xmm1, dword ptr [rip + 0x6237ee] ; 0x100aa85b4
0x100484dc6: jbe 0x1004865a9
0x100484dcc: vdivss xmm5, xmm7, xmm1
0x100484dd0: vmovss xmm3, dword ptr [r14 + 0x48]
0x100484dd6: vxorps xmm2, xmm2, xmm2
0x100484dda: vucomiss xmm3, xmm2
0x100484dde: jbe 0x100484e38
0x100484de0: vmaxss xmm4, xmm2, xmm5
0x100484de4: vmovss xmm8, dword ptr [rip + 0x6202d4] ; 0x100aa50c0
0x100484dec: vminss xmm4, xmm8, xmm4
0x100484df0: vdivss xmm3, xmm3, xmm1
0x100484df4: vdivss xmm3, xmm4, xmm3
0x100484df8: vmaxss xmm3, xmm2, xmm3
0x100484dfc: vminss xmm3, xmm8, xmm3
0x100484e00: vmulss xmm4, xmm3, xmm3
0x100484e04: vmulss xmm4, xmm3, xmm4
0x100484e08: vmulss xmm6, xmm3, dword ptr [rip + 0x621c94] ; 0x100aa6aa4
0x100484e10: vaddss xmm6, xmm6, dword ptr [rip + 0x624864] ; 0x100aa967c
0x100484e18: vmulss xmm3, xmm3, xmm6
0x100484e1c: vaddss xmm3, xmm3, dword ptr [rip + 0x6229b8] ; 0x100aa77dc
0x100484e24: vmulss xmm3, xmm4, xmm3
0x100484e28: vsubss xmm4, xmm8, xmm3
0x100484e2c: vmulss xmm4, xmm4, xmm2
0x100484e30: vmulss xmm3, xmm5, xmm3
0x100484e34: vaddss xmm5, xmm3, xmm4
0x100484e38: vmovss xmm3, dword ptr [r14 + 0x4c]
0x100484e3e: vucomiss xmm3, xmm2
0x100484e42: jbe 0x100484eb2
0x100484e44: mov rax, qword ptr [r14 + 0x38]
0x100484e48: cmp byte ptr [rax + 0x2c], 0
0x100484e4c: jne 0x100484eb2
0x100484e4e: vsubss xmm2, xmm3, xmm1
0x100484e52: vaddss xmm2, xmm7, xmm2
0x100484e56: vdivss xmm2, xmm2, xmm1
0x100484e5a: vxorps xmm4, xmm4, xmm4
0x100484e5e: vmaxss xmm2, xmm4, xmm2
0x100484e62: vmovss xmm6, dword ptr [rip + 0x620256] ; 0x100aa50c0
0x100484e6a: vminss xmm2, xmm6, xmm2
0x100484e6e: vdivss xmm3, xmm3, xmm1
0x100484e72: vdivss xmm2, xmm2, xmm3
0x100484e76: vmaxss xmm2, xmm4, xmm2
0x100484e7a: vminss xmm2, xmm6, xmm2
0x100484e7e: vmulss xmm3, xmm2, xmm2
0x100484e82: vmulss xmm3, xmm2, xmm3
0x100484e86: vmulss xmm4, xmm2, dword ptr [rip + 0x621c16] ; 0x100aa6aa4
0x100484e8e: vaddss xmm4, xmm4, dword ptr [rip + 0x6247e6] ; 0x100aa967c
0x100484e96: vmulss xmm2, xmm2, xmm4
0x100484e9a: vaddss xmm2, xmm2, dword ptr [rip + 0x62293a] ; 0x100aa77dc
0x100484ea2: vmulss xmm2, xmm3, xmm2
0x100484ea6: vsubss xmm3, xmm6, xmm2
0x100484eaa: vmulss xmm3, xmm5, xmm3
0x100484eae: vaddss xmm5, xmm2, xmm3
0x100484eb2: vsubss xmm2, xmm7, dword ptr [r14 + 0xcc]
0x100484ebb: vmulss xmm1, xmm1, dword ptr [rip + 0x61f6f5] ; 0x100aa45b8
0x100484ec3: vucomiss xmm2, xmm1
0x100484ec7: ja 0x100484f07
0x100484ec9: vmulss xmm0, xmm0, dword ptr [rip + 0x63eb4b] ; 0x100ac3a1c
0x100484ed1: vmovss dword ptr [rbp - 0x30], xmm7
0x100484ed6: vmovss dword ptr [rbp - 0x60], xmm5
0x100484edb: call 0x100aa2708 ; 0x100aa2708 _expf
0x100484ee0: vmovss xmm7, dword ptr [rbp - 0x30]
0x100484ee5: vmovss xmm1, dword ptr [rip + 0x6201d3] ; 0x100aa50c0
0x100484eed: vsubss xmm0, xmm1, xmm0
0x100484ef1: vsubss xmm1, xmm1, xmm0
0x100484ef5: vmulss xmm1, xmm1, dword ptr [r14 + 0xc8]
0x100484efe: vmulss xmm0, xmm0, dword ptr [rbp - 0x60]
0x100484f03: vaddss xmm5, xmm0, xmm1
0x100484f07: cmp byte ptr [r14 + 0xd8], 0
0x100484f0f: setne cl
0x100484f12: vmovss xmm0, dword ptr [rip + 0x6229b2] ; 0x100aa78cc
0x100484f1a: vucomiss xmm0, xmm5
0x100484f1e: seta al
0x100484f21: and al, cl
0x100484f23: jne 0x100484f29
0x100484f25: vmovaps xmm0, xmm5
0x100484f29: vmovss dword ptr [r14 + 0xc8], xmm0
0x100484f32: vxorps xmm0, xmm0, xmm0
0x100484f36: test al, al
0x100484f38: jne 0x100484f3e
0x100484f3a: vmovaps xmm0, xmm7
0x100484f3e: vmovss dword ptr [r14 + 0xcc], xmm0
0x100484f47: lea rcx, [r14 + 0x40]
0x100484f4b: mov rax, qword ptr [rcx]
0x100484f4e: cmp dword ptr [rax + 0x10], 0
0x100484f52: jne 0x100484fc0
0x100484f54: lea rdx, [r14 + 0x38]
0x100484f58: mov rax, qword ptr [rdx]
0x100484f5b: cmp byte ptr [rax + 0x2c], 0
0x100484f5f: jne 0x100486517
0x100484f65: jmp 0x1004864db ; 0x1004864db
0x100484f6a: vmovss xmm4, dword ptr [rbp - 0x40]
0x100484f6f: vucomiss xmm4, xmm3
0x100484f73: vmovaps xmm3, xmm4
0x100484f77: jbe 0x100484f81
0x100484f79: vdivss xmm0, xmm3, xmm2
0x100484f7d: vaddss xmm0, xmm1, xmm0
0x100484f81: cmp byte ptr [rax + 0x2c], 0
0x100484f85: je 0x100484f96
0x100484f87: vmovss xmm1, dword ptr [rip + 0x620131] ; 0x100aa50c0
0x100484f8f: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100484f94: jmp 0x100484faa ; 0x100484faa
0x100484f96: vxorps xmm1, xmm1, xmm1
0x100484f9a: vmaxss xmm0, xmm1, xmm0
0x100484f9e: vmovss xmm1, dword ptr [rip + 0x62011a] ; 0x100aa50c0
0x100484fa6: vminss xmm0, xmm1, xmm0
0x100484faa: lea rcx, [r14 + 0x40]
0x100484fae: vmovss dword ptr [r14 + 0xc8], xmm0
0x100484fb7: mov rax, qword ptr [rcx]
0x100484fba: cmp dword ptr [rax + 0x10], 0
0x100484fbe: je 0x100484f54
0x100484fc0: lea rdx, [r14 + 0x38]
0x100484fc4: xor ebx, ebx
0x100484fc6: lea r13, [rbp - 0x1b0]
0x100484fcd: mov qword ptr [rbp - 0x168], rcx
0x100484fd4: mov qword ptr [rbp - 0xb8], rdx
0x100484fdb: jmp 0x100485010 ; 0x100485010
0x100484fdd: vmaxss xmm0, xmm1, xmm0
0x100484fe1: vmovss xmm1, dword ptr [rip + 0x6200d7] ; 0x100aa50c0
0x100484fe9: vminss xmm0, xmm1, xmm0
0x100484fed: mov rax, qword ptr [r14 + 0x90]
0x100484ff4: test rax, rax
0x100484ff7: jne 0x100485179
0x100484ffd: jmp 0x10048517e ; 0x10048517e
0x100485002: nop word ptr cs:[rax + rax]
0x100485010: mov rcx, qword ptr [r14 + 0xb0]
0x100485017: mov qword ptr [rbp - 0x30], rcx
0x10048501b: mov ebx, ebx
0x10048501d: mov rax, qword ptr [rax + 8]
0x100485021: mov rax, qword ptr [rax + rbx*8]
0x100485025: mov qword ptr [rbp - 0x1b0], rax
0x10048502c: call 0x1007abc10 ; 0x1007abc10
0x100485031: mov qword ptr [rbp - 0x60], rax
0x100485035: mov qword ptr [rbp - 0x250], 0
0x100485040: call 0x1007abc10 ; 0x1007abc10
0x100485045: mov r8, qword ptr [rax]
0x100485048: mov rdi, rax
0x10048504b: mov rdx, r13
0x10048504e: mov r13, r14
0x100485051: mov r14, rbx
0x100485054: lea r12, [rbp - 0x250]
0x10048505b: mov rsi, r12
0x10048505e: mov r15, rdx
0x100485061: mov rcx, qword ptr [rbp - 0x60]
0x100485065: call qword ptr [r8 + 0x40]
0x100485069: mov rsi, qword ptr [rbp - 0x250]
0x100485070: test rsi, rsi
0x100485073: je 0x100486630
0x100485079: mov rdi, r12
0x10048507c: mov qword ptr [rbp - 0x170], rsi
0x100485083: call 0x1004d1e40 ; 0x1004d1e40
0x100485088: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x100485090: vmovaps xmmword ptr [rbp - 0x280], xmm0
0x100485098: mov rcx, r14
0x10048509b: lea rax, [r14 + r14*2]
0x10048509f: shl rax, 5
0x1004850a3: cmp byte ptr [r13 + 0x64], 0
0x1004850a8: mov rdx, qword ptr [rbp - 0x30]
0x1004850ac: vmovss xmm0, dword ptr [rdx + rax + 0x30]
0x1004850b2: mov r14, r13
0x1004850b5: je 0x1004850e0
0x1004850b7: vucomiss xmm0, xmm0
0x1004850bb: vxorps xmm0, xmm0, xmm0
0x1004850bf: mov rbx, qword ptr [rbp - 0xb8]
0x1004850c6: mov r13, r15
0x1004850c9: vxorps xmm1, xmm1, xmm1
0x1004850cd: jnp 0x1004850ee
0x1004850cf: jmp 0x10048664f ; 0x10048664f
0x1004850d4: nop word ptr cs:[rax + rax]
0x1004850e0: mov rbx, qword ptr [rbp - 0xb8]
0x1004850e7: mov r13, r15
0x1004850ea: vxorps xmm1, xmm1, xmm1
0x1004850ee: mov qword ptr [rbp - 0x60], rax
0x1004850f2: vaddss xmm0, xmm0, dword ptr [r14 + 0xc8]
0x1004850fb: mov rax, qword ptr [r14 + 0x38]
0x1004850ff: cmp byte ptr [rax + 0x2c], 0
0x100485103: mov qword ptr [rbp - 0x110], rcx
0x10048510a: mov r15, qword ptr [rbp - 0x30]
0x10048510e: jne 0x10048511b
0x100485110: cmp byte ptr [r14 + 0x59], 0
0x100485115: je 0x100484fdd
0x10048511b: vcvtss2sd xmm2, xmm0, xmm0
0x10048511f: mov eax, dword ptr [r14 + 0xdc]
0x100485126: vcvtsi2sd xmm1, xmm15, rax
0x10048512b: vaddsd xmm1, xmm1, qword ptr [rip + 0x620d7d] ; 0x100aa5eb0
0x100485133: vucomisd xmm2, xmm1
0x100485137: jb 0x100485160
0x100485139: mov rdi, qword ptr [r14 + 0x98]
0x100485140: test rdi, rdi
0x100485143: je 0x100485160
0x100485145: mov esi, 1
0x10048514a: vmovsd qword ptr [rbp - 0x40], xmm0
0x10048514f: call 0x1004d1f60 ; 0x1004d1f60
0x100485154: vmovsd xmm0, qword ptr [rbp - 0x40]
0x100485159: inc dword ptr [r14 + 0xdc]
0x100485160: vmovss xmm1, dword ptr [rip + 0x61ff58] ; 0x100aa50c0
0x100485168: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10048516d: mov rax, qword ptr [r14 + 0x90]
0x100485174: test rax, rax
0x100485177: je 0x10048517e
0x100485179: vmovss dword ptr [rax + 0x10], xmm0
0x10048517e: mov rdi, qword ptr [rbx]
0x100485181: vmovsd qword ptr [rbp - 0x40], xmm0
0x100485186: vmulss xmm0, xmm0, dword ptr [rdi + 0x18]
0x10048518b: call 0x10055d4e0 ; 0x10055d4e0
0x100485190: mov rsi, qword ptr [rbx]
0x100485193: mov rdi, r12
0x100485196: call 0x100560b40 ; 0x100560b40
0x10048519b: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x1004851a3: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x1004851ab: vmovaps xmmword ptr [rbp - 0x210], xmm0
0x1004851b3: mov rdi, qword ptr [rbx]
0x1004851b6: cmp byte ptr [rdi + 0x2c], 0
0x1004851ba: je 0x1004851d0
0x1004851bc: vmovsd xmm0, qword ptr [rbp - 0x40]
0x1004851c1: jmp 0x1004851dd ; 0x1004851dd
0x1004851c3: nop word ptr cs:[rax + rax]
0x1004851d0: vmovsd xmm0, qword ptr [rbp - 0x40]
0x1004851d5: vminss xmm0, xmm0, dword ptr [rip + 0x62347f] ; 0x100aa865c
0x1004851dd: lea r12, [rbp - 0x150]
0x1004851e4: vmulss xmm0, xmm0, dword ptr [rdi + 0x18]
0x1004851e9: call 0x10055d4e0 ; 0x10055d4e0
0x1004851ee: mov rsi, qword ptr [rbx]
0x1004851f1: mov rdi, r13
0x1004851f4: vmovsd qword ptr [rbp - 0x70], xmm0
0x1004851f9: call 0x10055e5a0 ; 0x10055e5a0
0x1004851fe: vmovaps xmm7, xmmword ptr [rbp - 0x1b0]
0x100485206: vmulps xmm0, xmm7, xmm7
0x10048520a: vmovshdup xmm1, xmm0
0x10048520e: vaddss xmm1, xmm0, xmm1
0x100485212: vpermilpd xmm0, xmm0, 1
0x100485218: vaddss xmm0, xmm0, xmm1
0x10048521c: vsqrtss xmm0, xmm0, xmm0
0x100485220: vucomiss xmm0, dword ptr [rip + 0x62269c] ; 0x100aa78c4
0x100485228: jbe 0x100485234
0x10048522a: vpermilps xmm0, xmm0, 0xc0
0x100485230: vdivps xmm7, xmm7, xmm0
0x100485234: vmovaps xmm2, xmmword ptr [rip + 0x6226c4] ; 0x100aa7900
0x10048523c: mov rdx, qword ptr [rbp - 0x60]
0x100485240: vxorps xmm4, xmm7, xmm2
0x100485244: vpshufd xmm5, xmm4, 0xf5
0x100485249: vucomiss xmm4, xmm5
0x10048524d: jp 0x1004865f6
0x100485253: vpshufd xmm6, xmm4, 0x4e
0x100485258: vucomiss xmm6, xmm6
0x10048525c: jp 0x1004865f6
0x100485262: vpand xmm0, xmm5, xmmword ptr [rip + 0x6226a6] ; 0x100aa7910
0x10048526a: vaddss xmm0, xmm0, dword ptr [rip + 0x62523a] ; 0x100aaa4ac
0x100485272: vdivss xmm0, xmm0, dword ptr [rip + 0x63e7a6] ; 0x100ac3a20
0x10048527a: mov rax, qword ptr [rbp - 0x48]
0x10048527e: mov rax, qword ptr [rax + 0x160]
0x100485285: lea rcx, [rip + 0x1b75e44] ; 0x101ffb0d0
0x10048528c: cmp byte ptr [rcx], 0
0x10048528f: vmovss xmm1, dword ptr [rip + 0x61fe29] ; 0x100aa50c0
0x100485297: je 0x1004852a4
0x100485299: lea rcx, [rip + 0x8332a0] ; 0x100cb8540
0x1004852a0: vmovss xmm1, dword ptr [rcx]
0x1004852a4: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x1004852a9: vmulss xmm1, xmm1, dword ptr [rax + 0x14]
0x1004852ae: vinsertps xmm0, xmm0, xmm1, 0x10
0x1004852b4: vmovaps xmm1, xmmword ptr [rip + 0x63e774] ; 0x100ac3a30
0x1004852bc: vmaxps xmm0, xmm1, xmm0
0x1004852c0: vmovaps xmm1, xmmword ptr [rip + 0x63e778] ; 0x100ac3a40
0x1004852c8: vminps xmm0, xmm1, xmm0
0x1004852cc: vmovshdup xmm1, xmm0
0x1004852d0: vmulss xmm1, xmm0, xmm1
0x1004852d4: lea rbx, [r15 + rdx + 0x50]
0x1004852d9: vmovss xmm3, dword ptr [r15 + rdx + 0x50]
0x1004852e0: vxorps xmm2, xmm1, xmm2
0x1004852e4: vucomiss xmm2, xmm3
0x1004852e8: vmovaps xmmword ptr [rbp - 0x40], xmm4
0x1004852ed: vmovdqa xmmword ptr [rbp - 0xb0], xmm5
0x1004852f5: vmovdqa xmmword ptr [rbp - 0x80], xmm6
0x1004852fa: vmovaps xmmword ptr [rbp - 0xe0], xmm7
0x100485302: jbe 0x100485310
0x100485304: vaddss xmm2, xmm3, xmm1
0x100485308: jmp 0x10048531e ; 0x10048531e
0x10048530a: nop word ptr [rax + rax]
0x100485310: vxorps xmm2, xmm2, xmm2
0x100485314: vucomiss xmm3, xmm1
0x100485318: jbe 0x10048531e
0x10048531a: vsubss xmm2, xmm3, xmm1
0x10048531e: vmovss xmm1, dword ptr [rip + 0x61fd9a] ; 0x100aa50c0
0x100485326: vsubss xmm0, xmm1, xmm0
0x10048532a: vmaxss xmm1, xmm0, xmm2
0x10048532e: vcmpunordss xmm2, xmm2, xmm2
0x100485333: vblendvps xmm0, xmm1, xmm0, xmm2
0x100485339: vmovss dword ptr [rbx], xmm0
0x10048533d: mov rax, qword ptr [rip + 0x622d5c] ; 0x100aa80a0
0x100485344: mov qword ptr [rbp - 0x150], rax
0x10048534b: mov dword ptr [rbp - 0x148], 0
0x100485355: lea r15, [r15 + rdx + 0x40]
0x10048535a: mov qword ptr [rbp - 0x200], rax
0x100485361: mov dword ptr [rbp - 0x1f8], 0
0x10048536b: mov rdi, r13
0x10048536e: mov rsi, r12
0x100485371: mov rdx, r15
0x100485374: lea rcx, [rbp - 0x200]
0x10048537b: call 0x100111b90 ; 0x100111b90
0x100485380: vmovaps xmm1, xmmword ptr [rbp - 0x1b0]
0x100485388: vmulps xmm0, xmm1, xmm1
0x10048538c: vmovshdup xmm2, xmm0
0x100485390: vaddss xmm2, xmm0, xmm2
0x100485394: vpermilpd xmm0, xmm0, 1
0x10048539a: vaddss xmm0, xmm0, xmm2
0x10048539e: vsqrtss xmm0, xmm0, xmm0
0x1004853a2: vmovss xmm4, dword ptr [rip + 0x62251a] ; 0x100aa78c4
0x1004853aa: vmovaps xmm8, xmm4
0x1004853ae: vucomiss xmm0, xmm8
0x1004853b3: jbe 0x1004853bf
0x1004853b5: vpermilps xmm0, xmm0, 0xc0
0x1004853bb: vdivps xmm1, xmm1, xmm0
0x1004853bf: vxorps xmm3, xmm3, xmm3
0x1004853c3: vmovaps xmm5, xmmword ptr [rbp - 0x1c0]
0x1004853cb: vmovaps xmm6, xmmword ptr [rbp - 0x40]
0x1004853d0: vpermilps xmm0, xmm1, 0xd2
0x1004853d6: vmulps xmm2, xmm0, xmm6
0x1004853da: vpermilps xmm0, xmm6, 0xd2
0x1004853e0: vmulps xmm1, xmm0, xmm1
0x1004853e4: vsubps xmm1, xmm2, xmm1
0x1004853e8: vpermilps xmm4, xmm1, 0xd2
0x1004853ee: vmulps xmm1, xmm1, xmm1
0x1004853f2: vpermilpd xmm2, xmm1, 1
0x1004853f8: vaddss xmm2, xmm2, xmm1
0x1004853fc: vmovshdup xmm1, xmm1
0x100485400: vaddss xmm1, xmm1, xmm2
0x100485404: vsqrtss xmm1, xmm1, xmm1
0x100485408: vucomiss xmm1, xmm8
0x10048540d: mov rcx, qword ptr [rbp - 0x60]
0x100485411: jbe 0x10048541d
0x100485413: vpermilps xmm1, xmm1, 0xc0
0x100485419: vdivps xmm4, xmm4, xmm1
0x10048541d: vmulps xmm0, xmm0, xmm4
0x100485421: vpermilps xmm1, xmm4, 0xd2
0x100485427: vmulps xmm1, xmm1, xmm6
0x10048542b: vsubps xmm0, xmm0, xmm1
0x10048542f: vpermilps xmm7, xmm0, 0xd2
0x100485435: vmulps xmm0, xmm0, xmm0
0x100485439: vpermilpd xmm1, xmm0, 1
0x10048543f: vaddss xmm1, xmm1, xmm0
0x100485443: vmovshdup xmm0, xmm0
0x100485447: vaddss xmm0, xmm0, xmm1
0x10048544b: vsqrtss xmm0, xmm0, xmm0
0x10048544f: vucomiss xmm0, xmm8
0x100485454: jbe 0x100485460
0x100485456: vpermilps xmm0, xmm0, 0xc0
0x10048545c: vdivps xmm7, xmm7, xmm0
0x100485460: vmovss xmm0, dword ptr [rbx]
0x100485464: vucomiss xmm0, xmm3
0x100485468: jne 0x100485489
0x10048546a: jp 0x100485489
0x10048546c: vmovaps xmmword ptr [r15], xmm7
0x100485471: mov rax, qword ptr [rbp - 0x30]
0x100485475: vmovss xmm0, dword ptr [rax + rcx + 0x44]
0x10048547b: vandps xmm0, xmm0, xmmword ptr [rip + 0x62248d] ; 0x100aa7910
0x100485483: vmovss dword ptr [rax + rcx + 0x44], xmm0
0x100485489: vmovaps xmm0, xmmword ptr [r15]
0x10048548e: vmulps xmm1, xmm6, xmm0
0x100485492: vmovshdup xmm2, xmm1
0x100485496: vaddss xmm2, xmm1, xmm2
0x10048549a: vpermilpd xmm1, xmm1, 1
0x1004854a0: vaddss xmm1, xmm1, xmm2
0x1004854a4: vpermilps xmm1, xmm1, 0xc0
0x1004854aa: vmulps xmm1, xmm1, xmm6
0x1004854ae: vsubps xmm0, xmm0, xmm1
0x1004854b2: vmovss xmm1, dword ptr [rip + 0x61fc06] ; 0x100aa50c0
0x1004854ba: vinsertps xmm5, xmm1, xmm5, 0xf6
0x1004854c0: vmulps xmm1, xmm0, xmm0
0x1004854c4: vmovshdup xmm2, xmm1
0x1004854c8: vaddss xmm2, xmm1, xmm2
0x1004854cc: vpermilpd xmm1, xmm1, 1
0x1004854d2: vaddss xmm1, xmm1, xmm2
0x1004854d6: vsqrtss xmm2, xmm1, xmm1
0x1004854da: vucomiss xmm2, xmm8
0x1004854df: vmovaps xmm1, xmm5
0x1004854e3: jbe 0x1004854ef
0x1004854e5: vpermilps xmm1, xmm2, 0xc0
0x1004854eb: vdivps xmm1, xmm0, xmm1
0x1004854ef: vmovaps xmmword ptr [r15], xmm1
0x1004854f4: mov rax, qword ptr [rbp - 0x48]
0x1004854f8: mov rax, qword ptr [rax + 0x160]
0x1004854ff: lea rcx, [rip + 0x1b75bca] ; 0x101ffb0d0
0x100485506: cmp byte ptr [rcx], 0
0x100485509: vmovss xmm0, dword ptr [rip + 0x61fbaf] ; 0x100aa50c0
0x100485511: je 0x10048551e
0x100485513: lea rcx, [rip + 0x833026] ; 0x100cb8540
0x10048551a: vmovss xmm0, dword ptr [rcx]
0x10048551e: vmovss dword ptr [rbp - 0x160], xmm0
0x100485526: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x10048552b: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x100485530: vmovss xmm1, dword ptr [rip + 0x621564] ; 0x100aa6a9c
0x100485538: vmaxss xmm0, xmm1, xmm0
0x10048553c: vmovss xmm1, dword ptr [rip + 0x62155c] ; 0x100aa6aa0
0x100485544: vminss xmm0, xmm1, xmm0
0x100485548: vinsertps xmm0, xmm0, xmm0, 0x1c
0x10048554e: vbroadcastss xmm1, dword ptr [r14 + 0x84]
0x100485557: vmulps xmm0, xmm1, xmm0
0x10048555b: mov rcx, qword ptr [r14 + 0xc0]
0x100485562: mov rax, qword ptr [rbp - 0x110]
0x100485569: shl rax, 5
0x10048556d: vaddps xmm0, xmm0, xmmword ptr [rcx + rax + 0x10]
0x100485573: vmovaps xmmword ptr [rcx + rax + 0x10], xmm0
0x100485579: cmp byte ptr [r14 + 0x74], 0
0x10048557e: vmovaps xmm0, xmmword ptr [rbp - 0x240]
0x100485586: vmovaps xmm1, xmm4
0x10048558a: mov r15, qword ptr [rbp - 0x30]
0x10048558e: je 0x100485598
0x100485590: vmovaps xmm1, xmmword ptr [rbp - 0x250]
0x100485598: vmovaps xmmword ptr [rbp - 0x90], xmm1
0x1004855a0: vmovaps xmmword ptr [rbp - 0xa0], xmm4
0x1004855a8: vmovaps xmmword ptr [rbp - 0x1c0], xmm5
0x1004855b0: cmp byte ptr [r14 + 0x75], 0
0x1004855b5: vmovaps xmmword ptr [rbp - 0x70], xmm7
0x1004855ba: je 0x1004855c0
0x1004855bc: vmovaps xmm7, xmm0
0x1004855c0: vmovaps xmmword ptr [rbp - 0x100], xmm7
0x1004855c8: mov rcx, qword ptr [r14 + 0xc0]
0x1004855cf: vmovss xmm0, dword ptr [rcx + rax + 0x10]
0x1004855d5: vmovss xmm1, dword ptr [rcx + rax + 0x14]
0x1004855db: vmovss dword ptr [rbp - 0xd0], xmm1
0x1004855e3: call 0x100aa2bca ; 0x100aa2bca _sinf
0x1004855e8: vpermilps xmm0, xmm0, 0xc0
0x1004855ee: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x90]
0x1004855f6: vbroadcastss xmm1, dword ptr [r14 + 0x78]
0x1004855fc: vmulps xmm0, xmm1, xmm0
0x100485600: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x100485608: vmovss xmm0, dword ptr [rbp - 0xd0]
0x100485610: call 0x100aa260c ; 0x100aa260c _cosf
0x100485615: vpermilps xmm0, xmm0, 0xc0
0x10048561b: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x100]
0x100485623: vbroadcastss xmm1, dword ptr [r14 + 0x7c]
0x100485629: vmulps xmm0, xmm1, xmm0
0x10048562d: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x90]
0x100485635: vaddps xmm0, xmm0, xmmword ptr [rbp - 0xf0]
0x10048563d: vmovaps xmmword ptr [rbp - 0x210], xmm0
0x100485645: vmovaps xmm3, xmmword ptr [rbp - 0xe0]
0x10048564d: vmovshdup xmm1, xmm3
0x100485651: vandps xmm0, xmm1, xmmword ptr [rip + 0x6222b7] ; 0x100aa7910
0x100485659: vaddss xmm0, xmm0, dword ptr [rip + 0x62216f] ; 0x100aa77d0
0x100485661: vdivss xmm2, xmm0, dword ptr [rip + 0x63e3bb] ; 0x100ac3a24
0x100485669: vpermilps xmm0, xmm3, 0xd5
0x10048566f: vmulps xmm0, xmm0, xmmword ptr [rip + 0x622a29] ; 0x100aa80a0
0x100485677: vsubps xmm0, xmm3, xmm0
0x10048567b: vmulps xmm3, xmm0, xmm0
0x10048567f: vmovshdup xmm4, xmm3
0x100485683: vaddss xmm4, xmm3, xmm4
0x100485687: vpermilpd xmm3, xmm3, 1
0x10048568d: vaddss xmm3, xmm3, xmm4
0x100485691: vsqrtss xmm3, xmm3, xmm3
0x100485695: vmovss xmm5, dword ptr [rip + 0x622227] ; 0x100aa78c4
0x10048569d: vmovaps xmm6, xmm5
0x1004856a1: vucomiss xmm3, xmm6
0x1004856a5: jbe 0x1004856b1
0x1004856a7: vpermilps xmm3, xmm3, 0xc0
0x1004856ad: vdivps xmm0, xmm0, xmm3
0x1004856b1: vxorps xmm15, xmm15, xmm15
0x1004856b6: vmovaps xmm7, xmmword ptr [rip + 0x622242] ; 0x100aa7900
0x1004856be: vmovaps xmm8, xmmword ptr [rbp - 0xb0]
0x1004856c6: vmovaps xmm9, xmmword ptr [rbp - 0x80]
0x1004856cb: vmovaps xmm10, xmmword ptr [rbp - 0x70]
0x1004856d0: vmaxss xmm2, xmm15, xmm2
0x1004856d4: vucomiss xmm1, xmm15
0x1004856d9: vmovaps xmm3, xmm10
0x1004856dd: vmovapd xmm5, xmmword ptr [rbp - 0xa0]
0x1004856e5: jbe 0x1004856eb
0x1004856e7: vxorps xmm3, xmm10, xmm7
0x1004856eb: vmovss xmm1, dword ptr [rip + 0x61f9cd] ; 0x100aa50c0
0x1004856f3: vminss xmm1, xmm1, xmm2
0x1004856f7: vpermilps xmm2, xmm3, 0xd5
0x1004856fd: vmulps xmm2, xmm2, xmmword ptr [rip + 0x62299b] ; 0x100aa80a0
0x100485705: vsubps xmm2, xmm3, xmm2
0x100485709: vmulps xmm3, xmm2, xmm2
0x10048570d: vmovshdup xmm4, xmm3
0x100485711: vaddss xmm4, xmm3, xmm4
0x100485715: vpermilpd xmm3, xmm3, 1
0x10048571b: vaddss xmm3, xmm3, xmm4
0x10048571f: vsqrtss xmm3, xmm3, xmm3
0x100485723: vucomiss xmm3, xmm6
0x100485727: jbe 0x100485733
0x100485729: vpermilps xmm3, xmm3, 0xc0
0x10048572f: vdivps xmm2, xmm2, xmm3
0x100485733: vmovss xmm3, dword ptr [rip + 0x61f985] ; 0x100aa50c0
0x10048573b: vsubss xmm3, xmm3, xmm1
0x10048573f: vpermilps xmm3, xmm3, 0xc0
0x100485745: vmulps xmm0, xmm3, xmm0
0x100485749: vpermilps xmm1, xmm1, 0xc0
0x10048574f: vmulps xmm1, xmm1, xmm2
0x100485753: vaddps xmm1, xmm0, xmm1
0x100485757: vmulps xmm0, xmm1, xmm1
0x10048575b: vmovshdup xmm2, xmm0
0x10048575f: vaddss xmm2, xmm0, xmm2
0x100485763: vpermilpd xmm0, xmm0, 1
0x100485769: vaddss xmm0, xmm0, xmm2
0x10048576d: vsqrtss xmm0, xmm0, xmm0
0x100485771: vucomiss xmm0, xmm6
0x100485775: jbe 0x100485781
0x100485777: vpermilps xmm0, xmm0, 0xc0
0x10048577d: vdivps xmm1, xmm1, xmm0
0x100485781: vxorps xmm13, xmm1, xmm7
0x100485785: vmulps xmm2, xmm1, xmmword ptr [rip + 0x622193] ; 0x100aa7920
0x10048578d: vpshufd xmm0, xmm13, 0xd2
0x100485793: vmulps xmm1, xmm1, xmmword ptr [rip + 0x623aa5] ; 0x100aa9240
0x10048579b: vpermilps xmm1, xmm1, 0xd2
0x1004857a1: vsubps xmm1, xmm2, xmm1
0x1004857a5: vpermilps xmm2, xmm1, 0xd2
0x1004857ab: vmulps xmm1, xmm1, xmm1
0x1004857af: vpermilpd xmm3, xmm1, 1
0x1004857b5: vaddss xmm3, xmm3, xmm1
0x1004857b9: vmovshdup xmm1, xmm1
0x1004857bd: vaddss xmm1, xmm1, xmm3
0x1004857c1: vsqrtss xmm1, xmm1, xmm1
0x1004857c5: vucomiss xmm1, xmm6
0x1004857c9: jbe 0x1004857d5
0x1004857cb: vpermilps xmm1, xmm1, 0xc0
0x1004857d1: vdivps xmm2, xmm2, xmm1
0x1004857d5: vmulps xmm0, xmm0, xmm2
0x1004857d9: vpermilps xmm1, xmm2, 0xd2
0x1004857df: vmulps xmm1, xmm1, xmm13
0x1004857e4: vsubps xmm0, xmm0, xmm1
0x1004857e8: vpermilps xmm14, xmm0, 0xd2
0x1004857ee: vmulps xmm0, xmm0, xmm0
0x1004857f2: vpermilpd xmm1, xmm0, 1
0x1004857f8: vaddss xmm1, xmm1, xmm0
0x1004857fc: vmovshdup xmm0, xmm0
0x100485800: vaddss xmm0, xmm0, xmm1
0x100485804: vsqrtss xmm0, xmm0, xmm0
0x100485808: vucomiss xmm0, xmm6
0x10048580c: jbe 0x100485818
0x10048580e: vpermilps xmm0, xmm0, 0xc0
0x100485814: vdivps xmm14, xmm14, xmm0
0x100485818: vpermilpd xmm1, xmm5, 1
0x10048581e: vmovshdup xmm3, xmm10
0x100485823: vaddss xmm0, xmm5, xmm3
0x100485827: vaddss xmm0, xmm9, xmm0
0x10048582b: vucomiss xmm15, xmm0
0x10048582f: seta dil
0x100485833: vucomiss xmm9, xmm5
0x100485837: seta dl
0x10048583a: vucomiss xmm9, xmm3
0x10048583e: seta bl
0x100485841: vucomiss xmm3, xmm5
0x100485845: setbe al
0x100485848: seta sil
0x10048584c: or sil, dl
0x10048584f: or al, bl
0x100485851: mov ecx, esi
0x100485853: and cl, dil
0x100485856: jne 0x100485860
0x100485858: vmovaps xmm4, xmm5
0x10048585c: jmp 0x100485868 ; 0x100485868
0x10048585e: nop 
0x100485860: vxorps xmm4, xmm5, xmm7
0x100485864: vxorps xmm8, xmm8, xmm7
0x100485868: and dl, bl
0x10048586a: vxorpd xmm6, xmm1, xmm7
0x10048586e: and al, dil
0x100485871: je 0x100485877
0x100485873: vxorps xmm3, xmm3, xmm7
0x100485877: xor dl, 1
0x10048587a: test al, al
0x10048587c: jne 0x100485882
0x10048587e: vmovapd xmm6, xmm1
0x100485882: vmovshdup xmm5, xmm5
0x100485886: vpermilpd xmm0, xmm10, 1
0x10048588c: and dl, dil
0x10048588f: je 0x100485899
0x100485891: vxorps xmm9, xmm9, xmm7
0x100485895: vxorps xmm10, xmm10, xmm7
0x100485899: vaddss xmm1, xmm4, xmm3
0x10048589d: vaddss xmm1, xmm9, xmm1
0x1004858a1: vmovss xmm3, dword ptr [rip + 0x61f817] ; 0x100aa50c0
0x1004858a9: vaddss xmm4, xmm1, xmm3
0x1004858ad: vsqrtss xmm1, xmm4, xmm4
0x1004858b1: vdivss xmm1, xmm3, xmm1
0x1004858b5: vmulss xmm7, xmm1, dword ptr [rip + 0x61ecfb] ; 0x100aa45b8
0x1004858bd: vsubss xmm0, xmm0, xmm8
0x1004858c2: vmulss xmm0, xmm0, xmm7
0x1004858c6: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x1004858cb: vsubss xmm1, xmm1, xmm6
0x1004858cf: vmulss xmm3, xmm1, xmm7
0x1004858d3: vsubss xmm1, xmm5, xmm10
0x1004858d8: vmulss xmm1, xmm1, xmm7
0x1004858dc: vmulss xmm12, xmm4, xmm7
0x1004858e0: jne 0x1004858f0
0x1004858e2: vmovaps xmm10, xmm3
0x1004858e6: vmovaps xmm11, xmm12
0x1004858eb: jmp 0x1004858fc ; 0x1004858fc
0x1004858ed: nop dword ptr [rax]
0x1004858f0: vmovaps xmm10, xmm1
0x1004858f4: vmovaps xmm1, xmm3
0x1004858f8: vmovaps xmm11, xmm0
0x1004858fc: mov eax, esi
0x1004858fe: and al, dil
0x100485901: vmovaps xmm3, xmmword ptr [rip + 0x621ff7] ; 0x100aa7900
0x100485909: jne 0x100485920
0x10048590b: vmovaps xmm8, xmm1
0x10048590f: test dl, dl
0x100485911: je 0x10048592d
0x100485913: jmp 0x100485931 ; 0x100485931
0x100485915: nop word ptr cs:[rax + rax]
0x100485920: vmovaps xmm8, xmm11
0x100485925: vmovaps xmm11, xmm1
0x100485929: test dl, dl
0x10048592b: jne 0x100485931
0x10048592d: vmovaps xmm12, xmm0
0x100485931: vmovshdup xmm5, xmm14
0x100485936: vpermilpd xmm6, xmm13, 1
0x10048593c: vaddss xmm0, xmm2, xmm5
0x100485940: vaddss xmm0, xmm6, xmm0
0x100485944: vmovaps xmm9, xmm12
0x100485949: and sil, dil
0x10048594c: jne 0x100485953
0x10048594e: vmovaps xmm9, xmm10
0x100485953: vmovshdup xmm4, xmm13
0x100485958: vucomiss xmm15, xmm0
0x10048595c: seta dil
0x100485960: vucomiss xmm6, xmm2
0x100485964: seta bl
0x100485967: vucomiss xmm6, xmm5
0x10048596b: seta cl
0x10048596e: vucomiss xmm5, xmm2
0x100485972: setbe al
0x100485975: vxorps xmm7, xmm2, xmm3
0x100485979: seta dl
0x10048597c: or dl, bl
0x10048597e: and bl, cl
0x100485980: xor bl, 1
0x100485983: or al, cl
0x100485985: mov ecx, edx
0x100485987: and cl, dil
0x10048598a: jne 0x100485a30
0x100485990: vpermilpd xmm0, xmm2, 1
0x100485996: vxorps xmm3, xmm5, xmm3
0x10048599a: je 0x100485a44
0x1004859a0: vxorpd xmm1, xmm0, xmmword ptr [rip + 0x621f58] ; 0x100aa7900
0x1004859a8: and al, dil
0x1004859ab: je 0x100485a59
0x1004859b1: test al, al
0x1004859b3: jne 0x1004859b9
0x1004859b5: vmovapd xmm1, xmm0
0x1004859b9: vmovshdup xmm2, xmm2
0x1004859bd: vpermilpd xmm0, xmm14, 1
0x1004859c3: and bl, dil
0x1004859c6: je 0x1004859d8
0x1004859c8: vmovaps xmm5, xmmword ptr [rip + 0x621f30] ; 0x100aa7900
0x1004859d0: vxorps xmm6, xmm6, xmm5
0x1004859d4: vxorps xmm14, xmm14, xmm5
0x1004859d8: vaddss xmm3, xmm7, xmm3
0x1004859dc: vaddss xmm3, xmm6, xmm3
0x1004859e0: vmovss xmm5, dword ptr [rip + 0x61f6d8] ; 0x100aa50c0
0x1004859e8: vaddss xmm6, xmm3, xmm5
0x1004859ec: vsqrtss xmm3, xmm6, xmm6
0x1004859f0: vdivss xmm3, xmm5, xmm3
0x1004859f4: vmulss xmm7, xmm3, dword ptr [rip + 0x61ebbc] ; 0x100aa45b8
0x1004859fc: vsubss xmm0, xmm0, xmm4
0x100485a00: vmulss xmm3, xmm7, xmm0
0x100485a04: vsubss xmm0, xmm13, xmm1
0x100485a08: vmulss xmm4, xmm7, xmm0
0x100485a0c: vsubss xmm0, xmm2, xmm14
0x100485a11: vmulss xmm5, xmm7, xmm0
0x100485a15: vmulss xmm0, xmm7, xmm6
0x100485a19: jne 0x100485a70
0x100485a1b: vmovaps xmm1, xmm4
0x100485a1f: vmovaps xmm2, xmm0
0x100485a23: jmp 0x100485a7c ; 0x100485a7c
0x100485a25: nop word ptr cs:[rax + rax]
0x100485a30: vxorps xmm4, xmm4, xmm3
0x100485a34: vpermilpd xmm0, xmm2, 1
0x100485a3a: vxorps xmm3, xmm5, xmm3
0x100485a3e: jne 0x1004859a0
0x100485a44: vmovaps xmm7, xmm2
0x100485a48: vxorpd xmm1, xmm0, xmmword ptr [rip + 0x621eb0] ; 0x100aa7900
0x100485a50: and al, dil
0x100485a53: jne 0x1004859b1
0x100485a59: vmovaps xmm3, xmm5
0x100485a5d: test al, al
0x100485a5f: je 0x1004859b5
0x100485a65: jmp 0x1004859b9 ; 0x1004859b9
0x100485a6a: nop word ptr [rax + rax]
0x100485a70: vmovaps xmm1, xmm5
0x100485a74: vmovaps xmm5, xmm4
0x100485a78: vmovaps xmm2, xmm3
0x100485a7c: vmovaps xmm6, xmmword ptr [rip + 0x621e7c] ; 0x100aa7900
0x100485a84: vmovaps xmm13, xmm6
0x100485a88: mov eax, edx
0x100485a8a: and al, dil
0x100485a8d: jne 0x100485aa0
0x100485a8f: vmovaps xmm4, xmm5
0x100485a93: test bl, bl
0x100485a95: je 0x100485aac
0x100485a97: jmp 0x100485ab0 ; 0x100485ab0
0x100485a99: nop dword ptr [rax]
0x100485aa0: vmovaps xmm4, xmm2
0x100485aa4: vmovaps xmm2, xmm5
0x100485aa8: test bl, bl
0x100485aaa: jne 0x100485ab0
0x100485aac: vmovaps xmm0, xmm3
0x100485ab0: vmovss xmm5, dword ptr [r14 + 0x60]
0x100485ab6: vmovaps xmm3, xmm0
0x100485aba: and dl, dil
0x100485abd: jne 0x100485ac3
0x100485abf: vmovaps xmm3, xmm1
0x100485ac3: test dl, dl
0x100485ac5: jne 0x100485acb
0x100485ac7: vmovaps xmm1, xmm0
0x100485acb: vinsertps xmm0, xmm1, xmm3, 0x10
0x100485ad1: vinsertps xmm0, xmm0, xmm4, 0x20
0x100485ad7: vinsertps xmm3, xmm0, xmm2, 0x30
0x100485add: test sil, sil
0x100485ae0: jne 0x100485ae7
0x100485ae2: vmovaps xmm10, xmm12
0x100485ae7: vinsertps xmm0, xmm10, xmm9, 0x10
0x100485aed: vinsertps xmm0, xmm0, xmm8, 0x20
0x100485af3: vinsertps xmm7, xmm0, xmm11, 0x30
0x100485af9: vmulps xmm0, xmm3, xmm3
0x100485afd: vpermilpd xmm1, xmm0, 1
0x100485b03: vaddps xmm0, xmm0, xmm1
0x100485b07: vmovshdup xmm1, xmm0
0x100485b0b: vaddss xmm0, xmm0, xmm1
0x100485b0f: vsqrtss xmm0, xmm0, xmm0
0x100485b13: vmovss xmm10, dword ptr [rip + 0x621da9] ; 0x100aa78c4
0x100485b1b: vucomiss xmm0, xmm10
0x100485b20: vmovaps xmm4, xmm3
0x100485b24: jbe 0x100485b30
0x100485b26: vpermilps xmm0, xmm0, 0
0x100485b2c: vdivps xmm4, xmm3, xmm0
0x100485b30: vmulps xmm0, xmm7, xmm7
0x100485b34: vpermilpd xmm1, xmm0, 1
0x100485b3a: vaddps xmm0, xmm0, xmm1
0x100485b3e: vmovshdup xmm1, xmm0
0x100485b42: vaddss xmm0, xmm0, xmm1
0x100485b46: vsqrtss xmm0, xmm0, xmm0
0x100485b4a: vucomiss xmm0, xmm10
0x100485b4f: vmovaps xmm6, xmm7
0x100485b53: jbe 0x100485b5f
0x100485b55: vpermilps xmm0, xmm0, 0
0x100485b5b: vdivps xmm6, xmm7, xmm0
0x100485b5f: vmulps xmm0, xmm4, xmm6
0x100485b63: vpermilpd xmm1, xmm0, 1
0x100485b69: vaddps xmm0, xmm0, xmm1
0x100485b6d: vmovshdup xmm1, xmm0
0x100485b71: vaddss xmm0, xmm0, xmm1
0x100485b75: vucomiss xmm15, xmm0
0x100485b79: vxorps xmm1, xmm0, xmm13
0x100485b7e: jbe 0x100485b85
0x100485b80: vxorps xmm4, xmm4, xmm13
0x100485b85: vcmpltss xmm2, xmm0, xmm15
0x100485b8b: vblendvps xmm0, xmm0, xmm1, xmm2
0x100485b91: vmovss xmm1, dword ptr [rip + 0x621d33] ; 0x100aa78cc
0x100485b99: vucomiss xmm1, xmm0
0x100485b9d: jbe 0x100485c60
0x100485ba3: vmovaps xmmword ptr [rbp - 0x70], xmm7
0x100485ba8: vmovss dword ptr [rbp - 0x40], xmm5
0x100485bad: vmovaps xmmword ptr [rbp - 0xa0], xmm3
0x100485bb5: vmovaps xmmword ptr [rbp - 0xf0], xmm4
0x100485bbd: vmovaps xmmword ptr [rbp - 0xe0], xmm6
0x100485bc5: call 0x100aa2576 ; 0x100aa2576 _acosf
0x100485bca: vmovss dword ptr [rbp - 0x80], xmm0
0x100485bcf: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100485bd4: vmovss xmm1, dword ptr [rip + 0x61f4e4] ; 0x100aa50c0
0x100485bdc: vdivss xmm0, xmm1, xmm0
0x100485be0: vmovss dword ptr [rbp - 0xb0], xmm0
0x100485be8: vsubss xmm0, xmm1, dword ptr [rbp - 0x40]
0x100485bed: vmulss xmm0, xmm0, dword ptr [rbp - 0x80]
0x100485bf2: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100485bf7: vmulss xmm0, xmm0, dword ptr [rbp - 0xb0]
0x100485bff: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x100485c07: vmovss xmm0, dword ptr [rbp - 0x80]
0x100485c0c: vmulss xmm0, xmm0, dword ptr [rbp - 0x40]
0x100485c11: call 0x100aa2bca ; 0x100aa2bca _sinf
0x100485c16: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x100485c1e: vmovaps xmm6, xmmword ptr [rbp - 0xe0]
0x100485c26: vmovaps xmm4, xmmword ptr [rbp - 0xf0]
0x100485c2e: vmovaps xmm3, xmmword ptr [rbp - 0xa0]
0x100485c36: vmovss xmm5, dword ptr [rbp - 0x40]
0x100485c3b: vmovaps xmm7, xmmword ptr [rbp - 0x70]
0x100485c40: vmovss xmm10, dword ptr [rip + 0x621c7c] ; 0x100aa78c4
0x100485c48: vxorps xmm15, xmm15, xmm15
0x100485c4d: vmulss xmm0, xmm0, dword ptr [rbp - 0xb0]
0x100485c55: jmp 0x100485c70 ; 0x100485c70
0x100485c57: nop word ptr [rax + rax]
0x100485c60: vmovss xmm0, dword ptr [rip + 0x61f458] ; 0x100aa50c0
0x100485c68: vsubss xmm1, xmm0, xmm5
0x100485c6c: vmovaps xmm0, xmm5
0x100485c70: mov rdi, qword ptr [rbp - 0x60]
0x100485c74: vpermilps xmm1, xmm1, 0
0x100485c7a: vmulps xmm1, xmm4, xmm1
0x100485c7e: vpermilps xmm0, xmm0, 0
0x100485c84: vmulps xmm0, xmm6, xmm0
0x100485c88: vaddps xmm0, xmm0, xmm1
0x100485c8c: vpermilpd xmm1, xmm0, 1
0x100485c92: vucomiss xmm5, xmm15
0x100485c97: ja 0x100485c9d
0x100485c99: vmovaps xmm7, xmm3
0x100485c9d: vmovshdup xmm2, xmm0
0x100485ca1: vucomiss xmm1, xmm1
0x100485ca5: vmovaps xmm1, xmm7
0x100485ca9: jp 0x100485caf
0x100485cab: vmovaps xmm1, xmm0
0x100485caf: vucomiss xmm0, xmm2
0x100485cb3: vpermilps xmm2, xmm0, 0xe7
0x100485cb9: vmovaps xmm0, xmm7
0x100485cbd: jp 0x100485cc3
0x100485cbf: vmovaps xmm0, xmm1
0x100485cc3: vucomiss xmm2, xmm2
0x100485cc7: jp 0x100485ccd
0x100485cc9: vmovaps xmm7, xmm0
0x100485ccd: vmovshdup xmm4, xmm7
0x100485cd1: vpermilpd xmm11, xmm7, 1
0x100485cd7: vpermilps xmm1, xmm7, 0xe7
0x100485cdd: vaddss xmm3, xmm7, xmm7
0x100485ce1: vaddss xmm6, xmm4, xmm4
0x100485ce5: vaddss xmm2, xmm11, xmm11
0x100485cea: vmulss xmm5, xmm7, xmm3
0x100485cee: vmovaps xmm8, xmm7
0x100485cf2: vmulss xmm0, xmm7, xmm2
0x100485cf6: vmulss xmm7, xmm1, xmm3
0x100485cfa: vmulss xmm12, xmm4, xmm6
0x100485cfe: vmulss xmm3, xmm4, xmm2
0x100485d02: vmulss xmm15, xmm1, xmm6
0x100485d06: vmovss xmm4, dword ptr [rip + 0x61f3b2] ; 0x100aa50c0
0x100485d0e: vmovaps xmm9, xmm4
0x100485d12: vsubss xmm13, xmm9, xmm5
0x100485d16: vaddss xmm4, xmm0, xmm15
0x100485d1b: vmovss dword ptr [rbp - 0x80], xmm7
0x100485d20: vsubss xmm5, xmm3, xmm7
0x100485d24: vsubss xmm7, xmm13, xmm12
0x100485d29: vinsertps xmm4, xmm4, xmm5, 0x10
0x100485d2f: vinsertps xmm14, xmm4, xmm7, 0x20
0x100485d35: cmp byte ptr [r14 + 0x88], 0
0x100485d3d: lea rax, [rbp - 0x210]
0x100485d44: mov rdx, rax
0x100485d47: lea rcx, [rbp - 0x280]
0x100485d4e: mov rsi, rcx
0x100485d51: cmove rax, rsi
0x100485d55: cmp byte ptr [r14 + 0x89], 0
0x100485d5d: mov rcx, rdx
0x100485d60: cmove rcx, rsi
0x100485d64: or rcx, 4
0x100485d68: cmp byte ptr [r14 + 0x8a], 0
0x100485d70: cmove rdx, rsi
0x100485d74: or rdx, 8
0x100485d78: vmovss xmm4, dword ptr [rax]
0x100485d7c: vinsertps xmm4, xmm4, dword ptr [rcx], 0x10
0x100485d82: vinsertps xmm4, xmm4, dword ptr [rdx], 0x20
0x100485d88: vmovaps xmmword ptr [rbp - 0x40], xmm4
0x100485d8d: vinsertps xmm5, xmm4, xmm9, 0x30
0x100485d93: vsubps xmm9, xmm5, xmmword ptr [r15 + rdi + 0x10]
0x100485d9a: vmulps xmm4, xmm9, xmm9
0x100485d9f: vmovshdup xmm7, xmm4
0x100485da3: vaddss xmm7, xmm4, xmm7
0x100485da7: vpermilpd xmm4, xmm4, 1
0x100485dad: vaddss xmm4, xmm4, xmm7
0x100485db1: vsqrtss xmm4, xmm4, xmm4
0x100485db5: vucomiss xmm4, xmm10
0x100485dba: vmovss dword ptr [rbp - 0x90], xmm3
0x100485dc2: vmovaps xmm7, xmm0
0x100485dc6: jbe 0x100485dd2
0x100485dc8: vpermilps xmm4, xmm4, 0xc0
0x100485dce: vdivps xmm9, xmm9, xmm4
0x100485dd2: vmulss xmm8, xmm8, xmm6
0x100485dd6: vmulss xmm11, xmm11, xmm2
0x100485dda: vmulss xmm0, xmm1, xmm2
0x100485dde: vmovss xmm1, dword ptr [rip + 0x61f2da] ; 0x100aa50c0
0x100485de6: vsubss xmm4, xmm1, xmm12
0x100485deb: vxorps xmm3, xmm3, xmm3
0x100485def: vblendps xmm12, xmm14, xmm3, 8
0x100485df5: lea rax, [r15 + rdi + 0x10]
0x100485dfa: cmp dword ptr [r14 + 0xd4], 2
0x100485e02: vmovaps xmmword ptr [rbp - 0xd0], xmm14
0x100485e0a: jbe 0x100485fb0
0x100485e10: vmovss dword ptr [rbp - 0x70], xmm4
0x100485e15: vmovss xmm1, dword ptr [rax + 0x24]
0x100485e1a: vmovss dword ptr [rbp - 0xa0], xmm1
0x100485e22: lea rcx, [r15 + rdi + 0x20]
0x100485e27: mov rdx, qword ptr [rbp - 0x48]
0x100485e2b: mov rdx, qword ptr [rdx + 0x160]
0x100485e32: vmovss xmm1, dword ptr [rbp - 0x160]
0x100485e3a: vmulss xmm1, xmm1, dword ptr [rdx + 0x20]
0x100485e3f: vmulss xmm1, xmm1, dword ptr [rdx + 0x14]
0x100485e44: vmovss xmm2, dword ptr [rip + 0x620c50] ; 0x100aa6a9c
0x100485e4c: vmaxss xmm1, xmm2, xmm1
0x100485e50: vmovss xmm2, dword ptr [rip + 0x620c48] ; 0x100aa6aa0
0x100485e58: vminss xmm6, xmm2, xmm1
0x100485e5c: vblendps xmm14, xmm9, xmm3, 2
0x100485e62: vxorps ymm10, ymm10, ymm10
0x100485e67: vblendps xmm1, xmm9, xmm10, 2
0x100485e6d: vmovaps xmm4, xmmword ptr [r15 + rdi + 0x20]
0x100485e74: vxorps xmm2, xmm2, xmm2
0x100485e78: vblendps xmm3, xmm4, xmm2, 2
0x100485e7e: vblendps xmm2, xmm4, xmm10, 2
0x100485e84: vmulps xmm1, xmm1, xmm1
0x100485e88: vmovshdup xmm4, xmm1
0x100485e8c: vaddss xmm4, xmm1, xmm4
0x100485e90: vpermilpd xmm1, xmm1, 1
0x100485e96: vaddss xmm1, xmm1, xmm4
0x100485e9a: vsqrtss xmm4, xmm1, xmm1
0x100485e9e: vmulps xmm1, xmm2, xmm2
0x100485ea2: vmovshdup xmm2, xmm1
0x100485ea6: vaddss xmm2, xmm1, xmm2
0x100485eaa: vpermilpd xmm1, xmm1, 1
0x100485eb0: vaddss xmm1, xmm1, xmm2
0x100485eb4: vsqrtss xmm10, xmm1, xmm1
0x100485eb8: vmulss xmm1, xmm4, xmm10
0x100485ebd: vandps xmm2, xmm1, xmmword ptr [rip + 0x621a4b] ; 0x100aa7910
0x100485ec5: vxorps xmm1, xmm1, xmm1
0x100485ec9: vucomiss xmm2, dword ptr [rip + 0x6237a7] ; 0x100aa9678
0x100485ed1: jbe 0x100485efb
0x100485ed3: vmovss xmm1, dword ptr [rip + 0x622765] ; 0x100aa8640
0x100485edb: vmulss xmm1, xmm1, dword ptr [r14 + 0x5c]
0x100485ee1: vmulss xmm1, xmm6, xmm1
0x100485ee5: vaddss xmm2, xmm4, xmm10
0x100485eea: vmulss xmm1, xmm2, xmm1
0x100485eee: vaddss xmm2, xmm4, xmm4
0x100485ef2: vmulss xmm2, xmm2, xmm10
0x100485ef7: vdivss xmm1, xmm1, xmm2
0x100485efb: vmovaps xmm4, xmm6
0x100485eff: vmovaps xmm6, xmm13
0x100485f03: vpermilps xmm2, xmm14, 0xd2
0x100485f09: vmulps xmm2, xmm2, xmm3
0x100485f0d: vpermilps xmm3, xmm3, 0xd2
0x100485f13: vmulps xmm3, xmm14, xmm3
0x100485f17: vsubps xmm2, xmm2, xmm3
0x100485f1b: vpermilps xmm2, xmm2, 0xd2
0x100485f21: vmulps xmm2, xmm2, xmmword ptr [rip + 0x622177] ; 0x100aa80a0
0x100485f29: vmovshdup xmm3, xmm2
0x100485f2d: vaddss xmm3, xmm2, xmm3
0x100485f31: vpermilpd xmm2, xmm2, 1
0x100485f37: vaddss xmm2, xmm2, xmm3
0x100485f3b: vmulss xmm1, xmm2, xmm1
0x100485f3f: vmulss xmm2, xmm4, dword ptr [rip + 0x63dae1] ; 0x100ac3a28
0x100485f47: vmovss xmm3, dword ptr [rip + 0x61f171] ; 0x100aa50c0
0x100485f4f: vaddss xmm2, xmm2, xmm3
0x100485f53: vmulss xmm2, xmm2, dword ptr [rbp - 0xa0]
0x100485f5b: vaddss xmm1, xmm2, xmm1
0x100485f5f: vmovss xmm2, dword ptr [rip + 0x632521] ; 0x100ab8488
0x100485f67: vmaxss xmm1, xmm2, xmm1
0x100485f6b: vmovss xmm2, dword ptr [rip + 0x625af5] ; 0x100aaba68
0x100485f73: vminss xmm1, xmm2, xmm1
0x100485f77: vaddss xmm2, xmm1, dword ptr [rip + 0x622685] ; 0x100aa8604
0x100485f7f: vmovss xmm3, dword ptr [rip + 0x623655] ; 0x100aa95dc
0x100485f87: vdivss xmm2, xmm2, xmm3
0x100485f8b: vroundss xmm2, xmm2, xmm2, 9
0x100485f91: vmulss xmm2, xmm2, xmm3
0x100485f95: vsubss xmm1, xmm1, xmm2
0x100485f99: vmovss xmm10, dword ptr [rip + 0x621923] ; 0x100aa78c4
0x100485fa1: vmovss xmm2, dword ptr [rbp - 0x80]
0x100485fa6: vmovss xmm4, dword ptr [rbp - 0x70]
0x100485fab: jmp 0x100485fc2 ; 0x100485fc2
0x100485fad: nop dword ptr [rax]
0x100485fb0: vmovaps xmm6, xmm13
0x100485fb4: lea rcx, [r15 + rdi + 0x20]
0x100485fb9: vxorps xmm1, xmm1, xmm1
0x100485fbd: vmovss xmm2, dword ptr [rbp - 0x80]
0x100485fc2: vsubss xmm13, xmm4, xmm11
0x100485fc7: vaddss xmm4, xmm8, xmm0
0x100485fcb: vmovaps xmmword ptr [rbp - 0xa0], xmm4
0x100485fd3: vsubss xmm7, xmm7, xmm15
0x100485fd8: vsubss xmm4, xmm8, xmm0
0x100485fdc: vsubss xmm6, xmm6, xmm11
0x100485fe1: vaddss xmm2, xmm2, dword ptr [rbp - 0x90]
0x100485fe9: vmovss dword ptr [rax + 0x24], xmm1
0x100485fee: vmovaps xmmword ptr [rax], xmm5
0x100485ff2: vmovaps xmmword ptr [rcx], xmm9
0x100485ff6: vxorps xmm3, xmm12, xmmword ptr [rip + 0x621902] ; 0x100aa7900
0x100485ffe: vmulps xmm0, xmm12, xmm12
0x100486003: vmovshdup xmm1, xmm0
0x100486007: vaddss xmm1, xmm0, xmm1
0x10048600b: vpermilpd xmm0, xmm0, 1
0x100486011: vaddss xmm0, xmm0, xmm1
0x100486015: vsqrtss xmm0, xmm0, xmm0
0x100486019: vucomiss xmm0, xmm10
0x10048601e: vmovaps xmmword ptr [rbp - 0xb0], xmm12
0x100486026: vmovaps xmmword ptr [rbp - 0x80], xmm13
0x10048602b: vmovaps xmmword ptr [rbp - 0x70], xmm4
0x100486030: vmovaps xmmword ptr [rbp - 0xf0], xmm7
0x100486038: vmovaps xmmword ptr [rbp - 0xe0], xmm6
0x100486040: vmovaps xmmword ptr [rbp - 0x90], xmm2
0x100486048: jbe 0x100486054
0x10048604a: vpermilps xmm0, xmm0, 0xc0
0x100486050: vdivps xmm3, xmm3, xmm0
0x100486054: vmovaps xmmword ptr [rbp - 0x100], xmm3
0x10048605c: vmovss xmm0, dword ptr [rip + 0x61f05c] ; 0x100aa50c0
0x100486064: vmovaps xmm1, xmm0
0x100486068: vinsertps xmm0, xmm5, xmm1, 0x30
0x10048606e: vmovaps xmmword ptr [rbp - 0x340], xmm1
0x100486076: vmovaps xmm1, xmmword ptr [rip + 0x622022] ; 0x100aa80a0
0x10048607e: vmovaps xmmword ptr [rbp - 0x330], xmm1
0x100486086: vmovaps xmm1, xmmword ptr [rip + 0x6229a2] ; 0x100aa8a30
0x10048608e: vmovaps xmmword ptr [rbp - 0x320], xmm1
0x100486096: vmovaps xmmword ptr [rbp - 0x310], xmm0
0x10048609e: vmovss xmm0, dword ptr [rip + 0x62255a] ; 0x100aa8600
0x1004860a6: vmulss xmm0, xmm0, dword ptr [rax + 0x24]
0x1004860ab: vdivss xmm0, xmm0, dword ptr [rip + 0x622551] ; 0x100aa8604
0x1004860b3: vmovaps xmmword ptr [rbp - 0x160], xmm5
0x1004860bb: vzeroupper 
0x1004860be: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x1004860c3: vmovshdup xmm14, xmm0
0x1004860c7: vmovaps xmm1, xmmword ptr [rbp - 0x100]
0x1004860cf: vmovshdup xmm2, xmm1
0x1004860d3: vpermilpd xmm3, xmm1, 1
0x1004860d9: vmulss xmm4, xmm1, xmm2
0x1004860dd: vmulss xmm8, xmm2, xmm3
0x1004860e1: vmulss xmm9, xmm3, xmm1
0x1004860e5: vmovss xmm5, dword ptr [rip + 0x61efd3] ; 0x100aa50c0
0x1004860ed: vsubss xmm7, xmm5, xmm14
0x1004860f2: vmulss xmm5, xmm1, xmm1
0x1004860f6: vmulss xmm5, xmm5, xmm7
0x1004860fa: vaddss xmm10, xmm14, xmm5
0x1004860fe: vmulss xmm4, xmm4, xmm7
0x100486102: vmulss xmm6, xmm3, xmm0
0x100486106: vaddss xmm11, xmm6, xmm4
0x10048610a: vmulss xmm9, xmm9, xmm7
0x10048610e: vmulss xmm13, xmm2, xmm0
0x100486112: vsubss xmm12, xmm9, xmm13
0x100486117: vinsertps xmm5, xmm10, xmm11, 0x1c
0x10048611d: vinsertps xmm10, xmm5, xmm12, 0x20
0x100486123: vsubss xmm4, xmm4, xmm6
0x100486127: vmulss xmm2, xmm2, xmm2
0x10048612b: vmulss xmm2, xmm2, xmm7
0x10048612f: vaddss xmm2, xmm14, xmm2
0x100486133: vmulss xmm6, xmm8, xmm7
0x100486137: vmulss xmm0, xmm1, xmm0
0x10048613b: vaddss xmm5, xmm0, xmm6
0x10048613f: vinsertps xmm2, xmm4, xmm2, 0x1c
0x100486145: vinsertps xmm2, xmm2, xmm5, 0x20
0x10048614b: vaddss xmm4, xmm13, xmm9
0x100486150: vsubss xmm0, xmm6, xmm0
0x100486154: vmulss xmm3, xmm3, xmm3
0x100486158: vmulss xmm3, xmm3, xmm7
0x10048615c: vaddss xmm1, xmm14, xmm3
0x100486160: vinsertps xmm0, xmm4, xmm0, 0x1c
0x100486166: vinsertps xmm0, xmm0, xmm1, 0x20
0x10048616c: vmovaps xmmword ptr [rbp - 0x150], xmm10
0x100486174: vmovaps xmmword ptr [rbp - 0x140], xmm2
0x10048617c: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x100486184: vmovaps xmm0, xmmword ptr [rip + 0x622874] ; 0x100aa8a00
0x10048618c: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x100486194: lea rbx, [rbp - 0x3c0]
0x10048619b: mov rdi, rbx
0x10048619e: lea rsi, [rbp - 0x340]
0x1004861a5: mov rdx, r12
0x1004861a8: call 0x100076df0 ; 0x100076df0
0x1004861ad: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1004861b2: vinsertps xmm0, xmm0, dword ptr [rbp - 0xa0], 0x1c
0x1004861bc: vinsertps xmm0, xmm0, dword ptr [rbp - 0xf0], 0x20
0x1004861c6: vmovaps xmmword ptr [rbp - 0x200], xmm0
0x1004861ce: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1004861d3: vinsertps xmm0, xmm0, dword ptr [rbp - 0xe0], 0x1c
0x1004861dd: vinsertps xmm0, xmm0, dword ptr [rbp - 0x90], 0x20
0x1004861e7: vmovaps xmmword ptr [rbp - 0x1f0], xmm0
0x1004861ef: vxorps xmm0, xmm0, xmm0
0x1004861f3: vblendps xmm0, xmm0, xmmword ptr [rbp - 0xb0], 7
0x1004861fd: vmovaps xmmword ptr [rbp - 0x1e0], xmm0
0x100486205: vmovss xmm0, dword ptr [rip + 0x61eeb3] ; 0x100aa50c0
0x10048620d: vinsertps xmm0, xmm0, xmm0, 0x37
0x100486213: vmovaps xmmword ptr [rbp - 0x1d0], xmm0
0x10048621b: lea r15, [rbp - 0x380]
0x100486222: mov rdi, r15
0x100486225: mov rsi, rbx
0x100486228: lea rdx, [rbp - 0x200]
0x10048622f: call 0x100076df0 ; 0x100076df0
0x100486234: mov rax, qword ptr [rbp - 0x30]
0x100486238: mov rcx, qword ptr [rbp - 0x60]
0x10048623c: vmovaps xmm0, xmmword ptr [rax + rcx]
0x100486241: vxorps xmm3, xmm3, xmm3
0x100486245: vblendps xmm1, xmm3, xmm0, 1
0x10048624b: vblendps xmm2, xmm3, xmm0, 2
0x100486251: vblendps xmm0, xmm3, xmm0, 4
0x100486257: vmovaps xmmword ptr [rbp - 0x2c0], xmm1
0x10048625f: vmovaps xmmword ptr [rbp - 0x2b0], xmm2
0x100486267: vmovaps xmmword ptr [rbp - 0x2a0], xmm0
0x10048626f: vmovaps xmm0, xmmword ptr [rip + 0x622789] ; 0x100aa8a00
0x100486277: vmovaps xmmword ptr [rbp - 0x290], xmm0
0x10048627f: mov rdi, r13
0x100486282: mov rsi, r15
0x100486285: lea rdx, [rbp - 0x2c0]
0x10048628c: call 0x100076df0 ; 0x100076df0
0x100486291: vxorps xmm1, xmm1, xmm1
0x100486295: cmp byte ptr [r14 + 0x5b], 0
0x10048629a: mov rbx, qword ptr [rbp - 0x170]
0x1004862a1: jne 0x100486477
0x1004862a7: mov rdi, r12
0x1004862aa: mov rsi, rbx
0x1004862ad: call 0x1004d1e40 ; 0x1004d1e40
0x1004862b2: vmovaps xmm0, xmmword ptr [rbp - 0x150]
0x1004862ba: vmovaps xmm1, xmmword ptr [rbp - 0x140]
0x1004862c2: vmovaps xmm2, xmmword ptr [rbp - 0x130]
0x1004862ca: vmovaps xmm3, xmmword ptr [rbp - 0x120]
0x1004862d2: vmovaps xmmword ptr [rbp - 0x1b0], xmm0
0x1004862da: vmovaps xmmword ptr [rbp - 0x1a0], xmm1
0x1004862e2: vmovaps xmmword ptr [rbp - 0x190], xmm2
0x1004862ea: vmovaps xmmword ptr [rbp - 0x180], xmm3
0x1004862f2: vmovss xmm0, dword ptr [rip + 0x62233a] ; 0x100aa8634
0x1004862fa: vmulss xmm0, xmm0, dword ptr [r14 + 0x80]
0x100486303: vmovaps xmm3, xmmword ptr [rbp - 0xd0]
0x10048630b: vmulps xmm1, xmm3, xmm3
0x10048630f: vmovshdup xmm2, xmm1
0x100486313: vaddss xmm2, xmm1, xmm2
0x100486317: vpermilpd xmm1, xmm1, 1
0x10048631d: vaddss xmm1, xmm1, xmm2
0x100486321: vsqrtss xmm1, xmm1, xmm1
0x100486325: vucomiss xmm1, dword ptr [rip + 0x621597] ; 0x100aa78c4
0x10048632d: jbe 0x100486341
0x10048632f: vpermilps xmm1, xmm1, 0xc0
0x100486335: vdivps xmm3, xmm3, xmm1
0x100486339: vmovaps xmmword ptr [rbp - 0xd0], xmm3
0x100486341: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100486346: vmovshdup xmm14, xmm0
0x10048634a: vmovaps xmm1, xmmword ptr [rbp - 0xd0]
0x100486352: vmovshdup xmm2, xmm1
0x100486356: vpermilpd xmm3, xmm1, 1
0x10048635c: vmulss xmm4, xmm1, xmm2
0x100486360: vmulss xmm8, xmm2, xmm3
0x100486364: vmulss xmm9, xmm3, xmm1
0x100486368: vmovss xmm5, dword ptr [rip + 0x61ed50] ; 0x100aa50c0
0x100486370: vsubss xmm7, xmm5, xmm14
0x100486375: vmulss xmm5, xmm1, xmm1
0x100486379: vmulss xmm5, xmm5, xmm7
0x10048637d: vaddss xmm10, xmm14, xmm5
0x100486381: vmulss xmm4, xmm4, xmm7
0x100486385: vmulss xmm6, xmm0, xmm3
0x100486389: vaddss xmm11, xmm6, xmm4
0x10048638d: vmulss xmm9, xmm9, xmm7
0x100486391: vmulss xmm13, xmm0, xmm2
0x100486395: vsubss xmm12, xmm9, xmm13
0x10048639a: vinsertps xmm5, xmm10, xmm11, 0x1c
0x1004863a0: vinsertps xmm10, xmm5, xmm12, 0x20
0x1004863a6: vsubss xmm4, xmm4, xmm6
0x1004863aa: vmulss xmm2, xmm2, xmm2
0x1004863ae: vmulss xmm2, xmm2, xmm7
0x1004863b2: vaddss xmm2, xmm14, xmm2
0x1004863b6: vmulss xmm6, xmm8, xmm7
0x1004863ba: vmulss xmm0, xmm0, xmm1
0x1004863be: vaddss xmm5, xmm0, xmm6
0x1004863c2: vinsertps xmm2, xmm4, xmm2, 0x1c
0x1004863c8: vinsertps xmm2, xmm2, xmm5, 0x20
0x1004863ce: vaddss xmm4, xmm13, xmm9
0x1004863d3: vsubss xmm0, xmm6, xmm0
0x1004863d7: vmulss xmm3, xmm3, xmm3
0x1004863db: vmulss xmm3, xmm3, xmm7
0x1004863df: vaddss xmm1, xmm14, xmm3
0x1004863e3: vinsertps xmm0, xmm4, xmm0, 0x1c
0x1004863e9: vinsertps xmm0, xmm0, xmm1, 0x20
0x1004863ef: vmovaps xmmword ptr [rbp - 0x300], xmm10
0x1004863f7: vmovaps xmmword ptr [rbp - 0x2f0], xmm2
0x1004863ff: vmovaps xmmword ptr [rbp - 0x2e0], xmm0
0x100486407: vmovaps xmm0, xmmword ptr [rip + 0x6225f1] ; 0x100aa8a00
0x10048640f: vmovaps xmmword ptr [rbp - 0x2d0], xmm0
0x100486417: mov rdi, r12
0x10048641a: lea rsi, [rbp - 0x300]
0x100486421: mov rdx, r13
0x100486424: call 0x100076df0 ; 0x100076df0
0x100486429: vmovaps xmm0, xmmword ptr [rbp - 0x150]
0x100486431: vmovaps xmm1, xmmword ptr [rbp - 0x140]
0x100486439: vmovaps xmm2, xmmword ptr [rbp - 0x130]
0x100486441: vmovaps xmmword ptr [rbp - 0x1b0], xmm0
0x100486449: vmovaps xmmword ptr [rbp - 0x1a0], xmm1
0x100486451: vmovaps xmmword ptr [rbp - 0x190], xmm2
0x100486459: vmovaps xmm0, xmmword ptr [rbp - 0x160]
0x100486461: vblendps xmm0, xmm0, xmmword ptr [rbp - 0x120], 8
0x10048646b: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x100486473: vxorps xmm1, xmm1, xmm1
0x100486477: vmovaps xmm0, xmmword ptr [rbp - 0x260]
0x10048647f: vblendps xmm0, xmm0, xmmword ptr [rbp - 0x40], 7
0x100486486: vmovaps xmmword ptr [rbp - 0x260], xmm0
0x10048648e: vmovaps xmm0, xmmword ptr [rbp - 0x270]
0x100486496: vblendps xmm0, xmm1, xmm0, 8
0x10048649c: vmovaps xmmword ptr [rbp - 0x270], xmm0
0x1004864a4: mov rdi, rbx
0x1004864a7: mov rsi, r13
0x1004864aa: call 0x1004d1d50 ; 0x1004d1d50
0x1004864af: mov rbx, qword ptr [rbp - 0x110]
0x1004864b6: inc ebx
0x1004864b8: mov rcx, qword ptr [rbp - 0x168]
0x1004864bf: mov rax, qword ptr [rcx]
0x1004864c2: cmp ebx, dword ptr [rax + 0x10]
0x1004864c5: mov rdx, qword ptr [rbp - 0xb8]
0x1004864cc: jb 0x100485010
0x1004864d2: mov rax, qword ptr [rdx]
0x1004864d5: cmp byte ptr [rax + 0x2c], 0
0x1004864d9: jne 0x100486517
0x1004864db: cmp byte ptr [r14 + 0x59], 0
0x1004864e0: jne 0x100486517
0x1004864e2: cmp byte ptr [r14 + 0xd0], 0
0x1004864ea: jne 0x100486517
0x1004864ec: vmovss xmm0, dword ptr [r14 + 0xc8]
0x1004864f5: vxorps xmm1, xmm1, xmm1
0x1004864f9: cmp byte ptr [r14 + 0x64], 0
0x1004864fe: jne 0x100486509
0x100486500: vmovss xmm1, dword ptr [r14 + 0xb8]
0x100486509: vaddss xmm0, xmm0, xmm1
0x10048650d: vucomiss xmm0, dword ptr [rip + 0x6213b7] ; 0x100aa78cc
0x100486515: ja 0x10048652b
0x100486517: cmp byte ptr [r14 + 0xd8], 0
0x10048651f: je 0x10048654e
0x100486521: cmp dword ptr [r14 + 0xd4], 2
0x100486529: jb 0x10048654e
0x10048652b: mov byte ptr [r14 + 0xd0], 1
0x100486533: mov rdi, qword ptr [r14 + 0x98]
0x10048653a: mov esi, 1
0x10048653f: call 0x1004d1f60 ; 0x1004d1f60
0x100486544: cmp byte ptr [r14 + 0xa0], 0
0x10048654c: je 0x1004865c8
0x10048654e: inc dword ptr [r14 + 0xd4]
0x100486555: cmp byte ptr [r14 + 0xe0], 0
0x10048655d: jne 0x10048656d
0x10048655f: add r14, 0xd4
0x100486566: mov dword ptr [r14], 0
0x10048656d: add rsp, 0x398
0x100486574: pop rbx
0x100486575: pop r12
0x100486577: pop r13
0x100486579: pop r14
0x10048657b: pop r15
0x10048657d: pop rbp
0x10048657e: ret 
0x10048657f: vmovss xmm1, dword ptr [rax + 0x24]
0x100486584: vcvtss2sd xmm1, xmm1, xmm1
0x100486588: vsubsd xmm1, xmm1, qword ptr [r14 + 0xe8]
0x100486591: vcvtsd2ss xmm7, xmm1, xmm1
0x100486595: vmovss xmm1, dword ptr [r14 + 0x50]
0x10048659b: vucomiss xmm1, dword ptr [rip + 0x622011] ; 0x100aa85b4
0x1004865a3: ja 0x100484dcc
0x1004865a9: lea rdi, [rip + 0x7042c7] ; 0x100b8a877 time > 0.001f
0x1004865b0: lea rsi, [rip + 0x7041cf] ; 0x100b8a786 MoveObjectAlongRail.cpp
0x1004865b7: mov edx, 0x161
0x1004865bc: mov ecx, 3
0x1004865c1: call 0x1007e5f70 ; 0x1007e5f70
0x1004865c6: ud2 
0x1004865c8: mov rdi, r14
0x1004865cb: call 0x10032ef60 ; 0x10032ef60
0x1004865d0: inc dword ptr [r14 + 0xd4]
0x1004865d7: cmp byte ptr [r14 + 0xe0], 0
0x1004865df: jne 0x10048656d
0x1004865e1: jmp 0x10048655f ; 0x10048655f
0x1004865e6: cmp byte ptr [r13], 0
0x1004865eb: jne 0x100484b21
0x1004865f1: jmp 0x100484b8d ; 0x100484b8d
0x1004865f6: vmovsd xmm0, qword ptr [rbp - 0x40]
0x1004865fb: vcvtss2sd xmm0, xmm0, xmm0
0x1004865ff: vmovsd xmm1, qword ptr [rbp - 0x70]
0x100486604: vcvtss2sd xmm1, xmm1, xmm1
0x100486608: lea rdi, [rip + 0x704293] ; 0x100b8a8a2 !isNan( brot[ 2 ] )
0x10048660f: lea rsi, [rip + 0x704170] ; 0x100b8a786 MoveObjectAlongRail.cpp
0x100486616: lea r8, [rip + 0x704299] ; 0x100b8a8b6 NaN tangent at railP %f, t %f
0x10048661d: mov edx, 0x1ab
0x100486622: mov ecx, 4
0x100486627: mov al, 2
0x100486629: call 0x1007e6030 ; 0x1007e6030
0x10048662e: ud2 
0x100486630: lea rdi, [rip + 0x6db4c1] ; 0x100b61af8 ret
0x100486637: lea rsi, [rip + 0x6db325] ; 0x100b61963 ./Clump.h
0x10048663e: mov edx, 0x47
0x100486643: mov ecx, 3
0x100486648: call 0x1007e5f70 ; 0x1007e5f70
0x10048664d: ud2 
0x10048664f: lea rdi, [rip + 0x70422f] ; 0x100b8a885 !isnan( state->railOffsetP )
0x100486656: lea rsi, [rip + 0x704129] ; 0x100b8a786 MoveObjectAlongRail.cpp
0x10048665d: mov edx, 0x187
0x100486662: mov ecx, 3
0x100486667: call 0x1007e5f70 ; 0x1007e5f70
0x10048666c: ud2 
0x10048666e: lea rdi, [rip + 0x6db2e3] ; 0x100b61958 idx < size
0x100486675: lea rsi, [rip + 0x6db2e7] ; 0x100b61963 ./Clump.h
0x10048667c: mov edx, 0x36
0x100486681: mov ecx, 3
0x100486686: call 0x1007e5f70 ; 0x1007e5f70
0x10048668b: ud2 
0x10048668d: nop dword ptr [rax]
