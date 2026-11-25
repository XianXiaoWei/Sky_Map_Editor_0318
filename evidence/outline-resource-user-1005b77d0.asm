0x1005b77d0: push rbp
0x1005b77d1: mov rbp, rsp
0x1005b77d4: push r15
0x1005b77d6: push r14
0x1005b77d8: push r13
0x1005b77da: push r12
0x1005b77dc: push rbx
0x1005b77dd: sub rsp, 0x48
0x1005b77e1: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1005b77e6: mov rbx, rdi
0x1005b77e9: mov rdi, rsi
0x1005b77ec: call 0x1000fc260 ; 0x1000fc260
0x1005b77f1: mov r14, rax
0x1005b77f4: mov rax, qword ptr [r14 + 0x18]
0x1005b77f8: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1005b77fd: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1005b7802: lea r15, [rbx + 0x50]
0x1005b7806: lea rdi, [rbp - 0x40]
0x1005b780a: lea rdx, [rbp - 0x70]
0x1005b780e: vmovss xmm0, dword ptr [rip + 0x4ed8aa] ; 0x100aa50c0
0x1005b7816: mov rsi, r15
0x1005b7819: call 0x10062cb10 ; 0x10062cb10
0x1005b781e: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1005b7823: vmovaps xmmword ptr [rbx + 0xb0], xmm0
0x1005b782b: mov rax, qword ptr [rbx + 0x100]
0x1005b7832: test rax, rax
0x1005b7835: je 0x1005b7898
0x1005b7837: mov rdx, qword ptr [rax + 0x168]
0x1005b783e: mov ecx, dword ptr [rax + 0x268]
0x1005b7844: lea rdi, [rbp - 0x40]
0x1005b7848: vmovss xmm1, dword ptr [rip + 0x4eff8c] ; 0x100aa77dc
0x1005b7850: vmovss xmm0, dword ptr [rip + 0x4ed868] ; 0x100aa50c0
0x1005b7858: mov rsi, r15
0x1005b785b: vmovaps xmm2, xmm0
0x1005b785f: vmovaps xmm3, xmm0
0x1005b7863: call 0x10062dfe0 ; 0x10062dfe0
0x1005b7868: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1005b786d: vxorps xmm1, xmm1, xmm1
0x1005b7871: vblendps xmm1, xmm0, xmm1, 2
0x1005b7877: vextractps dword ptr [rbp - 0x38], xmm0, 2
0x1005b787e: vmovlps qword ptr [rbp - 0x40], xmm1
0x1005b7883: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1005b7888: vaddps xmm0, xmm0, xmmword ptr [rbx + 0xb0]
0x1005b7890: vmovaps xmmword ptr [rbx + 0xb0], xmm0
0x1005b7898: vpermilps xmm1, xmmword ptr [rbp - 0x60], 0xc0
0x1005b789f: vmulps xmm0, xmm1, xmm0
0x1005b78a3: vaddps xmm2, xmm0, xmmword ptr [rbx + 0x90]
0x1005b78ab: vmovaps xmmword ptr [rbx + 0x90], xmm2
0x1005b78b3: vmulps xmm0, xmm1, xmm2
0x1005b78b7: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x50]
0x1005b78bc: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x1005b78c1: vmulps xmm1, xmm2, xmm2
0x1005b78c5: vmovshdup xmm3, xmm1
0x1005b78c9: vaddss xmm3, xmm1, xmm3
0x1005b78cd: vpermilpd xmm1, xmm1, 1
0x1005b78d3: vaddss xmm1, xmm1, xmm3
0x1005b78d7: vsqrtss xmm1, xmm1, xmm1
0x1005b78db: vucomiss xmm1, dword ptr [rip + 0x4effe1] ; 0x100aa78c4
0x1005b78e3: jbe 0x1005b78ef
0x1005b78e5: vpermilps xmm1, xmm1, 0xc0
0x1005b78eb: vdivps xmm2, xmm2, xmm1
0x1005b78ef: vxorps xmm1, xmm2, xmmword ptr [rip + 0x4f0009] ; 0x100aa7900
0x1005b78f7: vmulps xmm4, xmm2, xmmword ptr [rip + 0x4f0021] ; 0x100aa7920
0x1005b78ff: vpshufd xmm3, xmm1, 0xd2
0x1005b7904: vmulps xmm2, xmm2, xmmword ptr [rip + 0x4f1934] ; 0x100aa9240
0x1005b790c: vpermilps xmm2, xmm2, 0xd2
0x1005b7912: vsubps xmm4, xmm4, xmm2
0x1005b7916: vpermilps xmm2, xmm4, 0xd2
0x1005b791c: vmulps xmm4, xmm4, xmm4
0x1005b7920: vpermilpd xmm5, xmm4, 1
0x1005b7926: vaddss xmm5, xmm5, xmm4
0x1005b792a: vmovshdup xmm4, xmm4
0x1005b792e: vaddss xmm4, xmm4, xmm5
0x1005b7932: vsqrtss xmm4, xmm4, xmm4
0x1005b7936: vucomiss xmm4, dword ptr [rip + 0x4eff86] ; 0x100aa78c4
0x1005b793e: jbe 0x1005b794a
0x1005b7940: vpermilps xmm4, xmm4, 0xc0
0x1005b7946: vdivps xmm2, xmm2, xmm4
0x1005b794a: vmulps xmm3, xmm3, xmm2
0x1005b794e: vpermilps xmm4, xmm2, 0xd2
0x1005b7954: vmulps xmm4, xmm4, xmm1
0x1005b7958: vsubps xmm4, xmm3, xmm4
0x1005b795c: vpermilps xmm3, xmm4, 0xd2
0x1005b7962: vmulps xmm4, xmm4, xmm4
0x1005b7966: vpermilpd xmm5, xmm4, 1
0x1005b796c: vaddss xmm5, xmm5, xmm4
0x1005b7970: vmovshdup xmm4, xmm4
0x1005b7974: vaddss xmm4, xmm4, xmm5
0x1005b7978: vsqrtss xmm4, xmm4, xmm4
0x1005b797c: vucomiss xmm4, dword ptr [rip + 0x4eff40] ; 0x100aa78c4
0x1005b7984: jbe 0x1005b7990
0x1005b7986: vpermilps xmm4, xmm4, 0xc0
0x1005b798c: vdivps xmm3, xmm3, xmm4
0x1005b7990: vmovaps xmmword ptr [rbx + 0x60], xmm2
0x1005b7995: vmovaps xmmword ptr [rbx + 0x70], xmm3
0x1005b799a: vmovaps xmmword ptr [rbx + 0x80], xmm1
0x1005b79a2: mov rax, qword ptr [rbx + 0xd0]
0x1005b79a9: vmovaps xmmword ptr [rax], xmm0
0x1005b79ad: vmovaps xmm0, xmmword ptr [rip + 0x51682b] ; 0x100ace1e0
0x1005b79b5: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1005b79ba: lea rdi, [rbp - 0x40]
0x1005b79be: lea rsi, [rbp - 0x50]
0x1005b79c2: vmovss xmm0, dword ptr [rip + 0x4f0bee] ; 0x100aa85b8
0x1005b79ca: call 0x10077d310 ; 0x10077d310
0x1005b79cf: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1005b79d4: mov rax, qword ptr [rbx + 0xd0]
0x1005b79db: vmovaps xmmword ptr [rax + 0x40], xmm0
0x1005b79e0: mov rax, qword ptr [rbx + 0xd0]
0x1005b79e7: vmovaps xmm0, xmmword ptr [rip + 0x4f1901] ; 0x100aa92f0
0x1005b79ef: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1005b79f4: vmovaps xmm0, xmmword ptr [rip + 0x5167f4] ; 0x100ace1f0
0x1005b79fc: vmulps xmm1, xmm0, xmmword ptr [rbx + 0x80]
0x1005b7a04: mov rax, qword ptr [rbx + 0xd0]
0x1005b7a0b: mov rcx, qword ptr [rbx + 0xd8]
0x1005b7a12: vaddps xmm2, xmm1, xmmword ptr [rax]
0x1005b7a16: vmovaps xmmword ptr [rcx], xmm2
0x1005b7a1a: mov rax, qword ptr [rbx + 0xd0]
0x1005b7a21: mov rcx, qword ptr [rbx + 0xe0]
0x1005b7a28: vmovaps xmm2, xmmword ptr [rax]
0x1005b7a2c: vsubps xmm1, xmm2, xmm1
0x1005b7a30: vmovaps xmmword ptr [rcx], xmm1
0x1005b7a34: vmulps xmm0, xmm0, xmmword ptr [rbx + 0x60]
0x1005b7a39: mov rax, qword ptr [rbx + 0xd0]
0x1005b7a40: mov rcx, qword ptr [rbx + 0xe8]
0x1005b7a47: vaddps xmm1, xmm0, xmmword ptr [rax]
0x1005b7a4b: vmovaps xmmword ptr [rcx], xmm1
0x1005b7a4f: mov rax, qword ptr [rbx + 0xd0]
0x1005b7a56: mov rcx, qword ptr [rbx + 0xf0]
0x1005b7a5d: vmovaps xmm1, xmmword ptr [rax]
0x1005b7a61: vsubps xmm0, xmm1, xmm0
0x1005b7a65: vmovaps xmmword ptr [rcx], xmm0
0x1005b7a69: mov rax, qword ptr [rbx + 0xd8]
0x1005b7a70: vmovaps xmm0, xmmword ptr [rip + 0x516788] ; 0x100ace200
0x1005b7a78: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1005b7a7d: vmovaps xmm0, xmmword ptr [rip + 0x51675b] ; 0x100ace1e0
0x1005b7a85: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1005b7a8a: lea r12, [rbp - 0x40]
0x1005b7a8e: lea r13, [rbp - 0x50]
0x1005b7a92: mov rdi, r12
0x1005b7a95: mov rsi, r13
0x1005b7a98: vmovss xmm0, dword ptr [rip + 0x4f0b18] ; 0x100aa85b8
0x1005b7aa0: call 0x10077d310 ; 0x10077d310
0x1005b7aa5: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1005b7aaa: mov rax, qword ptr [rbx + 0xd8]
0x1005b7ab1: vmovaps xmmword ptr [rax + 0x40], xmm0
0x1005b7ab6: mov rax, qword ptr [rbx + 0xe0]
0x1005b7abd: vmovaps xmm0, xmmword ptr [rip + 0x51673b] ; 0x100ace200
0x1005b7ac5: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1005b7aca: vmovaps xmm0, xmmword ptr [rip + 0x51670e] ; 0x100ace1e0
0x1005b7ad2: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1005b7ad7: mov rdi, r12
0x1005b7ada: mov rsi, r13
0x1005b7add: vmovss xmm0, dword ptr [rip + 0x4f0ad3] ; 0x100aa85b8
0x1005b7ae5: call 0x10077d310 ; 0x10077d310
0x1005b7aea: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1005b7aef: mov rax, qword ptr [rbx + 0xe0]
0x1005b7af6: vmovaps xmmword ptr [rax + 0x40], xmm0
0x1005b7afb: mov rax, qword ptr [rbx + 0xe8]
0x1005b7b02: vmovaps xmm0, xmmword ptr [rip + 0x5166f6] ; 0x100ace200
0x1005b7b0a: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1005b7b0f: vmovaps xmm0, xmmword ptr [rip + 0x5166c9] ; 0x100ace1e0
0x1005b7b17: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1005b7b1c: mov rdi, r12
0x1005b7b1f: mov rsi, r13
0x1005b7b22: vmovss xmm0, dword ptr [rip + 0x4f0a8e] ; 0x100aa85b8
0x1005b7b2a: call 0x10077d310 ; 0x10077d310
0x1005b7b2f: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1005b7b34: mov rax, qword ptr [rbx + 0xe8]
0x1005b7b3b: vmovaps xmmword ptr [rax + 0x40], xmm0
0x1005b7b40: mov rax, qword ptr [rbx + 0xf0]
0x1005b7b47: vmovaps xmm0, xmmword ptr [rip + 0x5166b1] ; 0x100ace200
0x1005b7b4f: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1005b7b54: vmovaps xmm0, xmmword ptr [rip + 0x516684] ; 0x100ace1e0
0x1005b7b5c: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1005b7b61: mov rdi, r12
0x1005b7b64: mov rsi, r13
0x1005b7b67: vmovss xmm0, dword ptr [rip + 0x4f0a49] ; 0x100aa85b8
0x1005b7b6f: call 0x10077d310 ; 0x10077d310
0x1005b7b74: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1005b7b79: mov rax, qword ptr [rbx + 0xf0]
0x1005b7b80: vmovaps xmmword ptr [rax + 0x40], xmm0
0x1005b7b85: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x1005b7b8a: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x70]
0x1005b7b8f: vmulps xmm0, xmm0, xmm0
0x1005b7b93: vmovshdup xmm1, xmm0
0x1005b7b97: vaddss xmm1, xmm0, xmm1
0x1005b7b9b: vpermilpd xmm0, xmm0, 1
0x1005b7ba1: vaddss xmm0, xmm0, xmm1
0x1005b7ba5: vmovss xmm1, dword ptr [rip + 0x4eeeff] ; 0x100aa6aac
0x1005b7bad: vucomiss xmm1, xmm0
0x1005b7bb1: jbe 0x1005b7d72
0x1005b7bb7: mov rax, qword ptr [r14 + 0x30]
0x1005b7bbb: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1005b7bc0: vmulss xmm0, xmm0, dword ptr [rip + 0x4f3654] ; 0x100aab21c
0x1005b7bc8: vaddss xmm0, xmm0, dword ptr [rax + 0xc]
0x1005b7bcd: vmovss dword ptr [rax + 0xc], xmm0
0x1005b7bd2: mov rax, qword ptr [r14 + 0x20]
0x1005b7bd6: mov rsi, qword ptr [rax + 0x368]
0x1005b7bdd: lea rdi, [rbp - 0x40]
0x1005b7be1: call 0x1007f26b0 ; 0x1007f26b0
0x1005b7be6: vmovaps xmm0, xmmword ptr [r15]
0x1005b7beb: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x1005b7bf0: vsubps xmm1, xmm2, xmm0
0x1005b7bf4: vmulps xmm3, xmm1, xmm1
0x1005b7bf8: vmovshdup xmm4, xmm3
0x1005b7bfc: vaddss xmm4, xmm3, xmm4
0x1005b7c00: vpermilpd xmm3, xmm3, 1
0x1005b7c06: vaddss xmm3, xmm3, xmm4
0x1005b7c0a: vsqrtss xmm3, xmm3, xmm3
0x1005b7c0e: vucomiss xmm3, dword ptr [rip + 0x4efcae] ; 0x100aa78c4
0x1005b7c16: jbe 0x1005b7c22
0x1005b7c18: vpermilps xmm3, xmm3, 0xc0
0x1005b7c1e: vdivps xmm1, xmm1, xmm3
0x1005b7c22: vmovss xmm5, dword ptr [rip + 0x4ed496] ; 0x100aa50c0
0x1005b7c2a: mov rax, qword ptr [rbx + 0xf8]
0x1005b7c31: vmulps xmm3, xmm1, xmmword ptr [rip + 0x4efa37] ; 0x100aa7670
0x1005b7c39: vaddps xmm2, xmm2, xmm3
0x1005b7c3d: vmovaps xmmword ptr [rax + 0x20], xmm2
0x1005b7c42: mov rax, qword ptr [rbx + 0xf8]
0x1005b7c49: mov byte ptr [rax + 0x188], 1
0x1005b7c50: mov byte ptr [rax + 0xae], 1
0x1005b7c57: vmovaps xmmword ptr [rax + 0x160], xmm0
0x1005b7c5f: mov rax, qword ptr [rbx + 0xf8]
0x1005b7c66: vxorps xmm0, xmm1, xmmword ptr [rip + 0x4efc92] ; 0x100aa7900
0x1005b7c6e: vmulps xmm1, xmm1, xmm1
0x1005b7c72: vmovshdup xmm2, xmm1
0x1005b7c76: vaddss xmm2, xmm1, xmm2
0x1005b7c7a: vpermilpd xmm1, xmm1, 1
0x1005b7c80: vaddss xmm1, xmm1, xmm2
0x1005b7c84: vsqrtss xmm1, xmm1, xmm1
0x1005b7c88: vucomiss xmm1, dword ptr [rip + 0x4efc34] ; 0x100aa78c4
0x1005b7c90: jbe 0x1005b7c9c
0x1005b7c92: vpermilps xmm1, xmm1, 0xc0
0x1005b7c98: vdivps xmm0, xmm0, xmm1
0x1005b7c9c: vxorps xmm1, xmm0, xmmword ptr [rip + 0x4efc5c] ; 0x100aa7900
0x1005b7ca4: vmulps xmm2, xmm0, xmm0
0x1005b7ca8: vmovshdup xmm3, xmm2
0x1005b7cac: vaddss xmm3, xmm2, xmm3
0x1005b7cb0: vpermilpd xmm2, xmm2, 1
0x1005b7cb6: vaddss xmm2, xmm2, xmm3
0x1005b7cba: vsqrtss xmm2, xmm2, xmm2
0x1005b7cbe: vucomiss xmm2, dword ptr [rip + 0x4efbfe] ; 0x100aa78c4
0x1005b7cc6: jbe 0x1005b7cd2
0x1005b7cc8: vpermilps xmm2, xmm2, 0xc0
0x1005b7cce: vdivps xmm1, xmm1, xmm2
0x1005b7cd2: vmulps xmm1, xmm1, xmmword ptr [rip + 0x4f39b6] ; 0x100aab690
0x1005b7cda: vmovshdup xmm2, xmm1
0x1005b7cde: vaddss xmm2, xmm1, xmm2
0x1005b7ce2: vpermilpd xmm1, xmm1, 1
0x1005b7ce8: vaddss xmm1, xmm1, xmm2
0x1005b7cec: vaddss xmm1, xmm1, dword ptr [rip + 0x4ed3d0] ; 0x100aa50c4
0x1005b7cf4: vandps xmm1, xmm1, xmmword ptr [rip + 0x4efc14] ; 0x100aa7910
0x1005b7cfc: vmovss xmm2, dword ptr [rip + 0x4efbc0] ; 0x100aa78c4
0x1005b7d04: vucomiss xmm2, xmm1
0x1005b7d08: jae 0x1005b7d88
0x1005b7d0a: vmovaps xmm1, xmmword ptr [rip + 0x4f397e] ; 0x100aab690
0x1005b7d12: vmulps xmm2, xmm0, xmm1
0x1005b7d16: vmovshdup xmm3, xmm2
0x1005b7d1a: vaddss xmm3, xmm2, xmm3
0x1005b7d1e: vpermilpd xmm2, xmm2, 1
0x1005b7d24: vaddss xmm2, xmm2, xmm3
0x1005b7d28: vaddss xmm2, xmm2, xmm5
0x1005b7d2c: vaddss xmm2, xmm2, xmm2
0x1005b7d30: vsqrtss xmm2, xmm2, xmm2
0x1005b7d34: vdivss xmm3, xmm5, xmm2
0x1005b7d38: vmovss xmm4, dword ptr [rip + 0x4ed384] ; 0x100aa50c4
0x1005b7d40: vmulps xmm4, xmm0, xmm4
0x1005b7d44: vpermilps xmm0, xmm0, 0xd2
0x1005b7d4a: vmulps xmm0, xmm0, xmm1
0x1005b7d4e: vsubps xmm0, xmm4, xmm0
0x1005b7d52: vpermilps xmm0, xmm0, 0xd2
0x1005b7d58: vpermilps xmm1, xmm3, 0xc0
0x1005b7d5e: vmulps xmm0, xmm0, xmm1
0x1005b7d62: vmulss xmm1, xmm2, dword ptr [rip + 0x4ec84e] ; 0x100aa45b8
0x1005b7d6a: vinsertps xmm0, xmm0, xmm1, 0x30
0x1005b7d70: jmp 0x1005b7d90 ; 0x1005b7d90
0x1005b7d72: mov rax, qword ptr [rbx + 0xf8]
0x1005b7d79: mov dword ptr [rax + 0x80], 0
0x1005b7d83: jmp 0x1005b7e36 ; 0x1005b7e36
0x1005b7d88: vmovaps xmm0, xmmword ptr [rip + 0x4f3910] ; 0x100aab6a0
0x1005b7d90: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1005b7d95: vpermilps xmm1, xmm0, 0xe7
0x1005b7d9b: vucomiss xmm1, xmm1
0x1005b7d9f: jp 0x1005b7e45
0x1005b7da5: vmovshdup xmm1, xmm0
0x1005b7da9: vucomiss xmm0, xmm1
0x1005b7dad: jp 0x1005b7e45
0x1005b7db3: vpermilpd xmm0, xmm0, 1
0x1005b7db9: vucomiss xmm0, xmm0
0x1005b7dbd: jp 0x1005b7e45
0x1005b7dc3: mov rax, qword ptr [rbx + 0xf8]
0x1005b7dca: movabs rcx, 0x3f8000003f800000
0x1005b7dd4: mov qword ptr [rax + 0x80], rcx
0x1005b7ddb: vmovaps xmm0, xmmword ptr [rip + 0x4f0c1d] ; 0x100aa8a00
0x1005b7de3: vmovaps xmmword ptr [rax + 0x120], xmm0
0x1005b7deb: vmovaps xmmword ptr [rax + 0x110], xmm0
0x1005b7df3: mov rax, qword ptr [rbx + 0xf8]
0x1005b7dfa: mov rcx, qword ptr [r14 + 0x30]
0x1005b7dfe: vmovss xmm1, dword ptr [rcx + 0x28]
0x1005b7e03: vxorps xmm0, xmm0, xmm0
0x1005b7e07: vucomiss xmm1, xmm0
0x1005b7e0b: jbe 0x1005b7e22
0x1005b7e0d: vmovss xmm0, dword ptr [rcx + 8]
0x1005b7e12: vdivss xmm0, xmm0, xmm1
0x1005b7e16: vxorps xmm1, xmm1, xmm1
0x1005b7e1a: vmaxss xmm0, xmm1, xmm0
0x1005b7e1e: vminss xmm0, xmm5, xmm0
0x1005b7e22: vsubss xmm0, xmm5, xmm0
0x1005b7e26: vaddss xmm0, xmm0, xmm0
0x1005b7e2a: vaddss xmm0, xmm0, xmm5
0x1005b7e2e: vmovss dword ptr [rax + 0x8c], xmm0
0x1005b7e36: add rsp, 0x48
0x1005b7e3a: pop rbx
0x1005b7e3b: pop r12
0x1005b7e3d: pop r13
0x1005b7e3f: pop r14
0x1005b7e41: pop r15
0x1005b7e43: pop rbp
0x1005b7e44: ret 
0x1005b7e45: lea rdi, [rip + 0x5bc62a] ; 0x100b74476 !isNan( quat )
0x1005b7e4c: lea rsi, [rip + 0x5bc632] ; 0x100b74485 ./Emitter.h
0x1005b7e53: mov edx, 0x26
0x1005b7e58: mov ecx, 3
0x1005b7e5d: call 0x1007e5f70 ; 0x1007e5f70
0x1005b7e62: ud2 
0x1005b7e64: nop word ptr cs:[rax + rax]
