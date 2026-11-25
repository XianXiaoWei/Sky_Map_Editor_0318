0x10009f380: push rbp
0x10009f381: mov rbp, rsp
0x10009f384: push r15
0x10009f386: push r14
0x10009f388: push r13
0x10009f38a: push r12
0x10009f38c: push rbx
0x10009f38d: sub rsp, 0x28
0x10009f391: mov r15, r8
0x10009f394: mov r14, rcx
0x10009f397: mov rbx, rdx
0x10009f39a: mov rcx, qword ptr [r15]
0x10009f39d: mov rax, qword ptr [r15 + 8]
0x10009f3a1: mov r8d, dword ptr [rax + 0x5810]
0x10009f3a8: mov qword ptr [rbp - 0x40], rdi
0x10009f3ac: mov qword ptr [rbp - 0x38], rsi
0x10009f3b0: call 0x10009f220 ; 0x10009f220
0x10009f3b5: mov r13d, eax
0x10009f3b8: mov qword ptr [rbp - 0x48], r14
0x10009f3bc: movzx ecx, word ptr [r14]
0x10009f3c0: mov qword ptr [rbp - 0x30], rbx
0x10009f3c4: movzx r12d, word ptr [rbx]
0x10009f3c8: mov r14, qword ptr [r15]
0x10009f3cb: mov rax, qword ptr [r15 + 8]
0x10009f3cf: mov rbx, rcx
0x10009f3d2: mov r15d, dword ptr [rax + 0x5810]
0x10009f3d9: imul rdi, rbx, 0x44
0x10009f3dd: add rdi, r14
0x10009f3e0: add rdi, r15
0x10009f3e3: imul rsi, r12, 0x44
0x10009f3e7: add rsi, r14
0x10009f3ea: add rsi, r15
0x10009f3ed: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f3f2: test eax, eax
0x10009f3f4: jns 0x10009f48a
0x10009f3fa: mov rax, qword ptr [rbp - 0x30]
0x10009f3fe: mov word ptr [rax], bx
0x10009f401: mov rcx, qword ptr [rbp - 0x48]
0x10009f405: mov word ptr [rcx], r12w
0x10009f409: movzx ebx, word ptr [rax]
0x10009f40c: mov rax, qword ptr [rbp - 0x38]
0x10009f410: movzx r12d, word ptr [rax]
0x10009f414: imul rdi, rbx, 0x44
0x10009f418: add rdi, r14
0x10009f41b: add rdi, r15
0x10009f41e: imul rsi, r12, 0x44
0x10009f422: add rsi, r14
0x10009f425: add rsi, r15
0x10009f428: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f42d: test eax, eax
0x10009f42f: jns 0x10009f481
0x10009f431: mov rax, qword ptr [rbp - 0x38]
0x10009f435: mov word ptr [rax], bx
0x10009f438: mov rcx, qword ptr [rbp - 0x30]
0x10009f43c: mov word ptr [rcx], r12w
0x10009f440: movzx eax, word ptr [rax]
0x10009f443: mov rbx, qword ptr [rbp - 0x40]
0x10009f447: movzx r12d, word ptr [rbx]
0x10009f44b: mov qword ptr [rbp - 0x30], rax
0x10009f44f: imul rdi, rax, 0x44
0x10009f453: add rdi, r14
0x10009f456: add rdi, r15
0x10009f459: imul rsi, r12, 0x44
0x10009f45d: add rsi, r14
0x10009f460: add rsi, r15
0x10009f463: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f468: test eax, eax
0x10009f46a: jns 0x10009f486
0x10009f46c: mov rax, qword ptr [rbp - 0x30]
0x10009f470: mov word ptr [rbx], ax
0x10009f473: mov rax, qword ptr [rbp - 0x38]
0x10009f477: mov word ptr [rax], r12w
0x10009f47b: add r13d, 3
0x10009f47f: jmp 0x10009f48a ; 0x10009f48a
0x10009f481: inc r13d
0x10009f484: jmp 0x10009f48a ; 0x10009f48a
0x10009f486: add r13d, 2
0x10009f48a: mov eax, r13d
0x10009f48d: add rsp, 0x28
0x10009f491: pop rbx
0x10009f492: pop r12
0x10009f494: pop r13
0x10009f496: pop r14
0x10009f498: pop r15
0x10009f49a: pop rbp
0x10009f49b: ret 
0x10009f49c: nop dword ptr [rax]
