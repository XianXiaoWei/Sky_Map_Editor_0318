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
0x1003f485e: mov rax, qword ptr [rip + 0x819073]
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
0x1003f489c: jmp 0x1003f48a2
0x1003f489e: mov rcx, qword ptr [rbx + 0x20]
0x1003f48a2: lea rdx, [rip + 0x792526]
0x1003f48a9: lea rdi, [rsp + 0x1c0]
0x1003f48b1: mov esi, 0x100
0x1003f48b6: xor eax, eax
0x1003f48b8: mov r8d, r15d
0x1003f48bb: call 0x100aa2bd6
0x1003f48c0: lea r13, [rbx + 0x230]
0x1003f48c7: call 0x1007c6580
0x1003f48cc: mov r12, rax
0x1003f48cf: mov qword ptr [rsp + 0x100], 0
0x1003f48db: call 0x1003869c0
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
0x1003f490a: mov rax, qword ptr [rip + 0x818fc7]
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
0x1003f496d: call 0x1007c2530
0x1003f4972: mov rax, qword ptr [rsp + 0xd8]
0x1003f497a: mov rax, qword ptr [rax]
0x1003f497d: mov rbx, qword ptr [rax + 0x38]
0x1003f4981: test byte ptr [r14], 1
0x1003f4985: jne 0x1003f498c
0x1003f4987: inc r14
0x1003f498a: jmp 0x1003f4995
0x1003f498c: mov rax, qword ptr [rsp + 0x18]
0x1003f4991: mov r14, qword ptr [rax + 0x20]
0x1003f4995: call 0x10040b090
0x1003f499a: mov rdi, rbx
0x1003f499d: mov rsi, rax
0x1003f49a0: mov rdx, r14
0x1003f49a3: call 0x1007c4360
0x1003f49a8: test rax, rax
0x1003f49ab: je 0x1003f49bf
0x1003f49ad: lea rsi, [rsp + 0x1a0]
0x1003f49b5: mov rdi, rax
0x1003f49b8: call 0x1007c2310
0x1003f49bd: jmp 0x1003f49d3
0x1003f49bf: call 0x10040b090
0x1003f49c4: mov rsi, qword ptr [rax + 8]
0x1003f49c8: mov rdi, rbx
0x1003f49cb: mov rdx, r14
0x1003f49ce: call 0x1007c4640
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
0x1003f49ff: jmp 0x1003f4a0b
0x1003f4a01: xor ecx, ecx
0x1003f4a03: mov dword ptr [rsp + 0x50], 0
0x1003f4a0b: mov qword ptr [rsp + 0xf8], rcx
0x1003f4a13: mov r13d, r12d
0x1003f4a16: mov rax, qword ptr [rsp + 0x18]
0x1003f4a1b: mov r14d, dword ptr [rax + r13*4 + 0x250]
0x1003f4a23: mov edi, 0xc00000
0x1003f4a28: call 0x100aa28c4
0x1003f4a2d: mov qword ptr [rsp + 0xe8], rax
0x1003f4a35: call 0x1007c6c20
0x1003f4a3a: lea rcx, [rip + 0x1c5410f]
0x1003f4a41: mov rdx, qword ptr [rcx]
0x1003f4a44: mov ecx, 1
0x1003f4a49: mov rdi, rax
0x1003f4a4c: mov rsi, r14
0x1003f4a4f: call 0x100795530
0x1003f4a54: mov r15, rax
0x1003f4a57: mov rbx, qword ptr [rsp + 0x18]
0x1003f4a5c: mov rax, qword ptr [rbx + 0x230]
0x1003f4a63: mov rdi, qword ptr [rax + 0x10]
0x1003f4a67: lea rsi, [rbx + 0x121]
0x1003f4a6e: mov edx, dword ptr [rbx + r13*4 + 0x23c]
0x1003f4a76: mov ecx, dword ptr [rbx + r13*4 + 0x250]
0x1003f4a7e: mov r8, r15
0x1003f4a81: call 0x1007f8ac0
0x1003f4a86: mov edi, 1
0x1003f4a8b: mov r8d, 0xc00000
0x1003f4a91: mov rsi, r15
0x1003f4a94: mov rdx, qword ptr [rsp + 0xe8]
0x1003f4a9c: mov ecx, r14d
0x1003f4a9f: call 0x100780880
0x1003f4aa4: mov r14d, eax
0x1003f4aa7: call 0x1007c6c20
0x1003f4aac: mov rdi, rax
0x1003f4aaf: mov rsi, r15
0x1003f4ab2: call 0x100795a70
0x1003f4ab7: lea rdi, [rsp + 0x70]
0x1003f4abc: xor esi, esi
0x1003f4abe: mov rdx, qword ptr [rsp + 0xe8]
0x1003f4ac6: mov ecx, r14d
0x1003f4ac9: call 0x100769c80
0x1003f4ace: lea r13, [rbx + 0xd0]
0x1003f4ad5: lea rdi, [rsp + 0x70]
0x1003f4ada: mov rsi, r13
0x1003f4add: call 0x10076a280
0x1003f4ae2: mov rdi, qword ptr [rbx + 0x30]
0x1003f4ae6: mov eax, dword ptr [rbx + 0xd0]
0x1003f4aec: shl rax, 4
0x1003f4af0: lea rsi, [rax + rax*2]
0x1003f4af4: mov rdx, qword ptr [rip + 0x93755d]
0x1003f4afb: mov ecx, 0x10
0x1003f4b00: call 0x100795530
0x1003f4b05: mov r14, rax
0x1003f4b08: mov qword ptr [rbx + 0xe8], r14
0x1003f4b0f: cmp dword ptr [rbx + 0xd0], 0
0x1003f4b16: mov dword ptr [rsp + 0x24], r12d
0x1003f4b1b: je 0x1003f4f67
0x1003f4b21: xor r15d, r15d
0x1003f4b24: vxorps ymm0, ymm0, ymm0
0x1003f4b28: lea rdi, [rsp + 0x70]
0x1003f4b2d: mov qword ptr [rsp + 0xc0], r13
0x1003f4b35: jmp 0x1003f4b7b
0x1003f4b37: lea rdi, [rsp + 0x100]
0x1003f4b3f: call 0x1007c2570
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
0x1003f4b9a: call 0x10076a5d0
0x1003f4b9f: lea rdi, [rsp + 0x100]
0x1003f4ba7: call 0x1007c2530
0x1003f4bac: mov qword ptr [rsp + 0xc8], r15
0x1003f4bb4: mov rax, qword ptr [rsp + 0xd8]
0x1003f4bbc: mov rax, qword ptr [rax]
0x1003f4bbf: mov r15, qword ptr [rax + 0x38]
0x1003f4bc3: test byte ptr [rbx], 1
0x1003f4bc6: jne 0x1003f4bcd
0x1003f4bc8: inc rbx
0x1003f4bcb: jmp 0x1003f4bd2
0x1003f4bcd: mov rbx, qword ptr [r14 + r12 + 0x10]
0x1003f4bd2: call 0x1004559d0
0x1003f4bd7: lea r13, [rsp + 0x70]
0x1003f4bdc: mov rdi, r15
0x1003f4bdf: mov rsi, rax
0x1003f4be2: mov rdx, rbx
0x1003f4be5: call 0x1007c4360
0x1003f4bea: mov r15, rax
0x1003f4bed: test r15, r15
0x1003f4bf0: je 0x1003f4c28
0x1003f4bf2: mov rdi, r15
0x1003f4bf5: lea rsi, [rsp + 0x100]
0x1003f4bfd: call 0x1007c2310
0x1003f4c02: mov rax, qword ptr [rsp + 0x100]
0x1003f4c0a: test rax, rax
0x1003f4c0d: je 0x1003f5c75
0x1003f4c13: mov rax, qword ptr [rax + 0x10]
0x1003f4c17: test rax, rax
0x1003f4c1a: je 0x1003f5c75
0x1003f4c20: add rax, 0xa8
0x1003f4c26: jmp 0x1003f4c2a
0x1003f4c28: xor eax, eax
0x1003f4c2a: mov qword ptr [rsp + 0x28], rax
0x1003f4c2f: lea rbx, [r14 + r12 + 0x18]
0x1003f4c34: mov rdi, r13
0x1003f4c37: mov rsi, rbx
0x1003f4c3a: call 0x10076a240
0x1003f4c3f: lea rsi, [r14 + r12 + 0x1c]
0x1003f4c44: mov rdi, r13
0x1003f4c47: mov qword ptr [rsp + 0x38], rsi
0x1003f4c4c: call 0x10076a280
0x1003f4c51: lea rsi, [r14 + r12 + 0x20]
0x1003f4c56: mov rdi, r13
0x1003f4c59: mov qword ptr [rsp + 0x58], rsi
0x1003f4c5e: call 0x10076aae0
0x1003f4c63: test r15, r15
0x1003f4c66: jne 0x1003f4c6e
0x1003f4c68: mov dword ptr [rbx], 0xffffffff
0x1003f4c6e: mov rax, qword ptr [rsp + 0x18]
0x1003f4c73: mov rdi, qword ptr [rax + 0x30]
0x1003f4c77: mov rax, qword ptr [rsp + 0x38]
0x1003f4c7c: mov eax, dword ptr [rax]
0x1003f4c7e: shl rax, 3
0x1003f4c82: lea rsi, [rax + rax*2]
0x1003f4c86: mov rdx, qword ptr [rip + 0x9373cb]
0x1003f4c8d: mov ecx, 0x10
0x1003f4c92: call 0x100795530
0x1003f4c97: mov r15, rax
0x1003f4c9a: mov qword ptr [r14 + r12 + 0x28], r15
0x1003f4c9f: mov rax, qword ptr [rsp + 0x38]
0x1003f4ca4: cmp dword ptr [rax], 0
0x1003f4ca7: je 0x1003f4b37
0x1003f4cad: lea rax, [r14 + r12 + 0x28]
0x1003f4cb2: mov qword ptr [rsp + 0xd0], rax
0x1003f4cba: xor r13d, r13d
0x1003f4cbd: jmp 0x1003f4db5
0x1003f4cc2: call 0x1007c6c20
0x1003f4cc7: mov rdi, rax
0x1003f4cca: mov rsi, r15
0x1003f4ccd: call 0x100795a70
0x1003f4cd2: jmp 0x1003f4d99
0x1003f4cd7: nop word ptr [rax + rax]
0x1003f4ce0: call 0x1007c6c20
0x1003f4ce5: shl rbx, 2
0x1003f4ce9: lea rsi, [rbx + rbx*2]
0x1003f4ced: lea rcx, [rip + 0x1c53e5c]
0x1003f4cf4: mov rdx, qword ptr [rcx]
0x1003f4cf7: mov ecx, 4
0x1003f4cfc: mov rdi, rax
0x1003f4cff: call 0x100795530
0x1003f4d04: mov r15, rax
0x1003f4d07: mov ebx, dword ptr [r14]
0x1003f4d0a: call 0x1007c6c20
0x1003f4d0f: lea rcx, [rip + 0x1c53e3a]
0x1003f4d16: mov rdx, qword ptr [rcx]
0x1003f4d19: mov ecx, 1
0x1003f4d1e: mov rdi, rax
0x1003f4d21: mov rsi, rbx
0x1003f4d24: call 0x100795530
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
0x1003f4d51: call 0x10076a0a0
0x1003f4d56: mov edx, dword ptr [r14]
0x1003f4d59: mov rdi, rbx
0x1003f4d5c: mov rsi, r12
0x1003f4d5f: call 0x10076a0a0
0x1003f4d64: vxorps xmm0, xmm0, xmm0
0x1003f4d68: mov rax, qword ptr [rsp + 0x60]
0x1003f4d6d: vmovups xmmword ptr [rax], xmm0
0x1003f4d71: mov qword ptr [rax + 0x10], 0
0x1003f4d79: call 0x1007c6c20
0x1003f4d7e: mov rdi, rax
0x1003f4d81: mov rsi, r12
0x1003f4d84: call 0x100795a70
0x1003f4d89: call 0x1007c6c20
0x1003f4d8e: mov rdi, rax
0x1003f4d91: mov rsi, r15
0x1003f4d94: call 0x100795a70
0x1003f4d99: inc r13d
0x1003f4d9c: mov rax, qword ptr [rsp + 0x38]
0x1003f4da1: cmp r13d, dword ptr [rax]
0x1003f4da4: jae 0x1003f4b37
0x1003f4daa: mov rax, qword ptr [rsp + 0xd0]
0x1003f4db2: mov r15, qword ptr [rax]
0x1003f4db5: lea rbx, [rsp + 0x70]
0x1003f4dba: mov rdi, rbx
0x1003f4dbd: lea rsi, [rsp + 0x40]
0x1003f4dc2: call 0x10076a280
0x1003f4dc7: mov r13d, r13d
0x1003f4dca: lea r12, [r13 + r13*2]
0x1003f4dcf: lea r14, [r15 + r12*8 + 4]
0x1003f4dd4: mov rdi, rbx
0x1003f4dd7: mov rsi, r14
0x1003f4dda: call 0x10076a280
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
0x1003f4e1c: call 0x1007c6c20
0x1003f4e21: shl rbx, 2
0x1003f4e25: lea rsi, [rbx + rbx*2]
0x1003f4e29: lea rcx, [rip + 0x1c53d20]
0x1003f4e30: mov rdx, qword ptr [rcx]
0x1003f4e33: mov ecx, 4
0x1003f4e38: mov rdi, rax
0x1003f4e3b: call 0x100795530
0x1003f4e40: mov r15, rax
0x1003f4e43: mov rax, qword ptr [rsp + 0x18]
0x1003f4e48: mov rdi, qword ptr [rax + 0x30]
0x1003f4e4c: mov esi, dword ptr [r14]
0x1003f4e4f: mov rdx, qword ptr [rip + 0x937202]
0x1003f4e56: mov ecx, 0x10
0x1003f4e5b: call 0x100795530
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
0x1003f4e8c: call 0x10076a0a0
0x1003f4e91: mov rax, qword ptr [rsp + 0x30]
0x1003f4e96: lea rax, [rax + r12*8 + 0x10]
0x1003f4e9b: mov rsi, qword ptr [rax]
0x1003f4e9e: mov edx, dword ptr [r14]
0x1003f4ea1: lea rdi, [rsp + 0x70]
0x1003f4ea6: call 0x10076a0a0
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
0x1003f4ed8: mov rdx, qword ptr [rip + 0x937179]
0x1003f4edf: mov ecx, 0x10
0x1003f4ee4: call 0x100795530
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
0x1003f4f2a: jmp 0x1003f4f41
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
0x1003f4f62: jmp 0x1003f4cc2