0x1007bfd80: push rbp
0x1007bfd81: mov rbp, rsp
0x1007bfd84: push r15
0x1007bfd86: push r14
0x1007bfd88: push r13
0x1007bfd8a: push r12
0x1007bfd8c: push rbx
0x1007bfd8d: sub rsp, 0x28
0x1007bfd91: mov ebx, esi
0x1007bfd93: mov r15, rdi
0x1007bfd96: mov rax, qword ptr [rip + 0x44db3b] ; 0x100c0d8d8
0x1007bfd9d: mov rax, qword ptr [rax]
0x1007bfda0: mov qword ptr [rbp - 0x30], rax
0x1007bfda4: call 0x1007c1470 ; 0x1007c1470
0x1007bfda9: mov rcx, qword ptr [rax]
0x1007bfdac: mov rdi, rax
0x1007bfdaf: mov dword ptr [rbp - 0x3c], ebx
0x1007bfdb2: mov esi, ebx
0x1007bfdb4: call qword ptr [rcx + 0xb8]
0x1007bfdba: mov qword ptr [rbp - 0x48], rax
0x1007bfdbe: mov rax, qword ptr [rax + 8]
0x1007bfdc2: mov r13, qword ptr [rax + 0x30]
0x1007bfdc6: mov qword ptr [rbp - 0x38], rax
0x1007bfdca: movsxd rax, dword ptr [rax + 0x28]
0x1007bfdce: mov r12, rax
0x1007bfdd1: shl r12, 5
0x1007bfdd5: add r12, r13
0x1007bfdd8: test rax, rax
0x1007bfddb: je 0x1007bfe11
0x1007bfddd: cmp eax, 1
0x1007bfde0: je 0x1007bfe1a
0x1007bfde2: add r13, 0x20
0x1007bfde6: nop word ptr cs:[rax + rax]
0x1007bfdf0: lea rbx, [r13 - 0x20]
0x1007bfdf4: mov rdi, r13
0x1007bfdf7: mov rsi, rbx
0x1007bfdfa: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007bfdff: test eax, eax
0x1007bfe01: js 0x1007bfe11
0x1007bfe03: add rbx, 0x40
0x1007bfe07: mov r13, rbx
0x1007bfe0a: cmp rbx, r12
0x1007bfe0d: jne 0x1007bfdf0
0x1007bfe0f: jmp 0x1007bfe1a ; 0x1007bfe1a
0x1007bfe11: cmp r13, r12
0x1007bfe14: jne 0x1007c0053
0x1007bfe1a: mov rax, qword ptr [rbp - 0x38]
0x1007bfe1e: mov r13, qword ptr [rax + 0x40]
0x1007bfe22: movsxd rax, dword ptr [rax + 0x38]
0x1007bfe26: lea r12, [rax + rax*2]
0x1007bfe2a: shl r12, 4
0x1007bfe2e: add r12, r13
0x1007bfe31: test rax, rax
0x1007bfe34: je 0x1007bfe71
0x1007bfe36: mov r14, rax
0x1007bfe39: cmp eax, 1
0x1007bfe3c: je 0x1007bfe7d
0x1007bfe3e: add r13, 0x30
0x1007bfe42: nop word ptr cs:[rax + rax]
0x1007bfe50: lea rbx, [r13 - 0x30]
0x1007bfe54: mov rdi, r13
0x1007bfe57: mov rsi, rbx
0x1007bfe5a: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007bfe5f: test eax, eax
0x1007bfe61: js 0x1007bfe74
0x1007bfe63: add rbx, 0x60
0x1007bfe67: mov r13, rbx
0x1007bfe6a: cmp rbx, r12
0x1007bfe6d: jne 0x1007bfe50
0x1007bfe6f: jmp 0x1007bfe7d ; 0x1007bfe7d
0x1007bfe71: mov r14, rax
0x1007bfe74: cmp r13, r12
0x1007bfe77: jne 0x1007c0053
0x1007bfe7d: mov r12d, dword ptr [rbp - 0x3c]
0x1007bfe81: mov dword ptr [r15 + 0x164], r12d
0x1007bfe88: mov rax, qword ptr [rbp - 0x48]
0x1007bfe8c: mov qword ptr [r15 + 0x158], rax
0x1007bfe93: mov rbx, qword ptr [rbp - 0x38]
0x1007bfe97: cmp dword ptr [rbx + 0x48], 0
0x1007bfe9b: je 0x1007bff74
0x1007bfea1: xor r12d, r12d
0x1007bfea4: nop word ptr cs:[rax + rax]
0x1007bfeb0: mov rdi, rbx
0x1007bfeb3: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bfeb8: mov rbx, rsp
0x1007bfebb: add rax, 0x18
0x1007bfebf: and rax, 0xfffffffffffffff0
0x1007bfec3: sub rbx, rax
0x1007bfec6: mov rsp, rbx
0x1007bfec9: mov rdi, rbx
0x1007bfecc: mov rsi, qword ptr [rbp - 0x38]
0x1007bfed0: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x1007bfed5: mov rdi, rbx
0x1007bfed8: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bfedd: movabs rcx, 0x736d726f66696e55
0x1007bfee7: mov qword ptr [rbx + rax], rcx
0x1007bfeeb: mov byte ptr [rax + rbx + 8], 0
0x1007bfef0: mov r13d, r12d
0x1007bfef3: lea rax, [r13 + r13*4]
0x1007bfef8: lea rdi, [r15 + rax*8 + 0x198]
0x1007bff00: mov rax, qword ptr [rbp - 0x38]
0x1007bff04: mov rax, qword ptr [rax + 0x50]
0x1007bff08: lea rcx, [r13*4]
0x1007bff10: mov r14, r15
0x1007bff13: lea r15, [rcx + rcx*2]
0x1007bff17: mov r8d, dword ptr [rax + r15]
0x1007bff1b: mov edx, 1
0x1007bff20: mov ecx, 2
0x1007bff25: xor r9d, r9d
0x1007bff28: mov rsi, rbx
0x1007bff2b: mov rbx, qword ptr [rbp - 0x38]
0x1007bff2f: call 0x100794e00 ; 0x100794e00
0x1007bff34: mov rdi, qword ptr [rip + 0x188839d] ; 0x1020482d8
0x1007bff3b: mov rax, qword ptr [rbx + 0x50]
0x1007bff3f: mov esi, dword ptr [rax + r15]
0x1007bff43: mov r15, r14
0x1007bff46: mov rdx, qword ptr [rip + 0x1888383] ; 0x1020482d0
0x1007bff4d: mov ecx, 0x10
0x1007bff52: call 0x100795530 ; 0x100795530
0x1007bff57: mov qword ptr [r15 + r13*8 + 0x168], rax
0x1007bff5f: inc r12d
0x1007bff62: cmp r12d, dword ptr [rbx + 0x48]
0x1007bff66: jb 0x1007bfeb0
0x1007bff6c: mov r14d, dword ptr [rbx + 0x38]
0x1007bff70: mov r12d, dword ptr [rbp - 0x3c]
0x1007bff74: mov rdi, qword ptr [rip + 0x188835d] ; 0x1020482d8
0x1007bff7b: movsxd rsi, r14d
0x1007bff7e: shl rsi, 3
0x1007bff82: mov rdx, qword ptr [rip + 0x1888347] ; 0x1020482d0
0x1007bff89: mov ecx, 0x10
0x1007bff8e: call 0x100795530 ; 0x100795530
0x1007bff93: mov qword ptr [r15 + 0x148], rax
0x1007bff9a: movsxd rsi, dword ptr [rbx + 0x38]
0x1007bff9e: shl rsi, 3
0x1007bffa2: mov rdi, rax
0x1007bffa5: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1007bffaa: vxorps ymm0, ymm0, ymm0
0x1007bffae: vmovups ymmword ptr [r15 + 0x120], ymm0
0x1007bffb7: vmovups ymmword ptr [r15 + 0x100], ymm0
0x1007bffc0: vmovups ymmword ptr [r15 + 0xe0], ymm0
0x1007bffc9: vmovups ymmword ptr [r15 + 0xc0], ymm0
0x1007bffd2: vmovups ymmword ptr [r15 + 0xa0], ymm0
0x1007bffdb: vmovups ymmword ptr [r15 + 0x80], ymm0
0x1007bffe4: vmovups ymmword ptr [r15 + 0x60], ymm0
0x1007bffea: vmovups ymmword ptr [r15 + 0x40], ymm0
0x1007bfff0: vmovups ymmword ptr [r15 + 0x20], ymm0
0x1007bfff6: vmovups ymmword ptr [r15], ymm0
0x1007bfffb: mov qword ptr [r15 + 0x140], 0
0x1007c0006: mov dword ptr [r15 + 0x150], 0xffffffff
0x1007c0011: vzeroupper 
0x1007c0014: call 0x1007c1470 ; 0x1007c1470
0x1007c0019: mov rcx, qword ptr [rax]
0x1007c001c: mov rdi, rax
0x1007c001f: mov esi, r12d
0x1007c0022: call qword ptr [rcx + 0xd0]
0x1007c0028: mov dword ptr [r15 + 0x160], eax
0x1007c002f: mov rax, qword ptr [rip + 0x44d8a2] ; 0x100c0d8d8
0x1007c0036: mov rax, qword ptr [rax]
0x1007c0039: cmp rax, qword ptr [rbp - 0x30]
0x1007c003d: jne 0x1007c004e
0x1007c003f: lea rsp, [rbp - 0x28]
0x1007c0043: pop rbx
0x1007c0044: pop r12
0x1007c0046: pop r13
0x1007c0048: pop r14
0x1007c004a: pop r15
0x1007c004c: pop rbp
0x1007c004d: ret 
0x1007c004e: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007c0053: lea rdi, [rip + 0x3e419a] ; 0x100ba41f4 std::is_sorted( shaderRefl->textures, shaderRefl->textures + shaderRefl->textureCount, TextureCompare ) && std::is_sorted( shaderRefl->uniforms, shaderRefl->uniforms + shaderRefl->uniformCount, UniformCompare )
0x1007c005a: lea rsi, [rip + 0x3e3fa8] ; 0x100ba4009 RenderPipeline.cpp
0x1007c0061: lea r8, [rip + 0x3e425f] ; 0x100ba42c7 Renderer must supply sorted texture and uniform names in the shader reflection
0x1007c0068: mov edx, 0x174
0x1007c006d: mov ecx, 4
0x1007c0072: xor eax, eax
0x1007c0074: call 0x1007e6030 ; 0x1007e6030
0x1007c0079: ud2 
0x1007c007b: nop dword ptr [rax + rax]

