0x1007c3e30: push rbp
0x1007c3e31: mov rbp, rsp
0x1007c3e34: push r15
0x1007c3e36: push r14
0x1007c3e38: push r13
0x1007c3e3a: push r12
0x1007c3e3c: push rbx
0x1007c3e3d: sub rsp, 0x28
0x1007c3e41: mov r13, rsi
0x1007c3e44: lea r12, [r13 + 0x11]
0x1007c3e48: test byte ptr [r13 + 0x10], 1
0x1007c3e4d: mov rax, qword ptr [r13 + 0x20]
0x1007c3e51: cmove rax, r12
0x1007c3e55: mov qword ptr [rbp - 0x38], rax
0x1007c3e59: cmp byte ptr [rax], 0
0x1007c3e5c: je 0x1007c404c
0x1007c3e62: mov qword ptr [rbp - 0x40], rdi
0x1007c3e66: lea rdi, [rdi + 0x428]
0x1007c3e6d: lea rsi, [rbp - 0x38]
0x1007c3e71: mov qword ptr [rbp - 0x30], rdi
0x1007c3e75: call 0x1007c5970 ; 0x1007c5970
0x1007c3e7a: mov r14, rax
0x1007c3e7d: mov rbx, rdx
0x1007c3e80: cmp r14, rbx
0x1007c3e83: je 0x1007c3f3c
0x1007c3e89: nop dword ptr [rax]
0x1007c3e90: mov edi, dword ptr [r13 + 8]
0x1007c3e94: call 0x1007abd30 ; 0x1007abd30
0x1007c3e99: mov rcx, qword ptr [rax]
0x1007c3e9c: mov rdi, rax
0x1007c3e9f: call qword ptr [rcx + 0x68]
0x1007c3ea2: mov r15, rax
0x1007c3ea5: test r15, r15
0x1007c3ea8: je 0x1007c3ec0
0x1007c3eaa: mov rax, qword ptr [r14 + 0x28]
0x1007c3eae: test rax, rax
0x1007c3eb1: je 0x1007c3ed1
0x1007c3eb3: mov edi, dword ptr [rax + 8]
0x1007c3eb6: call 0x1007abd30 ; 0x1007abd30
0x1007c3ebb: jmp 0x1007c3ed6 ; 0x1007c3ed6
0x1007c3ebd: nop dword ptr [rax]
0x1007c3ec0: call 0x1007abc60 ; 0x1007abc60
0x1007c3ec5: mov r15, rax
0x1007c3ec8: mov rax, qword ptr [r14 + 0x28]
0x1007c3ecc: test rax, rax
0x1007c3ecf: jne 0x1007c3eb3
0x1007c3ed1: call 0x1007abbf0 ; 0x1007abbf0
0x1007c3ed6: mov rcx, qword ptr [rax]
0x1007c3ed9: mov rdi, rax
0x1007c3edc: call qword ptr [rcx + 0x68]
0x1007c3edf: test rax, rax
0x1007c3ee2: jne 0x1007c3ee9
0x1007c3ee4: call 0x1007abc60 ; 0x1007abc60
0x1007c3ee9: cmp r15, rax
0x1007c3eec: je 0x1007c3ffc
0x1007c3ef2: mov rcx, qword ptr [r14 + 8]
0x1007c3ef6: test rcx, rcx
0x1007c3ef9: je 0x1007c3f10
0x1007c3efb: nop dword ptr [rax + rax]
0x1007c3f00: mov rax, rcx
0x1007c3f03: mov rcx, qword ptr [rax]
0x1007c3f06: test rcx, rcx
0x1007c3f09: jne 0x1007c3f00
0x1007c3f0b: jmp 0x1007c3f30 ; 0x1007c3f30
0x1007c3f0d: nop dword ptr [rax]
0x1007c3f10: mov rax, qword ptr [r14 + 0x10]
0x1007c3f14: cmp qword ptr [rax], r14
0x1007c3f17: je 0x1007c3f30
0x1007c3f19: add r14, 0x10
0x1007c3f1d: nop dword ptr [rax]
0x1007c3f20: mov rcx, qword ptr [r14]
0x1007c3f23: mov rax, qword ptr [rcx + 0x10]
0x1007c3f27: cmp qword ptr [rax], rcx
0x1007c3f2a: lea r14, [rcx + 0x10]
0x1007c3f2e: jne 0x1007c3f20
0x1007c3f30: mov r14, rax
0x1007c3f33: cmp rax, rbx
0x1007c3f36: jne 0x1007c3e90
0x1007c3f3c: test byte ptr [r13 + 0x10], 1
0x1007c3f41: cmovne r12, qword ptr [r13 + 0x20]
0x1007c3f46: call 0x1007e50d0 ; 0x1007e50d0
0x1007c3f4b: mov esi, 0x30
0x1007c3f50: mov rdi, rax
0x1007c3f53: call 0x1007e5790 ; 0x1007e5790
0x1007c3f58: mov r14, rax
0x1007c3f5b: mov qword ptr [r14 + 0x20], r12
0x1007c3f5f: mov qword ptr [r14 + 0x28], r13
0x1007c3f63: mov r15, qword ptr [rbp - 0x40]
0x1007c3f67: mov rbx, qword ptr [r15 + 0x430]
0x1007c3f6e: test rbx, rbx
0x1007c3f71: jne 0x1007c3f83
0x1007c3f73: lea rbx, [r15 + 0x430]
0x1007c3f7a: jmp 0x1007c3faf ; 0x1007c3faf
0x1007c3f7c: nop dword ptr [rax]
0x1007c3f80: mov rbx, rax
0x1007c3f83: mov rsi, qword ptr [rbx + 0x20]
0x1007c3f87: mov rdi, r12
0x1007c3f8a: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007c3f8f: test eax, eax
0x1007c3f91: jns 0x1007c3fa0
0x1007c3f93: mov rax, qword ptr [rbx]
0x1007c3f96: test rax, rax
0x1007c3f99: jne 0x1007c3f80
0x1007c3f9b: jmp 0x1007c3faf ; 0x1007c3faf
0x1007c3f9d: nop dword ptr [rax]
0x1007c3fa0: mov rax, qword ptr [rbx + 8]
0x1007c3fa4: test rax, rax
0x1007c3fa7: jne 0x1007c3f80
0x1007c3fa9: lea rax, [rbx + 8]
0x1007c3fad: jmp 0x1007c3fb2 ; 0x1007c3fb2
0x1007c3faf: mov rax, rbx
0x1007c3fb2: mov rdx, qword ptr [rbp - 0x30]
0x1007c3fb6: vxorps xmm0, xmm0, xmm0
0x1007c3fba: vmovups xmmword ptr [r14], xmm0
0x1007c3fbf: mov qword ptr [r14 + 0x10], rbx
0x1007c3fc3: mov qword ptr [rax], r14
0x1007c3fc6: mov rcx, qword ptr [rdx]
0x1007c3fc9: mov rcx, qword ptr [rcx]
0x1007c3fcc: test rcx, rcx
0x1007c3fcf: je 0x1007c3fd7
0x1007c3fd1: mov qword ptr [rdx], rcx
0x1007c3fd4: mov r14, qword ptr [rax]
0x1007c3fd7: mov rdi, qword ptr [r15 + 0x430]
0x1007c3fde: mov rsi, r14
0x1007c3fe1: call 0x1001a7bb0 ; 0x1001a7bb0
0x1007c3fe6: inc qword ptr [r15 + 0x438]
0x1007c3fed: add rsp, 0x28
0x1007c3ff1: pop rbx
0x1007c3ff2: pop r12
0x1007c3ff4: pop r13
0x1007c3ff6: pop r14
0x1007c3ff8: pop r15
0x1007c3ffa: pop rbp
0x1007c3ffb: ret 
0x1007c3ffc: mov rax, qword ptr [r14 + 0x28]
0x1007c4000: lea rcx, [rax + 8]
0x1007c4004: test rax, rax
0x1007c4007: cmove rcx, rax
0x1007c400b: mov qword ptr [rbp - 0x48], rcx
0x1007c400f: lea rdi, [rbp - 0x48]
0x1007c4013: call 0x1004d10f0 ; 0x1004d10f0
0x1007c4018: mov r9, qword ptr [rax + 8]
0x1007c401c: mov rax, qword ptr [rbp - 0x38]
0x1007c4020: mov qword ptr [rsp], rax
0x1007c4024: lea rdi, [rip + 0x3e0831] ; 0x100ba485c &GetMetaClass( &res ) != &GetMetaClass( it->second )
0x1007c402b: lea rsi, [rip + 0x3e055c] ; 0x100ba458e Resource.cpp
0x1007c4032: lea r8, [rip + 0x3e0858] ; 0x100ba4891
0x1007c4039: mov edx, 0x19e
0x1007c403e: mov ecx, 4
0x1007c4043: xor eax, eax
0x1007c4045: call 0x1007e6030 ; 0x1007e6030
0x1007c404a: ud2 
0x1007c404c: lea rdi, [rip + 0x3e07cb] ; 0x100ba481e name[0] != '\0'
0x1007c4053: lea rsi, [rip + 0x3e0534] ; 0x100ba458e Resource.cpp
0x1007c405a: lea r8, [rip + 0x3e07cd] ; 0x100ba482e Attempted to load Resource with an empty name
0x1007c4061: mov edx, 0x196
0x1007c4066: mov ecx, 4
0x1007c406b: xor eax, eax
0x1007c406d: call 0x1007e6030 ; 0x1007e6030
0x1007c4072: ud2 
0x1007c4074: nop word ptr cs:[rax + rax]
