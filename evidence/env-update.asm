0x100319a30: push rbp
0x100319a31: mov rbp, rsp
0x100319a34: push r15
0x100319a36: push r14
0x100319a38: push r13
0x100319a3a: push r12
0x100319a3c: push rbx
0x100319a3d: sub rsp, 0x28
0x100319a41: mov qword ptr [rbp - 0x38], rdx
0x100319a45: mov r14, rsi
0x100319a48: mov r15, rdi
0x100319a4b: cmp dword ptr [r15 + 0x90], 0
0x100319a53: je 0x100319ce0
0x100319a59: xor r12d, r12d
0x100319a5c: nop dword ptr [rax]
0x100319a60: mov r12d, r12d
0x100319a63: mov rax, r12
0x100319a66: shl rax, 4
0x100319a6a: mov qword ptr [rbp - 0x30], rax
0x100319a6e: cmp dword ptr [r15 + rax + 0x2a0d8], 0
0x100319a77: je 0x100319b01
0x100319a7d: mov rax, qword ptr [rbp - 0x30]
0x100319a81: lea rbx, [r15 + rax + 0x2a0d8]
0x100319a89: xor r13d, r13d
0x100319a8c: nop dword ptr [rax]
0x100319a90: mov eax, r13d
0x100319a93: imul rcx, r12, 0x5400
0x100319a9a: add rcx, r15
0x100319a9d: imul rax, rax, 0x38
0x100319aa1: lea rdi, [rax + rcx + 0xd8]
0x100319aa9: vmovss xmm0, dword ptr [r14 + 0x14]
0x100319aaf: vmovss xmm1, dword ptr [r14 + 0x20]
0x100319ab5: lea rax, [rip + 0x1ce1614] ; 0x101ffb0d0
0x100319abc: cmp byte ptr [rax], 0
0x100319abf: vmovss xmm2, dword ptr [rip + 0x78b5f9] ; 0x100aa50c0
0x100319ac7: je 0x100319ad4
0x100319ac9: lea rax, [rip + 0x99ea70] ; 0x100cb8540
0x100319ad0: vmovss xmm2, dword ptr [rax]
0x100319ad4: vmulss xmm1, xmm1, xmm2
0x100319ad8: vmulss xmm0, xmm0, xmm1
0x100319adc: vmovss xmm1, dword ptr [rip + 0x78cfb8] ; 0x100aa6a9c
0x100319ae4: vmaxss xmm0, xmm1, xmm0
0x100319ae8: vmovss xmm1, dword ptr [rip + 0x78cfb0] ; 0x100aa6aa0
0x100319af0: vminss xmm0, xmm1, xmm0
0x100319af4: call 0x10031a450 ; 0x10031a450
0x100319af9: inc r13d
0x100319afc: cmp r13d, dword ptr [rbx]
0x100319aff: jb 0x100319a90
0x100319b01: mov rax, qword ptr [rbp - 0x30]
0x100319b05: cmp dword ptr [r15 + rax + 0x2a0dc], 0
0x100319b0e: je 0x100319ba0
0x100319b14: mov rax, qword ptr [rbp - 0x30]
0x100319b18: lea r13, [r15 + rax + 0x2a0dc]
0x100319b20: xor ebx, ebx
0x100319b22: nop word ptr cs:[rax + rax]
0x100319b30: mov eax, ebx
0x100319b32: imul rcx, r12, 0x5400
0x100319b39: add rcx, r15
0x100319b3c: imul rax, rax, 0x38
0x100319b40: lea rdi, [rax + rcx + 0x15d8]
0x100319b48: vmovss xmm0, dword ptr [r14 + 0x14]
0x100319b4e: vmovss xmm1, dword ptr [r14 + 0x20]
0x100319b54: lea rax, [rip + 0x1ce1575] ; 0x101ffb0d0
0x100319b5b: cmp byte ptr [rax], 0
0x100319b5e: vmovss xmm2, dword ptr [rip + 0x78b55a] ; 0x100aa50c0
0x100319b66: je 0x100319b73
0x100319b68: lea rax, [rip + 0x99e9d1] ; 0x100cb8540
0x100319b6f: vmovss xmm2, dword ptr [rax]
0x100319b73: vmulss xmm1, xmm1, xmm2
0x100319b77: vmulss xmm0, xmm0, xmm1
0x100319b7b: vmovss xmm1, dword ptr [rip + 0x78cf19] ; 0x100aa6a9c
0x100319b83: vmaxss xmm0, xmm1, xmm0
0x100319b87: vmovss xmm1, dword ptr [rip + 0x78cf11] ; 0x100aa6aa0
0x100319b8f: vminss xmm0, xmm1, xmm0
0x100319b93: call 0x10031a450 ; 0x10031a450
0x100319b98: inc ebx
0x100319b9a: cmp ebx, dword ptr [r13]
0x100319b9e: jb 0x100319b30
0x100319ba0: mov rax, qword ptr [rbp - 0x30]
0x100319ba4: cmp dword ptr [r15 + rax + 0x2a0e0], 0
0x100319bad: je 0x100319c40
0x100319bb3: mov rax, qword ptr [rbp - 0x30]
0x100319bb7: lea r13, [r15 + rax + 0x2a0e0]
0x100319bbf: xor ebx, ebx
0x100319bc1: nop word ptr cs:[rax + rax]
0x100319bd0: mov eax, ebx
0x100319bd2: imul rcx, r12, 0x5400
0x100319bd9: add rcx, r15
0x100319bdc: imul rax, rax, 0x38
0x100319be0: lea rdi, [rax + rcx + 0x2ad8]
0x100319be8: vmovss xmm0, dword ptr [r14 + 0x14]
0x100319bee: vmovss xmm1, dword ptr [r14 + 0x20]
0x100319bf4: lea rax, [rip + 0x1ce14d5] ; 0x101ffb0d0
0x100319bfb: cmp byte ptr [rax], 0
0x100319bfe: vmovss xmm2, dword ptr [rip + 0x78b4ba] ; 0x100aa50c0
0x100319c06: je 0x100319c13
0x100319c08: lea rax, [rip + 0x99e931] ; 0x100cb8540
0x100319c0f: vmovss xmm2, dword ptr [rax]
0x100319c13: vmulss xmm1, xmm1, xmm2
0x100319c17: vmulss xmm0, xmm0, xmm1
0x100319c1b: vmovss xmm1, dword ptr [rip + 0x78ce79] ; 0x100aa6a9c
0x100319c23: vmaxss xmm0, xmm1, xmm0
0x100319c27: vmovss xmm1, dword ptr [rip + 0x78ce71] ; 0x100aa6aa0
0x100319c2f: vminss xmm0, xmm1, xmm0
0x100319c33: call 0x10031a450 ; 0x10031a450
0x100319c38: inc ebx
0x100319c3a: cmp ebx, dword ptr [r13]
0x100319c3e: jb 0x100319bd0
0x100319c40: mov rax, qword ptr [rbp - 0x30]
0x100319c44: cmp dword ptr [r15 + rax + 0x2a0e4], 0
0x100319c4d: je 0x100319cd0
0x100319c53: lea r13, [r15 + rax + 0x2a0e4]
0x100319c5b: xor ebx, ebx
0x100319c5d: nop dword ptr [rax]
0x100319c60: mov eax, ebx
0x100319c62: imul rcx, r12, 0x5400
0x100319c69: add rcx, r15
0x100319c6c: imul rax, rax, 0x38
0x100319c70: lea rdi, [rax + rcx + 0x3fd8]
0x100319c78: vmovss xmm0, dword ptr [r14 + 0x14]
0x100319c7e: vmovss xmm1, dword ptr [r14 + 0x20]
0x100319c84: lea rax, [rip + 0x1ce1445] ; 0x101ffb0d0
0x100319c8b: cmp byte ptr [rax], 0
0x100319c8e: vmovss xmm2, dword ptr [rip + 0x78b42a] ; 0x100aa50c0
0x100319c96: je 0x100319ca3
0x100319c98: lea rax, [rip + 0x99e8a1] ; 0x100cb8540
0x100319c9f: vmovss xmm2, dword ptr [rax]
0x100319ca3: vmulss xmm1, xmm1, xmm2
0x100319ca7: vmulss xmm0, xmm0, xmm1
0x100319cab: vmovss xmm1, dword ptr [rip + 0x78cde9] ; 0x100aa6a9c
0x100319cb3: vmaxss xmm0, xmm1, xmm0
0x100319cb7: vmovss xmm1, dword ptr [rip + 0x78cde1] ; 0x100aa6aa0
0x100319cbf: vminss xmm0, xmm1, xmm0
0x100319cc3: call 0x10031a450 ; 0x10031a450
0x100319cc8: inc ebx
0x100319cca: cmp ebx, dword ptr [r13]
0x100319cce: jb 0x100319c60
0x100319cd0: inc r12d
0x100319cd3: cmp r12d, dword ptr [r15 + 0x90]
0x100319cda: jb 0x100319a60
0x100319ce0: mov rsi, qword ptr [rbp - 0x38]
0x100319ce4: add rsi, 0x150
0x100319ceb: lea rdi, [rbp - 0x50]
0x100319cef: call 0x1001e0cf0 ; 0x1001e0cf0
0x100319cf4: cmp dword ptr [r15 + 0x90], 0
0x100319cfc: je 0x100319d2d
0x100319cfe: xor ebx, ebx
0x100319d00: lea r14, [rbp - 0x50]
0x100319d04: nop word ptr cs:[rax + rax]
0x100319d10: mov eax, ebx
0x100319d12: mov rdx, qword ptr [r15 + rax*8 + 0x10]
0x100319d17: mov rdi, r15
0x100319d1a: mov rsi, r14
0x100319d1d: call 0x10031aec0 ; 0x10031aec0
0x100319d22: inc ebx
0x100319d24: cmp ebx, dword ptr [r15 + 0x90]
0x100319d2b: jb 0x100319d10
0x100319d2d: add rsp, 0x28
0x100319d31: pop rbx
0x100319d32: pop r12
0x100319d34: pop r13
0x100319d36: pop r14
0x100319d38: pop r15
0x100319d3a: pop rbp
0x100319d3b: ret 
0x100319d3c: nop dword ptr [rax]
