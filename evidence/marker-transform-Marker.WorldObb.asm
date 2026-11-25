0x10043e4b0: push rbp
0x10043e4b1: mov rbp, rsp
0x10043e4b4: push r15
0x10043e4b6: push r14
0x10043e4b8: push r12
0x10043e4ba: push rbx
0x10043e4bb: sub rsp, 0x80
0x10043e4c2: mov rbx, rsi
0x10043e4c5: mov r14, rdi
0x10043e4c8: mov rax, qword ptr [rbx]
0x10043e4cb: lea r15, [rbp - 0xa0]
0x10043e4d2: mov rdi, r15
0x10043e4d5: call qword ptr [rax + 0x18]
0x10043e4d8: mov rax, qword ptr [rbx]
0x10043e4db: lea r12, [rbp - 0x60]
0x10043e4df: mov rdi, r12
0x10043e4e2: mov rsi, rbx
0x10043e4e5: call qword ptr [rax + 0x20]
0x10043e4e8: mov rdi, r14
0x10043e4eb: mov rsi, r15
0x10043e4ee: mov rdx, r12
0x10043e4f1: call 0x100076df0 ; 0x100076df0
0x10043e4f6: mov rax, r14
0x10043e4f9: add rsp, 0x80
0x10043e500: pop rbx
0x10043e501: pop r12
0x10043e503: pop r14
0x10043e505: pop r15
0x10043e507: pop rbp
0x10043e508: ret 
0x10043e509: nop dword ptr [rax]
