0x1001b2fc0: push rbp
0x1001b2fc1: mov rbp, rsp
0x1001b2fc4: mov rcx, qword ptr [rsi]
0x1001b2fc7: lea rax, [rcx - 8]
0x1001b2fcb: test rcx, rcx
0x1001b2fce: cmove rax, rcx
0x1001b2fd2: pop rbp
0x1001b2fd3: ret 
0x1001b2fd4: nop word ptr cs:[rax + rax]
