0x10052e1a0: push rbp
0x10052e1a1: mov rbp, rsp
0x10052e1a4: mov rcx, qword ptr [rsi]
0x10052e1a7: lea rax, [rcx + 8]
0x10052e1ab: test rcx, rcx
0x10052e1ae: cmove rax, rcx
0x10052e1b2: pop rbp
0x10052e1b3: ret 
0x10052e1b4: nop word ptr cs:[rax + rax]
