0x1007bef60: push rbp
0x1007bef61: mov rbp, rsp
0x1007bef64: push r15
0x1007bef66: push r14
0x1007bef68: push r13
0x1007bef6a: push r12
0x1007bef6c: push rbx
0x1007bef6d: sub rsp, 0x28
0x1007bef71: mov rcx, rsi
0x1007bef74: mov qword ptr [rbp - 0x38], rdi
0x1007bef78: mov rax, qword ptr [rdi + 0x158]
0x1007bef7f: mov rax, qword ptr [rax + 8]
0x1007bef83: cmp dword ptr [rax + 0x38], 0
0x1007bef87: mov qword ptr [rbp - 0x40], rcx
0x1007bef8b: je 0x1007bf0f3
0x1007bef91: xor r15d, r15d
0x1007bef94: nop word ptr cs:[rax + rax]
0x1007befa0: mov r14, qword ptr [rax + 0x40]
0x1007befa4: mov r13d, r15d
0x1007befa7: lea r12, [r13 + r13*2]
0x1007befac: shl r12, 4
0x1007befb0: lea rsi, [r14 + r12]
0x1007befb4: xor edx, edx
0x1007befb6: mov rdi, rcx
0x1007befb9: call 0x1007bdb70 ; 0x1007bdb70
0x1007befbe: mov rdx, qword ptr [rbp - 0x38]
0x1007befc2: test eax, eax
0x1007befc4: js 0x1007bf0d4
0x1007befca: mov rbx, qword ptr [rbp - 0x40]
0x1007befce: mov rcx, qword ptr [rbx + 0x158]
0x1007befd5: mov rcx, qword ptr [rcx + 8]
0x1007befd9: mov r8, qword ptr [rcx + 0x40]
0x1007befdd: movsxd rcx, eax
0x1007befe0: lea rax, [rcx + rcx*2]
0x1007befe4: shl rax, 4
0x1007befe8: mov edi, dword ptr [r8 + rax + 0x1c]
0x1007befed: mov r9, r14
0x1007beff0: cmp edi, dword ptr [r14 + r12 + 0x1c]
0x1007beff5: jne 0x1007bf1fc
0x1007beffb: mov rsi, qword ptr [rbx + 0x148]
0x1007bf002: mov r14, qword ptr [rsi + rcx*8]
0x1007bf006: test r14, r14
0x1007bf009: je 0x1007bf090
0x1007bf00f: test r13d, r13d
0x1007bf012: js 0x1007bf0d4
0x1007bf018: mov rax, qword ptr [rdx + 0x158]
0x1007bf01f: mov rax, qword ptr [rax + 8]
0x1007bf023: mov rax, qword ptr [rax + 0x40]
0x1007bf027: movsxd rcx, r13d
0x1007bf02a: lea r12, [rcx + rcx*2]
0x1007bf02e: shl r12, 4
0x1007bf032: cmp dword ptr [rax + r12 + 0x2c], -1
0x1007bf038: je 0x1007bf256
0x1007bf03e: movsxd rcx, r15d
0x1007bf041: lea r15, [rcx*8]
0x1007bf049: add rcx, rcx
0x1007bf04c: add r12, rax
0x1007bf04f: lea rcx, [rcx + rcx*2]
0x1007bf053: shl rcx, 4
0x1007bf057: lea rbx, [rax + rcx + 0x30]
0x1007bf05c: nop dword ptr [rax]
0x1007bf060: mov rax, qword ptr [rdx + 0x148]
0x1007bf067: mov qword ptr [rax + r15], r14
0x1007bf06b: mov rdi, rbx
0x1007bf06e: mov rsi, r12
0x1007bf071: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007bf076: mov rdx, qword ptr [rbp - 0x38]
0x1007bf07a: add r15, 8
0x1007bf07e: add rbx, 0x30
0x1007bf082: test eax, eax
0x1007bf084: je 0x1007bf060
0x1007bf086: jmp 0x1007bf0d4 ; 0x1007bf0d4
0x1007bf088: nop dword ptr [rax + rax]
0x1007bf090: movsxd r15, dword ptr [r9 + r12 + 0x2c]
0x1007bf095: cmp r15, -1
0x1007bf099: je 0x1007bf272
0x1007bf09f: movsxd rcx, dword ptr [r8 + rax + 0x28]
0x1007bf0a4: movsxd r14, dword ptr [r8 + rax + 0x2c]
0x1007bf0a9: add r14, qword ptr [rbx + rcx*8 + 0x168]
0x1007bf0b1: movsxd rax, dword ptr [r9 + r12 + 0x28]
0x1007bf0b6: add r15, qword ptr [rdx + rax*8 + 0x168]
0x1007bf0be: call 0x1007bed50 ; 0x1007bed50
0x1007bf0c3: mov edx, eax
0x1007bf0c5: mov rdi, r15
0x1007bf0c8: mov rsi, r14
0x1007bf0cb: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007bf0d0: mov rdx, qword ptr [rbp - 0x38]
0x1007bf0d4: inc r13d
0x1007bf0d7: mov rax, qword ptr [rdx + 0x158]
0x1007bf0de: mov rax, qword ptr [rax + 8]
0x1007bf0e2: mov r15d, r13d
0x1007bf0e5: cmp r13d, dword ptr [rax + 0x38]
0x1007bf0e9: mov rcx, qword ptr [rbp - 0x40]
0x1007bf0ed: jb 0x1007befa0
0x1007bf0f3: cmp dword ptr [rax + 0x28], 0
0x1007bf0f7: je 0x1007bf1ed
0x1007bf0fd: xor esi, esi
0x1007bf0ff: nop 
0x1007bf100: mov dword ptr [rbp - 0x2c], esi
0x1007bf103: mov esi, esi
0x1007bf105: shl rsi, 5
0x1007bf109: add rsi, qword ptr [rax + 0x30]
0x1007bf10d: xor edx, edx
0x1007bf10f: mov rdi, rcx
0x1007bf112: call 0x1007bdb70 ; 0x1007bdb70
0x1007bf117: mov rdx, qword ptr [rbp - 0x38]
0x1007bf11b: test eax, eax
0x1007bf11d: js 0x1007bf1d0
0x1007bf123: mov esi, dword ptr [rbp - 0x2c]
0x1007bf126: cmp esi, 0x10
0x1007bf129: jge 0x1007bf218
0x1007bf12f: cdqe 
0x1007bf131: mov rcx, qword ptr [rbp - 0x40]
0x1007bf135: mov r13, qword ptr [rcx + rax*8]
0x1007bf139: mov rax, qword ptr [rcx + rax*8 + 0x80]
0x1007bf141: mov qword ptr [rbp - 0x50], rax
0x1007bf145: test r13, r13
0x1007bf148: je 0x1007bf155
0x1007bf14a: cmp dword ptr [r13], -1
0x1007bf14f: je 0x1007bf237
0x1007bf155: test esi, esi
0x1007bf157: js 0x1007bf1d0
0x1007bf159: movsxd rbx, dword ptr [rbp - 0x2c]
0x1007bf15d: mov r12, rbx
0x1007bf160: shl r12, 5
0x1007bf164: add rbx, 0x10
0x1007bf168: mov rax, qword ptr [rdx + 0x158]
0x1007bf16f: mov r14, qword ptr [rax + 8]
0x1007bf173: lea r15, [r12 + 0x20]
0x1007bf178: add r12, qword ptr [r14 + 0x30]
0x1007bf17c: movsxd rax, dword ptr [r14 + 0x28]
0x1007bf180: mov qword ptr [rbp - 0x48], rax
0x1007bf184: nop word ptr cs:[rax + rax]
0x1007bf190: mov qword ptr [rdx + rbx*8 - 0x80], r13
0x1007bf195: mov rax, qword ptr [rbp - 0x50]
0x1007bf199: mov qword ptr [rdx + rbx*8], rax
0x1007bf19d: lea rax, [rbx - 0xf]
0x1007bf1a1: cmp rax, qword ptr [rbp - 0x48]
0x1007bf1a5: jge 0x1007bf1d0
0x1007bf1a7: mov rdi, qword ptr [r14 + 0x30]
0x1007bf1ab: add rdi, r15
0x1007bf1ae: mov rsi, r12
0x1007bf1b1: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007bf1b6: mov rdx, qword ptr [rbp - 0x38]
0x1007bf1ba: add r15, 0x20
0x1007bf1be: inc rbx
0x1007bf1c1: test eax, eax
0x1007bf1c3: je 0x1007bf190
0x1007bf1c5: nop word ptr cs:[rax + rax]
0x1007bf1d0: mov esi, dword ptr [rbp - 0x2c]
0x1007bf1d3: inc esi
0x1007bf1d5: mov rax, qword ptr [rdx + 0x158]
0x1007bf1dc: mov rax, qword ptr [rax + 8]
0x1007bf1e0: cmp esi, dword ptr [rax + 0x28]
0x1007bf1e3: mov rcx, qword ptr [rbp - 0x40]
0x1007bf1e7: jb 0x1007bf100
0x1007bf1ed: add rsp, 0x28
0x1007bf1f1: pop rbx
0x1007bf1f2: pop r12
0x1007bf1f4: pop r13
0x1007bf1f6: pop r14
0x1007bf1f8: pop r15
0x1007bf1fa: pop rbp
0x1007bf1fb: ret 
0x1007bf1fc: lea rdi, [rip + 0x3e4eee] ; 0x100ba40f1 srcDef.type == dstDef.type
0x1007bf203: lea rsi, [rip + 0x3e4dff] ; 0x100ba4009 RenderPipeline.cpp
0x1007bf20a: lea r8, [rip + 0x3e4efb] ; 0x100ba410c Cannot copy uniform with the same name but different type
0x1007bf211: mov edx, 0xcb
0x1007bf216: jmp 0x1007bf28c ; 0x1007bf28c
0x1007bf218: lea rdi, [rip + 0x3e4e33] ; 0x100ba4052 idx < (int32_t)kMaxTextures
0x1007bf21f: lea rsi, [rip + 0x3e4de3] ; 0x100ba4009 RenderPipeline.cpp
0x1007bf226: mov edx, 0x79
0x1007bf22b: mov ecx, 3
0x1007bf230: call 0x1007e5f70 ; 0x1007e5f70
0x1007bf235: ud2 
0x1007bf237: lea rdi, [rip + 0x3e1d85] ; 0x100ba0fc3 !texture || texture->IsInitialized()
0x1007bf23e: lea rsi, [rip + 0x3e4dc4] ; 0x100ba4009 RenderPipeline.cpp
0x1007bf245: mov edx, 0x7a
0x1007bf24a: mov ecx, 3
0x1007bf24f: call 0x1007e5f70 ; 0x1007e5f70
0x1007bf254: ud2 
0x1007bf256: lea rdi, [rip + 0x3e4e11] ; 0x100ba406e def->offset != -1
0x1007bf25d: lea rsi, [rip + 0x3e4da5] ; 0x100ba4009 RenderPipeline.cpp
0x1007bf264: lea r8, [rip + 0x3e4e15] ; 0x100ba4080 No backing store for this uniform. Is it a Global or an Auto?
0x1007bf26b: mov edx, 0xa2
0x1007bf270: jmp 0x1007bf28c ; 0x1007bf28c
0x1007bf272: lea rdi, [rip + 0x3e4e45] ; 0x100ba40be def.offset != -1
0x1007bf279: lea rsi, [rip + 0x3e4d89] ; 0x100ba4009 RenderPipeline.cpp
0x1007bf280: lea r8, [rip + 0x3e4e48] ; 0x100ba40cf No backing store for this uniform
0x1007bf287: mov edx, 0xbc
0x1007bf28c: mov ecx, 4
0x1007bf291: xor eax, eax
0x1007bf293: call 0x1007e6030 ; 0x1007e6030
0x1007bf298: ud2 
0x1007bf29a: nop word ptr [rax + rax]
