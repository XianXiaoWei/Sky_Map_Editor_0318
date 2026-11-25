0x100592940: push rbp
0x100592941: mov rbp, rsp
0x100592944: push r15
0x100592946: push r14
0x100592948: push r13
0x10059294a: push r12
0x10059294c: push rbx
0x10059294d: sub rsp, 0x48
0x100592951: mov rbx, rdi
0x100592954: vmovss xmm2, dword ptr [rbx + 0xc0]
0x10059295c: mov rax, qword ptr [rsi + 0x160]
0x100592963: lea rcx, [rip + 0x1a68766] ; 0x101ffb0d0
0x10059296a: cmp byte ptr [rcx], 0
0x10059296d: je 0x10059297c
0x10059296f: lea rcx, [rip + 0x725bca] ; 0x100cb8540
0x100592976: vmovss xmm0, dword ptr [rcx]
0x10059297a: jmp 0x100592984 ; 0x100592984
0x10059297c: vmovss xmm0, dword ptr [rip + 0x51273c] ; 0x100aa50c0
0x100592984: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x100592989: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x10059298e: vmovss xmm1, dword ptr [rip + 0x514106] ; 0x100aa6a9c
0x100592996: vmaxss xmm0, xmm1, xmm0
0x10059299a: vmovss xmm1, dword ptr [rip + 0x5140fe] ; 0x100aa6aa0
0x1005929a2: vminss xmm0, xmm1, xmm0
0x1005929a6: vaddss xmm0, xmm2, xmm0
0x1005929aa: vmovss dword ptr [rbx + 0xc0], xmm0
0x1005929b2: mov rax, qword ptr [rbx + 0x38]
0x1005929b6: cmp dword ptr [rax + 0x10], 0
0x1005929ba: je 0x100592b8d
0x1005929c0: lea r14, [rbx + 0x60]
0x1005929c4: lea rcx, [rbx + 0x40]
0x1005929c8: mov qword ptr [rbp - 0x50], rcx
0x1005929cc: lea rcx, [rbx + 0x78]
0x1005929d0: mov qword ptr [rbp - 0x48], rcx
0x1005929d4: xor r13d, r13d
0x1005929d7: lea r12, [rbp - 0x40]
0x1005929db: vmovss dword ptr [rbp - 0x2c], xmm2
0x1005929e0: mov ecx, r13d
0x1005929e3: vcvtsi2ss xmm0, xmm3, rcx
0x1005929e8: vmulss xmm0, xmm0, dword ptr [rbx + 0x98]
0x1005929f0: vucomiss xmm0, xmm2
0x1005929f4: jb 0x100592b3c
0x1005929fa: vmovss xmm1, dword ptr [rbx + 0xc0]
0x100592a02: vucomiss xmm1, xmm0
0x100592a06: jbe 0x100592b3c
0x100592a0c: mov rax, qword ptr [rax + 8]
0x100592a10: mov rax, qword ptr [rax + rcx*8]
0x100592a14: mov qword ptr [rbp - 0x58], rax
0x100592a18: call 0x1007abc10 ; 0x1007abc10
0x100592a1d: mov r15, rax
0x100592a20: mov qword ptr [rbp - 0x40], 0
0x100592a28: call 0x1003ffcf0 ; 0x1003ffcf0
0x100592a2d: mov r8, qword ptr [rax]
0x100592a30: mov rdi, rax
0x100592a33: mov rsi, r12
0x100592a36: lea rdx, [rbp - 0x58]
0x100592a3a: mov rcx, r15
0x100592a3d: call qword ptr [r8 + 0x40]
0x100592a41: mov rdi, qword ptr [rbp - 0x40]
0x100592a45: test rdi, rdi
0x100592a48: je 0x100592ba1
0x100592a4e: mov eax, dword ptr [rbx + 0x90]
0x100592a54: cmp eax, 2
0x100592a57: je 0x100592b29
0x100592a5d: cmp eax, 1
0x100592a60: je 0x100592a95
0x100592a62: test eax, eax
0x100592a64: jne 0x100592bc0
0x100592a6a: mov rax, qword ptr [rbx + 0x48]
0x100592a6e: test rax, rax
0x100592a71: lea rax, [rax + 0x10]
0x100592a75: cmove rax, qword ptr [rbp - 0x50]
0x100592a7a: vmovss xmm0, dword ptr [rax]
0x100592a7e: vmovss xmm1, dword ptr [rbx + 0x94]
0x100592a86: xor esi, esi
0x100592a88: mov rdx, r14
0x100592a8b: call 0x1003ffe90 ; 0x1003ffe90
0x100592a90: jmp 0x100592b37 ; 0x100592b37
0x100592a95: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x100592a9a: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100592a9f: mov rax, qword ptr [rbx + 0xa0]
0x100592aa6: test rax, rax
0x100592aa9: lea rax, [rax + 0x10]
0x100592aad: cmove rax, r12
0x100592ab1: mov eax, dword ptr [rax]
0x100592ab3: mov dword ptr [rbp - 0x40], eax
0x100592ab6: mov rax, qword ptr [rbx + 0xa8]
0x100592abd: test rax, rax
0x100592ac0: lea rax, [rax + 0x10]
0x100592ac4: lea rcx, [rbp - 0x3c]
0x100592ac8: cmove rax, rcx
0x100592acc: mov eax, dword ptr [rax]
0x100592ace: mov dword ptr [rbp - 0x3c], eax
0x100592ad1: mov rax, qword ptr [rbx + 0xb0]
0x100592ad8: test rax, rax
0x100592adb: lea rax, [rax + 0x10]
0x100592adf: lea rcx, [rbp - 0x38]
0x100592ae3: cmove rax, rcx
0x100592ae7: mov eax, dword ptr [rax]
0x100592ae9: mov dword ptr [rbp - 0x38], eax
0x100592aec: mov rax, qword ptr [rbx + 0xb8]
0x100592af3: test rax, rax
0x100592af6: lea rax, [rax + 0x10]
0x100592afa: lea rcx, [rbp - 0x34]
0x100592afe: cmove rax, rcx
0x100592b02: mov eax, dword ptr [rax]
0x100592b04: mov dword ptr [rbp - 0x34], eax
0x100592b07: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100592b0c: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x100592b11: vmovss xmm0, dword ptr [rbx + 0x94]
0x100592b19: xor esi, esi
0x100592b1b: mov rdx, r14
0x100592b1e: lea rcx, [rbp - 0x70]
0x100592b22: call 0x1003fff20 ; 0x1003fff20
0x100592b27: jmp 0x100592b37 ; 0x100592b37
0x100592b29: xor esi, esi
0x100592b2b: mov rdx, r14
0x100592b2e: mov rcx, qword ptr [rbp - 0x48]
0x100592b32: call 0x1003fffc0 ; 0x1003fffc0
0x100592b37: vmovss xmm2, dword ptr [rbp - 0x2c]
0x100592b3c: inc r13d
0x100592b3f: mov rax, qword ptr [rbx + 0x38]
0x100592b43: mov ecx, dword ptr [rax + 0x10]
0x100592b46: cmp r13d, ecx
0x100592b49: jb 0x1005929e0
0x100592b4f: vmovss xmm0, dword ptr [rbx + 0xc0]
0x100592b57: mov eax, ecx
0x100592b59: vcvtsi2ss xmm1, xmm3, rax
0x100592b5e: vmulss xmm1, xmm1, dword ptr [rbx + 0x98]
0x100592b66: vucomiss xmm0, xmm1
0x100592b6a: jb 0x100592b7e
0x100592b6c: mov dword ptr [rbx + 0xc0], 0
0x100592b76: mov rdi, rbx
0x100592b79: call 0x10032ef60 ; 0x10032ef60
0x100592b7e: add rsp, 0x48
0x100592b82: pop rbx
0x100592b83: pop r12
0x100592b85: pop r13
0x100592b87: pop r14
0x100592b89: pop r15
0x100592b8b: pop rbp
0x100592b8c: ret 
0x100592b8d: vxorps xmm1, xmm1, xmm1
0x100592b91: vmulss xmm1, xmm1, dword ptr [rbx + 0x98]
0x100592b99: vucomiss xmm0, xmm1
0x100592b9d: jae 0x100592b6c
0x100592b9f: jmp 0x100592b7e ; 0x100592b7e
0x100592ba1: lea rdi, [rip + 0x5e7892] ; 0x100b7a43a mesh
0x100592ba8: lea rsi, [rip + 0x600079] ; 0x100b92c28 SetMeshShaderParam.cpp
0x100592baf: mov edx, 0x3c
0x100592bb4: mov ecx, 3
0x100592bb9: call 0x1007e5f70 ; 0x1007e5f70
0x100592bbe: ud2 
0x100592bc0: lea rdi, [rip + 0x610465] ; 0x100ba302c false
0x100592bc7: lea rsi, [rip + 0x60005a] ; 0x100b92c28 SetMeshShaderParam.cpp
0x100592bce: mov edx, 0x4f
0x100592bd3: mov ecx, 3
0x100592bd8: call 0x1007e5f70 ; 0x1007e5f70
0x100592bdd: ud2 
0x100592bdf: nop 
