0x100591cf0: push rbp
0x100591cf1: mov rbp, rsp
0x100591cf4: mov rcx, qword ptr [rsi]
0x100591cf7: lea rax, [rcx - 8]
0x100591cfb: test rcx, rcx
0x100591cfe: cmove rax, rcx
0x100591d02: pop rbp
0x100591d03: ret 
0x100591d04: nop word ptr cs:[rax + rax]
