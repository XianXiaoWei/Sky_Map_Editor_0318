0x1003f4840: push rbp
0x1003f4841: mov rbp, rsp
0x1003f4844: push r15
0x1003f4846: push r14
0x1003f4848: push r13
0x1003f484a: push r12
0x1003f484c: push rbx
0x1003f484d: and rsp, 0xffffffffffffffe0
0x1003f4851: sub rsp, 0x2e0
0x1003f4858: mov r15d, edx
0x1003f485b: mov rbx, rdi
0x1003f485e: mov rax, qword ptr [rip + 0x819073] ; 0x100c0d8d8
0x1003f4865: mov rax, qword ptr [rax]
0x1003f4868: mov qword ptr [rsp + 0x2c0], rax
0x1003f4870: mov qword ptr [rsp + 0xe0], rsi
0x1003f4878: test rsi, rsi
0x1003f487b: je 0x1003f5c22
0x1003f4881: cmp dword ptr [rbx + 0x238], r15d
0x1003f4888: jbe 0x1003f5c4a
0x1003f488e: lea r14, [rbx + 0x10]
0x1003f4892: test byte ptr [rbx + 0x10], 1
0x1003f4896: jne 0x1003f489e
0x1003f4898: lea rcx, [r14 + 1]
0x1003f489c: jmp 0x1003f48a2 ; 0x1003f48a2
0x1003f489e: mov rcx, qword ptr [rbx + 0x20]
0x1003f48a2: lea rdx, [rip + 0x792526] ; 0x100b86dcf Loaded %s LOD %u
0x1003f48a9: lea rdi, [rsp + 0x1c0]
0x1003f48b1: mov esi, 0x100
0x1003f48b6: xor eax, eax
0x1003f48b8: mov r8d, r15d
0x1003f48bb: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1003f48c0: lea r13, [rbx + 0x230]
0x1003f48c7: call 0x1007c6580 ; 0x1007c6580
0x1003f48cc: mov r12, rax
0x1003f48cf: mov qword ptr [rsp + 0x100], 0
0x1003f48db: call 0x1003869c0 ; 0x1003869c0
0x1003f48e0: mov qword ptr [rsp + 0x18], rbx
0x1003f48e5: mov rbx, qword ptr [rax]
0x1003f48e8: lea rsi, [rsp + 0x100]
0x1003f48f0: mov rdi, rax
0x1003f48f3: mov rdx, r13
0x1003f48f6: mov rcx, r12
0x1003f48f9: call qword ptr [rbx + 0x40]
0x1003f48fc: mov rdi, qword ptr [rsp + 0x18]
0x1003f4901: cmp byte ptr [rdi + 0x120], 0
0x1003f4908: je 0x1003f4931
0x1003f490a: mov rax, qword ptr [rip + 0x818fc7] ; 0x100c0d8d8
0x1003f4911: mov rax, qword ptr [rax]
0x1003f4914: cmp rax, qword ptr [rsp + 0x2c0]
0x1003f491c: jne 0x1003f5c1d
0x1003f4922: lea rsp, [rbp - 0x28]
0x1003f4926: pop rbx
0x1003f4927: pop r12
0x1003f4929: pop r13
0x1003f492b: pop r14
0x1003f492d: pop r15
0x1003f492f: pop rbp
0x1003f4930: ret 
0x1003f4931: mov qword ptr [rsp + 0xd8], r13
0x1003f4939: mov r13, qword ptr [rsp + 0x100]
0x1003f4941: cmp dword ptr [rdi + 0x264], 0
0x1003f4948: js 0x1003f4957
0x1003f494a: mov rax, qword ptr [rdi]
0x1003f494d: mov rsi, qword ptr [rdi + 0x230]
0x1003f4954: call qword ptr [rax + 0x18]
0x1003f4957: cmp r15d, 4
0x1003f495b: mov r12d, 4
0x1003f4961: cmovb r12d, r15d
0x1003f4965: lea rdi, [rsp + 0x1a0]
0x1003f496d: call 0x1007c2530 ; 0x1007c2530
0x1003f4972: mov rax, qword ptr [rsp + 0xd8]
0x1003f497a: mov rax, qword ptr [rax]
0x1003f497d: mov rbx, qword ptr [rax + 0x38]
0x1003f4981: test byte ptr [r14], 1
0x1003f4985: jne 0x1003f498c
0x1003f4987: inc r14
0x1003f498a: jmp 0x1003f4995 ; 0x1003f4995
0x1003f498c: mov rax, qword ptr [rsp + 0x18]
0x1003f4991: mov r14, qword ptr [rax + 0x20]
0x1003f4995: call 0x10040b090 ; 0x10040b090
0x1003f499a: mov rdi, rbx
0x1003f499d: mov rsi, rax
0x1003f49a0: mov rdx, r14
0x1003f49a3: call 0x1007c4360 ; 0x1007c4360
0x1003f49a8: test rax, rax
0x1003f49ab: je 0x1003f49bf
0x1003f49ad: lea rsi, [rsp + 0x1a0]
0x1003f49b5: mov rdi, rax
0x1003f49b8: call 0x1007c2310 ; 0x1007c2310
0x1003f49bd: jmp 0x1003f49d3 ; 0x1003f49d3
0x1003f49bf: call 0x10040b090 ; 0x10040b090
0x1003f49c4: mov rsi, qword ptr [rax + 8]
0x1003f49c8: mov rdi, rbx
0x1003f49cb: mov rdx, r14
0x1003f49ce: call 0x1007c4640 ; 0x1007c4640
0x1003f49d3: mov rax, qword ptr [rsp + 0x1a0]
0x1003f49db: test rax, rax
0x1003f49de: mov qword ptr [rsp + 0x48], r13
0x1003f49e3: je 0x1003f4a01
0x1003f49e5: mov rax, qword ptr [rax + 0x10]
0x1003f49e9: test rax, rax
0x1003f49ec: je 0x1003f4a01
0x1003f49ee: mov rcx, qword ptr [rax + 0x3a8]
0x1003f49f5: mov eax, dword ptr [rax + 0x3b8]
0x1003f49fb: mov dword ptr [rsp + 0x50], eax
0x1003f49ff: jmp 0x1003f4a0b ; 0x1003f4a0b
0x1003f4a01: xor ecx, ecx
0x1003f4a03: mov dword ptr [rsp + 0x50], 0
0x1003f4a0b: mov qword ptr [rsp + 0xf8], rcx
0x1003f4a13: mov r13d, r12d
0x1003f4a16: mov rax, qword ptr [rsp + 0x18]
0x1003f4a1b: mov r14d, dword ptr [rax + r13*4 + 0x250]
0x1003f4a23: mov edi, 0xc00000
0x1003f4a28: call 0x100aa28c4 ; 0x100aa28c4 _malloc
0x1003f4a2d: mov qword ptr [rsp + 0xe8], rax
0x1003f4a35: call 0x1007c6c20 ; 0x1007c6c20
0x1003f4a3a: lea rcx, [rip + 0x1c5410f] ; 0x102048b50
0x1003f4a41: mov rdx, qword ptr [rcx]
0x1003f4a44: mov ecx, 1
0x1003f4a49: mov rdi, rax
0x1003f4a4c: mov rsi, r14
0x1003f4a4f: call 0x100795530 ; 0x100795530
0x1003f4a54: mov r15, rax
0x1003f4a57: mov rbx, qword ptr [rsp + 0x18]
0x1003f4a5c: mov rax, qword ptr [rbx + 0x230]
0x1003f4a63: mov rdi, qword ptr [rax + 0x10]
0x1003f4a67: lea rsi, [rbx + 0x121]
0x1003f4a6e: mov edx, dword ptr [rbx + r13*4 + 0x23c]
0x1003f4a76: mov ecx, dword ptr [rbx + r13*4 + 0x250]
0x1003f4a7e: mov r8, r15
0x1003f4a81: call 0x1007f8ac0 ; 0x1007f8ac0
0x1003f4a86: mov edi, 1
0x1003f4a8b: mov r8d, 0xc00000
0x1003f4a91: mov rsi, r15
0x1003f4a94: mov rdx, qword ptr [rsp + 0xe8]
0x1003f4a9c: mov ecx, r14d
0x1003f4a9f: call 0x100780880 ; 0x100780880
0x1003f4aa4: mov r14d, eax
0x1003f4aa7: call 0x1007c6c20 ; 0x1007c6c20
0x1003f4aac: mov rdi, rax
0x1003f4aaf: mov rsi, r15
0x1003f4ab2: call 0x100795a70 ; 0x100795a70
0x1003f4ab7: lea rdi, [rsp + 0x70]
0x1003f4abc: xor esi, esi
0x1003f4abe: mov rdx, qword ptr [rsp + 0xe8]
0x1003f4ac6: mov ecx, r14d
0x1003f4ac9: call 0x100769c80 ; 0x100769c80
0x1003f4ace: lea r13, [rbx + 0xd0]
0x1003f4ad5: lea rdi, [rsp + 0x70]
0x1003f4ada: mov rsi, r13
0x1003f4add: call 0x10076a280 ; 0x10076a280
0x1003f4ae2: mov rdi, qword ptr [rbx + 0x30]
0x1003f4ae6: mov eax, dword ptr [rbx + 0xd0]
0x1003f4aec: shl rax, 4
0x1003f4af0: lea rsi, [rax + rax*2]
0x1003f4af4: mov rdx, qword ptr [rip + 0x93755d] ; 0x100d2c058
0x1003f4afb: mov ecx, 0x10
0x1003f4b00: call 0x100795530 ; 0x100795530
0x1003f4b05: mov r14, rax
0x1003f4b08: mov qword ptr [rbx + 0xe8], r14
0x1003f4b0f: cmp dword ptr [rbx + 0xd0], 0
0x1003f4b16: mov dword ptr [rsp + 0x24], r12d
0x1003f4b1b: je 0x1003f4f67
0x1003f4b21: xor r15d, r15d
0x1003f4b24: vxorps ymm0, ymm0, ymm0
0x1003f4b28: lea rdi, [rsp + 0x70]
0x1003f4b2d: mov qword ptr [rsp + 0xc0], r13
0x1003f4b35: jmp 0x1003f4b7b ; 0x1003f4b7b
0x1003f4b37: lea rdi, [rsp + 0x100]
0x1003f4b3f: call 0x1007c2570 ; 0x1007c2570
0x1003f4b44: mov r15, qword ptr [rsp + 0xc8]
0x1003f4b4c: inc r15
0x1003f4b4f: mov r13, qword ptr [rsp + 0xc0]
0x1003f4b57: cmp dword ptr [r13], r15d
0x1003f4b5b: mov rbx, qword ptr [rsp + 0x18]
0x1003f4b60: mov r12d, dword ptr [rsp + 0x24]
0x1003f4b65: jbe 0x1003f4f67
0x1003f4b6b: mov r14, qword ptr [rbx + 0xe8]
0x1003f4b72: vxorps ymm0, ymm0, ymm0
0x1003f4b76: lea rdi, [rsp + 0x70]
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
0x1003f4f67: lea r13, [rbx + 0xd4]
0x1003f4f6e: lea rdi, [rsp + 0x70]
0x1003f4f73: mov rsi, r13
0x1003f4f76: call 0x10076a280 ; 0x10076a280
0x1003f4f7b: mov rdi, qword ptr [rbx + 0x30]
0x1003f4f7f: mov eax, dword ptr [rbx + 0xd4]
0x1003f4f85: imul rsi, rax, 0xd0
0x1003f4f8c: mov rdx, qword ptr [rip + 0x937045] ; 0x100d2bfd8
0x1003f4f93: mov ecx, 0x10
0x1003f4f98: call 0x100795530 ; 0x100795530
0x1003f4f9d: mov qword ptr [rbx + 0xf0], rax
0x1003f4fa4: mov ecx, dword ptr [rbx + 0xd4]
0x1003f4faa: imul rsi, rcx, 0xd0
0x1003f4fb1: mov rdi, rax
0x1003f4fb4: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1003f4fb9: cmp dword ptr [rbx + 0xd4], 0
0x1003f4fc0: je 0x1003f5653
0x1003f4fc6: mov ecx, dword ptr [rsp + 0x50]
0x1003f4fca: mov rdx, qword ptr [rsp + 0xf8]
0x1003f4fd2: lea rax, [rdx + rcx*8]
0x1003f4fd6: mov qword ptr [rsp + 0xc0], rax
0x1003f4fde: cmp qword ptr [rsp + 0x48], 0
0x1003f4fe4: setne al
0x1003f4fe7: test rdx, rdx
0x1003f4fea: setne dl
0x1003f4fed: and dl, al
0x1003f4fef: mov byte ptr [rsp + 0xd0], dl
0x1003f4ff6: mov qword ptr [rsp + 0x50], rcx
0x1003f4ffb: shl rcx, 3
0x1003f4fff: mov qword ptr [rsp + 0xc8], rcx
0x1003f5007: xor eax, eax
0x1003f5009: mov qword ptr [rsp + 0x30], rax
0x1003f500e: lea r14, [rsp + 0x70]
0x1003f5013: lea rax, [rsp + 0x6c]
0x1003f5018: mov qword ptr [rsp + 0xb8], r13
0x1003f5020: mov rdi, r14
0x1003f5023: mov rsi, rax
0x1003f5026: call 0x10076a280 ; 0x10076a280
0x1003f502b: mov r15d, dword ptr [rsp + 0x6c]
0x1003f5030: cmp r15d, -1
0x1003f5034: setne al
0x1003f5037: and al, byte ptr [rsp + 0xd0]
0x1003f503e: cmp al, 1
0x1003f5040: jne 0x1003f50e3
0x1003f5046: mov rax, qword ptr [rsp + 0xf8]
0x1003f504e: mov r14, rax
0x1003f5051: cmp dword ptr [rsp + 0x50], 0
0x1003f5056: mov r13, rbx
0x1003f5059: je 0x1003f50ec
0x1003f505f: mov r12, qword ptr [rsp + 0xc8]
0x1003f5067: mov r14, rax
0x1003f506a: nop word ptr [rax + rax]
0x1003f5070: mov rax, qword ptr [r14]
0x1003f5073: mov qword ptr [rsp + 0x40], rax
0x1003f5078: call 0x1007abc10 ; 0x1007abc10
0x1003f507d: mov rbx, rax
0x1003f5080: mov qword ptr [rsp + 0x100], 0
0x1003f508c: call 0x1006aea90 ; 0x1006aea90
0x1003f5091: mov r8, qword ptr [rax]
0x1003f5094: mov rdi, rax
0x1003f5097: lea rsi, [rsp + 0x100]
0x1003f509f: lea rdx, [rsp + 0x40]
0x1003f50a4: mov rcx, rbx
0x1003f50a7: call qword ptr [r8 + 0x40]
0x1003f50ab: mov rax, qword ptr [rsp + 0x100]
0x1003f50b3: test rax, rax
0x1003f50b6: je 0x1003f50cd
0x1003f50b8: cmp dword ptr [rax + 4], r15d
0x1003f50bc: mov rbx, r13
0x1003f50bf: je 0x1003f50e7
0x1003f50c1: add r14, 8
0x1003f50c5: add r12, -8
0x1003f50c9: jne 0x1003f5070
0x1003f50cb: jmp 0x1003f50da ; 0x1003f50da
0x1003f50cd: mov rbx, r13
0x1003f50d0: add r14, 8
0x1003f50d4: add r12, -8
0x1003f50d8: jne 0x1003f5070
0x1003f50da: xor eax, eax
0x1003f50dc: mov r12d, dword ptr [rsp + 0x24]
0x1003f50e1: jmp 0x1003f5136 ; 0x1003f5136
0x1003f50e3: xor eax, eax
0x1003f50e5: jmp 0x1003f513b ; 0x1003f513b
0x1003f50e7: mov r12d, dword ptr [rsp + 0x24]
0x1003f50ec: cmp r14, qword ptr [rsp + 0xc0]
0x1003f50f4: je 0x1003f5134
0x1003f50f6: call 0x1007abc10 ; 0x1007abc10
0x1003f50fb: mov rbx, rax
0x1003f50fe: mov qword ptr [rsp + 0x100], 0
0x1003f510a: call 0x1006aea90 ; 0x1006aea90
0x1003f510f: mov r8, qword ptr [rax]
0x1003f5112: mov rdi, rax
0x1003f5115: lea rsi, [rsp + 0x100]
0x1003f511d: mov rdx, r14
0x1003f5120: mov rcx, rbx
0x1003f5123: call qword ptr [r8 + 0x40]
0x1003f5127: mov rax, qword ptr [rsp + 0x100]
0x1003f512f: mov rbx, r13
0x1003f5132: jmp 0x1003f5136 ; 0x1003f5136
0x1003f5134: xor eax, eax
0x1003f5136: lea r14, [rsp + 0x70]
0x1003f513b: mov rcx, qword ptr [rbx + 0xf0]
0x1003f5142: imul r15, qword ptr [rsp + 0x30], 0xd0
0x1003f514b: mov qword ptr [rcx + r15 + 0xb8], rax
0x1003f5153: lea rsi, [rcx + r15 + 0xc0]
0x1003f515b: mov rdi, r14
0x1003f515e: call 0x10076aae0 ; 0x10076aae0
0x1003f5163: mov rax, qword ptr [rbx + 0xf0]
0x1003f516a: lea rsi, [rax + r15 + 0xc1]
0x1003f5172: mov rdi, r14
0x1003f5175: call 0x10076aae0 ; 0x10076aae0
0x1003f517a: mov rsi, qword ptr [rbx + 0xf0]
0x1003f5181: test r12d, r12d
0x1003f5184: je 0x1003f518f
0x1003f5186: mov byte ptr [rsi + r15 + 0xc1], 1
0x1003f518f: add rsi, r15
0x1003f5192: mov rdi, r14
0x1003f5195: call 0x10076a360 ; 0x10076a360
0x1003f519a: mov rax, qword ptr [rbx + 0xf0]
0x1003f51a1: lea rsi, [rax + r15 + 0x10]
0x1003f51a6: mov rdi, r14
0x1003f51a9: call 0x10076a360 ; 0x10076a360
0x1003f51ae: mov rax, qword ptr [rbx + 0xf0]
0x1003f51b5: lea rsi, [rax + r15 + 0x20]
0x1003f51ba: mov rdi, r14
0x1003f51bd: call 0x10076a280 ; 0x10076a280
0x1003f51c2: mov rax, qword ptr [rbx + 0xf0]
0x1003f51c9: lea rsi, [rax + r15 + 0x24]
0x1003f51ce: mov rdi, r14
0x1003f51d1: call 0x10076a280 ; 0x10076a280
0x1003f51d6: mov rdi, qword ptr [rbx + 0x30]
0x1003f51da: mov rax, qword ptr [rbx + 0xf0]
0x1003f51e1: mov eax, dword ptr [rax + r15 + 0x20]
0x1003f51e6: shl rax, 2
0x1003f51ea: lea rsi, [rax + rax*8]
0x1003f51ee: mov rdx, qword ptr [rip + 0x936de3] ; 0x100d2bfd8
0x1003f51f5: mov ecx, 0x10
0x1003f51fa: call 0x100795530 ; 0x100795530
0x1003f51ff: mov r14, rbx
0x1003f5202: mov rbx, rax
0x1003f5205: mov rax, qword ptr [r14 + 0xf0]
0x1003f520c: mov eax, dword ptr [rax + r15 + 0x20]
0x1003f5211: shl eax, 2
0x1003f5214: lea edx, [rax + rax*8]
0x1003f5217: lea rdi, [rsp + 0x70]
0x1003f521c: mov rsi, rbx
0x1003f521f: call 0x10076a0a0 ; 0x10076a0a0
0x1003f5224: mov rax, qword ptr [r14 + 0xf0]
0x1003f522b: mov qword ptr [rax + r15 + 0x28], rbx
0x1003f5230: lea rsi, [rax + r15 + 0x38]
0x1003f5235: lea rdi, [rsp + 0x70]
0x1003f523a: call 0x10076a280 ; 0x10076a280
0x1003f523f: mov rdi, qword ptr [r14 + 0x30]
0x1003f5243: mov rax, qword ptr [r14 + 0xf0]
0x1003f524a: mov esi, dword ptr [rax + r15 + 0x38]
0x1003f524f: mov rdx, qword ptr [rip + 0x936d82] ; 0x100d2bfd8
0x1003f5256: mov ecx, 0x10
0x1003f525b: call 0x100795530 ; 0x100795530
0x1003f5260: mov rbx, rax
0x1003f5263: lea r12, [rsp + 0x70]
0x1003f5268: mov rax, qword ptr [r14 + 0xf0]
0x1003f526f: mov edx, dword ptr [rax + r15 + 0x38]
0x1003f5274: mov rdi, r12
0x1003f5277: mov rsi, rbx
0x1003f527a: call 0x10076a0a0 ; 0x10076a0a0
0x1003f527f: mov r13, r14
0x1003f5282: mov r13, qword ptr [r13 + 0xf0]
0x1003f5289: mov qword ptr [r13 + r15 + 0x40], rbx
0x1003f528e: lea rsi, [r13 + r15 + 0x50]
0x1003f5293: mov rdi, r12
0x1003f5296: call 0x10076a360 ; 0x10076a360
0x1003f529b: mov r14, r12
0x1003f529e: lea rsi, [r13 + r15 + 0x60]
0x1003f52a3: mov rdi, r14
0x1003f52a6: call 0x10076a360 ; 0x10076a360
0x1003f52ab: lea rsi, [r13 + r15 + 0x70]
0x1003f52b0: mov rdi, r14
0x1003f52b3: call 0x10076a2a0 ; 0x10076a2a0
0x1003f52b8: lea rsi, [r13 + r15 + 0x74]
0x1003f52bd: mov rdi, r14
0x1003f52c0: call 0x10076a280 ; 0x10076a280
0x1003f52c5: lea rsi, [r13 + r15 + 0x78]
0x1003f52ca: mov rdi, r14
0x1003f52cd: call 0x10076a280 ; 0x10076a280
0x1003f52d2: lea rsi, [r13 + r15 + 0x7c]
0x1003f52d7: mov rdi, r14
0x1003f52da: call 0x10076a280 ; 0x10076a280
0x1003f52df: lea rbx, [r13 + r15 + 0x80]
0x1003f52e7: mov rdi, r14
0x1003f52ea: mov rsi, rbx
0x1003f52ed: call 0x10076a280 ; 0x10076a280
0x1003f52f2: mov rax, qword ptr [rsp + 0x18]
0x1003f52f7: mov rdi, qword ptr [rax + 0x30]
0x1003f52fb: mov esi, dword ptr [rbx]
0x1003f52fd: shl rsi, 3
0x1003f5301: mov rdx, qword ptr [rip + 0x936cd0] ; 0x100d2bfd8
0x1003f5308: mov ecx, 0x10
0x1003f530d: call 0x100795530 ; 0x100795530
0x1003f5312: mov qword ptr [r13 + r15 + 0x88], rax
0x1003f531a: mov edx, dword ptr [rbx]
0x1003f531c: shl edx, 3
0x1003f531f: mov rdi, r14
0x1003f5322: mov rsi, rax
0x1003f5325: call 0x10076a0a0 ; 0x10076a0a0
0x1003f532a: mov qword ptr [rsp + 0x198], rbx
0x1003f5332: mov rax, qword ptr [rsp + 0x18]
0x1003f5337: mov rbx, qword ptr [rax + 0xf0]
0x1003f533e: lea rsi, [rbx + r15 + 0x90]
0x1003f5346: mov rdi, r14
0x1003f5349: mov qword ptr [rsp + 0x48], rsi
0x1003f534e: call 0x10076a280 ; 0x10076a280
0x1003f5353: lea rsi, [rbx + r15 + 0x94]
0x1003f535b: mov rdi, r14
0x1003f535e: mov r12, rsi
0x1003f5361: call 0x10076a280 ; 0x10076a280
0x1003f5366: lea rsi, [rbx + r15 + 0x98]
0x1003f536e: mov rdi, r14
0x1003f5371: mov qword ptr [rsp + 0x28], rsi
0x1003f5376: call 0x10076a280 ; 0x10076a280
0x1003f537b: mov rax, qword ptr [rsp + 0x18]
0x1003f5380: mov rdi, qword ptr [rax + 0x30]
0x1003f5384: mov rax, qword ptr [rsp + 0x48]
0x1003f5389: mov esi, dword ptr [rax]
0x1003f538b: shl rsi, 2
0x1003f538f: mov rdx, qword ptr [rip + 0x936c42] ; 0x100d2bfd8
0x1003f5396: mov ecx, 0x10
0x1003f539b: call 0x100795530 ; 0x100795530
0x1003f53a0: mov qword ptr [rbx + r15 + 0xb0], rax
0x1003f53a8: mov rax, qword ptr [rsp + 0x18]
0x1003f53ad: mov rdi, qword ptr [rax + 0x30]
0x1003f53b1: mov esi, dword ptr [r12]
0x1003f53b5: shl rsi, 2
0x1003f53b9: mov rdx, qword ptr [rip + 0x936c18] ; 0x100d2bfd8
0x1003f53c0: mov ecx, 0x10
0x1003f53c5: call 0x100795530 ; 0x100795530
0x1003f53ca: mov qword ptr [rbx + r15 + 0xa0], rax
0x1003f53d2: mov rax, qword ptr [rsp + 0x18]
0x1003f53d7: mov rdi, qword ptr [rax + 0x30]
0x1003f53db: mov rax, qword ptr [rsp + 0x28]
0x1003f53e0: mov esi, dword ptr [rax]
0x1003f53e2: add rsi, rsi
0x1003f53e5: mov rdx, qword ptr [rip + 0x936bec] ; 0x100d2bfd8
0x1003f53ec: mov ecx, 0x10
0x1003f53f1: call 0x100795530 ; 0x100795530
0x1003f53f6: lea rcx, [rbx + r15 + 0xa0]
0x1003f53fe: mov qword ptr [rbx + r15 + 0xa8], rax
0x1003f5406: mov qword ptr [rsp + 0x60], rcx
0x1003f540b: mov rsi, qword ptr [rcx]
0x1003f540e: mov edx, dword ptr [r12]
0x1003f5412: shl edx, 2
0x1003f5415: mov rdi, r14
0x1003f5418: call 0x10076a0a0 ; 0x10076a0a0
0x1003f541d: lea rax, [rbx + r15 + 0xa8]
0x1003f5425: mov qword ptr [rsp + 0x58], rax
0x1003f542a: mov rsi, qword ptr [rax]
0x1003f542d: mov rax, qword ptr [rsp + 0x28]
0x1003f5432: mov edx, dword ptr [rax]
0x1003f5434: add edx, edx
0x1003f5436: mov rdi, r14
0x1003f5439: call 0x10076a0a0 ; 0x10076a0a0
0x1003f543e: lea rax, [rbx + r15 + 0xb0]
0x1003f5446: mov qword ptr [rsp + 0x38], rax
0x1003f544b: mov rsi, qword ptr [rax]
0x1003f544e: mov rax, qword ptr [rsp + 0x48]
0x1003f5453: mov edx, dword ptr [rax]
0x1003f5455: shl edx, 2
0x1003f5458: mov rdi, r14
0x1003f545b: call 0x10076a0a0 ; 0x10076a0a0
0x1003f5460: mov rax, qword ptr [rsp + 0x18]
0x1003f5465: mov rdi, qword ptr [rax + 0x30]
0x1003f5469: mov rax, qword ptr [rax + 0xf0]
0x1003f5470: mov esi, dword ptr [rax + r15 + 0x24]
0x1003f5475: add rsi, rsi
0x1003f5478: cmp dword ptr [r12], 0
0x1003f547d: mov rdx, qword ptr [rip + 0x936b54] ; 0x100d2bfd8
0x1003f5484: je 0x1003f55ef
0x1003f548a: mov rbx, qword ptr [rsp + 0x198]
0x1003f5492: mov ecx, 0x10
0x1003f5497: call 0x100795530 ; 0x100795530
0x1003f549c: mov r12, rax
0x1003f549f: mov rax, qword ptr [rsp + 0x28]
0x1003f54a4: mov ecx, dword ptr [rax]
0x1003f54a6: mov rax, qword ptr [rsp + 0x18]
0x1003f54ab: mov rax, qword ptr [rax + 0xf0]
0x1003f54b2: mov qword ptr [rsp + 0x48], rax
0x1003f54b7: mov dword ptr [rsp + 0xf4], ecx
0x1003f54be: cmp ecx, dword ptr [rax + r15 + 0x24]
0x1003f54c3: jne 0x1003f5c94
0x1003f54c9: mov r10d, dword ptr [rbx]
0x1003f54cc: test r10d, r10d
0x1003f54cf: je 0x1003f55d6
0x1003f54d5: lea rax, [r13 + r15 + 0x88]
0x1003f54dd: mov rax, qword ptr [rax]
0x1003f54e0: mov qword ptr [rsp + 0x28], rax
0x1003f54e5: xor ecx, ecx
0x1003f54e7: xor edi, edi
0x1003f54e9: xor r9d, r9d
0x1003f54ec: nop dword ptr [rax]
0x1003f54f0: mov r11d, ecx
0x1003f54f3: mov rax, qword ptr [rsp + 0x28]
0x1003f54f8: mov r8d, dword ptr [rax + r11*8]
0x1003f54fc: test r8d, r8d
0x1003f54ff: je 0x1003f55bd
0x1003f5505: mov rax, qword ptr [rsp + 0x58]
0x1003f550a: mov rsi, qword ptr [rax]
0x1003f550d: mov rax, qword ptr [rsp + 0x60]
0x1003f5512: mov rcx, qword ptr [rax]
0x1003f5515: mov r14d, r8d
0x1003f5518: and r14d, 1
0x1003f551c: cmp r8d, 1
0x1003f5520: je 0x1003f5583
0x1003f5522: mov r13d, r14d
0x1003f5525: sub r13d, r8d
0x1003f5528: nop dword ptr [rax + rax]
0x1003f5530: mov ebx, edi
0x1003f5532: movzx eax, word ptr [rsi + rbx*2]
0x1003f5536: mov edx, eax
0x1003f5538: shr edx, 1
0x1003f553a: add edx, r9d
0x1003f553d: test al, 1
0x1003f553f: lea rax, [rcx + rdx*4]
0x1003f5543: lea rdx, [rcx + rdx*4 + 2]
0x1003f5548: cmove rdx, rax
0x1003f554c: movzx eax, word ptr [rdx]
0x1003f554f: mov word ptr [r12 + rbx*2], ax
0x1003f5554: lea eax, [rdi + 1]
0x1003f5557: movzx edx, word ptr [rsi + rax*2]
0x1003f555b: mov ebx, edx
0x1003f555d: shr ebx, 1
0x1003f555f: add ebx, r9d
0x1003f5562: test dl, 1
0x1003f5565: lea rdx, [rcx + rbx*4]
0x1003f5569: lea rbx, [rcx + rbx*4 + 2]
0x1003f556e: cmove rbx, rdx
0x1003f5572: movzx edx, word ptr [rbx]
0x1003f5575: mov word ptr [r12 + rax*2], dx
0x1003f557a: add edi, 2
0x1003f557d: add r13d, 2
0x1003f5581: jne 0x1003f5530
0x1003f5583: test r14d, r14d
0x1003f5586: lea r14, [rsp + 0x70]
0x1003f558b: je 0x1003f55bd
0x1003f558d: mov r8d, edi
0x1003f5590: movzx r14d, word ptr [rsi + r8*2]
0x1003f5595: mov esi, r14d
0x1003f5598: shr esi, 1
0x1003f559a: add esi, r9d
0x1003f559d: test r14b, 1
0x1003f55a1: lea r14, [rcx + rsi*4]
0x1003f55a5: lea rcx, [rcx + rsi*4 + 2]
0x1003f55aa: cmove rcx, r14
0x1003f55ae: lea r14, [rsp + 0x70]
0x1003f55b3: movzx ecx, word ptr [rcx]
0x1003f55b6: mov word ptr [r12 + r8*2], cx
0x1003f55bb: inc edi
0x1003f55bd: mov rax, qword ptr [rsp + 0x38]
0x1003f55c2: mov rcx, qword ptr [rax]
0x1003f55c5: add r9d, dword ptr [rcx + r11*4]
0x1003f55c9: lea ecx, [r11 + 1]
0x1003f55cd: cmp ecx, r10d
0x1003f55d0: jb 0x1003f54f0
0x1003f55d6: cmp dword ptr [rsp + 0xf4], 0
0x1003f55de: mov rbx, qword ptr [rsp + 0x18]
0x1003f55e3: mov rdx, qword ptr [rsp + 0x48]
0x1003f55e8: jne 0x1003f5621
0x1003f55ea: jmp 0x1003f5cb3 ; 0x1003f5cb3
0x1003f55ef: mov ecx, 0x10
0x1003f55f4: call 0x100795530 ; 0x100795530
0x1003f55f9: mov r12, rax
0x1003f55fc: mov rbx, qword ptr [rsp + 0x18]
0x1003f5601: mov rax, qword ptr [rbx + 0xf0]
0x1003f5608: mov edx, dword ptr [rax + r15 + 0x24]
0x1003f560d: add edx, edx
0x1003f560f: mov rdi, r14
0x1003f5612: mov rsi, r12
0x1003f5615: call 0x10076a0a0 ; 0x10076a0a0
0x1003f561a: mov rdx, qword ptr [rbx + 0xf0]
0x1003f5621: mov qword ptr [rdx + r15 + 0x30], r12
0x1003f5626: mov rax, qword ptr [rsp + 0x30]
0x1003f562b: inc rax
0x1003f562e: mov r13, qword ptr [rsp + 0xb8]
0x1003f5636: mov esi, dword ptr [r13]
0x1003f563a: mov qword ptr [rsp + 0x30], rax
0x1003f563f: cmp esi, eax
0x1003f5641: mov r12d, dword ptr [rsp + 0x24]
0x1003f5646: lea rax, [rsp + 0x6c]
0x1003f564b: ja 0x1003f5020
0x1003f5651: jmp 0x1003f565c ; 0x1003f565c
0x1003f5653: mov rdx, qword ptr [rbx + 0xf0]
0x1003f565a: xor esi, esi
0x1003f565c: mov rax, qword ptr [rsp + 0xe0]
0x1003f5664: mov rdi, qword ptr [rax + 0x328]
0x1003f566b: call 0x1006aa070 ; 0x1006aa070
0x1003f5670: mov rax, qword ptr [rsp + 0xe0]
0x1003f5678: mov rdi, qword ptr [rax + 0x3b0]
0x1003f567f: mov esi, dword ptr [rbx + 0xd4]
0x1003f5685: mov rdx, qword ptr [rbx + 0xf0]
0x1003f568c: mov rcx, qword ptr [rax + 0x138]
0x1003f5693: call 0x10034fb10 ; 0x10034fb10
0x1003f5698: mov r15, rbx
0x1003f569b: cmp dword ptr [r13], 0
0x1003f56a0: je 0x1003f5730
0x1003f56a6: xor r14d, r14d
0x1003f56a9: mov r12d, 0x50
0x1003f56af: nop 
0x1003f56b0: mov rbx, r15
0x1003f56b3: mov rdi, qword ptr [rbx + 0x30]
0x1003f56b7: mov rax, qword ptr [rbx + 0xf0]
0x1003f56be: mov rsi, qword ptr [rax + r12 - 0x28]
0x1003f56c3: call 0x100795a70 ; 0x100795a70
0x1003f56c8: mov rax, qword ptr [rbx + 0xf0]
0x1003f56cf: mov qword ptr [rax + r12 - 0x28], 0
0x1003f56d8: mov rdi, qword ptr [rbx + 0x30]
0x1003f56dc: mov rsi, qword ptr [rax + r12 - 0x20]
0x1003f56e1: call 0x100795a70 ; 0x100795a70
0x1003f56e6: mov rax, qword ptr [rbx + 0xf0]
0x1003f56ed: mov qword ptr [rax + r12 - 0x20], 0
0x1003f56f6: mov rdi, qword ptr [rbx + 0x30]
0x1003f56fa: mov rsi, qword ptr [rax + r12 - 0x10]
0x1003f56ff: call 0x100795a70 ; 0x100795a70
0x1003f5704: mov rdi, qword ptr [rbx + 0xf0]
0x1003f570b: mov qword ptr [rdi + r12 - 0x10], 0
0x1003f5714: add rdi, r12
0x1003f5717: mov rsi, qword ptr [rbx + 0x30]
0x1003f571b: call 0x1006b9bf0 ; 0x1006b9bf0
0x1003f5720: add r12, 0xd0
0x1003f5727: inc r14d
0x1003f572a: cmp dword ptr [r13], r14d
0x1003f572e: ja 0x1003f56b0
0x1003f5730: lea rdi, [rsp + 0x70]
0x1003f5735: lea rsi, [rsp + 0x40]
0x1003f573a: call 0x10076a280 ; 0x10076a280
0x1003f573f: mov r13, r15
0x1003f5742: cmp dword ptr [rsp + 0x40], 0
0x1003f5747: je 0x1003f59c2
0x1003f574d: vxorps ymm0, ymm0, ymm0
0x1003f5751: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1003f575a: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x1003f5763: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x1003f576c: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x1003f5775: lea rdi, [rsp + 0x70]
0x1003f577a: lea rsi, [rsp + 0x100]
0x1003f5782: mov edx, 0xc
0x1003f5787: vzeroupper 
0x1003f578a: call 0x10076a0a0 ; 0x10076a0a0
0x1003f578f: lea rsi, [rsp + 0x10c]
0x1003f5797: lea rdi, [rsp + 0x70]
0x1003f579c: mov edx, 0xc
0x1003f57a1: call 0x10076a0a0 ; 0x10076a0a0
0x1003f57a6: mov r13d, dword ptr [rsp + 0x10c]
0x1003f57ae: mov ebx, dword ptr [rsp + 0x110]
0x1003f57b5: mov r14d, dword ptr [rsp + 0x114]
0x1003f57bd: lea r15, [rsp + 0x78]
0x1003f57c2: mov r12, qword ptr [rsp + 0x80]
0x1003f57ca: mov rdi, r15
0x1003f57cd: call 0x100769850 ; 0x100769850
0x1003f57d2: imul ebx, r13d
0x1003f57d6: imul ebx, r14d
0x1003f57da: cdqe 
0x1003f57dc: add r12, rax
0x1003f57df: mov qword ptr [rsp + 0x118], r12
0x1003f57e7: lea rdi, [rsp + 0x70]
0x1003f57ec: mov esi, ebx
0x1003f57ee: call 0x100769ec0 ; 0x100769ec0
0x1003f57f3: lea rsi, [rsp + 0x120]
0x1003f57fb: lea rdi, [rsp + 0x70]
0x1003f5800: call 0x10076a280 ; 0x10076a280
0x1003f5805: mov rbx, qword ptr [rsp + 0x80]
0x1003f580d: mov rdi, r15
0x1003f5810: call 0x100769850 ; 0x100769850
0x1003f5815: cdqe 
0x1003f5817: add rbx, rax
0x1003f581a: mov qword ptr [rsp + 0x128], rbx
0x1003f5822: mov eax, dword ptr [rsp + 0x120]
0x1003f5829: add eax, eax
0x1003f582b: lea esi, [rax + rax*2]
0x1003f582e: lea rdi, [rsp + 0x70]
0x1003f5833: call 0x100769ec0 ; 0x100769ec0
0x1003f5838: lea rsi, [rsp + 0x130]
0x1003f5840: lea rdi, [rsp + 0x70]
0x1003f5845: call 0x10076a280 ; 0x10076a280
0x1003f584a: lea rsi, [rsp + 0x134]
0x1003f5852: lea rdi, [rsp + 0x70]
0x1003f5857: call 0x10076a280 ; 0x10076a280
0x1003f585c: lea rsi, [rsp + 0x138]
0x1003f5864: lea rdi, [rsp + 0x70]
0x1003f5869: call 0x10076a280 ; 0x10076a280
0x1003f586e: mov rbx, qword ptr [rsp + 0x80]
0x1003f5876: mov rdi, r15
0x1003f5879: call 0x100769850 ; 0x100769850
0x1003f587e: cdqe 
0x1003f5880: add rbx, rax
0x1003f5883: mov qword ptr [rsp + 0x140], rbx
0x1003f588b: mov esi, dword ptr [rsp + 0x130]
0x1003f5892: lea rdi, [rsp + 0x70]
0x1003f5897: call 0x100769ec0 ; 0x100769ec0
0x1003f589c: mov rbx, qword ptr [rsp + 0x80]
0x1003f58a4: mov rdi, r15
0x1003f58a7: call 0x100769850 ; 0x100769850
0x1003f58ac: cdqe 
0x1003f58ae: add rbx, rax
0x1003f58b1: mov qword ptr [rsp + 0x148], rbx
0x1003f58b9: mov esi, dword ptr [rsp + 0x134]
0x1003f58c0: lea rdi, [rsp + 0x70]
0x1003f58c5: call 0x100769ec0 ; 0x100769ec0
0x1003f58ca: mov rbx, qword ptr [rsp + 0x80]
0x1003f58d2: mov rdi, r15
0x1003f58d5: call 0x100769850 ; 0x100769850
0x1003f58da: cdqe 
0x1003f58dc: add rbx, rax
0x1003f58df: mov qword ptr [rsp + 0x150], rbx
0x1003f58e7: mov esi, dword ptr [rsp + 0x138]
0x1003f58ee: lea rdi, [rsp + 0x70]
0x1003f58f3: call 0x100769ec0 ; 0x100769ec0
0x1003f58f8: lea rsi, [rsp + 0x158]
0x1003f5900: lea rdi, [rsp + 0x70]
0x1003f5905: call 0x10076a2a0 ; 0x10076a2a0
0x1003f590a: lea rsi, [rsp + 0x15c]
0x1003f5912: lea rdi, [rsp + 0x70]
0x1003f5917: call 0x10076a280 ; 0x10076a280
0x1003f591c: lea rsi, [rsp + 0x160]
0x1003f5924: lea rdi, [rsp + 0x70]
0x1003f5929: call 0x10076a280 ; 0x10076a280
0x1003f592e: lea rsi, [rsp + 0x164]
0x1003f5936: lea rdi, [rsp + 0x70]
0x1003f593b: call 0x10076a280 ; 0x10076a280
0x1003f5940: lea rsi, [rsp + 0x168]
0x1003f5948: lea rdi, [rsp + 0x70]
0x1003f594d: call 0x10076a280 ; 0x10076a280
0x1003f5952: mov rbx, qword ptr [rsp + 0x80]
0x1003f595a: mov rdi, r15
0x1003f595d: call 0x100769850 ; 0x100769850
0x1003f5962: cdqe 
0x1003f5964: add rbx, rax
0x1003f5967: mov qword ptr [rsp + 0x170], rbx
0x1003f596f: mov esi, dword ptr [rsp + 0x164]
0x1003f5976: shl esi, 4
0x1003f5979: lea rdi, [rsp + 0x70]
0x1003f597e: call 0x100769ec0 ; 0x100769ec0
0x1003f5983: mov rbx, qword ptr [rsp + 0x80]
0x1003f598b: mov rdi, r15
0x1003f598e: call 0x100769850 ; 0x100769850
0x1003f5993: cdqe 
0x1003f5995: add rbx, rax
0x1003f5998: mov qword ptr [rsp + 0x178], rbx
0x1003f59a0: mov esi, dword ptr [rsp + 0x168]
0x1003f59a7: add esi, esi
0x1003f59a9: lea rdi, [rsp + 0x70]
0x1003f59ae: call 0x100769ec0 ; 0x100769ec0
0x1003f59b3: mov r13, qword ptr [rsp + 0x18]
0x1003f59b8: lea rsi, [rsp + 0x100]
0x1003f59c0: jmp 0x1003f59c4 ; 0x1003f59c4
0x1003f59c2: xor esi, esi
0x1003f59c4: mov rbx, qword ptr [rsp + 0xe0]
0x1003f59cc: mov rdi, qword ptr [rbx + 0x3b8]
0x1003f59d3: mov rax, qword ptr [rsp + 0xd8]
0x1003f59db: mov rax, qword ptr [rax]
0x1003f59de: mov rdx, qword ptr [rax + 0x38]
0x1003f59e2: mov rcx, qword ptr [rbx + 0x148]
0x1003f59e9: mov r8, qword ptr [rbx + 0xe8]
0x1003f59f0: mov r9, qword ptr [rbx + 0x138]
0x1003f59f7: call 0x1002129f0 ; 0x1002129f0
0x1003f59fc: lea rsi, [r13 + 0xd8]
0x1003f5a03: lea rdi, [rsp + 0x70]
0x1003f5a08: mov qword ptr [rsp + 0x38], rsi
0x1003f5a0d: call 0x10076a280 ; 0x10076a280
0x1003f5a12: mov rdi, qword ptr [r13 + 0x30]
0x1003f5a16: mov esi, dword ptr [r13 + 0xd8]
0x1003f5a1d: shl rsi, 5
0x1003f5a21: mov rdx, qword ptr [rip + 0x9365d0] ; 0x100d2bff8
0x1003f5a28: mov ecx, 0x10
0x1003f5a2d: call 0x100795530 ; 0x100795530
0x1003f5a32: mov r12, rax
0x1003f5a35: mov qword ptr [r13 + 0xf8], r12
0x1003f5a3c: cmp dword ptr [r13 + 0xd8], 0
0x1003f5a44: je 0x1003f5b09
0x1003f5a4a: xor r14d, r14d
0x1003f5a4d: lea r15, [rsp + 0x70]
0x1003f5a52: jmp 0x1003f5a5b ; 0x1003f5a5b
0x1003f5a54: mov r12, qword ptr [r13 + 0xf8]
0x1003f5a5b: mov r14d, r14d
0x1003f5a5e: mov r13, r14
0x1003f5a61: shl r13, 5
0x1003f5a65: lea rbx, [r12 + r13]
0x1003f5a69: mov rdi, r15
0x1003f5a6c: mov rsi, rbx
0x1003f5a6f: call 0x10076a280 ; 0x10076a280
0x1003f5a74: mov rax, qword ptr [rsp + 0x18]
0x1003f5a79: mov rdi, qword ptr [rax + 0x30]
0x1003f5a7d: mov eax, dword ptr [rbx]
0x1003f5a7f: shl rax, 3
0x1003f5a83: lea rsi, [rax + rax*4]
0x1003f5a87: mov rdx, qword ptr [rip + 0x93656a] ; 0x100d2bff8
0x1003f5a8e: mov ecx, 0x10
0x1003f5a93: call 0x100795530 ; 0x100795530
0x1003f5a98: mov qword ptr [r12 + r13 + 8], rax
0x1003f5a9d: mov ecx, dword ptr [rbx]
0x1003f5a9f: shl ecx, 3
0x1003f5aa2: lea edx, [rcx + rcx*4]
0x1003f5aa5: mov rdi, r15
0x1003f5aa8: mov rsi, rax
0x1003f5aab: call 0x10076a0a0 ; 0x10076a0a0
0x1003f5ab0: lea rbx, [r12 + r13 + 0x10]
0x1003f5ab5: mov rdi, r15
0x1003f5ab8: mov rsi, rbx
0x1003f5abb: call 0x10076a280 ; 0x10076a280
0x1003f5ac0: mov rax, qword ptr [rsp + 0x18]
0x1003f5ac5: mov rdi, qword ptr [rax + 0x30]
0x1003f5ac9: mov esi, dword ptr [rbx]
0x1003f5acb: add rsi, rsi
0x1003f5ace: mov rdx, qword ptr [rip + 0x936523] ; 0x100d2bff8
0x1003f5ad5: mov ecx, 0x10
0x1003f5ada: call 0x100795530 ; 0x100795530
0x1003f5adf: mov qword ptr [r12 + r13 + 0x18], rax
0x1003f5ae4: mov edx, dword ptr [rbx]
0x1003f5ae6: add edx, edx
0x1003f5ae8: mov rdi, r15
0x1003f5aeb: mov rsi, rax
0x1003f5aee: call 0x10076a0a0 ; 0x10076a0a0
0x1003f5af3: inc r14d
0x1003f5af6: mov rax, qword ptr [rsp + 0x38]
0x1003f5afb: cmp r14d, dword ptr [rax]
0x1003f5afe: mov r13, qword ptr [rsp + 0x18]
0x1003f5b03: jb 0x1003f5a54
0x1003f5b09: lea rsi, [r13 + 0xdc]
0x1003f5b10: lea rdi, [rsp + 0x70]
0x1003f5b15: call 0x10076a280 ; 0x10076a280
0x1003f5b1a: mov rdi, qword ptr [r13 + 0x30]
0x1003f5b1e: mov eax, dword ptr [r13 + 0xdc]
0x1003f5b25: shl rax, 3
0x1003f5b29: lea rsi, [rax + rax*2]
0x1003f5b2d: mov rdx, qword ptr [rip + 0x9364e4] ; 0x100d2c018
0x1003f5b34: mov ecx, 0x10
0x1003f5b39: call 0x100795530 ; 0x100795530
0x1003f5b3e: mov qword ptr [r13 + 0x100], rax
0x1003f5b45: cmp dword ptr [r13 + 0xdc], 0
0x1003f5b4d: je 0x1003f5bf3
0x1003f5b53: lea rdi, [rsp + 0x70]
0x1003f5b58: mov rsi, rax
0x1003f5b5b: call 0x10076a280 ; 0x10076a280
0x1003f5b60: mov rsi, qword ptr [r13 + 0x100]
0x1003f5b67: add rsi, 4
0x1003f5b6b: lea rdi, [rsp + 0x70]
0x1003f5b70: call 0x10076a280 ; 0x10076a280
0x1003f5b75: mov rdi, qword ptr [r13 + 0x30]
0x1003f5b79: mov rax, qword ptr [r13 + 0x100]
0x1003f5b80: mov esi, dword ptr [rax]
0x1003f5b82: shl rsi, 4
0x1003f5b86: mov rdx, qword ptr [rip + 0x93648b] ; 0x100d2c018
0x1003f5b8d: mov ecx, 0x10
0x1003f5b92: call 0x100795530 ; 0x100795530
0x1003f5b97: mov rcx, qword ptr [r13 + 0x100]
0x1003f5b9e: mov qword ptr [rcx + 8], rax
0x1003f5ba2: mov edx, dword ptr [rcx]
0x1003f5ba4: shl edx, 4
0x1003f5ba7: lea rdi, [rsp + 0x70]
0x1003f5bac: mov rsi, rax
0x1003f5baf: call 0x10076a0a0 ; 0x10076a0a0
0x1003f5bb4: mov rdi, qword ptr [r13 + 0x30]
0x1003f5bb8: mov rax, qword ptr [r13 + 0x100]
0x1003f5bbf: mov esi, dword ptr [rax + 4]
0x1003f5bc2: add rsi, rsi
0x1003f5bc5: mov rdx, qword ptr [rip + 0x93644c] ; 0x100d2c018
0x1003f5bcc: mov ecx, 0x10
0x1003f5bd1: call 0x100795530 ; 0x100795530
0x1003f5bd6: mov rcx, qword ptr [r13 + 0x100]
0x1003f5bdd: mov qword ptr [rcx + 0x10], rax
0x1003f5be1: mov edx, dword ptr [rcx + 4]
0x1003f5be4: add edx, edx
0x1003f5be6: lea rdi, [rsp + 0x70]
0x1003f5beb: mov rsi, rax
0x1003f5bee: call 0x10076a0a0 ; 0x10076a0a0
0x1003f5bf3: mov rdi, qword ptr [rsp + 0xe8]
0x1003f5bfb: call 0x100aa2768 ; 0x100aa2768 _free
0x1003f5c00: mov eax, dword ptr [rsp + 0x24]
0x1003f5c04: mov dword ptr [r13 + 0x264], eax
0x1003f5c0b: lea rdi, [rsp + 0x1a0]
0x1003f5c13: call 0x1007c2570 ; 0x1007c2570
0x1003f5c18: jmp 0x1003f490a ; 0x1003f490a
0x1003f5c1d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1003f5c22: lea rdi, [rip + 0x791151] ; 0x100b86d7a game
0x1003f5c29: lea rsi, [rip + 0x790edb] ; 0x100b86b0b LevelData.cpp
0x1003f5c30: lea r8, [rip + 0x791148] ; 0x100b86d7f This path is no longer supported
0x1003f5c37: mov edx, 0x257
0x1003f5c3c: mov ecx, 4
0x1003f5c41: xor eax, eax
0x1003f5c43: call 0x1007e6030 ; 0x1007e6030
0x1003f5c48: ud2 
0x1003f5c4a: lea rdi, [rip + 0x79114f] ; 0x100b86da0 lod < m_fileLodCount
0x1003f5c51: lea rsi, [rip + 0x790eb3] ; 0x100b86b0b LevelData.cpp
0x1003f5c58: lea r8, [rip + 0x791156] ; 0x100b86db5 Level did not bake LOD %u
0x1003f5c5f: mov edx, 0x258
0x1003f5c64: mov ecx, 4
0x1003f5c69: xor eax, eax
0x1003f5c6b: mov r9d, r15d
0x1003f5c6e: call 0x1007e6030 ; 0x1007e6030
0x1003f5c73: ud2 
0x1003f5c75: lea rdi, [rip + 0x7701e9] ; 0x100b65e65 Observed()
0x1003f5c7c: lea rsi, [rip + 0x7701ed] ; 0x100b65e70 ./Mesh.h
0x1003f5c83: mov edx, 0x6d
0x1003f5c88: mov ecx, 3
0x1003f5c8d: call 0x1007e5f70 ; 0x1007e5f70
0x1003f5c92: jmp 0x1003f5cd0 ; 0x1003f5cd0
0x1003f5c94: lea rdi, [rip + 0x791145] ; 0x100b86de0 tessData.triangleEdgeCount == m_terrainMeshes[ i ].indexCount
0x1003f5c9b: lea rsi, [rip + 0x790e69] ; 0x100b86b0b LevelData.cpp
0x1003f5ca2: mov edx, 0x313
0x1003f5ca7: mov ecx, 3
0x1003f5cac: call 0x1007e5f70 ; 0x1007e5f70
0x1003f5cb1: jmp 0x1003f5cd0 ; 0x1003f5cd0
0x1003f5cb3: lea rdi, [rip + 0x791164] ; 0x100b86e1e indexCount = m_terrainMeshes[ i ].indexCount
0x1003f5cba: lea rsi, [rip + 0x790e4a] ; 0x100b86b0b LevelData.cpp
0x1003f5cc1: mov edx, 0x324
0x1003f5cc6: mov ecx, 3
0x1003f5ccb: call 0x1007e5f70 ; 0x1007e5f70
0x1003f5cd0: ud2 
0x1003f5cd2: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5cd7: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5cdc: jmp 0x1003f5dc8 ; 0x1003f5dc8
0x1003f5ce1: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5ce6: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5ceb: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5cf0: mov rdi, rax
0x1003f5cf3: call 0x100011bf0 ; 0x100011bf0
0x1003f5cf8: mov r14, rax
0x1003f5cfb: call 0x1007c6c20 ; 0x1007c6c20
0x1003f5d00: mov rdi, rax
0x1003f5d03: mov rsi, r15
0x1003f5d06: call 0x100795a70 ; 0x100795a70
0x1003f5d0b: jmp 0x1003f5dd8 ; 0x1003f5dd8
0x1003f5d10: mov rdi, rax
0x1003f5d13: call 0x100011bf0 ; 0x100011bf0
0x1003f5d18: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d1d: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d22: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d27: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d2c: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d31: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d36: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d3b: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d40: mov rdi, rax
0x1003f5d43: call 0x100011bf0 ; 0x100011bf0
0x1003f5d48: jmp 0x1003f5dc8 ; 0x1003f5dc8
0x1003f5d4a: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d4c: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d4e: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d50: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d52: mov rdi, rax
0x1003f5d55: call 0x100011bf0 ; 0x100011bf0
0x1003f5d5a: mov rdi, rax
0x1003f5d5d: call 0x100011bf0 ; 0x100011bf0
0x1003f5d62: mov r14, rax
0x1003f5d65: call 0x1007c6c20 ; 0x1007c6c20
0x1003f5d6a: mov rdi, rax
0x1003f5d6d: mov rsi, r15
0x1003f5d70: call 0x100795a70 ; 0x100795a70
0x1003f5d75: jmp 0x1003f5dcb ; 0x1003f5dcb
0x1003f5d77: mov rdi, rax
0x1003f5d7a: call 0x100011bf0 ; 0x100011bf0
0x1003f5d7f: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5d81: mov r14, rax
0x1003f5d84: call 0x1007c6c20 ; 0x1007c6c20
0x1003f5d89: mov rdi, rax
0x1003f5d8c: mov rsi, r12
0x1003f5d8f: call 0x100795a70 ; 0x100795a70
0x1003f5d94: jmp 0x1003f5da1 ; 0x1003f5da1
0x1003f5d96: mov rdi, rax
0x1003f5d99: call 0x100011bf0 ; 0x100011bf0
0x1003f5d9e: mov r14, rax
0x1003f5da1: call 0x1007c6c20 ; 0x1007c6c20
0x1003f5da6: mov rdi, rax
0x1003f5da9: mov rsi, r15
0x1003f5dac: call 0x100795a70 ; 0x100795a70
0x1003f5db1: jmp 0x1003f5dcb ; 0x1003f5dcb
0x1003f5db3: mov rdi, rax
0x1003f5db6: call 0x100011bf0 ; 0x100011bf0
0x1003f5dbb: jmp 0x1003f5dc8 ; 0x1003f5dc8
0x1003f5dbd: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5dbf: jmp 0x1003f5dc1 ; 0x1003f5dc1
0x1003f5dc1: mov r14, rax
0x1003f5dc4: jmp 0x1003f5dd8 ; 0x1003f5dd8
0x1003f5dc6: jmp 0x1003f5dc8 ; 0x1003f5dc8
0x1003f5dc8: mov r14, rax
0x1003f5dcb: lea rdi, [rsp + 0x100]
0x1003f5dd3: call 0x1007c2570 ; 0x1007c2570
0x1003f5dd8: lea rdi, [rsp + 0x1a0]
0x1003f5de0: call 0x1007c2570 ; 0x1007c2570
0x1003f5de5: mov rdi, r14
0x1003f5de8: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1003f5ded: nop dword ptr [rax]
