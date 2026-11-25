0x1007bdfd0: push rbp
0x1007bdfd1: mov rbp, rsp
0x1007bdfd4: push r15
0x1007bdfd6: push r14
0x1007bdfd8: push r13
0x1007bdfda: push r12
0x1007bdfdc: push rbx
0x1007bdfdd: sub rsp, 0x18
0x1007bdfe1: mov dword ptr [rbp - 0x2c], ecx
0x1007bdfe4: mov r12, rsi
0x1007bdfe7: mov r14, rdi
0x1007bdfea: test edx, edx
0x1007bdfec: je 0x1007be078
0x1007bdff2: mov eax, edx
0x1007bdff4: mov qword ptr [rbp - 0x38], rax
0x1007bdff8: xor ebx, ebx
0x1007bdffa: mov r15d, dword ptr [rbp - 0x2c]
0x1007bdffe: nop 
0x1007be000: cmp dword ptr [r12 + 8], 0
0x1007be006: je 0x1007be06b
0x1007be008: cmp rbx, 5
0x1007be00c: ja 0x1007be087
0x1007be00e: mov rax, qword ptr [r14 + 0x158]
0x1007be015: mov rax, qword ptr [rax]
0x1007be018: cmp dword ptr [rax + rbx*8 + 0x100], 0
0x1007be020: je 0x1007be087
0x1007be022: mov qword ptr [r14 + rbx*8 + 0x100], r12
0x1007be02a: mov dword ptr [r14 + rbx*4 + 0x130], r15d
0x1007be032: call 0x1007c1470 ; 0x1007c1470
0x1007be037: mov r13, rax
0x1007be03a: mov rax, qword ptr [r13]
0x1007be03e: mov rax, qword ptr [rax + 0xe0]
0x1007be045: mov qword ptr [rbp - 0x40], rax
0x1007be049: mov eax, dword ptr [r14 + 0x160]
0x1007be050: mov dword ptr [rbp - 0x30], eax
0x1007be053: mov rdi, r12
0x1007be056: call 0x1007950a0 ; 0x1007950a0
0x1007be05b: mov rdi, r13
0x1007be05e: mov esi, dword ptr [rbp - 0x30]
0x1007be061: mov edx, ebx
0x1007be063: mov ecx, eax
0x1007be065: mov r8d, r15d
0x1007be068: call qword ptr [rbp - 0x40]
0x1007be06b: inc rbx
0x1007be06e: add r12, 0x28
0x1007be072: cmp rbx, qword ptr [rbp - 0x38]
0x1007be076: jb 0x1007be000
0x1007be078: add rsp, 0x18
0x1007be07c: pop rbx
0x1007be07d: pop r12
0x1007be07f: pop r13
0x1007be081: pop r14
0x1007be083: pop r15
0x1007be085: pop rbp
0x1007be086: ret 
0x1007be087: lea rdi, [rip + 0x3e5f24] ; 0x100ba3fb2 idx < kMaxShaderVertexBuffers && m_reflection->vertexLayout->buffers[ idx ].stride > 0
0x1007be08e: lea rsi, [rip + 0x3e5f74] ; 0x100ba4009 RenderPipeline.cpp
0x1007be095: lea r8, [rip + 0x3e5f80] ; 0x100ba401c Attempted to assign vertex buffer to an unused index.
0x1007be09c: mov edx, 0x4f
0x1007be0a1: mov ecx, 4
0x1007be0a6: xor eax, eax
0x1007be0a8: call 0x1007e6030 ; 0x1007e6030
0x1007be0ad: ud2 
0x1007be0af: nop 

