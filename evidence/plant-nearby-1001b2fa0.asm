0x1001b2fa0: push rbp
0x1001b2fa1: mov rbp, rsp
0x1001b2fa4: mov rcx, qword ptr [rsi]
0x1001b2fa7: lea rax, [rcx + 8]
0x1001b2fab: test rcx, rcx
0x1001b2fae: cmove rax, rcx
0x1001b2fb2: pop rbp
0x1001b2fb3: ret 
0x1001b2fb4: nop word ptr cs:[rax + rax]
