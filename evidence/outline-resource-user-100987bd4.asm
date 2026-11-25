0x100987bd4: push rbp
0x100987bd5: mov rbp, rsp
0x100987bd8: push r15
0x100987bda: push r14
0x100987bdc: push rbx
0x100987bdd: push rax
0x100987bde: mov r14, rsi
0x100987be1: mov r15, rdi
0x100987be4: mov rbx, qword ptr [r15 + 0x10]
0x100987be8: test rbx, rbx
0x100987beb: je 0x100987c15
0x100987bed: add rbx, 0x130
0x100987bf4: lea rsi, [rbp - 0x20]
0x100987bf8: mov qword ptr [rsi], r14
0x100987bfb: mov rdi, rbx
0x100987bfe: call 0x100987c36 ; 0x100987c36
0x100987c03: test eax, eax
0x100987c05: js 0x100987c15
0x100987c07: mov rcx, qword ptr [rbx]
0x100987c0a: cdqe 
0x100987c0c: mov rax, qword ptr [rcx + rax*8]
0x100987c10: test rax, rax
0x100987c13: jne 0x100987c2a
0x100987c15: mov rdi, qword ptr [r15 + 8]
0x100987c19: mov rax, qword ptr [rdi]
0x100987c1c: mov edx, 1
0x100987c21: mov rsi, r14
0x100987c24: call qword ptr [rax + 0x168]
0x100987c2a: add rsp, 8
0x100987c2e: pop rbx
0x100987c2f: pop r14
0x100987c31: pop r15
0x100987c33: pop rbp
0x100987c34: ret 
0x100987c35: nop 
