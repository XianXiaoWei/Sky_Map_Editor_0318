0x1007bebc0: push rbp
0x1007bebc1: mov rbp, rsp
0x1007bebc4: push r15
0x1007bebc6: push r14
0x1007bebc8: push r12
0x1007bebca: push rbx
0x1007bebcb: and rsp, 0xffffffffffffffe0
0x1007bebcf: sub rsp, 0x40
0x1007bebd3: mov r14, rdx
0x1007bebd6: mov r12, rsi
0x1007bebd9: mov r15, rdi
0x1007bebdc: mov rax, qword ptr [rip + 0x44ecf5] ; 0x100c0d8d8
0x1007bebe3: mov rax, qword ptr [rax]
0x1007bebe6: mov qword ptr [rsp + 0x28], rax
0x1007bebeb: mov edi, dword ptr [r12 + 0x1c]
0x1007bebf0: cmp edi, 0x11
0x1007bebf3: ja 0x1007bec7e
0x1007bebf9: mov eax, 0x205e0
0x1007bebfe: bt eax, edi
0x1007bec01: jae 0x1007bec7e
0x1007bec03: vxorps ymm0, ymm0, ymm0
0x1007bec07: vmovaps ymmword ptr [rsp], ymm0
0x1007bec0c: add edi, -5
0x1007bec0f: xor edx, edx
0x1007bec11: cmp edi, 0xc
0x1007bec14: ja 0x1007bec23
0x1007bec16: movsxd rax, edi
0x1007bec19: lea rcx, [rip + 0x322220] ; 0x100ae0e40
0x1007bec20: mov edx, dword ptr [rcx + rax*4]
0x1007bec23: mov rdi, rsp
0x1007bec26: mov rsi, r14
0x1007bec29: vzeroupper 
0x1007bec2c: call 0x1007ec050 ; 0x1007ec050
0x1007bec31: movsxd rbx, dword ptr [r12 + 0x2c]
0x1007bec36: cmp rbx, -1
0x1007bec3a: je 0x1007becaa
0x1007bec3c: movsxd rax, dword ptr [r12 + 0x28]
0x1007bec41: add rbx, qword ptr [r15 + rax*8 + 0x168]
0x1007bec49: mov edi, dword ptr [r12 + 0x1c]
0x1007bec4e: call 0x1007bed50 ; 0x1007bed50
0x1007bec53: mov edx, eax
0x1007bec55: mov rsi, rsp
0x1007bec58: mov rdi, rbx
0x1007bec5b: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007bec60: mov rax, qword ptr [rip + 0x44ec71] ; 0x100c0d8d8
0x1007bec67: mov rax, qword ptr [rax]
0x1007bec6a: cmp rax, qword ptr [rsp + 0x28]
0x1007bec6f: jne 0x1007beca5
0x1007bec71: lea rsp, [rbp - 0x20]
0x1007bec75: pop rbx
0x1007bec76: pop r12
0x1007bec78: pop r14
0x1007bec7a: pop r15
0x1007bec7c: pop rbp
0x1007bec7d: ret 
0x1007bec7e: movsxd rbx, dword ptr [r12 + 0x2c]
0x1007bec83: cmp rbx, -1
0x1007bec87: je 0x1007becaa
0x1007bec89: movsxd rax, dword ptr [r12 + 0x28]
0x1007bec8e: add rbx, qword ptr [r15 + rax*8 + 0x168]
0x1007bec96: call 0x1007bed50 ; 0x1007bed50
0x1007bec9b: mov edx, eax
0x1007bec9d: mov rdi, rbx
0x1007beca0: mov rsi, r14
0x1007beca3: jmp 0x1007bec5b ; 0x1007bec5b
0x1007beca5: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007becaa: lea rdi, [rip + 0x3e540d] ; 0x100ba40be def.offset != -1
0x1007becb1: lea rsi, [rip + 0x3e5351] ; 0x100ba4009 RenderPipeline.cpp
0x1007becb8: lea r8, [rip + 0x3e5410] ; 0x100ba40cf No backing store for this uniform
0x1007becbf: mov edx, 0xbc
0x1007becc4: mov ecx, 4
0x1007becc9: xor eax, eax
0x1007beccb: call 0x1007e6030 ; 0x1007e6030
0x1007becd0: ud2 
0x1007becd2: nop word ptr cs:[rax + rax]

