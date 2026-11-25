0x1004d1d50: push rbp
0x1004d1d51: mov rbp, rsp
0x1004d1d54: push r15
0x1004d1d56: push r14
0x1004d1d58: push rbx
0x1004d1d59: sub rsp, 0x68
0x1004d1d5d: mov r14, rsi
0x1004d1d60: mov qword ptr [rbp - 0x20], rdi
0x1004d1d64: test rdi, rdi
0x1004d1d67: je 0x1004d1e0a
0x1004d1d6d: mov edi, dword ptr [rdi]
0x1004d1d6f: call 0x1007abd30 ; 0x1007abd30
0x1004d1d74: mov rcx, qword ptr [rax]
0x1004d1d77: mov rdi, rax
0x1004d1d7a: call qword ptr [rcx + 0x68]
0x1004d1d7d: test rax, rax
0x1004d1d80: jne 0x1004d1d87
0x1004d1d82: call 0x1007abc60 ; 0x1007abc60
0x1004d1d87: movzx edx, byte ptr [rip + 0x801392] ; 0x100cd3120
0x1004d1d8e: lea rsi, [rip + 0x6a52ac] ; 0x100b77041 SetTransform
0x1004d1d95: mov rdi, rax
0x1004d1d98: call 0x1004d2330 ; 0x1004d2330
0x1004d1d9d: mov rbx, rax
0x1004d1da0: test rbx, rbx
0x1004d1da3: je 0x1004d1e0a
0x1004d1da5: mov qword ptr [rbp - 0x30], r14
0x1004d1da9: lea rdi, [rbp - 0x70]
0x1004d1dad: call 0x1007fa3b0 ; 0x1007fa3b0
0x1004d1db2: mov qword ptr [rbp - 0x28], rax
0x1004d1db6: call 0x1007abc10 ; 0x1007abc10
0x1004d1dbb: mov r15, rax
0x1004d1dbe: call 0x1007abbf0 ; 0x1007abbf0
0x1004d1dc3: mov r14, rax
0x1004d1dc6: mov qword ptr [rbp - 0x70], 0
0x1004d1dce: call qword ptr [rbx + 0x58]
0x1004d1dd1: mov r8, qword ptr [rax]
0x1004d1dd4: lea rsi, [rbp - 0x70]
0x1004d1dd8: lea rdx, [rbp - 0x20]
0x1004d1ddc: mov rdi, rax
0x1004d1ddf: mov rcx, r15
0x1004d1de2: call qword ptr [r8 + 0x40]
0x1004d1de6: mov rdx, qword ptr [rbp - 0x70]
0x1004d1dea: test rdx, rdx
0x1004d1ded: je 0x1004d1e15
0x1004d1def: mov rdi, qword ptr [rbx + 0x38]
0x1004d1df3: mov rsi, qword ptr [rbx + 0x40]
0x1004d1df7: mov dword ptr [rsp], 1
0x1004d1dfe: lea r9, [rbp - 0x30]
0x1004d1e02: xor ecx, ecx
0x1004d1e04: mov r8, r14
0x1004d1e07: call qword ptr [rbx + 0x48]
0x1004d1e0a: add rsp, 0x68
0x1004d1e0e: pop rbx
0x1004d1e0f: pop r14
0x1004d1e11: pop r15
0x1004d1e13: pop rbp
0x1004d1e14: ret 
0x1004d1e15: lea rdi, [rip + 0x6a605a] ; 0x100b77e76 c
0x1004d1e1c: lea rsi, [rip + 0x68b7b5] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d1e23: mov edx, 0x443
0x1004d1e28: mov ecx, 3
0x1004d1e2d: call 0x1007e5f70 ; 0x1007e5f70
0x1004d1e32: ud2 
0x1004d1e34: nop word ptr cs:[rax + rax]
