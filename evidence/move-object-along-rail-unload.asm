0x1004845f0: push rbp
0x1004845f1: mov rbp, rsp
0x1004845f4: push r14
0x1004845f6: push rbx
0x1004845f7: mov r14, rdx
0x1004845fa: mov rbx, rdi
0x1004845fd: mov rsi, qword ptr [rbx + 0xb0]
0x100484604: mov rdi, r14
0x100484607: call 0x100795a70 ; 0x100795a70
0x10048460c: mov qword ptr [rbx + 0xb0], 0
0x100484617: mov rsi, qword ptr [rbx + 0xc0]
0x10048461e: mov rdi, r14
0x100484621: call 0x100795a70 ; 0x100795a70
0x100484626: mov qword ptr [rbx + 0xc0], 0
0x100484631: pop rbx
0x100484632: pop r14
0x100484634: pop rbp
0x100484635: ret 
0x100484636: nop word ptr cs:[rax + rax]
