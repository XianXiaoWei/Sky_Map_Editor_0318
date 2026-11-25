0x1004d0e00: push rbp
0x1004d0e01: mov rbp, rsp
0x1004d0e04: push r15
0x1004d0e06: push r14
0x1004d0e08: push r13
0x1004d0e0a: push r12
0x1004d0e0c: push rbx
0x1004d0e0d: sub rsp, 0x28
0x1004d0e11: mov r14, rsi
0x1004d0e14: mov r12, rdi
0x1004d0e17: mov qword ptr [rbp - 0x48], r14
0x1004d0e1b: test r14, r14
0x1004d0e1e: je 0x1004d0e2a
0x1004d0e20: mov edi, dword ptr [r14]
0x1004d0e23: call 0x1007abd30 ; 0x1007abd30
0x1004d0e28: jmp 0x1004d0e2f ; 0x1004d0e2f
0x1004d0e2a: call 0x1007abbf0 ; 0x1007abbf0
0x1004d0e2f: mov rcx, qword ptr [rax]
0x1004d0e32: mov rdi, rax
0x1004d0e35: call qword ptr [rcx + 0x68]
0x1004d0e38: mov r15, rax
0x1004d0e3b: test r15, r15
0x1004d0e3e: jne 0x1004d0e48
0x1004d0e40: call 0x1007abc60 ; 0x1007abc60
0x1004d0e45: mov r15, rax
0x1004d0e48: add r12, 0x20
0x1004d0e4c: mov r13, r15
0x1004d0e4f: jmp 0x1004d0e65 ; 0x1004d0e65
0x1004d0e51: nop word ptr cs:[rax + rax]
0x1004d0e60: call rax
0x1004d0e62: mov r13, rax
0x1004d0e65: mov rax, qword ptr [r12]
0x1004d0e69: test rax, rax
0x1004d0e6c: je 0x1004d0ea3
0x1004d0e6e: mov rbx, r12
0x1004d0e71: nop word ptr cs:[rax + rax]
0x1004d0e80: lea rcx, [rax + 8]
0x1004d0e84: cmp qword ptr [rax + 0x20], r13
0x1004d0e88: cmovae rcx, rax
0x1004d0e8c: cmovae rbx, rax
0x1004d0e90: mov rax, qword ptr [rcx]
0x1004d0e93: test rax, rax
0x1004d0e96: jne 0x1004d0e80
0x1004d0e98: cmp rbx, r12
0x1004d0e9b: je 0x1004d0ea3
0x1004d0e9d: cmp qword ptr [rbx + 0x20], r13
0x1004d0ea1: jbe 0x1004d0ec3
0x1004d0ea3: mov rax, qword ptr [r13 + 0x30]
0x1004d0ea7: test rax, rax
0x1004d0eaa: je 0x1004d0f4a
0x1004d0eb0: call rax
0x1004d0eb2: mov rax, qword ptr [r13 + 0x30]
0x1004d0eb6: mov r13d, 0
0x1004d0ebc: test rax, rax
0x1004d0ebf: je 0x1004d0e65
0x1004d0ec1: jmp 0x1004d0e60 ; 0x1004d0e60
0x1004d0ec3: cmp qword ptr [rbx + 0x40], 0
0x1004d0ec8: je 0x1004d0f76
0x1004d0ece: lea rax, [rbp - 0x48]
0x1004d0ed2: mov qword ptr [rbp - 0x40], rax
0x1004d0ed6: call 0x1007abc10 ; 0x1007abc10
0x1004d0edb: mov qword ptr [rbp - 0x38], rax
0x1004d0edf: mov r13, qword ptr [rbx + 0x40]
0x1004d0ee3: mov r12, qword ptr [rbx + 0x28]
0x1004d0ee7: mov r15, qword ptr [rbx + 0x30]
0x1004d0eeb: call 0x1007abbf0 ; 0x1007abbf0
0x1004d0ef0: mov r14, rax
0x1004d0ef3: mov qword ptr [rbp - 0x30], 0
0x1004d0efb: call qword ptr [r13 + 0x58]
0x1004d0eff: mov rbx, qword ptr [rax]
0x1004d0f02: lea rsi, [rbp - 0x30]
0x1004d0f06: mov rdi, rax
0x1004d0f09: mov rdx, r12
0x1004d0f0c: mov rcx, r15
0x1004d0f0f: call qword ptr [rbx + 0x40]
0x1004d0f12: mov rdx, qword ptr [rbp - 0x30]
0x1004d0f16: test rdx, rdx
0x1004d0f19: je 0x1004d0fa3
0x1004d0f1f: mov rdi, qword ptr [r13 + 0x38]
0x1004d0f23: mov rsi, qword ptr [r13 + 0x40]
0x1004d0f27: mov dword ptr [rsp], 1
0x1004d0f2e: lea r9, [rbp - 0x40]
0x1004d0f32: xor ecx, ecx
0x1004d0f34: mov r8, r14
0x1004d0f37: call qword ptr [r13 + 0x48]
0x1004d0f3b: add rsp, 0x28
0x1004d0f3f: pop rbx
0x1004d0f40: pop r12
0x1004d0f42: pop r13
0x1004d0f44: pop r14
0x1004d0f46: pop r15
0x1004d0f48: pop rbp
0x1004d0f49: ret 
0x1004d0f4a: mov r9, qword ptr [r15 + 8]
0x1004d0f4e: lea rdi, [rip + 0x6bcf96] ; 0x100b8deeb it != m_factoryMap.end()
0x1004d0f55: lea rsi, [rip + 0x6bcd46] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0f5c: lea r8, [rip + 0x6bcfa1] ; 0x100b8df04 Unable to find factory for type %s.
0x1004d0f63: mov edx, 0x91
0x1004d0f68: mov ecx, 4
0x1004d0f6d: xor eax, eax
0x1004d0f6f: call 0x1007e6030 ; 0x1007e6030
0x1004d0f74: ud2 
0x1004d0f76: mov qword ptr [rbp - 0x40], r14
0x1004d0f7a: lea rdi, [rbp - 0x40]
0x1004d0f7e: call 0x1004d10f0 ; 0x1004d10f0
0x1004d0f83: mov r9, qword ptr [rax + 8]
0x1004d0f87: lea rdi, [rip + 0x6bcf1e] ; 0x100b8deac factory->releaseFun
0x1004d0f8e: lea rsi, [rip + 0x6bcd0d] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0f95: lea r8, [rip + 0x6bcf24] ; 0x100b8dec0 No Release function registered for type %s
0x1004d0f9c: mov edx, 0x74
0x1004d0fa1: jmp 0x1004d0f68 ; 0x1004d0f68
0x1004d0fa3: lea rdi, [rip + 0x6a6ecc] ; 0x100b77e76 c
0x1004d0faa: lea rsi, [rip + 0x68c627] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d0fb1: mov edx, 0x443
0x1004d0fb6: mov ecx, 3
0x1004d0fbb: call 0x1007e5f70 ; 0x1007e5f70
0x1004d0fc0: ud2 
0x1004d0fc2: nop word ptr cs:[rax + rax]
