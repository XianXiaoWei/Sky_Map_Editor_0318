0x1007b1b40: push rbp
0x1007b1b41: mov rbp, rsp
0x1007b1b44: push r15
0x1007b1b46: push r14
0x1007b1b48: push r13
0x1007b1b4a: push r12
0x1007b1b4c: push rbx
0x1007b1b4d: sub rsp, 0x88
0x1007b1b54: mov dword ptr [rbp - 0x78], ecx
0x1007b1b57: mov dword ptr [rbp - 0x8c], edx
0x1007b1b5d: mov rbx, rdi
0x1007b1b60: mov rax, qword ptr [rip + 0x45bd71] ; 0x100c0d8d8
0x1007b1b67: mov rax, qword ptr [rax]
0x1007b1b6a: mov qword ptr [rbp - 0x30], rax
0x1007b1b6e: lea rdi, [rbp - 0x68]
0x1007b1b72: mov edx, 0x20
0x1007b1b77: mov qword ptr [rbp - 0x80], rsi
0x1007b1b7b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1007b1b80: mov r14, qword ptr [rbx + 0x40]
0x1007b1b84: mov qword ptr [rbp - 0x98], rbx
0x1007b1b8b: mov r12d, dword ptr [rbx + 0x48]
0x1007b1b8f: imul rcx, r12, 0x38
0x1007b1b93: add rcx, r14
0x1007b1b96: mov qword ptr [rbp - 0x70], rcx
0x1007b1b9a: test r12, r12
0x1007b1b9d: je 0x1007b1bf3
0x1007b1b9f: lea r15, [rbp - 0x68]
0x1007b1ba3: mov rbx, r12
0x1007b1ba6: nop word ptr cs:[rax + rax]
0x1007b1bb0: shr rbx, 0x3f
0x1007b1bb4: add rbx, r12
0x1007b1bb7: sar rbx, 1
0x1007b1bba: imul r13, rbx, 0x38
0x1007b1bbe: lea rdi, [r14 + r13]
0x1007b1bc2: mov rsi, r15
0x1007b1bc5: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b1bca: test eax, eax
0x1007b1bcc: js 0x1007b1be0
0x1007b1bce: mov r12, rbx
0x1007b1bd1: test rbx, rbx
0x1007b1bd4: jne 0x1007b1bb0
0x1007b1bd6: jmp 0x1007b1bf3 ; 0x1007b1bf3
0x1007b1bd8: nop dword ptr [rax + rax]
0x1007b1be0: dec r12
0x1007b1be3: sub r12, rbx
0x1007b1be6: lea r14, [r14 + r13 + 0x38]
0x1007b1beb: mov rbx, r12
0x1007b1bee: test rbx, rbx
0x1007b1bf1: jne 0x1007b1bb0
0x1007b1bf3: cmp r14, qword ptr [rbp - 0x70]
0x1007b1bf7: mov rbx, qword ptr [rbp - 0x80]
0x1007b1bfb: je 0x1007b1e9e
0x1007b1c01: mov qword ptr [rbp - 0x70], r14
0x1007b1c05: mov rdi, qword ptr [rbp - 0x70]
0x1007b1c09: mov rsi, rbx
0x1007b1c0c: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007b1c11: mov rdx, qword ptr [rbp - 0x70]
0x1007b1c15: test eax, eax
0x1007b1c17: jne 0x1007b1e9e
0x1007b1c1d: mov ebx, dword ptr [rdx + 0x30]
0x1007b1c20: test ebx, ebx
0x1007b1c22: je 0x1007b1e58
0x1007b1c28: cmp dword ptr [rbp - 0x78], 0
0x1007b1c2c: je 0x1007b1d52
0x1007b1c32: xor r14d, r14d
0x1007b1c35: mov r15d, 0xffffffff
0x1007b1c3b: nop dword ptr [rax + rax]
0x1007b1c40: mov r13, qword ptr [rdx + 0x28]
0x1007b1c44: add ebx, r15d
0x1007b1c47: shl rbx, 5
0x1007b1c4b: lea r8, [r13 + rbx]
0x1007b1c50: mov rax, qword ptr [rbp - 0x98]
0x1007b1c57: cmp byte ptr [rax + 0x578], 0
0x1007b1c5e: je 0x1007b1c76
0x1007b1c60: mov rax, qword ptr [r8]
0x1007b1c63: mov rax, qword ptr [rax + 0x18]
0x1007b1c67: mov ecx, dword ptr [rbp - 0x8c]
0x1007b1c6d: test dword ptr [rax + 8], ecx
0x1007b1c70: je 0x1007b1d3b
0x1007b1c76: mov rax, qword ptr [r13 + rbx + 0x18]
0x1007b1c7b: test rax, rax
0x1007b1c7e: je 0x1007b1cb0
0x1007b1c80: lea rbx, [r13 + rbx + 0x18]
0x1007b1c85: mov rcx, qword ptr [rbp - 0x98]
0x1007b1c8c: mov rdi, qword ptr [rcx + 0x10]
0x1007b1c90: mov rsi, qword ptr [rcx + 0x18]
0x1007b1c94: mov rcx, qword ptr [r8]
0x1007b1c97: mov rdx, qword ptr [rcx]
0x1007b1c9a: mov rcx, qword ptr [rcx + 8]
0x1007b1c9e: call rax
0x1007b1ca0: mov qword ptr [rbx], 0
0x1007b1ca7: jmp 0x1007b1d37 ; 0x1007b1d37
0x1007b1cac: nop dword ptr [rax]
0x1007b1cb0: mov r12, qword ptr [r13 + rbx + 8]
0x1007b1cb5: mov rax, qword ptr [r8]
0x1007b1cb8: mov rcx, qword ptr [rax]
0x1007b1cbb: mov qword ptr [rbp - 0x78], rcx
0x1007b1cbf: mov rax, qword ptr [rax + 8]
0x1007b1cc3: mov qword ptr [rbp - 0xa0], rax
0x1007b1cca: call 0x1007abbf0 ; 0x1007abbf0
0x1007b1ccf: mov qword ptr [rbp - 0x80], rax
0x1007b1cd3: mov rax, qword ptr [r13 + rbx + 8]
0x1007b1cd8: mov r13, qword ptr [r13 + rbx + 0x10]
0x1007b1cdd: mov ebx, dword ptr [rax + 0x30]
0x1007b1ce0: mov qword ptr [rbp - 0x88], 0
0x1007b1ceb: call qword ptr [r12 + 0x58]
0x1007b1cf0: mov r8, qword ptr [rax]
0x1007b1cf3: mov rdi, rax
0x1007b1cf6: lea rsi, [rbp - 0x88]
0x1007b1cfd: mov rdx, qword ptr [rbp - 0x78]
0x1007b1d01: mov rcx, qword ptr [rbp - 0xa0]
0x1007b1d08: call qword ptr [r8 + 0x40]
0x1007b1d0c: mov rdx, qword ptr [rbp - 0x88]
0x1007b1d13: test rdx, rdx
0x1007b1d16: je 0x1007b1e7f
0x1007b1d1c: mov rdi, qword ptr [r12 + 0x38]
0x1007b1d21: mov rsi, qword ptr [r12 + 0x40]
0x1007b1d26: mov dword ptr [rsp], ebx
0x1007b1d29: xor ecx, ecx
0x1007b1d2b: mov r8, qword ptr [rbp - 0x80]
0x1007b1d2f: mov r9, r13
0x1007b1d32: call qword ptr [r12 + 0x48]
0x1007b1d37: mov rdx, qword ptr [rbp - 0x70]
0x1007b1d3b: inc r14d
0x1007b1d3e: mov ebx, dword ptr [rdx + 0x30]
0x1007b1d41: dec r15d
0x1007b1d44: cmp r14d, ebx
0x1007b1d47: jb 0x1007b1c40
0x1007b1d4d: jmp 0x1007b1e58 ; 0x1007b1e58
0x1007b1d52: xor r13d, r13d
0x1007b1d55: nop word ptr cs:[rax + rax]
0x1007b1d60: mov r12, qword ptr [rdx + 0x28]
0x1007b1d64: mov r13d, r13d
0x1007b1d67: mov rbx, r13
0x1007b1d6a: shl rbx, 5
0x1007b1d6e: lea r8, [r12 + rbx]
0x1007b1d72: mov rax, qword ptr [rbp - 0x98]
0x1007b1d79: cmp byte ptr [rax + 0x578], 0
0x1007b1d80: je 0x1007b1d98
0x1007b1d82: mov rax, qword ptr [r8]
0x1007b1d85: mov rax, qword ptr [rax + 0x18]
0x1007b1d89: mov ecx, dword ptr [rbp - 0x8c]
0x1007b1d8f: test dword ptr [rax + 8], ecx
0x1007b1d92: je 0x1007b1e4b
0x1007b1d98: mov rax, qword ptr [r12 + rbx + 0x18]
0x1007b1d9d: test rax, rax
0x1007b1da0: je 0x1007b1dd0
0x1007b1da2: lea rbx, [r12 + rbx + 0x18]
0x1007b1da7: mov rcx, qword ptr [rbp - 0x98]
0x1007b1dae: mov rdi, qword ptr [rcx + 0x10]
0x1007b1db2: mov rsi, qword ptr [rcx + 0x18]
0x1007b1db6: mov rcx, qword ptr [r8]
0x1007b1db9: mov rdx, qword ptr [rcx]
0x1007b1dbc: mov rcx, qword ptr [rcx + 8]
0x1007b1dc0: call rax
0x1007b1dc2: mov qword ptr [rbx], 0
0x1007b1dc9: jmp 0x1007b1e47 ; 0x1007b1e47
0x1007b1dce: nop 
0x1007b1dd0: mov r14, qword ptr [r12 + rbx + 8]
0x1007b1dd5: mov rax, qword ptr [r8]
0x1007b1dd8: mov rcx, qword ptr [rax]
0x1007b1ddb: mov qword ptr [rbp - 0x80], rcx
0x1007b1ddf: mov rax, qword ptr [rax + 8]
0x1007b1de3: mov qword ptr [rbp - 0x78], rax
0x1007b1de7: call 0x1007abbf0 ; 0x1007abbf0
0x1007b1dec: mov r15, rax
0x1007b1def: mov rax, qword ptr [r12 + rbx + 8]
0x1007b1df4: mov r12, qword ptr [r12 + rbx + 0x10]
0x1007b1df9: mov ebx, dword ptr [rax + 0x30]
0x1007b1dfc: mov qword ptr [rbp - 0x88], 0
0x1007b1e07: call qword ptr [r14 + 0x58]
0x1007b1e0b: mov r8, qword ptr [rax]
0x1007b1e0e: mov rdi, rax
0x1007b1e11: lea rsi, [rbp - 0x88]
0x1007b1e18: mov rdx, qword ptr [rbp - 0x80]
0x1007b1e1c: mov rcx, qword ptr [rbp - 0x78]
0x1007b1e20: call qword ptr [r8 + 0x40]
0x1007b1e24: mov rdx, qword ptr [rbp - 0x88]
0x1007b1e2b: test rdx, rdx
0x1007b1e2e: je 0x1007b1e7f
0x1007b1e30: mov rdi, qword ptr [r14 + 0x38]
0x1007b1e34: mov rsi, qword ptr [r14 + 0x40]
0x1007b1e38: mov dword ptr [rsp], ebx
0x1007b1e3b: xor ecx, ecx
0x1007b1e3d: mov r8, r15
0x1007b1e40: mov r9, r12
0x1007b1e43: call qword ptr [r14 + 0x48]
0x1007b1e47: mov rdx, qword ptr [rbp - 0x70]
0x1007b1e4b: inc r13d
0x1007b1e4e: cmp r13d, dword ptr [rdx + 0x30]
0x1007b1e52: jb 0x1007b1d60
0x1007b1e58: mov rax, qword ptr [rip + 0x45ba79] ; 0x100c0d8d8
0x1007b1e5f: mov rax, qword ptr [rax]
0x1007b1e62: cmp rax, qword ptr [rbp - 0x30]
0x1007b1e66: jne 0x1007b1e7a
0x1007b1e68: add rsp, 0x88
0x1007b1e6f: pop rbx
0x1007b1e70: pop r12
0x1007b1e72: pop r13
0x1007b1e74: pop r14
0x1007b1e76: pop r15
0x1007b1e78: pop rbp
0x1007b1e79: ret 
0x1007b1e7a: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007b1e7f: lea rdi, [rip + 0x3c5ff0] ; 0x100b77e76 c
0x1007b1e86: lea rsi, [rip + 0x3f11e1] ; 0x100ba306e ../../Code/Base/Meta.h
0x1007b1e8d: mov edx, 0x443
0x1007b1e92: mov ecx, 3
0x1007b1e97: call 0x1007e5f70 ; 0x1007e5f70
0x1007b1e9c: ud2 
0x1007b1e9e: lea rdi, [rip + 0x3f14cb] ; 0x100ba3370 fs != fsEnd && strcmp( fs->name, name ) == 0
0x1007b1ea5: lea rsi, [rip + 0x3f130a] ; 0x100ba31b6 Module.cpp
0x1007b1eac: lea r8, [rip + 0x3f148a] ; 0x100ba333d No function called '%s' registered with ModuleBarn
0x1007b1eb3: mov edx, 0x107
0x1007b1eb8: mov ecx, 4
0x1007b1ebd: xor eax, eax
0x1007b1ebf: mov r9, rbx
0x1007b1ec2: call 0x1007e6030 ; 0x1007e6030
0x1007b1ec7: ud2 
0x1007b1ec9: nop dword ptr [rax]
