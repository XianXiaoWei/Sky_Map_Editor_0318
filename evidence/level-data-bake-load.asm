0x1003f4b7b: lea r12, [r15 + r15*2]
0x1003f4b7f: shl r12, 4
0x1003f4b83: lea rbx, [r14 + r12]
0x1003f4b87: vmovups ymmword ptr [r14 + r12 + 0x10], ymm0
0x1003f4b8e: vmovups ymmword ptr [r14 + r12], ymm0
0x1003f4b94: mov rsi, rbx
0x1003f4b97: vzeroupper 
0x1003f4b9a: call 0x10076a5d0 ; 0x10076a5d0
0x1003f4b9f: lea rdi, [rsp + 0x100]
0x1003f4ba7: call 0x1007c2530 ; 0x1007c2530
0x1003f4bac: mov qword ptr [rsp + 0xc8], r15
0x1003f4bb4: mov rax, qword ptr [rsp + 0xd8]
0x1003f4bbc: mov rax, qword ptr [rax]
0x1003f4bbf: mov r15, qword ptr [rax + 0x38]
0x1003f4bc3: test byte ptr [rbx], 1
0x1003f4bc6: jne 0x1003f4bcd
0x1003f4bc8: inc rbx
0x1003f4bcb: jmp 0x1003f4bd2 ; 0x1003f4bd2
0x1003f4bcd: mov rbx, qword ptr [r14 + r12 + 0x10]
0x1003f4bd2: call 0x1004559d0 ; 0x1004559d0
0x1003f4bd7: lea r13, [rsp + 0x70]
0x1003f4bdc: mov rdi, r15
0x1003f4bdf: mov rsi, rax
0x1003f4be2: mov rdx, rbx
0x1003f4be5: call 0x1007c4360 ; 0x1007c4360
0x1003f4bea: mov r15, rax
0x1003f4bed: test r15, r15
0x1003f4bf0: je 0x1003f4c28
0x1003f4bf2: mov rdi, r15
0x1003f4bf5: lea rsi, [rsp + 0x100]
0x1003f4bfd: call 0x1007c2310 ; 0x1007c2310
0x1003f4c02: mov rax, qword ptr [rsp + 0x100]
0x1003f4c0a: test rax, rax
0x1003f4c0d: je 0x1003f5c75
0x1003f4c13: mov rax, qword ptr [rax + 0x10]
0x1003f4c17: test rax, rax
0x1003f4c1a: je 0x1003f5c75
0x1003f4c20: add rax, 0xa8
0x1003f4c26: jmp 0x1003f4c2a ; 0x1003f4c2a
0x1003f4c28: xor eax, eax
0x1003f4c2a: mov qword ptr [rsp + 0x28], rax
0x1003f4c2f: lea rbx, [r14 + r12 + 0x18]
0x1003f4c34: mov rdi, r13
0x1003f4c37: mov rsi, rbx
0x1003f4c3a: call 0x10076a240 ; 0x10076a240
0x1003f4c3f: lea rsi, [r14 + r12 + 0x1c]
0x1003f4c44: mov rdi, r13
0x1003f4c47: mov qword ptr [rsp + 0x38], rsi
0x1003f4c4c: call 0x10076a280 ; 0x10076a280
0x1003f4c51: lea rsi, [r14 + r12 + 0x20]
0x1003f4c56: mov rdi, r13
0x1003f4c59: mov qword ptr [rsp + 0x58], rsi
0x1003f4c5e: call 0x10076aae0 ; 0x10076aae0
0x1003f4c63: test r15, r15
0x1003f4c66: jne 0x1003f4c6e
0x1003f4c68: mov dword ptr [rbx], 0xffffffff
0x1003f4c6e: mov rax, qword ptr [rsp + 0x18]
0x1003f4c73: mov rdi, qword ptr [rax + 0x30]
0x1003f4c77: mov rax, qword ptr [rsp + 0x38]
0x1003f4c7c: mov eax, dword ptr [rax]
0x1003f4c7e: shl rax, 3
0x1003f4c82: lea rsi, [rax + rax*2]
0x1003f4c86: mov rdx, qword ptr [rip + 0x9373cb] ; 0x100d2c058
0x1003f4c8d: mov ecx, 0x10
0x1003f4c92: call 0x100795530 ; 0x100795530
0x1003f4c97: mov r15, rax
0x1003f4c9a: mov qword ptr [r14 + r12 + 0x28], r15
0x1003f4c9f: mov rax, qword ptr [rsp + 0x38]
0x1003f4ca4: cmp dword ptr [rax], 0
0x1003f4ca7: je 0x1003f4b37
0x1003f4cad: lea rax, [r14 + r12 + 0x28]
0x1003f4cb2: mov qword ptr [rsp + 0xd0], rax
0x1003f4cba: xor r13d, r13d
0x1003f4cbd: jmp 0x1003f4db5 ; 0x1003f4db5
0x1003f4cc2: call 0x1007c6c20 ; 0x1007c6c20
0x1003f4cc7: mov rdi, rax
0x1003f4cca: mov rsi, r15
0x1003f4ccd: call 0x100795a70 ; 0x100795a70
0x1003f4cd2: jmp 0x1003f4d99 ; 0x1003f4d99
0x1003f4cd7: nop word ptr [rax + rax]
0x1003f4ce0: call 0x1007c6c20 ; 0x1007c6c20
0x1003f4ce5: shl rbx, 2
0x1003f4ce9: lea rsi, [rbx + rbx*2]
0x1003f4ced: lea rcx, [rip + 0x1c53e5c] ; 0x102048b50
0x1003f4cf4: mov rdx, qword ptr [rcx]
0x1003f4cf7: mov ecx, 4
0x1003f4cfc: mov rdi, rax
0x1003f4cff: call 0x100795530 ; 0x100795530
0x1003f4d04: mov r15, rax
0x1003f4d07: mov ebx, dword ptr [r14]
0x1003f4d0a: call 0x1007c6c20 ; 0x1007c6c20
0x1003f4d0f: lea rcx, [rip + 0x1c53e3a] ; 0x102048b50
0x1003f4d16: mov rdx, qword ptr [rcx]
0x1003f4d19: mov ecx, 1
0x1003f4d1e: mov rdi, rax
0x1003f4d21: mov rsi, rbx
0x1003f4d24: call 0x100795530 ; 0x100795530
0x1003f4d29: mov r12, rax
0x1003f4d2c: mov eax, dword ptr [rsp + 0x40]
0x1003f4d30: shl eax, 2
0x1003f4d33: mov rcx, qword ptr [rsp + 0x58]
0x1003f4d38: cmp byte ptr [rcx], 0
0x1003f4d3b: lea edx, [rax + rax*2]
0x1003f4d3e: mov eax, 0xc
0x1003f4d43: cmovne edx, eax
0x1003f4d46: lea rbx, [rsp + 0x70]
0x1003f4d4b: mov rdi, rbx
0x1003f4d4e: mov rsi, r15
0x1003f4d51: call 0x10076a0a0 ; 0x10076a0a0
0x1003f4d56: mov edx, dword ptr [r14]
0x1003f4d59: mov rdi, rbx
0x1003f4d5c: mov rsi, r12
0x1003f4d5f: call 0x10076a0a0 ; 0x10076a0a0
0x1003f4d64: vxorps xmm0, xmm0, xmm0
0x1003f4d68: mov rax, qword ptr [rsp + 0x60]
0x1003f4d6d: vmovups xmmword ptr [rax], xmm0
0x1003f4d71: mov qword ptr [rax + 0x10], 0
0x1003f4d79: call 0x1007c6c20 ; 0x1007c6c20
0x1003f4d7e: mov rdi, rax
0x1003f4d81: mov rsi, r12
0x1003f4d84: call 0x100795a70 ; 0x100795a70
0x1003f4d89: call 0x1007c6c20 ; 0x1007c6c20
0x1003f4d8e: mov rdi, rax
0x1003f4d91: mov rsi, r15
0x1003f4d94: call 0x100795a70 ; 0x100795a70
0x1003f4d99: inc r13d
0x1003f4d9c: mov rax, qword ptr [rsp + 0x38]
0x1003f4da1: cmp r13d, dword ptr [rax]
0x1003f4da4: jae 0x1003f4b37
0x1003f4daa: mov rax, qword ptr [rsp + 0xd0]
0x1003f4db2: mov r15, qword ptr [rax]
0x1003f4db5: lea rbx, [rsp + 0x70]
0x1003f4dba: mov rdi, rbx
0x1003f4dbd: lea rsi, [rsp + 0x40]
0x1003f4dc2: call 0x10076a280 ; 0x10076a280
0x1003f4dc7: mov r13d, r13d
0x1003f4dca: lea r12, [r13 + r13*2]
0x1003f4dcf: lea r14, [r15 + r12*8 + 4]
0x1003f4dd4: mov rdi, rbx
0x1003f4dd7: mov rsi, r14
0x1003f4dda: call 0x10076a280 ; 0x10076a280
0x1003f4ddf: lea rax, [r15 + r12*8]
0x1003f4de3: mov qword ptr [rsp + 0x60], rax
0x1003f4de8: mov ebx, dword ptr [rsp + 0x40]
0x1003f4dec: mov rax, qword ptr [rsp + 0x28]
0x1003f4df1: test rax, rax
0x1003f4df4: je 0x1003f4ce0
0x1003f4dfa: mov rax, qword ptr [rax + 0x48]
0x1003f4dfe: imul rcx, r13, 0xb8
0x1003f4e05: cmp ebx, dword ptr [rax + rcx + 0x40]
0x1003f4e09: jne 0x1003f4ce0
0x1003f4e0f: mov qword ptr [rsp + 0xb8], rcx
0x1003f4e17: mov qword ptr [rsp + 0x30], r15
0x1003f4e1c: call 0x1007c6c20 ; 0x1007c6c20
0x1003f4e21: shl rbx, 2
0x1003f4e25: lea rsi, [rbx + rbx*2]
0x1003f4e29: lea rcx, [rip + 0x1c53d20] ; 0x102048b50
0x1003f4e30: mov rdx, qword ptr [rcx]
0x1003f4e33: mov ecx, 4
0x1003f4e38: mov rdi, rax
0x1003f4e3b: call 0x100795530 ; 0x100795530
0x1003f4e40: mov r15, rax
0x1003f4e43: mov rax, qword ptr [rsp + 0x18]
0x1003f4e48: mov rdi, qword ptr [rax + 0x30]
0x1003f4e4c: mov esi, dword ptr [r14]
0x1003f4e4f: mov rdx, qword ptr [rip + 0x937202] ; 0x100d2c058
0x1003f4e56: mov ecx, 0x10
0x1003f4e5b: call 0x100795530 ; 0x100795530
0x1003f4e60: mov rcx, qword ptr [rsp + 0x30]
0x1003f4e65: mov qword ptr [rcx + r12*8 + 0x10], rax
0x1003f4e6a: mov eax, dword ptr [rsp + 0x40]
0x1003f4e6e: shl eax, 2
0x1003f4e71: mov rcx, qword ptr [rsp + 0x58]
0x1003f4e76: cmp byte ptr [rcx], 0
0x1003f4e79: lea edx, [rax + rax*2]
0x1003f4e7c: mov eax, 0xc
0x1003f4e81: cmovne edx, eax
0x1003f4e84: lea rdi, [rsp + 0x70]
0x1003f4e89: mov rsi, r15
0x1003f4e8c: call 0x10076a0a0 ; 0x10076a0a0
0x1003f4e91: mov rax, qword ptr [rsp + 0x30]
0x1003f4e96: lea rax, [rax + r12*8 + 0x10]
0x1003f4e9b: mov rsi, qword ptr [rax]
0x1003f4e9e: mov edx, dword ptr [r14]
0x1003f4ea1: lea rdi, [rsp + 0x70]
0x1003f4ea6: call 0x10076a0a0 ; 0x10076a0a0
0x1003f4eab: mov rax, qword ptr [rsp + 0x28]
0x1003f4eb0: mov rax, qword ptr [rax + 0x48]
0x1003f4eb4: mov rcx, qword ptr [rsp + 0xb8]
0x1003f4ebc: mov eax, dword ptr [rax + rcx + 0x34]
0x1003f4ec0: mov rcx, qword ptr [rsp + 0x60]
0x1003f4ec5: mov dword ptr [rcx], eax
0x1003f4ec7: mov rcx, qword ptr [rsp + 0x18]
0x1003f4ecc: mov rdi, qword ptr [rcx + 0x30]
0x1003f4ed0: shl rax, 2
0x1003f4ed4: lea rsi, [rax + rax*2]
0x1003f4ed8: mov rdx, qword ptr [rip + 0x937179] ; 0x100d2c058
0x1003f4edf: mov ecx, 0x10
0x1003f4ee4: call 0x100795530 ; 0x100795530
0x1003f4ee9: mov rcx, qword ptr [rsp + 0x30]
0x1003f4eee: mov qword ptr [rcx + r12*8 + 8], rax
0x1003f4ef3: mov rbx, qword ptr [rsp + 0x60]
0x1003f4ef8: cmp dword ptr [rbx], 0
0x1003f4efb: mov r8, qword ptr [rsp + 0x28]
0x1003f4f00: mov r9, qword ptr [rsp + 0x58]
0x1003f4f05: mov r10, qword ptr [rsp + 0xb8]
0x1003f4f0d: je 0x1003f4cc2
0x1003f4f13: xor ecx, ecx
0x1003f4f15: nop word ptr cs:[rax + rax]
0x1003f4f20: cmp byte ptr [r9], 0
0x1003f4f24: je 0x1003f4f30
0x1003f4f26: mov edx, ecx
0x1003f4f28: xor esi, esi
0x1003f4f2a: jmp 0x1003f4f41 ; 0x1003f4f41
0x1003f4f2c: nop dword ptr [rax]
0x1003f4f30: mov rdx, qword ptr [r8 + 0x48]
0x1003f4f34: mov rsi, qword ptr [rdx + r10 + 0x98]
0x1003f4f3c: mov edx, ecx
0x1003f4f3e: mov esi, dword ptr [rsi + rdx*4]
0x1003f4f41: mov esi, esi
0x1003f4f43: lea rsi, [rsi + rsi*2]
0x1003f4f47: lea rdx, [rdx + rdx*2]
0x1003f4f4b: mov edi, dword ptr [r15 + rsi*4 + 8]
0x1003f4f50: mov dword ptr [rax + rdx*4 + 8], edi
0x1003f4f54: mov rsi, qword ptr [r15 + rsi*4]
0x1003f4f58: mov qword ptr [rax + rdx*4], rsi
0x1003f4f5c: inc ecx
0x1003f4f5e: cmp ecx, dword ptr [rbx]
0x1003f4f60: jb 0x1003f4f20
0x1003f4f62: jmp 0x1003f4cc2 ; 0x1003f4cc2
