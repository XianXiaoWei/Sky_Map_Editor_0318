0x1007b02c0: push rbp
0x1007b02c1: mov rbp, rsp
0x1007b02c4: mov rax, qword ptr [rdi]
0x1007b02c7: mov rax, qword ptr [rax]
0x1007b02ca: mov rcx, qword ptr [rsi]
0x1007b02cd: cmp rax, qword ptr [rcx]
0x1007b02d0: setb al
0x1007b02d3: pop rbp
0x1007b02d4: ret 
0x1007b02d5: nop word ptr cs:[rax + rax]
