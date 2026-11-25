0x100793f30: push rbp
0x100793f31: mov rbp, rsp
0x100793f34: push r15
0x100793f36: push r14
0x100793f38: push r13
0x100793f3a: push r12
0x100793f3c: push rbx
0x100793f3d: sub rsp, 0x18
0x100793f41: mov r13d, r9d
0x100793f44: mov r15d, r8d
0x100793f47: mov qword ptr [rbp - 0x40], rcx
0x100793f4b: mov qword ptr [rbp - 0x38], rdx
0x100793f4f: mov rbx, rsi
0x100793f52: mov r14, rdi
0x100793f55: mov r12d, dword ptr [r14 + 0x1c10]
0x100793f5c: cmp r12, 0x80
0x100793f63: jae 0x100794009
0x100793f69: mov rdi, rbx
0x100793f6c: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100793f71: cmp rax, 0x1c
0x100793f75: jae 0x100794028
0x100793f7b: mov dword ptr [rbp - 0x30], r15d
0x100793f7f: test r12d, r12d
0x100793f82: je 0x100793fb4
0x100793f84: mov dword ptr [rbp - 0x2c], r13d
0x100793f88: lea r15, [r14 + 0x10]
0x100793f8c: xor r13d, r13d
0x100793f8f: nop 
0x100793f90: mov rdi, rbx
0x100793f93: mov rsi, r15
0x100793f96: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100793f9b: test eax, eax
0x100793f9d: je 0x100793fdb
0x100793f9f: inc r13
0x100793fa2: add r15, 0x38
0x100793fa6: cmp r13, r12
0x100793fa9: jb 0x100793f90
0x100793fab: mov rax, r12
0x100793fae: mov r13d, dword ptr [rbp - 0x2c]
0x100793fb2: jmp 0x100793fb6 ; 0x100793fb6
0x100793fb4: xor eax, eax
0x100793fb6: imul rax, rax, 0x38
0x100793fba: lea r15, [r14 + rax + 0x10]
0x100793fbf: inc r12d
0x100793fc2: mov dword ptr [r14 + 0x1c10], r12d
0x100793fc9: mov edx, 0x1c
0x100793fce: mov rdi, r15
0x100793fd1: mov rsi, rbx
0x100793fd4: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x100793fd9: jmp 0x100793fdf ; 0x100793fdf
0x100793fdb: mov r13d, dword ptr [rbp - 0x2c]
0x100793fdf: mov rax, qword ptr [rbp - 0x38]
0x100793fe3: mov qword ptr [r15 + 0x20], rax
0x100793fe7: mov rax, qword ptr [rbp - 0x40]
0x100793feb: mov qword ptr [r15 + 0x28], rax
0x100793fef: mov eax, dword ptr [rbp - 0x30]
0x100793ff2: mov dword ptr [r15 + 0x30], eax
0x100793ff6: mov dword ptr [r15 + 0x34], r13d
0x100793ffa: add rsp, 0x18
0x100793ffe: pop rbx
0x100793fff: pop r12
0x100794001: pop r13
0x100794003: pop r14
0x100794005: pop r15
0x100794007: pop rbp
0x100794008: ret 
0x100794009: lea rdi, [rip + 0x40d02d] ; 0x100ba103d m_uniformCount < kMaxUniforms
0x100794010: lea rsi, [rip + 0x40cf4e] ; 0x100ba0f65 GlobalShaderUniforms.cpp
0x100794017: mov edx, 0x79
0x10079401c: mov ecx, 3
0x100794021: call 0x1007e5f70 ; 0x1007e5f70
0x100794026: ud2 
0x100794028: lea rdi, [rip + 0x40d02c] ; 0x100ba105b strlen( name ) < sizeof( m_uniforms[ m_uniformCount ].name )
0x10079402f: lea rsi, [rip + 0x40cf2f] ; 0x100ba0f65 GlobalShaderUniforms.cpp
0x100794036: mov edx, 0x7a
0x10079403b: mov ecx, 3
0x100794040: call 0x1007e5f70 ; 0x1007e5f70
0x100794045: ud2 
0x100794047: nop word ptr [rax + rax]
