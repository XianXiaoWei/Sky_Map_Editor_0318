0x10055cf30: push rbp
0x10055cf31: mov rbp, rsp
0x10055cf34: push r15
0x10055cf36: push r14
0x10055cf38: push r13
0x10055cf3a: push r12
0x10055cf3c: push rbx
0x10055cf3d: sub rsp, 0x68
0x10055cf41: mov r13, rdi
0x10055cf44: mov rax, qword ptr [r13 + 0x20]
0x10055cf48: test rax, rax
0x10055cf4b: je 0x10055d1e6
0x10055cf51: vmovaps xmm0, xmmword ptr [r13 + 0x60]
0x10055cf57: vmulps xmm1, xmm0, xmm0
0x10055cf5b: vmovshdup xmm2, xmm1
0x10055cf5f: vaddss xmm2, xmm1, xmm2
0x10055cf63: vpermilpd xmm1, xmm1, 1
0x10055cf69: vaddss xmm1, xmm1, xmm2
0x10055cf6d: vsqrtss xmm1, xmm1, xmm1
0x10055cf71: vucomiss xmm1, dword ptr [rip + 0x54a94b] ; 0x100aa78c4
0x10055cf79: jbe 0x10055cf85
0x10055cf7b: vpermilps xmm1, xmm1, 0xc0
0x10055cf81: vdivps xmm0, xmm0, xmm1
0x10055cf85: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10055cf8a: mov ecx, dword ptr [r13 + 0x28]
0x10055cf8e: test ecx, ecx
0x10055cf90: je 0x10055d1e6
0x10055cf96: vxorps xmm0, xmm0, xmm0
0x10055cf9a: vmovss dword ptr [rbp - 0x2c], xmm0
0x10055cf9f: xor ebx, ebx
0x10055cfa1: lea r14, [rbp - 0x90]
0x10055cfa8: lea r12, [rbp - 0x50]
0x10055cfac: jmp 0x10055cfb4 ; 0x10055cfb4
0x10055cfae: nop 
0x10055cfb0: mov rax, qword ptr [r13 + 0x20]
0x10055cfb4: mov ebx, ebx
0x10055cfb6: mov rsi, qword ptr [rax + rbx*8]
0x10055cfba: test rsi, rsi
0x10055cfbd: je 0x10055d099
0x10055cfc3: mov rdi, r14
0x10055cfc6: call 0x1004d1e40 ; 0x1004d1e40
0x10055cfcb: mov rax, qword ptr [r13 + 0x20]
0x10055cfcf: mov rsi, qword ptr [rax + rbx*8]
0x10055cfd3: lea rdi, [rbp - 0x40]
0x10055cfd7: call 0x1004d2260 ; 0x1004d2260
0x10055cfdc: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10055cfe1: mov rax, qword ptr [r13 + 0x90]
0x10055cfe8: mov r15, rbx
0x10055cfeb: shl r15, 4
0x10055cfef: vmovaps xmmword ptr [rax + r15], xmm0
0x10055cff5: vmovss xmm0, dword ptr [rbp - 0x40]
0x10055cffa: vaddss xmm0, xmm0, xmm0
0x10055cffe: mov rax, qword ptr [r13 + 0xa0]
0x10055d005: vmovss dword ptr [rax + rbx*4], xmm0
0x10055d00a: vmovss xmm0, dword ptr [rbp - 0x3c]
0x10055d00f: vaddss xmm0, xmm0, xmm0
0x10055d013: mov rax, qword ptr [r13 + 0xa8]
0x10055d01a: vmovss dword ptr [rax + rbx*4], xmm0
0x10055d01f: vmovss xmm0, dword ptr [rbp - 0x38]
0x10055d024: vaddss xmm0, xmm0, xmm0
0x10055d028: mov rax, qword ptr [r13 + 0xb0]
0x10055d02f: vmovss dword ptr [rax + rbx*4], xmm0
0x10055d034: mov rdi, r14
0x10055d037: mov rsi, r12
0x10055d03a: call 0x10078a710 ; 0x10078a710
0x10055d03f: mov rax, qword ptr [r13 + 0xb8]
0x10055d046: vmovss dword ptr [rax + rbx*4], xmm0
0x10055d04b: cmp byte ptr [r13 + 0x40], 0
0x10055d050: je 0x10055d095
0x10055d052: mov rax, qword ptr [r13 + 0x98]
0x10055d059: test rax, rax
0x10055d05c: je 0x10055d095
0x10055d05e: mov rcx, qword ptr [r13 + 0x90]
0x10055d065: vmovaps xmm0, xmmword ptr [rcx + r15]
0x10055d06b: vsubps xmm0, xmm0, xmmword ptr [rax + r15]
0x10055d071: vmulps xmm0, xmm0, xmm0
0x10055d075: vmovshdup xmm1, xmm0
0x10055d079: vaddss xmm1, xmm0, xmm1
0x10055d07d: vpermilpd xmm0, xmm0, 1
0x10055d083: vaddss xmm0, xmm0, xmm1
0x10055d087: vmovss xmm1, dword ptr [rbp - 0x2c]
0x10055d08c: vaddss xmm1, xmm1, xmm0
0x10055d090: vmovss dword ptr [rbp - 0x2c], xmm1
0x10055d095: mov ecx, dword ptr [r13 + 0x28]
0x10055d099: inc ebx
0x10055d09b: cmp ebx, ecx
0x10055d09d: jb 0x10055cfb0
0x10055d0a3: cmp ecx, 2
0x10055d0a6: jb 0x10055d183
0x10055d0ac: mov rax, qword ptr [r13 + 0xb8]
0x10055d0b3: vmovss xmm0, dword ptr [rax]
0x10055d0b7: mov edx, ecx
0x10055d0b9: not edx
0x10055d0bb: and edx, 1
0x10055d0be: cmp ecx, 2
0x10055d0c1: jne 0x10055d0d5
0x10055d0c3: mov ecx, 1
0x10055d0c8: test edx, edx
0x10055d0ca: jne 0x10055d14f
0x10055d0d0: jmp 0x10055d183 ; 0x10055d183
0x10055d0d5: mov esi, ecx
0x10055d0d7: sub rsi, rdx
0x10055d0da: mov ecx, 1
0x10055d0df: vmovss xmm1, dword ptr [rip + 0x54b519] ; 0x100aa8600
0x10055d0e7: vmovss xmm2, dword ptr [rip + 0x54b8c9] ; 0x100aa89b8
0x10055d0ef: nop 
0x10055d0f0: vmovss xmm3, dword ptr [rax + rcx*4]
0x10055d0f5: vmovss xmm4, dword ptr [rax + rcx*4 + 4]
0x10055d0fb: vsubss xmm3, xmm3, xmm0
0x10055d0ff: vaddss xmm5, xmm3, xmm1
0x10055d103: vdivss xmm5, xmm5, xmm2
0x10055d107: vroundss xmm5, xmm5, xmm5, 9
0x10055d10d: vmulss xmm5, xmm5, xmm2
0x10055d111: vsubss xmm3, xmm3, xmm5
0x10055d115: vaddss xmm0, xmm0, xmm3
0x10055d119: vmovss dword ptr [rax + rcx*4], xmm0
0x10055d11e: vsubss xmm3, xmm4, xmm0
0x10055d122: vaddss xmm4, xmm3, xmm1
0x10055d126: vdivss xmm4, xmm4, xmm2
0x10055d12a: vroundss xmm4, xmm4, xmm4, 9
0x10055d130: vmulss xmm4, xmm4, xmm2
0x10055d134: vsubss xmm3, xmm3, xmm4
0x10055d138: vaddss xmm0, xmm0, xmm3
0x10055d13c: vmovss dword ptr [rax + rcx*4 + 4], xmm0
0x10055d142: add rcx, 2
0x10055d146: cmp rsi, rcx
0x10055d149: jne 0x10055d0f0
0x10055d14b: test edx, edx
0x10055d14d: je 0x10055d183
0x10055d14f: vmovss xmm1, dword ptr [rax + rcx*4]
0x10055d154: vsubss xmm1, xmm1, xmm0
0x10055d158: vaddss xmm2, xmm1, dword ptr [rip + 0x54b4a0] ; 0x100aa8600
0x10055d160: vmovss xmm3, dword ptr [rip + 0x54b850] ; 0x100aa89b8
0x10055d168: vdivss xmm2, xmm2, xmm3
0x10055d16c: vroundss xmm2, xmm2, xmm2, 9
0x10055d172: vmulss xmm2, xmm2, xmm3
0x10055d176: vsubss xmm1, xmm1, xmm2
0x10055d17a: vaddss xmm0, xmm0, xmm1
0x10055d17e: vmovss dword ptr [rax + rcx*4], xmm0
0x10055d183: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10055d188: vucomiss xmm0, dword ptr [rip + 0x54991c] ; 0x100aa6aac
0x10055d190: jbe 0x10055d1e6
0x10055d192: cmp byte ptr [r13 + 0x40], 0
0x10055d197: je 0x10055d1e6
0x10055d199: cmp qword ptr [r13 + 0x98], 0
0x10055d1a1: je 0x10055d1e6
0x10055d1a3: mov esi, dword ptr [r13 + 0x10]
0x10055d1a7: mov rdi, r13
0x10055d1aa: call 0x10055b560 ; 0x10055b560
0x10055d1af: cmp dword ptr [r13 + 0x28], 0
0x10055d1b4: je 0x10055d1e6
0x10055d1b6: xor eax, eax
0x10055d1b8: nop dword ptr [rax + rax]
0x10055d1c0: mov ecx, eax
0x10055d1c2: shl rcx, 4
0x10055d1c6: mov rdx, qword ptr [r13 + 0x90]
0x10055d1cd: mov rsi, qword ptr [r13 + 0x98]
0x10055d1d4: vmovaps xmm0, xmmword ptr [rdx + rcx]
0x10055d1d9: vmovaps xmmword ptr [rsi + rcx], xmm0
0x10055d1de: inc eax
0x10055d1e0: cmp eax, dword ptr [r13 + 0x28]
0x10055d1e4: jb 0x10055d1c0
0x10055d1e6: add rsp, 0x68
0x10055d1ea: pop rbx
0x10055d1eb: pop r12
0x10055d1ed: pop r13
0x10055d1ef: pop r14
0x10055d1f1: pop r15
0x10055d1f3: pop rbp
0x10055d1f4: ret 
0x10055d1f5: nop word ptr cs:[rax + rax]
