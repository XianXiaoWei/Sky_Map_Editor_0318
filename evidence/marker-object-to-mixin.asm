0x10043e220: push rbp
0x10043e221: mov rbp, rsp
0x10043e224: mov rcx, qword ptr [rsi]
0x10043e227: lea rax, [rcx - 8]
0x10043e22b: test rcx, rcx
0x10043e22e: cmove rax, rcx
0x10043e232: pop rbp
0x10043e233: ret 
0x10043e234: nop word ptr cs:[rax + rax]
