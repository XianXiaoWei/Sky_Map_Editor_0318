0x1001b2d30: push rbp
0x1001b2d31: mov rbp, rsp
0x1001b2d34: mov rcx, qword ptr [rsi]
0x1001b2d37: lea rax, [rcx - 8]
0x1001b2d3b: test rcx, rcx
0x1001b2d3e: cmove rax, rcx
0x1001b2d42: pop rbp
0x1001b2d43: ret 
0x1001b2d44: nop word ptr cs:[rax + rax]
