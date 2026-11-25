0x1001b2d10: push rbp
0x1001b2d11: mov rbp, rsp
0x1001b2d14: mov rcx, qword ptr [rsi]
0x1001b2d17: lea rax, [rcx + 8]
0x1001b2d1b: test rcx, rcx
0x1001b2d1e: cmove rax, rcx
0x1001b2d22: pop rbp
0x1001b2d23: ret 
0x1001b2d24: nop word ptr cs:[rax + rax]
