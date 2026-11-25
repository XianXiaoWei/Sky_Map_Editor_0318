0x1007abd80: push rbp
0x1007abd81: mov rbp, rsp
0x1007abd84: push rbx
0x1007abd85: push rax
0x1007abd86: mov qword ptr [rbp - 0x10], rdi
0x1007abd8a: test rdi, rdi
0x1007abd8d: je 0x1007abdb0
0x1007abd8f: mov r9d, dword ptr [rdi]
0x1007abd92: cmp r9, 0x500
0x1007abd99: jae 0x1007abe5b
0x1007abd9f: mov rax, qword ptr [rip + 0x189beca] ; 0x102047c70
0x1007abda6: mov rdi, qword ptr [rax + r9*8 + 0x98]
0x1007abdae: jmp 0x1007abdb7 ; 0x1007abdb7
0x1007abdb0: mov rdi, qword ptr [rip + 0x189c159] ; 0x102047f10
0x1007abdb7: mov rax, qword ptr [rdi]
0x1007abdba: call qword ptr [rax + 0x68]
0x1007abdbd: mov rbx, rax
0x1007abdc0: test rbx, rbx
0x1007abdc3: jne 0x1007abdd5
0x1007abdc5: mov rdi, qword ptr [rip + 0x189c144] ; 0x102047f10
0x1007abdcc: mov rax, qword ptr [rdi]
0x1007abdcf: call qword ptr [rax + 0x68]
0x1007abdd2: mov rbx, rax
0x1007abdd5: mov rax, qword ptr [rbx]
0x1007abdd8: mov rdi, rbx
0x1007abddb: call qword ptr [rax + 0x90]
0x1007abde1: test al, al
0x1007abde3: jne 0x1007abe3c
0x1007abde5: mov rax, qword ptr [rbx]
0x1007abde8: mov rdi, rbx
0x1007abdeb: call qword ptr [rax + 0x98]
0x1007abdf1: test al, al
0x1007abdf3: je 0x1007abe3c
0x1007abdf5: cmp qword ptr [rbx + 0x58], 0
0x1007abdfa: jne 0x1007abe1e
0x1007abdfc: mov rax, qword ptr [rbx]
0x1007abdff: mov rdi, rbx
0x1007abe02: call qword ptr [rax + 0xb0]
0x1007abe08: mov rcx, qword ptr [rax]
0x1007abe0b: mov qword ptr [rbx + 0x58], rcx
0x1007abe0f: mov rcx, qword ptr [rbx]
0x1007abe12: mov rdi, rbx
0x1007abe15: mov rsi, rax
0x1007abe18: call qword ptr [rcx + 0xb8]
0x1007abe1e: mov rax, qword ptr [rbx]
0x1007abe21: lea rsi, [rbp - 0x10]
0x1007abe25: mov rdi, rbx
0x1007abe28: call qword ptr [rax + 0xd8]
0x1007abe2e: mov rcx, qword ptr [rbx + 0x58]
0x1007abe32: mov qword ptr [rax], rcx
0x1007abe35: add rsp, 8
0x1007abe39: pop rbx
0x1007abe3a: pop rbp
0x1007abe3b: ret 
0x1007abe3c: lea rdi, [rip + 0x3f7023] ; 0x100ba2e66 !mc.IsAbstract() && mc.IsPolymorphic()
0x1007abe43: lea rsi, [rip + 0x3f6ff9] ; 0x100ba2e43 Meta.cpp
0x1007abe4a: mov edx, 0x93
0x1007abe4f: mov ecx, 3
0x1007abe54: call 0x1007e5f70 ; 0x1007e5f70
0x1007abe59: ud2 
0x1007abe5b: lea rdi, [rip + 0x3f6fc5] ; 0x100ba2e27 id < MetaClass::kMaxClasses
0x1007abe62: lea rsi, [rip + 0x3f6fda] ; 0x100ba2e43 Meta.cpp
0x1007abe69: lea r8, [rip + 0x3f6fdc] ; 0x100ba2e4c Invalid meta class id: %u
0x1007abe70: mov edx, 0x87
0x1007abe75: mov ecx, 4
0x1007abe7a: xor eax, eax
0x1007abe7c: call 0x1007e6030 ; 0x1007e6030
0x1007abe81: ud2 
0x1007abe83: nop word ptr cs:[rax + rax]
