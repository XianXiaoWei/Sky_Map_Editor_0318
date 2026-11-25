0x100719e80: push rbp
0x100719e81: mov rbp, rsp
0x100719e84: mov rcx, qword ptr [rsi]
0x100719e87: lea rax, [rcx + 8]
0x100719e8b: test rcx, rcx
0x100719e8e: cmove rax, rcx
0x100719e92: pop rbp
0x100719e93: ret 
0x100719e94: nop word ptr cs:[rax + rax]
