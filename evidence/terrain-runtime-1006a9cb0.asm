0x1006a9cb0: push rbp
0x1006a9cb1: mov rbp, rsp
0x1006a9cb4: push r15
0x1006a9cb6: push r14
0x1006a9cb8: push r13
0x1006a9cba: push r12
0x1006a9cbc: push rbx
0x1006a9cbd: sub rsp, 0x38
0x1006a9cc1: mov r12, rsi
0x1006a9cc4: mov qword ptr [rbp - 0x30], rdi
0x1006a9cc8: mov byte ptr [r12 + 0x5e6], 0
0x1006a9cd1: cmp dword ptr [r12 + 0x1d8], 0
0x1006a9cda: je 0x1006a9db3
0x1006a9ce0: mov rax, qword ptr [rbp - 0x30]
0x1006a9ce4: lea r15, [rax + 0x470]
0x1006a9ceb: lea rcx, [rax + 0x4b8]
0x1006a9cf2: mov qword ptr [rbp - 0x50], rcx
0x1006a9cf6: lea rax, [rax + 0x4f0]
0x1006a9cfd: mov qword ptr [rbp - 0x48], rax
0x1006a9d01: xor r14d, r14d
0x1006a9d04: lea rbx, [rbp - 0x38]
0x1006a9d08: mov qword ptr [rbp - 0x40], r15
0x1006a9d0c: nop dword ptr [rax]
0x1006a9d10: mov rdi, rbx
0x1006a9d13: mov rsi, r15
0x1006a9d16: call 0x1007e9360 ; 0x1007e9360
0x1006a9d1b: mov r13, qword ptr [r12 + 0x1a8]
0x1006a9d23: mov rcx, qword ptr [r12 + 0x1b0]
0x1006a9d2b: mov r14d, r14d
0x1006a9d2e: movzx eax, word ptr [r13 + r14*2]
0x1006a9d34: cmp eax, 2
0x1006a9d37: ja 0x1006a9d8a
0x1006a9d39: mov qword ptr [rbp - 0x58], rcx
0x1006a9d3d: mov r15, r12
0x1006a9d40: mov r12, qword ptr [r12 + 0x1c8]
0x1006a9d48: imul rbx, r14, 0x3e0
0x1006a9d4f: lea rsi, [r12 + rbx + 0x20]
0x1006a9d54: mov rdi, qword ptr [rbp - 0x50]
0x1006a9d58: call 0x10077e4b0 ; 0x10077e4b0
0x1006a9d5d: lea rsi, [r12 + rbx + 0x30]
0x1006a9d62: mov rdi, qword ptr [rbp - 0x48]
0x1006a9d66: call 0x10077e4b0 ; 0x10077e4b0
0x1006a9d6b: add r12, rbx
0x1006a9d6e: mov esi, 0x3e0
0x1006a9d73: mov rdi, r12
0x1006a9d76: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1006a9d7b: mov r12, r15
0x1006a9d7e: mov r15, qword ptr [rbp - 0x40]
0x1006a9d82: lea rbx, [rbp - 0x38]
0x1006a9d86: mov rcx, qword ptr [rbp - 0x58]
0x1006a9d8a: mov word ptr [r13 + r14*2], 0xffff
0x1006a9d92: mov word ptr [rcx + r14*2], 0xfffe
0x1006a9d99: mov rdi, rbx
0x1006a9d9c: call 0x1007e9480 ; 0x1007e9480
0x1006a9da1: lea r14d, [r14 + 1]
0x1006a9da5: cmp r14d, dword ptr [r12 + 0x1d8]
0x1006a9dad: jb 0x1006a9d10
0x1006a9db3: mov rsi, qword ptr [r12 + 0x598]
0x1006a9dbb: test rsi, rsi
0x1006a9dbe: mov r14, qword ptr [rbp - 0x30]
0x1006a9dc2: je 0x1006a9df0
0x1006a9dc4: mov rdi, qword ptr [r14 + 0x318]
0x1006a9dcb: call 0x100779200 ; 0x100779200
0x1006a9dd0: mov rdi, qword ptr [r14 + 0x318]
0x1006a9dd7: mov esi, dword ptr [r12 + 0x590]
0x1006a9ddf: call 0x100778e30 ; 0x100778e30
0x1006a9de4: mov qword ptr [r12 + 0x598], 0
0x1006a9df0: lea rcx, [r14 + 0xe6c80]
0x1006a9df7: mov eax, dword ptr [r14 + 0xe6c78]
0x1006a9dfe: test rax, rax
0x1006a9e01: je 0x1006a9e24
0x1006a9e03: lea rdx, [rax*8]
0x1006a9e0b: nop dword ptr [rax + rax]
0x1006a9e10: cmp qword ptr [rcx], r12
0x1006a9e13: je 0x1006a9e24
0x1006a9e15: add rcx, 8
0x1006a9e19: add rdx, -8
0x1006a9e1d: jne 0x1006a9e10
0x1006a9e1f: jmp 0x1006a9ed8 ; 0x1006a9ed8
0x1006a9e24: lea rdx, [r14 + rax*8 + 0xe6c80]
0x1006a9e2c: cmp rcx, rdx
0x1006a9e2f: je 0x1006a9ed8
0x1006a9e35: lea rsi, [rcx + 8]
0x1006a9e39: cmp rsi, rdx
0x1006a9e3c: je 0x1006a9ed8
0x1006a9e42: lea r8, [rax*8 + 0xe6c70]
0x1006a9e4a: sub r8, rcx
0x1006a9e4d: add r8, r14
0x1006a9e50: mov edi, r8d
0x1006a9e53: shr edi, 3
0x1006a9e56: inc edi
0x1006a9e58: and rdi, 3
0x1006a9e5c: je 0x1006a9e88
0x1006a9e5e: neg rdi
0x1006a9e61: nop word ptr cs:[rax + rax]
0x1006a9e70: mov rbx, qword ptr [rsi]
0x1006a9e73: cmp rbx, r12
0x1006a9e76: je 0x1006a9e7f
0x1006a9e78: mov qword ptr [rcx], rbx
0x1006a9e7b: add rcx, 8
0x1006a9e7f: add rsi, 8
0x1006a9e83: inc rdi
0x1006a9e86: jne 0x1006a9e70
0x1006a9e88: cmp r8, 0x18
0x1006a9e8c: jb 0x1006a9ed8
0x1006a9e8e: nop 
0x1006a9e90: mov rdi, qword ptr [rsi]
0x1006a9e93: cmp rdi, r12
0x1006a9e96: je 0x1006a9e9f
0x1006a9e98: mov qword ptr [rcx], rdi
0x1006a9e9b: add rcx, 8
0x1006a9e9f: mov rdi, qword ptr [rsi + 8]
0x1006a9ea3: cmp rdi, r12
0x1006a9ea6: je 0x1006a9eaf
0x1006a9ea8: mov qword ptr [rcx], rdi
0x1006a9eab: add rcx, 8
0x1006a9eaf: mov rdi, qword ptr [rsi + 0x10]
0x1006a9eb3: cmp rdi, r12
0x1006a9eb6: je 0x1006a9ebf
0x1006a9eb8: mov qword ptr [rcx], rdi
0x1006a9ebb: add rcx, 8
0x1006a9ebf: mov rdi, qword ptr [rsi + 0x18]
0x1006a9ec3: cmp rdi, r12
0x1006a9ec6: je 0x1006a9ecf
0x1006a9ec8: mov qword ptr [rcx], rdi
0x1006a9ecb: add rcx, 8
0x1006a9ecf: add rsi, 0x20
0x1006a9ed3: cmp rsi, rdx
0x1006a9ed6: jne 0x1006a9e90
0x1006a9ed8: dec eax
0x1006a9eda: mov dword ptr [r14 + 0xe6c78], eax
0x1006a9ee1: mov rdi, qword ptr [r14 + 0x340]
0x1006a9ee8: mov rsi, qword ptr [r12 + 0x1a0]
0x1006a9ef0: call 0x100795a70 ; 0x100795a70
0x1006a9ef5: mov rdi, qword ptr [r14 + 0x340]
0x1006a9efc: mov rsi, qword ptr [r12 + 0x1b8]
0x1006a9f04: call 0x100795a70 ; 0x100795a70
0x1006a9f09: mov rdi, qword ptr [r14 + 0x340]
0x1006a9f10: mov rsi, qword ptr [r12 + 0x1c0]
0x1006a9f18: call 0x100795a70 ; 0x100795a70
0x1006a9f1d: mov rdi, qword ptr [r14 + 0x340]
0x1006a9f24: mov rsi, qword ptr [r12 + 0x1a8]
0x1006a9f2c: call 0x100795a70 ; 0x100795a70
0x1006a9f31: mov rdi, qword ptr [r14 + 0x340]
0x1006a9f38: mov rsi, qword ptr [r12 + 0x1b0]
0x1006a9f40: call 0x100795a70 ; 0x100795a70
0x1006a9f45: mov rdi, qword ptr [r14 + 0x340]
0x1006a9f4c: mov rsi, qword ptr [r12 + 0x1d0]
0x1006a9f54: call 0x100795a70 ; 0x100795a70
0x1006a9f59: mov rsi, qword ptr [r12 + 0x1c8]
0x1006a9f61: test rsi, rsi
0x1006a9f64: je 0x1006a9f72
0x1006a9f66: mov rdi, qword ptr [r14 + 0x340]
0x1006a9f6d: call 0x100795a70 ; 0x100795a70
0x1006a9f72: mov ebx, 0x77
0x1006a9f77: nop word ptr [rax + rax]
0x1006a9f80: mov rdi, qword ptr [r14 + 0x340]
0x1006a9f87: mov rsi, qword ptr [r12 + rbx*8]
0x1006a9f8b: call 0x100795a70 ; 0x100795a70
0x1006a9f90: inc rbx
0x1006a9f93: cmp rbx, 0xb2
0x1006a9f9a: jne 0x1006a9f80
0x1006a9f9c: mov rax, qword ptr [r14 + 0xe6c70]
0x1006a9fa3: mov qword ptr [r12], rax
0x1006a9fa7: mov qword ptr [r14 + 0xe6c70], r12
0x1006a9fae: add rsp, 0x38
0x1006a9fb2: pop rbx
0x1006a9fb3: pop r12
0x1006a9fb5: pop r13
0x1006a9fb7: pop r14
0x1006a9fb9: pop r15
0x1006a9fbb: pop rbp
0x1006a9fbc: ret 
0x1006a9fbd: mov rbx, rax
0x1006a9fc0: lea rdi, [rbp - 0x38]
0x1006a9fc4: call 0x1007e9480 ; 0x1007e9480
0x1006a9fc9: mov rdi, rbx
0x1006a9fcc: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a9fd1: nop word ptr cs:[rax + rax]
