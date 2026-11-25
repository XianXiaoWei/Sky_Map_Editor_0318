0x10055ba10: push rbp
0x10055ba11: mov rbp, rsp
0x10055ba14: push r15
0x10055ba16: push r14
0x10055ba18: push r13
0x10055ba1a: push r12
0x10055ba1c: push rbx
0x10055ba1d: sub rsp, 0x18
0x10055ba21: mov rbx, rdx
0x10055ba24: mov r13d, esi
0x10055ba27: cmp dword ptr [rdi + 0x28], 0
0x10055ba2b: je 0x10055bb20
0x10055ba31: xor r12d, r12d
0x10055ba34: mov qword ptr [rbp - 0x30], rdi
0x10055ba38: nop dword ptr [rax + rax]
0x10055ba40: mov r14d, r12d
0x10055ba43: mov r15, r14
0x10055ba46: shl r15, 4
0x10055ba4a: add r15, qword ptr [rdi + 0x90]
0x10055ba51: lea rax, [rbp - 0x40]
0x10055ba55: mov rdi, rax
0x10055ba58: call 0x1007fa330 ; 0x1007fa330
0x10055ba5d: mov edi, r13d
0x10055ba60: mov rsi, r15
0x10055ba63: mov rdx, rax
0x10055ba66: mov rcx, rbx
0x10055ba69: call 0x1007f3c50 ; 0x1007f3c50
0x10055ba6e: mov r15d, eax
0x10055ba71: shl r14, 2
0x10055ba75: mov r13, rbx
0x10055ba78: mov rax, qword ptr [rbp - 0x30]
0x10055ba7c: mov rbx, qword ptr [rax + 0xa0]
0x10055ba83: add rbx, r14
0x10055ba86: mov dword ptr [rbp - 0x40], 0
0x10055ba8d: lea rax, [rbp - 0x40]
0x10055ba91: mov rdi, rax
0x10055ba94: call 0x1007abb50 ; 0x1007abb50
0x10055ba99: mov edi, r15d
0x10055ba9c: mov rsi, rbx
0x10055ba9f: mov rdx, rax
0x10055baa2: mov rcx, r13
0x10055baa5: call 0x1007f3c50 ; 0x1007f3c50
0x10055baaa: mov r15d, eax
0x10055baad: mov rax, qword ptr [rbp - 0x30]
0x10055bab1: mov rbx, qword ptr [rax + 0xa8]
0x10055bab8: add rbx, r14
0x10055babb: mov dword ptr [rbp - 0x40], 0
0x10055bac2: lea rdi, [rbp - 0x40]
0x10055bac6: call 0x1007abb50 ; 0x1007abb50
0x10055bacb: mov edi, r15d
0x10055bace: mov rsi, rbx
0x10055bad1: mov rdx, rax
0x10055bad4: mov rcx, r13
0x10055bad7: call 0x1007f3c50 ; 0x1007f3c50
0x10055badc: mov ebx, eax
0x10055bade: mov rax, qword ptr [rbp - 0x30]
0x10055bae2: add r14, qword ptr [rax + 0xb8]
0x10055bae9: mov dword ptr [rbp - 0x40], 0
0x10055baf0: lea rdi, [rbp - 0x40]
0x10055baf4: call 0x1007abb50 ; 0x1007abb50
0x10055baf9: mov edi, ebx
0x10055bafb: mov rbx, r13
0x10055bafe: mov rsi, r14
0x10055bb01: mov rdx, rax
0x10055bb04: mov rcx, rbx
0x10055bb07: call 0x1007f3c50 ; 0x1007f3c50
0x10055bb0c: mov rdi, qword ptr [rbp - 0x30]
0x10055bb10: mov r13d, eax
0x10055bb13: inc r12d
0x10055bb16: cmp r12d, dword ptr [rdi + 0x28]
0x10055bb1a: jb 0x10055ba40
0x10055bb20: mov eax, r13d
0x10055bb23: add rsp, 0x18
0x10055bb27: pop rbx
0x10055bb28: pop r12
0x10055bb2a: pop r13
0x10055bb2c: pop r14
0x10055bb2e: pop r15
0x10055bb30: pop rbp
0x10055bb31: ret 
0x10055bb32: nop word ptr cs:[rax + rax]
