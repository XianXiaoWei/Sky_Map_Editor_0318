0x100039f40: push rbp
0x100039f41: mov rbp, rsp
0x100039f44: push r15
0x100039f46: push r14
0x100039f48: push r13
0x100039f4a: push r12
0x100039f4c: push rbx
0x100039f4d: sub rsp, 0x18
0x100039f51: mov rbx, rsi
0x100039f54: mov r15, rdi
0x100039f57: test rbx, rbx
0x100039f5a: je 0x10003a09d
0x100039f60: call 0x10032e2b0 ; 0x10032e2b0
0x100039f65: cmp rax, rbx
0x100039f68: je 0x100039f88
0x100039f6a: cmp dword ptr [rax + 0x3c], -1
0x100039f6e: je 0x10003a071
0x100039f74: mov rax, qword ptr [rax + 0x40]
0x100039f78: mov rcx, qword ptr [rbx + 0x40]
0x100039f7c: and rcx, rax
0x100039f7f: cmp rcx, rax
0x100039f82: jne 0x10003a071
0x100039f88: mov r14, qword ptr [r15 + 0x5030]
0x100039f8f: test r14, r14
0x100039f92: je 0x10003a0bc
0x100039f98: mov rax, qword ptr [r14 + 8]
0x100039f9c: mov qword ptr [r15 + 0x5030], rax
0x100039fa3: cmp qword ptr [r14], 0
0x100039fa7: jne 0x10003a0e4
0x100039fad: mov qword ptr [rbp - 0x38], r15
0x100039fb1: lea r15, [r15 + 0x5040]
0x100039fb8: mov rax, qword ptr [rbx]
0x100039fbb: mov rdi, rbx
0x100039fbe: call qword ptr [rax + 0xa0]
0x100039fc4: mov r12, rax
0x100039fc7: lea rax, [rip + 0x1dba88a] ; 0x101df4858
0x100039fce: mov r13, qword ptr [rax]
0x100039fd1: mov rax, qword ptr [rbx]
0x100039fd4: mov rdi, rbx
0x100039fd7: call qword ptr [rax + 0xa8]
0x100039fdd: mov rdi, r15
0x100039fe0: mov rsi, r12
0x100039fe3: mov rdx, r13
0x100039fe6: mov rcx, rax
0x100039fe9: call 0x100795530 ; 0x100795530
0x100039fee: mov r15, rax
0x100039ff1: mov rax, qword ptr [rbx]
0x100039ff4: mov rdi, rbx
0x100039ff7: call qword ptr [rax + 0xa0]
0x100039ffd: mov esi, 0xcd
0x10003a002: mov rdi, r15
0x10003a005: mov rdx, rax
0x10003a008: call 0x100aa2900 ; 0x100aa2900 _memset
0x10003a00d: mov rax, qword ptr [rbx]
0x10003a010: mov rdi, rbx
0x10003a013: mov rsi, r15
0x10003a016: call qword ptr [rax + 0xc0]
0x10003a01c: mov qword ptr [rbp - 0x40], rax
0x10003a020: mov qword ptr [rbp - 0x30], 0
0x10003a028: call 0x10032e2b0 ; 0x10032e2b0
0x10003a02d: mov r8, qword ptr [rax]
0x10003a030: lea rsi, [rbp - 0x30]
0x10003a034: lea rdx, [rbp - 0x40]
0x10003a038: mov rdi, rax
0x10003a03b: mov rcx, rbx
0x10003a03e: call qword ptr [r8 + 0x40]
0x10003a042: mov rax, qword ptr [rbp - 0x30]
0x10003a046: mov qword ptr [r14], rax
0x10003a049: test rax, rax
0x10003a04c: je 0x10003a103
0x10003a052: mov byte ptr [rax + 0x20], 0
0x10003a056: mov byte ptr [rax + 0x24], 1
0x10003a05a: mov rcx, qword ptr [rbp - 0x38]
0x10003a05e: mov qword ptr [rax + 0x18], rcx
0x10003a062: add rsp, 0x18
0x10003a066: pop rbx
0x10003a067: pop r12
0x10003a069: pop r13
0x10003a06b: pop r14
0x10003a06d: pop r15
0x10003a06f: pop rbp
0x10003a070: ret 
0x10003a071: mov r9, qword ptr [rbx + 8]
0x10003a075: lea rdi, [rip + 0xb26534] ; 0x100b605b0 metaClass->IsArgClassOrSuperclass( GetMetaClassByType< Event >() )
0x10003a07c: lea rsi, [rip + 0xb26523] ; 0x100b605a6 ./Event.h
0x10003a083: lea r8, [rip + 0xb26569] ; 0x100b605f3 Can't instantiate non-Event '%s'
0x10003a08a: mov edx, 0xae
0x10003a08f: mov ecx, 4
0x10003a094: xor eax, eax
0x10003a096: call 0x1007e6030 ; 0x1007e6030
0x10003a09b: ud2 
0x10003a09d: lea rdi, [rip + 0xb264f8] ; 0x100b6059c metaClass
0x10003a0a4: lea rsi, [rip + 0xb264fb] ; 0x100b605a6 ./Event.h
0x10003a0ab: mov edx, 0xad
0x10003a0b0: mov ecx, 3
0x10003a0b5: call 0x1007e5f70 ; 0x1007e5f70
0x10003a0ba: ud2 
0x10003a0bc: lea rdi, [rip + 0xb26551] ; 0x100b60614 m_freeListHead
0x10003a0c3: lea rsi, [rip + 0xb264dc] ; 0x100b605a6 ./Event.h
0x10003a0ca: lea r8, [rip + 0xb26552] ; 0x100b60623 Ran out of free Events!
0x10003a0d1: mov edx, 0xaf
0x10003a0d6: mov ecx, 4
0x10003a0db: xor eax, eax
0x10003a0dd: call 0x1007e6030 ; 0x1007e6030
0x10003a0e2: ud2 
0x10003a0e4: lea rdi, [rip + 0xb26550] ; 0x100b6063b !nextNode->event
0x10003a0eb: lea rsi, [rip + 0xb264b4] ; 0x100b605a6 ./Event.h
0x10003a0f2: mov edx, 0xb4
0x10003a0f7: mov ecx, 3
0x10003a0fc: call 0x1007e5f70 ; 0x1007e5f70
0x10003a101: ud2 
0x10003a103: lea rdi, [rip + 0xb26542] ; 0x100b6064c nextNode->event
0x10003a10a: lea rsi, [rip + 0xb26495] ; 0x100b605a6 ./Event.h
0x10003a111: mov edx, 0xbd
0x10003a116: mov ecx, 3
0x10003a11b: call 0x1007e5f70 ; 0x1007e5f70
0x10003a120: ud2 
0x10003a122: nop word ptr cs:[rax + rax]
