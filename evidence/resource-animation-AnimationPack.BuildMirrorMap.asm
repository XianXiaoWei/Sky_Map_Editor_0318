0x1000e6a40: push rbp
0x1000e6a41: mov rbp, rsp
0x1000e6a44: push r15
0x1000e6a46: push r14
0x1000e6a48: push r13
0x1000e6a4a: push r12
0x1000e6a4c: push rbx
0x1000e6a4d: sub rsp, 0x1a8
0x1000e6a54: mov rbx, rdi
0x1000e6a57: movsxd rax, dword ptr [rbx + 0x54]
0x1000e6a5b: shl rax, 4
0x1000e6a5f: lea rax, [rax + rax*8]
0x1000e6a63: mov rdx, qword ptr [rip + 0x1cec0fe] ; 0x101dd2b68
0x1000e6a6a: mov ecx, 0x10
0x1000e6a6f: mov rdi, rsi
0x1000e6a72: mov rsi, rax
0x1000e6a75: call 0x100795530 ; 0x100795530
0x1000e6a7a: mov qword ptr [rbp - 0x48], rax
0x1000e6a7e: mov qword ptr [rbx + 0xe0], rax
0x1000e6a85: movsxd r14, dword ptr [rbx + 0x54]
0x1000e6a89: test r14, r14
0x1000e6a8c: jle 0x1000e73fb
0x1000e6a92: mov qword ptr [rbp - 0x50], rbx
0x1000e6a96: mov rax, qword ptr [rbx + 0x60]
0x1000e6a9a: mov qword ptr [rbp - 0x30], rax
0x1000e6a9e: xor r13d, r13d
0x1000e6aa1: nop word ptr cs:[rax + rax]
0x1000e6ab0: lea r12, [r13 + r13*8]
0x1000e6ab5: shl r12, 4
0x1000e6ab9: mov rax, qword ptr [rbp - 0x48]
0x1000e6abd: mov dword ptr [rax + r12 + 0x80], r13d
0x1000e6ac5: imul rbx, r13, 0x44
0x1000e6ac9: add rbx, qword ptr [rbp - 0x30]
0x1000e6acd: mov esi, 0x5f
0x1000e6ad2: mov rdi, rbx
0x1000e6ad5: call 0x100aa2c9c ; 0x100aa2c9c _strrchr
0x1000e6ada: mov qword ptr [rbp - 0x38], rax
0x1000e6ade: cmp rax, rbx
0x1000e6ae1: jbe 0x1000e6b90
0x1000e6ae7: mov rax, qword ptr [rbp - 0x38]
0x1000e6aeb: mov r15b, byte ptr [rax - 1]
0x1000e6aef: cmp r15b, 0x52
0x1000e6af3: je 0x1000e6aff
0x1000e6af5: cmp r15b, 0x4c
0x1000e6af9: jne 0x1000e6b90
0x1000e6aff: mov rax, qword ptr [rbp - 0x48]
0x1000e6b03: lea rax, [rax + r12 + 0x80]
0x1000e6b0b: mov qword ptr [rbp - 0x40], rax
0x1000e6b0f: mov rbx, qword ptr [rbp - 0x30]
0x1000e6b13: xor r12d, r12d
0x1000e6b16: nop word ptr cs:[rax + rax]
0x1000e6b20: cmp r13, r12
0x1000e6b23: je 0x1000e6b50
0x1000e6b25: mov esi, 0x5f
0x1000e6b2a: mov rdi, rbx
0x1000e6b2d: call 0x100aa2c9c ; 0x100aa2c9c _strrchr
0x1000e6b32: cmp rax, rbx
0x1000e6b35: jbe 0x1000e6b50
0x1000e6b37: cmp r15b, 0x52
0x1000e6b3b: je 0x1000e6b64
0x1000e6b3d: cmp r15b, 0x4c
0x1000e6b41: jne 0x1000e6b50
0x1000e6b43: mov cl, 0x4c
0x1000e6b45: cmp byte ptr [rax - 1], 0x52
0x1000e6b49: je 0x1000e6b6c
0x1000e6b4b: jmp 0x1000e6b53 ; 0x1000e6b53
0x1000e6b4d: nop dword ptr [rax]
0x1000e6b50: mov ecx, r15d
0x1000e6b53: inc r12
0x1000e6b56: add rbx, 0x44
0x1000e6b5a: mov r15d, ecx
0x1000e6b5d: cmp r12, r14
0x1000e6b60: jl 0x1000e6b20
0x1000e6b62: jmp 0x1000e6b90 ; 0x1000e6b90
0x1000e6b64: mov cl, 0x52
0x1000e6b66: cmp byte ptr [rax - 1], 0x4c
0x1000e6b6a: jne 0x1000e6b53
0x1000e6b6c: mov rdi, qword ptr [rbp - 0x38]
0x1000e6b70: mov rsi, rax
0x1000e6b73: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1000e6b78: mov ecx, r15d
0x1000e6b7b: test eax, eax
0x1000e6b7d: jne 0x1000e6b53
0x1000e6b7f: mov rax, qword ptr [rbp - 0x40]
0x1000e6b83: mov dword ptr [rax], r12d
0x1000e6b86: nop word ptr cs:[rax + rax]
0x1000e6b90: inc r13
0x1000e6b93: cmp r13, r14
0x1000e6b96: jl 0x1000e6ab0
0x1000e6b9c: test r14d, r14d
0x1000e6b9f: mov r8, qword ptr [rbp - 0x50]
0x1000e6ba3: jle 0x1000e73fb
0x1000e6ba9: xor r9d, r9d
0x1000e6bac: mov r10d, 0x40
0x1000e6bb2: mov r11d, 0x20
0x1000e6bb8: vmovss xmm9, dword ptr [rip + 0x9be504] ; 0x100aa50c4
0x1000e6bc0: vmovaps xmm10, xmmword ptr [rip + 0x9c14d8] ; 0x100aa80a0
0x1000e6bc8: vmovaps xmm11, xmmword ptr [rip + 0x9c1e60] ; 0x100aa8a30
0x1000e6bd0: vmovaps xmm12, xmmword ptr [rip + 0x9c1e28] ; 0x100aa8a00
0x1000e6bd8: vxorps xmm13, xmm13, xmm13
0x1000e6bdd: vmovaps xmm14, xmmword ptr [rip + 0x9c0d1b] ; 0x100aa7900
0x1000e6be5: vmovss xmm15, dword ptr [rip + 0x9be4d3] ; 0x100aa50c0
0x1000e6bed: mov r13, qword ptr [rbp - 0x48]
0x1000e6bf1: nop word ptr cs:[rax + rax]
0x1000e6c00: mov rax, qword ptr [r8 + 0x60]
0x1000e6c04: movsxd rcx, dword ptr [rax + r10]
0x1000e6c08: test rcx, rcx
0x1000e6c0b: setg dl
0x1000e6c0e: movsxd r15, dword ptr [r13 + 0x80]
0x1000e6c15: imul rsi, r15, 0x44
0x1000e6c19: movsxd rax, dword ptr [rax + rsi + 0x40]
0x1000e6c1e: test rax, rax
0x1000e6c21: setg bl
0x1000e6c24: lea rsi, [r15 + r15*8]
0x1000e6c28: shl rsi, 4
0x1000e6c2c: mov rdi, qword ptr [rbp - 0x48]
0x1000e6c30: mov dword ptr [rdi + rsi + 0x84], r9d
0x1000e6c38: mov r14, qword ptr [r8 + 0x68]
0x1000e6c3c: and bl, dl
0x1000e6c3e: mov byte ptr [r13 + 0x88], bl
0x1000e6c45: je 0x1000e6e10
0x1000e6c4b: mov qword ptr [rbp - 0x40], r11
0x1000e6c4f: mov qword ptr [rbp - 0x30], r10
0x1000e6c53: mov qword ptr [rbp - 0x38], r9
0x1000e6c57: shl rax, 6
0x1000e6c5b: shl rcx, 6
0x1000e6c5f: vmovaps xmm0, xmmword ptr [r14 + rcx - 0x40]
0x1000e6c66: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1000e6c6e: vmovaps xmm0, xmmword ptr [r14 + rcx - 0x30]
0x1000e6c75: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1000e6c7d: vmovaps xmm0, xmmword ptr [r14 + rcx - 0x20]
0x1000e6c84: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1000e6c8c: vmovaps xmm0, xmmword ptr [r14 + rcx - 0x10]
0x1000e6c93: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1000e6c9b: vmovaps xmm0, xmmword ptr [r14 + rax - 0x40]
0x1000e6ca2: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1000e6caa: vmovaps xmm0, xmmword ptr [r14 + rax - 0x30]
0x1000e6cb1: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1000e6cb6: vmovaps xmm0, xmmword ptr [r14 + rax - 0x20]
0x1000e6cbd: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1000e6cc2: vmovaps xmm0, xmmword ptr [r14 + rax - 0x10]
0x1000e6cc9: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1000e6cce: vmovaps xmmword ptr [rbp - 0x110], xmm9
0x1000e6cd6: vmovaps xmmword ptr [rbp - 0x100], xmm10
0x1000e6cde: vmovaps xmmword ptr [rbp - 0xf0], xmm11
0x1000e6ce6: vmovaps xmmword ptr [rbp - 0xe0], xmm12
0x1000e6cee: lea rbx, [rbp - 0x1d0]
0x1000e6cf5: mov rdi, rbx
0x1000e6cf8: lea rsi, [rbp - 0xd0]
0x1000e6cff: lea rdx, [rbp - 0x110]
0x1000e6d06: call 0x100076df0 ; 0x100076df0
0x1000e6d0b: lea r12, [rbp - 0x190]
0x1000e6d12: mov rdi, r12
0x1000e6d15: lea rsi, [rbp - 0x90]
0x1000e6d1c: call 0x100076940 ; 0x100076940
0x1000e6d21: lea rdi, [rbp - 0x150]
0x1000e6d28: mov rsi, rbx
0x1000e6d2b: mov rdx, r12
0x1000e6d2e: call 0x100076df0 ; 0x100076df0
0x1000e6d33: vxorps xmm13, xmm13, xmm13
0x1000e6d38: vmovaps xmm0, xmmword ptr [rbp - 0x150]
0x1000e6d40: vmovaps xmmword ptr [r13], xmm0
0x1000e6d46: vmovaps xmm0, xmmword ptr [rbp - 0x140]
0x1000e6d4e: vmovaps xmmword ptr [r13 + 0x10], xmm0
0x1000e6d54: vmovaps xmm0, xmmword ptr [rbp - 0x130]
0x1000e6d5c: vmovaps xmmword ptr [r13 + 0x20], xmm0
0x1000e6d62: vmovaps xmm0, xmmword ptr [rbp - 0x120]
0x1000e6d6a: vmovaps xmmword ptr [r13 + 0x30], xmm0
0x1000e6d70: vmovapd xmm5, xmmword ptr [rbp - 0x90]
0x1000e6d78: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1000e6d7d: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x1000e6d82: vpermilpd xmm7, xmm5, 1
0x1000e6d88: vmovshdup xmm3, xmm0
0x1000e6d8c: vmovshdup xmm2, xmm1
0x1000e6d90: vpermilpd xmm4, xmm1, 1
0x1000e6d96: vaddss xmm6, xmm5, xmm3
0x1000e6d9a: vaddss xmm6, xmm6, xmm4
0x1000e6d9e: vucomiss xmm13, xmm6
0x1000e6da2: seta sil
0x1000e6da6: vucomiss xmm4, xmm5
0x1000e6daa: seta dl
0x1000e6dad: vucomiss xmm4, xmm3
0x1000e6db1: seta al
0x1000e6db4: vucomiss xmm3, xmm5
0x1000e6db8: setbe bl
0x1000e6dbb: seta dil
0x1000e6dbf: or dil, dl
0x1000e6dc2: or bl, al
0x1000e6dc4: mov ecx, edi
0x1000e6dc6: and cl, sil
0x1000e6dc9: jne 0x1000e6e30
0x1000e6dcb: vmovaps xmm8, xmm5
0x1000e6dcf: mov r8, qword ptr [rbp - 0x50]
0x1000e6dd3: mov r9, qword ptr [rbp - 0x38]
0x1000e6dd7: mov r10, qword ptr [rbp - 0x30]
0x1000e6ddb: vmovss xmm9, dword ptr [rip + 0x9be2e1] ; 0x100aa50c4
0x1000e6de3: vmovaps xmm10, xmmword ptr [rip + 0x9c12b5] ; 0x100aa80a0
0x1000e6deb: vmovaps xmm11, xmmword ptr [rip + 0x9c1c3d] ; 0x100aa8a30
0x1000e6df3: vmovaps xmm12, xmmword ptr [rip + 0x9c1c05] ; 0x100aa8a00
0x1000e6dfb: mov r11, qword ptr [rbp - 0x40]
0x1000e6dff: vmovaps xmm14, xmmword ptr [rip + 0x9c0af9] ; 0x100aa7900
0x1000e6e07: jmp 0x1000e6e72 ; 0x1000e6e72
0x1000e6e09: nop dword ptr [rax]
0x1000e6e10: vmovaps xmmword ptr [r13], xmm9
0x1000e6e16: vmovaps xmmword ptr [r13 + 0x10], xmm10
0x1000e6e1c: vmovaps xmmword ptr [r13 + 0x20], xmm11
0x1000e6e22: vmovaps xmmword ptr [r13 + 0x30], xmm12
0x1000e6e28: jmp 0x1000e70f1 ; 0x1000e70f1
0x1000e6e2d: nop dword ptr [rax]
0x1000e6e30: vmovaps xmm14, xmmword ptr [rip + 0x9c0ac8] ; 0x100aa7900
0x1000e6e38: vxorps xmm8, xmm5, xmm14
0x1000e6e3d: vxorps xmm2, xmm2, xmm14
0x1000e6e42: mov r8, qword ptr [rbp - 0x50]
0x1000e6e46: mov r9, qword ptr [rbp - 0x38]
0x1000e6e4a: mov r10, qword ptr [rbp - 0x30]
0x1000e6e4e: vmovss xmm9, dword ptr [rip + 0x9be26e] ; 0x100aa50c4
0x1000e6e56: vmovaps xmm10, xmmword ptr [rip + 0x9c1242] ; 0x100aa80a0
0x1000e6e5e: vmovaps xmm11, xmmword ptr [rip + 0x9c1bca] ; 0x100aa8a30
0x1000e6e66: vmovaps xmm12, xmmword ptr [rip + 0x9c1b92] ; 0x100aa8a00
0x1000e6e6e: mov r11, qword ptr [rbp - 0x40]
0x1000e6e72: vmovss xmm15, dword ptr [rip + 0x9be246] ; 0x100aa50c0
0x1000e6e7a: and dl, al
0x1000e6e7c: vxorpd xmm6, xmm7, xmm14
0x1000e6e81: and bl, sil
0x1000e6e84: je 0x1000e6e8b
0x1000e6e86: vxorps xmm3, xmm3, xmm14
0x1000e6e8b: xor dl, 1
0x1000e6e8e: test bl, bl
0x1000e6e90: jne 0x1000e6e96
0x1000e6e92: vmovapd xmm6, xmm7
0x1000e6e96: vmovshdup xmm5, xmm5
0x1000e6e9a: vpermilpd xmm7, xmm0, 1
0x1000e6ea0: and dl, sil
0x1000e6ea3: je 0x1000e6eaf
0x1000e6ea5: vxorps xmm4, xmm4, xmm14
0x1000e6eaa: vxorps xmm0, xmm0, xmm14
0x1000e6eaf: vaddss xmm3, xmm8, xmm3
0x1000e6eb3: vaddss xmm3, xmm4, xmm3
0x1000e6eb7: vaddss xmm4, xmm3, xmm15
0x1000e6ebc: vsqrtss xmm3, xmm4, xmm4
0x1000e6ec0: vdivss xmm3, xmm15, xmm3
0x1000e6ec4: vmulss xmm3, xmm3, dword ptr [rip + 0x9bd6ec] ; 0x100aa45b8
0x1000e6ecc: vsubss xmm2, xmm7, xmm2
0x1000e6ed0: vmulss xmm7, xmm3, xmm2
0x1000e6ed4: vsubss xmm1, xmm1, xmm6
0x1000e6ed8: vmulss xmm2, xmm3, xmm1
0x1000e6edc: vsubss xmm0, xmm5, xmm0
0x1000e6ee0: vmulss xmm5, xmm3, xmm0
0x1000e6ee4: vmulss xmm0, xmm3, xmm4
0x1000e6ee8: jne 0x1000e6f10
0x1000e6eea: vmovaps xmm1, xmm2
0x1000e6eee: vmovaps xmm2, xmm0
0x1000e6ef2: mov eax, edi
0x1000e6ef4: and al, sil
0x1000e6ef7: je 0x1000e6f23
0x1000e6ef9: vmovaps xmm4, xmm2
0x1000e6efd: vmovaps xmm2, xmm5
0x1000e6f01: test dl, dl
0x1000e6f03: je 0x1000e6f2b
0x1000e6f05: jmp 0x1000e6f2f ; 0x1000e6f2f
0x1000e6f07: nop word ptr [rax + rax]
0x1000e6f10: vmovaps xmm1, xmm5
0x1000e6f14: vmovaps xmm5, xmm2
0x1000e6f18: vmovaps xmm2, xmm7
0x1000e6f1c: mov eax, edi
0x1000e6f1e: and al, sil
0x1000e6f21: jne 0x1000e6ef9
0x1000e6f23: vmovaps xmm4, xmm5
0x1000e6f27: test dl, dl
0x1000e6f29: jne 0x1000e6f2f
0x1000e6f2b: vmovaps xmm0, xmm7
0x1000e6f2f: vmovaps xmm3, xmm0
0x1000e6f33: and dil, sil
0x1000e6f36: jne 0x1000e6f50
0x1000e6f38: vmovaps xmm3, xmm1
0x1000e6f3c: test dil, dil
0x1000e6f3f: je 0x1000e6f55
0x1000e6f41: jmp 0x1000e6f59 ; 0x1000e6f59
0x1000e6f43: nop word ptr cs:[rax + rax]
0x1000e6f50: test dil, dil
0x1000e6f53: jne 0x1000e6f59
0x1000e6f55: vmovaps xmm1, xmm0
0x1000e6f59: vinsertps xmm0, xmm1, xmm3, 0x10
0x1000e6f5f: vinsertps xmm0, xmm0, xmm4, 0x20
0x1000e6f65: vinsertps xmm0, xmm0, xmm2, 0x30
0x1000e6f6b: vxorps xmm1, xmm0, xmm14
0x1000e6f70: vblendps xmm0, xmm1, xmm0, 8
0x1000e6f76: vmovaps xmmword ptr [r13 + 0x50], xmm0
0x1000e6f7c: vmovapd xmm5, xmmword ptr [rbp - 0xd0]
0x1000e6f84: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x1000e6f8c: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x1000e6f94: vpermilpd xmm7, xmm5, 1
0x1000e6f9a: vmovshdup xmm3, xmm0
0x1000e6f9e: vmovshdup xmm2, xmm1
0x1000e6fa2: vpermilpd xmm4, xmm1, 1
0x1000e6fa8: vaddss xmm6, xmm5, xmm3
0x1000e6fac: vaddss xmm6, xmm6, xmm4
0x1000e6fb0: vucomiss xmm13, xmm6
0x1000e6fb4: seta sil
0x1000e6fb8: vucomiss xmm4, xmm5
0x1000e6fbc: seta dl
0x1000e6fbf: vucomiss xmm4, xmm3
0x1000e6fc3: seta al
0x1000e6fc6: vucomiss xmm3, xmm5
0x1000e6fca: setbe bl
0x1000e6fcd: seta dil
0x1000e6fd1: or dil, dl
0x1000e6fd4: or bl, al
0x1000e6fd6: mov ecx, edi
0x1000e6fd8: and cl, sil
0x1000e6fdb: jne 0x1000e6ff0
0x1000e6fdd: vmovaps xmm8, xmm5
0x1000e6fe1: jmp 0x1000e6ffa ; 0x1000e6ffa
0x1000e6fe3: nop word ptr cs:[rax + rax]
0x1000e6ff0: vxorps xmm8, xmm5, xmm14
0x1000e6ff5: vxorps xmm2, xmm2, xmm14
0x1000e6ffa: and dl, al
0x1000e6ffc: vxorpd xmm6, xmm7, xmm14
0x1000e7001: and bl, sil
0x1000e7004: je 0x1000e700b
0x1000e7006: vxorps xmm3, xmm3, xmm14
0x1000e700b: xor dl, 1
0x1000e700e: test bl, bl
0x1000e7010: jne 0x1000e7016
0x1000e7012: vmovapd xmm6, xmm7
0x1000e7016: vmovshdup xmm5, xmm5
0x1000e701a: vpermilpd xmm7, xmm0, 1
0x1000e7020: and dl, sil
0x1000e7023: je 0x1000e702f
0x1000e7025: vxorps xmm4, xmm4, xmm14
0x1000e702a: vxorps xmm0, xmm0, xmm14
0x1000e702f: vaddss xmm3, xmm8, xmm3
0x1000e7033: vaddss xmm3, xmm4, xmm3
0x1000e7037: vaddss xmm4, xmm3, xmm15
0x1000e703c: vsqrtss xmm3, xmm4, xmm4
0x1000e7040: vdivss xmm3, xmm15, xmm3
0x1000e7044: vmulss xmm3, xmm3, dword ptr [rip + 0x9bd56c] ; 0x100aa45b8
0x1000e704c: vsubss xmm2, xmm7, xmm2
0x1000e7050: vmulss xmm7, xmm3, xmm2
0x1000e7054: vsubss xmm1, xmm1, xmm6
0x1000e7058: vmulss xmm2, xmm3, xmm1
0x1000e705c: vsubss xmm0, xmm5, xmm0
0x1000e7060: vmulss xmm5, xmm3, xmm0
0x1000e7064: vmulss xmm0, xmm3, xmm4
0x1000e7068: jne 0x1000e7090
0x1000e706a: vmovaps xmm1, xmm2
0x1000e706e: vmovaps xmm2, xmm0
0x1000e7072: mov eax, edi
0x1000e7074: and al, sil
0x1000e7077: je 0x1000e70a3
0x1000e7079: vmovaps xmm4, xmm2
0x1000e707d: vmovaps xmm2, xmm5
0x1000e7081: test dl, dl
0x1000e7083: je 0x1000e70ab
0x1000e7085: jmp 0x1000e70af ; 0x1000e70af
0x1000e7087: nop word ptr [rax + rax]
0x1000e7090: vmovaps xmm1, xmm5
0x1000e7094: vmovaps xmm5, xmm2
0x1000e7098: vmovaps xmm2, xmm7
0x1000e709c: mov eax, edi
0x1000e709e: and al, sil
0x1000e70a1: jne 0x1000e7079
0x1000e70a3: vmovaps xmm4, xmm5
0x1000e70a7: test dl, dl
0x1000e70a9: jne 0x1000e70af
0x1000e70ab: vmovaps xmm0, xmm7
0x1000e70af: vmovaps xmm3, xmm0
0x1000e70b3: and dil, sil
0x1000e70b6: jne 0x1000e70d0
0x1000e70b8: vmovaps xmm3, xmm1
0x1000e70bc: test dil, dil
0x1000e70bf: je 0x1000e70d5
0x1000e70c1: jmp 0x1000e70d9 ; 0x1000e70d9
0x1000e70c3: nop word ptr cs:[rax + rax]
0x1000e70d0: test dil, dil
0x1000e70d3: jne 0x1000e70d9
0x1000e70d5: vmovaps xmm1, xmm0
0x1000e70d9: vinsertps xmm0, xmm1, xmm3, 0x10
0x1000e70df: vinsertps xmm0, xmm0, xmm4, 0x20
0x1000e70e5: vinsertps xmm0, xmm0, xmm2, 0x30
0x1000e70eb: vmovaps xmmword ptr [r13 + 0x60], xmm0
0x1000e70f1: shl r15, 6
0x1000e70f5: vmovapd xmm5, xmmword ptr [r14 + r15]
0x1000e70fb: vmovaps xmm0, xmmword ptr [r14 + r15 + 0x10]
0x1000e7102: vmovaps xmm1, xmmword ptr [r14 + r15 + 0x20]
0x1000e7109: vpermilpd xmm7, xmm5, 1
0x1000e710f: vmovshdup xmm3, xmm0
0x1000e7113: vmovshdup xmm2, xmm1
0x1000e7117: vpermilpd xmm4, xmm1, 1
0x1000e711d: vaddss xmm6, xmm5, xmm3
0x1000e7121: vaddss xmm6, xmm6, xmm4
0x1000e7125: vucomiss xmm13, xmm6
0x1000e7129: seta sil
0x1000e712d: vucomiss xmm4, xmm5
0x1000e7131: seta dl
0x1000e7134: vucomiss xmm4, xmm3
0x1000e7138: seta al
0x1000e713b: vucomiss xmm3, xmm5
0x1000e713f: setbe bl
0x1000e7142: seta dil
0x1000e7146: or dil, dl
0x1000e7149: or bl, al
0x1000e714b: mov ecx, edi
0x1000e714d: and cl, sil
0x1000e7150: jne 0x1000e7160
0x1000e7152: vmovaps xmm8, xmm5
0x1000e7156: jmp 0x1000e716a ; 0x1000e716a
0x1000e7158: nop dword ptr [rax + rax]
0x1000e7160: vxorps xmm8, xmm5, xmm14
0x1000e7165: vxorps xmm2, xmm2, xmm14
0x1000e716a: and dl, al
0x1000e716c: vxorpd xmm6, xmm7, xmm14
0x1000e7171: and bl, sil
0x1000e7174: je 0x1000e717b
0x1000e7176: vxorps xmm3, xmm3, xmm14
0x1000e717b: xor dl, 1
0x1000e717e: test bl, bl
0x1000e7180: jne 0x1000e7186
0x1000e7182: vmovapd xmm6, xmm7
0x1000e7186: vmovshdup xmm5, xmm5
0x1000e718a: vpermilpd xmm7, xmm0, 1
0x1000e7190: and dl, sil
0x1000e7193: je 0x1000e719f
0x1000e7195: vxorps xmm4, xmm4, xmm14
0x1000e719a: vxorps xmm0, xmm0, xmm14
0x1000e719f: vaddss xmm3, xmm8, xmm3
0x1000e71a3: vaddss xmm3, xmm4, xmm3
0x1000e71a7: vaddss xmm4, xmm3, xmm15
0x1000e71ac: vsqrtss xmm3, xmm4, xmm4
0x1000e71b0: vdivss xmm3, xmm15, xmm3
0x1000e71b4: vmulss xmm3, xmm3, dword ptr [rip + 0x9bd3fc] ; 0x100aa45b8
0x1000e71bc: vsubss xmm2, xmm7, xmm2
0x1000e71c0: vmulss xmm7, xmm3, xmm2
0x1000e71c4: vsubss xmm1, xmm1, xmm6
0x1000e71c8: vmulss xmm2, xmm3, xmm1
0x1000e71cc: vsubss xmm0, xmm5, xmm0
0x1000e71d0: vmulss xmm5, xmm3, xmm0
0x1000e71d4: vmulss xmm0, xmm3, xmm4
0x1000e71d8: jne 0x1000e7200
0x1000e71da: vmovaps xmm1, xmm2
0x1000e71de: vmovaps xmm2, xmm0
0x1000e71e2: mov eax, edi
0x1000e71e4: and al, sil
0x1000e71e7: je 0x1000e7213
0x1000e71e9: vmovaps xmm4, xmm2
0x1000e71ed: vmovaps xmm2, xmm5
0x1000e71f1: test dl, dl
0x1000e71f3: je 0x1000e721b
0x1000e71f5: jmp 0x1000e721f ; 0x1000e721f
0x1000e71f7: nop word ptr [rax + rax]
0x1000e7200: vmovaps xmm1, xmm5
0x1000e7204: vmovaps xmm5, xmm2
0x1000e7208: vmovaps xmm2, xmm7
0x1000e720c: mov eax, edi
0x1000e720e: and al, sil
0x1000e7211: jne 0x1000e71e9
0x1000e7213: vmovaps xmm4, xmm5
0x1000e7217: test dl, dl
0x1000e7219: jne 0x1000e721f
0x1000e721b: vmovaps xmm0, xmm7
0x1000e721f: vmovaps xmm3, xmm0
0x1000e7223: and dil, sil
0x1000e7226: jne 0x1000e7240
0x1000e7228: vmovaps xmm3, xmm1
0x1000e722c: test dil, dil
0x1000e722f: je 0x1000e7245
0x1000e7231: jmp 0x1000e7249 ; 0x1000e7249
0x1000e7233: nop word ptr cs:[rax + rax]
0x1000e7240: test dil, dil
0x1000e7243: jne 0x1000e7249
0x1000e7245: vmovaps xmm1, xmm0
0x1000e7249: vinsertps xmm0, xmm1, xmm3, 0x10
0x1000e724f: vinsertps xmm0, xmm0, xmm4, 0x20
0x1000e7255: vinsertps xmm0, xmm0, xmm2, 0x30
0x1000e725b: vmovaps xmmword ptr [r13 + 0x40], xmm0
0x1000e7261: vmovapd xmm5, xmmword ptr [r14 + r11 - 0x20]
0x1000e7268: vmovaps xmm0, xmmword ptr [r14 + r11 - 0x10]
0x1000e726f: vmovaps xmm1, xmmword ptr [r14 + r11]
0x1000e7275: vpermilpd xmm7, xmm5, 1
0x1000e727b: vmovshdup xmm3, xmm0
0x1000e727f: vmovshdup xmm2, xmm1
0x1000e7283: vpermilpd xmm4, xmm1, 1
0x1000e7289: vaddss xmm6, xmm5, xmm3
0x1000e728d: vaddss xmm6, xmm6, xmm4
0x1000e7291: vucomiss xmm13, xmm6
0x1000e7295: seta sil
0x1000e7299: vucomiss xmm4, xmm5
0x1000e729d: seta dl
0x1000e72a0: vucomiss xmm4, xmm3
0x1000e72a4: seta al
0x1000e72a7: vucomiss xmm3, xmm5
0x1000e72ab: setbe bl
0x1000e72ae: seta dil
0x1000e72b2: or dil, dl
0x1000e72b5: or bl, al
0x1000e72b7: mov ecx, edi
0x1000e72b9: and cl, sil
0x1000e72bc: jne 0x1000e72d0
0x1000e72be: vmovaps xmm8, xmm5
0x1000e72c2: jmp 0x1000e72da ; 0x1000e72da
0x1000e72c4: nop word ptr cs:[rax + rax]
0x1000e72d0: vxorps xmm8, xmm5, xmm14
0x1000e72d5: vxorps xmm2, xmm2, xmm14
0x1000e72da: and dl, al
0x1000e72dc: vxorpd xmm6, xmm7, xmm14
0x1000e72e1: and bl, sil
0x1000e72e4: je 0x1000e72eb
0x1000e72e6: vxorps xmm3, xmm3, xmm14
0x1000e72eb: xor dl, 1
0x1000e72ee: test bl, bl
0x1000e72f0: jne 0x1000e72f6
0x1000e72f2: vmovapd xmm6, xmm7
0x1000e72f6: vmovshdup xmm5, xmm5
0x1000e72fa: vpermilpd xmm7, xmm0, 1
0x1000e7300: and dl, sil
0x1000e7303: je 0x1000e730f
0x1000e7305: vxorps xmm4, xmm4, xmm14
0x1000e730a: vxorps xmm0, xmm0, xmm14
0x1000e730f: vaddss xmm3, xmm8, xmm3
0x1000e7313: vaddss xmm3, xmm4, xmm3
0x1000e7317: vaddss xmm4, xmm3, xmm15
0x1000e731c: vsqrtss xmm3, xmm4, xmm4
0x1000e7320: vdivss xmm3, xmm15, xmm3
0x1000e7324: vmulss xmm3, xmm3, dword ptr [rip + 0x9bd28c] ; 0x100aa45b8
0x1000e732c: vsubss xmm2, xmm7, xmm2
0x1000e7330: vmulss xmm7, xmm3, xmm2
0x1000e7334: vsubss xmm1, xmm1, xmm6
0x1000e7338: vmulss xmm2, xmm3, xmm1
0x1000e733c: vsubss xmm0, xmm5, xmm0
0x1000e7340: vmulss xmm5, xmm3, xmm0
0x1000e7344: vmulss xmm0, xmm3, xmm4
0x1000e7348: jne 0x1000e7370
0x1000e734a: vmovaps xmm1, xmm2
0x1000e734e: vmovaps xmm2, xmm0
0x1000e7352: mov eax, edi
0x1000e7354: and al, sil
0x1000e7357: je 0x1000e7383
0x1000e7359: vmovaps xmm4, xmm2
0x1000e735d: vmovaps xmm2, xmm5
0x1000e7361: test dl, dl
0x1000e7363: je 0x1000e738b
0x1000e7365: jmp 0x1000e738f ; 0x1000e738f
0x1000e7367: nop word ptr [rax + rax]
0x1000e7370: vmovaps xmm1, xmm5
0x1000e7374: vmovaps xmm5, xmm2
0x1000e7378: vmovaps xmm2, xmm7
0x1000e737c: mov eax, edi
0x1000e737e: and al, sil
0x1000e7381: jne 0x1000e7359
0x1000e7383: vmovaps xmm4, xmm5
0x1000e7387: test dl, dl
0x1000e7389: jne 0x1000e738f
0x1000e738b: vmovaps xmm0, xmm7
0x1000e738f: vmovaps xmm3, xmm0
0x1000e7393: and dil, sil
0x1000e7396: jne 0x1000e73b0
0x1000e7398: vmovaps xmm3, xmm1
0x1000e739c: test dil, dil
0x1000e739f: je 0x1000e73b5
0x1000e73a1: jmp 0x1000e73b9 ; 0x1000e73b9
0x1000e73a3: nop word ptr cs:[rax + rax]
0x1000e73b0: test dil, dil
0x1000e73b3: jne 0x1000e73b9
0x1000e73b5: vmovaps xmm1, xmm0
0x1000e73b9: vinsertps xmm0, xmm1, xmm3, 0x10
0x1000e73bf: vinsertps xmm0, xmm0, xmm4, 0x20
0x1000e73c5: vinsertps xmm0, xmm0, xmm2, 0x30
0x1000e73cb: vxorps xmm1, xmm0, xmm14
0x1000e73d0: vblendps xmm0, xmm1, xmm0, 8
0x1000e73d6: vmovaps xmmword ptr [r13 + 0x70], xmm0
0x1000e73dc: inc r9
0x1000e73df: movsxd rax, dword ptr [r8 + 0x54]
0x1000e73e3: add r13, 0x90
0x1000e73ea: add r10, 0x44
0x1000e73ee: add r11, 0x40
0x1000e73f2: cmp r9, rax
0x1000e73f5: jl 0x1000e6c00
0x1000e73fb: add rsp, 0x1a8
0x1000e7402: pop rbx
0x1000e7403: pop r12
0x1000e7405: pop r13
0x1000e7407: pop r14
0x1000e7409: pop r15
0x1000e740b: pop rbp
0x1000e740c: ret 
0x1000e740d: nop dword ptr [rax]
