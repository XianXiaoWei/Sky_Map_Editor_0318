0x100560b40: push rbp
0x100560b41: mov rbp, rsp
0x100560b44: push r15
0x100560b46: push r14
0x100560b48: push r13
0x100560b4a: push r12
0x100560b4c: push rbx
0x100560b4d: sub rsp, 0x188
0x100560b54: mov rbx, rsi
0x100560b57: mov r14, rdi
0x100560b5a: vmovaps xmm2, xmmword ptr [rbx + 0x60]
0x100560b5f: vmulps xmm3, xmm2, xmm2
0x100560b63: vmovshdup xmm1, xmm3
0x100560b67: vaddss xmm1, xmm3, xmm1
0x100560b6b: vpermilpd xmm3, xmm3, 1
0x100560b71: vaddss xmm1, xmm3, xmm1
0x100560b75: vsqrtss xmm1, xmm1, xmm1
0x100560b79: vucomiss xmm1, dword ptr [rip + 0x546d43] ; 0x100aa78c4
0x100560b81: jbe 0x100560b8d
0x100560b83: vpermilps xmm1, xmm1, 0xc0
0x100560b89: vdivps xmm2, xmm2, xmm1
0x100560b8d: mov r13, qword ptr [rbx + 0x90]
0x100560b94: mov r15d, dword ptr [rbx + 0x28]
0x100560b98: mov r12b, byte ptr [rbx + 0x2c]
0x100560b9c: test r12b, r12b
0x100560b9f: vmovaps xmmword ptr [rbp - 0xa0], xmm2
0x100560ba7: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x100560bac: je 0x100560c0c
0x100560bae: vmovss xmm1, dword ptr [rip + 0x54450a] ; 0x100aa50c0
0x100560bb6: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100560bbb: vaddss xmm1, xmm0, dword ptr [rip + 0x5444fd] ; 0x100aa50c0
0x100560bc3: vxorps xmm2, xmm2, xmm2
0x100560bc7: vcmpltss xmm2, xmm0, xmm2
0x100560bcc: vblendvps xmm3, xmm0, xmm1, xmm2
0x100560bd2: mov eax, r15d
0x100560bd5: vcvtsi2ss xmm1, xmm4, rax
0x100560bda: vmulss xmm2, xmm3, xmm1
0x100560bde: vcvttss2si rcx, xmm2
0x100560be3: lea edx, [r15 - 1]
0x100560be7: lea eax, [rcx + 1]
0x100560bea: xor r8d, r8d
0x100560bed: cmp edx, ecx
0x100560bef: cmove eax, r8d
0x100560bf3: test ecx, ecx
0x100560bf5: mov edx, ecx
0x100560bf7: cmove edx, r15d
0x100560bfb: dec edx
0x100560bfd: lea edi, [r15 - 2]
0x100560c01: lea esi, [rax + 1]
0x100560c04: cmp edi, ecx
0x100560c06: cmove esi, r8d
0x100560c0a: jmp 0x100560c52 ; 0x100560c52
0x100560c0c: vxorps xmm1, xmm1, xmm1
0x100560c10: vmaxss xmm2, xmm1, xmm0
0x100560c14: vmovss xmm1, dword ptr [rip + 0x5444a4] ; 0x100aa50c0
0x100560c1c: vminss xmm3, xmm1, xmm2
0x100560c20: lea esi, [r15 - 1]
0x100560c24: vcvtsi2ss xmm1, xmm4, rsi
0x100560c29: vmulss xmm2, xmm3, xmm1
0x100560c2d: vcvttss2si rax, xmm2
0x100560c32: lea ecx, [r15 - 2]
0x100560c36: cmp esi, eax
0x100560c38: cmovne ecx, eax
0x100560c3b: lea eax, [rcx + 1]
0x100560c3e: lea edx, [rcx - 1]
0x100560c41: test ecx, ecx
0x100560c43: cmove edx, ecx
0x100560c46: xor edi, edi
0x100560c48: cmp eax, esi
0x100560c4a: setne dil
0x100560c4e: lea esi, [rcx + rdi + 1]
0x100560c52: vmulss xmm0, xmm3, xmm1
0x100560c56: mov ecx, ecx
0x100560c58: vcvtsi2ss xmm1, xmm4, rcx
0x100560c5d: vsubss xmm0, xmm0, xmm1
0x100560c61: mov edx, edx
0x100560c63: shl rdx, 4
0x100560c67: vmovaps xmm1, xmmword ptr [r13 + rdx]
0x100560c6e: shl rcx, 4
0x100560c72: vmovaps xmm7, xmmword ptr [r13 + rcx]
0x100560c79: mov eax, eax
0x100560c7b: shl rax, 4
0x100560c7f: vmovaps xmm2, xmmword ptr [r13 + rax]
0x100560c86: mov eax, esi
0x100560c88: shl rax, 4
0x100560c8c: vmovaps xmm3, xmmword ptr [r13 + rax]
0x100560c93: vsubps xmm4, xmm2, xmm1
0x100560c97: vaddps xmm5, xmm1, xmm1
0x100560c9b: vmulps xmm6, xmm7, xmmword ptr [rip + 0x546add] ; 0x100aa7780
0x100560ca3: vsubps xmm5, xmm5, xmm6
0x100560ca7: vmulps xmm6, xmm2, xmmword ptr [rip + 0x5472a1] ; 0x100aa7f50
0x100560caf: vaddps xmm5, xmm5, xmm6
0x100560cb3: vsubps xmm5, xmm5, xmm3
0x100560cb7: vmovaps xmm8, xmmword ptr [rip + 0x5473c1] ; 0x100aa8080
0x100560cbf: vmovaps xmmword ptr [rbp - 0x60], xmm7
0x100560cc4: vmulps xmm6, xmm7, xmm8
0x100560cc9: vsubps xmm1, xmm6, xmm1
0x100560ccd: vmulps xmm2, xmm2, xmm8
0x100560cd2: vsubps xmm1, xmm1, xmm2
0x100560cd6: vaddps xmm1, xmm3, xmm1
0x100560cda: vpermilps xmm2, xmm0, 0xc0
0x100560ce0: vmulps xmm0, xmm2, xmm1
0x100560ce4: vaddps xmm0, xmm5, xmm0
0x100560ce8: vmovaps xmmword ptr [rbp - 0x80], xmm2
0x100560ced: vmulps xmm0, xmm2, xmm0
0x100560cf1: vaddps xmm0, xmm4, xmm0
0x100560cf5: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100560cfa: mov rdi, qword ptr [rbx + 0xa0]
0x100560d01: movzx edx, r12b
0x100560d05: mov esi, r15d
0x100560d08: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100560d0d: call 0x1005609d0 ; 0x1005609d0
0x100560d12: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100560d17: mov rdi, qword ptr [rbx + 0xa8]
0x100560d1e: mov esi, dword ptr [rbx + 0x28]
0x100560d21: movzx edx, byte ptr [rbx + 0x2c]
0x100560d25: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100560d2a: call 0x1005609d0 ; 0x1005609d0
0x100560d2f: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x100560d37: mov rdi, qword ptr [rbx + 0xb0]
0x100560d3e: mov esi, dword ptr [rbx + 0x28]
0x100560d41: movzx edx, byte ptr [rbx + 0x2c]
0x100560d45: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100560d4a: call 0x1005609d0 ; 0x1005609d0
0x100560d4f: vmovaps xmm8, xmm0
0x100560d53: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100560d58: vandps xmm2, xmm0, xmmword ptr [rip + 0x546bb0] ; 0x100aa7910
0x100560d60: vxorps xmm1, xmm1, xmm1
0x100560d64: vmaxss xmm1, xmm2, xmm1
0x100560d68: vmulss xmm1, xmm1, dword ptr [rip + 0x546b54] ; 0x100aa78c4
0x100560d70: vucomiss xmm1, xmm2
0x100560d74: jae 0x100560e2c
0x100560d7a: vaddss xmm1, xmm0, dword ptr [rip + 0x544342] ; 0x100aa50c4
0x100560d82: vandps xmm1, xmm1, xmmword ptr [rip + 0x546b86] ; 0x100aa7910
0x100560d8a: vmaxss xmm2, xmm2, dword ptr [rip + 0x54432e] ; 0x100aa50c0
0x100560d92: vmulss xmm2, xmm2, dword ptr [rip + 0x546b2a] ; 0x100aa78c4
0x100560d9a: vucomiss xmm2, xmm1
0x100560d9e: mov r15, qword ptr [rbx + 0x90]
0x100560da5: mov r12d, dword ptr [rbx + 0x28]
0x100560da9: jae 0x100560e41
0x100560daf: cmp byte ptr [rbx + 0x2c], 0
0x100560db3: je 0x100560e63
0x100560db9: vmovss xmm1, dword ptr [rip + 0x5442ff] ; 0x100aa50c0
0x100560dc1: vmovaps xmmword ptr [rbp - 0xb0], xmm8
0x100560dc9: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100560dce: vmovaps xmm8, xmmword ptr [rbp - 0xb0]
0x100560dd6: vaddss xmm1, xmm0, dword ptr [rip + 0x5442e2] ; 0x100aa50c0
0x100560dde: vxorps xmm2, xmm2, xmm2
0x100560de2: vcmpltss xmm2, xmm0, xmm2
0x100560de7: vblendvps xmm0, xmm0, xmm1, xmm2
0x100560ded: mov eax, r12d
0x100560df0: vcvtsi2ss xmm1, xmm9, rax
0x100560df5: vmulss xmm2, xmm0, xmm1
0x100560df9: vcvttss2si rsi, xmm2
0x100560dfe: lea ecx, [r12 - 1]
0x100560e03: lea eax, [rsi + 1]
0x100560e06: xor edi, edi
0x100560e08: cmp ecx, esi
0x100560e0a: cmove eax, edi
0x100560e0d: test esi, esi
0x100560e0f: mov ecx, esi
0x100560e11: cmove ecx, r12d
0x100560e15: dec ecx
0x100560e17: add r12d, -2
0x100560e1b: lea edx, [rax + 1]
0x100560e1e: cmp r12d, esi
0x100560e21: cmove edx, edi
0x100560e24: mov r12d, esi
0x100560e27: jmp 0x100560eb2 ; 0x100560eb2
0x100560e2c: mov rax, qword ptr [rbx + 0x90]
0x100560e33: vmovaps xmm1, xmmword ptr [rax + 0x10]
0x100560e38: vsubps xmm7, xmm1, xmmword ptr [rax]
0x100560e3c: jmp 0x100560f5b ; 0x100560f5b
0x100560e41: lea eax, [r12 - 1]
0x100560e46: shl rax, 4
0x100560e4a: add r12d, -2
0x100560e4e: shl r12, 4
0x100560e52: vmovaps xmm1, xmmword ptr [r15 + rax]
0x100560e58: vsubps xmm7, xmm1, xmmword ptr [r15 + r12]
0x100560e5e: jmp 0x100560f5b ; 0x100560f5b
0x100560e63: vxorps xmm1, xmm1, xmm1
0x100560e67: vmaxss xmm0, xmm1, xmm0
0x100560e6b: vmovss xmm1, dword ptr [rip + 0x54424d] ; 0x100aa50c0
0x100560e73: vminss xmm0, xmm1, xmm0
0x100560e77: lea edx, [r12 - 1]
0x100560e7c: vcvtsi2ss xmm1, xmm9, rdx
0x100560e81: vmulss xmm2, xmm0, xmm1
0x100560e85: vcvttss2si rax, xmm2
0x100560e8a: add r12d, -2
0x100560e8e: cmp edx, eax
0x100560e90: cmovne r12d, eax
0x100560e94: lea eax, [r12 + 1]
0x100560e99: lea ecx, [r12 - 1]
0x100560e9e: test r12d, r12d
0x100560ea1: cmove ecx, r12d
0x100560ea5: xor esi, esi
0x100560ea7: cmp eax, edx
0x100560ea9: setne sil
0x100560ead: lea edx, [r12 + rsi + 1]
0x100560eb2: vmulss xmm0, xmm0, xmm1
0x100560eb6: mov esi, r12d
0x100560eb9: vcvtsi2ss xmm1, xmm9, rsi
0x100560ebe: vsubss xmm0, xmm0, xmm1
0x100560ec2: mov ecx, ecx
0x100560ec4: shl rcx, 4
0x100560ec8: vmovaps xmm1, xmmword ptr [r15 + rcx]
0x100560ece: shl rsi, 4
0x100560ed2: vmovaps xmm2, xmmword ptr [r15 + rsi]
0x100560ed8: mov eax, eax
0x100560eda: shl rax, 4
0x100560ede: vmovaps xmm3, xmmword ptr [r15 + rax]
0x100560ee4: mov eax, edx
0x100560ee6: shl rax, 4
0x100560eea: vmovaps xmm4, xmmword ptr [r15 + rax]
0x100560ef0: vsubps xmm5, xmm3, xmm1
0x100560ef4: vaddps xmm6, xmm1, xmm1
0x100560ef8: vmulps xmm7, xmm2, xmmword ptr [rip + 0x546880] ; 0x100aa7780
0x100560f00: vsubps xmm6, xmm6, xmm7
0x100560f04: vmulps xmm7, xmm3, xmmword ptr [rip + 0x547044] ; 0x100aa7f50
0x100560f0c: vaddps xmm6, xmm7, xmm6
0x100560f10: vsubps xmm6, xmm6, xmm4
0x100560f14: vaddps xmm6, xmm6, xmm6
0x100560f18: vmovaps xmm7, xmmword ptr [rip + 0x547160] ; 0x100aa8080
0x100560f20: vmulps xmm2, xmm2, xmm7
0x100560f24: vsubps xmm1, xmm2, xmm1
0x100560f28: vmulps xmm2, xmm3, xmm7
0x100560f2c: vsubps xmm1, xmm1, xmm2
0x100560f30: vaddps xmm1, xmm4, xmm1
0x100560f34: vpermilps xmm0, xmm0, 0xc0
0x100560f3a: vmulps xmm1, xmm0, xmm1
0x100560f3e: vmulps xmm1, xmm1, xmm7
0x100560f42: vaddps xmm1, xmm6, xmm1
0x100560f46: vmulps xmm0, xmm0, xmm1
0x100560f4a: vaddps xmm0, xmm5, xmm0
0x100560f4e: vmulps xmm7, xmm0, xmmword ptr [rip + 0x54671a] ; 0x100aa7670
0x100560f56: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100560f5b: vmovaps xmm1, xmmword ptr [rbp - 0x60]
0x100560f60: vmovaps xmm2, xmmword ptr [rbp - 0x80]
0x100560f65: vmovaps xmm3, xmmword ptr [rbp - 0x50]
0x100560f6a: vmovaps xmm4, xmmword ptr [rbp - 0x40]
0x100560f6f: vmovaps xmm6, xmmword ptr [rbp - 0x90]
0x100560f77: vaddps xmm5, xmm1, xmm1
0x100560f7b: vmulps xmm2, xmm2, xmm3
0x100560f7f: vinsertps xmm1, xmm4, xmm6, 0x10
0x100560f85: vmulps xmm3, xmm7, xmm7
0x100560f89: vmovshdup xmm4, xmm3
0x100560f8d: vaddss xmm4, xmm3, xmm4
0x100560f91: vpermilpd xmm3, xmm3, 1
0x100560f97: vaddss xmm3, xmm3, xmm4
0x100560f9b: vsqrtss xmm3, xmm3, xmm3
0x100560f9f: vucomiss xmm3, dword ptr [rip + 0x54691d] ; 0x100aa78c4
0x100560fa7: jbe 0x100560fb3
0x100560fa9: vpermilps xmm3, xmm3, 0xc0
0x100560faf: vdivps xmm7, xmm7, xmm3
0x100560fb3: vmovaps xmmword ptr [rbp - 0x60], xmm7
0x100560fb8: vaddps xmm2, xmm5, xmm2
0x100560fbc: vmovaps xmmword ptr [rbp - 0x50], xmm2
0x100560fc1: vinsertps xmm1, xmm1, xmm8, 0x20
0x100560fc7: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x100560fcc: mov rdi, qword ptr [rbx + 0xb8]
0x100560fd3: mov esi, dword ptr [rbx + 0x28]
0x100560fd6: movzx edx, byte ptr [rbx + 0x2c]
0x100560fda: call 0x1005609d0 ; 0x1005609d0
0x100560fdf: vmovaps xmm1, xmmword ptr [rbp - 0x60]
0x100560fe4: vxorps xmm5, xmm1, xmmword ptr [rip + 0x546914] ; 0x100aa7900
0x100560fec: vmovaps xmm3, xmmword ptr [rbp - 0xa0]
0x100560ff4: vpermilps xmm1, xmm3, 0xd2
0x100560ffa: vmulps xmm2, xmm1, xmm5
0x100560ffe: vpshufd xmm1, xmm5, 0xd2
0x100561003: vmulps xmm3, xmm3, xmm1
0x100561007: vsubps xmm2, xmm2, xmm3
0x10056100b: vpermilps xmm7, xmm2, 0xd2
0x100561011: vmulps xmm2, xmm2, xmm2
0x100561015: vpermilpd xmm3, xmm2, 1
0x10056101b: vaddss xmm3, xmm3, xmm2
0x10056101f: vmovshdup xmm2, xmm2
0x100561023: vaddss xmm2, xmm2, xmm3
0x100561027: vsqrtss xmm2, xmm2, xmm2
0x10056102b: vucomiss xmm2, dword ptr [rip + 0x546891] ; 0x100aa78c4
0x100561033: jbe 0x10056103f
0x100561035: vpermilps xmm2, xmm2, 0xc0
0x10056103b: vdivps xmm7, xmm7, xmm2
0x10056103f: vmovaps xmm2, xmmword ptr [rbp - 0x50]
0x100561044: vmovaps xmm3, xmmword ptr [rip + 0x546624] ; 0x100aa7670
0x10056104c: vmovaps xmm4, xmmword ptr [rbp - 0x40]
0x100561051: vmulps xmm6, xmm2, xmm3
0x100561055: vmulps xmm4, xmm4, xmm3
0x100561059: vmulps xmm1, xmm1, xmm7
0x10056105d: vpermilps xmm2, xmm7, 0xd2
0x100561063: vmulps xmm2, xmm2, xmm5
0x100561067: vsubps xmm1, xmm1, xmm2
0x10056106b: vpermilps xmm3, xmm1, 0xd2
0x100561071: vmulps xmm1, xmm1, xmm1
0x100561075: vpermilpd xmm2, xmm1, 1
0x10056107b: vaddss xmm2, xmm2, xmm1
0x10056107f: vmovshdup xmm1, xmm1
0x100561083: vaddss xmm1, xmm1, xmm2
0x100561087: vsqrtss xmm1, xmm1, xmm1
0x10056108b: vucomiss xmm1, dword ptr [rip + 0x546831] ; 0x100aa78c4
0x100561093: vmovaps xmmword ptr [rbp - 0x70], xmm4
0x100561098: vmovaps xmmword ptr [rbp - 0x80], xmm5
0x10056109d: vmovaps xmmword ptr [rbp - 0xa0], xmm6
0x1005610a5: vmovaps xmmword ptr [rbp - 0x50], xmm7
0x1005610aa: jbe 0x1005610b6
0x1005610ac: vpermilps xmm1, xmm1, 0xc0
0x1005610b2: vdivps xmm3, xmm3, xmm1
0x1005610b6: vmovaps xmmword ptr [rbp - 0x40], xmm3
0x1005610bb: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x1005610c0: vmovshdup xmm13, xmm0
0x1005610c4: vmovaps xmm3, xmmword ptr [rbp - 0x60]
0x1005610c9: vmovshdup xmm4, xmm3
0x1005610cd: vpermilpd xmm5, xmm3, 1
0x1005610d3: vmulss xmm6, xmm3, xmm4
0x1005610d7: vmulss xmm9, xmm5, xmm3
0x1005610db: vmovss xmm8, dword ptr [rip + 0x543fdd] ; 0x100aa50c0
0x1005610e3: vsubss xmm7, xmm8, xmm13
0x1005610e8: vmulss xmm1, xmm3, xmm3
0x1005610ec: vmulss xmm1, xmm1, xmm7
0x1005610f0: vaddss xmm10, xmm13, xmm1
0x1005610f4: vmulss xmm6, xmm6, xmm7
0x1005610f8: vmulss xmm1, xmm5, xmm0
0x1005610fc: vaddss xmm11, xmm1, xmm6
0x100561100: vmulss xmm12, xmm9, xmm7
0x100561104: vinsertps xmm9, xmm10, xmm11, 0x10
0x10056110a: vmulss xmm10, xmm4, xmm0
0x10056110e: vsubss xmm2, xmm12, xmm10
0x100561113: vinsertps xmm9, xmm9, xmm2, 0x20
0x100561119: vsubss xmm1, xmm6, xmm1
0x10056111d: vmulss xmm0, xmm3, xmm0
0x100561121: vmulss xmm2, xmm4, xmm5
0x100561125: vmulss xmm4, xmm4, xmm4
0x100561129: vmulss xmm4, xmm4, xmm7
0x10056112d: vaddss xmm4, xmm13, xmm4
0x100561131: vmulss xmm2, xmm2, xmm7
0x100561135: vinsertps xmm1, xmm1, xmm4, 0x10
0x10056113b: vaddss xmm4, xmm0, xmm2
0x10056113f: vinsertps xmm1, xmm1, xmm4, 0x20
0x100561145: vaddss xmm4, xmm10, xmm12
0x10056114a: vsubss xmm0, xmm2, xmm0
0x10056114e: vmulss xmm2, xmm5, xmm5
0x100561152: vmulss xmm2, xmm2, xmm7
0x100561156: vaddss xmm2, xmm13, xmm2
0x10056115a: vinsertps xmm0, xmm4, xmm0, 0x10
0x100561160: vinsertps xmm0, xmm0, xmm2, 0x20
0x100561166: vmovaps xmm4, xmmword ptr [rbp - 0x50]
0x10056116b: vpermilps xmm2, xmm4, 0xc0
0x100561171: vmulps xmm2, xmm2, xmm9
0x100561176: vpermilps xmm3, xmm4, 0xd5
0x10056117c: vmulps xmm3, xmm1, xmm3
0x100561180: vaddps xmm2, xmm3, xmm2
0x100561184: vpermilps xmm3, xmm4, 0xea
0x10056118a: vmulps xmm3, xmm0, xmm3
0x10056118e: vaddps xmm2, xmm3, xmm2
0x100561192: vmovaps xmm5, xmmword ptr [rbp - 0x40]
0x100561197: vpermilps xmm3, xmm5, 0xc0
0x10056119d: vmulps xmm3, xmm3, xmm9
0x1005611a2: vpermilps xmm4, xmm5, 0xd5
0x1005611a8: vmulps xmm4, xmm1, xmm4
0x1005611ac: vaddps xmm3, xmm4, xmm3
0x1005611b0: vpermilps xmm4, xmm5, 0xea
0x1005611b6: vmulps xmm4, xmm0, xmm4
0x1005611ba: vaddps xmm3, xmm4, xmm3
0x1005611be: vmovaps xmm6, xmmword ptr [rbp - 0x80]
0x1005611c3: vpermilps xmm4, xmm6, 0xc0
0x1005611c9: vmulps xmm4, xmm4, xmm9
0x1005611ce: vpermilps xmm5, xmm6, 0xd5
0x1005611d4: vmulps xmm1, xmm1, xmm5
0x1005611d8: vaddps xmm1, xmm1, xmm4
0x1005611dc: vpermilps xmm4, xmm6, 0xea
0x1005611e2: vmulps xmm0, xmm0, xmm4
0x1005611e6: vaddps xmm0, xmm0, xmm1
0x1005611ea: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x1005611f2: vinsertps xmm1, xmm1, xmm8, 0x30
0x1005611f8: vmovaps xmmword ptr [rbp - 0x170], xmm8
0x100561200: vmovaps xmm4, xmmword ptr [rip + 0x546e98] ; 0x100aa80a0
0x100561208: vmovaps xmmword ptr [rbp - 0x160], xmm4
0x100561210: vmovaps xmm4, xmmword ptr [rip + 0x547818] ; 0x100aa8a30
0x100561218: vmovaps xmmword ptr [rbp - 0x150], xmm4
0x100561220: vmovaps xmmword ptr [rbp - 0x140], xmm1
0x100561228: vxorps xmm4, xmm4, xmm4
0x10056122c: vblendps xmm1, xmm2, xmm4, 8
0x100561232: vmovaps xmmword ptr [rbp - 0x130], xmm1
0x10056123a: vblendps xmm1, xmm3, xmm4, 8
0x100561240: vmovaps xmmword ptr [rbp - 0x120], xmm1
0x100561248: vblendps xmm0, xmm0, xmm4, 8
0x10056124e: vmovaps xmmword ptr [rbp - 0x110], xmm0
0x100561256: vmovaps xmm0, xmmword ptr [rip + 0x5477a2] ; 0x100aa8a00
0x10056125e: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x100561266: lea rbx, [rbp - 0x1b0]
0x10056126d: lea rsi, [rbp - 0x170]
0x100561274: lea rdx, [rbp - 0x130]
0x10056127b: mov rdi, rbx
0x10056127e: call 0x100076df0 ; 0x100076df0
0x100561283: vmovaps xmm2, xmmword ptr [rbp - 0x70]
0x100561288: vxorps xmm3, xmm3, xmm3
0x10056128c: vblendps xmm0, xmm3, xmm2, 1
0x100561292: vblendps xmm1, xmm3, xmm2, 2
0x100561298: vblendps xmm2, xmm3, xmm2, 4
0x10056129e: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x1005612a6: vmovaps xmmword ptr [rbp - 0xe0], xmm1
0x1005612ae: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x1005612b6: vmovaps xmm0, xmmword ptr [rip + 0x547742] ; 0x100aa8a00
0x1005612be: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1005612c6: lea rdx, [rbp - 0xf0]
0x1005612cd: mov rdi, r14
0x1005612d0: mov rsi, rbx
0x1005612d3: call 0x100076df0 ; 0x100076df0
0x1005612d8: mov rax, r14
0x1005612db: add rsp, 0x188
0x1005612e2: pop rbx
0x1005612e3: pop r12
0x1005612e5: pop r13
0x1005612e7: pop r14
0x1005612e9: pop r15
0x1005612eb: pop rbp
0x1005612ec: ret 
0x1005612ed: nop dword ptr [rax]
