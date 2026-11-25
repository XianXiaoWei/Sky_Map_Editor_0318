0x1004d0b60: push rbp
0x1004d0b61: mov rbp, rsp
0x1004d0b64: push r15
0x1004d0b66: push r14
0x1004d0b68: push r13
0x1004d0b6a: push r12
0x1004d0b6c: push rbx
0x1004d0b6d: sub rsp, 0x38
0x1004d0b71: mov rbx, rsi
0x1004d0b74: mov r15, rdi
0x1004d0b77: xor esi, esi
0x1004d0b79: mov rdi, rbx
0x1004d0b7c: call 0x1007abc80 ; 0x1007abc80
0x1004d0b81: mov r14, rax
0x1004d0b84: mov qword ptr [rbp - 0x50], r14
0x1004d0b88: test r14, r14
0x1004d0b8b: je 0x1004d0d41
0x1004d0b91: add r15, 0x20
0x1004d0b95: mov r12, r14
0x1004d0b98: jmp 0x1004d0ba5 ; 0x1004d0ba5
0x1004d0b9a: nop word ptr [rax + rax]
0x1004d0ba0: call rax
0x1004d0ba2: mov r12, rax
0x1004d0ba5: mov rax, qword ptr [r15]
0x1004d0ba8: test rax, rax
0x1004d0bab: je 0x1004d0bd3
0x1004d0bad: mov rbx, r15
0x1004d0bb0: lea rcx, [rax + 8]
0x1004d0bb4: cmp qword ptr [rax + 0x20], r12
0x1004d0bb8: cmovae rcx, rax
0x1004d0bbc: cmovae rbx, rax
0x1004d0bc0: mov rax, qword ptr [rcx]
0x1004d0bc3: test rax, rax
0x1004d0bc6: jne 0x1004d0bb0
0x1004d0bc8: cmp rbx, r15
0x1004d0bcb: je 0x1004d0bd3
0x1004d0bcd: cmp qword ptr [rbx + 0x20], r12
0x1004d0bd1: jbe 0x1004d0bf5
0x1004d0bd3: mov rax, qword ptr [r12 + 0x30]
0x1004d0bd8: test rax, rax
0x1004d0bdb: je 0x1004d0d15
0x1004d0be1: call rax
0x1004d0be3: mov rax, qword ptr [r12 + 0x30]
0x1004d0be8: mov r12d, 0
0x1004d0bee: test rax, rax
0x1004d0bf1: je 0x1004d0ba5
0x1004d0bf3: jmp 0x1004d0ba0 ; 0x1004d0ba0
0x1004d0bf5: cmp qword ptr [rbx + 0x38], 0
0x1004d0bfa: je 0x1004d0d6c
0x1004d0c00: mov qword ptr [rbp - 0x40], 0
0x1004d0c08: call 0x1007abc10 ; 0x1007abc10
0x1004d0c0d: mov r14, rax
0x1004d0c10: mov r13, qword ptr [rbx + 0x38]
0x1004d0c14: mov eax, dword ptr [r13 + 0x30]
0x1004d0c18: cmp eax, 1
0x1004d0c1b: je 0x1004d0c71
0x1004d0c1d: test eax, eax
0x1004d0c1f: jne 0x1004d0d8c
0x1004d0c25: mov r12, qword ptr [rbx + 0x28]
0x1004d0c29: mov r15, qword ptr [rbx + 0x30]
0x1004d0c2d: mov qword ptr [rbp - 0x38], 0
0x1004d0c35: call qword ptr [r13 + 0x58]
0x1004d0c39: mov rbx, qword ptr [rax]
0x1004d0c3c: lea rsi, [rbp - 0x38]
0x1004d0c40: mov rdi, rax
0x1004d0c43: mov rdx, r12
0x1004d0c46: mov rcx, r15
0x1004d0c49: call qword ptr [rbx + 0x40]
0x1004d0c4c: mov rdx, qword ptr [rbp - 0x38]
0x1004d0c50: test rdx, rdx
0x1004d0c53: je 0x1004d0db4
0x1004d0c59: mov rdi, qword ptr [r13 + 0x38]
0x1004d0c5d: mov rsi, qword ptr [r13 + 0x40]
0x1004d0c61: mov dword ptr [rsp], 0
0x1004d0c68: lea rcx, [rbp - 0x40]
0x1004d0c6c: xor r9d, r9d
0x1004d0c6f: jmp 0x1004d0cd1 ; 0x1004d0cd1
0x1004d0c71: lea rax, [rbp - 0x50]
0x1004d0c75: mov qword ptr [rbp - 0x38], rax
0x1004d0c79: call 0x1007abc30 ; 0x1007abc30
0x1004d0c7e: mov qword ptr [rbp - 0x30], rax
0x1004d0c82: mov r13, qword ptr [rbx + 0x38]
0x1004d0c86: mov r12, qword ptr [rbx + 0x28]
0x1004d0c8a: mov r15, qword ptr [rbx + 0x30]
0x1004d0c8e: mov qword ptr [rbp - 0x48], 0
0x1004d0c96: call qword ptr [r13 + 0x58]
0x1004d0c9a: mov rbx, qword ptr [rax]
0x1004d0c9d: lea rsi, [rbp - 0x48]
0x1004d0ca1: mov rdi, rax
0x1004d0ca4: mov rdx, r12
0x1004d0ca7: mov rcx, r15
0x1004d0caa: call qword ptr [rbx + 0x40]
0x1004d0cad: mov rdx, qword ptr [rbp - 0x48]
0x1004d0cb1: test rdx, rdx
0x1004d0cb4: je 0x1004d0db4
0x1004d0cba: mov rdi, qword ptr [r13 + 0x38]
0x1004d0cbe: mov rsi, qword ptr [r13 + 0x40]
0x1004d0cc2: mov dword ptr [rsp], 1
0x1004d0cc9: lea rcx, [rbp - 0x40]
0x1004d0ccd: lea r9, [rbp - 0x38]
0x1004d0cd1: mov r8, r14
0x1004d0cd4: call qword ptr [r13 + 0x48]
0x1004d0cd8: mov qword ptr [rbp - 0x38], 0
0x1004d0ce0: call 0x1007abc10 ; 0x1007abc10
0x1004d0ce5: mov rbx, qword ptr [rax]
0x1004d0ce8: lea rsi, [rbp - 0x38]
0x1004d0cec: lea rdx, [rbp - 0x40]
0x1004d0cf0: mov rdi, rax
0x1004d0cf3: mov rcx, r14
0x1004d0cf6: call qword ptr [rbx + 0x40]
0x1004d0cf9: mov rax, qword ptr [rbp - 0x38]
0x1004d0cfd: test rax, rax
0x1004d0d00: je 0x1004d0dd3
0x1004d0d06: add rsp, 0x38
0x1004d0d0a: pop rbx
0x1004d0d0b: pop r12
0x1004d0d0d: pop r13
0x1004d0d0f: pop r14
0x1004d0d11: pop r15
0x1004d0d13: pop rbp
0x1004d0d14: ret 
0x1004d0d15: mov r9, qword ptr [r14 + 8]
0x1004d0d19: lea rdi, [rip + 0x6bd1cb] ; 0x100b8deeb it != m_factoryMap.end()
0x1004d0d20: lea rsi, [rip + 0x6bcf7b] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0d27: lea r8, [rip + 0x6bd1d6] ; 0x100b8df04 Unable to find factory for type %s.
0x1004d0d2e: mov edx, 0x91
0x1004d0d33: mov ecx, 4
0x1004d0d38: xor eax, eax
0x1004d0d3a: call 0x1007e6030 ; 0x1007e6030
0x1004d0d3f: ud2 
0x1004d0d41: lea rdi, [rip + 0x68f854] ; 0x100b6059c metaClass
0x1004d0d48: lea rsi, [rip + 0x6bcf53] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0d4f: lea r8, [rip + 0x6bd0a8] ; 0x100b8ddfe Couldn't find MetaClass for type %s
0x1004d0d56: mov edx, 0x56
0x1004d0d5b: mov ecx, 4
0x1004d0d60: xor eax, eax
0x1004d0d62: mov r9, rbx
0x1004d0d65: call 0x1007e6030 ; 0x1007e6030
0x1004d0d6a: ud2 
0x1004d0d6c: mov r9, qword ptr [r14 + 8]
0x1004d0d70: lea rdi, [rip + 0x6bd0ab] ; 0x100b8de22 factory->createFun
0x1004d0d77: lea rsi, [rip + 0x6bcf24] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0d7e: lea r8, [rip + 0x6bd0b0] ; 0x100b8de35 No Create function registered for type %s
0x1004d0d85: mov edx, 0x59
0x1004d0d8a: jmp 0x1004d0d33 ; 0x1004d0d33
0x1004d0d8c: lea rdi, [rip + 0x6d2299] ; 0x100ba302c false
0x1004d0d93: lea rsi, [rip + 0x6bcf08] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0d9a: lea r8, [rip + 0x6bd0be] ; 0x100b8de5f Create Function must take 0 or 1 argument of type const MetaClass*
0x1004d0da1: mov edx, 0x69
0x1004d0da6: mov ecx, 4
0x1004d0dab: xor eax, eax
0x1004d0dad: call 0x1007e6030 ; 0x1007e6030
0x1004d0db2: ud2 
0x1004d0db4: lea rdi, [rip + 0x6a70bb] ; 0x100b77e76 c
0x1004d0dbb: lea rsi, [rip + 0x68c816] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d0dc2: mov edx, 0x443
0x1004d0dc7: mov ecx, 3
0x1004d0dcc: call 0x1007e5f70 ; 0x1007e5f70
0x1004d0dd1: ud2 
0x1004d0dd3: lea rdi, [rip + 0x6bd0c8] ; 0x100b8dea2 newObject
0x1004d0dda: lea rsi, [rip + 0x6bcec1] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d0de1: mov edx, 0x6d
0x1004d0de6: mov ecx, 3
0x1004d0deb: call 0x1007e5f70 ; 0x1007e5f70
0x1004d0df0: ud2 
0x1004d0df2: nop word ptr cs:[rax + rax]
