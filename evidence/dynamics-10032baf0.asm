0x10032baf0: push rbp
0x10032baf1: mov rbp, rsp
0x10032baf4: push r15
0x10032baf6: push r14
0x10032baf8: push r13
0x10032bafa: push r12
0x10032bafc: push rbx
0x10032bafd: sub rsp, 0x18
0x10032bb01: mov r15, r8
0x10032bb04: mov rbx, rdx
0x10032bb07: mov r12, rdi
0x10032bb0a: cmp dword ptr [rbp + 0x10], 1
0x10032bb0e: jne 0x10032bb82
0x10032bb10: add rbx, rsi
0x10032bb13: test r12b, 1
0x10032bb17: mov qword ptr [rbp - 0x38], rcx
0x10032bb1b: je 0x10032bb25
0x10032bb1d: mov rax, qword ptr [rbx]
0x10032bb20: mov r12, qword ptr [rax + r12 - 1]
0x10032bb25: mov r13, qword ptr [r9]
0x10032bb28: mov r14, qword ptr [r9 + 8]
0x10032bb2c: mov qword ptr [rbp - 0x30], 0
0x10032bb34: call 0x1007abc30 ; 0x1007abc30
0x10032bb39: mov r8, qword ptr [rax]
0x10032bb3c: lea rsi, [rbp - 0x30]
0x10032bb40: mov rdi, rax
0x10032bb43: mov rdx, r13
0x10032bb46: mov rcx, r14
0x10032bb49: call qword ptr [r8 + 0x40]
0x10032bb4d: mov rsi, qword ptr [rbp - 0x30]
0x10032bb51: mov rdi, rbx
0x10032bb54: call r12
0x10032bb57: mov qword ptr [rbp - 0x30], rax
0x10032bb5b: mov rax, qword ptr [r15]
0x10032bb5e: mov rcx, qword ptr [rip + 0x1ac791b] ; 0x101df3480
0x10032bb65: lea rdx, [rbp - 0x30]
0x10032bb69: mov rdi, r15
0x10032bb6c: mov rsi, qword ptr [rbp - 0x38]
0x10032bb70: call qword ptr [rax + 0x40]
0x10032bb73: add rsp, 0x18
0x10032bb77: pop rbx
0x10032bb78: pop r12
0x10032bb7a: pop r13
0x10032bb7c: pop r14
0x10032bb7e: pop r15
0x10032bb80: pop rbp
0x10032bb81: ret 
0x10032bb82: lea rdi, [rip + 0x831a77] ; 0x100b5d600 1 == argCount
0x10032bb89: lea rsi, [rip + 0x831a48] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10032bb90: mov edx, 0x23d
0x10032bb95: mov ecx, 3
0x10032bb9a: call 0x1007e5f70 ; 0x1007e5f70
0x10032bb9f: ud2 
0x10032bba1: nop word ptr cs:[rax + rax]
