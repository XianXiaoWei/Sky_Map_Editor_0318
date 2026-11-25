0x100591cd0: push rbp
0x100591cd1: mov rbp, rsp
0x100591cd4: mov rcx, qword ptr [rsi]
0x100591cd7: lea rax, [rcx + 8]
0x100591cdb: test rcx, rcx
0x100591cde: cmove rax, rcx
0x100591ce2: pop rbp
0x100591ce3: ret 
0x100591ce4: nop word ptr cs:[rax + rax]
