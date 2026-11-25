0x1001a08e0: push rbp
0x1001a08e1: mov rbp, rsp
0x1001a08e4: push r15
0x1001a08e6: push r14
0x1001a08e8: push r13
0x1001a08ea: push r12
0x1001a08ec: push rbx
0x1001a08ed: sub rsp, 0x108
0x1001a08f4: vmovss dword ptr [rbp - 0x2c], xmm0
0x1001a08f9: mov r14, r8
0x1001a08fc: mov qword ptr [rbp - 0x48], rcx
0x1001a0900: mov rbx, rdi
0x1001a0903: vmovaps xmm0, xmmword ptr [rbx + 0x30]
0x1001a0908: vsubps xmm1, xmm0, xmmword ptr [rbx + 0x70]
0x1001a090d: vmulps xmm1, xmm1, xmm1
0x1001a0911: vmovshdup xmm2, xmm1
0x1001a0915: vaddss xmm2, xmm1, xmm2
0x1001a0919: vpermilpd xmm1, xmm1, 1
0x1001a091f: vaddss xmm1, xmm1, xmm2
0x1001a0923: vucomiss xmm1, dword ptr [rip + 0x907c85] ; 0x100aa85b0
0x1001a092b: jbe 0x1001a0952
0x1001a092d: mov dword ptr [rbx + 0x80], 0
0x1001a0937: mov qword ptr [rbx + 0x5c], 0
0x1001a093f: mov dword ptr [rbx + 0x64], 0
0x1001a0946: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x1001a094b: mov dword ptr [rbx + 0x4c], 1
0x1001a0952: mov rdi, rdx
0x1001a0955: call 0x1000fc260 ; 0x1000fc260
0x1001a095a: mov rax, qword ptr [rax + 0x20]
0x1001a095e: mov rsi, qword ptr [rax + 0x2a0]
0x1001a0965: lea rdi, [rbp - 0x40]
0x1001a0969: call 0x1007f26b0 ; 0x1007f26b0
0x1001a096e: mov rsi, qword ptr [rbx + 0x18]
0x1001a0972: test rsi, rsi
0x1001a0975: je 0x1001a0a45
0x1001a097b: mov rax, qword ptr [rsi]
0x1001a097e: lea r12, [rbp - 0x120]
0x1001a0985: mov rdi, r12
0x1001a0988: call qword ptr [rax + 0x18]
0x1001a098b: mov rsi, qword ptr [rbx + 0x18]
0x1001a098f: mov rax, qword ptr [rsi]
0x1001a0992: lea r13, [rbp - 0xa0]
0x1001a0999: mov rdi, r13
0x1001a099c: call qword ptr [rax + 0x20]
0x1001a099f: lea r15, [rbp - 0xe0]
0x1001a09a6: mov rdi, r15
0x1001a09a9: mov rsi, r12
0x1001a09ac: mov rdx, r13
0x1001a09af: call 0x100076df0 ; 0x100076df0
0x1001a09b4: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a09b9: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001a09be: lea rax, [rip + 0x920e7f] ; 0x100ac1844
0x1001a09c5: vmovss xmm0, dword ptr [rax]
0x1001a09c9: vmovss dword ptr [rbp - 0x30], xmm0
0x1001a09ce: lea rdi, [rbp - 0x60]
0x1001a09d2: lea rdx, [rbp - 0xa0]
0x1001a09d9: mov rsi, r15
0x1001a09dc: call 0x10078d250 ; 0x10078d250
0x1001a09e1: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x1001a09e9: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x1001a09ee: vmulps xmm0, xmm0, xmm0
0x1001a09f2: vmovshdup xmm1, xmm0
0x1001a09f6: vaddss xmm1, xmm0, xmm1
0x1001a09fa: vpermilpd xmm0, xmm0, 1
0x1001a0a00: vaddss xmm0, xmm0, xmm1
0x1001a0a04: vmovss xmm1, dword ptr [rbp - 0x30]
0x1001a0a09: vmulss xmm1, xmm1, xmm1
0x1001a0a0d: vsubss xmm0, xmm0, xmm1
0x1001a0a11: vmovss xmm1, dword ptr [rip + 0x907fb3] ; 0x100aa89cc
0x1001a0a19: vucomiss xmm1, xmm0
0x1001a0a1d: jbe 0x1001a0a45
0x1001a0a1f: mov rax, qword ptr [rbx + 0x18]
0x1001a0a23: mov byte ptr [rax + 0x40], 0
0x1001a0a27: mov qword ptr [rbx + 0x18], 0
0x1001a0a2f: mov qword ptr [rbx + 0x50], 0
0x1001a0a37: mov rax, qword ptr [rbx + 0x10]
0x1001a0a3b: mov dword ptr [rax + 0x50c], 0
0x1001a0a45: mov al, 1
0x1001a0a47: cmp dword ptr [rbx + 0x80], 2
0x1001a0a4e: ja 0x1001a0d05
0x1001a0a54: lea r12, [rbx + 0x90]
0x1001a0a5b: cmp dword ptr [rbx + 0x4c], 0
0x1001a0a5f: je 0x1001a0abc
0x1001a0a61: mov rax, qword ptr [rbx + 8]
0x1001a0a65: vmovss xmm0, dword ptr [rax + 0x60]
0x1001a0a6a: vmulss xmm0, xmm0, xmm0
0x1001a0a6e: vmovaps xmm1, xmmword ptr [r14]
0x1001a0a73: vsubps xmm1, xmm1, xmmword ptr [rbx + 0x30]
0x1001a0a78: vmulps xmm1, xmm1, xmm1
0x1001a0a7c: vmovshdup xmm2, xmm1
0x1001a0a80: vaddss xmm2, xmm1, xmm2
0x1001a0a84: vpermilpd xmm1, xmm1, 1
0x1001a0a8a: vaddss xmm1, xmm1, xmm2
0x1001a0a8e: mov al, 1
0x1001a0a90: vucomiss xmm0, xmm1
0x1001a0a94: jbe 0x1001a0aa4
0x1001a0a96: mov dword ptr [rbx + 0x4c], 0
0x1001a0a9d: mov dword ptr [rbx + 0x5c], 0x41200000
0x1001a0aa4: vmovss xmm0, dword ptr [rbx + 0x60]
0x1001a0aa9: vucomiss xmm0, dword ptr [rip + 0x907207] ; 0x100aa7cb8
0x1001a0ab1: ja 0x1001a0c5f
0x1001a0ab7: jmp 0x1001a0d05 ; 0x1001a0d05
0x1001a0abc: vmovss xmm0, dword ptr [rbx + 0x5c]
0x1001a0ac1: vsubss xmm0, xmm0, dword ptr [rbp - 0x2c]
0x1001a0ac6: vmovss dword ptr [rbx + 0x5c], xmm0
0x1001a0acb: vxorps xmm1, xmm1, xmm1
0x1001a0acf: vucomiss xmm0, xmm1
0x1001a0ad3: jbe 0x1001a0b73
0x1001a0ad9: vmovaps xmm0, xmmword ptr [r14 + 0x30]
0x1001a0adf: vxorps xmm2, xmm0, xmmword ptr [rip + 0x906e19] ; 0x100aa7900
0x1001a0ae7: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x1001a0aec: vmovaps xmm0, xmmword ptr [r14]
0x1001a0af1: vsubps xmm1, xmm1, xmm0
0x1001a0af5: vmulps xmm3, xmm1, xmm1
0x1001a0af9: vmovshdup xmm4, xmm3
0x1001a0afd: vaddss xmm4, xmm3, xmm4
0x1001a0b01: vpermilpd xmm3, xmm3, 1
0x1001a0b07: vaddss xmm3, xmm3, xmm4
0x1001a0b0b: vsqrtss xmm3, xmm3, xmm3
0x1001a0b0f: vucomiss xmm3, dword ptr [rip + 0x906dad] ; 0x100aa78c4
0x1001a0b17: jbe 0x1001a0b23
0x1001a0b19: vpermilps xmm3, xmm3, 0xc0
0x1001a0b1f: vdivps xmm1, xmm1, xmm3
0x1001a0b23: vmulps xmm2, xmm2, xmm1
0x1001a0b27: vmovshdup xmm3, xmm2
0x1001a0b2b: vaddss xmm3, xmm2, xmm3
0x1001a0b2f: vpermilpd xmm2, xmm2, 1
0x1001a0b35: vaddss xmm2, xmm2, xmm3
0x1001a0b39: vmovss xmm3, dword ptr [rip + 0x907b1b] ; 0x100aa865c
0x1001a0b41: vucomiss xmm3, xmm2
0x1001a0b45: jbe 0x1001a0b93
0x1001a0b47: vaddps xmm0, xmm0, xmm1
0x1001a0b4b: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1001a0b53: lea rsi, [rbp - 0xe0]
0x1001a0b5a: vmovss xmm0, dword ptr [rip + 0x90455e] ; 0x100aa50c0
0x1001a0b62: mov rdi, r12
0x1001a0b65: vmovaps xmm1, xmm0
0x1001a0b69: call 0x10062f190 ; 0x10062f190
0x1001a0b6e: jmp 0x1001a0c2b ; 0x1001a0c2b
0x1001a0b73: mov al, 1
0x1001a0b75: vmovss xmm1, dword ptr [rip + 0x90a3df] ; 0x100aaaf5c
0x1001a0b7d: vucomiss xmm1, xmm0
0x1001a0b81: jbe 0x1001a0c3d
0x1001a0b87: mov dword ptr [rbx + 0x5c], 0x41200000
0x1001a0b8e: jmp 0x1001a0c3d ; 0x1001a0c3d
0x1001a0b93: vmovss xmm0, dword ptr [rbx + 0x58]
0x1001a0b98: vsubss xmm0, xmm0, dword ptr [rbp - 0x2c]
0x1001a0b9d: vmovss dword ptr [rbx + 0x58], xmm0
0x1001a0ba2: vxorps xmm1, xmm1, xmm1
0x1001a0ba6: vucomiss xmm1, xmm0
0x1001a0baa: jbe 0x1001a0c2b
0x1001a0bac: mov r15, qword ptr [rbx + 0x10]
0x1001a0bb0: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a0bb5: mov rax, qword ptr [r15 + 0x78]
0x1001a0bb9: mov ecx, dword ptr [rax + 0x30]
0x1001a0bbc: lea edx, [rcx - 1]
0x1001a0bbf: add ecx, 3
0x1001a0bc2: cmp edx, 3
0x1001a0bc5: mov edx, 3
0x1001a0bca: cmovb edx, ecx
0x1001a0bcd: vmovss xmm0, dword ptr [rax + 0x18]
0x1001a0bd2: vmulss xmm0, xmm0, dword ptr [rip + 0x9039de] ; 0x100aa45b8
0x1001a0bda: mov dword ptr [rsp], 1
0x1001a0be1: lea rcx, [rip + 0x1e9eac8] ; 0x10203f6b0
0x1001a0be8: vxorps xmm1, xmm1, xmm1
0x1001a0bec: xor r8d, r8d
0x1001a0bef: mov r9d, 1
0x1001a0bf5: mov rdi, qword ptr [rbp - 0x48]
0x1001a0bf9: mov rsi, r15
0x1001a0bfc: call 0x1005a10e0 ; 0x1005a10e0
0x1001a0c01: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a0c06: vcvtsi2ss xmm0, xmm5, eax
0x1001a0c0a: vmulss xmm0, xmm0, dword ptr [rip + 0x9064de] ; 0x100aa70f0
0x1001a0c12: vmovss xmm1, dword ptr [rip + 0x9044a6] ; 0x100aa50c0
0x1001a0c1a: vsubss xmm1, xmm1, xmm0
0x1001a0c1e: vaddss xmm0, xmm0, xmm0
0x1001a0c22: vaddss xmm0, xmm0, xmm1
0x1001a0c26: vmovss dword ptr [rbx + 0x58], xmm0
0x1001a0c2b: vmovss xmm0, dword ptr [rip + 0x90448d] ; 0x100aa50c0
0x1001a0c33: mov rdi, r12
0x1001a0c36: call 0x100630480 ; 0x100630480
0x1001a0c3b: xor eax, eax
0x1001a0c3d: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a0c42: vaddss xmm0, xmm0, dword ptr [rbx + 0x60]
0x1001a0c47: vmovss dword ptr [rbx + 0x60], xmm0
0x1001a0c4c: vmovss xmm0, dword ptr [rbx + 0x60]
0x1001a0c51: vucomiss xmm0, dword ptr [rip + 0x90705f] ; 0x100aa7cb8
0x1001a0c59: jbe 0x1001a0d05
0x1001a0c5f: mov dword ptr [rbx + 0x4c], 2
0x1001a0c66: vmovss xmm0, dword ptr [rip + 0x904452] ; 0x100aa50c0
0x1001a0c6e: vucomiss xmm0, dword ptr [rbx + 0x64]
0x1001a0c73: jbe 0x1001a0d05
0x1001a0c79: vmovss xmm0, dword ptr [rip + 0x90443f] ; 0x100aa50c0
0x1001a0c81: lea rsi, [rbp - 0x40]
0x1001a0c85: vmovss xmm1, dword ptr [rip + 0x90392b] ; 0x100aa45b8
0x1001a0c8d: mov edx, 1
0x1001a0c92: mov rdi, r12
0x1001a0c95: call 0x100630190 ; 0x100630190
0x1001a0c9a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a0c9f: vsubps xmm0, xmm0, xmmword ptr [r14]
0x1001a0ca4: vmulps xmm0, xmm0, xmm0
0x1001a0ca8: vmovshdup xmm1, xmm0
0x1001a0cac: vaddss xmm1, xmm0, xmm1
0x1001a0cb0: vpermilpd xmm0, xmm0, 1
0x1001a0cb6: vaddss xmm0, xmm0, xmm1
0x1001a0cba: vmovss xmm1, dword ptr [rip + 0x909eee] ; 0x100aaabb0
0x1001a0cc2: vucomiss xmm1, xmm0
0x1001a0cc6: jbe 0x1001a0d03
0x1001a0cc8: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a0ccd: vaddss xmm0, xmm0, dword ptr [rbx + 0x64]
0x1001a0cd2: vmovss dword ptr [rbx + 0x64], xmm0
0x1001a0cd7: vucomiss xmm0, dword ptr [rip + 0x9043e1] ; 0x100aa50c0
0x1001a0cdf: jb 0x1001a0d03
0x1001a0ce1: mov eax, dword ptr [rbx + 0x80]
0x1001a0ce7: inc eax
0x1001a0ce9: mov dword ptr [rbx + 0x80], eax
0x1001a0cef: cmp eax, 2
0x1001a0cf2: ja 0x1001a0cfc
0x1001a0cf4: mov qword ptr [rbx + 0x60], 0
0x1001a0cfc: mov dword ptr [rbx + 0x4c], 1
0x1001a0d03: xor eax, eax
0x1001a0d05: add rsp, 0x108
0x1001a0d0c: pop rbx
0x1001a0d0d: pop r12
0x1001a0d0f: pop r13
0x1001a0d11: pop r14
0x1001a0d13: pop r15
0x1001a0d15: pop rbp
0x1001a0d16: ret 
0x1001a0d17: nop word ptr [rax + rax]
